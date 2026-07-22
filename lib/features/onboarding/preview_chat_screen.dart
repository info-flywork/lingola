import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'post_onboarding_screens.dart';

class PreviewChatScreen extends StatefulWidget {
  const PreviewChatScreen({super.key});

  @override
  State<PreviewChatScreen> createState() => _PreviewChatScreenState();
}

class _PreviewChatScreenState extends State<PreviewChatScreen> {
  static const _sessionDuration = Duration(minutes: 1);

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _messages = <_ChatMessage>[];

  Timer? _ticker;
  Timer? _sessionTimer;
  Duration _elapsed = Duration.zero;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    final text = AppText.current.previewChat;
    _messages.addAll([
      _ChatMessage.bot(text.incoming1),
      _ChatMessage.user(text.outgoing1),
      _ChatMessage.botHighlighted(
        highlight: text.incoming2Highlight,
        rest: text.incoming2Rest,
      ),
    ]);

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _finished) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    _sessionTimer = Timer(_sessionDuration, _finishPreview);
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

  void _finishPreview() {
    if (_finished || !mounted) return;
    _finished = true;
    _ticker?.cancel();
    _sessionTimer?.cancel();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
    );
  }

  void _sendMessage() {
    final value = _controller.text.trim();
    if (value.isEmpty || _finished) return;
    final text = AppText.current.previewChat;
    setState(() {
      _messages.add(_ChatMessage.user(value));
      _messages.add(_ChatMessage.bot(text.botReply));
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
    final text = AppText.current.previewChat;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
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
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 280,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF8EC8FF),
                            Color(0xFFD7ECFF),
                            Colors.white,
                          ],
                          stops: [0, .55, 1],
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                          child: Row(
                            children: [
                              IconButton(
                                tooltip: AppText.current.common.back,
                                onPressed: _finishPreview,
                                icon: const Icon(Icons.chevron_left_rounded),
                              ),
                              Expanded(
                                child: Text(
                                  text.brand,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.ink,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFF3B30),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _timerLabel,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  IconButton(
                                    tooltip: AppText.current.common.close,
                                    onPressed: _finishPreview,
                                    icon: const Icon(Icons.close_rounded),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 280,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              const _FadedChatRobot(),
                              Positioned(
                                left: 16,
                                top: 18,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0x99000000),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Text(
                                    text.speed,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 16,
                                top: 24,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    text.lessonBadge,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
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
                        onTap: () {},
                        child: SizedBox(
                          width: 46,
                          height: 46,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/microphone.svg',
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
                                controller: _controller,
                                textInputAction: TextInputAction.send,
                                onSubmitted: (_) => _sendMessage(),
                                decoration: InputDecoration(
                                  hintText: text.typeMessage,
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
                            // Figma: ampül + send (33×33) input içinde, gap 10
                            SvgPicture.asset(
                              'assets/images/ampul.svg',
                              width: 18,
                              height: 22,
                            ),
                            const SizedBox(width: 10),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: _sendMessage,
                                child: SvgPicture.asset(
                                  'assets/images/oksign.svg',
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
              ),
            ),
          ],
        ),
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

class _ChatMessage {
  const _ChatMessage._({
    required this.isUser,
    required this.text,
    this.highlight,
    this.rest,
  });

  factory _ChatMessage.user(String text) =>
      _ChatMessage._(isUser: true, text: text);

  factory _ChatMessage.bot(String text) =>
      _ChatMessage._(isUser: false, text: text);

  factory _ChatMessage.botHighlighted({
    required String highlight,
    required String rest,
  }) {
    return _ChatMessage._(
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

class _BotBubble extends StatelessWidget {
  const _BotBubble({required this.message});

  final _ChatMessage message;

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
        Column(
          children: [
            _RoundIconButton(
              asset: 'assets/images/translate.svg',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _RoundIconButton(
              asset: 'assets/images/speaker.svg',
              onTap: () {},
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
  const _RoundIconButton({required this.asset, required this.onTap});

  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withValues(alpha: .08)),
          ),
          child: SvgPicture.asset(asset, width: 16, height: 16),
        ),
      ),
    );
  }
}
