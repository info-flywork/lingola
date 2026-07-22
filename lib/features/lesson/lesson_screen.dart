import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import 'lesson_curriculum.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  static const _completedCount = 2;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final levels = text.lessonPage.levels;
    final titles = <String, String>{
      'a1': levels.a1.title,
      'a2': levels.a2.title,
      'b1': levels.b1.title,
      'b2': levels.b2.title,
      'c1': levels.c1.title,
      'c2': levels.c2.title,
    };
    final lessonLists = <String, List<String>>{
      'a1': levels.a1.lessons,
      'a2': levels.a2.lessons,
      'b1': levels.b1.lessons,
      'b2': levels.b2.lessons,
      'c1': levels.c1.lessons,
      'c2': levels.c2.lessons,
    };

    final levelWidgets = <Widget>[];
    var globalIndex = 0;
    for (final level in LessonCurriculum.levels) {
      final start = globalIndex;
      final lessons = lessonLists[level.id]!;
      levelWidgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(21, 20, 21, 8),
          child: Text(
            titles[level.id]!,
            style: const TextStyle(
              color: Color(0xFF3D3D3D),
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
      levelWidgets.add(
        _LessonPathSection(
          lessons: lessons,
          iconKeys: level.iconKeys,
          startGlobalIndex: start,
          completedCount: _completedCount,
        ),
      );
      globalIndex += lessons.length;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            scrollCacheExtent: const ScrollCacheExtent.pixels(1200),
            slivers: [
              SliverToBoxAdapter(child: _LessonHeader(text: text)),
              for (final widget in levelWidgets)
                SliverToBoxAdapter(child: widget),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonHeader extends StatelessWidget {
  const _LessonHeader({required this.text});

  final Translations text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(21, 12, 21, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Semantics(
                label: text.lessonPage.profile,
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE5E5E5)),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
              ),
              const Spacer(),
              Semantics(
                label: text.lessonPage.language,
                child: Container(
                  width: 33,
                  height: 33,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'assets/images/flags/en.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            text.lessonPage.title,
            style: const TextStyle(
              color: AppColors.ink,
              fontFamily: 'Poppins',
              fontSize: 28,
              height: 36 / 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonPathSection extends StatelessWidget {
  const _LessonPathSection({
    required this.lessons,
    required this.iconKeys,
    required this.startGlobalIndex,
    required this.completedCount,
  });

  final List<String> lessons;
  final List<String> iconKeys;
  final int startGlobalIndex;
  final int completedCount;

  // Figma Lesson frame 393×… — Vector at x:70 w:227.72, nodes at x:53 / x:258
  static const _designWidth = 393.0;
  static const _leftX = 53.0;
  static const _rightX = 258.0;
  static const _rowGap = 89.0;
  static const _topPad = 18.0;
  static const _nodeSize = 63.0;

  /// Figma: first node is on the right (Greetings), then left, right, …
  bool _isLeft(int index) => index.isOdd;

  @override
  Widget build(BuildContext context) {
    final height = _topPad + lessons.length * _rowGap + 48;
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = constraints.maxWidth / _designWidth;
        return SizedBox(
          height: height * scale,
          width: constraints.maxWidth,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: _designWidth,
              height: height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    width: _designWidth,
                    height: height,
                    child: CustomPaint(
                      painter: _SnakePathPainter(
                        nodeCount: lessons.length,
                        rowGap: _rowGap,
                        topPad: _topPad,
                        leftX: _leftX + _nodeSize / 2,
                        rightX: _rightX + _nodeSize / 2,
                        completedThrough: math.max(
                          0,
                          completedCount - startGlobalIndex,
                        ),
                        isLeft: _isLeft,
                      ),
                    ),
                  ),
                  for (var i = 0; i < lessons.length; i++)
                    Positioned(
                      left: _isLeft(i) ? _leftX : _rightX,
                      top: _topPad + i * _rowGap,
                      child: _LessonNode(
                        label: lessons[i],
                        iconKey: iconKeys[i],
                        state: () {
                          final g = startGlobalIndex + i;
                          if (g < completedCount - 1) {
                            return _NodeState.active;
                          }
                          if (g == completedCount - 1) {
                            return _NodeState.completed;
                          }
                          return _NodeState.locked;
                        }(),
                        labelSide: _isLeft(i)
                            ? _LabelSide.right
                            : (i == 0 ? _LabelSide.below : _LabelSide.left),
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

enum _NodeState { active, completed, locked }

enum _LabelSide { left, right, below }

class _LessonNode extends StatelessWidget {
  const _LessonNode({
    required this.label,
    required this.iconKey,
    required this.state,
    required this.labelSide,
  });

  final String label;
  final String iconKey;
  final _NodeState state;
  final _LabelSide labelSide;

  static const _size = 63.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final isLocked = state == _NodeState.locked;
    // Figma: locked nodes are white circles with dark icons; active/done are primary.
    final circle = isLocked ? Colors.white : AppColors.primary;
    final iconColor = isLocked ? const Color(0xFF656565) : Colors.white;
    final labelColor = switch (state) {
      _NodeState.active => AppColors.primary,
      _NodeState.completed => AppColors.ink,
      _NodeState.locked => AppColors.secondary,
    };

    return SizedBox(
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
              border: Border.all(
                color: isLocked ? const Color(0xFFF0F0F0) : Colors.white,
                width: 3,
              ),
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
              'assets/images/lessons/icons/$iconKey.svg',
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          if (state == _NodeState.completed)
            Positioned(
              right: -2,
              bottom: -2,
              child: Semantics(
                label: text.lessonPage.completed,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34C759),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.check_rounded, size: 12, color: Colors.white),
                ),
              ),
            ),
          if (isLocked)
            Positioned(
              right: -2,
              bottom: -2,
              child: Semantics(
                label: text.lessonPage.locked,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBDBDB),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .18),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/lessons/icons/lock.svg',
                    width: 11,
                    height: 11,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF656565),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          if (labelSide == _LabelSide.below)
            Positioned(
              top: _size + 4,
              left: -28,
              width: _size + 56,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: _labelStyle(labelColor),
              ),
            ),
          if (labelSide == _LabelSide.right)
            Positioned(
              left: _size + 8,
              top: (_size - 16) / 2,
              width: 120,
              child: Text(label, maxLines: 2, style: _labelStyle(labelColor)),
            ),
          if (labelSide == _LabelSide.left)
            Positioned(
              left: -128,
              top: (_size - 16) / 2,
              width: 120,
              child: Text(
                label,
                maxLines: 2,
                textAlign: TextAlign.right,
                style: _labelStyle(labelColor),
              ),
            ),
        ],
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

class _SnakePathPainter extends CustomPainter {
  _SnakePathPainter({
    required this.nodeCount,
    required this.rowGap,
    required this.topPad,
    required this.leftX,
    required this.rightX,
    required this.completedThrough,
    required this.isLeft,
  });

  final int nodeCount;
  final double rowGap;
  final double topPad;
  final double leftX;
  final double rightX;
  final int completedThrough;
  final bool Function(int index) isLeft;

  static const _stroke = 20.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (nodeCount <= 0) return;
    final track = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final progress = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Offset point(int i) {
      final x = isLeft(i) ? leftX : rightX;
      final y = topPad + i * rowGap + 31.5;
      return Offset(x, y);
    }

    // Figma Vector: tight rounded U-turns (not flat S-curves between nodes).
    final path = Path()..moveTo(point(0).dx, point(0).dy);
    for (var i = 1; i < nodeCount; i++) {
      final prev = point(i - 1);
      final curr = point(i);
      final dx = (curr.dx - prev.dx).abs();
      final dy = (curr.dy - prev.dy).abs();
      path.arcToPoint(
        curr,
        radius: Radius.elliptical(dx / 2, math.max(dy / 2, 1)),
        // Bottom U-turn so the snake keeps descending (Figma Vector).
        clockwise: curr.dx > prev.dx,
        largeArc: false,
      );
    }

    canvas.drawPath(path, track);

    if (completedThrough > 0) {
      final metrics = path.computeMetrics().toList();
      if (metrics.isNotEmpty) {
        final metric = metrics.first;
        final ratio = (completedThrough / math.max(nodeCount - 1, 1)).clamp(
          0.0,
          1.0,
        );
        final extract = metric.extractPath(0, metric.length * ratio);
        canvas.drawPath(extract, progress);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SnakePathPainter oldDelegate) {
    return oldDelegate.nodeCount != nodeCount ||
        oldDelegate.completedThrough != completedThrough ||
        oldDelegate.rowGap != rowGap;
  }
}
