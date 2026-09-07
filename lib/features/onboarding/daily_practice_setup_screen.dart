import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_text.dart';
import '../../core/constants/daily_practice_minutes.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_draft.dart';
import 'onboarding_step_header.dart';
import 'practice_time_setup_screen.dart';

/// Seviye adımından sonra: günlük pratik süresi (dk) seçimi.
class DailyPracticeSetupScreen extends StatefulWidget {
  const DailyPracticeSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<DailyPracticeSetupScreen> createState() =>
      _DailyPracticeSetupScreenState();
}

class _DailyPracticeSetupScreenState extends State<DailyPracticeSetupScreen>
    with SingleTickerProviderStateMixin {
  int? _selectedMinutes;
  late final AnimationController _chartController;

  @override
  void initState() {
    super.initState();
    final minutes = widget.draft.dailyMinutes;
    if (minutes != null && DailyPracticeMinutes.values.contains(minutes)) {
      _selectedMinutes = minutes;
    }
    _chartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _chartController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _chartController.dispose();
    super.dispose();
  }

  void _select(int minutes) {
    if (_selectedMinutes == minutes) return;
    setState(() => _selectedMinutes = minutes);
    _chartController.forward(from: 0);
  }

  void _continue() {
    final minutes = _selectedMinutes;
    if (minutes == null) return;
    widget.draft.setDailyMinutes(minutes);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PracticeTimeSetupScreen(draft: widget.draft),
      ),
    );
  }

  String _endDateLabel() {
    final end = DateTime.now().add(const Duration(days: 30));
    final locale = LocaleSettings.currentLocale.languageCode;
    try {
      return DateFormat('d MMM', locale).format(end);
    } catch (_) {
      return DateFormat('d MMM', 'en').format(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final setup = text.setup;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final chartMinutes =
        _selectedMinutes ?? DailyPracticeMinutes.defaultMinutes;
    final hoursLabel = DailyPracticeMinutes.formatMonthlyHours(chartMinutes);
    final monthlyLabel = setup.dailyPracticeMonthlyHours(hours: hoursLabel);
    final dailyOnlyLabel = setup.dailyPracticeOnlyMinutes(
      minutes: chartMinutes,
    );
    final canContinue = _selectedMinutes != null;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const OnboardingStepHeader(
                step: 7,
                totalSteps: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            setup.dailyPracticeTitle,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingSetupTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            setup.dailyPracticeHint,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingSetupHint,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      AnimatedBuilder(
                        animation: _chartController,
                        builder: (context, _) {
                          final t = Curves.easeOutCubic.transform(
                            _chartController.value,
                          );
                          return _PracticeChartCard(
                            progress: t,
                            monthlyLabel: monthlyLabel,
                            dailyOnlyLabel: dailyOnlyLabel,
                            todayLabel: setup.dailyPracticeToday,
                            endLabel: _endDateLabel(),
                          );
                        },
                      ),
                      const SizedBox(height: 28),
                      _MinutesGrid(
                        selected: _selectedMinutes,
                        onSelect: _select,
                        labelFor: (m) =>
                            setup.dailyPracticeMinutesOption(minutes: m),
                      ),
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    bottomInset > 0 ? bottomInset + 6 : 16,
                  ),
                  child: Opacity(
                    opacity: canContinue ? 1 : 0.45,
                    child: PrimaryButton(
                      label: text.common.continueLabel,
                      onPressed: () {
                        if (!canContinue) return;
                        _continue();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MinutesGrid extends StatelessWidget {
  const _MinutesGrid({
    required this.selected,
    required this.onSelect,
    required this.labelFor,
  });

  final int? selected;
  final ValueChanged<int> onSelect;
  final String Function(int minutes) labelFor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 12.0;
        final tileW = (constraints.maxWidth - gap * 2) / 3;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final minutes in DailyPracticeMinutes.values)
              SizedBox(
                width: tileW,
                height: 48,
                child: _MinuteTile(
                  label: labelFor(minutes),
                  selected: minutes == selected,
                  onTap: () => onSelect(minutes),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _MinuteTile extends StatelessWidget {
  const _MinuteTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.primary : const Color(0xFFE2E2E2),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 24 / 16,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}

class _PracticeChartCard extends StatelessWidget {
  const _PracticeChartCard({
    required this.progress,
    required this.monthlyLabel,
    required this.dailyOnlyLabel,
    required this.todayLabel,
    required this.endLabel,
  });

  final double progress;
  final String monthlyLabel;
  final String dailyOnlyLabel;
  final String todayLabel;
  final String endLabel;

  static const _blue = Color(0xFF2D46FF);
  /// Geniş / kısa — width/height ≈ 1.7
  static const _plotAspect = 1.7;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kart, grafik koordinat sisteminin dışında (üstte).
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _blue.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _blue.withValues(alpha: 0.45)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monthlyLabel,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                  color: _blue,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                dailyOnlyLabel,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 21 / 14,
                  fontWeight: FontWeight.w500,
                  color: _blue.withValues(alpha: 0.70),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            final plotW = constraints.maxWidth;
            final plotH = plotW / _plotAspect;
            return SizedBox(
              width: plotW,
              height: plotH,
              child: CustomPaint(
                size: Size(plotW, plotH),
                painter: _PracticeChartPainter(progress: progress),
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        // Etiketler plot alanının altında.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todayLabel,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF848A9C),
              ),
            ),
            Text(
              endLabel,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF848A9C),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// viewBox 0 0 1000 500 — explicit SVG path geometry (no shared formula).
class _PracticeChartPainter extends CustomPainter {
  _PracticeChartPainter({required this.progress});

  final double progress;

  static const _blue = Color(0xFF2D46FF);
  static const _guide = Color(0xFFC8CEF9);
  static const _grid = Color(0xFFE1E3E8);
  static const _vbW = 1000.0;
  static const _vbH = 500.0;

  Offset _m(Size size, double x, double y) =>
      Offset(size.width * x / _vbW, size.height * y / _vbH);

  void _cubic(
    Path path,
    Size size,
    double x1,
    double y1,
    double x2,
    double y2,
    double x,
    double y,
  ) {
    final c1 = _m(size, x1, y1);
    final c2 = _m(size, x2, y2);
    final p = _m(size, x, y);
    path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p.dx, p.dy);
  }

  Path _bluePath(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 90, 382, 180, 360, 260, 330);
    _cubic(path, size, 350, 295, 430, 235, 520, 175);
    _cubic(path, size, 610, 118, 675, 115, 735, 118);
    _cubic(path, size, 820, 124, 900, 125, 1000, 105);
    return path;
  }

  Path _topGuide(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 95, 375, 170, 335, 250, 285);
    _cubic(path, size, 345, 225, 430, 155, 535, 100);
    _cubic(path, size, 650, 40, 790, 18, 1000, 0);
    return path;
  }

  Path _secondGuide(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 90, 380, 185, 350, 270, 310);
    _cubic(path, size, 365, 265, 455, 195, 550, 145);
    _cubic(path, size, 635, 100, 700, 78, 765, 82);
    _cubic(path, size, 845, 87, 915, 82, 1000, 62);
    return path;
  }

  Path _thirdGuide(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 95, 380, 190, 360, 285, 330);
    _cubic(path, size, 380, 300, 455, 245, 545, 205);
    _cubic(path, size, 630, 168, 690, 165, 750, 180);
    _cubic(path, size, 835, 200, 915, 200, 1000, 180);
    return path;
  }

  Path _fourthGuide(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 105, 382, 205, 370, 300, 345);
    _cubic(path, size, 400, 320, 470, 285, 555, 260);
    _cubic(path, size, 640, 235, 700, 240, 760, 255);
    _cubic(path, size, 840, 274, 920, 270, 1000, 255);
    return path;
  }

  Path _lowestGuide(Size size) {
    final path = Path()..moveTo(_m(size, 0, 395).dx, _m(size, 0, 395).dy);
    _cubic(path, size, 105, 385, 190, 385, 270, 395);
    _cubic(path, size, 365, 405, 440, 395, 520, 365);
    _cubic(path, size, 600, 335, 655, 315, 720, 325);
    _cubic(path, size, 800, 340, 865, 372, 920, 370);
    _cubic(path, size, 955, 368, 980, 362, 1000, 357);
    return path;
  }

  Path _extract(Path source, double t) {
    final metrics = source.computeMetrics().toList();
    if (metrics.isEmpty || t <= 0) return Path();
    final path = Path();
    var remaining =
        metrics.fold<double>(0, (s, m) => s + m.length) * t.clamp(0.0, 1.0);
    for (final metric in metrics) {
      if (remaining <= 0) break;
      final take = math.min(remaining, metric.length);
      path.addPath(metric.extractPath(0, take), Offset.zero);
      remaining -= take;
    }
    return path;
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _grid
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const dash = 2.0;
    const ys = [20.0, 120.0, 220.0, 320.0, 420.0];
    for (final yv in ys) {
      final y = size.height * yv / _vbH;
      var x = 0.0;
      while (x < size.width) {
        canvas.drawLine(
          Offset(x, y),
          Offset(math.min(x + dash, size.width), y),
          paint,
        );
        x += dash * 2;
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress.clamp(0.0, 1.0);
    _drawGrid(canvas, size);

    // viewBox stroke 12–14 → scale to widget (~4.5–5 on typical width).
    final guideW = math.max(1.4, size.width * 3.0 / _vbW);
    final blueW = math.max(4.0, size.width * 13.0 / _vbW);
    final markerR = math.max(4.5, size.width * 11.0 / _vbW);

    final guidePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = guideW
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = _guide.withValues(alpha: 0.88 * t.clamp(0.2, 1.0));

    for (final guide in [
      _topGuide(size),
      _secondGuide(size),
      _thirdGuide(size),
      _fourthGuide(size),
      _lowestGuide(size),
    ]) {
      canvas.drawPath(_extract(guide, t), guidePaint);
    }

    final bluePath = _bluePath(size);
    final bluePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = blueW
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = _blue;
    canvas.drawPath(_extract(bluePath, t), bluePaint);

    if (t > 0.04) {
      // Noktalar path üzerinde örneklenir — sabit (x,y) kaymasını önler.
      const markerTs = <double>[0.035, 0.30, 0.56, 0.93];
      final fill = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white;
      final ring = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(2.0, blueW * 0.45)
        ..color = _blue;

      final metrics = bluePath.computeMetrics().toList();
      if (metrics.isNotEmpty) {
        final metric = metrics.first;
        final len = metric.length;
        for (final mt in markerTs) {
          if (mt > t) break;
          final tangent = metric.getTangentForOffset(len * mt);
          if (tangent == null) continue;
          canvas.drawCircle(tangent.position, markerR, fill);
          canvas.drawCircle(tangent.position, markerR, ring);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PracticeChartPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

