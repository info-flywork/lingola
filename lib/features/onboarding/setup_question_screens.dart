import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/auth/auth_service.dart';
import '../../core/auth/session_store.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../profile/interests_sheet.dart';
import 'language_flag.dart';
import 'onboarding_draft.dart';
import 'daily_practice_setup_screen.dart';
import 'onboarding_step_header.dart';
import 'progress_insight_screen.dart';

class ExplanationLanguageSetupScreen extends StatefulWidget {
  const ExplanationLanguageSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<ExplanationLanguageSetupScreen> createState() =>
      _ExplanationLanguageSetupScreenState();
}

class _ExplanationLanguageSetupScreenState
    extends State<ExplanationLanguageSetupScreen> {
  /// İlk gelişte seçili gelmesin; kullanıcı dokununca set edilir.
  int? _selected;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.explanationNative, 'emoji:🌎'),
      (text.setup.explanationEnglish, 'flag:en'),
    ];
    return _SetupQuestionScaffold(
      step: 2,
      totalSteps: 8,
      title: text.setup.explanationTitle,
      subtitle: text.setup.explanationHint,
      options: options,
      selectedIndex: _selected ?? -1,
      centerOptions: true,
      filledSelected: true,
      iconSize: 32,
      optionHeight: 56,
      largeTitle: true,
      showFooter: false,
      onSelect: (index) {
        setState(() => _selected = index);
        widget.draft.setExplanationLanguageIndex(index);
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
  /// İlk gelişte seçili gelmesin; kullanıcı dokununca set edilir.
  int? _selected;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      (text.setup.goalCareer, AppAssets.goalCareer),
      (text.setup.goalTravel, AppAssets.goalTravel),
      (text.setup.goalStudying, AppAssets.goalEducation),
      (text.setup.goalLiving, AppAssets.goalLivingAbroad),
      (text.setup.goalOther, AppAssets.goalPersonalDevelopment),
    ];
    return _SetupQuestionScaffold(
      step: 3,
      totalSteps: 8,
      title: text.setup.goalTitle,
      subtitle: text.setup.goalHint,
      options: options,
      selectedIndex: _selected ?? -1,
      centerOptions: true,
      filledSelected: true,
      iconSize: 32,
      optionHeight: 56,
      largeTitle: true,
      showFooter: false,
      onSelect: (index) {
        setState(() => _selected = index);
        widget.draft.setGoalIndex(index);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => InterestsSetupScreen(draft: widget.draft),
          ),
        );
      },
    );
  }
}

class InterestsSetupScreen extends StatefulWidget {
  const InterestsSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<InterestsSetupScreen> createState() => _InterestsSetupScreenState();
}

class _InterestsSetupScreenState extends State<InterestsSetupScreen> {
  late final Set<String> _selected;

  @override
  void initState() {
    super.initState();
    // Geri dönüşte kullanıcının seçtikleri kalsın; ilk girişte boş.
    _selected = {...widget.draft.interests};
  }

