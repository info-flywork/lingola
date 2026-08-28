import 'dart:convert';
import 'dart:io';

import '../../../core/auth/api_client.dart';
import '../../../core/i18n/native_language.dart';
import '../../../core/i18n/word_translation_cache.dart';

class ChatTurn {
  const ChatTurn({required this.role, required this.content});

  /// `system` | `user` | `assistant`
  final String role;
  final String content;

  Map<String, String> toJson() => {'role': role, 'content': content};
}

/// İngilizce pratik — backend üzerinden OpenAI proxy.
class OpenAiChatService {
  static const systemPrompt = '''
You are a friendly English tutor for a language-learning app called Lingola.
Lesson focus: A1 Greetings / simple conversation practice.
Rules:
- Speak in simple English (A1–A2). Keep replies short: 1–2 sentences.
- Gently correct mistakes by modeling the better phrase.
- Ask one easy follow-up question to keep the conversation going.
- Do not use markdown or bullet lists.
- Stay in character as a warm tutor.
''';

  Future<String> transcribe(File audioFile) async {
    final bytes = await audioFile.readAsBytes();
    final json = await ApiClient.post(
      '/ai/transcribe',
      body: {
        'audioBase64': base64Encode(bytes),
        'contentType': 'audio/m4a',
      },
    );
    return (json['text'] as String?)?.trim() ?? '';
  }

  Future<String> complete({
    required List<ChatTurn> history,
    required String userMessage,
    String? systemPrompt,
  }) async {
    final messages = <Map<String, String>>[
      {
        'role': 'system',
        'content': systemPrompt ?? OpenAiChatService.systemPrompt,
      },
      ...history.map((t) => t.toJson()),
      {'role': 'user', 'content': userMessage},
    ];

    final json = await ApiClient.post(
      '/ai/chat',
      body: {
        'messages': messages,
        'temperature': 0.7,
        'maxTokens': 120,
      },
    );
    final text = (json['text'] as String?)?.trim();
    if (text == null || text.isEmpty) {
      throw StateError('OpenAI boş yanıt');
    }
    return text;
  }

  Future<String> translateToNative(
    String text, {
    String? targetLang,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return '';

    final lang = NativeLanguageResolver.normalize(
      targetLang ?? NativeLanguageResolver.resolve(),
    );

    final cached = WordTranslationCache.get(trimmed, lang);
    if (cached != null) return cached;

    final json = await ApiClient.post(
      '/ai/translate',
      body: {
        'text': trimmed,
        'targetLang': lang,
      },
    );
    final result = (json['text'] as String?)?.trim() ?? '';
    if (result.isNotEmpty) {
      WordTranslationCache.put(trimmed, lang, result);
    }
    return result;
  }

  Future<String> translateToTurkish(String text) =>
      translateToNative(text, targetLang: 'tr');

  /// Hoca cümlesine uygun, öğrencinin söyleyebileceği kısa İngilizce cevap.
  Future<String> suggestStudentReply({
    required String tutorLastMessage,
    String? lessonContext,
  }) async {
    final tutor = tutorLastMessage.trim();
    if (tutor.isEmpty) return '';

    final json = await ApiClient.post(
      '/ai/chat',
      body: {
        'messages': [
          {
            'role': 'system',
            'content':
                'You help English learners reply in a spoken conversation. '
                'Given the tutor\'s last message, suggest ONE short natural English reply '
                'the student can say aloud (A1–A2, max 12 words). '
                'Stay on the same topic as the tutor. No quotes, no translation, no explanation — only the reply sentence.',
          },
          {
            'role': 'user',
            'content':
                '${lessonContext != null && lessonContext.trim().isNotEmpty ? 'Lesson: $lessonContext\n' : ''}'
                'Tutor said: "$tutor"\n'
                'Suggest the student reply:',
          },
        ],
        'temperature': 0.5,
        'maxTokens': 40,
      },
    );
    return (json['text'] as String?)?.trim() ?? '';
  }

  void dispose() {}
}
