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
    final file = fileByCode[code] ?? code;
    return 'assets/images/flags/$file.svg';
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SvgPicture.asset(
        assetPathFor(code),
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholderBuilder: (_) => SizedBox(width: width, height: height),
      ),
    );
  }
}
