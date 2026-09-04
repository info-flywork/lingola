import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';

class InterestOption {
  const InterestOption({
    required this.id,
    required this.label,
    required this.iconAsset,
  });

  final String id;
  final String label;
  final String iconAsset;
}

List<InterestOption> featuredInterestOptions() {
  final page = AppText.current.profilePage;
  return [
    InterestOption(
      id: 'travel',
      label: page.goalChipTravel,
      iconAsset: AppAssets.interestTravel,
    ),
    InterestOption(
      id: 'shopping',
      label: page.interestShopping,
      iconAsset: AppAssets.interestShopping,
    ),
    InterestOption(
      id: 'food',
      label: page.interestFood,
      iconAsset: AppAssets.interestFood,
    ),
    InterestOption(
      id: 'popCulture',
      label: page.interestPopCulture,
      iconAsset: AppAssets.interestPopCulture,
    ),
    InterestOption(
      id: 'film',
      label: page.interestFilm,
      iconAsset: AppAssets.interestFilm,
    ),
    InterestOption(
      id: 'music',
      label: page.interestMusic,
      iconAsset: AppAssets.interestMusic,
    ),
  ];
}

/// Onboarding Step: Figma featured sıra (Yemek, Seyahat, Alışveriş, Pop kültür, Spor).
List<InterestOption> onboardingFeaturedInterestOptions() {
  final page = AppText.current.profilePage;
  return [
    InterestOption(
      id: 'food',
      label: page.interestFood,
      iconAsset: AppAssets.interestFood,
    ),
    InterestOption(
      id: 'travel',
      label: page.goalChipTravel,
      iconAsset: AppAssets.interestTravel,
    ),
    InterestOption(
      id: 'shopping',
      label: page.interestShopping,
      iconAsset: AppAssets.interestShopping,
    ),
    InterestOption(
      id: 'popCulture',
      label: page.interestPopCulture,
      iconAsset: AppAssets.interestPopCulture,
    ),
    InterestOption(
      id: 'sport',
      label: page.interestSport,
      iconAsset: AppAssets.interestSport,
    ),
  ];
}

List<InterestOption> allInterestOptions() {
  final page = AppText.current.profilePage;
  return [
    ...featuredInterestOptions(),
    InterestOption(
      id: 'sport',
      label: page.interestSport,
      iconAsset: AppAssets.interestSport,
    ),
    InterestOption(
      id: 'technology',
      label: page.interestTechnology,
      iconAsset: AppAssets.interestTechnology,
    ),
    InterestOption(
      id: 'science',
      label: page.interestScience,
      iconAsset: AppAssets.interestScience,
    ),
    InterestOption(
      id: 'health',
      label: page.interestHealth,
      iconAsset: AppAssets.interestHealth,
    ),
    InterestOption(
      id: 'fashion',
      label: page.interestFashion,
      iconAsset: AppAssets.interestFashion,
    ),
    InterestOption(
      id: 'art',
      label: page.interestArt,
      iconAsset: AppAssets.interestArt,
    ),
    InterestOption(
      id: 'literature',
      label: page.interestLiterature,
      iconAsset: AppAssets.interestLiterature,
    ),
    InterestOption(
      id: 'history',
      label: page.interestHistory,
      iconAsset: AppAssets.interestHistory,
    ),
    InterestOption(
      id: 'culture',
      label: page.interestCulture,
      iconAsset: AppAssets.interestCulture,
    ),
    InterestOption(
      id: 'astronomy',
      label: page.interestAstronomy,
      iconAsset: AppAssets.interestAstronomy,
    ),
    InterestOption(
      id: 'pet',
      label: page.interestPet,
      iconAsset: AppAssets.interestPet,
    ),
    InterestOption(
      id: 'socialMedia',
      label: page.interestSocialMedia,
      iconAsset: AppAssets.interestSocialMedia,
    ),
    InterestOption(
      id: 'entrepreneur',
      label: page.interestEntrepreneur,
      iconAsset: AppAssets.interestEntrepreneur,
    ),
  ];
}

/// Figma: İlgi Alanları — chip grid + Daha Fazla; genişleyince search + dikey liste.
/// Çoklu seçim: Kaydet'te seçili id listesini döner.
Future<List<String>?> showInterestsSheet(
  BuildContext context, {
  List<String> selectedIds = const [],
}) {
  return showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    useSafeArea: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    // Klavye sheet'i yukarı fırlatmasın; arama alanı zaten üstte.
    builder: (sheetContext) {
      final mq = MediaQuery.of(sheetContext);
      return MediaQuery(
        data: mq.removeViewInsets(removeBottom: true),
        child: _InterestsSheet(
          selectedIds: selectedIds,
          startExpanded: false,
        ),
      );
    },
  );
}

/// Onboarding "Daha fazla..." — profil sheet'te Daha fazla'ya basınca açılan
/// search + liste görünümü (chip grid atlanır).
Future<List<String>?> showInterestsPickerSheet(
  BuildContext context, {
  List<String> selectedIds = const [],
}) {
  return showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    useSafeArea: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    builder: (sheetContext) {
      final mq = MediaQuery.of(sheetContext);
      return MediaQuery(
        data: mq.removeViewInsets(removeBottom: true),
        child: _InterestsSheet(
          selectedIds: selectedIds,
          startExpanded: true,
        ),
      );
    },
  );
}

