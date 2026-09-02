import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../onboarding/language_flag.dart';
import '../onboarding/target_language_options.dart';

enum LanguagePickerKind { appLocale, targetLanguage, nativeLanguage }

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({
    super.key,
    this.initialCode = 'tr',
    this.kind = LanguagePickerKind.appLocale,
  });

  final String initialCode;
  final LanguagePickerKind kind;

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  static const _labelMuted = Color(0xFF606060);

  late String _selectedCode;

  @override
  void initState() {
    super.initState();
    _selectedCode = widget.initialCode;
  }

  List<({String code, String label, bool comingSoon})> _languages() {
    final t = AppText.current;
    if (widget.kind == LanguagePickerKind.targetLanguage) {
      return targetLanguageOptions(t)
          .map(
            (item) => (
              code: item.code,
              label: item.label,
              comingSoon: item.comingSoon,
            ),
          )
          .toList();
    }
    if (widget.kind == LanguagePickerKind.nativeLanguage) {
      return [
        (code: 'en', label: t.language.english, comingSoon: false),
        (code: 'de', label: t.targetLanguage.german, comingSoon: false),
        (code: 'it', label: t.targetLanguage.italian, comingSoon: false),
        (code: 'fr', label: t.language.french, comingSoon: false),
        (code: 'tr', label: t.targetLanguage.turkish, comingSoon: false),
        (code: 'jp', label: t.language.japanese, comingSoon: false),
        (code: 'es', label: t.language.spanish, comingSoon: false),
        (code: 'ru', label: t.language.russian, comingSoon: false),
        (code: 'hi', label: t.targetLanguage.hindi, comingSoon: false),
        (code: 'pt', label: t.targetLanguage.portuguese, comingSoon: false),
        (code: 'zh', label: t.targetLanguage.simplifiedChinese, comingSoon: false),
      ];
    }
    return [
      (code: 'en', label: t.language.english, comingSoon: false),
      (code: 'de', label: t.targetLanguage.german, comingSoon: false),
      (code: 'it', label: t.targetLanguage.italian, comingSoon: false),
      (code: 'fr', label: t.language.french, comingSoon: false),
      (code: 'tr', label: t.targetLanguage.turkish, comingSoon: false),
      (code: 'jp', label: t.language.japanese, comingSoon: false),
      (code: 'es', label: t.language.spanish, comingSoon: false),
      (code: 'ru', label: t.language.russian, comingSoon: false),
      (code: 'hi', label: t.targetLanguage.hindi, comingSoon: false),
      (code: 'pt', label: t.targetLanguage.portuguese, comingSoon: false),
      (code: 'zh', label: t.targetLanguage.simplifiedChinese, comingSoon: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final languages = _languages();
    final title = switch (widget.kind) {
      LanguagePickerKind.targetLanguage => text.targetLanguage.title,
      LanguagePickerKind.nativeLanguage =>
        text.profilePage.selectNativeLanguageTitle,
      LanguagePickerKind.appLocale => text.profilePage.selectLanguageTitle,
    };

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  itemCount: languages.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = languages[index];
                    final selected = item.code == _selectedCode;
                    final disabled = item.comingSoon;
                    return Material(
                      color: disabled
                          ? const Color(0xFFF7F7F8)
                          : selected
                              ? AppColors.primaryTint10
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: disabled
                            ? null
                            : () => setState(() => _selectedCode = item.code),
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected && !disabled
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: disabled ? 0.45 : 1,
                                child: LanguageFlag(
                                  item.code,
                                  width: 39,
                                  height: 30,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item.label,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    height: 18 / 14,
                                    fontWeight: FontWeight.w600,
                                    color: disabled
                                        ? _labelMuted.withValues(alpha: 0.55)
                                        : selected
                                            ? AppColors.primary
                                            : _labelMuted,
                                  ),
                                ),
                              ),
                              if (disabled)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    text.language.comingSoonBadge,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      height: 14 / 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: PrimaryButton(
                  label: text.profilePage.save,
                  onPressed: () => Navigator.of(context).pop(_selectedCode),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
