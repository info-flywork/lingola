import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

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
  OpenAiChatService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

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

    final request = http.MultipartRequest('POST', Uri.parse(_transcribeUrl))
      ..headers['Authorization'] = 'Bearer ${AppEnv.openAiApiKey}'
      ..fields['model'] = 'whisper-1'
      ..fields['language'] = 'en'
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          audioFile.path,
          filename: 'speech.m4a',
        ),
      );

    final streamed = await _client.send(request);
    final body = await streamed.stream.bytesToString();
    if (streamed.statusCode < 200 || streamed.statusCode >= 300) {
      throw StateError('Whisper ${streamed.statusCode}: $body');
    }
    final data = jsonDecode(body) as Map<String, dynamic>;
    return (data['text'] as String?)?.trim() ?? '';
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

    final res = await _client.post(
      Uri.parse(_chatUrl),
      headers: {
        'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': _model,
        'temperature': 0.7,
        'max_tokens': 120,
        'messages': messages,
      }),
    );

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw StateError('OpenAI ${res.statusCode}: ${res.body}');
    }

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final choices = data['choices'] as List<dynamic>?;
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
  }

  /// İngilizce → Türkçe (kelime veya cümle). Yanıtta sadece çeviri.
  Future<String> translateToTurkish(String text) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError('OPENAI_API_KEY eksik (.env)');
    }
    final trimmed = text.trim();
    if (trimmed.isEmpty) return '';

    final res = await _client.post(
      Uri.parse(_chatUrl),
      headers: {
        'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
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
      }),
    );

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw StateError('OpenAI translate ${res.statusCode}: ${res.body}');
    }

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final choices = data['choices'] as List<dynamic>?;
    if (choices == null || choices.isEmpty) {
      throw StateError('OpenAI boş çeviri');
    }
    final content = choices.first as Map<String, dynamic>;
    final message = content['message'] as Map<String, dynamic>?;
    return (message?['content'] as String?)?.trim() ?? '';
  }

  void dispose() => _client.close();
}
