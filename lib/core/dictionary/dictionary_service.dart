import '../auth/api_client.dart';

class DictionaryWord {
  const DictionaryWord({
    required this.id,
    required this.word,
    required this.translation,
    this.level = '',
    this.phonetic = '',
    this.saved = false,
  });

  final String id;
  final String word;
  final String translation;
  final String level;
  final String phonetic;
  final bool saved;

  factory DictionaryWord.fromJson(Map<String, dynamic> json) {
    return DictionaryWord(
      id: json['id'] as String? ?? '',
      word: json['word'] as String? ?? '',
      translation: json['translation'] as String? ?? '',
      level: json['level'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      saved: json['saved'] == true,
    );
  }

  DictionaryWord copyWith({bool? saved}) {
    return DictionaryWord(
      id: id,
      word: word,
      translation: translation,
      level: level,
      phonetic: phonetic,
      saved: saved ?? this.saved,
    );
  }
}

class DictionaryPage {
  const DictionaryPage({
    required this.count,
    required this.items,
    required this.hasMore,
    required this.offset,
    required this.limit,
  });

  final int count;
  final List<DictionaryWord> items;
  final bool hasMore;
  final int offset;
  final int limit;

  factory DictionaryPage.fromJson(Map<String, dynamic> json) {
    final items = json['items'];
    return DictionaryPage(
      count: (json['count'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] == true,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      items: items is List
          ? items
              .whereType<Map<String, dynamic>>()
              .map(DictionaryWord.fromJson)
              .toList()
          : const [],
    );
  }
}

abstract final class DictionaryService {
  static Future<DictionaryPage> fetchWords({
    int limit = 20,
    int offset = 0,
    String? query,
  }) async {
    final q = (query ?? '').trim();
    final endpoint = q.isEmpty ? '/dictionary/words' : '/dictionary/search';
    final qs = StringBuffer('$endpoint?limit=$limit&offset=$offset');
    if (q.isNotEmpty) {
      qs.write('&q=${Uri.encodeQueryComponent(q)}');
    }
    final json = await ApiClient.get(qs.toString(), auth: true);
    return DictionaryPage.fromJson(json);
  }
}
