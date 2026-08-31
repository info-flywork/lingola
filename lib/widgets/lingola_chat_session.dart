import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/auth/api_client.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_text.dart';
import '../core/i18n/native_language.dart';
import '../core/i18n/word_translation_cache.dart';
import '../core/theme/app_theme.dart';
import '../i18n/strings.g.dart';
import '../features/tutor/services/hold_to_speak_service.dart';
import '../features/tutor/services/openai_chat_service.dart';
import '../features/tutor/services/tutor_tts_service.dart';
import '../features/tutor/services/viseme_cue.dart';
import '../features/tutor/tutor_scene_theme.dart';
import '../features/tutor/widgets/tutor_rive_avatar.dart';
import 'chat_word_chip.dart';
import 'chat_session_action_bar.dart';
import 'tutor_compact_hero_panel.dart';
import 'home_asset.dart';

/// Ortak sohbet mesaj modeli (onboarding preview + role play).
class LingolaChatMessage {
  const LingolaChatMessage._({
    required this.isUser,
    required this.text,
    this.highlight,
    this.rest,
  });

  factory LingolaChatMessage.user(String text) =>
      LingolaChatMessage._(isUser: true, text: text);

  factory LingolaChatMessage.bot(String text) =>
      LingolaChatMessage._(isUser: false, text: text);

  factory LingolaChatMessage.botHighlighted({
    required String highlight,
    required String rest,
  }) {
    return LingolaChatMessage._(
      isUser: false,
      text: '$highlight$rest',
      highlight: highlight,
      rest: rest,
    );
  }

  final bool isUser;
  final String text;
  final String? highlight;
  final String? rest;
}

/// Onboarding ve Role Play için ortak robot sohbet oturumu UI.
class LingolaChatSession extends StatefulWidget {
  const LingolaChatSession({
    required this.initialMessages,
    required this.onClose,
    this.brand,
    this.speedLabel,
    this.lessonBadge,
    this.typeMessageHint,
    this.botReply,
    /// Gerçek AI / backend: kullanıcı mesajı → asistan cevabı.
    this.onSendAsync,
    this.enableTts = true,
    this.enableMic = true,
    this.autoSpeakBot = true,
    this.ttsVoiceId,
    this.riveAsset,
    this.fallbackImage,
    this.sessionLimit,
    this.onSessionExpired,
    this.showBack = true,
    this.busy = false,
    this.errorText,
    this.onRetry,
    this.nativeLanguageCode,
    super.key,
  });

  final List<LingolaChatMessage> initialMessages;
  final void Function(Duration elapsed) onClose;
  final String? brand;
  final String? speedLabel;
  final String? lessonBadge;
  final String? typeMessageHint;
  final String? botReply;
  final Future<String?> Function(String userMessage)? onSendAsync;
  final bool enableTts;
  final bool enableMic;
  final bool autoSpeakBot;
  /// ElevenLabs voice (örn. erkek ses için TutorVoiceIds.male).
  final String? ttsVoiceId;
  /// Varsa Rive avatar (dudak senkronu).
  final String? riveAsset;
  final String? fallbackImage;
  final Duration? sessionLimit;
  final void Function(Duration elapsed)? onSessionExpired;
  final bool showBack;
  final bool busy;
  final String? errorText;
  final VoidCallback? onRetry;
  /// Anadil çevirisi (örn. onboarding draft); yoksa oturumdan çözülür.
  final String? nativeLanguageCode;

  @override
  State<LingolaChatSession> createState() => _LingolaChatSessionState();
}

class _LingolaChatSessionState extends State<LingolaChatSession> {
  static const _heroHeight = 400.0;
  static const _pillBg = Color(0x80000000);
  static const _expandedBg = Color(0xFF1A2A4A);

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  late final List<LingolaChatMessage> _messages;
  final _tts = TutorTtsService();
  final _player = AudioPlayer();
  final _mic = HoldToSpeakService();
  StreamSubscription<void>? _playerCompleteSub;
  StreamSubscription<Duration>? _playerPositionSub;

  List<VisemeCue> _visemeTrack = const [];
  final _visemeNotifier = ValueNotifier<double>(0);
  final _lipsActiveNotifier = ValueNotifier<bool>(false);
  double? _speechEndSec;
  Timer? _lipsyncPollTimer;

  Timer? _ticker;
  Timer? _sessionTimer;
  var _hintLoading = false;
  String? _hintSuggestion;
  var _hintsOn = false;
  var _textComposeOn = false;
  var _expanded = false;
  var _closing = false;
  Timer? _recordingTicker;
  Duration _elapsed = Duration.zero;
  Duration _recordingElapsed = Duration.zero;
  bool _finished = false;
  bool _sending = false;
  bool _recording = false;
  bool _recordingLocked = false;
  bool _cancelRecordingPending = false;
  bool _speaking = false;
  String? _localError;
  Offset? _micDownGlobal;

