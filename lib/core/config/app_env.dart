import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Canlı Lingola API + RevenueCat public keys (.env).
abstract final class AppEnv {
  /// Canlı Lingola API (Xcode / TestFlight / debug hepsi aynı).
  static const apiBaseUrl = 'https://lingola.fly-work.com';

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

  /// Diego (özel erkek ses)
  static const diego = 'PIGsltMj3gFMR34aFDI3';

  /// Lingola robot (onboarding + role play)
  static const lingola = 'JAATlCsz6GCH2vUjFcLg';

  /// Kalan erkek hocalar (varsayılan)
  static const male = 'sJ8GED3d0sN1d0bmD6mH';

  /// Kadın hocalar / Word Practice Listen
  static const female = 'WZlYpi1yf6zJhNWXih74';

  static const _femaleSlugs = {
    'elena',
    'freya',
    'camila',
    'ines',
    'amara',
    'katie',
    'vaelen',
  };

  /// Önce DB/API `voice_id`; yoksa slug fallback. Lingola her zaman robot sesi.
  static String resolve(String? slug, {String? preferred}) {
    final key = (slug ?? '').trim().toLowerCase();
    if (key == 'lingola') return lingola;

    final fromDb = preferred?.trim();
    if (fromDb != null && fromDb.isNotEmpty) return fromDb;

    return switch (key) {
      'santa' => santa,
      'zephyrion' => zephyrion,
      'ukrath' => ukrath,
      'diego' => diego,
      'elrion' => male,
      _ when _femaleSlugs.contains(key) => female,
      _ when key.isNotEmpty => male,
      _ => female,
    };
  }
}
