import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';

/// Poppins emojileri kutuya çevirir — yalnızca sistem emoji fontu kullan.
const _emojiFontFallback = [
  'Apple Color Emoji',
  'Noto Color Emoji',
  'Segoe UI Emoji',
];

TextStyle profileEmojiStyle(double size) => TextStyle(
      fontSize: size,
      height: 1,
      inherit: false,
      fontFamilyFallback: _emojiFontFallback,
    );

Widget profileEmoji(String glyph, {double size = 20}) {
  return Text(
    glyph,
    style: profileEmojiStyle(size),
    textHeightBehavior: const TextHeightBehavior(
      applyHeightToFirstAscent: false,
      applyHeightToLastDescent: false,
    ),
  );
}

Widget profileTitleWithIcon({
  required String iconPath,
  required String title,
  double iconSize = 22,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      HomeAsset(iconPath, width: iconSize, height: iconSize),
      const SizedBox(width: 8),
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
    ],
  );
}

Widget profileTitleWithEmoji({
  required String emoji,
  required String title,
  double emojiSize = 18,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      profileEmoji(emoji, size: emojiSize),
      const SizedBox(width: 6),
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          height: 24 / 18,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
    ],
  );
}
