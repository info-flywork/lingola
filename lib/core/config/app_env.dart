import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Local `.env` — gitignore’da. Key’leri asla kaynak koda yazma.
abstract final class AppEnv {
  /// Fiziksel cihaz için Mac LAN IP (`.env` / tunnel yoksa fallback).
  static const _devLanApi = 'http://192.168.1.106:3000';

  static String get openAiApiKey =>
      dotenv.isInitialized ? (dotenv.env['OPENAI_API_KEY']?.trim() ?? '') : '';

  static String get elevenLabsApiKey =>
      dotenv.isInitialized ? (dotenv.env['ELEVENLABS_API_KEY']?.trim() ?? '') : '';

  static String get elevenLabsVoiceId {
    if (!dotenv.isInitialized) return 'WZlYpi1yf6zJhNWXih74';
    final id = dotenv.env['ELEVENLABS_VOICE_ID']?.trim();
    return (id != null && id.isNotEmpty) ? id : 'WZlYpi1yf6zJhNWXih74';
  }

  /// Öncelik: `--dart-define=API_BASE_URL=` → `.env` → LAN fallback.
  /// Fiziksel cihazda `127.0.0.1` Mac’e gitmez; tunnel (https://…trycloudflare.com) tercih et.
  static String get apiBaseUrl {
    const fromDefine = String.fromEnvironment('API_BASE_URL');
    if (fromDefine.trim().isNotEmpty) return fromDefine.trim().replaceAll(RegExp(r'/+$'), '');

    if (dotenv.isInitialized) {
      final fromEnv = dotenv.env['API_BASE_URL']?.trim();
      if (fromEnv != null && fromEnv.isNotEmpty) {
        final cleaned = fromEnv.replaceAll(RegExp(r'/+$'), '');
        // Simulator/desktop dışında localhost fiziksel telefonda işe yaramaz.
        if (cleaned.contains('127.0.0.1') || cleaned.contains('localhost')) {
          return _devLanApi;
        }
        return cleaned;
      }
    }
    return _devLanApi;
  }

  static bool get hasOpenAi => openAiApiKey.isNotEmpty;
  static bool get hasElevenLabs => elevenLabsApiKey.isNotEmpty;
}

/// Hoca bazlı ElevenLabs voice ID’leri.
abstract final class TutorVoiceIds {
  /// Ukrath (ork)
  static const ukrath = 'wXvR48IpOq9HACltTmt7';

  /// Santa / Noel Baba
  static const santa = 'uDsPstFWFBUXjIBimV7s';

  /// Zephyrion (uzaylı)
  static const zephyrion = 'TsHrPyMlNFuIYnbODF01';

  /// Kalan erkek hocalar (varsayılan)
  static const male = 'sJ8GED3d0sN1d0bmD6mH';

  /// Kadın hocalar / Word Practice Listen
  static const female = 'WZlYpi1yf6zJhNWXih74';
}
