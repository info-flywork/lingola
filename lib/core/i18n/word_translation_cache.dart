/// Kelime çevirisi — oturum boyunca bellek önbelleği (anında tekrar gösterim).
abstract final class WordTranslationCache {
  static final _store = <String, String>{};

  static String _key(String word, String lang) =>
      '${lang.toLowerCase()}::${word.trim().toLowerCase()}';

  static String? get(String word, String lang) => _store[_key(word, lang)];

  static void put(String word, String lang, String translation) {
    final trimmed = translation.trim();
    if (trimmed.isEmpty) return;
    _store[_key(word, lang)] = trimmed;
  }
}
