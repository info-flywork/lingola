import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

/// Figma: Primary Blue chip — W≈66 H≈19, corner radius 5.
class ChatWordChip extends StatelessWidget {
  const ChatWordChip({
    required this.label,
    required this.onTap,
    this.fontSize = 14,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSize,
            height: 19 / fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// Balon — kelime seçiliyken Figma’daki mavi çerçeve.
BoxDecoration chatBubbleDecoration({
  required bool wordSelected,
  Color background = Colors.white,
  double radius = 14,
}) {
  return BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: wordSelected
          ? AppColors.primary
          : Colors.black.withValues(alpha: 0.10),
      width: wordSelected ? 1.5 : 1,
    ),
  );
}