  static const _lockSlideThreshold = 72.0;
  static const _cancelSlideThreshold = 72.0;

  @override
  void initState() {
    super.initState();
    _messages = List<LingolaChatMessage>.of(widget.initialMessages);
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      if (!mounted) return;
      _stopLipsyncPoll();
      setState(() {
        _speaking = false;
        _visemeTrack = const [];
        _speechEndSec = null;
      });
      _lipsActiveNotifier.value = false;
      _visemeNotifier.value = 0;
    });
    _playerPositionSub = _player.onPositionChanged.listen((pos) {
      if (!_speaking || _visemeTrack.isEmpty) return;
      _applyVisemeAt(pos);
    });

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _finished) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    final limit = widget.sessionLimit;
    if (limit != null) {
      _sessionTimer = Timer(limit, () => unawaited(_expireSession()));
    }

    if (widget.autoSpeakBot && widget.enableTts) {
      final firstBot = _messages.cast<LingolaChatMessage?>().firstWhere(
            (m) => m != null && !m.isUser,
            orElse: () => null,
          );
      if (firstBot != null) {
        unawaited(_speak(firstBot.text));
      }
    }

    unawaited(_mic.warmUp());
  }

  @override
  void didUpdateWidget(covariant LingolaChatSession oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.initialMessages, widget.initialMessages)) return;

    final oldFirst = oldWidget.initialMessages.isEmpty
        ? null
        : oldWidget.initialMessages.first.text;
    final newFirst =
        widget.initialMessages.isEmpty ? null : widget.initialMessages.first.text;
    final grew = widget.initialMessages.length > _messages.length;
    final replaced = widget.initialMessages.length != _messages.length ||
        oldFirst != newFirst;

    if (!grew && !replaced) return;

    setState(() {
      _messages
        ..clear()
        ..addAll(widget.initialMessages);
    });
  }

  void _applyVisemeAt(Duration pos) {
    if (!_speaking) return;
    final t = pos.inMilliseconds / 1000.0;
    final syncedT = ((t - kVisemeLatencySec) * kLipsyncTimelineBoost).clamp(
      0.0,
      double.infinity,
    );
    final lipEnd = _speechEndSec;
    if (lipEnd != null && lipEnd > 0 && syncedT >= lipEnd) {
      if (_lipsActiveNotifier.value) {
        _lipsActiveNotifier.value = false;
        _visemeNotifier.value = 0;
      }
      return;
    }
    if (!_lipsActiveNotifier.value || _visemeTrack.isEmpty) return;
    final next = visemeAt(_visemeTrack, t);
    if (next == _visemeNotifier.value) return;
    _visemeNotifier.value = next;
  }

  void _startLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_speaking || !mounted) {
        _stopLipsyncPoll();
        return;
      }
      _player.getCurrentPosition().then((pos) {
        if (pos != null && mounted && _speaking) {
          _applyVisemeAt(pos);
        }
      });
    });
  }

  void _stopLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = null;
  }

  @override
  void dispose() {
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    _recordingTicker?.cancel();
    _stopLipsyncPoll();
    unawaited(_player.stop());
    unawaited(_mic.cancel());
    _controller.dispose();
    _scrollController.dispose();
    unawaited(_playerCompleteSub?.cancel());
    unawaited(_playerPositionSub?.cancel());
    unawaited(_player.dispose());
    unawaited(_mic.dispose());
    _visemeNotifier.dispose();
    _lipsActiveNotifier.dispose();
    _tts.dispose();
    super.dispose();
  }

  String get _timerLabel {
    final total = _elapsed.inSeconds.clamp(0, 59 * 60 + 59);
    final hours = (total ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((total % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (total % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String get _recordingTimerLabel {
    final total = _recordingElapsed.inSeconds.clamp(0, 59 * 60 + 59);
    final minutes = (total ~/ 60).toString().padLeft(2, '0');
    final seconds = (total % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startRecordingTimer() {
    _recordingTicker?.cancel();
    _recordingElapsed = Duration.zero;
    _recordingTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !_recording) return;
      setState(() => _recordingElapsed += const Duration(seconds: 1));
    });
  }

  void _stopRecordingTimer() {
    _recordingTicker?.cancel();
    _recordingTicker = null;
    _recordingElapsed = Duration.zero;
  }

  Future<void> _onMicPointerDown(PointerDownEvent event) async {
    if (!widget.enableMic || _sending || _finished || _recording) return;
    _micDownGlobal = event.position;
    _cancelRecordingPending = false;
    await _startMic();
    if (_recording) _startRecordingTimer();
  }

  void _onMicPointerMove(PointerMoveEvent event) {
    if (!_recording || _recordingLocked || _micDownGlobal == null) return;
    final delta = event.position - _micDownGlobal!;

    if (delta.dy < -_lockSlideThreshold) {
      HapticFeedback.mediumImpact();
      setState(() => _recordingLocked = true);
      _micDownGlobal = null;
      return;
    }

    final shouldCancel = delta.dx < -_cancelSlideThreshold;
    if (shouldCancel != _cancelRecordingPending) {
      if (shouldCancel) HapticFeedback.lightImpact();
      setState(() => _cancelRecordingPending = shouldCancel);
    }
  }

  Future<void> _onMicPointerCancel(PointerCancelEvent event) async {
    if (_recordingLocked) return;
    await _cancelRecording();
  }

  Future<void> _onMicPointerUp(PointerUpEvent event) async {
    if (_recordingLocked) return;
    _micDownGlobal = null;
    _stopRecordingTimer();

    if (_cancelRecordingPending) {
      await _cancelRecording();
      return;
    }
    if (_recording) {
      await _stopMicAndSend();
    }
  }

  Future<void> _cancelRecording() async {
    if (!_recording && !_recordingLocked) return;
    _stopRecordingTimer();
    _micDownGlobal = null;
    await _mic.cancel();
    if (!mounted) return;
    setState(() {
      _recording = false;
      _recordingLocked = false;
      _cancelRecordingPending = false;
    });
  }

  Future<void> _finishLockedRecording() async {
    if (!_recordingLocked || !_recording) return;
    _stopRecordingTimer();
    await _stopMicAndSend();
    if (!mounted) return;
    setState(() => _recordingLocked = false);
  }

  Future<void> _expireSession() async {
    if (_finished || !mounted) return;
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    _recordingTicker?.cancel();
    unawaited(_player.stop());
    unawaited(_mic.cancel());
    if (!mounted) return;
    setState(() {
      _recording = false;
      _recordingLocked = false;
      _cancelRecordingPending = false;
      _speaking = false;
    });
    (widget.onSessionExpired ?? widget.onClose)(_elapsed);
  }

  void _handleClose() {
    if (_finished || _closing) return;
    _closing = true;
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    _recordingTicker?.cancel();
    _stopLipsyncPoll();
    unawaited(_player.stop());
    unawaited(_cancelRecording());
    try {
      widget.onClose(_elapsed);
    } catch (_) {
      _finished = false;
      _closing = false;
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Future<void>.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          _finished = false;
          _closing = false;
        }
      });
    });
  }

  Future<void> _requestHint() async {
    if (_hintLoading || _finished) return;
    if (_hintsOn) {
      setState(() {
        _hintsOn = false;
        _hintSuggestion = null;
      });
      return;
    }

    String? lastBot;
    for (var i = _messages.length - 1; i >= 0; i--) {
      if (!_messages[i].isUser) {
        lastBot = _messages[i].text;
        break;
      }
    }
    if (lastBot == null || lastBot.trim().isEmpty) return;

    setState(() {
      _hintsOn = true;
      _hintLoading = true;
      _hintSuggestion = null;
      _textComposeOn = false;
    });
    try {
      final hint = await OpenAiChatService().suggestStudentReply(
        tutorLastMessage: lastBot,
        lessonContext: widget.lessonBadge ?? 'English practice',
      );
      if (!mounted) return;
      final cleaned = hint.trim();
      setState(() {
        _hintLoading = false;
        _hintSuggestion = cleaned.isEmpty ? null : cleaned;
        if (cleaned.isEmpty) _hintsOn = false;
      });
      if (cleaned.isNotEmpty) _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hintLoading = false;
        _hintsOn = false;
        _localError = e.toString();
      });
    }
  }

  void _toggleTextCompose() {
    setState(() {
      _textComposeOn = !_textComposeOn;
      if (_textComposeOn) {
        _hintsOn = false;
        final suggestion = _hintSuggestion?.trim();
        if (suggestion != null &&
            suggestion.isNotEmpty &&
            _controller.text.trim().isEmpty) {
          _controller.text = suggestion;
        }
      }
    });
  }

  Future<void> _sendHintSuggestion() async {
    final text = _hintSuggestion?.trim();
    if (text == null || text.isEmpty || _finished || _sending) return;
    setState(() {
      _hintsOn = false;
      _hintSuggestion = null;
    });
    await _sendMessage(text);
  }

  void _toggleExpanded() {
    setState(() => _expanded = !_expanded);
  }

  Future<void> _speak(String text) async {
    if (!widget.enableTts || text.trim().isEmpty || _finished) return;
    try {
      await _player.stop();
      _stopLipsyncPoll();
      final speech = await _tts.synthesizeForLipsync(
        text,
        voiceId: widget.ttsVoiceId,
        modelId: TutorTtsService.flashModel,
      );
      if (!mounted || _finished) return;
      setState(() {
        _visemeTrack = speech.visemes;
        _speechEndSec = effectiveSpeechEndSec(
          visemes: speech.visemes,
          audioDurationSec: null,
        );
        _speaking = false;
      });
      _visemeNotifier.value = 0;
      _lipsActiveNotifier.value = true;
      if (!mounted || _finished) return;
      await _player.play(DeviceFileSource(speech.file.path));
      if (!mounted || _finished) {
        unawaited(_player.stop());
        return;
      }
      final duration = await _player.getDuration();
      if (duration != null && duration.inMilliseconds > 0 && mounted) {
        setState(() {
          _speechEndSec = effectiveSpeechEndSec(
            visemes: speech.visemes,
            audioDurationSec: duration.inMilliseconds / 1000.0,
          );
        });
      }
      if (!mounted) return;
      setState(() => _speaking = true);
      _startLipsyncPoll();
    } catch (e) {
      if (!mounted) return;
      _stopLipsyncPoll();
      setState(() {
        _speaking = false;
        _visemeTrack = const [];
        _speechEndSec = null;
        _localError = e.toString();
      });
      _lipsActiveNotifier.value = false;
      _visemeNotifier.value = 0;
    }
  }

  Future<void> _sendMessage([String? override]) async {
    final value = (override ?? _controller.text).trim();
    if (value.isEmpty || _finished || widget.busy) return;
    // Mic yolu STT için _sending açmış olabilir; override varken erken return yapma.
    if (_sending && override == null) return;

    setState(() {
      _sending = true;
      _localError = null;
      _messages.add(LingolaChatMessage.user(value));
      _controller.clear();
    });
    _scrollToBottom();

    try {
      String? reply;
      final asyncSend = widget.onSendAsync;
      if (asyncSend != null) {
        reply = await asyncSend(value).timeout(const Duration(seconds: 45));
      } else if (widget.botReply != null) {
        reply = widget.botReply;
      } else {
        throw ApiException(AppText.current.common.connectionError);
      }
      if (!mounted) return;
      if (reply != null && reply.trim().isNotEmpty) {
        setState(() => _messages.add(LingolaChatMessage.bot(reply!.trim())));
        _scrollToBottom();
        if (widget.autoSpeakBot) unawaited(_speak(reply.trim()));
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _localError = e is TimeoutException
            ? 'Sunucu yanıt vermedi. Tekrar dene.'
            : e is ApiException
                ? e.message
                : e.toString();
      });
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _startMic() async {
    if (!widget.enableMic || _recording || _sending || _finished) return;
    await _player.stop();

    try {
      await _mic.start();
      if (!mounted) return;
      HapticFeedback.mediumImpact();
      setState(() {
        _recording = true;
        _localError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _localError = e.toString());
    }
  }

  Future<void> _robotSay(String text) async {
    if (!mounted || _finished) return;
    setState(() {
      _localError = null;
      _messages.add(LingolaChatMessage.bot(text));
    });
    _scrollToBottom();
    if (widget.enableTts) {
      await _speak(text);
    }
  }

  Future<void> _stopMicAndSend() async {
    if (!_recording) return;
    setState(() {
      _recording = false;
      _recordingLocked = false;
      _cancelRecordingPending = false;
      // STT sırasında spinner; gönderim _sendMessage içinde yönetilir.
      _sending = true;
      _localError = null;
    });
    HapticFeedback.lightImpact();

    try {
      final text = await _mic
          .stopAndGetText()
          .timeout(const Duration(seconds: 35));
      if (!mounted) return;
      if (text.trim().isEmpty) {
        setState(() => _sending = false);
        unawaited(_robotSay('Ses anlaşılamadı — tekrar dene'));
        return;
      }
      await _sendMessage(text.trim());
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _localError = e is TimeoutException
            ? 'Ses tanıma zaman aşımı — tekrar dene'
            : e.toString();
        _sending = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _expanded ? Colors.black : Colors.white,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: _expanded
            ? KeyedSubtree(
                key: const ValueKey('chat-expanded'),
                child: _buildExpanded(context),
              )
            : KeyedSubtree(
                key: const ValueKey('chat-compact'),
                child: _buildCompact(context),
              ),
      ),
    );
  }

  Widget _buildTopBar() {
    final preview = AppText.current.previewChat;
    final brand = widget.brand ?? preview.brand;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          _GlassCircleButton(
            size: 30,
            onTap: _toggleExpanded,
            child: const HomeAsset(
              AppAssets.callingResize,
              width: 14,
              height: 14,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _pillBg,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              brand,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 21 / 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 29,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _pillBg,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HomeAsset(
                  AppAssets.rolePlayRecording,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  _timerLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 21 / 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _GlassCircleButton(
            size: 32,
            onTap: _handleClose,
            child: const Icon(
              Icons.close_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarHero({required bool fill}) {
    return ListenableBuilder(
      listenable: Listenable.merge([_visemeNotifier, _lipsActiveNotifier]),
      builder: (context, _) {
        final talking = _speaking && _lipsActiveNotifier.value;
        return _ChatRobotHero(
          riveAsset: widget.riveAsset,
          talking: talking,
          lipsyncViseme: talking
              ? (_visemeTrack.isNotEmpty ? _visemeNotifier.value : null)
              : null,
          fallbackImage: null,
          fill: fill,
        );
      },
    );
  }

  Widget _buildComposer() {
    final hint = widget.typeMessageHint ?? AppText.current.previewChat.typeMessage;
    final blocked = _sending || (widget.busy && _messages.isEmpty);

    if (_recording || _recordingLocked) {
      return _WhatsAppChatComposer(
        controller: _controller,
        hint: hint,
        enabled: !blocked,
        enableMic: false,
        recording: _recording,
        recordingLocked: _recordingLocked,
        cancelPending: _cancelRecordingPending,
        recordingTimer: _recordingTimerLabel,
        chatLabels: AppText.current.previewChat,
        onSend: () => unawaited(_sendMessage()),
        onMicPointerDown: (_) {},
        onMicPointerCancel: (_) {},
        onCancelRecording: () => unawaited(_cancelRecording()),
        onFinishLockedRecording: () => unawaited(_finishLockedRecording()),
      );
    }

    if (_textComposeOn) {
      return _WhatsAppChatComposer(
        controller: _controller,
        hint: hint,
        enabled: !blocked,
        enableMic: widget.enableMic,
        micDismissesComposer: true,
        onMicDismiss: _toggleTextCompose,
        recording: false,
        recordingLocked: false,
        cancelPending: false,
        recordingTimer: _recordingTimerLabel,
        chatLabels: AppText.current.previewChat,
        onSend: () => unawaited(_sendMessage()),
        onHint: () => unawaited(_requestHint()),
        hintLoading: _hintLoading,
        onMicPointerDown: (_) {},
        onMicPointerCancel: (_) {},
        onCancelRecording: () {},
        onFinishLockedRecording: () {},
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: ChatSessionActionBar(
        enableMic: widget.enableMic,
        busy: blocked,
        listening: _recording,
        messageActive: false,
        hintActive: _hintsOn,
        hintLoading: _hintLoading,
        onMessage: _toggleTextCompose,
        onHint: () => unawaited(_requestHint()),
        onMicPointerDown: _onMicPointerDown,
        onMicPointerUp: _onMicPointerUp,
        onPointerCancel: _onMicPointerCancel,
      ),
    );
  }

  bool get _hintDraftVisible =>
      _hintsOn && (_hintSuggestion?.trim().isNotEmpty ?? false);

  Widget _buildMessageList({required bool darkChrome}) {
    final blocked = _sending || (widget.busy && _messages.isEmpty);
    final error = widget.errorText ?? _localError;

    if (widget.busy && _messages.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: darkChrome ? Colors.white : AppColors.primary,
        ),
      );
    }

    return Column(
      children: [
        if (error != null && !darkChrome)
          Material(
            color: const Color(0xFFFFEBEE),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      error,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xFFB71C1C),
                      ),
                    ),
                  ),
                  if (widget.onRetry != null)
                    TextButton(
                      onPressed: widget.onRetry,
                      child: Text(AppText.current.common.tryAgain),
                    ),
                ],
              ),
            ),
          ),
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            itemCount: _messages.length +
                (_hintDraftVisible ? 1 : 0) +
                (blocked ? 1 : 0),
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index >= _messages.length) {
                final hintIndex = _messages.length;
                if (_hintDraftVisible && index == hintIndex) {
                  return _HintDraftBubble(
                    message: _hintSuggestion!,
                    enabled: !blocked,
                    onSend: () => unawaited(_sendHintSuggestion()),
                  );
                }
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: darkChrome ? Colors.white : AppColors.primary,
                      ),
                    ),
                  ),
                );
              }
              final message = _messages[index];
              if (message.isUser) {
                return _UserBubble(message.text);
              }
              return _BotBubble(
                message: message,
                nativeLanguageCode: widget.nativeLanguageCode,
                onSpeak: widget.enableTts
                    ? (text) => _speak(text)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  /// Yarım ekran: üstte robot, altta sohbet + composer.
  Widget _buildCompact(BuildContext context) {
    final preview = AppText.current.previewChat;
    final speed = widget.speedLabel ?? preview.speed;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TutorCompactHeroPanel(
                      heroHeight: _heroHeight,
                      speedLabel: speed,
                      lessonBadge: widget.lessonBadge,
                      topBar: _buildTopBar(),
                      avatar: _buildAvatarHero(fill: false),
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.white,
                        child: _buildMessageList(darkChrome: false),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(top: false, child: _buildComposer()),
            ],
          ),
          if (_recording && !_recordingLocked)
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerMove: _onMicPointerMove,
                onPointerUp: _onMicPointerUp,
                onPointerCancel: _onMicPointerCancel,
              ),
            ),
        ],
      ),
    );
  }

  /// Tam ekran — tutor calling expanded ile aynı fikir.
  Widget _buildExpanded(BuildContext context) {
    final preview = AppText.current.previewChat;
    final speed = widget.speedLabel ?? preview.speed;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final error = widget.errorText ?? _localError;

    return Scaffold(
      backgroundColor: _expandedBg,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const OnboardingHeroBackdrop(fullBleed: true),
          Positioned.fill(
            child: IgnorePointer(
              child: _buildAvatarHero(fill: true),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 160,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x8C2D46FF),
                    Color(0x002D46FF),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 340,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x99000000),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topCenter,
              child: _buildTopBar(),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: bottom + 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ExpandedFloatingMessages(
                  messages: _messages,
                  sending: _sending,
                  nativeLanguageCode: widget.nativeLanguageCode,
                  onSpeak: widget.enableTts
                      ? (text) => unawaited(_speak(text))
                      : null,
                ),
                if (error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    error,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: .8),
                    ),
                  ),
                ],
                if (widget.lessonBadge != null) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _pillBg,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      widget.lessonBadge!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _pillBg,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    speed,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildComposer(),
              ],
            ),
          ),
          if (_recording && !_recordingLocked)
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerMove: _onMicPointerMove,
                onPointerUp: _onMicPointerUp,
                onPointerCancel: _onMicPointerCancel,
              ),
            ),
        ],
      ),
    );
  }
}

