import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:rive/rive.dart' show Fit;

import '../core/auth/api_client.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_text.dart';
import '../core/theme/app_theme.dart';
import '../features/tutor/services/openai_chat_service.dart';
import '../features/tutor/services/tutor_tts_service.dart';
import '../features/tutor/widgets/tutor_rive_avatar.dart';
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
    super.key,
  });

  final List<LingolaChatMessage> initialMessages;
  final VoidCallback onClose;
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
  final VoidCallback? onSessionExpired;
  final bool showBack;
  final bool busy;
  final String? errorText;
  final VoidCallback? onRetry;

  @override
  State<LingolaChatSession> createState() => _LingolaChatSessionState();
}

class _LingolaChatSessionState extends State<LingolaChatSession> {
  static const _heroHeight = 340.0;
  static const _pillBg = Color(0x80000000);

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  late final List<LingolaChatMessage> _messages;
  final _tts = TutorTtsService();
  final _player = AudioPlayer();
  final _recorder = AudioRecorder();
  final _stt = OpenAiChatService();
  StreamSubscription<void>? _playerCompleteSub;

  Timer? _ticker;
  Timer? _sessionTimer;
  Duration _elapsed = Duration.zero;
  bool _finished = false;
  bool _voiceMode = false;
  bool _sending = false;
  bool _recording = false;
  bool _speaking = false;
  String? _localError;
  String? _recordingPath;

