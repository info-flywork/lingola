import 'dart:convert';
import 'dart:io';

import '../../../core/auth/api_client.dart';

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

  Future<String> translateToTurkish(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return '';

    final json = await ApiClient.post(
      '/ai/translate',
      body: {'text': trimmed},
    );
    return (json['text'] as String?)?.trim() ?? '';
  }

  void dispose() {}
}
