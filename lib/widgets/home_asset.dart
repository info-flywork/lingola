import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Asset yüklerken hata olursa uygulamayı düşürmez.
/// Fotoğraflar (.png) Image.asset; ikonlar (.svg) SvgPicture ile yüklenir.
class HomeAsset extends StatelessWidget {
  const HomeAsset(
    this.path, {
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    super.key,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  bool get _isSvg => path.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.maybeDevicePixelRatioOf(context) ?? 2.0;

    if (_isSvg) {
      return SvgPicture.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
        placeholderBuilder: (_) => _placeholder(),
        // Bozuk SVG olursa boş kutu göster, çökme.
        errorBuilder: (_, _, _) => _placeholder(),
      );
    }

    final cacheWidth = width != null
        ? (width! * dpr).round().clamp(1, 1600)
        : (420 * dpr).round().clamp(1, 1600);

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: cacheWidth,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
      errorBuilder: (_, _, _) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0x142D46FF),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
