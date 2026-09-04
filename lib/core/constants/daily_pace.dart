import '../../i18n/strings.g.dart';

/// İlerleme temposu — onboarding + profil ortak kaynağı.
class DailyPace {
  DailyPace._();

  static const values = [
    'month1',
    'month2_3',
    'month6',
    'year1',
    'relaxed',
  ];
  static const defaultPace = 'month2_3';

  static const iconAssets = [
    'assets/images/onboarding/significant_progress/amonth.png',
    'assets/images/onboarding/significant_progress/twoOrThreeMonth.png',
    'assets/images/onboarding/significant_progress/sixMonth.png',
    'assets/images/onboarding/significant_progress/ayear.png',
    'assets/images/onboarding/significant_progress/easy.png',
  ];

  /// Eski light / recommended / fast / min* değerlerini yeni ufka çevirir.
  static String normalize(String? pace) {
    final raw = pace?.trim();
    if (raw == null || raw.isEmpty) return defaultPace;
    switch (raw) {
      case 'light':
      case 'min5':
        return 'relaxed';
      case 'min10':
        return 'year1';
      case 'recommended':
      case 'min15':
        return 'month6';
      case 'fast':
      case 'min30':
        return 'month2_3';
      case 'min60':
        return 'month1';
      default:
        return values.contains(raw) ? raw : defaultPace;
    }
  }

  static int indexOf(String? pace) {
    final normalized = normalize(pace);
    final index = values.indexOf(normalized);
    return index >= 0 ? index : values.indexOf(defaultPace);
  }

  static String iconFor(String? pace) => iconAssets[indexOf(pace)];

  /// Plan özeti satırları için tempo emojisi.
  static String emojiFor(String? pace) {
    return switch (normalize(pace)) {
      'month1' => '🚀',
      'month2_3' => '⚡',
      'month6' => '🎯',
      'year1' => '📅',
      _ => '☕',
    };
  }

  static String label(Translations t, String? pace) {
    final setup = t.setup;
    return switch (normalize(pace)) {
      'month1' => setup.paceMonth1,
      'month2_3' => setup.paceMonth2_3,
      'month6' => setup.paceMonth6,
      'year1' => setup.paceYear1,
      _ => setup.paceRelaxed,
    };
  }
}
