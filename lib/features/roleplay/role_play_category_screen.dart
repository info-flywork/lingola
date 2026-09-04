import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'role_play_catalog.dart';
import 'role_play_widgets.dart';

class RolePlayCategoryScreen extends StatefulWidget {
  const RolePlayCategoryScreen({
    super.key,
    required this.categoryKey,
    required this.categoryTitle,
    required this.scenarios,
    required this.onOpenDetail,
  });

  final String categoryKey;
  final String categoryTitle;
  final List<RolePlayScenarioItem> scenarios;
  final Future<void> Function(BuildContext context, RolePlayScenarioItem scenario)
      onOpenDetail;

  @override
  State<RolePlayCategoryScreen> createState() => _RolePlayCategoryScreenState();
}

class _RolePlayCategoryScreenState extends State<RolePlayCategoryScreen> {
  String _difficultyFilter = 'all';

  @override
  Widget build(BuildContext context) {
    final page = AppText.current.rolePlayPage;
    final filtered = _difficultyFilter == 'all'
        ? widget.scenarios
        : widget.scenarios
            .where((s) => s.levelKey == _difficultyFilter)
            .toList(growable: false);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F8),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 16, 0),
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
                    Expanded(
                      child: Text(
                        widget.categoryTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          height: 24 / 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1 + RolePlayCatalog.difficultyKeys.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RolePlayFilterChip(
                        label: page.filterAll,
                        selected: _difficultyFilter == 'all',
                        onTap: () => setState(() => _difficultyFilter = 'all'),
                      );
                    }
                    final key = RolePlayCatalog.difficultyKeys[index - 1];
                    return RolePlayFilterChip(
                      label: RolePlayCatalog.levelLabel(page, key),
                      selected: _difficultyFilter == key,
                      onTap: () => setState(() => _difficultyFilter = key),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: filtered.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final scenario = filtered[index];
                    return RolePlayScenarioCard(
                      scenario: scenario,
                      onTap: () => widget.onOpenDetail(context, scenario),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
