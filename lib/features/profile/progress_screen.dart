import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/auth/auth_service.dart';
import '../../core/auth/session_store.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/practice/practice_service.dart';
import '../../core/theme/app_theme.dart';
import '../streak/streak_api_service.dart';
import '../../widgets/home_asset.dart';
import '../library/library_screen.dart';
import '../onboarding/language_flag.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  static const _streakDone = Color(0xFF2D46FF);
  static const _streakIdle = Color(0xFFD9D9D9);
  static const _pastBody = Color(0xFF4D4D4D);
  static const _flameBg = Color(0xFFFFE2CE);
  static const _flame = Color(0xFFF97316);
  static const _starBg = Color(0xFFE8F1FF);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  var _savedCount = 0;
  var _currentStreak = 0;
  var _streakStates = _ProgressScreenState._streakStatesFromSummary(
    StreakSummaryDto.empty(),
  );

  static List<_ProgressStreakState> _streakStatesFromSummary(
    StreakSummaryDto summary,
  ) {
    if (summary.days.length == 7) {
      return summary.days.map(_mapStreakVisualState).toList();
    }
    return _streakStatesFromSummary(StreakSummaryDto.empty());
  }

  static _ProgressStreakState _mapStreakVisualState(StreakDayDto day) {
    switch (day.state) {
      case StreakDayVisualState.done:
        return _ProgressStreakState.done;
      case StreakDayVisualState.today:
        return _ProgressStreakState.today;
      case StreakDayVisualState.idle:
        return _ProgressStreakState.idle;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSavedCount();
    _loadStreak();
  }

  Future<void> _loadStreak() async {
    try {
      final streak = await StreakApiService.fetch();
      if (!mounted) return;
      setState(() {
        _currentStreak = streak.currentStreak;
        _streakStates = _streakStatesFromSummary(streak);
      });
    } catch (_) {}
  }

  Future<void> _loadSavedCount() async {
    try {
      final count = await PracticeService.fetchSavedCount();
      if (!mounted) return;
      setState(() => _savedCount = count);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final userName = AuthService.displayNameOf(SessionStore.currentUser);
    final dayLabels = [
      text.days.mon,
      text.days.tue,
      text.days.wed,
      text.days.thu,
      text.days.fri,
      text.days.sat,
      text.days.sun,
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      text.progressTitle,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    Row(
                      children: [
                        const HomeAsset(
                          AppAssets.profileAvatar,
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                text.goodMorning,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  height: 18 / 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondary,
                                ),
                              ),
                              Text(
                                userName,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  height: 24 / 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.ink,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .05),
                            borderRadius: BorderRadius.circular(9999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text.progressLanguage,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  height: 15 / 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.ink,
                                ),
                              ),
                              const SizedBox(width: 4),
                              ClipOval(
                                child: LanguageFlag(
                                  'en',
                                  width: 21,
                                  height: 21,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.border10),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text.past7Days,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              height: 18 / 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            text.past7DaysBody,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w300,
                              color: ProgressScreen._pastBody,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                for (var i = 0; i < dayLabels.length; i++)
                                  Expanded(
                                    child: _ProgressStreakDay(
                                      label: dayLabels[i],
                                      state: _streakStates[i],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      text.currentLevel,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 22 / 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.border10),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 28,
                                      height: 34 / 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'A1',
                                        style: TextStyle(color: AppColors.ink),
                                      ),
                                      TextSpan(
                                        text: ' → ',
                                        style: TextStyle(
                                          color: AppColors.secondary
                                              .withValues(alpha: .7),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'A2',
                                        style: TextStyle(
                                          color: AppColors.secondary
                                              .withValues(alpha: .55),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  text.xpLeft(
                                    xp: '2,450',
                                    level: 'Elementary A2',
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    height: 14 / 10,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const _LevelGauge(progress: 0.75),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            iconBg: ProgressScreen._flameBg,
                            icon: const HomeAsset(
                              AppAssets.profileStreak,
                              width: 22,
                              height: 25,
                              color: ProgressScreen._flame,
                            ),
                            value: '$_currentStreak',
                            label: text.dayStreakLabel,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _StatCard(
                            iconBg: ProgressScreen._starBg,
                            icon: const HomeAsset(
                              AppAssets.homeStar,
                              width: 18,
                              height: 18,
                              color: AppColors.primary,
                            ),
                            value: '8,420',
                            label: text.totalPoints,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const LibraryScreen(),
                            ),
                          );
                          if (mounted) _loadSavedCount();
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: .2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: const HomeAsset(
                                  AppAssets.profileSaveButton,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      text.savedWords,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        height: 18 / 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      text.itemsToReview(
                                        count: '$_savedCount',
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        height: 16 / 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                            .withValues(alpha: .75),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Transform.flip(
                                flipX: true,
                                child: const HomeAsset(
                                  AppAssets.homeArrowCircle,
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ProgressStreakState { done, today, idle }

class _ProgressStreakDay extends StatelessWidget {
  const _ProgressStreakDay({
    required this.label,
    required this.state,
  });

  final String label;
  final _ProgressStreakState state;

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Widget? child;

    switch (state) {
      case _ProgressStreakState.done:
        bg = ProgressScreen._streakDone;
        child = const Icon(Icons.check_rounded, size: 16, color: Colors.white);
      case _ProgressStreakState.today:
        bg = Colors.transparent;
        child = const HomeAsset(
          AppAssets.profileStreak,
          width: 22,
          height: 25,
        );
      case _ProgressStreakState.idle:
        bg = ProgressScreen._streakIdle;
        child = null;
    }

    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: child,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            height: 16 / 12,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.24,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class _LevelGauge extends StatelessWidget {
  const _LevelGauge({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final percent = (progress * 100).round();

    return SizedBox(
      width: 132,
      height: 88,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: const Size(132, 78),
            painter: _SemiGaugePainter(progress: progress),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$percent%',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    height: 26 / 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  text.toNextLevel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 9,
                    height: 12 / 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SemiGaugePainter extends CustomPainter {
  const _SemiGaugePainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = 12.0;
    final center = Offset(size.width / 2, size.height - 4);
    final radius = (size.width / 2) - stroke / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final track = Paint()
      ..color = AppColors.progressTrack
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final fill = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, math.pi, math.pi, false, track);
    canvas.drawArc(
      rect,
      math.pi,
      math.pi * progress.clamp(0.0, 1.0),
      false,
      fill,
    );
  }

  @override
  bool shouldRepaint(covariant _SemiGaugePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.iconBg,
    required this.icon,
    required this.value,
    required this.label,
  });

  final Color iconBg;
  final Widget icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    height: 22 / 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    height: 14 / 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
