import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Local `.env` — gitignore’da. Key’leri asla kaynak koda yazma.
abstract final class AppEnv {
  /// `.env` / dart-define yoksa fallback (iOS Simulator).
  static const _devLanApi = 'http://127.0.0.1:3001';

  static String get openAiApiKey =>
      dotenv.isInitialized ? (dotenv.env['OPENAI_API_KEY']?.trim() ?? '') : '';

  static String get elevenLabsApiKey =>
      dotenv.isInitialized ? (dotenv.env['ELEVENLABS_API_KEY']?.trim() ?? '') : '';

  static String get elevenLabsVoiceId {
    if (!dotenv.isInitialized) return 'WZlYpi1yf6zJhNWXih74';
    final id = dotenv.env['ELEVENLABS_VOICE_ID']?.trim();
    return (id != null && id.isNotEmpty) ? id : 'WZlYpi1yf6zJhNWXih74';
  }

  /// Öncelik: `--dart-define` → `.env` → fallback.
  /// Profil bazlı adres geçişi için launch.json'daki define her zaman kazanır.
  static String get apiBaseUrl {
    const fromDefine = String.fromEnvironment('API_BASE_URL');
    if (fromDefine.trim().isNotEmpty) {
      return fromDefine.trim().replaceAll(RegExp(r'/+$'), '');
    }

    if (dotenv.isInitialized) {
      final fromEnv = dotenv.env['API_BASE_URL']?.trim();
      if (fromEnv != null && fromEnv.isNotEmpty) {
        return fromEnv.replaceAll(RegExp(r'/+$'), '');
      }
    }
    return _devLanApi;
  }

  static bool get hasOpenAi => openAiApiKey.isNotEmpty;
  static bool get hasElevenLabs => elevenLabsApiKey.isNotEmpty;

  static String get revenueCatIosPublicKey =>
      dotenv.isInitialized
          ? (dotenv.env['REVENUECAT_IOS_PUBLIC_KEY']?.trim() ?? '')
          : '';

  static String get revenueCatAndroidPublicKey =>
      dotenv.isInitialized
          ? (dotenv.env['REVENUECAT_ANDROID_PUBLIC_KEY']?.trim() ?? '')
          : '';
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
