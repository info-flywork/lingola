/// CEFR onboarding seviyeleri — API ve UI ortak kaynağı.
class CefrLevels {
  CefrLevels._();

  static const values = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
  static const defaultLevel = 'a1';

  static const emojis = ['🌱', '🌿', '💬', '🗣️', '🚀', '🏆'];

  static const iconAssets = [
    'assets/images/onboarding/levels/a1.png',
    'assets/images/onboarding/levels/a2level.png',
    'assets/images/onboarding/levels/b1level.png',
    'assets/images/onboarding/levels/b2level.png',
    'assets/images/onboarding/levels/c1.png',
    'assets/images/onboarding/levels/c2.png',
  ];

  /// Eski beginner/intermediate/advanced ve bilinmeyen değerleri normalize eder.
  static String normalize(String? level) {
    final raw = level?.trim().toLowerCase();
    if (raw == null || raw.isEmpty) return defaultLevel;
    switch (raw) {
      case 'beginner':
        return 'a1';
      case 'intermediate':
        return 'b1';
      case 'advanced':
        return 'c1';
      default:
        return values.contains(raw) ? raw : defaultLevel;
    }
  }

  static String displayCode(String? level) => normalize(level).toUpperCase();

  /// API payload — production henüz CEFR kabul etmiyorsa legacy bucket'a düşer.
  /// Sunucu a1–c2 destekleyince doğrudan `normalize(level)` döndür.
  static String forApi(String? level) {
    switch (normalize(level)) {
      case 'a1':
      case 'a2':
        return 'beginner';
      case 'b1':
      case 'b2':
        return 'intermediate';
      case 'c1':
      case 'c2':
        return 'advanced';
      default:
        return 'beginner';
    }
  }

  static int indexOf(String? level) {
    final normalized = normalize(level);
    final index = values.indexOf(normalized);
    return index >= 0 ? index : 0;
  }
}
