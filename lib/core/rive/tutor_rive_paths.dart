/// DB'deki yanlış local_rive_path değerlerini bundle'daki gerçek dosyaya çevirir.
abstract final class TutorRivePaths {
  static const _aliases = <String, String>{
    'assets/ukrath.riv': 'assets/riv/ukrath.riv',
    'assets/elrion.riv': 'assets/riv/elrion.riv',
    'assets/riv/Female/katie.riv': 'assets/riv/Female/kaite.riv',
  };

  static String? normalize(String? path) {
    if (path == null || path.trim().isEmpty) return null;
    final trimmed = path.trim();
    return _aliases[trimmed] ?? trimmed;
  }
}
