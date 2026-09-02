import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import '../core/theme/app_theme.dart';
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
  static const _radius = 12.0;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    return Positioned(
      right: right,
      bottom: bottom,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryButtonShadow,
          borderRadius: BorderRadius.circular(_radius),
        ),
        padding: const EdgeInsets.only(bottom: 4),
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
                border: Border.all(color: AppColors.secondaryButtonShadow),
              ),
              child: Center(
                child: pointsToTop
                    ? Transform.rotate(
                        angle: 3.141592653589793,
                        child: const HomeAsset(
                          AppAssets.homeArrowDown,
                          width: 22,
                          height: 22,
                        ),
                      )
                    : const HomeAsset(
                        AppAssets.homeArrowDown,
                        width: 22,
                        height: 22,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
