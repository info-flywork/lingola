import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_text.dart';
import '../core/theme/app_theme.dart';
import 'app_widgets.dart';
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
    this.sessionLimit,
    this.onSessionExpired,
    this.showBack = true,
    super.key,
  });

  final List<LingolaChatMessage> initialMessages;
  final VoidCallback onClose;
  final String? brand;
  final String? speedLabel;
  final String? lessonBadge;
  final String? typeMessageHint;
  final String? botReply;
  final Duration? sessionLimit;
  final VoidCallback? onSessionExpired;
  final bool showBack;

  @override
  State<LingolaChatSession> createState() => _LingolaChatSessionState();
}

class _LingolaChatSessionState extends State<LingolaChatSession> {
  static const _heroHeight = 340.0;
  static const _pillBg = Color(0x80000000);

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  late final List<LingolaChatMessage> _messages;

  Timer? _ticker;
  Timer? _sessionTimer;
  Duration _elapsed = Duration.zero;
  bool _finished = false;
  bool _voiceMode = false;

  @override
  void initState() {
    super.initState();
    _messages = List<LingolaChatMessage>.of(widget.initialMessages);

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _finished) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    final limit = widget.sessionLimit;
    if (limit != null) {
      _sessionTimer = Timer(limit, _expireSession);
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _sessionTimer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
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
    widget.onClose();
  }

  void _sendMessage([String? override]) {
    final value = (override ?? _controller.text).trim();
    if (value.isEmpty || _finished) return;
    setState(() {
      _messages.add(LingolaChatMessage.user(value));
      final reply = widget.botReply;
      if (reply != null && reply.isNotEmpty) {
        _messages.add(LingolaChatMessage.bot(reply));
      }
      _controller.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
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
                              const _FadedChatRobot(),
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
                        Expanded(
                          child: ColoredBox(
                            color: Colors.white,
                            child: ListView.separated(
                              controller: _scrollController,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              itemCount: _messages.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final message = _messages[index];
                                if (message.isUser) {
                                  return _UserBubble(message.text);
                                }
                                return _BotBubble(message: message);
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
                      onSwitchToKeyboard: () =>
                          setState(() => _voiceMode = false),
                      onMicTap: () {},
                    )
                  : _KeyboardComposer(
                      controller: _controller,
                      hint: hint,
                      onSend: _sendMessage,
                      onMicTap: () => setState(() => _voiceMode = true),
                    ),
            ),
          ],
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
      color: const Color(0x80000000),
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

/// Figma: gradient + layer-blur ellipses behind robot.
class _ChatHeroBackdrop extends StatelessWidget {
  const _ChatHeroBackdrop();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF63B1D9),
                  Color(0xFF63B1D9),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                ],
                stops: [0, 0.22, 0.59, 1],
              ),
            ),
          ),
          Positioned(
            left: -84,
            top: -220,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: Container(
                width: 320,
                height: 320,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D46FF),
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            top: -140,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 75, sigmaY: 75),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF37B2E3),
                ),
              ),
            ),
          ),
          Positioned(
            left: -20,
            top: -80,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D85FF),
                ),
              ),
            ),
          ),
        ],
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
  });

  final TextEditingController controller;
  final String hint;
  final VoidCallback onSend;
  final VoidCallback onMicTap;

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
              onTap: onMicTap,
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
                      onTap: onSend,
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
    required this.onMicTap,
  });

  final VoidCallback onSwitchToKeyboard;
  final VoidCallback onMicTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 18),
      child: Row(
        children: [
          Material(
            color: const Color(0xFFE8EEFF),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onSwitchToKeyboard,
              child: const SizedBox(
                width: 52,
                height: 52,
                child: Center(
                  child: Icon(
                    Icons.chat_bubble_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Material(
            color: AppColors.primary,
            shape: const CircleBorder(),
            elevation: 4,
            shadowColor: AppColors.primary.withValues(alpha: .35),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onMicTap,
              child: const SizedBox(
                width: 72,
                height: 72,
                child: Center(
                  child: HomeAsset(
                    AppAssets.microphone,
                    width: 28,
                    height: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 52),
        ],
      ),
    );
  }
}

class _FadedChatRobot extends StatelessWidget {
  const _FadedChatRobot();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Color(0xB3FFFFFF),
            Color(0x00FFFFFF),
          ],
          stops: [0, 0.55, 0.78, 1],
        ).createShader(bounds);
      },
      child: const LocalPicture(
        'auth/account_robot.png',
        width: 326,
        height: 336,
        fit: BoxFit.contain,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class _BotBubble extends StatelessWidget {
  const _BotBubble({required this.message});

  final LingolaChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black.withValues(alpha: .10)),
            ),
            child: message.highlight == null
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
        const Column(
          children: [
            _RoundIconButton(asset: AppAssets.translate),
            SizedBox(height: 8),
            _RoundIconButton(asset: AppAssets.speaker),
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
  const _RoundIconButton({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {},
        child: Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withValues(alpha: .08)),
          ),
          child: HomeAsset(asset, width: 16, height: 16),
        ),
      ),
    );
  }
}
