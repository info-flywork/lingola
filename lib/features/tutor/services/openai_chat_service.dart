import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/config/app_env.dart';

class ChatTurn {
  const ChatTurn({required this.role, required this.content});

  /// `system` | `user` | `assistant`
  final String role;
  final String content;

  Map<String, String> toJson() => {'role': role, 'content': content};
}

/// Basit İngilizce pratik — OpenAI Chat Completions + Whisper.
class OpenAiChatService {
  OpenAiChatService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 60),
                sendTimeout: const Duration(seconds: 60),
              ),
            );

  final Dio _dio;

  static const _chatUrl = 'https://api.openai.com/v1/chat/completions';
  static const _transcribeUrl = 'https://api.openai.com/v1/audio/transcriptions';
  static const _model = 'gpt-4o-mini';

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

  /// Mindcoach gibi bulut STT — Apple Speech yok, simülatörde de çalışır.
  Future<String> transcribe(File audioFile) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError('OPENAI_API_KEY eksik (.env)');
    }

    final form = FormData.fromMap({
      'model': 'whisper-1',
      'language': 'en',
      'file': await MultipartFile.fromFile(
        audioFile.path,
        filename: 'speech.m4a',
      ),
    });

    try {
      final res = await _dio.post<Map<String, dynamic>>(
        _transcribeUrl,
        data: form,
        options: Options(
          headers: {'Authorization': 'Bearer ${AppEnv.openAiApiKey}'},
        ),
      );
      return (res.data?['text'] as String?)?.trim() ?? '';
    } on DioException catch (err) {
      throw StateError(
        'Whisper ${err.response?.statusCode}: ${err.response?.data ?? err.message}',
      );
    }
  }

  Future<String> complete({
    required List<ChatTurn> history,
    required String userMessage,
  }) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError('OPENAI_API_KEY eksik (.env)');
    }

    final messages = <Map<String, String>>[
      {'role': 'system', 'content': systemPrompt},
      ...history.map((t) => t.toJson()),
      {'role': 'user', 'content': userMessage},
    ];

    try {
      final res = await _dio.post<Map<String, dynamic>>(
        _chatUrl,
        data: {
          'model': _model,
          'temperature': 0.7,
          'max_tokens': 120,
          'messages': messages,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
            'Content-Type': 'application/json',
          },
        ),
      );

      final choices = res.data?['choices'] as List<dynamic>?;
      if (choices == null || choices.isEmpty) {
        throw StateError('OpenAI boş yanıt');
      }
      final content = choices.first as Map<String, dynamic>;
      final message = content['message'] as Map<String, dynamic>?;
      final text = (message?['content'] as String?)?.trim();
      if (text == null || text.isEmpty) {
        throw StateError('OpenAI boş yanıt');
      }
      return text;
    } on DioException catch (err) {
      throw StateError(
        'OpenAI ${err.response?.statusCode}: ${err.response?.data ?? err.message}',
      );
    }
  }

  /// İngilizce → Türkçe (kelime veya cümle). Yanıtta sadece çeviri.
  Future<String> translateToTurkish(String text) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError('OPENAI_API_KEY eksik (.env)');
    }
    final trimmed = text.trim();
    if (trimmed.isEmpty) return '';

    try {
      final res = await _dio.post<Map<String, dynamic>>(
        _chatUrl,
        data: {
          'model': _model,
          'temperature': 0.2,
          'max_tokens': 200,
          'messages': [
            {
              'role': 'system',
              'content':
                  'You translate English to Turkish for language learners. '
                  'Reply with only the Turkish translation, nothing else. '
                  'Keep it natural and concise.',
            },
            {'role': 'user', 'content': trimmed},
          ],
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
            'Content-Type': 'application/json',
          },
        ),
      );

      final choices = res.data?['choices'] as List<dynamic>?;
      if (choices == null || choices.isEmpty) {
        throw StateError('OpenAI boş çeviri');
      }
      final content = choices.first as Map<String, dynamic>;
      final message = content['message'] as Map<String, dynamic>?;
      return (message?['content'] as String?)?.trim() ?? '';
    } on DioException catch (err) {
      throw StateError(
        'OpenAI translate ${err.response?.statusCode}: ${err.response?.data ?? err.message}',
      );
    }
  }

  void dispose() => _dio.close(force: true);
}