class _ChatRobotHero extends StatelessWidget {
  const _ChatRobotHero({
    required this.talking,
    this.riveAsset,
    this.fallbackImage,
    this.lipsyncViseme,
    this.fill = false,
  });

  final String? riveAsset;
  final bool talking;
  final String? fallbackImage;
  final double? lipsyncViseme;
  final bool fill;

  @override
  Widget build(BuildContext context) {
    final rive = riveAsset?.trim();
    final hasRive = rive != null && rive.isNotEmpty;

    final avatar = hasRive
        ? TutorRiveAvatar(
            assetPath: rive.startsWith('http')
                ? rive
                : AppAssets.tutorLingolaRivCdn,
            talking: talking,
            lipsyncViseme: lipsyncViseme,
            fallbackRivePath: AppAssets.tutorLingolaRivCdn,
            fallbackImage: fallbackImage,
            loadingBackgroundColor: Colors.transparent,
          )
        : HomeAsset(
            fallbackImage ?? AppAssets.tutorRobot,
            height: fill ? null : 280,
            fit: BoxFit.contain,
            alignment:
                fill ? const Alignment(0, -0.05) : Alignment.bottomCenter,
          );

    if (fill) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 40),
        child: Align(
          alignment: const Alignment(0, -0.05),
          child: avatar,
        ),
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: avatar,
      ),
    );
  }
}

