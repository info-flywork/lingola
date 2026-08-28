/// Speech-to-text eşleştirmesi: %85 benzerlik = başarılı.
class TextSimilarity {
  TextSimilarity._();

  static const double pronunciationThreshold = 0.85;

  static String normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  static double ratio(String a, String b) {
    if (a.isEmpty && b.isEmpty) return 1;
    if (a.isEmpty || b.isEmpty) return 0;
    final distance = _levenshtein(a, b);
    final maxLen = a.length > b.length ? a.length : b.length;
    return 1 - distance / maxLen;
  }

  static bool matches(String heard, String target,
      {double threshold = pronunciationThreshold}) {
    final a = normalize(heard);
    final b = normalize(target);
    if (a.isEmpty || b.isEmpty) return false;
    if (a == b) return true;
    if (ratio(a, b) >= threshold) return true;

    if (a.contains(b) || b.contains(a)) {
      final minLen = a.length < b.length ? a.length : b.length;
      final maxLen = a.length > b.length ? a.length : b.length;
      if (minLen / maxLen >= threshold) return true;
    }

    final aTokens = a.split(' ').where((t) => t.isNotEmpty).toList();
    final bTokens = b.split(' ').where((t) => t.isNotEmpty).toList();
    if (bTokens.isEmpty) return false;

    if (bTokens.length == 1) {
      return aTokens.any((t) => ratio(t, bTokens.first) >= threshold);
    }

    var matched = 0;
    for (final expected in bTokens) {
      if (aTokens.any((t) => ratio(t, expected) >= threshold)) {
        matched++;
      }
    }
    return matched / bTokens.length >= threshold;
  }

  /// Okuma testi: kelime veya örnek cümle ile eşleşme.
  static bool matchesReadingTarget({
    required String heard,
    required String word,
    required String sentence,
    double threshold = pronunciationThreshold,
  }) {
    if (matches(heard, word, threshold: threshold)) return true;
    if (matches(heard, sentence, threshold: threshold)) return true;
    return false;
  }

  static int _levenshtein(String a, String b) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;

    var previous = List<int>.generate(b.length + 1, (i) => i);
    for (var i = 0; i < a.length; i++) {
      final current = <int>[i + 1];
      for (var j = 0; j < b.length; j++) {
        final insertCost = current[j] + 1;
        final deleteCost = previous[j + 1] + 1;
        final replaceCost = previous[j] + (a.codeUnitAt(i) == b.codeUnitAt(j) ? 0 : 1);
        current.add([insertCost, deleteCost, replaceCost].reduce(
          (x, y) => x < y ? x : y,
        ));
      }
      previous = current;
    }
    return previous.last;
  }
}
