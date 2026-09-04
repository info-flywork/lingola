import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'role_play_catalog.dart';
import 'role_play_chat_screen.dart';

Future<void> openRolePlayScenarioDetail({
  required BuildContext context,
  required RolePlayScenarioItem scenario,
  Future<void> Function()? onChatClosed,
}) async {
  if (!await PremiumService.requirePremium(context)) return;
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => RolePlayDetailSheet(
      scenario: scenario,
      onGetStarted: () async {
        Navigator.of(sheetContext).pop();
        final english = rolePlayEnglishContent(
          scenarioId: scenario.id,
          title: scenario.title,
          openingMessage: scenario.openingMessage,
        );
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => RolePlayChatScreen(
              scenarioId: scenario.id,
              sessionId: scenario.sessionId,
              titleEn: english.titleEn,
              openingEn: english.openingEn,
              lessonBadge: english.badge,
              isCustom: scenario.isCustom,
            ),
          ),
        );
        if (onChatClosed != null) await onChatClosed();
      },
    ),
  );
}

class RolePlayFilterChip extends StatelessWidget {
  const RolePlayFilterChip({
    super.key,
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
      color: selected ? const Color(0xFF2D46FF) : Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: selected
                ? null
                : Border.all(color: const Color(0xFFE2E2E2)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF8F8F8F),
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 24 / 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class RolePlayScenarioCard extends StatelessWidget {
  const RolePlayScenarioCard({
    super.key,
    required this.scenario,
    required this.onTap,
  });

  final RolePlayScenarioItem scenario;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 114),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE8EEFF)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: scenario.image.isEmpty
                    ? Container(
                        width: 90,
                        height: 90,
                        color: const Color(0xFFF0F0F0),
                      )
                    : HomeAsset(
                        scenario.image,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 94,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scenario.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          height: 20 / 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      if (scenario.progress != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: LinearProgressIndicator(
                            minHeight: 4,
                            value: scenario.progress,
                            color: AppColors.primary,
                            backgroundColor: const Color(0xFFDCE3FF),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          text.rolePlayPage.progressCompleted(
                            value: ((scenario.progress ?? 0) * 100).round(),
                          ),
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            height: 14 / 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ] else
                        Row(
                          children: [
                            RolePlayMetaChip(
                              label: text.rolePlayPage.minutes(
                                value: scenario.minutes,
                              ),
                              background: const Color(0xFFF0F0F0),
                              foreground: const Color(0xFF6F6F6F),
                            ),
                            const SizedBox(width: 6),
                            RolePlayMetaChip(
                              label: scenario.level,
                              background: Colors.white,
                              foreground: AppColors.primary,
                              outlined: true,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const HomeAsset(
                  AppAssets.quizArrow,
                  width: 6,
                  height: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RolePlayMetaChip extends StatelessWidget {
  const RolePlayMetaChip({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
    this.outlined = false,
    this.fontWeight = FontWeight.w500,
  });

  final String label;
  final Color background;
  final Color foreground;
  final bool outlined;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: outlined ? Border.all(color: foreground) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontFamily: 'Poppins',
          fontSize: 12,
          height: 15 / 12,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class RolePlayDetailSheet extends StatelessWidget {
  const RolePlayDetailSheet({
    super.key,
    required this.scenario,
    required this.onGetStarted,
  });

  final RolePlayScenarioItem scenario;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .78,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 34,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 18, 16, 16 + bottom),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: scenario.image.isEmpty
                        ? Container(
                            width: 189,
                            height: 189,
                            color: const Color(0xFFF0F0F0),
                          )
                        : HomeAsset(
                            scenario.image,
                            width: 189,
                            height: 189,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    scenario.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      height: 24 / 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RolePlayMetaChip(
                        label: text.rolePlayPage.minutes(
                          value: scenario.minutes,
                        ),
                        background: Colors.white,
                        foreground: const Color(0xFF6F6F6F),
                        outlined: true,
                      ),
                      const SizedBox(width: 8),
                      RolePlayMetaChip(
                        label: scenario.level,
                        background: Colors.white,
                        foreground: AppColors.primary,
                        outlined: true,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HomeAsset(
                              AppAssets.rolePlayScreenplay,
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              text.rolePlayPage.screenplay,
                              style: const TextStyle(
                                color: AppColors.ink,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                height: 18 / 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          scenario.screenplay,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            height: 16 / 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(
                    label: text.common.getStarted,
                    onPressed: onGetStarted,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
