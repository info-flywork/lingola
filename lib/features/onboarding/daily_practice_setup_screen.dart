import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_text.dart';
import '../../core/constants/daily_practice_minutes.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_draft.dart';
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
  late int _selectedMinutes;
  late final AnimationController _chartController;

  @override
  void initState() {
    super.initState();
    _selectedMinutes = DailyPracticeMinutes.normalize(
      widget.draft.dailyMinutes,
    );
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
    widget.draft.setDailyMinutes(_selectedMinutes);
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
    final hoursLabel = DailyPracticeMinutes.formatMonthlyHours(
      _selectedMinutes,
    );
    final monthlyLabel = setup.dailyPracticeMonthlyHours(hours: hoursLabel);
    final dailyOnlyLabel = setup.dailyPracticeOnlyMinutes(
      minutes: _selectedMinutes,
    );

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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  text.language.step(current: 7, total: 8),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: const LinearProgressIndicator(
                    minHeight: 13,
                    value: 7 / 8,
                    color: AppColors.primary,
                    backgroundColor: AppColors.border,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                  child: Column(
                    children: [
                      Text(
                        setup.dailyPracticeTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.ink,
                          fontSize: 24,
                          height: 30 / 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        setup.dailyPracticeHint,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.ink.withValues(alpha: 0.65),
                          fontSize: 16,
                          height: 20 / 16,
                          fontWeight: FontWeight.w500,
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
                  child: PrimaryButton(
                    label: text.common.continueLabel,
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

class _MinutesGrid extends StatelessWidget {
  const _MinutesGrid({
    required this.selected,
    required this.onSelect,
    required this.labelFor,
  });

  final int selected;
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Figma badge: soft tint + primary border, radius 10.
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
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: _PracticeChartPainter(progress: progress),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
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
      ),
    );
  }
}

/// Figma: 3 alt + 1 mavi + 2 üst.
/// Sol başta tek noktada sıkı küme → sağa doğru yelpaze.
class _PracticeChartPainter extends CustomPainter {
  _PracticeChartPainter({required this.progress});

  final double progress;

  static const _blue = Color(0xFF2D46FF);
  static const _guide = Color(0xFFCBD1FE);
  static const _grid = Color(0xFFE1E3E8);

  /// [endNorm] 0 = alt, 1 = üst (sağ uç yüksekliği).
  /// Başta hep aynı [startY]; ayrışma t^k ile geç gelir.
  Path _wave(
    Size size, {
    required double endNorm,
    required _WaveStyle style,
  }) {
    final w = size.width;
    final h = size.height;
    // Ortak başlangıç: sol alt nokta (ilk mavi dot hizası).
    final startY = h * 0.92;
    final endY = h * (0.88 - endNorm * 0.80);

    Offset pt(double t) {
      // Erken t’de neredeyse aynı yolda; sonra açılır.
      final fan = math.pow(t, 1.85).toDouble();
      var y = startY + (endY - startY) * fan;

      switch (style) {
        case _WaveStyle.low:
          // Ortada yukarı çıkan dalga, sonra iniş (3 alt çizgi — Figma).
          y += -math.sin(t * math.pi) * h * 0.09;
        case _WaveStyle.mid:
          if (t > 0.25) {
            final u = (t - 0.25) / 0.75;
            y += -math.sin(u * math.pi * 1.2) * h * 0.022 * fan;
          }
        case _WaveStyle.top:
          // Temiz dik S — ekstra dalga yok.
          break;
        case _WaveStyle.main:
          if (t > 0.2) {
            final u = (t - 0.2) / 0.8;
            y += -math.sin(u * math.pi * 1.1) * h * 0.016 * fan;
          }
      }
      return Offset(w * t, y);
    }

    final path = Path()..moveTo(0, startY);
    const n = 64;
    for (var i = 1; i <= n; i++) {
      final p = pt(i / n);
      path.lineTo(p.dx, p.dy);
    }
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

  void _drawDashedGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _grid
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const dash = 2.0;
    for (var i = 0; i < 5; i++) {
      final y = size.height * (i / 4);
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
    _drawDashedGrid(canvas, size);

    final guidePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = _guide.withValues(alpha: 0.72 * t.clamp(0.2, 1.0));

    // Alt 3 → mavi → üst 2 (endNorm sağ uç).
    final guides = <(double, _WaveStyle)>[
      (0.08, _WaveStyle.low),
      (0.24, _WaveStyle.low),
      (0.40, _WaveStyle.low),
      (0.82, _WaveStyle.mid),
      (1.00, _WaveStyle.top),
    ];

    for (final (endNorm, style) in guides) {
      canvas.drawPath(
        _extract(_wave(size, endNorm: endNorm, style: style), t),
        guidePaint,
      );
    }

    const mainEnd = 0.62;
    final mainPath = _wave(size, endNorm: mainEnd, style: _WaveStyle.main);
    final mainPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = ui.Gradient.linear(
        Offset(0, size.height),
        Offset(size.width, 0),
        const [Color(0xFFA8B4FF), Color(0xFF2D46FF)],
      );
    canvas.drawPath(_extract(mainPath, t), mainPaint);

    if (t > 0.05) {
      final metrics = mainPath.computeMetrics().toList();
      if (metrics.isEmpty) return;
      final total = metrics.fold<double>(0, (s, m) => s + m.length);
      // İlk nokta başlangıçta; diğerleri yayılmış.
      const stops = [0.0, 0.28, 0.52, 0.74, 0.96];
      final fill = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white;
      final ring = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..color = _blue;

      for (final stop in stops) {
        if (stop > t && stop > 0) break;
        if (t < 0.08 && stop > 0) break;
        final target = total * stop.clamp(0.0, 1.0);
        var walked = 0.0;
        Offset? point;
        for (final metric in metrics) {
          if (walked + metric.length >= target) {
            point = metric.getTangentForOffset(target - walked)?.position;
            break;
          }
          walked += metric.length;
          point = metric.getTangentForOffset(metric.length)?.position;
        }
        if (point == null) continue;
        canvas.drawCircle(point, 5.5, fill);
        canvas.drawCircle(point, 5.5, ring);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PracticeChartPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

enum _WaveStyle { low, mid, top, main }