  @override
  void initState() {
    super.initState();
    _messages = List<LingolaChatMessage>.of(widget.initialMessages);
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() => _speaking = false);
    });

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _finished) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    final limit = widget.sessionLimit;
    if (limit != null) {
      _sessionTimer = Timer(limit, _expireSession);
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
  }

  @override
  void didUpdateWidget(covariant LingolaChatSession oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialMessages != widget.initialMessages &&
        widget.initialMessages.length > _messages.length) {
      setState(() {
        _messages
          ..clear()
          ..addAll(widget.initialMessages);
      });
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _sessionTimer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    unawaited(_playerCompleteSub?.cancel());
    unawaited(_player.dispose());
    unawaited(_disposeRecorder());
    _tts.dispose();
    _stt.dispose();
    super.dispose();
  }

  Future<void> _disposeRecorder() async {
    try {
      if (await _recorder.isRecording()) await _recorder.stop();
    } catch (_) {}
    await _recorder.dispose();
  }

  String get _timerLabel {
    final total = _elapsed.inSeconds.clamp(0, 59 * 60 + 59);
    final hours = (total ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((total % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (total % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void _expireSession() {
    if (_finished || !mounted) return;
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    (widget.onSessionExpired ?? widget.onClose)();
  }

  void _handleClose() {
    if (_finished) return;
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    unawaited(_player.stop());
    widget.onClose();
  }

  Future<void> _speak(String text) async {
    if (!widget.enableTts || text.trim().isEmpty) return;
    try {
      await _player.stop();
      if (mounted) setState(() => _speaking = true);
      final file = await _tts.synthesizeToFile(
        text,
        voiceId: widget.ttsVoiceId,
      );
      await _player.play(DeviceFileSource(file.path));
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _speaking = false;
        _localError = e.toString();
      });
    }
  }

  Future<void> _sendMessage([String? override]) async {
    final value = (override ?? _controller.text).trim();
    if (value.isEmpty || _finished || _sending || widget.busy) return;

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
        reply = await asyncSend(value);
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
        _localError = e is ApiException ? e.message : e.toString();
      });
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _startMic() async {
    if (!widget.enableMic || _recording || _sending || _finished) return;
    await _player.stop();

    final ok = await _recorder.hasPermission();
    if (!ok) {
      setState(() => _localError = 'Mikrofon izni gerekli');
      return;
    }

    try {
      final dir = await getTemporaryDirectory();
      _recordingPath =
          '${dir.path}/roleplay_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          sampleRate: 44100,
          numChannels: 1,
          bitRate: 128000,
        ),
        path: _recordingPath!,
      );
      if (!mounted) return;
      HapticFeedback.mediumImpact();
      setState(() {
        _recording = true;
        _localError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _localError = 'Kayıt başlatılamadı: $e');
    }
  }

  Future<void> _stopMicAndSend() async {
    if (!_recording) return;
    setState(() => _recording = false);
    HapticFeedback.lightImpact();

    try {
      final path = await _recorder.stop();
      final filePath = path ?? _recordingPath;
      if (filePath == null || !File(filePath).existsSync()) {
        setState(() => _localError = 'Kayıt alınamadı — basılı tutup konuş');
        return;
      }
      final file = File(filePath);
      if (await file.length() < 200) {
        setState(() => _localError = 'Ses çok kısa — basılı tut (1–2 sn)');
        return;
      }
      final text = (await _stt.transcribe(file)).trim();
      try {
        await file.delete();
      } catch (_) {}
      if (text.isEmpty) {
        setState(() => _localError = 'Ses anlaşılamadı — tekrar dene');
        return;
      }
      await _sendMessage(text);
    } catch (e) {
      if (!mounted) return;
      setState(() => _localError = e.toString());
    } finally {
      _recordingPath = null;
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
    final preview = AppText.current.previewChat;
    final brand = widget.brand ?? preview.brand;
    final speed = widget.speedLabel ?? preview.speed;
    final hint = widget.typeMessageHint ?? preview.typeMessage;
    final topInset = MediaQuery.paddingOf(context).top;
    final error = widget.errorText ?? _localError;
    final blocked = _sending || widget.busy;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: topInset + _heroHeight,
                    child: const _ChatHeroBackdrop(),
                  ),
                  SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                          child: Row(
                            children: [
                              _GlassCircleButton(
                                size: 30,
                                onTap: widget.showBack ? _handleClose : () {},
                                child: const HomeAsset(
                                  AppAssets.rolePlayResize,
                                  width: 14,
                                  height: 14,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
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
                        ),
                        SizedBox(
                          height: _heroHeight - 48,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              _ChatRobotHero(
                                riveAsset: widget.riveAsset,
                                talking: _speaking,
                                fallbackImage:
                                    widget.fallbackImage ?? AppAssets.tutorRobot,
                              ),
                              Positioned(
                                left: 16,
                                bottom: 24,
                                child: Container(
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
                              ),
                            ],
                          ),
                        ),
                        if (error != null)
                          Material(
                            color: const Color(0xFFFFEBEE),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
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
                                      child: Text(
                                        AppText.current.common.tryAgain,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        Expanded(
                          child: ColoredBox(
                            color: Colors.white,
                            child: widget.busy && _messages.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  )
                                : ListView.separated(
                                    controller: _scrollController,
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      8,
                                      16,
                                      16,
                                    ),
                                    itemCount:
                                        _messages.length + (blocked ? 1 : 0),
                                    separatorBuilder: (_, _) =>
                                        const SizedBox(height: 12),
                                    itemBuilder: (context, index) {
                                      if (index >= _messages.length) {
                                        return const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: SizedBox(
                                              width: 22,
                                              height: 22,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: AppColors.primary,
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
                                        onSpeak: widget.enableTts
                                            ? () => _speak(message.text)
                                            : null,
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: _voiceMode
                  ? _VoiceComposer(
                      recording: _recording,
                      statusText: _recording
                          ? AppText.current.previewChat.recording
                          : AppText.current.previewChat.holdToSpeak,
                      onSwitchToKeyboard: () =>
                          setState(() => _voiceMode = false),
                      onMicDown: _startMic,
                      onMicUp: _stopMicAndSend,
                    )
                  : _KeyboardComposer(
                      controller: _controller,
                      hint: hint,
                      enabled: !blocked,
                      onSend: () => unawaited(_sendMessage()),
                      onMicTap: widget.enableMic
                          ? () => setState(() => _voiceMode = true)
                          : () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatHeroBackdrop extends StatelessWidget {
  const _ChatHeroBackdrop();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF7EB6FF),
            Color(0xFFB8D9FF),
            Color(0xFFFFFFFF),
          ],
          stops: [0, 0.55, 1],
        ),
      ),
    );
  }
}

class _ChatRobotHero extends StatelessWidget {
  const _ChatRobotHero({
    required this.talking,
    this.riveAsset,
    this.fallbackImage,
  });

  final String? riveAsset;
  final bool talking;
  final String? fallbackImage;

  @override
  Widget build(BuildContext context) {
    final image = fallbackImage ?? AppAssets.tutorRobot;
    if (riveAsset == null || riveAsset!.isEmpty) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: HomeAsset(
          image,
          height: 280,
          fit: BoxFit.contain,
        ),
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: TutorRiveAvatar(
          assetPath: riveAsset!,
          talking: talking,
          fallbackImage: image,
          fit: Fit.contain,
          alignment: Alignment.bottomCenter,
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

class _KeyboardComposer extends StatelessWidget {
  const _KeyboardComposer({
    required this.controller,
    required this.hint,
    required this.onSend,
    required this.onMicTap,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String hint;
  final VoidCallback onSend;
  final VoidCallback onMicTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            shape: const CircleBorder(),
            elevation: 1.5,
            shadowColor: Colors.black26,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: enabled ? onMicTap : null,
              child: const SizedBox(
                width: 46,
                height: 46,
                child: Center(
                  child: HomeAsset(
                    AppAssets.microphone,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.only(left: 16, right: 8),
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
                      onSubmitted: (_) => onSend(),
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
                  const HomeAsset(
                    AppAssets.lightbulb,
                    width: 18,
                    height: 22,
                  ),
                  const SizedBox(width: 10),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: enabled ? onSend : null,
                      child: const HomeAsset(
                        AppAssets.send,
                        width: 33,
                        height: 33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VoiceComposer extends StatelessWidget {
  const _VoiceComposer({
    required this.onSwitchToKeyboard,
    required this.onMicDown,
    required this.onMicUp,
    this.recording = false,
    this.statusText,
  });

  final VoidCallback onSwitchToKeyboard;
  final Future<void> Function() onMicDown;
  final Future<void> Function() onMicUp;
  final bool recording;
  final String? statusText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: const Color(0xFFE8F1FF),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onSwitchToKeyboard,
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.chat_bubble_rounded, color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(width: 28),
              Listener(
                onPointerDown: (_) => unawaited(onMicDown()),
                onPointerUp: (_) => unawaited(onMicUp()),
                onPointerCancel: (_) => unawaited(onMicUp()),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: recording ? 80 : 72,
                  height: recording ? 80 : 72,
                  decoration: BoxDecoration(
                    color: recording ? const Color(0xFFEF3F3F) : AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (recording ? const Color(0xFFEF3F3F) : AppColors.primary)
                            .withValues(alpha: recording ? 0.5 : 0.35),
                        blurRadius: recording ? 22 : 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: recording
                        ? const Icon(Icons.mic_rounded, color: Colors.white, size: 32)
                        : const HomeAsset(
                            AppAssets.microphone,
                            width: 28,
                            height: 28,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          if (statusText != null) ...[
            const SizedBox(height: 10),
            Text(
              statusText!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: recording ? const Color(0xFFEF3F3F) : AppColors.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BotBubble extends StatelessWidget {
  const _BotBubble({required this.message, this.onSpeak});

  final LingolaChatMessage message;
  final VoidCallback? onSpeak;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.72,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black.withValues(alpha: .06)),
            ),
            child: message.highlight == null || message.rest == null
                ? Text(
                    message.text,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.ink,
                    ),
                  )
                : Text.rich(
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
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            const _RoundIconButton(asset: AppAssets.translate),
            const SizedBox(height: 8),
            _RoundIconButton(
              asset: AppAssets.speaker,
              onTap: onSpeak,
            ),
          ],
        ),
      ],
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
  const _RoundIconButton({required this.asset, this.onTap});

  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF3F4F6),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: HomeAsset(asset, width: 16, height: 16),
          ),
        ),
      ),
    );
  }
}
