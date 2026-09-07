import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_draft.dart';

/// Pace adımından sonra: 2 haftalık ilerleme karşılaştırması (animasyonlu grafik).
class ProgressInsightScreen extends StatefulWidget {
  const ProgressInsightScreen({
    super.key,
    required this.draft,
    required this.nextPage,
  });

  final OnboardingDraft draft;
  final WidgetBuilder nextPage;

  @override
  State<ProgressInsightScreen> createState() => _ProgressInsightScreenState();
}

class _ProgressInsightScreenState extends State<ProgressInsightScreen>
    with TickerProviderStateMixin {
  late final AnimationController _withoutController;
  late final AnimationController _withController;
  late final AnimationController _swayController;

  @override
  void initState() {
    super.initState();
    _withoutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _withController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _swayController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _runAnimation();
  }

  Future<void> _runAnimation() async {
    await Future<void>.delayed(const Duration(milliseconds: 280));
    if (!mounted) return;
    await _withoutController.forward();
    if (!mounted) return;
    await Future<void>.delayed(const Duration(milliseconds: 120));
    if (!mounted) return;
    await _withController.forward();
    // Çizgiler bitince pill salınımı başlasın (grafik boyasını sürekli tetiklemesin).
    if (!mounted) return;
    _swayController.repeat();
  }

  @override
  void dispose() {
    _withoutController.dispose();
    _withController.dispose();
    _swayController.dispose();
    super.dispose();
  }

  void _continue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: widget.nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.setup;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  // Figma frame: yatay padding 10, içerik genişliği ~398.
                  padding: const EdgeInsets.fromLTRB(10, 55, 10, 24),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: AppTextStyles.insightTitleMaxWidth,
                        ),
                        child: Text(
                          text.progressInsightTitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.onboardingInsightTitle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text.progressInsightBody,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingInsightBody,
                          ),
                        ),
                      ),
                      const SizedBox(height: 78),
                      // Çizgi animasyonu ile pill salınımı ayrıldı —
                      // sway CustomPaint'i her karede yeniden çizmesin.
                      AnimatedBuilder(
                        animation: Listenable.merge([
                          _withoutController,
                          _withController,
                        ]),
                        builder: (context, _) {
                          return _ProgressChart(
                            withoutProgress: Curves.easeOutCubic.transform(
                              _withoutController.value,
                            ),
                            withProgress: Curves.easeOutCubic.transform(
                              _withController.value,
                            ),
                            swayListenable: _swayController,
                            confidenceLabel: text.progressInsightConfidence,
                            todayLabel: text.progressInsightToday,
                            weekLabel: text.progressInsightWeek2,
                            withLabel: text.progressInsightWithLingola,
                            withoutLabel: text.progressInsightWithoutApp,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFECECEC), width: 2),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    10,
                    16,
                    10,
                    bottomInset > 0 ? bottomInset + 6 : 30,
                  ),
                  child: PrimaryButton(
                    label: AppText.current.common.continueLabel,
                    onPressed: _continue,
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

class _ProgressChart extends StatelessWidget {
  const _ProgressChart({
    required this.withoutProgress,
    required this.withProgress,
    required this.swayListenable,
    required this.confidenceLabel,
    required this.todayLabel,
    required this.weekLabel,
    required this.withLabel,
    required this.withoutLabel,
  });

  final double withoutProgress;
  final double withProgress;
  final Animation<double> swayListenable;
  final String confidenceLabel;
  final String todayLabel;
  final String weekLabel;
  final String withLabel;
  final String withoutLabel;

  static const _blue = Color(0xFF2D46FF);
  static const _red = Color(0xFFC8102E);
  static const _muted = Color(0xFF848A9C);

  /// Referans tasarım — normalize % (x:0 sol…100 sağ, y:0 üst…100 alt).
  static const _bluePct = <(double, double)>[
    (2, 78),
    (18, 72),
    (32, 60),
    (47, 44),
    (62, 28),
    (76, 17),
    (91, 11),
  ];
  static const _redPct = <(double, double)>[
    (1, 78),
    (20, 75),
    (35, 70),
    (48, 61),
    (61, 58),
    (75, 60),
    (90, 58),
  ];
  static const _gridY = <double>[10, 27, 44, 61, 78];
  static const _blueStartM = (3.0, 77.0);
  static const _redEndM = (86.0, 59.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 228,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          Offset pct(double x, double y) => Offset(w * x / 100, h * y / 100);

          final bluePts = [for (final p in _bluePct) pct(p.$1, p.$2)];
          final redPts = [for (final p in _redPct) pct(p.$1, p.$2)];
          final blueStart = pct(_blueStartM.$1, _blueStartM.$2);
          // Bitiş noktası eğrinin ucunda — kaymasın.
          final blueEnd = bluePts.last;
          final redEnd = pct(_redEndM.$1, _redEndM.$2);

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: pct(0, 0).dx,
                top: pct(0, 0).dy,
                child: Text(
                  confidenceLabel,
                  style: const TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 12,
                    height: 1,
                    letterSpacing: 0.18,
                    fontWeight: FontWeight.w400,
                    color: _muted,
                  ),
                ),
              ),
              Positioned.fill(
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: _ProgressChartPainter(
                      bluePts: bluePts,
                      redPts: redPts,
                      blueStart: blueStart,
                      blueEnd: blueEnd,
                      redEnd: redEnd,
                      gridYs: [for (final y in _gridY) pct(0, y).dy],
                      gridLeft: pct(0, 0).dx,
                      gridRight: pct(92, 0).dx,
                      withoutProgress: withoutProgress,
                      withProgress: withProgress,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: pct(0, 90).dx,
                top: pct(0, 90).dy,
                child: Text(
                  todayLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _muted,
                  ),
                ),
              ),
              Positioned(
                left: pct(82, 90).dx,
                top: pct(82, 90).dy,
                child: Text(
                  weekLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: _muted,
                  ),
                ),
              ),
              if (withoutProgress > 0.92)
                AnimatedBuilder(
                  animation: swayListenable,
                  builder: (context, child) {
                    final a = math.sin(swayListenable.value * math.pi * 2);
                    // x:64% y:42% — pill eğrinin üstünde.
                    return Positioned(
                      left: pct(64, 42).dx,
                      top: pct(64, 42).dy,
                      child: Transform.translate(
                        offset: Offset(-a * 6, a * 5),
                        child: child,
                      ),
                    );
                  },
                  child: _PillLabel(label: withoutLabel, color: _red),
                ),
              if (withProgress > 0.92)
                AnimatedBuilder(
                  animation: swayListenable,
                  builder: (context, child) {
                    final a = math.sin(swayListenable.value * math.pi * 2);
                    // x:76% y:0% — mavi eğrinin sağ-üstünde, örtüşmesin.
                    return Positioned(
                      left: pct(76, 0).dx,
                      top: pct(76, 0).dy,
                      child: Transform.translate(
                        offset: Offset(a * 6, -a * 5),
                        child: child,
                      ),
                    );
                  },
                  child: _PillLabel(label: withLabel, color: _blue),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _PillLabel extends StatelessWidget {
  const _PillLabel({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          height: 18 / 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ProgressChartPainter extends CustomPainter {
  _ProgressChartPainter({
    required this.bluePts,
    required this.redPts,
    required this.blueStart,
    required this.blueEnd,
    required this.redEnd,
    required this.gridYs,
    required this.gridLeft,
    required this.gridRight,
    required this.withoutProgress,
    required this.withProgress,
  });

  final List<Offset> bluePts;
  final List<Offset> redPts;
  final Offset blueStart;
  final Offset blueEnd;
  final Offset redEnd;
  final List<double> gridYs;
  final double gridLeft;
  final double gridRight;
  final double withoutProgress;
  final double withProgress;

  static const _blueStartC = Color(0xFFCBD1FE);
  static const _blueEndC = Color(0xFF1B2A99);
  static const _redStartC = Color(0xFFFECBCB);
  static const _redEndC = Color(0xFF991B1B);
  static const _grid = Color(0xFFE1E3E8);
  static const _blue = Color(0xFF2D46FF);
  static const _red = Color(0xFFC8102E);

  /// Catmull-Rom → cubic Bezier — kırık polyline değil, yumuşak S.
  Path _smoothBezier(List<Offset> pts) {
    final path = Path();
    if (pts.isEmpty) return path;
    path.moveTo(pts.first.dx, pts.first.dy);
    if (pts.length == 1) return path;
    if (pts.length == 2) {
      path.lineTo(pts[1].dx, pts[1].dy);
      return path;
    }
    for (var i = 0; i < pts.length - 1; i++) {
      final p0 = i == 0 ? pts[0] : pts[i - 1];
      final p1 = pts[i];
      final p2 = pts[i + 1];
      final p3 = i + 2 < pts.length ? pts[i + 2] : p2;
      final cp1 = Offset(
        p1.dx + (p2.dx - p0.dx) / 6,
        p1.dy + (p2.dy - p0.dy) / 6,
      );
      final cp2 = Offset(
        p2.dx - (p3.dx - p1.dx) / 6,
        p2.dy - (p3.dy - p1.dy) / 6,
      );
      path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, p2.dx, p2.dy);
    }
    return path;
  }

  Path _extract(Path source, double t) {
    final metrics = source.computeMetrics().toList();
    if (metrics.isEmpty || t <= 0) return Path();
    final path = Path();
    var remaining =
        metrics.fold<double>(0, (s, m) => s + m.length) * t.clamp(0, 1);
    for (final metric in metrics) {
      if (remaining <= 0) break;
      final take = math.min(remaining, metric.length);
      path.addPath(metric.extractPath(0, take), Offset.zero);
      remaining -= take;
    }
    return path;
  }

  void _drawStroke(
    Canvas canvas,
    Path fullPath,
    double progress, {
    required Color start,
    required Color end,
  }) {
    if (progress <= 0) return;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = ui.Gradient.linear(
        Offset(gridLeft, gridYs.isNotEmpty ? gridYs.last : 0),
        Offset(gridRight, gridYs.isNotEmpty ? gridYs.first : 0),
        [start, end],
      );
    canvas.drawPath(_extract(fullPath, progress), paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = _grid
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const dashes = 2.0;
    for (final y in gridYs) {
      var x = gridLeft;
      while (x < gridRight) {
        canvas.drawLine(
          Offset(x, y),
          Offset(math.min(x + dashes, gridRight), y),
          gridPaint,
        );
        x += dashes * 2;
      }
    }

    final redPath = _smoothBezier(redPts);
    final bluePath = _smoothBezier(bluePts);

    _drawStroke(
      canvas,
      redPath,
      withoutProgress,
      start: _redStartC,
      end: _redEndC,
    );
    _drawStroke(
      canvas,
      bluePath,
      withProgress,
      start: _blueStartC,
      end: _blueEndC,
    );

    final blueFill = Paint()
      ..style = PaintingStyle.fill
      ..color = _blue;
    final redFill = Paint()
      ..style = PaintingStyle.fill
      ..color = _red;

    if (withProgress > 0.05) {
      canvas.drawCircle(blueStart, 5, blueFill);
    }
    if (withProgress > 0.85) {
      canvas.drawCircle(blueEnd, 6, blueFill);
    }
    if (withoutProgress > 0.85) {
      canvas.drawCircle(redEnd, 6, redFill);
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressChartPainter oldDelegate) {
    return oldDelegate.withoutProgress != withoutProgress ||
        oldDelegate.withProgress != withProgress ||
        oldDelegate.bluePts != bluePts ||
        oldDelegate.redPts != redPts;
  }
}
