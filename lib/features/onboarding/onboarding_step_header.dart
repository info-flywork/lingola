import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';

/// Onboarding adım başlığı: geri ok + "Step X of Y" + progress bar.
class OnboardingStepHeader extends StatelessWidget {
  const OnboardingStepHeader({
    super.key,
    required this.step,
    required this.totalSteps,
    this.onBack,
    this.showBack = true,
  });

  final int step;
  final int totalSteps;
  final VoidCallback? onBack;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final canBack = showBack &&
        (onBack != null || Navigator.of(context).canPop());
    final handleBack = onBack ?? () => Navigator.of(context).maybePop();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
          child: SizedBox(
            height: AppAssets.onboardingBackSize,
            child: Row(
              children: [
                if (canBack)
                  IconButton(
                    onPressed: handleBack,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 40,
                      height: 40,
                    ),
                    icon: const HomeAsset(
                      AppAssets.onboardingBack,
                      width: AppAssets.onboardingBackSize,
                      height: AppAssets.onboardingBackSize,
                      fit: BoxFit.contain,
                    ),
                    tooltip: text.common.back,
                  )
                else
                  const SizedBox(width: 40, height: 40),
                Expanded(
                  child: Text(
                    text.language.step(current: step, total: totalSteps),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              minHeight: 13,
              value: (step / totalSteps).clamp(0.0, 1.0),
              color: AppColors.primary,
              backgroundColor: AppColors.border,
            ),
          ),
        ),
      ],
    );
  }
}
