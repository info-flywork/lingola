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

  /// Kalan erkek hocalar (varsayılan)
  static const male = 'sJ8GED3d0sN1d0bmD6mH';

  /// Kadın hocalar / Word Practice Listen
  static const female = 'WZlYpi1yf6zJhNWXih74';
}
