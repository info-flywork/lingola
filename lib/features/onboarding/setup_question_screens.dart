import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/auth/auth_service.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_draft.dart';
import 'onboarding_demo_chat_screen.dart';

class ExplanationLanguageSetupScreen extends StatefulWidget {
  const ExplanationLanguageSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<ExplanationLanguageSetupScreen> createState() =>
      _ExplanationLanguageSetupScreenState();
}

class _ExplanationLanguageSetupScreenState
    extends State<ExplanationLanguageSetupScreen> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    final mode = widget.draft.explanationLanguage;
    final index = OnboardingDraft.explanationLanguages.indexOf(mode);
    _selected = index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.explanationNative, null),
      (text.setup.explanationEnglish, null),
    ];
    return _SetupQuestionScaffold(
      step: 2,
      totalSteps: 5,
      title: text.setup.explanationTitle,
      subtitle: text.setup.explanationHint,
      options: options,
      selectedIndex: _selected,
      centerOptions: true,
      mutedUnselectedLabels: true,
      onSelect: (index) => setState(() => _selected = index),
      onBack: () => Navigator.of(context).maybePop(),
      onContinue: () {
        widget.draft.setExplanationLanguageIndex(_selected);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => GoalSetupScreen(draft: widget.draft),
          ),
        );
      },
    );
  }
}

class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    final goal = widget.draft.goal ?? 'career';
    final index = OnboardingDraft.goals.indexOf(goal);
    _selected = index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.goalCareer, 'assets/images/onboardingGoals/career.svg'),
      (text.setup.goalTravel, 'assets/images/onboardingGoals/plane.svg'),
      (text.setup.goalLiving, 'assets/images/onboardingGoals/livingabroad.svg'),
      (text.setup.goalStudying, 'assets/images/onboardingGoals/studyingAbroad.svg'),
      (text.setup.goalOther, 'assets/images/onboardingGoals/other.svg'),
    ];
    return _SetupQuestionScaffold(
      step: 3,
      totalSteps: 5,
      title: text.setup.goalTitle,
      options: options,
      selectedIndex: _selected,
      centerOptions: true,
      mutedUnselectedLabels: true,
      onSelect: (index) => setState(() => _selected = index),
      onBack: () => Navigator.of(context).maybePop(),
      onContinue: () {
        widget.draft.setGoalIndex(_selected);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => LevelSetupScreen(draft: widget.draft),
          ),
        );
      },
    );
  }
}

class LevelSetupScreen extends StatefulWidget {
  const LevelSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<LevelSetupScreen> createState() => _LevelSetupScreenState();
}

class _LevelSetupScreenState extends State<LevelSetupScreen> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = CefrLevels.indexOf(widget.draft.level);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final levelLabels = [
      text.setup.levelA1,
      text.setup.levelA2,
      text.setup.levelB1,
      text.setup.levelB2,
      text.setup.levelC1,
      text.setup.levelC2,
    ];
    final options = [
      for (var i = 0; i < levelLabels.length; i++)
        ('${CefrLevels.emojis[i]} ${levelLabels[i]}', null),
    ];
    return _SetupQuestionScaffold(
      step: 4,
      totalSteps: 5,
      title: text.setup.levelTitle,
      options: options,
      selectedIndex: _selected,
      centerOptions: true,
      mutedUnselectedLabels: true,
      onSelect: (index) => setState(() => _selected = index),
      onBack: () => Navigator.of(context).maybePop(),
      onContinue: () {
        widget.draft.setLevelIndex(_selected);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => PaceSetupScreen(draft: widget.draft),
          ),
        );
      },
    );
  }
}

class PaceSetupScreen extends StatefulWidget {
  const PaceSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PaceSetupScreen> createState() => _PaceSetupScreenState();
}

class _PaceSetupScreenState extends State<PaceSetupScreen> {
  late int _selected;
  var _continuing = false;

  @override
  void initState() {
    super.initState();
    final pace = DailyPace.normalize(widget.draft.pace);
    _selected = DailyPace.indexOf(pace);
  }

