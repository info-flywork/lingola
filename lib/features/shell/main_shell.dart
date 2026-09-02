import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_text.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../home/home_screen.dart';
import '../lesson/lesson_screen.dart';
import '../profile/profile_screen.dart';
import '../roleplay/role_play_screen.dart';
import '../tutor/tutor_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  static void goToTab(BuildContext context, int index) {
    context.findAncestorStateOfType<_MainShellState>()?.selectTab(index);
  }

  static void goToProfile(BuildContext context) => goToTab(context, 4);

  /// Bottom nav Lessons (index 2).
  static void goToLessons(BuildContext context) => goToTab(context, 2);

  /// Bottom nav Tutors (index 1).
  static void goToTutors(BuildContext context) => goToTab(context, 1);

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, 4);
  }

  void selectTab(int index) {
    if (!mounted) return;
    setState(() => _index = index.clamp(0, 4));
  }

  static const _iconSets = [
    (
      'assets/images/nav/home_active.svg',
      'assets/images/nav/home_inactive.svg',
    ),
    (
      'assets/images/nav/tutor_active.svg',
      'assets/images/nav/tutor_inactive.svg',
    ),
    (
      'assets/images/nav/lesson_active.svg',
      'assets/images/nav/lesson_inactive.svg',
    ),
    (
      'assets/images/nav/roleplay_active.svg',
      'assets/images/nav/roleplay_inactive.svg',
    ),
    (
      'assets/images/nav/profile_active.svg',
      'assets/images/nav/profile_inactive.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLocale>(
      valueListenable: AppLocaleSync.localeChanges,
      builder: (context, locale, _) {
        final text = AppText.current;
        final labels = [
          text.nav.home,
          text.nav.tutor,
          text.nav.lesson,
          text.nav.rolePlay,
          text.nav.profile,
        ];
        final localeKey = locale.languageCode;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            // Açık #F5F6FA zemin → koyu saat / wifi / şarj ikonları
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: AppColors.surface,
            body: SafeArea(
              top: _index != 1,
              bottom: false,
              child: IndexedStack(
                index: _index,
                children: [
                  HomeScreen(key: ValueKey('home-$localeKey')),
                  TutorScreen(key: ValueKey('tutor-$localeKey')),
                  LessonScreen(key: ValueKey('lesson-$localeKey')),
                  RolePlayScreen(key: ValueKey('roleplay-$localeKey')),
                  ProfileScreen(key: ValueKey('profile-$localeKey')),
                ],
              ),
            ),
            bottomNavigationBar: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black.withValues(alpha: .05)),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: 73,
                  child: Row(
                    children: List.generate(labels.length, (index) {
                      final active = _index == index;
                      final icons = _iconSets[index];
                      return Expanded(
                        child: _NavItem(
                          label: labels[index],
                          active: active,
                          activeIcon: icons.$1,
                          inactiveIcon: icons.$2,
                          onTap: () => setState(() => _index = index),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.active,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.onTap,
  });

  final String label;
  final bool active;
  final String activeIcon;
  final String inactiveIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primary : AppColors.navInactive;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                active ? activeIcon : inactiveIcon,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                allowDrawingOutsideViewBox: false,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.navLabel.copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
