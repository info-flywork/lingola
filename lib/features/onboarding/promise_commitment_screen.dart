import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import 'ai_tutors_intro_screen.dart';
import 'onboarding_draft.dart';

/// Söz verme / onay ekranı — basılı tutunca mavi daire ekranı doldurur.
class PromiseCommitmentScreen extends StatefulWidget {
  const PromiseCommitmentScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PromiseCommitmentScreen> createState() =>
      _PromiseCommitmentScreenState();
}

class _PromiseCommitmentScreenState extends State<PromiseCommitmentScreen>
    with SingleTickerProviderStateMixin {
  static const _holdDuration = Duration(milliseconds: 1400);
  static const _buttonSize = 168.0;

  late final AnimationController _fillController;
  final _buttonKey = GlobalKey();
  final _stackKey = GlobalKey();
  Offset? _buttonCenter;
  var _navigating = false;
  var _holding = false;

  @override
  void initState() {
    super.initState();
    _fillController = AnimationController(vsync: this, duration: _holdDuration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _goNext();
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureButton());
  }

  @override
  void dispose() {
    _fillController.dispose();
    super.dispose();
  }

  void _measureButton() {
    final button = _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (button == null || stack == null || !button.hasSize || !stack.hasSize) {
      return;
    }
    final centerGlobal = button.localToGlobal(button.size.center(Offset.zero));
    setState(() {
      _buttonCenter = stack.globalToLocal(centerGlobal);
    });
  }

  void _onHoldStart(Offset globalPosition) {
    if (_navigating) return;
    _measureButton();
    _holding = true;
    HapticFeedback.mediumImpact();
    _fillController.forward(from: _fillController.value);
    _pulseHaptics();
  }

  Future<void> _pulseHaptics() async {
    while (_holding && mounted && !_navigating) {
      await Future<void>.delayed(const Duration(milliseconds: 180));
      if (!_holding || !mounted || _navigating) break;
      HapticFeedback.selectionClick();
    }
  }

  void _onHoldEnd() {
    _holding = false;
    if (_navigating || _fillController.isCompleted) return;
    _fillController.reverse();
  }

  void _goNext() {
    if (_navigating || !mounted) return;
    _navigating = true;
    _holding = false;
    HapticFeedback.heavyImpact();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 280),
        pageBuilder: (_, animation, secondaryAnimation) =>
            AiTutorsIntroScreen(draft: widget.draft),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.setup;
    final size = MediaQuery.sizeOf(context);
    final maxRadius = math.sqrt(
          size.width * size.width + size.height * size.height,
        ) *
        1.05;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
          animation: _fillController,
          builder: (context, _) {
            final t = Curves.easeInCubic.transform(_fillController.value);
            final hintOpacity = (1.0 - t * 1.35).clamp(0.0, 1.0);
            final fillRadius = _buttonSize / 2 + (maxRadius - _buttonSize / 2) * t;
            final center = _buttonCenter ??
                Offset(size.width / 2, size.height * 0.58);

            return Stack(
              key: _stackKey,
              fit: StackFit.expand,
              children: [
                // Expanding fill — koala'nın altında kalsın.
                if (t > 0)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: _ExpandingCirclePainter(
                          center: center,
                          radius: fillRadius,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
                    child: Column(
                      children: [
                        Text(
                          text.promiseTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            height: 30 / 20,
                            fontWeight: FontWeight.w700,
                            color: Color.lerp(
                              AppColors.ink,
                              Colors.white,
                              t.clamp(0.0, 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          text.promiseBody,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            height: 20 / 16,
                            fontWeight: FontWeight.w500,
                            color: Color.lerp(
                              AppColors.ink.withValues(alpha: 0.65),
                              Colors.white.withValues(alpha: 0.85),
                              t.clamp(0.0, 1.0),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Listener(
                          onPointerDown: (e) => _onHoldStart(e.position),
                          onPointerUp: (_) => _onHoldEnd(),
                          onPointerCancel: (_) => _onHoldEnd(),
                          child: SizedBox(
                            key: _buttonKey,
                            width: _buttonSize,
                            height: _buttonSize,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Image.asset(
                                  'assets/images/onboarding/approvedCoala.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Opacity(
                          opacity: hintOpacity,
                          child: Text(
                            text.promiseHoldHint,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink.withValues(
                                alpha: 0.10 + 0.90 * hintOpacity,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ExpandingCirclePainter extends CustomPainter {
  _ExpandingCirclePainter({
    required this.center,
    required this.radius,
    required this.color,
  });

  final Offset center;
  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(center, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _ExpandingCirclePainter oldDelegate) {
    return oldDelegate.center != center ||
        oldDelegate.radius != radius ||
        oldDelegate.color != color;
  }
}
