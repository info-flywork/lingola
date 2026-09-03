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

  /// Figma export — SVG içinde gömülü PNG; flutter_svg render edemez.
  static const _embeddedRasterSvgPrefixes = [
    'assets/images/profilIcons/newProfileIcons/',
  ];

  String? get _companionPngPath {
    if (!_isSvg) return null;
    return path.replaceFirst(RegExp(r'\.svg$', caseSensitive: false), '.png');
  }

  bool get _useCompanionPng =>
      _companionPngPath != null &&
      _embeddedRasterSvgPrefixes.any((prefix) => path.startsWith(prefix));

  static bool _isFinitePositive(double? v) =>
      v != null && v.isFinite && v > 0;

  @override
  Widget build(BuildContext context) {
    if (_useCompanionPng) {
      return HomeAsset(
        _companionPngPath!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
      );
    }

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
        placeholderBuilder: (_) => _buildSvgFallback(context),
        errorBuilder: (_, _, _) => _buildSvgFallback(context),
      );
    }

    // Küçük ikonlarda cacheWidth/Height hem kırpıyor hem yumuşatıyor.
    final bool skipCacheResize =
        _isFinitePositive(width) &&
        width! <= 48 &&
        _isFinitePositive(height) &&
        height! <= 48;

    final int? cacheWidth = skipCacheResize
        ? null
        : _isFinitePositive(width)
        ? (width! * dpr).round().clamp(1, 2048)
        : width == null
        ? (420 * dpr).round().clamp(1, 2048)
        : null;

    final int? cacheHeight = skipCacheResize || !_isFinitePositive(height)
        ? null
        : (height! * dpr).round().clamp(1, 2048);

    if (_isNetwork) {
      return Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
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
      cacheHeight: cacheHeight,
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
      errorBuilder: (_, _, _) => _placeholder(),
    );
  }

  Widget _buildSvgFallback(BuildContext context) {
    final png = _companionPngPath;
    if (png != null) {
      return HomeAsset(
        png,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
      );
    }
    return _placeholder();
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
