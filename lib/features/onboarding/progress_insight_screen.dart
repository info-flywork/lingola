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
                  padding: const EdgeInsets.fromLTRB(16, 55, 16, 24),
                  child: Column(
                    children: [
                      Text(
                        text.progressInsightTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          height: 24 / 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        text.progressInsightBody,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          height: 20 / 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink.withValues(alpha: 0.65),
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

  @override
  Widget build(BuildContext context) {
    // Figma plot: 356×168 + üst/alt etiket payı.
    return SizedBox(
      width: double.infinity,
      height: 228,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chartTop = 28.0;
          final chartBottom = constraints.maxHeight - 28;
          final chartLeft = 8.0;
          final chartRight = constraints.maxWidth - 8;
          final chartH = chartBottom - chartTop;
          final chartW = chartRight - chartLeft;

          Offset map(double t, double yNorm) {
            return Offset(
              chartLeft + chartW * t,
              chartBottom - chartH * yNorm,
            );
          }

          // Figma Vector 7: yumuşak sigmoid (Lingola ile).
          final withPts = _sample((t) {
            final s = 1.0 / (1.0 + math.exp(-11.5 * (t - 0.50)));
            return map(t, 0.05 + s * 0.90);
          });
          // Uygulama olmadan: alttan 2. grid çizgisine (~0.25) yumuşak okyanus dalgası.
          // Yüksel → hafif kırılma/çukur → tekrar yumuşak çıkış.
          final withoutPts = _sample((t) {
            final envelope = 0.02 + 0.22 * (1 - math.exp(-2.8 * t));
            final ocean = 0.055 *
                math.sin(t * math.pi * 2.35 - 0.55) *
                Curves.easeOut.transform(math.min(1.0, t * 1.15));
            return map(t, (envelope + ocean).clamp(0.02, 0.30));
          });

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: chartLeft,
                top: 0,
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
                      withoutPts: withoutPts,
                      withPts: withPts,
                      withoutProgress: withoutProgress,
                      withProgress: withProgress,
                      gridTop: chartTop,
                      gridBottom: chartBottom,
                      gridLeft: chartLeft,
                      gridRight: chartRight,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: chartLeft,
                bottom: 0,
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
                right: chartLeft,
                bottom: 0,
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
                    // Yerinde çapraz salınım (kayma yok).
                    final a = math.sin(
                      swayListenable.value * math.pi * 2,
                    );
                    return Positioned(
                      left: (withoutPts.last.dx - 52)
                          .clamp(0.0, constraints.maxWidth - 150),
                      top: withoutPts.last.dy - 34,
                      child: Transform.translate(
                        offset: Offset(-a * 6, a * 5),
                        child: child,
                      ),
                    );
                  },
                  child: _PillLabel(
                    label: withoutLabel,
                    color: _red,
                  ),
                ),
              if (withProgress > 0.92)
                AnimatedBuilder(
                  animation: swayListenable,
                  builder: (context, child) {
                    // Ters çapraz — yerinde.
                    final a = math.sin(
                      swayListenable.value * math.pi * 2,
                    );
                    return Positioned(
                      left: (withPts.last.dx - 36)
                          .clamp(0.0, constraints.maxWidth - 100),
                      top: withPts.last.dy - 36,
                      child: Transform.translate(
                        offset: Offset(a * 6, -a * 5),
                        child: child,
                      ),
                    );
                  },
                  child: _PillLabel(
                    label: withLabel,
                    color: _blue,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// Yoğun örnekleme → C1 süreklilik; segment birleşiminde kırık “dağ” olmaz.
  static List<Offset> _sample(Offset Function(double t) fn, {int n = 64}) {
    return [for (var i = 0; i <= n; i++) fn(i / n)];
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
    required this.withoutPts,
    required this.withPts,
    required this.withoutProgress,
    required this.withProgress,
    required this.gridTop,
    required this.gridBottom,
    required this.gridLeft,
    required this.gridRight,
  });

  final List<Offset> withoutPts;
  final List<Offset> withPts;
  final double withoutProgress;
  final double withProgress;
  final double gridTop;
  final double gridBottom;
  final double gridLeft;
  final double gridRight;

  static const _blueStart = Color(0xFFCBD1FE);
  static const _blueEnd = Color(0xFF1B2A99);
  static const _redStart = Color(0xFFFECBCB);
  static const _redEnd = Color(0xFF991B1B);
  static const _grid = Color(0xFFE1E3E8);

  Path _curve(List<Offset> pts) {
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    if (pts.length < 2) return path;
    // Yoğun örneklenmiş yumuşak fonksiyon → lineTo yeterli (kırık cubic yok).
    for (var i = 1; i < pts.length; i++) {
      path.lineTo(pts[i].dx, pts[i].dy);
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

  void _drawLine(
    Canvas canvas,
    Path fullPath,
    double progress, {
    required Color start,
    required Color end,
    required Color dot,
  }) {
    if (progress <= 0) return;
    final drawn = _extract(fullPath, progress);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = ui.Gradient.linear(
        Offset(gridLeft, gridBottom),
        Offset(gridRight, gridTop),
        [start, end],
      );
    canvas.drawPath(drawn, paint);

    if (progress > 0.02) {
      final metrics = fullPath.computeMetrics().toList();
      if (metrics.isEmpty) return;
      final total = metrics.fold<double>(0, (s, m) => s + m.length);
      final target = total * progress.clamp(0, 1);
      var walked = 0.0;
      Offset? endPoint;
      Offset? startPoint;
      for (final metric in metrics) {
        startPoint ??= metric.getTangentForOffset(0)?.position;
        if (walked + metric.length >= target) {
          endPoint = metric.getTangentForOffset(target - walked)?.position;
          break;
        }
        walked += metric.length;
        endPoint = metric.getTangentForOffset(metric.length)?.position;
      }
      final dotPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = dot;
      if (startPoint != null && progress > 0.05) {
        canvas.drawCircle(startPoint, 5, dotPaint);
      }
      if (endPoint != null && progress > 0.85) {
        canvas.drawCircle(endPoint, 6, dotPaint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = _grid
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const dashes = 2.0;
    for (var i = 0; i < 5; i++) {
      final y = gridTop + (gridBottom - gridTop) * (i / 4);
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

    final withoutPath = _curve(withoutPts);
    final withPath = _curve(withPts);

    // Önce kırmızı (uygulama olmadan), sonra mavi (Lingola ile).
    _drawLine(
      canvas,
      withoutPath,
      withoutProgress,
      start: _redStart,
      end: _redEnd,
      dot: const Color(0xFFC8102E),
    );
    _drawLine(
      canvas,
      withPath,
      withProgress,
      start: _blueStart,
      end: _blueEnd,
      dot: const Color(0xFF2D46FF),
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressChartPainter oldDelegate) {
    return oldDelegate.withoutProgress != withoutProgress ||
        oldDelegate.withProgress != withProgress;
  }
}
