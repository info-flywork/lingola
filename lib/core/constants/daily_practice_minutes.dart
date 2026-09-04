/// Günlük pratik süresi (dakika) — onboarding seçenekleri.
class DailyPracticeMinutes {
  DailyPracticeMinutes._();

  static const values = [5, 10, 15, 30, 40, 60];
  static const defaultMinutes = 15;

  static int normalize(int? minutes) {
    if (minutes == null) return defaultMinutes;
    return values.contains(minutes) ? minutes : defaultMinutes;
  }

  static int indexOf(int? minutes) {
    final index = values.indexOf(normalize(minutes));
    return index >= 0 ? index : values.indexOf(defaultMinutes);
  }

  /// 30 günlük ay varsayımı: dk × 30 / 60.
  static double monthlyHours(int minutes) =>
      normalize(minutes) * 30 / 60.0;

  /// Örn. 5 → "2.5h", 10 → "5h", 15 → "7.5h".
  static String formatMonthlyHours(int minutes) {
    final hours = monthlyHours(minutes);
    if (hours == hours.roundToDouble()) {
      return '${hours.toInt()}h';
    }
    final fixed = hours.toStringAsFixed(1);
    if (fixed.endsWith('.0')) {
      return '${hours.toInt()}h';
    }
    return '${fixed}h';
  }
}
