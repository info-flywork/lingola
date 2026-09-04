import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../onboarding/language_flag.dart';

class _NativeLang {
  const _NativeLang({required this.code, required this.label});

  final String code;
  final String label;
}

List<_NativeLang> _nativeLanguages() {
  final t = AppText.current;
  return [
    _NativeLang(code: 'tr', label: t.targetLanguage.turkish),
    _NativeLang(code: 'es', label: t.language.spanish),
    _NativeLang(code: 'zh', label: t.profilePage.chineseShort),
    _NativeLang(code: 'pt', label: t.targetLanguage.portuguese),
    _NativeLang(code: 'fr', label: t.language.french),
    _NativeLang(code: 'en', label: t.language.english),
    _NativeLang(code: 'jp', label: t.language.japanese),
    _NativeLang(code: 'ru', label: t.language.russian),
    _NativeLang(code: 'hi', label: t.targetLanguage.hindi),
    _NativeLang(code: 'it', label: t.targetLanguage.italian),
    _NativeLang(code: 'de', label: t.targetLanguage.german),
  ];
}

/// Figma: Ana Dilim — düz üst köşeli bottom sheet (grid + Daha Fazla / arama listesi).
Future<String?> showNativeLanguageSheet(
  BuildContext context, {
  required String selectedId,
}) {
  return showModalBottomSheet<String>(
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
        child: _NativeLanguageSheet(selectedId: selectedId),
      );
    },
  );
}

class _NativeLanguageSheet extends StatefulWidget {
  const _NativeLanguageSheet({required this.selectedId});

  final String selectedId;

  @override
  State<_NativeLanguageSheet> createState() => _NativeLanguageSheetState();
}

class _NativeLanguageSheetState extends State<_NativeLanguageSheet> {
  late String _selectedId;
  var _expanded = false;
  final _searchCtrl = TextEditingController();
  var _query = '';

  static const _featuredCodes = ['tr', 'es', 'zh', 'pt', 'fr', 'en'];

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedId;
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<_NativeLang> get _all => _nativeLanguages();

  List<_NativeLang> get _featured =>
      _all.where((l) => _featuredCodes.contains(l.code)).toList()
        ..sort(
          (a, b) =>
              _featuredCodes.indexOf(a.code) - _featuredCodes.indexOf(b.code),
        );

  List<_NativeLang> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all
        .where(
          (l) =>
              l.label.toLowerCase().contains(q) ||
              l.code.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final maxH = MediaQuery.sizeOf(context).height;
    // Expanded: ~%80 ekran; status bar'a kadar çıkmasın.
    final expandedH = maxH * 0.80;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      width: double.infinity,
      height: _expanded ? expandedH : null,
      constraints: _expanded
          ? null
          : BoxConstraints(maxHeight: maxH * 0.80),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFECECEC), width: 2),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        10,
        _expanded ? 16 : 16,
        10,
        30 + bottomInset,
      ),
      child: Column(
        mainAxisSize: _expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (!_expanded) ...[
            _Header(title: text.nativeLanguage),
            const SizedBox(height: 10),
            _FeaturedGrid(
              languages: _featured,
              selectedId: _selectedId,
              onSelect: (code) => setState(() => _selectedId = code),
            ),
            const SizedBox(height: 10),
            _SeeMoreButton(
              label: text.seeMore,
              onTap: () => setState(() => _expanded = true),
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              label: text.reminderSave,
              onPressed: () => Navigator.of(context).pop(_selectedId),
            ),
          ] else ...[
            _SearchField(
              controller: _searchCtrl,
              hint: text.searchLanguages,
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _LanguageList(
                languages: _filtered,
                selectedId: _selectedId,
                onSelect: (code) => setState(() => _selectedId = code),
              ),
            ),
            const SizedBox(height: 10),
            PrimaryButton(
              label: text.reminderSave,
              onPressed: () => Navigator.of(context).pop(_selectedId),
            ),
          ],
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HomeAsset(
          AppAssets.profileMotherTongue,
          width: 32,
          height: 32,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 1,
            fontWeight: FontWeight.w500,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

class _FeaturedGrid extends StatelessWidget {
  const _FeaturedGrid({
    required this.languages,
    required this.selectedId,
    required this.onSelect,
  });

  final List<_NativeLang> languages;
  final String selectedId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    const columns = 3;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < languages.length; i += columns) ...[
          if (i > 0) const SizedBox(height: 10),
          Row(
            children: [
              for (var j = 0; j < columns; j++) ...[
                if (j > 0) const SizedBox(width: 10),
                Expanded(
                  child: i + j < languages.length
                      ? _Chip(
                          language: languages[i + j],
                          selected: languages[i + j].code == selectedId,
                          onTap: () => onSelect(languages[i + j].code),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.language,
    required this.selected,
    required this.onTap,
  });

  final _NativeLang language;
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
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.primary : _border,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageFlag.badge(language.code, size: 16),
              const SizedBox(width: 6),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    language.label,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      color: selected ? Colors.white : AppColors.ink,
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
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 18 / 14,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
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

class _LanguageList extends StatelessWidget {
  const _LanguageList({
    required this.languages,
    required this.selectedId,
    required this.onSelect,
  });

  final List<_NativeLang> languages;
  final String selectedId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: languages.length,
      separatorBuilder: (_, _) => Divider(
        height: 1,
        thickness: 1,
        color: Colors.black.withValues(alpha: 0.05),
      ),
      itemBuilder: (context, index) {
        final lang = languages[index];
        final selected = lang.code == selectedId;
        return Material(
          color: selected ? AppColors.primaryTint10 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onSelect(lang.code),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: selected
                    ? Border.all(color: AppColors.primary)
                    : null,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 22),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LanguageFlag(lang.code, width: 28, height: 20),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            lang.label,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              height: 18 / 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  selected ? AppColors.primary : AppColors.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 22,
                    child: selected
                        ? const Icon(
                            Icons.check_circle,
                            size: 22,
                            color: AppColors.primary,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
