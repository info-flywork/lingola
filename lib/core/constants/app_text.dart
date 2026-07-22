import '../../i18n/strings.g.dart';

/// Uygulamadaki tüm kullanıcı metinleri için tek erişim noktası.
///
/// Metinlerin asıl karşılıkları `lib/i18n/*.i18n.json` dosyalarındadır ve
/// Slang tarafından üretilir. Widget'lar doğrudan metin yazmak yerine bu
/// sınıf üzerinden aktif dile erişir.
abstract final class AppText {
  static Translations get current => t;
}
