import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'openai_chat_service.dart';
import 'tutor_tts_service.dart';

enum CallMessageRole { tutor, user }

class CallMessage {
  const CallMessage({
    required this.role,
    required this.text,
    this.translation,
  });

  final CallMessageRole role;
  final String text;
  final String? translation;
}

/// Start Talk → kayıt (record) + OpenAI Whisper + Chat + ElevenLabs.
/// Mindcoach gibi Apple Speech kullanmaz → simülatörde de çalışır.
class CallingConversationController extends ChangeNotifier {
  CallingConversationController({
    OpenAiChatService? chat,
    TutorTtsService? tts,
    AudioRecorder? recorder,
    AudioPlayer? player,
    this.voiceId,
  })  : _chat = chat ?? OpenAiChatService(),
        _tts = tts ?? TutorTtsService(),
        _recorder = recorder ?? AudioRecorder(),
        _player = player ?? AudioPlayer() {
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      _speaking = false;
      notifyListeners();
    });
  }

  final OpenAiChatService _chat;
  final TutorTtsService _tts;
  final AudioRecorder _recorder;
  final AudioPlayer _player;
  final String? voiceId;
  StreamSubscription<void>? _playerCompleteSub;

  final List<CallMessage> messages = [];
  final List<ChatTurn> _history = [];
  final Map<String, String> _translationCache = {};

  var _busy = false;
  var _listening = false;
  var _speaking = false;
  String? _error;
  String? _recordingPath;

  bool get busy => _busy;
  bool get listening => _listening;
  bool get speaking => _speaking;
  String? get error => _error;

  Future<void> start() async {
    await _preparePlaybackSession();
    notifyListeners();
    await _tutorSay(
      "Hi! I'm your tutor. Let's practice English greetings. "
      'How are you today?',
    );
  }

  Future<void> _preparePlaybackSession() async {
    try {
      await _player.setReleaseMode(ReleaseMode.stop);
      await _player.setAudioContext(
        AudioContext(
          iOS: AudioContextIOS(
            category: AVAudioSessionCategory.playAndRecord,
            options: {
              AVAudioSessionOptions.defaultToSpeaker,
              AVAudioSessionOptions.allowBluetooth,
              AVAudioSessionOptions.mixWithOthers,
            },
          ),
          android: AudioContextAndroid(
            isSpeakerphoneOn: true,
            stayAwake: false,
            contentType: AndroidContentType.speech,
            usageType: AndroidUsageType.voiceCommunication,
            audioFocus: AndroidAudioFocus.gainTransientMayDuck,
          ),
        ),
      );
    } catch (_) {}
  }

  DateTime? _recordStartedAt;

  /// Basılı tutunca kayıt; bırakınca Whisper.
  Future<void> startListening() async {
    if (_busy || _listening) return;

    await _player.stop();
    _speaking = false;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 150));

    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      _error = 'Mikrofon izni gerekli. Ayarlardan izin ver.';
      notifyListeners();
      return;
    }

    try {
      final dir = await getTemporaryDirectory();
      _recordingPath =
          '${dir.path}/lingola_mic_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          sampleRate: 44100,
          numChannels: 1,
          bitRate: 128000,
        ),
        path: _recordingPath!,
      );

      _recordStartedAt = DateTime.now();
      _error = null;
      _listening = true;
      notifyListeners();
    } catch (e) {
      _listening = false;
      _recordStartedAt = null;
      _error = 'Kayıt başlatılamadı: $e';
      notifyListeners();
    }
  }

  Future<void> stopListening() async {
    if (!_listening || _busy) return;
    await _stopAndTranscribe();
  }

  /// Eski toggle API — UI hold kullanır.
  Future<void> toggleMic() async {
    if (_listening) {
      await stopListening();
    } else {
      await startListening();
    }
  }

  Future<void> _stopAndTranscribe() async {
    _listening = false;
    _busy = true;
    notifyListeners();

    try {
      // Çok kısa basışta encoder’ın dosyayı yazması için min. süre.
      final started = _recordStartedAt;
      if (started != null) {
        final elapsed = DateTime.now().difference(started);
        if (elapsed < const Duration(milliseconds: 600)) {
          await Future<void>.delayed(
            const Duration(milliseconds: 600) - elapsed,
          );
        }
      }

      final path = await _recorder.stop();
      final filePath = path ?? _recordingPath;
      if (filePath == null || !File(filePath).existsSync()) {
        _error = 'Kayıt alınamadı — mikrofona basılı tutup konuş.';
        return;
      }

      final file = File(filePath);
      final bytes = await file.length();
      debugPrint('Mic kayıt boyutu: $bytes byte, path=$filePath');

      // Eşik düşük; asıl karar Whisper’da. Boş/çok küçük dosyayı at.
      if (bytes < 200) {
        _error = 'Ses alınamadı — basılı tut (1–2 sn) ve konuş.';
        return;
      }

      final text = (await _chat.transcribe(file)).trim();
      try {
        await file.delete();
      } catch (_) {}

      if (text.isEmpty) {
        _error = 'Ses anlaşılamadı — daha net / yakından konuş.';
        return;
      }

      _error = null;
      await _onUserSpeech(text);
    } catch (e) {
      _error = e.toString();
    } finally {
      _recordingPath = null;
      _recordStartedAt = null;
      _busy = false;
      _listening = false;
      notifyListeners();
    }
  }

  Future<void> _onUserSpeech(String text) async {
    messages.add(CallMessage(role: CallMessageRole.user, text: text));
    notifyListeners();

    try {
      final reply = await _chat.complete(
        history: _history,
        userMessage: text,
      );
      _history.add(ChatTurn(role: 'user', content: text));
      _history.add(ChatTurn(role: 'assistant', content: reply));
      while (_history.length > 16) {
        _history.removeAt(0);
      }
      await _tutorSay(reply, alreadyInHistory: true);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> _tutorSay(String text, {bool alreadyInHistory = false}) async {
    messages.add(CallMessage(role: CallMessageRole.tutor, text: text));
    if (!alreadyInHistory) {
      _history.add(ChatTurn(role: 'assistant', content: text));
    }
    notifyListeners();

    try {
      final file = await _tts.synthesizeToFile(text, voiceId: voiceId);
      await _player.stop();
      _speaking = true;
      notifyListeners();
      await _player.play(DeviceFileSource(file.path));
    } catch (e) {
      _speaking = false;
      _error = e.toString();
      notifyListeners();
    }
  }

  /// Kelime veya kısa ifade → Türkçe (önbellekli).
  Future<String> translateText(String text) async {
    final key = text.trim().toLowerCase();
    if (key.isEmpty) return '';
    final cached = _translationCache[key];
    if (cached != null) return cached;

    final result = await _chat.translateToTurkish(text);
    if (result.isNotEmpty) {
      _translationCache[key] = result;
    }
    return result;
  }

  /// Tutor balonunda cümle çevirisini aç/kapat.
  Future<void> toggleSentenceTranslation(int messageIndex) async {
    if (messageIndex < 0 || messageIndex >= messages.length) return;
    final msg = messages[messageIndex];
    if (msg.role != CallMessageRole.tutor) return;

    if (msg.translation != null) {
      messages[messageIndex] = CallMessage(role: msg.role, text: msg.text);
      notifyListeners();
      return;
    }

    try {
      final tr = await translateText(msg.text);
      if (tr.isEmpty) return;
      messages[messageIndex] = CallMessage(
        role: msg.role,
        text: msg.text,
        translation: tr,
      );
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    unawaited(_playerCompleteSub?.cancel());
    unawaited(_disposeRecorder());
    unawaited(_player.dispose());
    _chat.dispose();
    _tts.dispose();
    super.dispose();
  }

  Future<void> _disposeRecorder() async {
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}
    await _recorder.dispose();
  }
}