/// Tam ekranda altta yüzen son mesajlar (tutor calling `_ScrollingChat` gibi).
class _ExpandedFloatingMessages extends StatelessWidget {
  const _ExpandedFloatingMessages({
    required this.messages,
    required this.sending,
    this.onSpeak,
    this.nativeLanguageCode,
  });

  final List<LingolaChatMessage> messages;
  final bool sending;
  final void Function(String text)? onSpeak;
  final String? nativeLanguageCode;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty && !sending) {
      return const SizedBox(height: 8);
    }

    return SizedBox(
      height: 200,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.white,
            ],
            stops: [0, 0.18, 1],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: ListView.builder(
          reverse: true,
          padding: EdgeInsets.zero,
          itemCount: messages.length + (sending ? 1 : 0),
          itemBuilder: (context, index) {
            if (sending && index == 0) {
              return const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 4),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
            final msgIndex =
                messages.length - 1 - (sending ? index - 1 : index);
            final message = messages[msgIndex];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: message.isUser
                  ? _UserBubble(message.text)
                  : _BotBubble(
                      message: message,
                      nativeLanguageCode: nativeLanguageCode,
                      onSpeak: onSpeak,
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _GlassCircleButton extends StatelessWidget {
  const _GlassCircleButton({
    required this.size,
    required this.onTap,
    required this.child,
  });

  final double size;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _LingolaChatSessionState._pillBg,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _WhatsAppChatComposer extends StatelessWidget {
  const _WhatsAppChatComposer({
    required this.controller,
    required this.hint,
    required this.enabled,
    required this.enableMic,
    required this.recording,
    required this.recordingLocked,
    required this.cancelPending,
    required this.recordingTimer,
    required this.chatLabels,
    required this.onSend,
    required this.onMicPointerDown,
    required this.onMicPointerCancel,
    required this.onCancelRecording,
    required this.onFinishLockedRecording,
    this.onHint,
    this.hintLoading = false,
    this.micDismissesComposer = false,
    this.onMicDismiss,
  });

  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final bool enableMic;
  final bool recording;
  final bool recordingLocked;
  final bool cancelPending;
  final String recordingTimer;
  final Translations$previewChat$en chatLabels;
  final VoidCallback onSend;
  final void Function(PointerDownEvent) onMicPointerDown;
  final void Function(PointerCancelEvent) onMicPointerCancel;
  final VoidCallback onCancelRecording;
  final VoidCallback onFinishLockedRecording;
  final VoidCallback? onHint;
  final bool hintLoading;
  final bool micDismissesComposer;
  final VoidCallback? onMicDismiss;

  @override
  Widget build(BuildContext context) {
    if (recording || recordingLocked) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!recordingLocked)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      size: 16,
                      color: AppColors.primary.withValues(alpha: .85),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      chatLabels.slideUpToLock,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary.withValues(alpha: .9),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: recordingLocked
                      ? AppColors.primary.withValues(alpha: .25)
                      : const Color(0xFFEF3F3F).withValues(alpha: .35),
                ),
              ),
              child: Row(
                children: [
                  if (recordingLocked)
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: enabled ? onCancelRecording : null,
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFEF3F3F),
                      ),
                    )
                  else
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.chevron_left_rounded,
                            color: cancelPending
                                ? const Color(0xFFEF3F3F)
                                : AppColors.secondary,
                          ),
                          Flexible(
                            child: Text(
                              chatLabels.slideLeftToCancel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: cancelPending
                                    ? const Color(0xFFEF3F3F)
                                    : AppColors.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: recordingLocked
                          ? AppColors.primary
                          : const Color(0xFFEF3F3F),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    recordingTimer,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: recordingLocked
                          ? AppColors.primary
                          : const Color(0xFFEF3F3F),
                    ),
                  ),
                  const Spacer(),
                  if (recordingLocked) ...[
                    Text(
                      chatLabels.recordingLockedHint,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: enabled ? onFinishLockedRecording : null,
                        child: const HomeAsset(
                          AppAssets.send,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ] else
                    Text(
                      chatLabels.recording,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          final hasText = value.text.trim().isNotEmpty;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (enableMic) ...[
                Material(
                  color: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: const CircleBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: .05),
                      ),
                    ),
                    child: micDismissesComposer
                        ? InkWell(
                            customBorder: const CircleBorder(),
                            onTap: enabled ? onMicDismiss : null,
                            child: const SizedBox(
                              width: 46,
                              height: 46,
                              child: Center(
                                child: HomeAsset(
                                  AppAssets.microphone,
                                  width: 22,
                                  height: 22,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          )
                        : Listener(
                            onPointerDown: enabled ? onMicPointerDown : null,
                            onPointerCancel:
                                enabled ? onMicPointerCancel : null,
                            child: const SizedBox(
                              width: 46,
                              height: 46,
                              child: Center(
                                child: HomeAsset(
                                  AppAssets.microphone,
                                  width: 22,
                                  height: 22,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: .05),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          enabled: enabled,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) {
                            if (hasText) onSend();
                          },
                          decoration: InputDecoration(
                            hintText: hint,
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: AppColors.secondary,
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      if (onHint != null)
                        InkWell(
                          onTap: (!enabled || hintLoading) ? null : onHint,
                          borderRadius: BorderRadius.circular(99),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: hintLoading
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.primary,
                                    ),
                                  )
                                : const HomeAsset(
                                    AppAssets.lightbulb,
                                    width: 18,
                                    height: 22,
                                  ),
                          ),
                        ),
                      const SizedBox(width: 2),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: enabled && hasText ? onSend : null,
                          child: const HomeAsset(
                            AppAssets.send,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BotBubble extends StatefulWidget {
  const _BotBubble({
    required this.message,
    this.nativeLanguageCode,
    this.onSpeak,
  });

  final LingolaChatMessage message;
  final String? nativeLanguageCode;
  final void Function(String text)? onSpeak;

  @override
  State<_BotBubble> createState() => _BotBubbleState();
}

class _BotBubbleState extends State<_BotBubble> {
  String? _translation;
  var _translating = false;
  String? _selectedWord;
  String? _wordTranslation;
  var _wordBusy = false;

  String get _nativeLang => NativeLanguageResolver.normalize(
        widget.nativeLanguageCode ?? NativeLanguageResolver.resolve(),
      );

  @override
  void dispose() {
    super.dispose();
  }

  void _clearWordSelection() {
    _selectedWord = null;
    _wordTranslation = null;
    _wordBusy = false;
  }

  String _withPunctuation(String original, String translated) {
    final prefix = RegExp(r"^[^\w']+").firstMatch(original)?.group(0) ?? '';
    final suffix = RegExp(r"[^\w']+$").firstMatch(original)?.group(0) ?? '';
    return '$prefix$translated$suffix';
  }

  Future<void> _translateSentence() async {
    if (_translating) return;
    if (_translation != null) {
      setState(() => _translation = null);
      return;
    }
    setState(() => _translating = true);
    try {
      final translated = await OpenAiChatService().translateToNative(
        widget.message.text,
        targetLang: _nativeLang,
      );
      if (!mounted) return;
      setState(() {
        _translation = translated.trim().isEmpty ? null : translated.trim();
        _translating = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _translating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
    }
  }

  Future<void> _onWordTap(String raw) async {
    final word = raw.replaceAll(RegExp(r"[^\w'\-]+"), '');
    if (word.isEmpty) return;

    if (_selectedWord != null &&
        _selectedWord!.toLowerCase() == word.toLowerCase() &&
        _wordTranslation != null) {
      setState(_clearWordSelection);
      return;
    }

    final cached = WordTranslationCache.get(word, _nativeLang);
    if (cached != null) {
      setState(() {
        _selectedWord = word;
        _wordTranslation = cached;
        _wordBusy = false;
      });
      return;
    }

    setState(() {
      _selectedWord = word;
      _wordTranslation = null;
      _wordBusy = true;
    });

    try {
      final translated = await OpenAiChatService().translateToNative(
        word,
        targetLang: _nativeLang,
      );
      if (!mounted || _selectedWord?.toLowerCase() != word.toLowerCase()) return;
      setState(() {
        _wordTranslation = translated.trim().isEmpty ? '—' : translated.trim();
        _wordBusy = false;
      });
    } catch (_) {
      if (!mounted || _selectedWord?.toLowerCase() != word.toLowerCase()) return;
      setState(() {
        _wordTranslation = '—';
        _wordBusy = false;
      });
    }
  }

  void _onSpeak() {
    final speak = widget.onSpeak;
    if (speak == null) return;
    final text = (_selectedWord != null && _selectedWord!.isNotEmpty)
        ? _selectedWord!
        : widget.message.text;
    speak(text);
  }

  List<InlineSpan> _buildWordSpans(String text) {
    const baseStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w400,
      color: AppColors.ink,
    );

    final wordList =
        text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    final spans = <InlineSpan>[];
    for (var i = 0; i < wordList.length; i++) {
      final word = wordList[i];
      var displayText = i < wordList.length - 1 ? '$word ' : word;
      final clean = word.replaceAll(RegExp(r"[^\w'\-]+"), '');
      if (clean.isEmpty) {
        spans.add(TextSpan(text: displayText, style: baseStyle));
        continue;
      }

      final selected =
          _selectedWord != null &&
          _selectedWord!.toLowerCase() == clean.toLowerCase();

      if (selected) {
        var chipLabel = word;
        if (!_wordBusy &&
            _wordTranslation != null &&
            _wordTranslation != '—') {
          chipLabel = _withPunctuation(word, _wordTranslation!);
        }
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: i < wordList.length - 1 ? 4 : 0),
              child: ChatWordChip(
                label: chipLabel,
                onTap: () => _onWordTap(word),
              ),
            ),
          ),
        );
        continue;
      }

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onWordTap(word),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(displayText, style: baseStyle),
            ),
          ),
        ),
      );
    }
    return spans;
  }

  Widget _messageBody(LingolaChatMessage message) {
    if (message.highlight != null && message.rest != null) {
      return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  message.highlight!,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 18 / 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextSpan(
              text: message.rest,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w400,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      );
    }

    return Text.rich(
      TextSpan(children: _buildWordSpans(message.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.72,
            ),
            padding: const EdgeInsets.all(12),
            decoration: chatBubbleDecoration(
              wordSelected: _selectedWord != null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _messageBody(message),
                if (_translating) ...[
                  const SizedBox(height: 8),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                ] else if (_translation != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _translation!,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      height: 18 / 13,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: AppColors.ink.withValues(alpha: .78),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _RoundIconButton(
              asset: AppAssets.translate,
              color: AppColors.primary,
              onTap: _translating ? null : _translateSentence,
            ),
            const SizedBox(width: 6),
            _RoundIconButton(
              asset: AppAssets.speaker,
              color: AppColors.secondary,
              onTap: widget.onSpeak == null ? null : _onSpeak,
            ),
          ],
        ),
      ],
    );
  }
}

class _HintDraftBubble extends StatelessWidget {
  const _HintDraftBubble({
    required this.message,
    required this.enabled,
    required this.onSend,
  });

  final String message;
  final bool enabled;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.72,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 18 / 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: enabled ? onSend : null,
              child: const HomeAsset(
                AppAssets.send,
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 18 / 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.asset,
    required this.color,
    this.onTap,
  });

  final String asset;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: color, width: 1.4)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 34,
          height: 34,
          child: Center(
            child: HomeAsset(
              asset,
              width: 16,
              height: 16,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
