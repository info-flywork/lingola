import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../../core/i18n/locale_uppercase.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'language_flag.dart';
import 'onboarding_draft.dart';
import 'setup_question_screens.dart';

class LanguageSetupScreen extends StatefulWidget {
  const LanguageSetupScreen({super.key, this.draft});

  final OnboardingDraft? draft;

  @override
  State<LanguageSetupScreen> createState() => _LanguageSetupScreenState();
}

class _LanguageSetupScreenState extends State<LanguageSetupScreen> {
  late final OnboardingDraft _draft;
  late String _nativeCode;
  late String _nativeName;
  late String _targetCode;
  late String _targetName;

  @override
  void initState() {
    super.initState();
    final text = AppText.current;
    _draft = widget.draft ?? OnboardingDraft();
    _nativeCode = _draft.nativeLanguageCode;
    _nativeName = text.language.nativeName;
    _targetCode = _draft.targetLanguageCode;
    _targetName = text.language.targetName;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_syncAppLocaleFromNative());
    });
  }

  String _appLocaleFromNative(String code) => code == 'jp' ? 'ja' : code;

  Future<void> _syncAppLocaleFromNative() async {
    final localeCode = _appLocaleFromNative(_nativeCode);
    _draft.appLocale = localeCode;
    await AppLocaleSync.applyCode(localeCode);
  }

  List<_SheetLanguage> _targetSheetLanguages() {
    final text = AppText.current;
    return [
      _SheetLanguage('en', text.language.english),
      _SheetLanguage('de', text.targetLanguage.german, comingSoon: true),
      _SheetLanguage('it', text.targetLanguage.italian, comingSoon: true),
      _SheetLanguage('fr', text.language.french, comingSoon: true),
    ];
  }

  List<_SheetLanguage> _nativeSheetLanguages() {
    final text = AppText.current;
    // Select language sheet: tüm diller seçilebilir, Coming soon yok.
    return [
      _SheetLanguage('en', text.language.english),
      _SheetLanguage('de', text.targetLanguage.german),
      _SheetLanguage('it', text.targetLanguage.italian),
      _SheetLanguage('fr', text.language.french),
      _SheetLanguage('tr', text.targetLanguage.turkish),
      _SheetLanguage('jp', text.language.japanese),
      _SheetLanguage('es', text.language.spanish),
      _SheetLanguage('ru', text.language.russian),
    ];
  }

  Future<void> _openSheet({required bool forNative}) async {
    final text = AppText.current;
    final selected = forNative ? _nativeCode : _targetCode;
    final result = await showModalBottomSheet<_SheetLanguage>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        final height = MediaQuery.sizeOf(context).height;
        return SizedBox(
          height: height,
          child: _LanguagePickerSheet(
            title: forNative
                ? text.language.selectLanguage
                : text.language.targetField,
            languages:
                forNative ? _nativeSheetLanguages() : _targetSheetLanguages(),
            selectedCode: selected,
            targetMode: !forNative,
          ),
        );
      },
    );
    if (result == null || !mounted) return;
    if (forNative) {
      _nativeCode = result.code;
      _nativeName = result.label;
      _draft.nativeLanguageCode = result.code;
      await _syncAppLocaleFromNative();
    } else {
      setState(() {
        _targetCode = result.code;
        _targetName = result.label;
        _draft.targetLanguageCode = result.code;
      });
      return;
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  text.language.step(current: 1, total: 4),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: const LinearProgressIndicator(
                    minHeight: 13,
                    value: .25,
                    color: AppColors.primary,
                    backgroundColor: AppColors.border,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        text.language.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 24,
                          height: 30 / 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        localeUpperCase(text.language.nativeSection),
                        style: const TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 14,
                          height: 24 / 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _LanguageCard(
                        language: _nativeName,
                        flagCode: _nativeCode,
                        onOpen: () => _openSheet(forNative: true),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.border,
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Semantics(
                              label: text.language.direction,
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.surface,
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: AppColors.ink,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors.border,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        localeUpperCase(text.language.targetSection),
                        style: const TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 14,
                          height: 24 / 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _LanguageCard(
                        language: _targetName,
                        flagCode: _targetCode,
                        onOpen: () => _openSheet(forNative: false),
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
                  child: PrimaryButton(
                    label: text.common.continueLabel,
                    onPressed: () {
                      _draft.nativeLanguageCode = _nativeCode;
                      _draft.targetLanguageCode = _targetCode;
                      _draft.appLocale = _appLocaleFromNative(_nativeCode);
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => GoalSetupScreen(draft: _draft),
                        ),
                      );
                    },
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

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.language,
    required this.flagCode,
    required this.onOpen,
  });

  final String language;
  final String flagCode;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        child: Container(
          constraints: const BoxConstraints(minHeight: 62),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.border,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              LanguageFlag(flagCode, width: 39, height: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  language,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.primary,
                    fontSize: 16,
                    height: 20 / 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Material(
                color: AppColors.primary,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onOpen,
                  child: const SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                      size: 16,
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

class _SheetLanguage {
  const _SheetLanguage(this.code, this.label, {this.comingSoon = false});

  final String code;
  final String label;
  final bool comingSoon;
}

class _LanguagePickerSheet extends StatelessWidget {
  const _LanguagePickerSheet({
    required this.title,
    required this.languages,
    required this.selectedCode,
    this.targetMode = false,
  });

  final String title;
  final List<_SheetLanguage> languages;
  final String selectedCode;
  final bool targetMode;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final activeLanguages = languages.where((item) => !item.comingSoon).toList();
    final comingSoonLanguages =
        languages.where((item) => item.comingSoon).toList();

    // Figma overlay: black 20% + Background blur
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: ColoredBox(
              color: Colors.black.withValues(alpha: 0.20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * .72,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                  child: SizedBox(
                    height: 34,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.ink,
                              fontSize: 14,
                              height: 24 / 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: text.common.close,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Color(0xFFACACAC),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottom),
                    shrinkWrap: true,
                    children: [
                      for (final item in activeLanguages)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _LanguageSheetRow(
                            item: item,
                            selected: item.code == selectedCode,
                            onTap: () => Navigator.of(context).pop(item),
                          ),
                        ),
                      // Coming soon yalnızca Target language sheet'te
                      if (targetMode && comingSoonLanguages.isNotEmpty)
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                for (final item in comingSoonLanguages)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: _LanguageSheetRow(
                                      item: item,
                                      selected: false,
                                      disabled: true,
                                    ),
                                  ),
                              ],
                            ),
                            IgnorePointer(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(999),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary
                                          .withValues(alpha: .18),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  text.language.comingSoonBadge,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 18 / 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageSheetRow extends StatelessWidget {
  const _LanguageSheetRow({
    required this.item,
    required this.selected,
    this.onTap,
    this.disabled = false,
  });

  final _SheetLanguage item;
  final bool selected;
  final VoidCallback? onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? .35 : 1,
      child: Material(
        color: selected ? AppColors.primaryTint10 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: disabled ? null : onTap,
          child: Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Row(
              children: [
                LanguageFlag(item.code, width: 39, height: 30),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: selected
                          ? AppColors.primary
                          : const Color(0xFF606060),
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
