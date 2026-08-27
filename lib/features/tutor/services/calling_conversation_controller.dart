import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import 'hold_to_speak_service.dart';
import 'openai_chat_service.dart';
import 'tutor_tts_service.dart';
import 'viseme_cue.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/auth/session_store.dart';

enum CallMessageRole { tutor, user }

class CallHintSuggestion {
  const CallHintSuggestion({
    required this.english,
    required this.turkish,
    required this.basedOn,
  });

  final String english;
  final String turkish;
  /// Hocanın son cümlesi (bağlam).
  final String basedOn;
}

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

/// Start Talk → cihaz STT (anında) veya Whisper fallback + Chat + ElevenLabs flash.
class CallingConversationController extends ChangeNotifier {
  CallingConversationController({
    OpenAiChatService? chat,
    TutorTtsService? tts,
    HoldToSpeakService? mic,
    AudioPlayer? player,
    this.voiceId,
    this.openingLine,
    this.systemPrompt,
    this.tutorSlug,
    this.lessonMode = false,
  })  : _chat = chat ?? OpenAiChatService(),
        _tts = tts ?? TutorTtsService(),
        _player = player ?? AudioPlayer() {
    _mic = mic ?? HoldToSpeakService(whisper: _chat);
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      if (_suppressPlayerComplete) return;
      _finishSpeaking();
    });
    _playerStateSub = _player.onPlayerStateChanged.listen((state) {
      if (_suppressPlayerComplete) return;
      if (state == PlayerState.completed || state == PlayerState.stopped) {
        _finishSpeaking();
      }
    });
    _playerPositionSub = _player.onPositionChanged.listen(_onAudioPosition);
  }

  final OpenAiChatService _chat;
  final TutorTtsService _tts;
  late final HoldToSpeakService _mic;
  final AudioPlayer _player;
  final String? voiceId;
  final String? openingLine;
  final String? systemPrompt;
  final String? tutorSlug;
  /// Ders oturumu: kullanıcı/hoca bitirmek istediğinde özet ekranına git.
  final bool lessonMode;

  StreamSubscription<void>? _playerCompleteSub;
  StreamSubscription<Duration>? _playerPositionSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  final List<CallMessage> messages = [];
  final List<ChatTurn> _history = [];
  final Map<String, String> _translationCache = {};

  var _busy = false;
  var _listening = false;
  var _speaking = false;
  String? _error;
  List<VisemeCue> _visemeTrack = const [];
  double _currentViseme = 0;
  DateTime? _lastVisemeAppliedAt;
  double? _speechEndSec;
  double? _audioDurationSec;
  Timer? _lipsyncPollTimer;
  Timer? _speechEndFallbackTimer;
  var _lipsActive = false;
  Timer? _idleNudgeTimer;
  Timer? _extensionSilenceTimer;
  Timer? _inactivityTimer;
  Timer? _inactivityConfirmTimer;
  var _userHasSpoken = false;
  var _nudgeCount = 0;
  var _awaitingInactivityConfirm = false;
  DateTime? _lastUserSpeechAt;
  late final DateTime _callStartedAt = DateTime.now();
  var _disposed = false;
  var _suppressPlayerComplete = false;
  double _playbackRate = 1.0;

  /// none → askedOnce → askedTwice → ended
  var _extensionAskCount = 0;
  var _awaitingExtensionReply = false;

  /// Ders 15 dk checkpoint: UI bunu dinleyip oturumu kapatabilir.
  VoidCallback? onRequestEndLesson;

  /// Kullanıcı +15 dk istediğinde UI segment zamanını sıfırlar.
  VoidCallback? onSegmentContinued;

  static const _maxNudges = 2;
  static const playbackRates = <double>[0.5, 1.0, 1.5, 2.0];
  static const _userInactivityTimeout = Duration(minutes: 2);
  static const _inactivityConfirmTimeout = Duration(seconds: 28);

  /// Eğlenceli / alternatif hoca önerileri (sessizlikle bitişte).
  static const _funTutorSuggestions = <(String slug, String label)>[
    ('elrion', 'Elrion the elf'),
    ('vaelen', 'Vaelen the witch'),
    ('zephyrion', 'Zephyrion the alien'),
    ('ukrath', 'Ukrath the orc'),
    ('santa', 'Santa'),
  ];

  bool get busy => _busy;
  bool get listening => _listening;
  bool get speaking => _speaking;
  String? get error => _error;
  double get playbackRate => _playbackRate;
  String get playbackRateLabel {
    final r = _playbackRate;
    if (r == r.roundToDouble()) return '${r.toInt()}x';
    return '${r}x';
  }

  /// Rive `visemeNum` — ses pozisyonuna göre lipsync.
  double get currentViseme => _currentViseme;
  bool get hasLipsyncTrack => _visemeTrack.isNotEmpty;

  /// Rive `talk` — konuşma aktifken true.
  /// Kelime arası sessizlikte de true kalır; ağız kapanması `visemeNum=0` ile yapılır
  /// (prop false olursa lockout yüzünden sonraki hece gecikir).
  bool get avatarTalking => _speaking && _lipsActive;

  void _notify() {
    if (_disposed) return;
    notifyListeners();
  }

  Future<void> cyclePlaybackRate() async {
    final i = playbackRates.indexOf(_playbackRate);
    final next = playbackRates[(i < 0 ? 0 : i + 1) % playbackRates.length];
    _playbackRate = next;
    try {
      await _player.setPlaybackRate(next);
    } catch (_) {}
    // Rate değişince konuşma bitiş timer'ını yeni hıza göre yeniden kur.
    if (_speaking) {
      _scheduleSpeechEndFallback(_audioDurationSec ?? _speechEndSec);
    }
    notifyListeners();
  }

  Future<void> setPlaybackRate(double rate) async {
    if (!playbackRates.contains(rate)) return;
    _playbackRate = rate;
    try {
      await _player.setPlaybackRate(rate);
    } catch (_) {}
    if (_speaking) {
      _scheduleSpeechEndFallback(_audioDurationSec ?? _speechEndSec);
    }
    notifyListeners();
  }

  Duration? _lastPolledPos;
  DateTime? _lastPosChangeAt;
  Timer? _silenceCloseTimer;
  var _hadOpenMouth = false;

  void _onAudioPosition(Duration pos) {
    if (!_speaking) return;
    final t = pos.inMilliseconds / 1000.0;

    if (_lastPolledPos != pos) {
      _lastPolledPos = pos;
      _lastPosChangeAt = DateTime.now();
    } else {
      final stuckFor = _lastPosChangeAt == null
          ? 0
          : DateTime.now().difference(_lastPosChangeAt!).inMilliseconds;
      if (stuckFor >= 120 && t > 0.15) {
        _finishSpeaking();
        return;
      }
    }

    final audioEnd = _audioDurationSec;
    if (audioEnd != null && audioEnd > 0 && t >= audioEnd - 0.12) {
      _finishSpeaking();
      return;
    }

    final lipEnd = _speechEndSec;
    if (lipEnd != null && lipEnd > 0 && t >= lipEnd) {
      _finishSpeaking();
      return;
    }

    if (!_lipsActive || _visemeTrack.isEmpty) return;

    final next = visemeAt(
      _visemeTrack,
      t,
      cutOffSec: lipEnd,
      latencySec: kVisemeLatencySec,
    );

    if (next != 0) {
      _hadOpenMouth = true;
      _silenceCloseTimer?.cancel();
      _silenceCloseTimer = null;
    } else if (_hadOpenMouth && !hasUpcomingMouth(_visemeTrack, t)) {
      // Son hece bitti, önde ağız yok → hemen kapat (TTS kuyruk sessizliği).
      _silenceCloseTimer?.cancel();
      _silenceCloseTimer = Timer(const Duration(milliseconds: 50), () {
        if (_speaking && !_disposed) _finishSpeaking();
      });
    }

    if (next == _currentViseme) return;

    // Wall-clock gap'i playback rate'e göre ölçekle — 1.5x'te dudak sese yetişsin.
    // Sessizliğe (0) geçiş her zaman anında olsun (kelime arası).
    final rate = _playbackRate <= 0 ? 1.0 : _playbackRate;
    final gapMs = (kMinVisemeGapMs / rate).round().clamp(40, kMinVisemeGapMs);
    final now = DateTime.now();
    final last = _lastVisemeAppliedAt;
    if (next != 0 &&
        last != null &&
        now.difference(last).inMilliseconds < gapMs) {
      return;
    }

    _currentViseme = next;
    _lastVisemeAppliedAt = now;
    _notify();
  }

  void _scheduleSpeechEndFallback(double? audioSec) {
    _speechEndFallbackTimer?.cancel();
    final lip = _speechEndSec;
    // Dudak bitişini duvar saatiyle de kes — position gecikirse ağız açık kalmasın.
    final end = lip ?? audioSec;
    if (end == null || end <= 0) return;
    final rate = _playbackRate <= 0 ? 1.0 : _playbackRate;
    final ms = ((end / rate) * 1000).round().clamp(120, 120000);
    _speechEndFallbackTimer = Timer(Duration(milliseconds: ms), () {
      if (_speaking && !_disposed) _finishSpeaking();
    });
  }

  void _startLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_speaking || _disposed) {
        _stopLipsyncPoll();
        return;
      }
      _player.getCurrentPosition().then((pos) {
        if (pos != null && _speaking && !_disposed) {
          _onAudioPosition(pos);
        }
      });
    });
  }

  void _stopLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = null;
  }

  void _finishSpeaking({bool stopPlayer = false}) {
    if (!_speaking && !_lipsActive) return;
    _speaking = false;
    _lipsActive = false;
    _currentViseme = 0;
    _visemeTrack = const [];
    _lastVisemeAppliedAt = null;
    _speechEndSec = null;
    _audioDurationSec = null;
    _lastPolledPos = null;
    _lastPosChangeAt = null;
    _hadOpenMouth = false;
    _silenceCloseTimer?.cancel();
    _silenceCloseTimer = null;
    _stopLipsyncPoll();
    _speechEndFallbackTimer?.cancel();
    _speechEndFallbackTimer = null;
    if (stopPlayer) {
      unawaited(_player.stop());
    }
    _notify();
    _scheduleIdleNudge();
    if (!_awaitingInactivityConfirm) {
      _armUserInactivityWatch();
    }
  }

  Future<void> _resolveSpeechEnd(TutorSpeechAudio speech) async {
    Duration? duration;
    for (var i = 0; i < 12; i++) {
      duration = await _player.getDuration();
      if (duration != null && duration.inMilliseconds > 0) break;
      await Future<void>.delayed(const Duration(milliseconds: 40));
    }
    if (_disposed || !_speaking) return;
    final audioSec = duration != null && duration.inMilliseconds > 0
        ? duration.inMilliseconds / 1000.0
        : null;
    _audioDurationSec = audioSec;
    if (audioSec != null && speech.visemes.isNotEmpty) {
      _visemeTrack = scaleVisemesToAudioDuration(speech.visemes, audioSec);
    }
    _speechEndSec = effectiveSpeechEndSec(
      visemes: _visemeTrack.isNotEmpty ? _visemeTrack : speech.visemes,
      audioDurationSec: audioSec,
    );
    _scheduleSpeechEndFallback(audioSec);
  }

  Future<void> start() async {
    // Cihaz STT'yi açılışta ısıt — ilk mic bırakışında ağ Whisper'a düşmesin.
    unawaited(_mic.warmUp());
    await _preparePlaybackSession();
    notifyListeners();
    await _tutorSay(
      openingLine ??
          "Hi! I'm your tutor. Let's practice English greetings. "
              'How are you today?',
    );
    if (!_speaking) _scheduleIdleNudge();
    _armUserInactivityWatch();
  }

  void _cancelIdleNudge() {
    _idleNudgeTimer?.cancel();
    _idleNudgeTimer = null;
  }

  void _scheduleIdleNudge() {
    _cancelIdleNudge();
    if (_disposed || _userHasSpoken || _nudgeCount >= _maxNudges) return;
    if (_listening || _busy || _speaking) return;
    final delay = Duration(seconds: _nudgeCount == 0 ? 7 : 10);
    _idleNudgeTimer = Timer(delay, () {
      unawaited(_maybeNudge());
    });
  }

  Future<void> _maybeNudge() async {
    if (_disposed || _userHasSpoken || _listening || _busy || _speaking) {
      if (!_disposed && !_userHasSpoken) _scheduleIdleNudge();
      return;
    }
    if (_nudgeCount >= _maxNudges) return;
    final line = _nudgeLine(_nudgeCount);
    _nudgeCount += 1;
    await _tutorSay(line);
    if (!_speaking) _scheduleIdleNudge();
  }

  String _nudgeLine(int index) {
    final slug = (tutorSlug ?? '').toLowerCase();
    final lines = switch (slug) {
      'ukrath' => const [
          "I don't love the human race much... but I must admit you're brave. You can try this.",
          'Speak, human. Even orcs wait — but not forever. Say one word.',
        ],
      'zephyrion' => const [
          "Why so silent? Or are you afraid I'll abduct you?",
          'No kidnapping today. I promise. Just say hello, human.',
        ],
      'vaelen' => const [
          'Did a spell steal your voice? I am still here.',
          'One small word is enough magic. Try hello.',
        ],
      'elrion' => const [
          'The forest is listening. Shy — or choosing your words like an elf?',
          'The first word is a step on the leaf-path. Try hello.',
        ],
      'santa' => const [
          'Ho ho — did the cookies steal your voice? Say hello!',
          'The reindeer are waiting. One little hello, please.',
        ],
      'kenji' || 'marco' || 'ines' || 'morgan' => const [
          "Are you there? It's okay if the first step feels hard — just say hi.",
          'No pressure. Hold the mic and say hello.',
        ],
      'katie' => const [
          "Still there? Let's start with one word: hello.",
          'Hold the mic. Say hi — that counts.',
        ],
      _ => const [
          "Hey — still there? Don't worry, just say hello.",
          'The first word is the hardest. Try a simple hi.',
        ],
    };
    return lines[index.clamp(0, lines.length - 1)];
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

  /// Basılı tutunca dinle; bırakınca cihaz STT (anında) veya Whisper.
  Future<void> startListening() async {
    if (_busy || _listening) return;
    _cancelIdleNudge();

    await _player.stop();
    _finishSpeaking(stopPlayer: false);
    _lipsActive = false;
    _visemeTrack = const [];
    _currentViseme = 0;
    _speechEndSec = null;
    _audioDurationSec = null;
    _notify();
    await Future<void>.delayed(const Duration(milliseconds: 80));

    try {
      // warmUp bitmemiş olabilir — ilk turda da dene.
      await _mic.warmUp();
      await _mic.start();
      _error = null;
      _listening = true;
      notifyListeners();
    } catch (e) {
      _listening = false;
      _error = e.toString().contains('Mikrofon')
          ? 'Mikrofon izni gerekli. Ayarlardan izin ver.'
          : 'Kayıt başlatılamadı: $e';
      notifyListeners();
      _scheduleIdleNudge();
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

    String? transcribed;
    try {
      final text = (await _mic.stopAndGetText()).trim();
      if (text.isEmpty) {
        _error = 'Ses anlaşılamadı — daha net / yakından konuş.';
        return;
      }
      debugPrint(
        'Mic STT ok: ${text.length} chars'
        ' (device=${_mic.deviceSttAvailable})',
      );
      _error = null;
      transcribed = text;
    } catch (e) {
      _error = e.toString();
    } finally {
      _busy = false;
      _listening = false;
      notifyListeners();
    }

    if (transcribed != null) {
      unawaited(_onUserSpeech(transcribed));
    } else if (!_userHasSpoken) {
      _scheduleIdleNudge();
    }
  }

  Future<void> sendTypedMessage(String text) async {
    final cleaned = text.trim();
    if (cleaned.isEmpty || _disposed) return;
    await _onUserSpeech(cleaned);
  }

  Future<void> _onUserSpeech(String text) async {
    _userHasSpoken = true;
    _lastUserSpeechAt = DateTime.now();
    _cancelIdleNudge();
    _clearInactivityConfirmWatch();
    if (_awaitingInactivityConfirm) {
      final decision = _parseInactivityDecision(text);
      messages.add(CallMessage(role: CallMessageRole.user, text: text));
      notifyListeners();
      if (decision == _InactivityDecision.continuePractice) {
        _awaitingInactivityConfirm = false;
        _armUserInactivityWatch();
        await _tutorSay(
          "No problem — I'm here whenever you're ready. Let's keep going.",
        );
        return;
      }
      // Hayır / belirsiz → bitir (onay gelmezse de aynı).
      _awaitingInactivityConfirm = false;
      await _closeAfterInactivity(userSaidNo: decision == _InactivityDecision.end);
      return;
    }
    messages.add(CallMessage(role: CallMessageRole.user, text: text));
    notifyListeners();
    _armUserInactivityWatch();

    if (_awaitingExtensionReply) {
      final decision = _parseExtensionDecision(text);
      if (decision == _ExtensionDecision.continuePractice) {
        _clearExtensionWatch();
        _awaitingExtensionReply = false;
        _extensionAskCount = 0;
        onSegmentContinued?.call();
        await _tutorSay("Great — let's keep practicing for another 15 minutes.");
        return;
      }
      if (decision == _ExtensionDecision.finish) {
        _clearExtensionWatch();
        _awaitingExtensionReply = false;
        await _tutorSayAndWait(
          "Nice work today. Let's finish here — see you in the next lesson.",
        );
        if (!_disposed) onRequestEndLesson?.call();
        return;
      }
      // Belirsiz cevap → normal ders cevabı + kısa hatırlatma
    }

    if (lessonMode && _parseLessonFinishIntent(text)) {
      await _finishLessonAfterReply(userMessage: text);
      return;
    }

    try {
      final reply = await _chat.complete(
        history: _history,
        userMessage: text,
        systemPrompt: systemPrompt,
      );
      _history.add(ChatTurn(role: 'user', content: text));
      _history.add(ChatTurn(role: 'assistant', content: reply));
      while (_history.length > 16) {
        _history.removeAt(0);
      }
      await _tutorSay(reply, alreadyInHistory: true);
      if (lessonMode &&
          _parseSoftLessonAgreement(text) &&
          _replySuggestsLessonEnd(reply)) {
        await _waitUntilSpeechDone();
        if (!_disposed) onRequestEndLesson?.call();
        return;
      }
      if (_awaitingExtensionReply && decisionWasUnclear(text)) {
        await Future<void>.delayed(const Duration(milliseconds: 400));
        if (!_disposed && _awaitingExtensionReply) {
          await _tutorSay(
            'Just checking — another 15 minutes of practice, or finish the lesson?',
          );
        }
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  bool decisionWasUnclear(String text) =>
      _parseExtensionDecision(text) == null;

  _ExtensionDecision? _parseExtensionDecision(String raw) {
    final t = raw.toLowerCase().trim();
    if (t.isEmpty) return null;
    const finishKeys = [
      'finish',
      'end',
      'stop',
      'done',
      'enough',
      'bitir',
      'bitirelim',
      'hayır',
      'hayir',
      'no',
      'close',
    ];
    const continueKeys = [
      'more',
      'again',
      'continue',
      'practice',
      'another',
      'yes',
      'evet',
      'keep',
      '15',
      'pratik',
      'devam',
      'daha',
    ];
    for (final k in finishKeys) {
      if (t.contains(k)) return _ExtensionDecision.finish;
    }
    for (final k in continueKeys) {
      if (t.contains(k)) return _ExtensionDecision.continuePractice;
    }
    return null;
  }

  /// 15 dk dolunca çağır: uzatma sor / sessizlikte bitir.
  Future<void> offerFifteenMinuteCheckpoint() async {
    if (_disposed || _awaitingExtensionReply) return;
    _cancelIdleNudge();
    _awaitingExtensionReply = true;
    _extensionAskCount = 1;
    await _tutorSay(
      "We've practiced for about 15 minutes. "
      'Would you like another 15 minutes of practice, or shall we finish the lesson?',
    );
    _armExtensionSilenceWatch();
  }

  void _armExtensionSilenceWatch() {
    _extensionSilenceTimer?.cancel();
    _extensionSilenceTimer = Timer(const Duration(seconds: 28), () {
      unawaited(_onExtensionSilence());
    });
  }

  void _clearExtensionWatch() {
    _extensionSilenceTimer?.cancel();
    _extensionSilenceTimer = null;
  }

  Future<void> _onExtensionSilence() async {
    if (_disposed || !_awaitingExtensionReply) return;
    if (_listening || _busy || _speaking) {
      _armExtensionSilenceWatch();
      return;
    }
    if (_extensionAskCount < 2) {
      _extensionAskCount = 2;
      await _tutorSay(
        'Still with me? Another 15 minutes of practice, or shall we finish?',
      );
      _armExtensionSilenceWatch();
      return;
    }
    _awaitingExtensionReply = false;
    _clearExtensionWatch();
    await _tutorSayAndWait(
      "I can tell you may be tired from the quiet. Let's end the lesson here.",
    );
    if (!_disposed) onRequestEndLesson?.call();
  }

  String get _learnerFirstName {
    final raw = AuthService.displayNameOf(SessionStore.currentUser).trim();
    if (raw.isEmpty || raw.toLowerCase() == 'guest') return 'there';
    final first = raw.split(RegExp(r'\s+')).first.trim();
    return first.isEmpty ? 'there' : first;
  }

  (String slug, String label) _randomFunTutorSuggestion() {
    final current = (tutorSlug ?? '').toLowerCase();
    final options = _funTutorSuggestions
        .where((e) => e.$1 != current)
        .toList(growable: false);
    final pool = options.isEmpty ? _funTutorSuggestions : options;
    return pool[DateTime.now().millisecondsSinceEpoch % pool.length];
  }

  void _armUserInactivityWatch() {
    _inactivityTimer?.cancel();
    if (_disposed || _awaitingInactivityConfirm || _awaitingExtensionReply) {
      return;
    }
    final anchor = _lastUserSpeechAt ?? _callStartedAt;
    final elapsed = DateTime.now().difference(anchor);
    var remaining = _userInactivityTimeout - elapsed;
    if (remaining.isNegative) remaining = Duration.zero;
    _inactivityTimer = Timer(remaining, () {
      unawaited(_onUserInactivityTimeout());
    });
  }

  void _clearUserInactivityWatch() {
    _inactivityTimer?.cancel();
    _inactivityTimer = null;
  }

  void _clearInactivityConfirmWatch() {
    _inactivityConfirmTimer?.cancel();
    _inactivityConfirmTimer = null;
  }

  Future<void> _onUserInactivityTimeout() async {
    if (_disposed || _awaitingInactivityConfirm || _awaitingExtensionReply) {
      return;
    }
    if (_listening || _busy || _speaking) {
      // Konuşma/kayıt bitince tekrar dene.
      _inactivityTimer = Timer(const Duration(seconds: 4), () {
        unawaited(_onUserInactivityTimeout());
      });
      return;
    }
    _cancelIdleNudge();
    _clearUserInactivityWatch();
    _awaitingInactivityConfirm = true;
    final name = _learnerFirstName;
    await _tutorSay(
      '$name, I understand — this might not be a good time to talk. '
      "If you don't speak, it won't be effective, so I think we should end the lesson. "
      'Okay?',
    );
    _armInactivityConfirmWatch();
  }

  void _armInactivityConfirmWatch() {
    _clearInactivityConfirmWatch();
    _inactivityConfirmTimer = Timer(_inactivityConfirmTimeout, () {
      unawaited(_onInactivityConfirmSilence());
    });
  }

  Future<void> _onInactivityConfirmSilence() async {
    if (_disposed || !_awaitingInactivityConfirm) return;
    if (_listening || _busy || _speaking) {
      _armInactivityConfirmWatch();
      return;
    }
    _awaitingInactivityConfirm = false;
    await _closeAfterInactivity(userSaidNo: false);
  }

  Future<void> _closeAfterInactivity({required bool userSaidNo}) async {
    _clearInactivityConfirmWatch();
    _clearUserInactivityWatch();
    _cancelIdleNudge();
    final tip = _randomFunTutorSuggestion();
    await _tutorSayAndWait(
      'Take care of yourself. '
      "If practicing with me isn't working right now, next time try someone more fun — "
      'maybe ${tip.$2}. Goodbye!',
    );
    if (!_disposed) onRequestEndLesson?.call();
  }

  _InactivityDecision? _parseInactivityDecision(String raw) {
    final t = raw.toLowerCase().trim();
    if (t.isEmpty) return null;
    bool has(String key) =>
        RegExp('\\b${RegExp.escape(key)}\\b').hasMatch(t);

    const continueKeys = [
      'continue',
      'keep going',
      'keep practicing',
      'ready',
      'yes',
      'yeah',
      'yep',
      'ok',
      'okay',
      'evet',
      'devam',
      "i'm here",
      'im here',
      'still here',
      'wait',
      'not yet',
      'one more',
    ];
    const endKeys = [
      'no',
      'hayır',
      'hayir',
      'finish',
      'end',
      'stop',
      'done',
      'bitir',
      'enough',
      'bye',
      'close',
      'goodbye',
    ];
    for (final k in endKeys) {
      if (has(k)) return _InactivityDecision.end;
    }
    for (final k in continueKeys) {
      if (t.contains(k) || has(k)) {
        return _InactivityDecision.continuePractice;
      }
    }
    return null;
  }

  Future<void> _finishLessonAfterReply({required String userMessage}) async {
    _clearExtensionWatch();
    _awaitingExtensionReply = false;
    try {
      final reply = await _chat.complete(
        history: _history,
        userMessage: userMessage,
        systemPrompt: systemPrompt,
      );
      _history.add(ChatTurn(role: 'user', content: userMessage));
      _history.add(ChatTurn(role: 'assistant', content: reply));
      while (_history.length > 16) {
        _history.removeAt(0);
      }
      await _tutorSayAndWait(reply, alreadyInHistory: true);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      await _tutorSayAndWait(
        "Nice work today. Let's finish here — see you in the next lesson.",
      );
    }
    if (!_disposed) onRequestEndLesson?.call();
  }

  bool _parseLessonFinishIntent(String raw) {
    final t = raw.toLowerCase().trim();
    if (t.isEmpty) return false;
    const keys = [
      'finish',
      'finish the lesson',
      'end the lesson',
      'end lesson',
      'stop the lesson',
      'done for today',
      "we're done",
      'we are done',
      'that is enough',
      "that's enough",
      'enough for today',
      'bitir',
      'bitirelim',
      'dersi bitir',
      'ders bitti',
      'dersi bitirelim',
      'yeter',
      'tamam yeter',
      'kapat',
      'sonlandır',
      'sonlandıralım',
    ];
    return keys.any(t.contains);
  }

  bool _parseSoftLessonAgreement(String raw) {
    final t = raw.toLowerCase().trim();
    if (t.isEmpty) return false;
    const keys = [
      'ok',
      'okay',
      'yes',
      'yeah',
      'yep',
      'sure',
      'tamam',
      'evet',
      'olur',
      'peki',
      'hadi',
      'good',
      'great',
      'thanks',
      'thank you',
      'teşekkür',
      'tesekkur',
    ];
    return keys.any((k) => t == k || t.startsWith('$k '));
  }

  bool _replySuggestsLessonEnd(String reply) {
    final t = reply.toLowerCase();
    const keys = [
      'see you in the next lesson',
      'see you next lesson',
      "let's finish here",
      'let us finish here',
      'finish here',
      'finish the lesson',
      'end the lesson',
      'end here',
      'wrap up',
      'that wraps up',
      'great work today',
      'nice work today',
      'good work today',
      'sonraki derste görüş',
      'sonraki derste',
      'dersi bitir',
      'ders bitti',
    ];
    return keys.any(t.contains);
  }

  Future<void> _tutorSayAndWait(String text, {bool alreadyInHistory = false}) async {
    await _tutorSay(text, alreadyInHistory: alreadyInHistory);
    await _waitUntilSpeechDone();
  }

  Future<void> _waitUntilSpeechDone() async {
    if (!_speaking) return;
    final deadline = DateTime.now().add(const Duration(seconds: 90));
    while (_speaking && !_disposed && DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 80));
    }
  }

  Future<void> _tutorSay(String text, {bool alreadyInHistory = false}) async {
    messages.add(CallMessage(role: CallMessageRole.tutor, text: text));
    if (!alreadyInHistory) {
      _history.add(ChatTurn(role: 'assistant', content: text));
    }
    notifyListeners();

    try {
      final speech = await _tts
          .synthesizeForLipsync(
            text,
            voiceId: voiceId,
            modelId: TutorTtsService.flashModel,
          )
          .timeout(const Duration(seconds: 45));
      _suppressPlayerComplete = true;
      await _player.stop();
      await Future<void>.delayed(const Duration(milliseconds: 40));
      await _preparePlaybackSession();
      _visemeTrack = coalesceVisemes(speech.visemes);
      _speechEndSec = effectiveSpeechEndSec(
        visemes: _visemeTrack,
        audioDurationSec: null,
      );
      _audioDurationSec = null;
      _currentViseme = 0;
      _lastVisemeAppliedAt = null;
      _lipsActive = true;
      _hadOpenMouth = false;
      await _player.setPlaybackRate(_playbackRate);
      await _player
          .play(DeviceFileSource(speech.file.path))
          .timeout(const Duration(seconds: 8));
      _suppressPlayerComplete = false;
      _speaking = true;
      _notify();
      unawaited(_resolveSpeechEnd(speech));
      _startLipsyncPoll();
      // Wall-clock: position gecikse bile dudaklar lipEnd'de kapanır.
      _scheduleSpeechEndFallback(_speechEndSec);
    } on TimeoutException {
      _suppressPlayerComplete = false;
      _speaking = false;
      _visemeTrack = const [];
      _currentViseme = 0;
      _speechEndSec = null;
      _audioDurationSec = null;
      _error = 'Tutor speech timed out. Please try again.';
      _notify();
    } catch (e) {
      _suppressPlayerComplete = false;
      _speaking = false;
      _visemeTrack = const [];
      _currentViseme = 0;
      _speechEndSec = null;
      _audioDurationSec = null;
      _error = e.toString();
      _notify();
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

  /// Hoca son cümlesine göre öğrenciye İngilizce + Türkçe cevap önerisi.
  Future<CallHintSuggestion?> suggestHint({String? lessonLabel}) async {
    CallMessage? lastTutor;
    for (var i = messages.length - 1; i >= 0; i--) {
      if (messages[i].role == CallMessageRole.tutor) {
        lastTutor = messages[i];
        break;
      }
    }
    if (lastTutor == null || lastTutor.text.trim().isEmpty) return null;

    final english = await _chat.suggestStudentReply(
      tutorLastMessage: lastTutor.text,
      lessonContext: lessonLabel,
    );
    if (english.isEmpty) return null;

    var turkish = await _chat.translateToTurkish(english);
    if (turkish.isEmpty) turkish = english;

    return CallHintSuggestion(
      english: english,
      turkish: turkish,
      basedOn: lastTutor.text.trim(),
    );
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
    _disposed = true;
    _stopLipsyncPoll();
    _speechEndFallbackTimer?.cancel();
    _silenceCloseTimer?.cancel();
    unawaited(_playerStateSub?.cancel());
    _cancelIdleNudge();
    _clearExtensionWatch();
    _clearUserInactivityWatch();
    _clearInactivityConfirmWatch();
    unawaited(_playerCompleteSub?.cancel());
    unawaited(_playerPositionSub?.cancel());
    unawaited(_mic.dispose());
    unawaited(_player.dispose());
    _chat.dispose();
    _tts.dispose();
    super.dispose();
  }
}

enum _ExtensionDecision { continuePractice, finish }

enum _InactivityDecision { continuePractice, end }
