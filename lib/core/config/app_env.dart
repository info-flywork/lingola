import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Local `.env` — gitignore’da. Key’leri asla kaynak koda yazma.
abstract final class AppEnv {
  static String get openAiApiKey =>
      dotenv.env['OPENAI_API_KEY']?.trim() ?? '';

  static String get elevenLabsApiKey =>
      dotenv.env['ELEVENLABS_API_KEY']?.trim() ?? '';

  static String get elevenLabsVoiceId =>
      dotenv.env['ELEVENLABS_VOICE_ID']?.trim().isNotEmpty == true
          ? dotenv.env['ELEVENLABS_VOICE_ID']!.trim()
          : 'WZlYpi1yf6zJhNWXih74';

  static bool get hasOpenAi => openAiApiKey.isNotEmpty;
  static bool get hasElevenLabs => elevenLabsApiKey.isNotEmpty;
}
