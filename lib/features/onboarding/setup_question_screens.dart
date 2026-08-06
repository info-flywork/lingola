import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_draft.dart';
import 'post_onboarding_screens.dart';

class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  int _selected = 1;

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
      step: 2,
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
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.levelBeginner, 'assets/images/onboardingLevel/beginner.svg'),
      (
        text.setup.levelIntermediate,
        'assets/images/onboardingLevel/intermediate.svg',
      ),
      (text.setup.levelAdvanced, 'assets/images/onboardingLevel/advanced.svg'),
    ];
    return _SetupQuestionScaffold(
      step: 3,
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
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.paceLight, 'assets/images/onboardingfaststep/light.svg'),
      (
        text.setup.paceRecommended,
        'assets/images/onboardingfaststep/recommended.svg',
      ),
      (
        text.setup.paceFast,
        'assets/images/onboardingfaststep/fastresults.svg',
      ),
    ];
    return _SetupQuestionScaffold(
      step: 4,
      title: text.setup.paceTitle,
      options: options,
      selectedIndex: _selected,
      centerOptions: true,
      mutedUnselectedLabels: true,
      onSelect: (index) => setState(() => _selected = index),
      onBack: () => Navigator.of(context).maybePop(),
      onContinue: () {
        widget.draft.setPaceIndex(_selected);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => AccountCreatingScreen(draft: widget.draft),
          ),
        );
      },
    );
  }
}

class _SetupQuestionScaffold extends StatelessWidget {
  const _SetupQuestionScaffold({
    required this.step,
    required this.title,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
    required this.onBack,
    required this.onContinue,
    this.centerOptions = false,
    this.mutedUnselectedLabels = false,
  });

  final int step;
  final String title;
  final List<(String, String)> options;
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
                  text.language.step(current: step, total: 4),
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
                    value: step / 4,
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
    required this.iconAsset,
    required this.selected,
    required this.onTap,
    this.centered = false,
    this.mutedUnselectedLabel = false,
  });

  final String label;
  final String iconAsset;
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
                    // Figma: icon+yazı grubu ortada, aralarında 8px
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _OptionIcon(
                          assetPath: iconAsset,
                          selected: selected,
                        ),
                        const SizedBox(width: 8),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: (constraints.maxWidth - 32)
                                .clamp(0, constraints.maxWidth),
                          ),
                          child: Text(
                            label,
                            style: labelStyle,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Row(
                  children: [
                    _OptionIcon(assetPath: iconAsset, selected: selected),
                    const SizedBox(width: 14),
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
