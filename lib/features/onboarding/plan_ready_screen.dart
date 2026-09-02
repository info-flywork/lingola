import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart' as rive;

import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/auth/session_store.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../features/tutor/widgets/tutor_rive_avatar.dart';
import '../../i18n/strings.g.dart';
import '../shell/main_shell.dart';
import 'onboarding_draft.dart';

/// Onboarding son adım — kişisel plan özeti + ana uygulamaya geçiş.
class PlanReadyScreen extends StatefulWidget {
  const PlanReadyScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PlanReadyScreen> createState() => _PlanReadyScreenState();
}

class _PlanReadyScreenState extends State<PlanReadyScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entryController;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..forward();
  }

  @override
  void dispose() {
    _entryController.dispose();
    super.dispose();
  }

  Future<void> _startPlan() async {
    if (!PremiumService.isPremium) {
      await PremiumService.presentPaywall(context);
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const MainShell()),
    );
  }

  double _phase(int index) {
    final start = 0.06 + index * 0.1;
    final end = (start + 0.34).clamp(0.0, 1.0);
    final value = _entryController.value;
    if (value <= start) return 0;
    if (value >= end) return 1;
    return Curves.easeOutCubic.transform((value - start) / (end - start));
  }

  Widget _slideIn(int index, Widget child) {
    return AnimatedBuilder(
      animation: _entryController,
      builder: (context, _) {
        final t = _phase(index);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 24 * (1 - t)),
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
    Translations$language$en lang,
    Translations$targetLanguage$en targetLang,
  ) {
    final code = widget.draft.targetLanguageCode;
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
    return switch (widget.draft.goal) {
      'travel' => '🛫 ${readyText.goalTravel}',
      'livingAbroad' => '🏠 ${readyText.goalLiving}',
      'studyingAbroad' => '🎓 ${readyText.goalStudying}',
      'other' => '✨ ${readyText.goalOther}',
      _ => '💼 ${readyText.goalCareer}',
    };
  }

  String _interestLabel(Translations$planReady$en readyText) {
    return switch (widget.draft.goal) {
      'travel' => '🛫 ${readyText.goalTravel}',
      'livingAbroad' => '🏠 ${readyText.goalLiving}',
      'studyingAbroad' => '🎓 ${readyText.goalStudying}',
      'other' => '✨ ${readyText.goalOther}',
      _ => '🛫 ${readyText.goalTravel}',
    };
  }

  String _levelLabel(Translations$planReady$en readyText) {
    return '📊 ${CefrLevels.displayCode(widget.draft.level)}';
  }

  String _paceLabel(Translations$planReady$en readyText) {
    final emoji = DailyPace.emojiFor(widget.draft.pace);
    return '$emoji ${DailyPace.label(AppText.current, widget.draft.pace)}';
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final readyText = text.planReady;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final ownerName = _planOwnerName(readyText);

    final tiles = [
      _PlanTileData(label: readyText.fieldCourse, value: _courseLabel(readyText, text.language, text.targetLanguage)),
      _PlanTileData(label: readyText.fieldLevel, value: _levelLabel(readyText)),
      _PlanTileData(label: readyText.fieldFocus, value: _goalLabel(readyText)),
      _PlanTileData(label: readyText.fieldDuration, value: _paceLabel(readyText)),
      _PlanTileData(label: readyText.fieldInterests, value: _interestLabel(readyText), fullWidth: true),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxHeight < 880;
              final heroSize = compact
                  ? (constraints.maxHeight * 0.19).clamp(148.0, 172.0)
                  : (constraints.maxHeight * 0.24).clamp(188.0, 210.0);
              final titleSize = compact ? 21.0 : 26.0;
              final sectionGap = compact ? 6.0 : 12.0;
              final tileGap = 10.0;
              const tilePad = 10.0;

              return Column(
                children: [
                  SizedBox(height: compact ? 2 : 8),
                  _PlanReadyHero(size: heroSize),
                  SizedBox(height: sectionGap),
                  Column(
                    children: [
                      Text(
                        readyText.titleLine1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.ink,
                          fontSize: titleSize,
                          height: (titleSize + 4) / titleSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        readyText.titleLine2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pacifico(
                          color: AppColors.primary,
                          fontSize: titleSize,
                          height: (titleSize + 4) / titleSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: sectionGap),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, compact ? 10 : 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _slideIn(
                            0,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: compact ? 14 : 20,
                                vertical: compact ? 8 : 10,
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
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.primary,
                                  fontSize: compact ? 14 : 16,
                                  height: compact ? 18 / 14 : 20 / 16,
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
                                      Expanded(
                                        child: _slideIn(
                                          3,
                                          _PlanTile(tile: tiles[0]),
                                        ),
                                      ),
                                      SizedBox(width: tileGap),
                                      Expanded(
                                        child: _slideIn(
                                          4,
                                          _PlanTile(tile: tiles[1]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: tileGap),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _slideIn(
                                          5,
                                          _PlanTile(tile: tiles[2]),
                                        ),
                                      ),
                                      SizedBox(width: tileGap),
                                      Expanded(
                                        child: _slideIn(
                                          6,
                                          _PlanTile(tile: tiles[3]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: tileGap),
                                  _slideIn(
                                    7,
                                    _PlanTile(tile: tiles[4]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DecoratedBox(
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.darkShadow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(bottom: 4),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: FilledButton(
                            onPressed: _startPlan,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: AppTextStyles.primaryButton,
                            ),
                            child: Text(readyText.startPlan),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
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

class _PlanReadyHero extends StatelessWidget {
  const _PlanReadyHero({required this.size});

  final double size;

  double get _innerSize => size * 0.896;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _PlanReadyRingPainter(),
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
    );
  }
}

class _PlanReadyRingPainter extends CustomPainter {
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
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
