import '../../i18n/strings.g.dart';

/// Günlük hedef süreleri — onboarding + profil ortak kaynağı.
class DailyPace {
  DailyPace._();

  static const values = ['min5', 'min10', 'min15', 'min30', 'min60'];
  static const defaultPace = 'min15';

  static const emojis = ['⏰', '⌛', '⛳', '🚀', '🔥'];

  /// Eski light / recommended / fast değerlerini yeni dakika kodlarına çevirir.
  static String normalize(String? pace) {
    final raw = pace?.trim();
    if (raw == null || raw.isEmpty) return defaultPace;
    switch (raw) {
      case 'light':
        return 'min5';
      case 'recommended':
        return 'min15';
      case 'fast':
        return 'min30';
      default:
        return values.contains(raw) ? raw : defaultPace;
    }
  }

  static int indexOf(String? pace) {
    final normalized = normalize(pace);
    final index = values.indexOf(normalized);
    return index >= 0 ? index : values.indexOf(defaultPace);
  }

  static String emojiFor(String? pace) => emojis[indexOf(pace)];

  static String label(Translations t, String? pace) {
    final plan = t.planReady;
    return switch (normalize(pace)) {
      'min5' => plan.paceMin5,
      'min10' => plan.paceMin10,
      'min30' => plan.paceMin30,
      'min60' => plan.paceMin60,
      _ => plan.paceMin15,
    };
  }
}
