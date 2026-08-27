import 'dart:ui';

import 'package:flutter/material.dart';

/// Liste kartı temaları + calling/chat sahne arka planı (Figma ellipse blur).
abstract final class TutorSceneTheme {
  static const themedSlugs = <String>{
    'santa',
    'zephyrion',
    'vaelen',
    'ukrath',
    'elrion',
  };

  /// Tutors listesiyle aynı gradient (slug fallback).
  static (Color start, Color end)? gradientForSlug(String? slug) {
    switch ((slug ?? '').toLowerCase().trim()) {
      case 'santa':
        return (const Color(0xFFE85D04), const Color(0xFF9B2226));
      case 'zephyrion':
        return (const Color(0xFF586168), const Color(0xFF184238));
      case 'vaelen':
        return (const Color(0xFF160A20), const Color(0xFF64557E));
      case 'ukrath':
        return (const Color(0xFF2A1812), const Color(0xFF833A21));
      case 'elrion':
        return (const Color(0xFF18452A), const Color(0xFFD7B35A));
      default:
        return null;
    }
  }

  static Color? resolveStart({Color? start, String? slug}) =>
      start ?? gradientForSlug(slug)?.$1;

  static Color? resolveEnd({Color? end, String? slug}) =>
      end ?? gradientForSlug(slug)?.$2;
}

/// Figma: base gradient + 3 layer-blur ellipse.
class TutorSceneBackdrop extends StatelessWidget {
  const TutorSceneBackdrop({
    this.gradientStart,
    this.gradientEnd,
    this.fadeToWhite = false,
    super.key,
  });

  final Color? gradientStart;
  final Color? gradientEnd;
  final bool fadeToWhite;

  bool get _themed => gradientStart != null && gradientEnd != null;

  @override
  Widget build(BuildContext context) {
    final start = gradientStart;
    final end = gradientEnd;

    // Figma default (Lingola robot): #63B1D9 → white + blue orbs
    // Themed specials: list card colors + matching orbs
    final baseTop = _themed
        ? start!
        : const Color(0xFF63B1D9);
    final baseMid = _themed
        ? Color.lerp(start!, end!, 0.45)!
        : const Color(0xFF9FD0E8);
    final baseBottom = fadeToWhite
        ? Colors.white
        : (_themed
            ? Color.lerp(end!, Colors.black, 0.18)!
            : const Color(0xFFB8D4F0));

    final orbA = _themed ? start! : const Color(0xFF2D46FF);
    final orbB = _themed
        ? Color.lerp(start!, end!, 0.4)!
        : const Color(0xFF37B2E3);
    final orbC = _themed ? end! : const Color(0xFF2D85FF);

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [baseTop, baseMid, baseBottom],
              stops: fadeToWhite
                  ? const [0.0, 0.22, 0.59]
                  : const [0.0, 0.45, 1.0],
            ),
          ),
        ),
        _BlurOrb(
          color: orbA.withValues(alpha: 0.85),
          size: 620,
          alignment: const Alignment(-0.35, -1.35),
          sigma: 48,
        ),
        _BlurOrb(
          color: orbB.withValues(alpha: 0.75),
          size: 560,
          alignment: const Alignment(0.55, -1.05),
          sigma: 42,
        ),
        _BlurOrb(
          color: orbC.withValues(alpha: 0.7),
          size: 480,
          alignment: const Alignment(-0.15, -0.55),
          sigma: 36,
        ),
      ],
    );
  }
}

class _BlurOrb extends StatelessWidget {
  const _BlurOrb({
    required this.color,
    required this.size,
    required this.alignment,
    required this.sigma,
  });

  final Color color;
  final double size;
  final Alignment alignment;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
