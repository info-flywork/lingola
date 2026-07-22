import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class RolePlayScreen extends StatelessWidget {
  const RolePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final scenarios = [
      _RolePlayScenario(
        id: 'coffee',
        title: text.rolePlayPage.coffee.title,
        image: 'assets/images/roleplay/coffee.png',
        progress: 0.6,
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.coffee.screenplay,
      ),
      _RolePlayScenario(
        id: 'directions',
        title: text.rolePlayPage.directions.title,
        image: 'assets/images/roleplay/directions.png',
        largeImage: 'assets/images/roleplay/directions_large.png',
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.directions.screenplay,
        section: text.rolePlayPage.dailyInteractions,
      ),
      _RolePlayScenario(
        id: 'interview',
        title: text.rolePlayPage.interview.title,
        image: 'assets/images/roleplay/interview.png',
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.interview.screenplay,
        section: text.rolePlayPage.business,
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F8),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Text(
                text.rolePlayPage.title,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  height: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text.rolePlayPage.subtitle,
                style: const TextStyle(
                  color: Color(0xFF8A8A8A),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              for (final scenario in scenarios) ...[
                if (scenario.section != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    scenario.section!,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      height: 20 / 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                _RolePlayCard(
                  scenario: scenario,
                  onTap: () => _openDetail(context, scenario),
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openDetail(
    BuildContext context,
    _RolePlayScenario scenario,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _RolePlayDetailSheet(scenario: scenario),
    );
  }
}

class _RolePlayScenario {
  const _RolePlayScenario({
    required this.id,
    required this.title,
    required this.image,
    required this.minutes,
    required this.level,
    required this.screenplay,
    this.largeImage,
    this.progress,
    this.section,
  });

  final String id;
  final String title;
  final String image;
  final String? largeImage;
  final double? progress;
  final int minutes;
  final String level;
  final String screenplay;
  final String? section;
}

class _RolePlayCard extends StatelessWidget {
  const _RolePlayCard({required this.scenario, required this.onTap});

  final _RolePlayScenario scenario;
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
                child: Image.asset(
                  scenario.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
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
                            color: Color(0xFF9A9A9A),
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            height: 16 / 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ] else
                        Row(
                          children: [
                            _MetaChip(
                              label: text.rolePlayPage.minutes(
                                value: scenario.minutes,
                              ),
                              background: const Color(0xFFF0F0F0),
                              foreground: const Color(0xFF6F6F6F),
                            ),
                            const SizedBox(width: 6),
                            _MetaChip(
                              label: scenario.level,
                              background: AppColors.primaryTint10,
                              foreground: AppColors.primary,
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
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({
    required this.label,
    required this.background,
    required this.foreground,
    this.outlined = false,
  });

  final String label;
  final Color background;
  final Color foreground;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(99),
        border: outlined ? Border.all(color: foreground) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontFamily: 'Poppins',
          fontSize: 12,
          height: 15 / 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _RolePlayDetailSheet extends StatelessWidget {
  const _RolePlayDetailSheet({required this.scenario});

  final _RolePlayScenario scenario;

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
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
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
                    child: Image.asset(
                      scenario.largeImage ?? scenario.image,
                      width: 189,
                      height: 189,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
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
                      _MetaChip(
                        label: text.rolePlayPage.minutes(value: scenario.minutes),
                        background: const Color(0xFFF0F0F0),
                        foreground: const Color(0xFF6F6F6F),
                      ),
                      const SizedBox(width: 8),
                      _MetaChip(
                        label: scenario.level,
                        background: Colors.white,
                        foreground: AppColors.primary,
                        outlined: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Divider(height: 1, color: Color(0xFFEAEAEA)),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/roleplay/screenplay.svg',
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        text.rolePlayPage.screenplay,
                        style: const TextStyle(
                          color: Color(0xFF606060),
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      scenario.screenplay,
                      style: const TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        height: 20 / 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(
                    label: text.common.getStarted,
                    onPressed: () => Navigator.of(context).pop(),
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
