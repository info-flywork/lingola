import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'role_play_api_service.dart';
import 'role_play_chat_screen.dart';

class RolePlayScreen extends StatefulWidget {
  const RolePlayScreen({super.key});

  @override
  State<RolePlayScreen> createState() => _RolePlayScreenState();
}

class _RolePlayScreenState extends State<RolePlayScreen> {
  List<_RolePlayScenario>? _remoteScenarios;

  @override
  void initState() {
    super.initState();
    _loadScenarios();
  }

  Future<void> _loadScenarios() async {
    try {
      final remote = await RolePlayApiService.fetchScenarios();
      if (!mounted || remote.isEmpty) return;
      final text = AppText.current;
      final mapped = remote
          .map((dto) => _mapScenario(dto, text))
          .whereType<_RolePlayScenario>()
          .toList();
      if (mapped.isEmpty) return;
      setState(() => _remoteScenarios = mapped);
    } catch (_) {
      // Yerel katalog korunur.
    }
  }

  List<_RolePlayScenario> _scenariosFor(dynamic text) {
    return _remoteScenarios ?? _fallbackScenarios(text);
  }

  static List<_RolePlayScenario> _fallbackScenarios(dynamic text) {
    return [
      _RolePlayScenario(
        id: 'coffee',
        title: text.rolePlayPage.coffee.title,
        image: AppAssets.rolePlayCoffee,
        progress: 0.6,
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.coffee.screenplay,
      ),
      _RolePlayScenario(
        id: 'directions',
        title: text.rolePlayPage.directions.title,
        image: AppAssets.rolePlayDirections,
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.directions.screenplay,
        section: text.rolePlayPage.dailyInteractions,
      ),
      _RolePlayScenario(
        id: 'interview',
        title: text.rolePlayPage.interview.title,
        image: AppAssets.rolePlayInterview,
        minutes: 8,
        level: text.rolePlayPage.beginner,
        screenplay: text.rolePlayPage.interview.screenplay,
        section: text.rolePlayPage.business,
      ),
    ];
  }

  static _RolePlayScenario? _mapScenario(RolePlayScenarioDto dto, dynamic text) {
    final page = text.rolePlayPage;
    final title = _titleFor(page, dto.titleKey);
    final screenplay = _screenplayFor(page, dto.titleKey);
    if (title == null || screenplay == null) return null;
    return _RolePlayScenario(
      id: dto.id,
      title: title,
      image: dto.imageAsset.isNotEmpty ? dto.imageAsset : _imageFor(dto.id),
      progress: dto.progressPercent > 0.001 ? dto.progressPercent.clamp(0, 1) : null,
      sessionId: dto.sessionId,
      minutes: dto.minutes,
      level: page.beginner as String,
      screenplay: screenplay,
      section: _sectionFor(page, dto.sectionKey),
    );
  }

  static String? _titleFor(dynamic page, String key) {
    return switch (key) {
      'coffee' => page.coffee.title as String?,
      'directions' => page.directions.title as String?,
      'interview' => page.interview.title as String?,
      _ => null,
    };
  }

  static String? _screenplayFor(dynamic page, String key) {
    return switch (key) {
      'coffee' => page.coffee.screenplay as String?,
      'directions' => page.directions.screenplay as String?,
      'interview' => page.interview.screenplay as String?,
      _ => null,
    };
  }

  static String? _sectionFor(dynamic page, String? key) {
    return switch (key) {
      'dailyInteractions' => page.dailyInteractions as String?,
      'business' => page.business as String?,
      _ => null,
    };
  }

  static String _imageFor(String id) {
    return switch (id) {
      'coffee' => AppAssets.rolePlayCoffee,
      'directions' => AppAssets.rolePlayDirections,
      'interview' => AppAssets.rolePlayInterview,
      _ => AppAssets.rolePlayCoffee,
    };
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final scenarios = _scenariosFor(text);

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
                  fontWeight: FontWeight.w500,
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
                      fontWeight: FontWeight.w600,
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
    if (!await PremiumService.requirePremium(context)) return;
    if (!context.mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => _RolePlayDetailSheet(
        scenario: scenario,
        onGetStarted: () async {
          Navigator.of(sheetContext).pop();
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => RolePlayChatScreen(
                scenarioId: switch (scenario.id) {
                  'coffee' => RolePlayScenarioId.coffee,
                  'interview' => RolePlayScenarioId.interview,
                  _ => RolePlayScenarioId.directions,
                },
                sessionId: scenario.sessionId,
              ),
            ),
          );
          if (!mounted) return;
          await _loadScenarios();
        },
      ),
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
    this.progress,
    this.sessionId,
    this.section,
  });

  final String id;
  final String title;
  final String image;
  final double? progress;
  final String? sessionId;
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
                child: HomeAsset(
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

class _MetaChip extends StatelessWidget {
  const _MetaChip({
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

class _RolePlayDetailSheet extends StatelessWidget {
  const _RolePlayDetailSheet({
    required this.scenario,
    required this.onGetStarted,
  });

  final _RolePlayScenario scenario;
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
                    child: HomeAsset(
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
                      _MetaChip(
                        label: text.rolePlayPage.minutes(
                          value: scenario.minutes,
                        ),
                        background: Colors.white,
                        foreground: const Color(0xFF6F6F6F),
                        outlined: true,
                      ),
                      const SizedBox(width: 8),
                      _MetaChip(
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
