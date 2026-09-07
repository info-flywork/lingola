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
  /// Aynı senaryonun zorluk varyantları listesi mi (tek baseId)?
  bool get _isVariantList {
    if (widget.scenarios.length <= 1) return true;
    final first = RolePlayCatalog.baseId(widget.scenarios.first.id);
    return widget.scenarios.every((s) => RolePlayCatalog.baseId(s.id) == first);
  }

  /// Kategori: her tabandan bir kart. Varyant listesi: hepsi.
  List<RolePlayScenarioItem> get _displayedScenarios {
    if (_isVariantList) return widget.scenarios;
    return RolePlayCatalog.uniqueByBase(widget.scenarios);
  }

  Future<void> _onScenarioTap(
    BuildContext context,
    RolePlayScenarioItem scenario,
  ) async {
    if (!_isVariantList) {
      final baseId = RolePlayCatalog.baseId(scenario.id);
      final variants = widget.scenarios
          .where((s) => RolePlayCatalog.baseId(s.id) == baseId)
          .toList(growable: false);
      if (variants.length > 1) {
        await Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (_) => RolePlayCategoryScreen(
              categoryKey: widget.categoryKey,
              categoryTitle: scenario.title,
              scenarios: variants,
              onOpenDetail: widget.onOpenDetail,
            ),
          ),
        );
        return;
      }
    }
    await widget.onOpenDetail(context, scenario);
  }

  @override
  Widget build(BuildContext context) {
    final displayed = _displayedScenarios;

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
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: displayed.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final scenario = displayed[index];
                    return RolePlayScenarioCard(
                      scenario: scenario,
                      // Zorluk detay sheet'te var; kategori listesinde gizle,
                      // varyant listesinde göster.
                      hideDifficulty: !_isVariantList,
                      onTap: () => _onScenarioTap(context, scenario),
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
