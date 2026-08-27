import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'openai_chat_service.dart';

/// Basılı tut → bırak: önce cihaz STT (anında), yoksa Whisper.
class HoldToSpeakService {
  HoldToSpeakService({
    AudioRecorder? recorder,
    OpenAiChatService? whisper,
  })  : _recorder = recorder ?? AudioRecorder(),
        _whisper = whisper ?? OpenAiChatService();

  final AudioRecorder _recorder;
  final OpenAiChatService _whisper;
  final SpeechToText _speech = SpeechToText();

  var _speechReady = false;
  var _speechInitStarted = false;
  var _usingDeviceStt = false;
  String _heardWords = '';
  String? _recordingPath;
  DateTime? _recordStartedAt;

  static const _recordConfig = RecordConfig(
    encoder: AudioEncoder.aacLc,
    sampleRate: 16000,
    numChannels: 1,
    bitRate: 64000,
  );

  bool get deviceSttAvailable => _speechReady;

  Future<void> warmUp() async {
    if (_speechInitStarted) return;
    _speechInitStarted = true;
    try {
      _speechReady = await _speech.initialize(
        onError: (_) {},
        onStatus: (_) {},
      );
    } catch (_) {
      _speechReady = false;
    }
  }

  Future<void> start() async {
    _heardWords = '';
    _usingDeviceStt = false;
    _recordingPath = null;
    _recordStartedAt = null;

    // Önce cihaz STT (anında metin). Başlamazsa dosya + Whisper.
    if (_speechReady) {
      try {
        await _speech.listen(
          onResult: (result) {
            _heardWords = result.recognizedWords;
          },
          listenOptions: SpeechListenOptions(
            listenMode: ListenMode.dictation,
            partialResults: true,
            cancelOnError: false,
            localeId: 'en_US',
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

    final dir = await getTemporaryDirectory();
    _recordingPath =
        '${dir.path}/lingola_mic_${DateTime.now().millisecondsSinceEpoch}.m4a';
    await _recorder.start(_recordConfig, path: _recordingPath!);
    _recordStartedAt = DateTime.now();
  }

  Future<String> stopAndGetText() async {
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
    final started = _recordStartedAt;
    if (started != null) {
      final elapsed = DateTime.now().difference(started);
      if (elapsed < const Duration(milliseconds: 400)) {
        await Future<void>.delayed(
          const Duration(milliseconds: 400) - elapsed,
        );
      }
    }

    final path = await _recorder
        .stop()
        .timeout(const Duration(seconds: 4), onTimeout: () => _recordingPath);
    final filePath = path ?? _recordingPath;
    _recordingPath = null;
    _recordStartedAt = null;

    if (filePath == null || !File(filePath).existsSync()) {
      throw StateError('Kayıt alınamadı — basılı tutup konuş');
    }

    final file = File(filePath);
    try {
      if (await file.length() < 200) {
        throw StateError('Ses çok kısa — basılı tut (1–2 sn)');
      }

      final text = (await _whisper.transcribe(file).timeout(
            const Duration(seconds: 30),
          ))
          .trim();
      if (text.isEmpty) {
        throw StateError('Ses anlaşılamadı — daha net konuş');
      }
      return text;
    } finally {
      try {
        await file.delete();
      } catch (_) {}
    }
  }

  Future<void> cancel() async {
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
