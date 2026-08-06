import '../auth/api_client.dart';

class PracticeCard {
  const PracticeCard({
    required this.id,
    required this.word,
    required this.phonetic,
    required this.translations,
    required this.sentence,
    required this.sentenceTranslation,
    required this.targetLang,
    required this.nativeLang,
    this.saved = false,
  });

  final String id;
  final String word;
  final String phonetic;
  final List<String> translations;
  final String sentence;
  final String sentenceTranslation;
  final String targetLang;
  final String nativeLang;
  final bool saved;

  PracticeCard copyWith({bool? saved}) {
    return PracticeCard(
      id: id,
      word: word,
      phonetic: phonetic,
      translations: translations,
      sentence: sentence,
      sentenceTranslation: sentenceTranslation,
      targetLang: targetLang,
      nativeLang: nativeLang,
      saved: saved ?? this.saved,
    );
  }

  factory PracticeCard.fromJson(Map<String, dynamic> json) {
    final translations = json['translations'];
    return PracticeCard(
      id: json['id'] as String? ?? '',
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      translations: translations is List
          ? translations.map((e) => e.toString()).toList()
          : const [],
      sentence: json['sentence'] as String? ?? '',
      sentenceTranslation: json['sentenceTranslation'] as String? ?? '',
      targetLang: json['targetLang'] as String? ?? 'en',
      nativeLang: json['nativeLang'] as String? ?? 'tr',
      saved: json['saved'] == true,
    );
  }
}

class PracticeSession {
  const PracticeSession({
    required this.nativeLang,
    required this.targetLang,
    required this.level,
    required this.cards,
  });

  final String nativeLang;
  final String targetLang;
  final String level;
  final List<PracticeCard> cards;

  factory PracticeSession.fromJson(Map<String, dynamic> json) {
    final cards = json['cards'];
    return PracticeSession(
      nativeLang: json['nativeLang'] as String? ?? 'tr',
      targetLang: json['targetLang'] as String? ?? 'en',
      level: json['level'] as String? ?? 'beginner',
      cards: cards is List
          ? cards
              .whereType<Map<String, dynamic>>()
              .map(PracticeCard.fromJson)
              .toList()
          : const [],
    );
  }
}

class SavedWord {
  const SavedWord({
    required this.id,
    required this.word,
    required this.translation,
    required this.translations,
    required this.level,
    this.phonetic = '',
    this.savedAt,
  });

  final String id;
  final String word;
  final String translation;
  final List<String> translations;
  final String level;
  final String phonetic;
  final DateTime? savedAt;

  factory SavedWord.fromJson(Map<String, dynamic> json) {
    final translations = json['translations'];
    final list = translations is List
        ? translations.map((e) => e.toString()).toList()
        : const <String>[];
    final rawAt = json['savedAt'];
    return SavedWord(
      id: json['id'] as String? ?? '',
      word: json['word'] as String? ?? '',
      translation: json['translation'] as String? ?? (list.isNotEmpty ? list.first : ''),
      translations: list,
      level: json['level'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      savedAt: rawAt is String ? DateTime.tryParse(rawAt) : null,
    );
  }
}

class SavedWordsPage {
  const SavedWordsPage({
    required this.count,
    required this.items,
    required this.nativeLang,
  });

  final int count;
  final List<SavedWord> items;
  final String nativeLang;

  factory SavedWordsPage.fromJson(Map<String, dynamic> json) {
    final items = json['items'];
    return SavedWordsPage(
      count: (json['count'] as num?)?.toInt() ?? 0,
      nativeLang: json['nativeLang'] as String? ?? 'tr',
      items: items is List
          ? items
              .whereType<Map<String, dynamic>>()
              .map(SavedWord.fromJson)
              .toList()
          : const [],
    );
  }
}

abstract final class PracticeService {
  static Future<PracticeSession> fetchCards({int count = 5}) async {
    final json = await ApiClient.get(
      '/practice/words?count=$count',
      auth: true,
    );
    return PracticeSession.fromJson(json);
  }

  static Future<void> saveWord(String vocabularyWordId) async {
    await ApiClient.post(
      '/practice/words/$vocabularyWordId/save',
      auth: true,
    );
  }

  static Future<void> unsaveWord(String vocabularyWordId) async {
    await ApiClient.delete(
      '/practice/words/$vocabularyWordId/save',
      auth: true,
    );
  }

  static Future<SavedWordsPage> fetchSavedWords({String? query}) async {
    final q = (query ?? '').trim();
    final path = q.isEmpty
        ? '/practice/saved-words'
        : '/practice/saved-words?q=${Uri.encodeQueryComponent(q)}';
    final json = await ApiClient.get(path, auth: true);
    return SavedWordsPage.fromJson(json);
  }

  static Future<int> fetchSavedCount() async {
    final json = await ApiClient.get('/practice/saved-words/count', auth: true);
    return (json['count'] as num?)?.toInt() ?? 0;
  }
}
