import '../../i18n/strings.g.dart';

class TargetLanguageOption {
  const TargetLanguageOption({
    required this.code,
    required this.label,
    this.comingSoon = false,
  });

  final String code;
  final String label;
  final bool comingSoon;
}

/// Öğrenmek istediğin dil — şimdilik yalnızca İngilizce aktif.
List<TargetLanguageOption> targetLanguageOptions(Translations text) {
  return [
    TargetLanguageOption(code: 'en', label: text.language.english),
    TargetLanguageOption(
      code: 'es',
      label: text.language.spanish,
      comingSoon: true,
    ),
    TargetLanguageOption(
      code: 'fr',
      label: text.language.french,
      comingSoon: true,
    ),
    TargetLanguageOption(
      code: 'de',
      label: text.targetLanguage.german,
      comingSoon: true,
    ),
  ];
}