class _InterestsSheet extends StatefulWidget {
  const _InterestsSheet({
    required this.selectedIds,
    required this.startExpanded,
  });

  final List<String> selectedIds;
  final bool startExpanded;

  @override
  State<_InterestsSheet> createState() => _InterestsSheetState();
}

class _InterestsSheetState extends State<_InterestsSheet> {
  late final Set<String> _selectedIds;
  late var _expanded = false;
  final _searchCtrl = TextEditingController();
  var _query = '';

  @override
  void initState() {
    super.initState();
    _selectedIds = {...widget.selectedIds.where((e) => e.trim().isNotEmpty)};
    _expanded = widget.startExpanded;
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  List<InterestOption> get _filtered {
    final all = allInterestOptions();
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return all;
    return all
        .where(
          (o) =>
              o.label.toLowerCase().contains(q) ||
              o.id.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final mq = MediaQuery.of(context);
    final bottomInset = mq.padding.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
          // Sheet yüksekliği: ekranın %80'i (klavye alanı parent'ta düşülmüş olabilir).
          final availableH = constraints.maxHeight.isFinite
              ? constraints.maxHeight
              : mq.size.height;
          final expandedH =
              (mq.size.height * 0.80).clamp(240.0, availableH);

          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            width: double.infinity,
            height: _expanded ? expandedH : null,
            constraints: _expanded
                ? null
                : BoxConstraints(maxHeight: expandedH),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFFECECEC), width: 2),
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              10,
              16,
              10,
              16 + bottomInset,
            ),
            child: Column(
              mainAxisSize: _expanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (!_expanded) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HomeAsset(
                        AppAssets.profileHobbies,
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        text.interests,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _InterestChipWrap(
                    options: featuredInterestOptions(),
                    selectedIds: _selectedIds,
                    onToggle: _toggle,
                  ),
                  const SizedBox(height: 10),
                  _SeeMoreButton(
                    label: text.seeMore,
                    onTap: () => setState(() => _expanded = true),
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    label: text.reminderSave,
                    onPressed: () =>
                        Navigator.of(context).pop(_selectedIds.toList()),
                  ),
                ] else ...[
                  const SizedBox(height: 10),
                  _SearchField(
                    controller: _searchCtrl,
                    hint: text.searchLanguages,
                    onChanged: (v) => setState(() => _query = v),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _InterestList(
                      options: _filtered,
                      selectedIds: _selectedIds,
                      onToggle: _toggle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    label: text.reminderSave,
                    onPressed: () =>
                        Navigator.of(context).pop(_selectedIds.toList()),
                  ),
                ],
              ],
            ),
          );
        },
    );
  }
}

class _InterestChipWrap extends StatelessWidget {
  const _InterestChipWrap({
    required this.options,
    required this.selectedIds,
    required this.onToggle,
  });

  final List<InterestOption> options;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (final option in options)
          _InterestChip(
            option: option,
            selected: selectedIds.contains(option.id),
            onTap: () => onToggle(option.id),
          ),
      ],
    );
  }
}

class _InterestChip extends StatelessWidget {
  const _InterestChip({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final InterestOption option;
  final bool selected;
  final VoidCallback onTap;

  static const _border = Color(0xFFE2E2E2);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 56,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.primary : _border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeAsset(
                option.iconAsset,
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 10),
              Text(
                option.label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeeMoreButton extends StatelessWidget {
  const _SeeMoreButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.primaryTint10,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          height: 18 / 14,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 12, right: 8),
            child: HomeAsset(
              AppAssets.profileSearch,
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 24,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 18 / 14,
            fontWeight: FontWeight.w500,
            color: Colors.black.withValues(alpha: 0.35),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class _InterestList extends StatelessWidget {
  const _InterestList({
    required this.options,
    required this.selectedIds,
    required this.onToggle,
  });

  final List<InterestOption> options;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;

  static final _dividerColor = Colors.black.withValues(alpha: 0.08);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final selected = selectedIds.contains(option.id);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index == 0)
              Divider(height: 1, thickness: 1, color: _dividerColor),
            Material(
              color: selected ? AppColors.primaryTint10 : Colors.transparent,
              borderRadius:
                  selected ? BorderRadius.circular(10) : BorderRadius.zero,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => onToggle(option.id),
                borderRadius:
                    selected ? BorderRadius.circular(10) : BorderRadius.zero,
                child: Container(
                  width: double.infinity,
                  height: 52,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: selected
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primary),
                        )
                      : null,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Figma: ikon + metin yatay ortalı
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HomeAsset(
                            option.iconAsset,
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            option.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w600,
                              color: selected
                                  ? AppColors.primary
                                  : AppColors.ink,
                            ),
                          ),
                        ],
                      ),
                      if (selected)
                        const Align(
                          alignment: Alignment.centerRight,
                          child: HomeAsset(
                            AppAssets.selectionTick,
                            width: AppAssets.selectionTickSize,
                            height: AppAssets.selectionTickSize,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: _dividerColor),
          ],
        );
      },
    );
  }
}
