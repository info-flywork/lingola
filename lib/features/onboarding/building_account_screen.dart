import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart' as rive;

import '../../core/auth/session_store.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../features/tutor/widgets/tutor_rive_avatar.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/app_widgets.dart';
import '../profile/interests_sheet.dart';
import 'onboarding_draft.dart';
import 'post_onboarding_screens.dart';

class AccountCreatingScreen extends StatefulWidget {
  const AccountCreatingScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<AccountCreatingScreen> createState() => _AccountCreatingScreenState();
}

class _AccountCreatingScreenState extends State<AccountCreatingScreen>
    with TickerProviderStateMixin {
  static const _panelCount = 4;
  static const _pageSlideMs = 400;
  static const _page1AtMs = 4200;
  static const _page2AtMs = 8400;
  static const _page3AtMs = 12600;
  static const _comparisonFillMs = 2000;
  static const _chartFillMs = 2400;
  static const _barCompleteMs = 1200;
  static const _planEntryMs = 1200;
  static const _buttonSlideMs = 400;
  static const _pitchSlideMs = 420;
  static const _buttonRevealAt = 0.96;

  static const _pageSlideDuration = Duration(milliseconds: _pageSlideMs);
  static const _comparisonFillDuration =
      Duration(milliseconds: _comparisonFillMs);
  static const _chartFillDuration = Duration(milliseconds: _chartFillMs);
  static const _progressMin = 0.08;
  static const _progressPrePlanMax = 0.96;
  static const _planReadyAtMs =
      _page1AtMs +
      _pageSlideMs +
      220 +
      (_page2AtMs - _page1AtMs - 220) +
      _pitchSlideMs +
      _pageSlideMs +
      220 +
      (_page3AtMs - _page2AtMs - 220) +
      _pitchSlideMs +
      _pageSlideMs;

  static const _personAssets = [
    'assets/images/onboarding/person1.png',
    'assets/images/onboarding/person2.png',
    'assets/images/onboarding/person3.png',
    'assets/images/onboarding/person4.png',
    'assets/images/onboarding/person5.png',
  ];

  static const _personLayout = <(double dx, double dy, double size)>[
    (0.14, 0.18, 56),
    (0.22, 0.62, 52),
    (0.46, 0.14, 54),
    (0.52, 0.58, 50),
    (0.78, 0.28, 56),
  ];

  late final AnimationController _progressController;
  late final AnimationController _barCompleteController;
  late final AnimationController _planEntryController;
  late final AnimationController _buttonController;
  late final AnimationController _comparisonPitchEnterController;
  late final AnimationController _comparisonPitchExitController;
  late final AnimationController _fluencyPitchEnterController;
  late final AnimationController _fluencyPitchExitController;
  late final PageController _pageController;
  var _currentPage = 0;
  var _comparisonActive = false;
  var _chartActive = false;
  var _planReadyActive = false;
  var _buttonAnimStarted = false;
  var _showComparisonPitch = false;
  var _showFluencyPitch = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _planReadyAtMs),
    );
    _barCompleteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _barCompleteMs),
    );
    _planEntryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _planEntryMs),
    );
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _buttonSlideMs),
    );
    _comparisonPitchEnterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _pitchSlideMs),
    );
    _comparisonPitchExitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _pitchSlideMs),
    );
    _fluencyPitchEnterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _pitchSlideMs),
    );
    _fluencyPitchExitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _pitchSlideMs),
    );
    _progressController.addListener(_onProgressTick);
    _barCompleteController.addListener(_onProgressTick);
    _progressController.forward();
    unawaited(_schedulePanelSlides());
  }

  void _onProgressTick() {
    if (_planReadyActive &&
        !_buttonAnimStarted &&
        _displayProgress >= _buttonRevealAt) {
      _buttonAnimStarted = true;
      unawaited(_buttonController.forward());
    }
    if (mounted) setState(() {});
  }

  double get _displayProgress {
    if (_planReadyActive) {
      return _progressPrePlanMax +
          (1 - _progressPrePlanMax) * _barCompleteController.value;
    }
    final t = Curves.easeInOut.transform(_progressController.value);
    return _progressMin + (_progressPrePlanMax - _progressMin) * t;
  }

  Future<void> _runPitchExit(AnimationController controller) async {
    controller.value = 0;
    await controller.forward();
    controller.value = 0;
  }

  Future<void> _transitionToPage(int page) async {
    if (!mounted) return;
    await _pageController.animateToPage(
      page,
      duration: _pageSlideDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _schedulePanelSlides() async {
    await Future<void>.delayed(const Duration(milliseconds: _page1AtMs));
    if (!mounted) return;
    await _transitionToPage(1);
    if (!mounted) return;
    setState(() {
      _currentPage = 1;
      _showComparisonPitch = true;
    });
    unawaited(_comparisonPitchEnterController.forward(from: 0));
    await Future<void>.delayed(const Duration(milliseconds: 220));
    if (!mounted) return;
    setState(() => _comparisonActive = true);

    await Future<void>.delayed(
      Duration(milliseconds: _page2AtMs - _page1AtMs - 220),
    );
    if (!mounted) return;
    await _runPitchExit(_comparisonPitchExitController);
    if (!mounted) return;
    setState(() => _showComparisonPitch = false);
    await _transitionToPage(2);
    if (!mounted) return;
    setState(() {
      _currentPage = 2;
      _showFluencyPitch = true;
    });
    unawaited(_fluencyPitchEnterController.forward(from: 0));
    await Future<void>.delayed(const Duration(milliseconds: 220));
    if (!mounted) return;
    setState(() => _chartActive = true);

    await Future<void>.delayed(
      Duration(milliseconds: _page3AtMs - _page2AtMs - 220),
    );
    if (!mounted) return;
    await _runPitchExit(_fluencyPitchExitController);
    if (!mounted) return;
    setState(() => _showFluencyPitch = false);
    await _transitionToPage(3);
    if (!mounted) return;
    setState(() {
      _currentPage = 3;
      _planReadyActive = true;
    });
    final barDone = _barCompleteController.forward();
    unawaited(_planEntryController.forward());
    await barDone;
  }

  Future<void> _startPlan() async {
    if (!PremiumService.isPremium) {
      await PremiumService.presentPaywall(context);
    }
    if (!mounted) return;
    // Onboarding son adım: hesap oluştur / giriş
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => AuthScreen(draft: widget.draft),
      ),
    );
  }

  @override
  void dispose() {
    _progressController.removeListener(_onProgressTick);
    _barCompleteController.removeListener(_onProgressTick);
    _progressController.dispose();
    _barCompleteController.dispose();
    _planEntryController.dispose();
    _buttonController.dispose();
    _comparisonPitchEnterController.dispose();
    _comparisonPitchExitController.dispose();
    _fluencyPitchEnterController.dispose();
    _fluencyPitchExitController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.accountCreating;
    final readyText = AppText.current.planReady;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: _planReadyActive ? 4 : 12),
              AnimatedSize(
                duration: const Duration(milliseconds: 420),
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                child: _BuildingAccountHero(
                  progress: _displayProgress,
                  formatProgress: (pct) => text.progress(value: pct),
                  outerSize: _planReadyActive ? 176.0 : 270.0,
                  showProgressLabel: !_planReadyActive,
                ),
              ),
              SizedBox(height: _planReadyActive ? 6 : 16),
              _BuildingTitle(
                line1: _planReadyActive ? readyText.titleLine1 : text.titleLine1,
                line2: _planReadyActive ? readyText.titleLine2 : text.titleLine2,
                showReady: _planReadyActive,
                fontSize: _planReadyActive ? 24.0 : 28.0,
              ),
              if (_showComparisonPitch || _showFluencyPitch) ...[
                const SizedBox(height: 12),
                AnimatedSize(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.topCenter,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.topCenter,
                    children: [
                      if (_showComparisonPitch)
                        _BuildingPitchBanner(
                          text: text.comparisonPitch,
                          enter: _comparisonPitchEnterController,
                          exit: _comparisonPitchExitController,
                        ),
                      if (_showFluencyPitch)
                        _BuildingPitchBanner(
                          text: text.fluencyPitch,
                          enter: _fluencyPitchEnterController,
                          exit: _fluencyPitchExitController,
                        ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: _planReadyActive ? 12 : 8),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _MapPhasePage(
                              quote: text.testimonialQuote,
                              author: text.testimonialAuthor,
                              personAssets: _personAssets,
                              personLayout: _personLayout,
                            ),
                            _ComparisonSection(
                              aloneCount: text.comparisonAloneCount,
                              lingolaCount: text.comparisonLingolaCount,
                              unitLabel: text.comparisonUnit,
                              aloneLabel: text.comparisonAloneLabel,
                              lingolaLabel: text.comparisonLingolaLabel,
                              fillDuration: _comparisonFillDuration,
                              animate: _comparisonActive,
                            ),
                            _FluencyGrowthSection(
                              todayLabel: text.chartToday,
                              midLabel: text.chartMid,
                              endLabel: text.chartEnd,
                              fillDuration: _chartFillDuration,
                              animate: _chartActive,
                            ),
                            _PlanReadyPanel(
                              draft: widget.draft,
                              entry: _planEntryController,
                              active: _planReadyActive,
                            ),
                          ],
                        ),
                      ),
                      if (!_planReadyActive) ...[
                        const SizedBox(height: 8),
                        _BuildingPageDots(
                          count: _panelCount - 1,
                          index: _currentPage.clamp(0, _panelCount - 2),
                        ),
                        SizedBox(height: bottomInset > 0 ? bottomInset + 8 : 16),
                      ],
                    ],
                  ),
              ),
              AnimatedBuilder(
                animation: _buttonController,
                builder: (context, _) {
                  if (!_buttonAnimStarted) {
                    if (_planReadyActive) {
                      return SizedBox(height: bottomInset > 0 ? bottomInset + 8 : 16);
                    }
                    return const SizedBox.shrink();
                  }
                  final t = Curves.easeOutCubic.transform(_buttonController.value);
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFECECEC), width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        10,
                        16,
                        10,
                        bottomInset > 0 ? bottomInset + 6 : 24,
                      ),
                      child: Transform.translate(
                        offset: Offset(0, 72 * (1 - t)),
                        child: Opacity(
                          opacity: t.clamp(0.0, 1.0),
                          child: PrimaryButton(
                            label: readyText.startPlan,
                            onPressed: _startPlan,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapPhasePage extends StatefulWidget {
  const _MapPhasePage({
    required this.quote,
    required this.author,
    required this.personAssets,
    required this.personLayout,
  });

  final String quote;
  final String author;
  final List<String> personAssets;
  final List<(double dx, double dy, double size)> personLayout;

  @override
  State<_MapPhasePage> createState() => _MapPhasePageState();
}

class _MapPhasePageState extends State<_MapPhasePage> {
  var _showQuote = false;
  var _showMap = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 550), () {
      if (!mounted) return;
      setState(() => _showQuote = true);
    });
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() => _showMap = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedOpacity(
            opacity: _showQuote ? 1 : 0,
            duration: const Duration(milliseconds: 650),
            curve: Curves.easeOutCubic,
            child: AnimatedSlide(
              offset: _showQuote ? Offset.zero : const Offset(0, 0.12),
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              child: _TestimonialBlock(
                quote: widget.quote,
                author: widget.author,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: AnimatedOpacity(
            opacity: _showMap ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            child: AnimatedSlide(
              offset: _showMap ? Offset.zero : const Offset(0, 0.14),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              child: _WorldMapAvatars(
                personAssets: widget.personAssets,
                personLayout: widget.personLayout,
                animate: _showMap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildingPitchBanner extends StatelessWidget {
  const _BuildingPitchBanner({
    required this.text,
    required this.enter,
    required this.exit,
  });

  final String text;
  final Animation<double> enter;
  final Animation<double> exit;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([enter, exit]),
      builder: (context, child) {
        final slideW = MediaQuery.sizeOf(context).width * 0.28;
        final entering = Curves.easeOutCubic.transform(enter.value);
        final exiting = Curves.easeInCubic.transform(exit.value);
        final dx = exiting > 0
            ? -slideW * exiting
            : slideW * (1 - entering);
        final opacity = exiting > 0 ? (1 - exiting) : entering;
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(dx, 0),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.primary,
                fontSize: 15,
                height: 20 / 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildingPageDots extends StatelessWidget {
  const _BuildingPageDots({
    required this.count,
    required this.index,
  });

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            width: i == index ? 22 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == index
                  ? AppColors.primary.withValues(alpha: 0.55)
                  : AppColors.primary.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ],
      ],
    );
  }
}

class _BuildingAccountHero extends StatelessWidget {
  const _BuildingAccountHero({
    required this.progress,
    required this.formatProgress,
    this.outerSize = 270.0,
    this.showProgressLabel = true,
  });

  final double progress;
  final String Function(int percent) formatProgress;
  final double outerSize;
  final bool showProgressLabel;

  double get _innerSize => outerSize * (242 / 270);

  @override
  Widget build(BuildContext context) {
    final pct = (progress * 100).round().clamp(1, 100);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showProgressLabel) ...[
          Text(
            formatProgress(pct),
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.primary.withValues(alpha: 0.72),
              fontSize: 15,
              height: 18 / 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
        ],
        SizedBox(
          width: outerSize,
          height: outerSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(outerSize, outerSize),
                painter: _HeroRingPainter(progress: progress),
              ),
              Container(
                width: _innerSize,
                height: _innerSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2D46FF),
                      Color(0xFF939DEA),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TutorRiveAvatar(
                      assetPath: AppAssets.tutorLingolaRivCdn,
                      fallbackRivePath: AppAssets.tutorLingolaRivCdn,
                      talking: false,
                      fit: rive.Fit.contain,
                      alignment: const Alignment(0, 0.1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroRingPainter extends CustomPainter {
  const _HeroRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final track = Paint()
      ..color = const Color(0xFFE8ECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final arc = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, track);

    final sweep = 2 * math.pi * progress.clamp(0.08, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant _HeroRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _BuildingTitle extends StatelessWidget {
  const _BuildingTitle({
    required this.line1,
    required this.line2,
    this.showReady = false,
    this.fontSize = 28.0,
  });

  final String line1;
  final String line2;
  final bool showReady;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 420),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Column(
        key: ValueKey(showReady),
        children: [
          Text(
            line1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.ink,
              fontSize: fontSize,
              height: (fontSize + 4) / fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            line2,
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(
              color: AppColors.primary,
              fontSize: fontSize,
              height: (fontSize + 4) / fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialBlock extends StatelessWidget {
  const _TestimonialBlock({
    required this.quote,
    required this.author,
  });

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3,
          height: 72,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF1A1714).withValues(alpha: 0.65),
                  fontSize: 16,
                  height: 20 / 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                author,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF1A1714).withValues(alpha: 0.65),
                  fontSize: 14,
                  height: 16 / 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorldMapAvatars extends StatefulWidget {
  const _WorldMapAvatars({
    required this.personAssets,
    required this.personLayout,
    required this.animate,
  });

  final List<String> personAssets;
  final List<(double dx, double dy, double size)> personLayout;
  final bool animate;

  @override
  State<_WorldMapAvatars> createState() => _WorldMapAvatarsState();
}

class _WorldMapAvatarsState extends State<_WorldMapAvatars>
    with SingleTickerProviderStateMixin {
  late final AnimationController _avatarController;

  @override
  void initState() {
    super.initState();
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    if (widget.animate) _avatarController.forward();
  }

  @override
  void didUpdateWidget(covariant _WorldMapAvatars oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _avatarController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mapHeight = constraints.maxHeight.clamp(180.0, 320.0);
        return SizedBox(
          width: double.infinity,
          height: mapHeight,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/onboarding/worldMap.png',
                  width: constraints.maxWidth,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                  filterQuality: FilterQuality.high,
                ),
              ),
              for (var i = 0; i < widget.personAssets.length; i++)
                _AnimatedMapAvatar(
                  controller: _avatarController,
                  index: i,
                  asset: widget.personAssets[i],
                  dx: widget.personLayout[i].$1,
                  dy: widget.personLayout[i].$2,
                  size: widget.personLayout[i].$3,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ComparisonSection extends StatefulWidget {
  const _ComparisonSection({
    required this.aloneCount,
    required this.lingolaCount,
    required this.unitLabel,
    required this.aloneLabel,
    required this.lingolaLabel,
    required this.fillDuration,
    required this.animate,
  });

  final String aloneCount;
  final String lingolaCount;
  final String unitLabel;
  final String aloneLabel;
  final String lingolaLabel;
  final Duration fillDuration;
  final bool animate;

  @override
  State<_ComparisonSection> createState() => _ComparisonSectionState();
}

class _ComparisonSectionState extends State<_ComparisonSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fillController;

  @override
  void initState() {
    super.initState();
    _fillController = AnimationController(
      vsync: this,
      duration: widget.fillDuration,
    );
    if (widget.animate) _fillController.forward();
  }

  @override
  void didUpdateWidget(covariant _ComparisonSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _fillController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: LayoutBuilder(
        builder: (context, constraints) {
          const labelBlock = 34.0;
          final cardH = math.min(
            228.0,
            math.max(108.0, constraints.maxHeight - labelBlock),
          );
          return AnimatedBuilder(
            animation: _fillController,
            builder: (context, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _ComparisonBar(
                    count: widget.aloneCount,
                    unitLabel: widget.unitLabel,
                    bottomLabel: widget.aloneLabel,
                    emoji: '🤔',
                    fillColor: const Color(0xFFE5E5E5),
                    fillRatio: 0.16,
                    fillProgress: _fillController.value,
                    cardHeight: cardH,
                  ),
                  const SizedBox(width: 24),
                  _ComparisonBar(
                    count: widget.lingolaCount,
                    unitLabel: widget.unitLabel,
                    bottomLabel: widget.lingolaLabel,
                    emoji: '🤩',
                    fillColor: AppColors.primary,
                    fillRatio: 1.0,
                    fillProgress: _fillController.value,
                    cardHeight: cardH,
                  ),
                ],
              );
            },
          );
        },
      ),
      ),
    );
  }
}

class _ComparisonBar extends StatelessWidget {
  const _ComparisonBar({
    required this.count,
    required this.unitLabel,
    required this.bottomLabel,
    required this.emoji,
    required this.fillColor,
    required this.fillRatio,
    required this.fillProgress,
    this.cardHeight = 248,
  });

  final String count;
  final String unitLabel;
  final String bottomLabel;
  final String emoji;
  final Color fillColor;
  final double fillRatio;
  final double fillProgress;
  final double cardHeight;

  static const _cardW = 106.0;

  double get _maxFillH => (cardHeight - 80).clamp(96.0, 168.0);

  @override
  Widget build(BuildContext context) {
    final targetH = fillRatio >= 1 ? _maxFillH : 40.0;
    final fillH = math.max(0.0, targetH * fillProgress);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _cardW,
          height: cardHeight,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.10),
              ),
            ),
            child: Column(
              children: [
                Text(
                  count,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.ink,
                    fontSize: 28,
                    height: 32 / 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  unitLabel,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.ink.withValues(alpha: 0.65),
                    fontSize: 12,
                    height: 14 / 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.4,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 80),
                    width: double.infinity,
                    height: fillH,
                    decoration: BoxDecoration(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    alignment: Alignment.center,
                    child: fillH >= 28
                        ? Text(
                            emoji,
                            style: const TextStyle(fontSize: 22),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bottomLabel,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.ink.withValues(alpha: 0.65),
            fontSize: 13,
            height: 15 / 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FluencyGrowthSection extends StatefulWidget {
  const _FluencyGrowthSection({
    required this.todayLabel,
    required this.midLabel,
    required this.endLabel,
    required this.fillDuration,
    required this.animate,
  });

  final String todayLabel;
  final String midLabel;
  final String endLabel;
  final Duration fillDuration;
  final bool animate;

  @override
  State<_FluencyGrowthSection> createState() => _FluencyGrowthSectionState();
}

class _FluencyGrowthSectionState extends State<_FluencyGrowthSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.fillDuration,
    );
    if (widget.animate) _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _FluencyGrowthSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final chartT = Curves.easeOutCubic.transform(_controller.value);

          return SizedBox.expand(
            child: Transform.translate(
              offset: Offset(0, 40 * (1 - chartT)),
              child: Opacity(
                opacity: chartT,
                child: CustomPaint(
                  painter: _FluencyChartPainter(
                    progress: chartT,
                    todayLabel: widget.todayLabel,
                    midLabel: widget.midLabel,
                    endLabel: widget.endLabel,
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FluencyChartPainter extends CustomPainter {
  const _FluencyChartPainter({
    required this.progress,
    required this.todayLabel,
    required this.midLabel,
    required this.endLabel,
  });

  final double progress;
  final String todayLabel;
  final String midLabel;
  final String endLabel;

  @override
  void paint(Canvas canvas, Size size) {
    const topPad = 8.0;
    const labelH = 24.0;
    const sidePad = 4.0;
    final chartTop = topPad;
    final chartBottom = size.height - labelH;
    final chartH = chartBottom - chartTop;
    final chartW = size.width - sidePad * 2;
    final left = sidePad;

    final gridPaint = Paint()
      ..color = const Color(0xFF1A1714).withValues(alpha: 0.08)
      ..strokeWidth = 1;

    for (var i = 0; i < 5; i++) {
      final y = chartTop + chartH * i / 4;
      _drawDashedLine(
        canvas,
        Offset(left, y),
        Offset(left + chartW, y),
        gridPaint,
      );
    }

    final p0 = Offset(left, chartTop + chartH * 0.78);
    final p1 = Offset(left + chartW * 0.52, chartTop + chartH * 0.46);
    final p2 = Offset(left + chartW, chartTop + chartH * 0.10);

    final curve = Path()
      ..moveTo(p0.dx, p0.dy)
      ..cubicTo(
        left + chartW * 0.18,
        p0.dy,
        left + chartW * 0.34,
        p1.dy + 8,
        p1.dx,
        p1.dy,
      )
      ..cubicTo(
        left + chartW * 0.68,
        p1.dy - 10,
        left + chartW * 0.86,
        p2.dy + 6,
        p2.dx,
        p2.dy,
      );

    canvas.save();
    final revealH = chartH * progress;
    canvas.clipRect(
      Rect.fromLTWH(0, chartBottom - revealH, size.width, revealH + labelH),
    );

    final fillPath = Path.from(curve)
      ..lineTo(p2.dx, chartBottom)
      ..lineTo(p0.dx, chartBottom)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withValues(alpha: 0.42),
          AppColors.primary.withValues(alpha: 0.04),
        ],
      ).createShader(Rect.fromLTWH(left, chartTop, chartW, chartH));

    canvas.drawPath(fillPath, fillPaint);

    final metrics = curve.computeMetrics().toList();
    if (metrics.isNotEmpty) {
      final metric = metrics.first;
      final len = metric.length * progress;
      final linePath = metric.extractPath(0, len);
      canvas.drawPath(
        linePath,
        Paint()
          ..color = AppColors.primary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round,
      );
    }

    if (progress > 0.48) {
      _drawDot(canvas, p1);
    }
    if (progress > 0.88) {
      _drawDot(canvas, p2);
    }

    canvas.restore();

    final labelStyle = TextStyle(
      fontFamily: 'Poppins',
      color: const Color(0xFF1A1714).withValues(alpha: 0.45),
      fontSize: 14,
      height: 16 / 14,
      fontWeight: FontWeight.w500,
    );
    _drawLabel(canvas, Offset(left, chartBottom + 6), todayLabel, labelStyle);
    _drawLabel(
      canvas,
      Offset(left + chartW * 0.52, chartBottom + 6),
      midLabel,
      labelStyle,
      center: true,
    );
    _drawLabel(
      canvas,
      Offset(left + chartW, chartBottom + 6),
      endLabel,
      labelStyle,
      right: true,
    );
  }

  void _drawDot(Canvas canvas, Offset center) {
    canvas.drawCircle(center, 7, Paint()..color = AppColors.primary);
    canvas.drawCircle(center, 4, Paint()..color = Colors.white);
  }

  void _drawLabel(
    Canvas canvas,
    Offset anchor,
    String text,
    TextStyle style, {
    bool center = false,
    bool right = false,
  }) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    var dx = anchor.dx;
    if (center) dx -= tp.width / 2;
    if (right) dx -= tp.width;

    tp.paint(canvas, Offset(dx, anchor.dy));
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dash = 4.0;
    const gap = 5.0;
    final total = (end - start).distance;
    final dir = (end - start) / total;
    var drawn = 0.0;
    while (drawn < total) {
      final segEnd = drawn + dash;
      canvas.drawLine(
        start + dir * drawn,
        start + dir * segEnd.clamp(0, total),
        paint,
      );
      drawn += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _FluencyChartPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _AnimatedMapAvatar extends StatelessWidget {
  const _AnimatedMapAvatar({
    required this.controller,
    required this.index,
    required this.asset,
    required this.dx,
    required this.dy,
    required this.size,
  });

  final AnimationController controller;
  final int index;
  final String asset;
  final double dx;
  final double dy;
  final double size;

  @override
  Widget build(BuildContext context) {
    final start = 0.12 + index * 0.12;
    final end = (start + 0.34).clamp(0.0, 1.0);
    final animation = CurvedAnimation(
      parent: controller,
      curve: Interval(start, end, curve: Curves.easeOutBack),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned.fill(
          child: Align(
            alignment: Alignment(dx * 2 - 1, dy * 2 - 1),
            child: Opacity(
              opacity: animation.value.clamp(0.0, 1.0),
              child: Transform.scale(
                scale: 0.6 + animation.value * 0.4,
                child: child,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

class _PlanReadyPanel extends StatelessWidget {
  const _PlanReadyPanel({
    required this.draft,
    required this.entry,
    required this.active,
  });

  final OnboardingDraft draft;
  final Animation<double> entry;
  final bool active;

  double _phase(int index) {
    final start = 0.04 + index * 0.11;
    final end = (start + 0.32).clamp(0.0, 1.0);
    final value = entry.value;
    if (value <= start) return 0;
    if (value >= end) return 1;
    return Curves.easeOutCubic.transform((value - start) / (end - start));
  }

  Widget _slideIn(int index, Widget child) {
    return AnimatedBuilder(
      animation: entry,
      builder: (context, _) {
        if (!active) return Opacity(opacity: 0, child: child);
        final t = _phase(index);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - t)),
            child: child,
          ),
        );
      },
    );
  }

  String _planOwnerName(Translations$planReady$en readyText) {
    final raw = SessionStore.currentUser?.displayName?.trim();
    if (raw != null && raw.isNotEmpty) {
      return raw.split(RegExp(r'\s+')).first.toUpperCase();
    }
    return readyText.defaultName;
  }

  String _courseLabel(
    Translations$planReady$en readyText,
    Translations$targetLanguage$en targetLang,
  ) {
    final code = draft.targetLanguageCode;
    final flag = switch (code) {
      'en' => '🇬🇧',
      'de' => '🇩🇪',
      'fr' => '🇫🇷',
      'es' => '🇪🇸',
      'it' => '🇮🇹',
      'tr' => '🇹🇷',
      'jp' || 'ja' => '🇯🇵',
      'ru' => '🇷🇺',
      'pt' => '🇵🇹',
      'zh' => '🇨🇳',
      'hi' => '🇮🇳',
      _ => '🌐',
    };
    final name = switch (code) {
      'en' => readyText.courseEnglish,
      'de' => readyText.courseGerman,
      'fr' => readyText.courseFrench,
      'es' => readyText.courseSpanish,
      'it' => readyText.courseItalian,
      'tr' => readyText.courseTurkish,
      'jp' || 'ja' => readyText.courseJapanese,
      'ru' => readyText.courseRussian,
      _ => targetLang.comingSoon,
    };
    return '$flag $name';
  }

  String _goalLabel(Translations$planReady$en readyText) {
    return switch (draft.goal) {
      'travel' => '🛫 ${readyText.goalTravel}',
      'livingAbroad' => '🏠 ${readyText.goalLiving}',
      'studyingAbroad' => '🎓 ${readyText.goalStudying}',
      'other' => '✨ ${readyText.goalOther}',
      _ => '💼 ${readyText.goalCareer}',
    };
  }

  String _interestLabel(Translations$planReady$en readyText) {
    var ids = List<String>.from(draft.interests);
    // Draft boşsa oturumdaki onboarding'den yedekle.
    if (ids.isEmpty) {
      final saved = SessionStore.currentUser?.onboarding?.interests;
      if (saved != null && saved.isNotEmpty) {
        ids = List<String>.from(saved);
      }
    }
    if (ids.isEmpty) return '—';
    final byId = {for (final o in allInterestOptions()) o.id: o.label};
    return ids.map((id) => byId[id] ?? id).join(', ');
  }

  String _levelLabel(Translations$planReady$en readyText) {
    return '📊 ${CefrLevels.displayCode(draft.level)}';
  }

  String _paceLabel(Translations$planReady$en readyText) {
    final emoji = DailyPace.emojiFor(draft.pace);
    return '$emoji ${DailyPace.label(AppText.current, draft.pace)}';
  }

  @override
  Widget build(BuildContext context) {
    final readyText = AppText.current.planReady;
    final targetLang = AppText.current.targetLanguage;
    final ownerName = _planOwnerName(readyText);
    final tiles = [
      _PlanTileData(label: readyText.fieldCourse, value: _courseLabel(readyText, targetLang)),
      _PlanTileData(label: readyText.fieldLevel, value: _levelLabel(readyText)),
      _PlanTileData(label: readyText.fieldFocus, value: _goalLabel(readyText)),
      _PlanTileData(label: readyText.fieldDuration, value: _paceLabel(readyText)),
      _PlanTileData(label: readyText.fieldInterests, value: _interestLabel(readyText), fullWidth: true),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final sectionGap = 10.0;
        final tileGap = 10.0;
        const tilePad = 10.0;

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _slideIn(
                0,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    readyText.statBanner,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.primary,
                      fontSize: 16,
                      height: 20 / 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: sectionGap),
              _slideIn(
                1,
                Text(
                  readyText.planTitle(name: ownerName),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.ink,
                    fontSize: 16,
                    height: 20 / 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _slideIn(
                2,
                Container(
                  padding: const EdgeInsets.all(tilePad),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _slideIn(3, _PlanTile(tile: tiles[0]))),
                          SizedBox(width: tileGap),
                          Expanded(child: _slideIn(4, _PlanTile(tile: tiles[1]))),
                        ],
                      ),
                      SizedBox(height: tileGap),
                      Row(
                        children: [
                          Expanded(child: _slideIn(5, _PlanTile(tile: tiles[2]))),
                          SizedBox(width: tileGap),
                          Expanded(child: _slideIn(6, _PlanTile(tile: tiles[3]))),
                        ],
                      ),
                      SizedBox(height: tileGap),
                      _slideIn(7, _PlanTile(tile: tiles[4])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PlanTileData {
  const _PlanTileData({
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  final String label;
  final String value;
  final bool fullWidth;
}

class _PlanTile extends StatelessWidget {
  const _PlanTile({required this.tile});

  final _PlanTileData tile;

  static const _labelStyle = TextStyle(
    fontFamily: 'Poppins',
    color: Color(0xA6000000),
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  );

  static const _valueStyle = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.ink,
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tile.fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tile.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _labelStyle,
          ),
          const SizedBox(height: 10),
          Text(
            tile.value,
            maxLines: tile.fullWidth ? null : 2,
            overflow: tile.fullWidth ? null : TextOverflow.ellipsis,
            style: _valueStyle,
          ),
        ],
      ),
    );
  }
}
