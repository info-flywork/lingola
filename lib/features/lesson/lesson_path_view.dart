import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';

enum LessonNodeState { active, completed, locked, unlocked }

enum LessonPathLabelSide { left, right, below }

class LessonPathNode {
  const LessonPathNode({
    required this.label,
    required this.iconAsset,
    required this.state,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final LessonNodeState state;
  final VoidCallback onTap;
}

/// Bir seviyenin bağımsız S-yolu — yumuşak U, ikon apex ortasında.
class LessonPathView extends StatelessWidget {
  const LessonPathView({
    super.key,
    required this.nodes,
    this.progressNodeIndex,
    this.progressAnchorKey,
  });

  final List<LessonPathNode> nodes;
  final int? progressNodeIndex;
  final GlobalKey? progressAnchorKey;

  static const designWidth = 398.0;
  static const leftX = 65.0;
  static const rightX = 278.0;
  static const nodeSize = 63.0;
  static const pitch = 112.0;
  static const y0 = 40.0;
  static const trackStroke = 22.0;

  /// İlk ~5 node (Daily Routine) için yaklaşık viewport yüksekliği.
  static double viewportHeightForWidth(double width, {int visibleNodes = 5}) {
    final n = visibleNodes.clamp(1, 32);
    final layout = layoutMetrics(n);
    final lastTop = layout.nodeCenters[n - 1] - nodeSize / 2;
    // Daily Routine civarı: son görünür node + biraz pay.
    final designH = lastTop + nodeSize + 24;
    return designH * (width / designWidth);
  }

  static ({List<double> hs, List<double> nodeCenters}) layoutMetrics(int n) {
    final hs = <double>[y0];
    final nodeCenters = <double>[y0];
    for (var i = 1; i < n; i++) {
      hs.add(hs.last + pitch);
      final yTop = hs[hs.length - 2];
      final yBot = hs[hs.length - 1];
      nodeCenters.add((yTop + yBot) / 2);
    }
    return (hs: hs, nodeCenters: nodeCenters);
  }

  bool _isLeft(int index) => index.isOdd;

  @override
  Widget build(BuildContext context) {
    final n = nodes.length;
    if (n == 0) return const SizedBox.shrink();

    final layout = layoutMetrics(n);
    final nodeCenters = layout.nodeCenters;
    final horizontalYs = layout.hs;

    double nodeTop(int i) => nodeCenters[i] - nodeSize / 2;

    final lastTop = nodeTop(n - 1);
    final height = lastTop + nodeSize + 48;
    final leftApex = leftX + nodeSize / 2;
    final rightApex = rightX + nodeSize / 2;
    const radius = pitch / 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: height * (constraints.maxWidth / designWidth),
          width: constraints.maxWidth,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: designWidth,
              height: height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: LessonPathTrackPainter(
                        horizontalYs: horizontalYs,
                        leftApexX: leftApex,
                        rightApexX: rightApex,
                        radius: radius,
                        strokeWidth: trackStroke,
                      ),
                    ),
                  ),
                  for (var i = 0; i < n; i++)
                    Positioned(
                      left: _isLeft(i) ? leftX : rightX,
                      top: nodeTop(i),
                      child: KeyedSubtree(
                        key: progressNodeIndex == i ? progressAnchorKey : null,
                        child: LessonPathNodeWidget(
                          label: nodes[i].label,
                          iconAsset: nodes[i].iconAsset,
                          state: nodes[i].state,
                          onTap: nodes[i].onTap,
                          labelSide: i == 0
                              ? LessonPathLabelSide.below
                              : (_isLeft(i)
                                  ? LessonPathLabelSide.right
                                  : LessonPathLabelSide.left),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LessonPathNodeWidget extends StatelessWidget {
  const LessonPathNodeWidget({
    super.key,
    required this.label,
    required this.iconAsset,
    required this.state,
    required this.labelSide,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final LessonNodeState state;
  final LessonPathLabelSide labelSide;
  final VoidCallback onTap;

  static const _size = 63.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final isLocked = state == LessonNodeState.locked;
    final isMuted =
        state == LessonNodeState.locked || state == LessonNodeState.unlocked;
    final circle = isMuted ? const Color(0xFFDBDBDB) : AppColors.primary;
    final iconColor = isMuted ? const Color(0xFF656565) : Colors.white;
    final labelColor = switch (state) {
      LessonNodeState.active => AppColors.primary,
      LessonNodeState.completed => AppColors.ink,
      LessonNodeState.locked => AppColors.secondary,
      LessonNodeState.unlocked => AppColors.secondary,
    };

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: _size,
        height: _size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: circle,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .18),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconAsset,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                placeholderBuilder: (_) =>
                    const SizedBox(width: 28, height: 28),
              ),
            ),
            if (state == LessonNodeState.completed)
              Positioned(
                right: -4,
                bottom: -4,
                child: Semantics(
                  label: text.lessonPage.completed,
                  child: Container(
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      color: const Color(0xFF34C759),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (isLocked)
              Positioned(
                right: -6,
                bottom: -2,
                child: Semantics(
                  label: text.lessonPage.locked,
                  child: SvgPicture.asset(
                    'assets/learningPath/a1/badge_lock.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            if (labelSide == LessonPathLabelSide.right)
              Positioned(
                left: _size + 10,
                top: (_size - 30) / 2,
                width: 118,
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: _labelStyle(labelColor),
                ),
              ),
            if (labelSide == LessonPathLabelSide.left)
              Positioned(
                left: -128,
                top: (_size - 30) / 2,
                width: 118,
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: _labelStyle(labelColor),
                ),
              ),
            if (labelSide == LessonPathLabelSide.below)
              Positioned(
                left: (_size - 118) / 2,
                top: _size + 6,
                width: 118,
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: _labelStyle(labelColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  TextStyle _labelStyle(Color color) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 12,
      height: 15 / 12,
      fontWeight: FontWeight.w500,
    );
  }
}

/// Yumuşak yarım daire U’lar; sabit yarıçap.
class LessonPathTrackPainter extends CustomPainter {
  LessonPathTrackPainter({
    required this.horizontalYs,
    required this.leftApexX,
    required this.rightApexX,
    required this.radius,
    required this.strokeWidth,
  });

  final List<double> horizontalYs;
  final double leftApexX;
  final double rightApexX;
  final double radius;
  final double strokeWidth;

  Path _buildCenterline() {
    final hs = horizontalYs;
    final path = Path();
    if (hs.isEmpty) return path;

    final leftInner = leftApexX + radius;
    final rightInner = rightApexX - radius;

    path.moveTo(rightApexX, hs[0]);
    if (hs.length == 1) return path;

    for (var i = 0; i < hs.length - 1; i++) {
      final yA = hs[i];
      final yB = hs[i + 1];
      if (i.isEven) {
        path.lineTo(leftInner, yA);
        path.arcToPoint(
          Offset(leftInner, yB),
          radius: Radius.circular(radius),
          clockwise: false,
        );
      } else {
        path.lineTo(rightInner, yA);
        path.arcToPoint(
          Offset(rightInner, yB),
          radius: Radius.circular(radius),
          clockwise: true,
        );
      }
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (horizontalYs.isEmpty) return;

    final track = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(_buildCenterline(), track);
  }

  @override
  bool shouldRepaint(covariant LessonPathTrackPainter oldDelegate) {
    return oldDelegate.horizontalYs != horizontalYs ||
        oldDelegate.leftApexX != leftApexX ||
        oldDelegate.rightApexX != rightApexX ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
