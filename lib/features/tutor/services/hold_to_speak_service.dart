import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/i18n/native_language.dart';
import '../../../core/i18n/speech_locale.dart';
import 'openai_chat_service.dart';

/// Basılı tut → bırak.
/// [multilingual] true: Whisper (TR/EN otomatik) — tutor/demo sohbet.
/// [multilingual] false: cihaz STT (varsayılan en) — quiz pratiği.
class HoldToSpeakService {
  HoldToSpeakService({
    AudioRecorder? recorder,
    OpenAiChatService? whisper,
    this.multilingual = false,
    this.deviceSttLocaleCode = 'en',
    this._nativeLanguageCode,
  })  : _recorder = recorder ?? AudioRecorder(),
        _whisper = whisper ?? OpenAiChatService();

  final AudioRecorder _recorder;
  final OpenAiChatService _whisper;
  final SpeechToText _speech = SpeechToText();

  /// Tutor / onboarding sohbet — cihaz STT tek dile kilitlenmesin.
  final bool multilingual;
  final String deviceSttLocaleCode;
  String? _nativeLanguageCode;

  var _speechReady = false;
  var _speechInitStarted = false;
  var _usingDeviceStt = false;
  String _heardWords = '';
  String? _recordingPath;
  DateTime? _recordStartedAt;
  String _localeId = 'en_US';
  Future<void>? _startFuture;

  /// Whisper için minimum kayıt süresi.
  static const _minWhisperRecord = Duration(milliseconds: 400);

  static const _whisperRecordConfig = RecordConfig(
    encoder: AudioEncoder.wav,
    sampleRate: 16000,
    numChannels: 1,
    bitRate: 256000,
  );

  static const _deviceRecordConfig = RecordConfig(
    encoder: AudioEncoder.aacLc,
    sampleRate: 16000,
    numChannels: 1,
    bitRate: 64000,
  );

  RecordConfig get _activeRecordConfig =>
      multilingual ? _whisperRecordConfig : _deviceRecordConfig;

  String get _recordingExtension => multilingual ? 'wav' : 'm4a';

  bool get deviceSttAvailable => _speechReady && !multilingual;

  Future<void> warmUp({String? nativeLanguageCode}) async {
    if (nativeLanguageCode != null && nativeLanguageCode.trim().isNotEmpty) {
      _nativeLanguageCode = nativeLanguageCode.trim();
    }
    if (multilingual) {
      // İzin önceden alınsın — onboarding'de "Hi" gibi kısa söylemler gecikmesin.
      try {
        await _recorder.hasPermission();
      } catch (_) {}
      return;
    }
    if (_speechInitStarted) {
      await _refreshSpeechLocale(
        localeCode: nativeLanguageCode ?? deviceSttLocaleCode,
      );
      return;
    }
    _speechInitStarted = true;
    try {
      _speechReady = await _speech.initialize(
        onError: (_) {},
        onStatus: (_) {},
      );
      if (_speechReady) {
        await _refreshSpeechLocale(
          localeCode: nativeLanguageCode ?? deviceSttLocaleCode,
        );
      }
    } catch (_) {
      _speechReady = false;
    }
  }

  void updateNativeLanguage(String? code) {
    if (code == null || code.trim().isEmpty) return;
    _nativeLanguageCode = code.trim();
    if (multilingual) return;
    unawaited(_refreshSpeechLocale(localeCode: _nativeLanguageCode!));
  }

  Future<void> _refreshSpeechLocale({required String localeCode}) async {
    try {
      final locales = await _speech.locales();
      _localeId = SpeechLocaleResolver.resolve(
        nativeCode: localeCode,
        availableLocales: locales,
      );
    } catch (_) {
      _localeId = SpeechLocaleResolver.resolve(nativeCode: localeCode);
    }
  }

  Future<void> start() async {
    _startFuture = _startImpl();
    await _startFuture;
  }

