import '../../i18n/strings.g.dart';

/// Sertifika belgesi metinleri — uygulama dili ne olursa olsun İngilizce.
abstract final class CertificateCopy {
  CertificateCopy._();

  static final Translations$profilePage$en _page = TranslationsEn().profilePage;

  static Translations$profilePage$en get page => _page;
}
