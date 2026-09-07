import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'home_asset.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  /// Figma CTA: 398×54, radius 10, fill #2D46FF, shadow #0015B4 Y:4.
  static const height = 54.0;
  static const radius = 10.0;
  static const shadowOffset = 4.0;

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkShadow,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: const EdgeInsets.only(bottom: shadowOffset),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            textStyle: AppTextStyles.primaryButton,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryButtonShadow,
        borderRadius: BorderRadius.circular(PrimaryButton.radius),
      ),
      padding: const EdgeInsets.only(bottom: PrimaryButton.shadowOffset),
      child: SizedBox(
        width: double.infinity,
        height: PrimaryButton.height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.secondaryButtonText,
            padding: const EdgeInsets.all(12),
            side: const BorderSide(
              color: AppColors.secondaryButtonShadow,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(PrimaryButton.radius),
            ),
            textStyle: AppTextStyles.primaryButton.copyWith(
              color: AppColors.secondaryButtonText,
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}

class LocalPicture extends StatelessWidget {
  const LocalPicture(
    this.name, {
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.fallbackIcon = Icons.image_outlined,
    this.width,
    this.height,
    super.key,
  });

  final String name;
  final BoxFit fit;
  final Alignment alignment;
  final IconData fallbackIcon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final path = 'assets/images/$name';
    if (name.endsWith('.svg')) {
      return HomeAsset(path, width: width, height: height, fit: fit);
    }

    final dpr = MediaQuery.devicePixelRatioOf(context);
    // Kaynak çözünürlüğünü bozmamak için cache’i yeterince yüksek tut.
    // Sadece width ver — height birlikte verilirse oran bozulup bulanıklaşır.
    final cacheWidth = width != null
        ? (width! * dpr).round().clamp(1, 4096)
        : (430 * dpr).round().clamp(1, 4096);

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      cacheWidth: cacheWidth,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
      gaplessPlayback: true,
      errorBuilder: (_, _, _) => _fallback(),
    );
  }

  Widget _fallback() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(fallbackIcon, color: AppColors.primary, size: 52),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, this.trailing, super.key});

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        if (trailing != null)
          Text(
            trailing!,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
