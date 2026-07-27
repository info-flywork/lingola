import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../../core/config/app_env.dart';

/// ElevenLabs TTS — voice [voiceId] veya [AppEnv.elevenLabsVoiceId].
/// Key yoksa OpenAI TTS fallback (demo için).
class TutorTtsService {
  TutorTtsService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<File> synthesizeToFile(String text, {String? voiceId}) async {
    final bytes = AppEnv.hasElevenLabs
        ? await _elevenLabs(text, voiceId: voiceId)
        : await _openAiTts(text);

    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/lingola_tts_${DateTime.now().millisecondsSinceEpoch}.mp3',
    );
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<Uint8List> _elevenLabs(String text, {String? voiceId}) async {
    final id = (voiceId != null && voiceId.trim().isNotEmpty)
        ? voiceId.trim()
        : AppEnv.elevenLabsVoiceId;
    final uri = Uri.parse(
      'https://api.elevenlabs.io/v1/text-to-speech/$id'
      '?output_format=mp3_44100_128',
    );
    final res = await _client.post(
      uri,
      headers: {
        'xi-api-key': AppEnv.elevenLabsApiKey,
        'Content-Type': 'application/json',
        'Accept': 'audio/mpeg',
      },
      body: jsonEncode({
        'text': text,
        'model_id': 'eleven_multilingual_v2',
        'voice_settings': {
          'stability': 0.45,
          'similarity_boost': 0.8,
        },
      }),
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw StateError('ElevenLabs ${res.statusCode}: ${res.body}');
    }
    return res.bodyBytes;
  }

  Future<Uint8List> _openAiTts(String text) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError(
        'TTS için OPENAI_API_KEY veya ELEVENLABS_API_KEY gerekli',
      );
    }
    final res = await _client.post(
      Uri.parse('https://api.openai.com/v1/audio/speech'),
      headers: {
        'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'tts-1',
        'voice': 'nova',
        'input': text,
      }),
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw StateError('OpenAI TTS ${res.statusCode}: ${res.body}');
    }
    return res.bodyBytes;
  }

  void dispose() => _client.close();
}
