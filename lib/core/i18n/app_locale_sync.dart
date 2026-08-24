import 'package:flutter/foundation.dart';

import '../../i18n/strings.g.dart';
import '../auth/session_store.dart';

/// Profil dil kodlarını Slang [AppLocale] ile eşler ve UI dilini günceller.
abstract final class AppLocaleSync {
  static final localeChanges = ValueNotifier<AppLocale>(
    LocaleSettings.currentLocale,
  );

  static AppLocale resolve(String rawCode) {
    final code = rawCode.trim().toLowerCase();
    return switch (code) {
      'tr' => AppLocale.tr,
      'de' => AppLocale.de,
      'it' => AppLocale.it,
      'fr' => AppLocale.fr,
      'jp' || 'ja' => AppLocale.ja,
      'es' => AppLocale.es,
      'ru' => AppLocale.ru,
      'hi' => AppLocale.hi,
      'pt' => AppLocale.pt,
      'zh' => AppLocale.zh,
      _ => AppLocale.en,
    };
  }

  /// Telefon / sistem dilini desteklenen uygulama koduna çevirir.
  static String deviceLocaleCode() {
    final device = AppLocaleUtils.findDeviceLocale();
    return switch (device) {
      AppLocale.tr => 'tr',
      AppLocale.de => 'de',
      AppLocale.it => 'it',
      AppLocale.fr => 'fr',
      AppLocale.ja => 'ja',
      AppLocale.es => 'es',
      AppLocale.ru => 'ru',
      AppLocale.hi => 'hi',
      AppLocale.pt => 'pt',
      AppLocale.zh => 'zh',
      _ => 'en',
    };
  }

  /// Oturumdaki veya profildeki dil kodunu uygular; Slang UI'ı yeniler.
  static Future<AppLocale> applyCode(String rawCode) async {
    final target = resolve(rawCode);
    if (LocaleSettings.currentLocale == target) return target;
    final applied = await LocaleSettings.setLocale(target);
    localeChanges.value = applied;
    return applied;
  }

  /// Uygulama açılışında cache'teki kullanıcı dilini veya cihaz dilini yükle.
  static Future<void> bootstrapFromCache() async {
    final user = await SessionStore.loadCachedUser();
    if (user == null) {
      final device = AppLocaleUtils.findDeviceLocale();
      final applied = await LocaleSettings.setLocale(device);
      localeChanges.value = applied;
      return;
    }
    await applyCode(user.appLocale);
  }

  static Future<void> applyFromUser(String? appLocale) async {
    if (appLocale == null || appLocale.trim().isEmpty) return;
    await applyCode(appLocale);
  }
}
