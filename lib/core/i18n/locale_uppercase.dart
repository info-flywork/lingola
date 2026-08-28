import '../../i18n/strings.g.dart';

/// UI etiketleri için locale-duyarlı BÜYÜK HARF (TR: i→İ, ı→I).
String localeUpperCase(String value) {
  if (LocaleSettings.currentLocale == AppLocale.tr) {
    final buffer = StringBuffer();
    for (final rune in value.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(
        switch (char) {
          'i' => 'İ',
          'ı' => 'I',
          'ş' => 'Ş',
          'ğ' => 'Ğ',
          'ü' => 'Ü',
          'ö' => 'Ö',
          'ç' => 'Ç',
          _ => char.toUpperCase(),
        },
      );
    }
    return buffer.toString();
  }
  return value.toUpperCase();
}
