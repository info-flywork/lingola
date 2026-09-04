import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import 'home_asset.dart';

/// Path / uzun liste ekranlarında: alttayken ↓ (ilerleme), üstteyken ↑ (başa).
class PathScrollFab extends StatelessWidget {
  const PathScrollFab({
    required this.visible,
    required this.pointsToTop,
    required this.onTap,
    this.bottom = 16,
    this.right = 16,
    super.key,
  });

  final bool visible;
  final bool pointsToTop;
  final VoidCallback onTap;
  final double bottom;
  final double right;

  static const _size = 44.0;
  static const _radius = 14.0;
  static const _icon = 24.0;
  /// Figma: drop shadow Y=2, blur=0 → katı 2px alt bant (clip edilmez).
  static const _shadowY = 2.0;
  static const _border = Color(0xFFE2E2E2);

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    return Positioned(
      right: right,
      bottom: bottom,
      child: Container(
        decoration: BoxDecoration(
          color: _border,
          borderRadius: BorderRadius.circular(_radius),
        ),
        padding: const EdgeInsets.only(bottom: _shadowY),
        child: Material(
          color: Colors.transparent,
          elevation: 0,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(_radius),
            child: Ink(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(_radius),
                border: Border.all(color: _border),
              ),
              child: Center(
                // Asset yukarı ok; aşağı gitmek için 180° çevir.
                child: pointsToTop
                    ? const HomeAsset(
                        AppAssets.pathScrollArrow,
                        width: _icon,
                        height: _icon,
                      )
                    : Transform.rotate(
                        angle: 3.141592653589793,
                        child: const HomeAsset(
                          AppAssets.pathScrollArrow,
                          width: _icon,
                          height: _icon,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
