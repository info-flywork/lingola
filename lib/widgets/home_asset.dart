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
    this.alignment = Alignment.center,
    this.color,
    super.key,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;

  bool get _isSvg => path.toLowerCase().endsWith('.svg');
  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  static bool _isFinitePositive(double? v) =>
      v != null && v.isFinite && v > 0;

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.maybeDevicePixelRatioOf(context) ?? 2.0;

    if (_isSvg) {
      return SvgPicture.asset(
        path,
        width: _isFinitePositive(width) ? width : null,
        height: _isFinitePositive(height) ? height : null,
        fit: fit,
        alignment: alignment,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
        placeholderBuilder: (_) => _placeholder(),
        errorBuilder: (_, _, _) => _placeholder(),
      );
    }

    // Layout için infinity OK; cacheWidth sadece sonlu genişlikte hesaplanır.
    final int? cacheWidth;
    if (_isFinitePositive(width)) {
      cacheWidth = (width! * dpr).round().clamp(1, 1600);
    } else if (width == null) {
      cacheWidth = (420 * dpr).round().clamp(1, 1600);
    } else {
      cacheWidth = null;
    }

    if (_isNetwork) {
      return Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        cacheWidth: cacheWidth,
        filterQuality: FilterQuality.high,
        isAntiAlias: true,
        errorBuilder: (_, _, _) => _placeholder(),
      );
    }

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      cacheWidth: cacheWidth,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
      errorBuilder: (_, _, _) => _placeholder(),
    );
  }

  Widget _placeholder() {
    final w = _isFinitePositive(width) ? width : null;
    final h = _isFinitePositive(height) ? height : null;
    return SizedBox(
      width: w,
      height: h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0x142D46FF),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
