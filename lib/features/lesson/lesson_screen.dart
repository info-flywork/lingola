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

  /// İlk 2 ders tamamlanmış: Greetings ✓, Introductions aktif.
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

    // Her seviye ayrı blok: başlık + bağımsız path (birleşik değil).
    final sections = <_LevelSectionData>[];
    var globalStart = 0;
    for (final level in LessonCurriculum.levels) {
      final lessons = lessonLists[level.id]!;
      final icons = level.iconAssets;
      final levelNodes = <_LessonPathNodeData>[
        for (var i = 0; i < lessons.length; i++)
          _LessonPathNodeData(
            label: lessons[i],
            iconAsset: icons[i < icons.length ? i : icons.length - 1],
          ),
      ];
      sections.add(
        _LevelSectionData(
          title: titles[level.id]!,
          nodes: levelNodes,
          globalStartIndex: globalStart,
        ),
      );
      globalStart += levelNodes.length;
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
              for (final section in sections)
                SliverToBoxAdapter(
                  child: _LevelPathSection(
                    title: section.title,
                    nodes: section.nodes,
                    globalStartIndex: section.globalStartIndex,
                    completedCount: _completedCount,
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonPathNodeData {
  const _LessonPathNodeData({required this.label, required this.iconAsset});
  final String label;
  final String iconAsset;
}

class _LevelSectionData {
  const _LevelSectionData({
    required this.title,
    required this.nodes,
    required this.globalStartIndex,
  });

  final String title;
  final List<_LessonPathNodeData> nodes;
  final int globalStartIndex;
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

/// Tek seviye: başlık + kendi path’i (A1 / A2 / … birbirine bağlı değil).
class _LevelPathSection extends StatelessWidget {
  const _LevelPathSection({
    required this.title,
    required this.nodes,
    required this.globalStartIndex,
    required this.completedCount,
  });

  final String title;
  final List<_LessonPathNodeData> nodes;
  final int globalStartIndex;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    if (nodes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(21, 20, 21, 4),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF3D3D3D),
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _LevelLessonPath(
          nodes: nodes,
          globalStartIndex: globalStartIndex,
          completedCount: completedCount,
        ),
      ],
    );
  }
}

/// Bir seviyenin bağımsız S-yolu — yumuşak U, ikon apex ortasında.
class _LevelLessonPath extends StatelessWidget {
  const _LevelLessonPath({
    required this.nodes,
    required this.globalStartIndex,
    required this.completedCount,
  });

  final List<_LessonPathNodeData> nodes;
  final int globalStartIndex;
  final int completedCount;

  static const _designWidth = 398.0;
  static const _leftX = 65.0;
  static const _rightX = 278.0;
  static const _nodeSize = 63.0;
  static const _pitch = 112.0;
  static const _y0 = 40.0;
  static const _trackStroke = 22.0;

  bool _isLeft(int index) => index.isOdd;

  ({List<double> hs, List<double> nodeCenters}) _layout(int n) {
    final hs = <double>[_y0];
    final nodeCenters = <double>[_y0];
    for (var i = 1; i < n; i++) {
      hs.add(hs.last + _pitch);
      final yTop = hs[hs.length - 2];
      final yBot = hs[hs.length - 1];
      nodeCenters.add((yTop + yBot) / 2);
    }
    return (hs: hs, nodeCenters: nodeCenters);
  }

  _NodeState _stateForLocal(int localIndex) {
    final global = globalStartIndex + localIndex;
    if (global < completedCount - 1) return _NodeState.completed;
    if (global == completedCount - 1) return _NodeState.active;
    return _NodeState.locked;
  }

  @override
  Widget build(BuildContext context) {
    final n = nodes.length;
    if (n == 0) return const SizedBox.shrink();

    final layout = _layout(n);
    final nodeCenters = layout.nodeCenters;
    final horizontalYs = layout.hs;

    double nodeTop(int i) => nodeCenters[i] - _nodeSize / 2;

    final lastTop = nodeTop(n - 1);
    final height = lastTop + _nodeSize + 48;
    final leftApex = _leftX + _nodeSize / 2;
    final rightApex = _rightX + _nodeSize / 2;
    const radius = _pitch / 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: height * (constraints.maxWidth / _designWidth),
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
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _LessonPathTrackPainter(
                        horizontalYs: horizontalYs,
                        leftApexX: leftApex,
                        rightApexX: rightApex,
                        radius: radius,
                        strokeWidth: _trackStroke,
                      ),
                    ),
                  ),
                  for (var i = 0; i < n; i++)
                    Positioned(
                      left: _isLeft(i) ? _leftX : _rightX,
                      top: nodeTop(i),
                      child: _LessonNode(
                        label: nodes[i].label,
                        iconAsset: nodes[i].iconAsset,
                        state: _stateForLocal(i),
                        // İlk node (Greetings): Figma’da etiket ikonun altında.
                        labelSide: i == 0
                            ? _LabelSide.below
                            : (_isLeft(i)
                                ? _LabelSide.right
                                : _LabelSide.left),
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
    required this.iconAsset,
    required this.state,
    required this.labelSide,
  });

  final String label;
  final String iconAsset;
  final _NodeState state;
  final _LabelSide labelSide;

  static const _size = 63.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final isLocked = state == _NodeState.locked;
    final circle = isLocked ? const Color(0xFFDBDBDB) : AppColors.primary;
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
              placeholderBuilder: (_) => const SizedBox(width: 28, height: 28),
            ),
          ),
          if (state == _NodeState.completed)
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
              // SVG viewBox 30x30; görünür daire ~22–23 (Figma).
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
          if (labelSide == _LabelSide.right)
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
          if (labelSide == _LabelSide.left)
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
          if (labelSide == _LabelSide.below)
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
class _LessonPathTrackPainter extends CustomPainter {
  _LessonPathTrackPainter({
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
  bool shouldRepaint(covariant _LessonPathTrackPainter oldDelegate) {
    return oldDelegate.horizontalYs != horizontalYs ||
        oldDelegate.leftApexX != leftApexX ||
        oldDelegate.rightApexX != rightApexX ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