  Future<void> _startImpl() async {
    _heardWords = '';
    _usingDeviceStt = false;
    _recordingPath = null;
    _recordStartedAt = null;

    if (!multilingual && _speechReady) {
      await _refreshSpeechLocale(localeCode: deviceSttLocaleCode);
      try {
        await _speech.listen(
          onResult: (result) {
            _heardWords = result.recognizedWords;
          },
          listenOptions: SpeechListenOptions(
            listenMode: ListenMode.dictation,
            partialResults: true,
            cancelOnError: false,
            localeId: _localeId,
            listenFor: const Duration(minutes: 2),
            pauseFor: const Duration(seconds: 4),
          ),
        );
        _usingDeviceStt = true;
        return;
      } catch (_) {
        _usingDeviceStt = false;
        if (_speech.isListening) {
          await _speech.stop();
        }
      }
    }

    await _startFileRecording();
  }

  Future<void> _startFileRecording() async {
    final ok = await _recorder.hasPermission();
    if (!ok) {
      throw StateError('Mikrofon izni gerekli');
    }

    // Önceki oturum açık kaldıysa kapat — bozuk m4a/wav gönderilmesin.
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}

    final dir = await getTemporaryDirectory();
    final ext = _recordingExtension;
    _recordingPath =
        '${dir.path}/lingola_mic_${DateTime.now().millisecondsSinceEpoch}.$ext';
    await _recorder.start(_activeRecordConfig, path: _recordingPath!);
    _recordStartedAt = DateTime.now();
  }

  Future<void> _ensureMinRecordDuration() async {
    final started = _recordStartedAt;
    if (started == null) return;
    final min =
        multilingual ? _minWhisperRecord : const Duration(milliseconds: 400);
    final elapsed = DateTime.now().difference(started);
    if (elapsed < min) {
      await Future<void>.delayed(min - elapsed);
    }
  }

  Future<String> stopAndGetText() async {
    try {
      await (_startFuture ?? Future<void>.value());
    } catch (_) {
      return '';
    }

    if (_usingDeviceStt) {
      if (_speech.isListening) {
        await _speech.stop();
      }
      await Future<void>.delayed(const Duration(milliseconds: 80));
      final deviceText = _heardWords.trim();
      if (deviceText.isNotEmpty) {
        return deviceText;
      }
      return '';
    }

    return _transcribeRecording();
  }

  Future<String> _transcribeRecording() async {
    if (_recordStartedAt == null && _recordingPath == null) {
      return '';
    }

    await _ensureMinRecordDuration();

    String? filePath;
    try {
      // isRecording false dönse bile stop çağır — iOS bazen dosyayı ancak o zaman kapatır.
      final path = await _recorder
          .stop()
          .timeout(const Duration(seconds: 4), onTimeout: () => _recordingPath);
      filePath = path ?? _recordingPath;
    } catch (_) {
      filePath = _recordingPath;
    }
    _recordingPath = null;
    _recordStartedAt = null;

    if (filePath == null || !File(filePath).existsSync()) {
      return '';
    }

    final file = File(filePath);
    try {
      final stable = await _waitForStableAudioFile(file);
      if (!stable) return '';

      final text = (await _whisper
              .transcribe(
                file,
                nativeLanguageCode: _nativeLanguageCode ??
                    NativeLanguageResolver.resolve(),
              )
              .timeout(
            const Duration(seconds: 30),
          ))
          .trim();
      return text;
    } finally {
      try {
        await file.delete();
      } catch (_) {}
    }
  }

  Future<bool> _waitForStableAudioFile(File file) async {
    const minBytes = 800;
    int? lastLen;
    for (var i = 0; i < 24; i++) {
      if (!file.existsSync()) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        continue;
      }
      final len = await file.length();
      if (len >= minBytes && len == lastLen) return true;
      lastLen = len;
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }
    final len = await file.length();
    return len >= minBytes;
  }

  Future<void> cancel() async {
    _startFuture = null;
    if (_speech.isListening) {
      await _speech.stop();
    }
    _usingDeviceStt = false;
    _heardWords = '';

    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}

    final path = _recordingPath;
    _recordingPath = null;
    _recordStartedAt = null;
    if (path != null) {
      try {
        await File(path).delete();
      } catch (_) {}
    }
  }

  Future<void> dispose() async {
    await cancel();
    await _recorder.dispose();
    _whisper.dispose();
  }
}