  Future<void> _finishSetup() async {
    if (_continuing) return;
    setState(() => _continuing = true);
    widget.draft.setPaceIndex(_selected);
    unawaited(
      AuthService.syncOnboardingDraft(widget.draft).catchError((_) {}),
    );
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => OnboardingDemoChatScreen(draft: widget.draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      for (var i = 0; i < DailyPace.values.length; i++)
        (
          '${DailyPace.emojis[i]} ${DailyPace.label(text, DailyPace.values[i])}',
          null,
        ),
    ];
    return _SetupQuestionScaffold(
      step: 5,
      totalSteps: 5,
      title: text.setup.paceTitle,
      options: options,
      selectedIndex: _selected,
      centerOptions: true,
      mutedUnselectedLabels: true,
      onSelect: (index) => setState(() => _selected = index),
      onBack: () => Navigator.of(context).maybePop(),
      onContinue: () => unawaited(_finishSetup()),
    );
  }
}

class _SetupQuestionScaffold extends StatelessWidget {
  const _SetupQuestionScaffold({
    required this.step,
    required this.totalSteps,
    required this.title,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
    required this.onBack,
    required this.onContinue,
    this.subtitle,
    this.centerOptions = false,
    this.mutedUnselectedLabels = false,
  });

  final int step;
  final int totalSteps;
  final String title;
  final String? subtitle;
  final List<(String, String?)> options;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final bool centerOptions;
  final bool mutedUnselectedLabels;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  text.language.step(current: step, total: totalSteps),
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
                  child: LinearProgressIndicator(
                    minHeight: 13,
                    value: step / totalSteps,
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
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 24,
                          height: 30 / 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Text(
                          subtitle!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 14,
                            height: 20 / 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const SizedBox(height: 28),
                      for (var i = 0; i < options.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _OptionTile(
                          label: options[i].$1,
                          iconAsset: options[i].$2,
                          selected: i == selectedIndex,
                          centered: centerOptions,
                          mutedUnselectedLabel: mutedUnselectedLabels,
                          onTap: () => onSelect(i),
                        ),
                      ],
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
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    children: [
                      SecondaryButton(
                        label: text.common.back,
                        onPressed: onBack,
                      ),
                      const SizedBox(height: 10),
                      PrimaryButton(
                        label: text.common.continueLabel,
                        onPressed: onContinue,
                      ),
                    ],
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

class _OptionIcon extends StatelessWidget {
  const _OptionIcon({required this.assetPath, required this.selected});

  final String assetPath;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
      colorFilter: ColorFilter.mode(
        selected ? AppColors.primary : const Color(0xFF626262),
        BlendMode.srcIn,
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    this.iconAsset,
    required this.selected,
    required this.onTap,
    this.centered = false,
    this.mutedUnselectedLabel = false,
  });

  final String label;
  final String? iconAsset;
  final bool selected;
  final VoidCallback onTap;
  final bool centered;
  final bool mutedUnselectedLabel;

  @override
  Widget build(BuildContext context) {
    final idleColor = mutedUnselectedLabel
        ? const Color(0xFF626262)
        : AppColors.ink;
    final labelStyle = TextStyle(
      fontFamily: 'Poppins',
      color: selected ? AppColors.primary : idleColor,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
    );

    return Material(
      color: selected ? AppColors.primaryTint10 : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: centered ? 48 : null,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: centered ? 0 : 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : (centered ? const Color(0xFFECECEC) : AppColors.border),
              width: 1,
            ),
          ),
          child: centered
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    final hasIcon =
                        iconAsset != null && iconAsset!.trim().isNotEmpty;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (hasIcon) ...[
                          _OptionIcon(
                            assetPath: iconAsset!,
                            selected: selected,
                          ),
                          const SizedBox(width: 8),
                        ],
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: (constraints.maxWidth - (hasIcon ? 32 : 0))
                                .clamp(0, constraints.maxWidth),
                          ),
                          child: Text(
                            label,
                            style: labelStyle,
                            textAlign: TextAlign.center,
                            maxLines: hasIcon ? 1 : 2,
                            softWrap: !hasIcon,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Row(
                  children: [
                    if (iconAsset != null && iconAsset!.trim().isNotEmpty) ...[
                      _OptionIcon(assetPath: iconAsset!, selected: selected),
                      const SizedBox(width: 14),
                    ],
                    Expanded(
                      child: Text(
                        label,
                        style: labelStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
