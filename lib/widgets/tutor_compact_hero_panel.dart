import 'package:flutter/material.dart';

import '../features/tutor/tutor_scene_theme.dart';

/// Onboarding robot + tutor yarım ekran üst bölümü (gradient + avatar alanı).
class TutorCompactHeroPanel extends StatelessWidget {
  const TutorCompactHeroPanel({
    required this.topBar,
    required this.avatar,
    this.speedLabel,
    this.lessonBadge,
    this.heroHeight = 400,
    super.key,
  });

  final Widget topBar;
  final Widget avatar;
  final String? speedLabel;
  final String? lessonBadge;
  final double heroHeight;

  static const _pillBg = Color(0x80000000);

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: topInset + heroHeight,
          child: const OnboardingHeroBackdrop(),
        ),
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              topBar,
              SizedBox(
                height: heroHeight - 48,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    avatar,
                    if (speedLabel != null)
                      Positioned(
                        left: 16,
                        bottom: 24,
                        child: _Pill(child: Text(speedLabel!)),
                      ),
                    if (lessonBadge != null)
                      Positioned(
                        right: 16,
                        bottom: 24,
                        child: _Pill(child: Text(lessonBadge!)),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: TutorCompactHeroPanel._pillBg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