  void _toggle(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else {
        _selected.add(id);
      }
    });
    // Plan özetine kadar kaybolmasın — hemen draft'a yaz.
    widget.draft.setInterests(_selected);
  }

  Future<void> _openMore() async {
    final result = await showInterestsPickerSheet(
      context,
      selectedIds: _selected.toList(),
    );
    if (!mounted || result == null) return;
    setState(() {
      _selected
        ..clear()
        ..addAll(result);
    });
    widget.draft.setInterests(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = onboardingFeaturedInterestOptions();

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
              OnboardingStepHeader(
                step: 4,
                totalSteps: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  // Figma Frame 5: 376 genişlik, padding 10, title↔hint gap 6.
                  padding: const EdgeInsets.fromLTRB(10, 28, 10, 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text.setup.interestsTitle,
                            maxLines: 1,
                            softWrap: false,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.onboardingSetupTitleLg,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text.setup.interestsHint,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingSetupHint,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      for (var i = 0; i < options.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _OptionTile(
                          label: options[i].label,
                          iconAsset: options[i].iconAsset,
                          selected: _selected.contains(options[i].id),
                          centered: true,
                          filledSelected: true,
                          iconSize: 32,
                          height: 56,
                          onTap: () => _toggle(options[i].id),
                        ),
                      ],
                      const SizedBox(height: 12),
                      _SeeMoreWideButton(
                        label: text.setup.seeMoreEllipsis,
                        onTap: () => unawaited(_openMore()),
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
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Opacity(
                    opacity: _selected.isEmpty ? 0.45 : 1,
                    child: PrimaryButton(
                      label: text.common.continueLabel,
                      onPressed: () {
                        if (_selected.isEmpty) return;
                        widget.draft.setInterests(_selected);
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) =>
                                PaceSetupScreen(draft: widget.draft),
                          ),
                        );
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

class _SeeMoreWideButton extends StatelessWidget {
  const _SeeMoreWideButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryTint10,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 48,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primary),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 18 / 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
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
  int? _selected;

  @override
  void initState() {
    super.initState();
    // Kullanıcı daha önce seçtiyse (geri dönüş) göster; aksi halde boş.
    final level = widget.draft.level;
    if (level != null && level.trim().isNotEmpty) {
      _selected = CefrLevels.indexOf(level);
    }
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
        (levelLabels[i], CefrLevels.iconAssets[i]),
    ];
    return _SetupQuestionScaffold(
      step: 6,
      totalSteps: 8,
      title: text.setup.levelTitle,
      subtitle: text.setup.levelHint,
      options: options,
      selectedIndex: _selected ?? -1,
      filledSelected: true,
      iconSize: AppAssets.levelIconWidth,
      iconHeight: AppAssets.levelIconHeight,
      iconGap: 3,
      optionHeight: 60,
      showFooter: false,
      onSelect: (index) {
        setState(() => _selected = index);
        widget.draft.setLevelIndex(index);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => DailyPracticeSetupScreen(draft: widget.draft),
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
  int? _selected;
  var _continuing = false;

  @override
  void initState() {
    super.initState();
    final pace = widget.draft.pace;
    if (pace != null && pace.trim().isNotEmpty) {
      _selected = DailyPace.indexOf(DailyPace.normalize(pace));
    }
  }

  Future<void> _finishSetup(int index) async {
    if (_continuing) return;
    setState(() {
      _continuing = true;
      _selected = index;
    });
    widget.draft.setPaceIndex(index);
    // Giriş yokken auth sync UI'yi kilitlemesin.
    if (SessionStore.currentUser != null) {
      unawaited(() async {
        try {
          await AuthService.syncOnboardingDraft(widget.draft);
        } catch (_) {}
      }());
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => ProgressInsightScreen(
          draft: widget.draft,
          nextPage: (_) => LevelSetupScreen(draft: widget.draft),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final options = [
      for (var i = 0; i < DailyPace.values.length; i++)
        (
          DailyPace.label(text, DailyPace.values[i]),
          DailyPace.iconAssets[i],
        ),
    ];
    return _SetupQuestionScaffold(
      step: 5,
      totalSteps: 8,
      title: text.setup.paceTitle,
      subtitle: text.setup.paceHint,
      options: options,
      selectedIndex: _selected ?? -1,
      centerOptions: true,
      filledSelected: true,
      iconSize: 32,
      optionHeight: 56,
      showFooter: false,
      onSelect: (index) {
        unawaited(_finishSetup(index));
      },
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
    this.onBack,
    this.onContinue,
    this.showFooter = true,
    this.subtitle,
    this.centerOptions = false,
    this.mutedUnselectedLabels = false,
    this.filledSelected = false,
    this.iconSize = 24,
    this.iconHeight,
    this.iconGap = 8,
    this.optionHeight,
    this.largeTitle = false,
  });

  final int step;
  final int totalSteps;
  final String title;
  final String? subtitle;
  final List<(String, String?)> options;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final VoidCallback? onBack;
  final VoidCallback? onContinue;
  final bool showFooter;
  final bool centerOptions;
  final bool mutedUnselectedLabels;
  final bool filledSelected;
  final double iconSize;
  final double? iconHeight;
  final double iconGap;
  final double? optionHeight;
  /// true → Figma 24/30 (hedef vb.), false → 20/30.
  final bool largeTitle;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final footerVisible =
        showFooter && onBack != null && onContinue != null;
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
              OnboardingStepHeader(
                step: step,
                totalSteps: totalSteps,
                onBack: onBack,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                  child: Column(
                    children: [
                      _SetupTitleBlock(
                        text: title,
                        largeTitle: largeTitle,
                      ),
                      if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
                        const SizedBox(height: 10),
                        _SetupHintBlock(text: subtitle!),
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
                          filledSelected: filledSelected,
                          iconSize: iconSize,
                          iconHeight: iconHeight,
                          iconGap: iconGap,
                          height: optionHeight ?? (centerOptions ? 48 : null),
                          onTap: () => onSelect(i),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (footerVisible)
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
                          onPressed: onBack!,
                        ),
                        const SizedBox(height: 10),
                        PrimaryButton(
                          label: text.common.continueLabel,
                          onPressed: onContinue!,
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

/// Tüm satırlar aynı punto; dar ekranda birlikte küçülür.
class _SetupTitleBlock extends StatelessWidget {
  const _SetupTitleBlock({
    required this.text,
    required this.largeTitle,
  });

  final String text;
  final bool largeTitle;

  @override
  Widget build(BuildContext context) {
    final style = largeTitle
        ? AppTextStyles.onboardingSetupTitleLg
        : AppTextStyles.onboardingSetupTitle;
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          softWrap: false,
          style: style,
        ),
      ),
    );
  }
}

class _SetupHintBlock extends StatelessWidget {
  const _SetupHintBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          softWrap: false,
          style: AppTextStyles.onboardingSetupHint,
        ),
      ),
    );
  }
}

class _OptionIcon extends StatelessWidget {
  const _OptionIcon({
    required this.assetPath,
    required this.selected,
    this.size = 24,
    this.height,
    this.tintWhenSelected = true,
  });

  final String assetPath;
  final bool selected;
  final double size;
  final double? height;
  final bool tintWhenSelected;

  @override
  Widget build(BuildContext context) {
    if (assetPath.startsWith('emoji:')) {
      return Text(
        assetPath.substring(6),
        style: TextStyle(fontSize: size * 0.85, height: 1),
        textAlign: TextAlign.center,
      );
    }
    if (assetPath.startsWith('flag:')) {
      final code = assetPath.substring(5);
      return LanguageFlag(
        code,
        width: size,
        height: height ?? size * 0.75,
      );
    }
    final isPng = assetPath.toLowerCase().endsWith('.png');
    final h = height ?? size;
    // Renkli PNG: dolu seçili satırda beyaza çek (mavi A2 rozeti mavi zeminde kaybolmasın).
    if (isPng) {
      return HomeAsset(
        assetPath,
        width: size,
        height: h,
        color: selected && !tintWhenSelected ? Colors.white : null,
      );
    }
    if (!tintWhenSelected) {
      return HomeAsset(
        assetPath,
        width: size,
        height: h,
      );
    }
    return HomeAsset(
      assetPath,
      width: size,
      height: h,
      color: selected ? AppColors.primary : const Color(0xFF626262),
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
    this.filledSelected = false,
    this.iconSize = 24,
    this.iconHeight,
    this.iconGap = 8,
    this.height,
  });

  final String label;
  final String? iconAsset;
  final bool selected;
  final VoidCallback onTap;
  final bool centered;
  final bool mutedUnselectedLabel;
  final bool filledSelected;
  final double iconSize;
  final double? iconHeight;
  final double iconGap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final idleColor = mutedUnselectedLabel
        ? const Color(0xFF626262)
        : AppColors.ink;
    final selectedFill = filledSelected;
    final labelStyle = TextStyle(
      fontFamily: 'Poppins',
      color: selected
          ? (selectedFill ? Colors.white : AppColors.primary)
          : idleColor,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
    );

    return Material(
      color: selected
          ? (selectedFill ? AppColors.primary : AppColors.primaryTint10)
          : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: height != null ? 0 : 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : (centered || selectedFill
                      ? const Color(0xFFECECEC)
                      : AppColors.border),
              width: 1,
            ),
          ),
          child: centered
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    final hasIcon =
                        iconAsset != null && iconAsset!.trim().isNotEmpty;
                    final iconSlot = iconSize + iconGap;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (hasIcon) ...[
                          _OptionIcon(
                            assetPath: iconAsset!,
                            selected: selected,
                            size: iconSize,
                            height: iconHeight,
                            tintWhenSelected: !selectedFill,
                          ),
                          SizedBox(width: iconGap),
                        ],
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: (constraints.maxWidth -
                                    (hasIcon ? iconSlot : 0))
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
                      _OptionIcon(
                        assetPath: iconAsset!,
                        selected: selected,
                        size: iconSize,
                        height: iconHeight,
                        tintWhenSelected: !selectedFill,
                      ),
                      SizedBox(width: iconGap),
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
