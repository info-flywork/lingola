import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageFlag extends StatelessWidget {
  const LanguageFlag(this.code, {this.width = 40, this.height = 30, super.key});

  final String code;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SvgPicture.asset(
        'assets/images/flags/$code.svg',
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholderBuilder: (_) => SizedBox(width: width, height: height),
      ),
    );
  }
}
