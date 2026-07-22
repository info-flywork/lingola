import 'dart:async';
import 'dart:math' show sqrt;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../shell/main_shell.dart';
import 'language_setup_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  /// 0 = app icon, 1 = büyük koala
  int _step = 0;

  @override
  void initState() {
    super.initState();
    _armTimer();
  }

  void _armTimer() {
    _timer?.cancel();
    _timer = Timer(
      Duration(milliseconds: _step == 0 ? 1500 : 1600),
      () {
        if (!mounted) return;
        if (_step == 0) {
          setState(() => _step = 1);
          _armTimer();
          return;
        }
        Navigator.of(context).pushReplacement(
          PageRouteBuilder<void>(
            pageBuilder: (_, _, _) => const OnboardingScreen(),
            transitionsBuilder: (_, animation, _, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 420),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primary,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: _DesignSurface(
          // Figma 430×852 ölçeği — koala 401×387 @ y:499 birebir.
          fit: BoxFit.fitWidth,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 480),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: _step == 0
                ? const _IconSplashVisual(key: ValueKey('icon'))
                : const _KoalaSplashVisual(key: ValueKey('koala')),
          ),
        ),
      ),
    );
  }
}

class _IconSplashVisual extends StatelessWidget {
  const _IconSplashVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    // Figma: icon 178×178 @ (134, 265); Lingola Quicksand Bold 64 altında.
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned.fill(child: _OnboardingBackground()),
        const Positioned(
          left: 126,
          top: 265,
          width: 178,
          height: 178,
          child: LocalPicture(
            'lingolaAppIcon.png',
            fit: BoxFit.contain,
            width: 178,
            height: 178,
          ),
        ),
        Positioned(
          top: 463,
          left: 0,
          right: 0,
          child: Text(
            text.app.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontFamily: 'Quicksand',
              fontSize: 64,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _KoalaSplashVisual extends StatelessWidget {
  const _KoalaSplashVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    // Figma Layer 1: x:14 y:499 w:401 h:387
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned.fill(child: _OnboardingBackground()),
        Positioned(
          top: 346,
          left: 0,
          right: 0,
          child: Text(
            text.app.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontFamily: 'Quicksand',
              fontSize: 64,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          left: 14,
          top: 499,
          width: 401,
          height: 387,
          child: LocalPicture(
            'koala.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            width: 401,
            height: 387,
          ),
        ),
      ],
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  void _continue() {
    if (_page < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const LanguageSetupScreen(),
      ),
    );
  }

  void _goBack() {
    if (_page <= 0) return;
    _controller.previousPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primary,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Semantics(
          label: text.onboarding.pageA11y(current: _page + 1, total: 3),
          child: PageView(
            controller: _controller,
            onPageChanged: (value) => setState(() => _page = value),
            children: [
              _OnboardingPage(
                pageIndex: 0,
                title: text.onboarding.slide1.title,
                body: text.onboarding.slide1.body,
                visual: const _SpeakerVisual(),
                onContinue: _continue,
                onSkipToHome: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(builder: (_) => const MainShell()),
                  );
                },
              ),
              _OnboardingPage(
                pageIndex: 1,
                title: text.onboarding.slide2.title,
                body: text.onboarding.slide2.body,
                visual: const _TutorComparison(),
                onContinue: _continue,
                onBack: _goBack,
              ),
              _OnboardingPage(
                pageIndex: 2,
                title: text.onboarding.slide3.title,
                body: text.onboarding.slide3.body,
                visual: const _PlanVisual(),
                onContinue: _continue,
                onBack: _goBack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.pageIndex,
    required this.title,
    required this.body,
    required this.visual,
    required this.onContinue,
    this.onSkipToHome,
    this.onBack,
  });

  final int pageIndex;
  final String title;
  final String body;
  final Widget visual;
  final VoidCallback onContinue;
  final VoidCallback? onSkipToHome;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    // Figma: beyaz kart mavi gradient üzerinde yüzer; kartın altında mavi şerit kalır.
    return ColoredBox(
      color: AppColors.primary,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: _DesignSurface(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  const Positioned.fill(child: _OnboardingBackground()),
                  Positioned.fill(child: visual),
                ],
              ),
            ),
          ),
          if (onBack != null)
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              left: 16,
              child: TextButton(
                onPressed: onBack,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black.withValues(alpha: .25),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: Text(
                  text.common.back,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (onSkipToHome != null)
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              right: 16,
              child: TextButton(
                onPressed: onSkipToHome,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black.withValues(alpha: .25),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16 + bottomInset,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.onboardingTitle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      body,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.onboardingBody,
                    ),
                    const SizedBox(height: 20),
                    _PageDots(activeIndex: pageIndex),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      label: text.common.continueLabel,
                      onPressed: onContinue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeakerVisual extends StatelessWidget {
  const _SpeakerVisual();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          left: 82.5,
          top: 200,
          width: 265,
          height: 404,
          child: LocalPicture(
            'onboarding_speaker.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Positioned(
          left: 43.5,
          top: 149,
          width: 343,
          height: 73,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0x33B7B7B7),
              border: Border.all(color: const Color(0xFFB6B6B6)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 9, 14, 8),
              child: Row(
                children: [
                  const ClipOval(
                    child: SizedBox(
                      width: 51,
                      height: 51,
                      child: LocalPicture(
                        'onboarding/testimonial_avatar.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                text.onboarding.slide1.testimonialName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  height: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.filled(
                                5,
                                const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFF8848),
                                  size: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          text.onboarding.slide1.testimonialBody,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0x99000000),
                            fontSize: 12,
                            height: 16 / 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TutorComparison extends StatelessWidget {
  const _TutorComparison();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Stack(
      children: [
        Positioned(
          left: 27,
          top: 116,
          width: 142,
          height: 362,
          child: _TutorCard(
            image: 'tutors/realTutor.png',
            name: text.onboarding.slide2.realTutor,
            values: [
              text.onboarding.slide2.priceReal,
              text.onboarding.slide2.scheduled,
              text.onboarding.slide2.stressful,
            ],
          ),
        ),
        Positioned(
          right: 27,
          top: 116,
          width: 142,
          height: 362,
          child: _TutorCard(
            image: 'tutors/lingolaTutor.png',
            name: text.onboarding.slide2.lingola,
            values: [
              text.onboarding.slide2.priceLingola,
              text.onboarding.slide2.anytime,
              text.onboarding.slide2.noPressure,
            ],
            highlighted: true,
          ),
        ),
        Positioned(
          left: 194,
          top: 208,
          width: 42,
          height: 42,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text.onboarding.slide2.versus,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 214.5,
          top: 149,
          width: 1,
          height: 59,
          child: ColoredBox(color: Color(0x66000000)),
        ),
        const Positioned(
          left: 214.5,
          top: 250,
          width: 1,
          height: 59,
          child: ColoredBox(color: Color(0x66000000)),
        ),
      ],
    );
  }
}

class _TutorCard extends StatelessWidget {
  const _TutorCard({
    required this.image,
    required this.name,
    required this.values,
    this.highlighted = false,
  });

  final String image;
  final String name;
  final List<String> values;
  final bool highlighted;

  static const _muted = Color(0x80000000); // #000000 @ 50%

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final labels = [
      text.onboarding.slide2.price,
      text.onboarding.slide2.availability,
      text.onboarding.slide2.feeling,
    ];

    return Container(
      width: 142,
      height: 362,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: highlighted ? const Color(0xFFFCFCFE) : const Color(0x33FFFFFF),
        border: Border.all(
          color: highlighted ? AppColors.primary : AppColors.border10,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipOval(
            child: SizedBox(
              width: 122,
              height: 122,
              child: LocalPicture(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: highlighted ? AppColors.primary : _muted,
              fontSize: 20,
              height: 24 / 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 20 * -0.02,
            ),
          ),
          const SizedBox(height: 10),
          for (var index = 0; index < values.length; index++) ...[
            if (index > 0) const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: Color(0x33000000)),
            const SizedBox(height: 10),
            Text(
              labels[index].toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: _muted,
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 14 * -0.02,
              ),
            ),
            Text(
              values[index],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: highlighted && index > 0
                    ? AppColors.success
                    : highlighted
                        ? AppColors.primary
                        : _muted,
                fontSize: 16,
                height: 20 / 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 16 * -0.02,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlanVisual extends StatelessWidget {
  const _PlanVisual();

  @override
  Widget build(BuildContext context) {
    // Figma 430×852 — 88173 1: x:-82.5 y:205 w:595 h:396
    // Group 331: x:62 y:110 w:307 h:228
    // Görsel frame dışına taşar; Stack clip + kart üstü örtüşmesi Figma ile aynı.
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned(
          left: -82.5,
          top: 205,
          width: 595,
          height: 396,
          child: LocalPicture(
            'learning_plan.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        const Positioned(
          left: 62,
          top: 110,
          width: 307,
          height: 228,
          child: _PlanPathDiagram(),
        ),
      ],
    );
  }
}

class _PlanPathDiagram extends StatelessWidget {
  const _PlanPathDiagram();

  // Figma Group 331 (307×228) içi daire merkezleri
  static const _practice = Offset(65, 48);
  static const _goal = Offset(28, 175);
  static const _progress = Offset(279, 102);

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return LayoutBuilder(
      builder: (context, constraints) {
        final scaleX = constraints.maxWidth / 307;
        final scaleY = constraints.maxHeight / 228;
        Offset map(Offset o) => Offset(o.dx * scaleX, o.dy * scaleY);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _PlanPathPainter(scaleX: scaleX, scaleY: scaleY),
            ),
            _PlanNode(
              emoji: '🗣️',
              label: text.onboarding.slide3.practice,
              center: map(_practice),
              labelOffset: Offset(0, -34 * scaleY),
            ),
            _PlanNode(
              emoji: '🎯',
              label: text.onboarding.slide3.goal,
              center: map(_goal),
              labelOffset: Offset(0, 36 * scaleY),
            ),
            _PlanNode(
              emoji: '📈',
              label: text.onboarding.slide3.progress,
              center: map(_progress),
              labelOffset: Offset(0, 36 * scaleY),
            ),
          ],
        );
      },
    );
  }
}

class _PlanPathPainter extends CustomPainter {
  _PlanPathPainter({required this.scaleX, required this.scaleY});

  final double scaleX;
  final double scaleY;

  Offset _m(Offset o) => Offset(o.dx * scaleX, o.dy * scaleY);

  /// İki daire kenarını birleştiren düz çizgi (yarıçap 28).
  void _lineBetweenCircles(Canvas canvas, Paint paint, Offset a, Offset b) {
    const r = 28.0;
    final dx = b.dx - a.dx;
    final dy = b.dy - a.dy;
    final len = sqrt(dx * dx + dy * dy);
    if (len < r * 2) return;
    final ux = dx / len;
    final uy = dy / len;
    canvas.drawLine(
      Offset(a.dx + ux * r, a.dy + uy * r),
      Offset(b.dx - ux * r, b.dy - uy * r),
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    final practice = _m(_PlanPathDiagram._practice);
    final goal = _m(_PlanPathDiagram._goal);
    final progress = _m(_PlanPathDiagram._progress);

    // Sol: Practice ↔ Goal (düz, kenardan kenara)
    _lineBetweenCircles(canvas, paint, practice, goal);
    // Sağ: Practice ↔ Progress
    _lineBetweenCircles(canvas, paint, practice, progress);
  }

  @override
  bool shouldRepaint(covariant _PlanPathPainter oldDelegate) =>
      oldDelegate.scaleX != scaleX || oldDelegate.scaleY != scaleY;
}

class _PlanNode extends StatelessWidget {
  const _PlanNode({
    required this.emoji,
    required this.label,
    required this.center,
    required this.labelOffset,
  });

  final String emoji;
  final String label;
  final Offset center;
  final Offset labelOffset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: center.dx - 28,
          top: center.dy - 28,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              emoji,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                height: 1,
              ),
            ),
          ),
        ),
        Positioned(
          left: center.dx + labelOffset.dx - 40,
          top: center.dy + labelOffset.dy - 10,
          width: 80,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 14,
              height: 20 / 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) => Container(
            width: index == activeIndex ? 8 : 6,
            height: index == activeIndex ? 8 : 6,
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? AppColors.primary
                  : const Color(0xFFD7DCFF),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingBackground extends StatelessWidget {
  const _OnboardingBackground();

  /// Figma / onboarding_background.svg: feGaussianBlur stdDeviation=50
  /// → filter pad ≈ 100 (circle + blur taşması).
  static const _blurPad = 100.0;
  static const _blurSigma = 50.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        // SVG linearGradient: alt #63B1D9 → üst white (dalga blur’lardan gelir)
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.onboardingSky,
                  AppColors.onboardingSky,
                  Colors.white,
                  Colors.white,
                ],
                stops: [0, 0.221154, 0.591346, 1],
              ),
            ),
          ),
        ),
        // Ellipse 8: x:-22 y:448 490×490 #2D85FF
        _blurCircle(
          left: -22,
          top: 448,
          size: 490,
          color: AppColors.onboardingBlue,
        ),
        // Ellipse 10: x:-81 y:516 594×594 #37B2E3
        _blurCircle(
          left: -81,
          top: 516,
          size: 594,
          color: const Color(0xFF37B2E3),
        ),
        // Ellipse 9: x:-65 y:659 559×558 #2D46FF
        _blurCircle(
          left: -65,
          top: 659,
          size: 559,
          color: AppColors.primary,
        ),
      ],
    );
  }

  static Widget _blurCircle({
    required double left,
    required double top,
    required double size,
    required Color color,
  }) {
    return Positioned(
      left: left - _blurPad,
      top: top - _blurPad,
      width: size + _blurPad * 2,
      height: size + _blurPad * 2,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: _blurSigma,
          sigmaY: _blurSigma,
          tileMode: TileMode.decal,
        ),
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _DesignSurface extends StatelessWidget {
  const _DesignSurface({
    required this.child,
    this.fit = BoxFit.fitWidth,
  });

  final Widget child;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // fitWidth + topCenter uzun ekranlarda altta boşluk bırakır; Figma'da
    // bu alan mavi gradient devamıdır, beyaz scaffold değil.
    // Splash’ta contain: kısa ekranlarda koala alttan kesilmesin.
    return ColoredBox(
      color: AppColors.primary,
      child: SizedBox.expand(
        child: FittedBox(
          fit: fit,
          alignment: Alignment.topCenter,
          child: SizedBox(width: 430, height: 852, child: child),
        ),
      ),
    );
  }
}
