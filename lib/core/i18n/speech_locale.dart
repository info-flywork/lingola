import 'package:speech_to_text/speech_to_text.dart';

import 'native_language.dart';

/// Cihaz STT için dil kodu → locale eşlemesi.
abstract final class SpeechLocaleResolver {
  static const _preferredByCode = <String, List<String>>{
    'tr': ['tr_TR', 'tr-TR'],
    'en': ['en_US', 'en-US', 'en_GB', 'en-GB'],
    'de': ['de_DE', 'de-DE', 'de_AT', 'de-CH'],
    'es': ['es_ES', 'es-ES', 'es_MX', 'es-MX', 'es_US'],
    'fr': ['fr_FR', 'fr-FR', 'fr_CA', 'fr-CA'],
    'it': ['it_IT', 'it-IT'],
    'pt': ['pt_PT', 'pt-PT', 'pt_BR', 'pt-BR'],
    'ru': ['ru_RU', 'ru-RU'],
    'ja': ['ja_JP', 'ja-JP'],
    'hi': ['hi_IN', 'hi-IN'],
    'zh': ['zh_CN', 'zh-CN', 'zh_TW', 'zh-TW'],
  };

  static String resolve({
    String? nativeCode,
    List<LocaleName> availableLocales = const [],
  }) {
    final code = NativeLanguageResolver.normalize(nativeCode, fallback: 'tr');
    final availableIds =
        availableLocales.map((locale) => locale.localeId).toSet();
    if (availableIds.isEmpty) {
      return _fallbackLocaleId(code);
    }

    for (final preferred in _preferredByCode[code] ?? const []) {
      if (availableIds.contains(preferred)) return preferred;
    }

    final prefix = code.toLowerCase();
    for (final locale in availableLocales) {
      final id = locale.localeId.toLowerCase();
      if (id.startsWith('$prefix-') || id.startsWith('${prefix}_')) {
        return locale.localeId;
      }
    }

    for (final preferred in _preferredByCode['en']!) {
      if (availableIds.contains(preferred)) return preferred;
    }

    return availableLocales.first.localeId;
  }

  static String _fallbackLocaleId(String code) {
    return switch (code) {
      'tr' => 'tr_TR',
      'de' => 'de_DE',
      'es' => 'es_ES',
      'fr' => 'fr_FR',
      'it' => 'it_IT',
      'pt' => 'pt_PT',
      'ru' => 'ru_RU',
      'ja' => 'ja_JP',
      'hi' => 'hi_IN',
      'zh' => 'zh_CN',
      _ => 'en_US',
    };
  }
}
