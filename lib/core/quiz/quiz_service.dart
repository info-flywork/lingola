import 'dart:convert';
import 'dart:typed_data';

import '../auth/api_client.dart';

class QuizReadingCard {
  const QuizReadingCard({
    required this.id,
    required this.word,
    required this.phonetic,
    required this.translations,
    required this.sentence,
    required this.sentenceTranslation,
    required this.level,
    this.saved = false,
  });

  final String id;
  final String word;
  final String phonetic;
  final List<String> translations;
  final String sentence;
  final String sentenceTranslation;
  final String level;
  final bool saved;

  factory QuizReadingCard.fromJson(Map<String, dynamic> json) {
    final translations = json['translations'];
    return QuizReadingCard(
      id: json['id'] as String? ?? '',
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      translations: translations is List
          ? translations.map((e) => e.toString()).toList()
          : const [],
      sentence: json['sentence'] as String? ?? '',
      sentenceTranslation: json['sentenceTranslation'] as String? ?? '',
      level: json['level'] as String? ?? '',
      saved: json['saved'] == true,
    );
  }
}

class QuizWritingPrompt {
  const QuizWritingPrompt({
    required this.id,
    required this.word,
    required this.sentenceEn,
    required this.sentenceNative,
    required this.level,
  });

  final String id;
  final String word;
  final String sentenceEn;
  final String sentenceNative;
  final String level;

  factory QuizWritingPrompt.fromJson(Map<String, dynamic> json) {
    return QuizWritingPrompt(
      id: json['id'] as String? ?? '',
      word: json['word'] as String? ?? '',
      sentenceEn: json['sentence'] as String? ?? '',
      sentenceNative: json['sentenceTranslation'] as String? ?? '',
      level: json['level'] as String? ?? '',
    );
  }
}

class QuizEvalResult {
  const QuizEvalResult({
    required this.matched,
    required this.expected,
    required this.transcript,
  });

  final bool matched;
  final String expected;
  final String transcript;

  factory QuizEvalResult.fromJson(Map<String, dynamic> json) {
    return QuizEvalResult(
      matched: json['matched'] == true,
      expected: json['expected'] as String? ??
          json['promptEn'] as String? ??
          '',
      transcript: json['transcript'] as String? ?? '',
    );
  }
}

class QuizSpeakingPrompt {
  const QuizSpeakingPrompt({
    required this.id,
    required this.promptEn,
    required this.promptNative,
    required this.exampleAnswerEn,
    required this.keywords,
  });

  final String id;
  final String promptEn;
  final String promptNative;
  final String exampleAnswerEn;
  final List<String> keywords;

  factory QuizSpeakingPrompt.fromJson(Map<String, dynamic> json) {
    final keywords = json['keywords'];
    return QuizSpeakingPrompt(
      id: json['id'] as String? ?? '',
      promptEn: json['promptEn'] as String? ?? '',
      promptNative: json['promptNative'] as String? ?? '',
      exampleAnswerEn: json['exampleAnswerEn'] as String? ?? '',
      keywords: keywords is List
          ? keywords.map((e) => e.toString()).toList()
          : const [],
    );
  }
}

abstract final class QuizService {
  static Future<List<QuizReadingCard>> fetchReadingWords({
    int count = 10,
    List<String> excludeIds = const [],
  }) async {
    final qs = StringBuffer('/quiz/reading/words?count=$count');
    if (excludeIds.isNotEmpty) {
      qs.write('&exclude=${Uri.encodeQueryComponent(excludeIds.join(','))}');
    }
    final json = await ApiClient.get(qs.toString(), auth: true);
    final cards = json['cards'];
    if (cards is! List) return const [];
    return cards
        .whereType<Map<String, dynamic>>()
        .map(QuizReadingCard.fromJson)
        .toList();
  }

  static Future<QuizWritingPrompt?> fetchWritingPrompt({
    List<String> excludeIds = const [],
  }) async {
    final qs = StringBuffer('/quiz/writing/words?count=1');
    if (excludeIds.isNotEmpty) {
      qs.write('&exclude=${Uri.encodeQueryComponent(excludeIds.join(','))}');
    }
    final json = await ApiClient.get(qs.toString(), auth: true);
    final cards = json['cards'];
    if (cards is! List || cards.isEmpty) return null;
    final first = cards.first;
    if (first is! Map<String, dynamic>) return null;
    return QuizWritingPrompt.fromJson(first);
  }

  static Future<QuizEvalResult> evaluateWritingText({
    required String wordId,
    required String answer,
  }) async {
    final json = await ApiClient.post(
      '/quiz/writing/evaluate-text',
      auth: true,
      body: {
        'wordId': wordId,
        'answer': answer,
      },
    );
    return QuizEvalResult.fromJson(json);
  }

  static Future<QuizEvalResult> evaluateWritingAudio({
    required String wordId,
    required Uint8List bytes,
    required String contentType,
  }) async {
    final json = await ApiClient.post(
      '/quiz/writing/evaluate-audio',
      auth: true,
      body: {
        'wordId': wordId,
        'audioBase64': base64Encode(bytes),
        'contentType': contentType,
      },
    );
    return QuizEvalResult.fromJson(json);
  }

  static Future<List<QuizSpeakingPrompt>> fetchSpeakingPrompts({
    int count = 6,
  }) async {
    final json = await ApiClient.get(
      '/quiz/speaking/prompts?count=$count',
      auth: true,
    );
    final prompts = json['prompts'];
    if (prompts is! List) return const [];
    return prompts
        .whereType<Map<String, dynamic>>()
        .map(QuizSpeakingPrompt.fromJson)
        .toList();
  }

  static Future<QuizEvalResult> evaluateSpeaking({
    required String promptId,
    required String transcript,
  }) async {
    final json = await ApiClient.post(
      '/quiz/speaking/evaluate',
      auth: true,
      body: {
        'promptId': promptId,
        'transcript': transcript,
      },
    );
    return QuizEvalResult.fromJson(json);
  }
}
