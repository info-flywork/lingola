import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageFlag extends StatelessWidget {
  const LanguageFlag(this.code, {this.width = 40, this.height = 30, super.key});

  final String code;
  final double width;
  final double height;

  /// `assets/images/flags` dosya adları ile dil kodu eşlemesi.
  static String assetPathFor(String code) {
    const fileByCode = <String, String>{
      'en': 'en',
      'de': 'german',
      'it': 'italian',
      'fr': 'french',
      'tr': 'tr',
      'jp': 'jp',
      'ja': 'jp',
      'es': 'spanish_icon',
      'ru': 'russian',
      'hi': 'hi',
      'pt': 'po',
      'po': 'po',
      'zh': 'china',
      'cn': 'china',
    };
    final file = fileByCode[code.toLowerCase()] ?? code.toLowerCase();
    return 'assets/images/flags/$file.svg';
  }

  /// Küçük yuvarlak rozet (home / ders header) — SVG oranı korunur.
  static Widget badge(String code, {double size = 22}) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE2E2E2)),
          color: const Color(0xFFF3F4F8),
        ),
        child: ClipOval(
          child: SvgPicture.asset(
            assetPathFor(code),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            placeholderBuilder: (_) => const SizedBox.expand(),
            errorBuilder: (_, _, _) => _FlagFallback(code: code, size: size * 0.35),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Beyaz bayraklar (JP, RU üst şerit) arka planda kaybolmasın diye kenarlık.
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F8),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFE2E2E2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: SvgPicture.asset(
        assetPathFor(code),
        width: width,
        height: height,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        placeholderBuilder: (_) => SizedBox(width: width, height: height),
        errorBuilder: (_, _, _) => _FlagFallback(
          code: code,
          size: (height * 0.45).clamp(8, 14),
        ),
      ),
    );
  }
}

class _FlagFallback extends StatelessWidget {
  const _FlagFallback({required this.code, required this.size});

  final String code;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF3F4F8),
      child: Center(
        child: Text(
          code.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: size,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF606060),
            height: 1,
          ),
        ),
      ),
    );
  }
}
