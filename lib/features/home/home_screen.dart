import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/auth_service.dart';
import '../../core/auth/app_user.dart';
import '../../core/auth/session_store.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import '../../widgets/user_avatar.dart';
import '../lesson/lesson_badge.dart';
import '../lesson/lesson_curriculum.dart';
import '../lesson/lesson_path_view.dart';
import '../lesson/lesson_session_launcher.dart';
import '../library/library_screen.dart';
import '../notifications/notifications_screen.dart';
import '../notifications/notifications_unread_store.dart';
import '../practice/word_practice_screen.dart';
import '../profile/progress_screen.dart';
import '../onboarding/language_flag.dart';
import '../profile/select_language_screen.dart';
import '../streak/streak_api_service.dart';
import '../quiz/quiz_screen.dart';
import '../shell/main_shell.dart';
import '../tutor/calling_screen.dart';
import '../../widgets/path_scroll_fab.dart';
import 'services/home_data_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeRemoteData? _remoteData = HomeDataService.cached;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationsUnreadStore.unreadCount.addListener(_onUnreadChanged);
    unawaited(NotificationsUnreadStore.refresh());
    unawaited(_loadRemoteData());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    NotificationsUnreadStore.unreadCount.removeListener(_onUnreadChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _onUnreadChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(_loadRemoteData());
      unawaited(NotificationsUnreadStore.refresh());
    }
  }

  Future<void> _loadRemoteData() async {
    final data = await HomeDataService.fetch();
    if (!mounted || data == null) return;
    setState(() => _remoteData = data);
  }

  Future<void> _onContinueTap() async {
    final data = _remoteData?.continueData;
    if (data == null || data.slug.isEmpty) return;
    await LessonSessionLauncher.resumeLesson(
      slug: data.slug,
      label: data.lessonLabel,
      tutorId: data.tutorId,
      tutorSlug: data.tutorSlug,
    );
    if (!mounted) return;
    await _loadRemoteData();
  }

  Future<void> _onPathNodeTap(HomePathPreviewNode node) async {
    await LessonSessionLauncher.openLesson(
      slug: node.slug,
      label: node.label,
      status: _statusKey(node.status),
      a1Index: node.globalIndex,
      hasNotes: node.hasNotes,
      tutorId: node.tutorId,
      tutorSlug: node.tutorSlug,
      cefrLevel: node.cefrLevel,
    );
    if (!mounted) return;
    await _loadRemoteData();
  }

  static String _statusKey(HomePathNodeStatus status) {
    return switch (status) {
      HomePathNodeStatus.completed => 'completed',
      HomePathNodeStatus.active => 'available',
      HomePathNodeStatus.unlocked => 'unlocked',
      HomePathNodeStatus.locked => 'locked',
    };
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final topInset = MediaQuery.paddingOf(context).top;

    return ColoredBox(
      color: AppColors.surface,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // Beyaz sheet: SADECE Good Morning / Today's Practice (+ ikonlar).
                // Continue Conversation ASLA burada değil — #F5F6FA zeminde.
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                    border: Border.all(color: AppColors.border10, width: 1),
                  ),
                  padding: EdgeInsets.only(top: topInset),
                  child: const _HomeHeader(),
                ),
                // Figma: Today's Practice ↔ Continue = 10
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _ContinueConversationCard(
                    data: _remoteData?.continueData,
                    onContinue: _onContinueTap,
                  ),
                ),
                const SizedBox(height: 16),
                _LearningPathSection(
                  pathSections: _remoteData?.pathSections,
                  onPathNodeTap: _onPathNodeTap,
                ),
                const SizedBox(height: 36),
                _LiveLessonSection(
                  title: text.home.liveLesson,
                  subtitle: text.home.liveLessonSubtitle,
                  action: text.home.moreTutor,
                  tutors: _remoteData?.tutors,
                  continueData: _remoteData?.continueData,
                  onResumeWithTutor: (slug) async {
                    final data = _remoteData?.continueData;
                    if (data == null || data.slug.isEmpty) return false;
                    await LessonSessionLauncher.resumeLesson(
                      slug: data.slug,
                      label: data.lessonLabel,
                      forceTutorSlug: slug,
                    );
                    if (!mounted) return true;
                    await _loadRemoteData();
                    return true;
                  },
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: PremiumService.isPremiumListenable,
                  builder: (context, isPremium, _) {
                    if (isPremium) return const SizedBox.shrink();
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: _PremiumCard(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _MoreFeaturesSection(title: text.home.moreFeatures),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _LibraryBanner(),
                ),
                const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

class _LearningPathSection extends StatefulWidget {
  const _LearningPathSection({
    this.pathSections,
    this.onPathNodeTap,
  });

  final List<HomePathLevelSection>? pathSections;
  final ValueChanged<HomePathPreviewNode>? onPathNodeTap;

  @override
  State<_LearningPathSection> createState() => _LearningPathSectionState();
}

class _LearningPathSectionState extends State<_LearningPathSection> {
  final _pathScroll = ScrollController();
  var _fabPointsToTop = false;
  var _fabVisible = false;

  @override
  void initState() {
    super.initState();
    _pathScroll.addListener(_onPathScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncFab());
  }

  @override
  void didUpdateWidget(covariant _LearningPathSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pathSections != widget.pathSections) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _syncFab());
    }
  }

  @override
  void dispose() {
    _pathScroll.removeListener(_onPathScroll);
    _pathScroll.dispose();
    super.dispose();
  }

  void _onPathScroll() => _syncFab();

  void _syncFab() {
    if (!_pathScroll.hasClients) return;
    final offset = _pathScroll.offset;
    final max = _pathScroll.position.maxScrollExtent;
    final pointsToTop = offset > 48;
    final visible = max > 8;
    if (pointsToTop != _fabPointsToTop || visible != _fabVisible) {
      setState(() {
        _fabPointsToTop = pointsToTop;
        _fabVisible = visible;
      });
    }
  }

  Future<void> _onFabTap() async {
    if (!_pathScroll.hasClients) return;
    if (_fabPointsToTop) {
      await _pathScroll.animateTo(
        0,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
      );
    } else {
      final target = (_pathScroll.offset + 220)
          .clamp(0.0, _pathScroll.position.maxScrollExtent);
      await _pathScroll.animateTo(
        target,
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeOutCubic,
      );
    }
  }

  LessonNodeState _mapState(HomePathNodeStatus status) {
    return switch (status) {
      HomePathNodeStatus.completed => LessonNodeState.completed,
      HomePathNodeStatus.active => LessonNodeState.active,
      HomePathNodeStatus.unlocked => LessonNodeState.unlocked,
      HomePathNodeStatus.locked => LessonNodeState.locked,
    };
  }

  List<HomePathLevelSection> _sections() {
    final remote = widget.pathSections;
    if (remote != null && remote.isNotEmpty) return remote;

    // Offline fallback — A1 ilk 5 + diğer seviyeler i18n’den kilitli.
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

    var global = 0;
    return [
      for (final level in LessonCurriculum.levels)
        () {
          final labels = lessonLists[level.id] ?? const <String>[];
          final icons = level.iconAssets;
          final count = labels.length;
          final nodes = <HomePathPreviewNode>[
            for (var i = 0; i < count; i++)
              () {
                final node = HomePathPreviewNode(
                  asset: icons.isEmpty
                      ? ''
                      : icons[i < icons.length ? i : icons.length - 1],
                  label: i < labels.length ? labels[i] : '',
                  labelColor: 0xFF8A8A8A,
                  showStars: false,
                  status: level.id == 'a1' && i < 2
                      ? HomePathNodeStatus.unlocked
                      : HomePathNodeStatus.locked,
                  slug: LessonCurriculum.slugAt(level.id, i) ?? '',
                  a1Index: i,
                  globalIndex: global,
                  cefrLevel: level.id,
                );
                global += 1;
                return node;
              }(),
          ];
          return HomePathLevelSection(
            levelId: level.id,
            title: titles[level.id] ?? level.id.toUpperCase(),
            nodes: nodes,
          );
        }(),
    ];
  }

  Widget _levelTitle(String title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black.withValues(alpha: 0.10),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sections = _sections();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewportH = LessonPathView.viewportHeightForWidth(
            constraints.maxWidth,
            visibleNodes: 5,
          );
          return SizedBox(
            height: viewportH,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRect(
                  child: SingleChildScrollView(
                    controller: _pathScroll,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var s = 0; s < sections.length; s++) ...[
                          if (s > 0) const SizedBox(height: 20),
                          _levelTitle(sections[s].title),
                          const SizedBox(height: 12),
                          LessonPathView(
                            nodes: [
                              for (final n in sections[s].nodes)
                                LessonPathNode(
                                  label: n.label,
                                  iconAsset: n.asset,
                                  state: _mapState(n.status),
                                  onTap: () =>
                                      widget.onPathNodeTap?.call(n),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                PathScrollFab(
                  visible: _fabVisible,
                  pointsToTop: _fabPointsToTop,
                  onTap: () => unawaited(_onFabTap()),
                  bottom: 8,
                  right: 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LiveLessonSection extends StatelessWidget {
  const _LiveLessonSection({
    required this.title,
    required this.subtitle,
    required this.action,
    this.tutors,
    this.continueData,
    this.onResumeWithTutor,
  });

  final String title;
  final String subtitle;
  final String action;
  final List<HomeTutorCarouselItem>? tutors;
  final HomeContinueData? continueData;
  final Future<bool> Function(String tutorSlug)? onResumeWithTutor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _LiveLessonHeader(
            title: title,
            subtitle: subtitle,
            action: action,
            onActionTap: () => MainShell.goToTutors(context),
          ),
        ),
        const SizedBox(height: 16),
        _LiveTutorCarousel(
          tutors: tutors,
          continueData: continueData,
          onResumeWithTutor: onResumeWithTutor,
        ),
      ],
    );
  }
}

class _MoreFeaturesSection extends StatelessWidget {
  const _MoreFeaturesSection({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          // Figma: title ↔ cards = 10
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  iconAsset: AppAssets.homePractice,
                  label: text.home.practiceLabel,
                  labelColor: AppColors.primary,
                  title: text.home.wordPractice,
                  body: text.home.wordPracticeBody,
                  buttonColor: AppColors.primary,
                  buttonLabel: text.home.getStarted,
                  onTap: () async {
                    if (!await PremiumService.requirePremium(context)) return;
                    if (!context.mounted) return;
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const WordPracticeScreen(),
                      ),
                    );
                  },
                ),
              ),
              // Figma: kartlar arası 10
              const SizedBox(width: 10),
              Expanded(
                child: _FeatureCard(
                  iconAsset: AppAssets.homeImmersive,
                  label: text.home.immersiveLabel,
                  labelColor: AppColors.immersiveLabel,
                  title: text.home.quiz,
                  body:
                      '${text.home.quizBodyLine1}\n${text.home.quizBodyLine2}',
                  buttonColor: AppColors.quizOrange,
                  buttonLabel: text.home.getStarted,
                  onTap: () async {
                    if (!await PremiumService.requirePremium(context)) return;
                    if (!context.mounted) return;
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const QuizScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatefulWidget {
  const _HomeHeader();

  @override
  State<_HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<_HomeHeader> {
  var _streakCount = 0;

  @override
  void initState() {
    super.initState();
    _refreshUser();
    _loadStreak();
  }

  Future<void> _refreshUser() async {
    await AuthService.restoreSession();
  }

  Future<void> _loadStreak() async {
    try {
      final streak = await StreakApiService.fetch();
      if (!mounted) return;
      setState(() => _streakCount = streak.currentStreak);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;

    return ValueListenableBuilder<AppUser?>(
      valueListenable: SessionStore.userListenable,
      builder: (context, user, _) {
        final effective = user ?? SessionStore.currentUser;
        final name = AuthService.displayNameOf(effective);
        final greeting = '${text.profilePage.goodMorning} $name';
        final avatarUrl = effective?.avatarUrl?.trim() ?? '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => MainShell.goToProfile(context),
                    child: Semantics(
                      button: true,
                      label: text.app.profile,
                      child: UserAvatar(
                        size: 43,
                        avatarUrl: avatarUrl,
                        displayName: name,
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: PremiumService.isPremiumListenable,
                    builder: (context, isPremium, _) {
                      if (!isPremium) return const SizedBox.shrink();
                      return const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: _HomePremiumPill(),
                      );
                    },
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ProgressScreen(),
                        ),
                      );
                    },
                    child: _TopIconBadge(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const HomeAsset(
                            'assets/images/home/streak_icon.svg',
                            width: 20,
                            height: 23,
                          ),
                          Positioned(
                            left: 7,
                            top: 6,
                            child: Text(
                              '$_streakCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                height: 1,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      final initial =
                          effective?.onboarding?.targetLanguageCode ?? 'en';
                      final code = await Navigator.of(context).push<String>(
                        MaterialPageRoute(
                          builder: (_) => SelectLanguageScreen(
                            initialCode: initial,
                            kind: LanguagePickerKind.targetLanguage,
                          ),
                        ),
                      );
                      if (code == null || code.isEmpty || code == initial) {
                        return;
                      }
                      try {
                        await AuthService.updateOnboarding(
                          targetLanguageCode: code,
                        );
                      } catch (_) {}
                    },
                    child: _TopIconBadge(
                      child: LanguageFlag.badge(
                        effective?.onboarding?.targetLanguageCode ?? 'en',
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (_) => const NotificationsScreen(),
                        ),
                      );
                      if (!mounted) return;
                      await NotificationsUnreadStore.refresh();
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _TopIconBadge(
                          child: Semantics(
                            button: true,
                            label: text.app.notifications,
                            child: const HomeAsset(
                              'assets/images/home/notification_icon.svg',
                              width: 15,
                              height: 17,
                            ),
                          ),
                        ),
                        if (NotificationsUnreadStore.unreadCount.value > 0)
                          Positioned(
                            right: -2,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              constraints: const BoxConstraints(minWidth: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF3B30),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(color: Colors.white, width: 1.5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                NotificationsUnreadStore.unreadCount.value > 9
                                    ? '9+'
                                    : '${NotificationsUnreadStore.unreadCount.value}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9,
                                  height: 1,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(greeting, style: AppTextStyles.homeGreeting),
                  const SizedBox(height: 2),
                  Text(text.home.todayPractice, style: AppTextStyles.homeTitle),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TopIconBadge extends StatelessWidget {
  const _TopIconBadge({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.primaryTint05,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _ContinueConversationCard extends StatelessWidget {
  const _ContinueConversationCard({this.data, this.onContinue});

  final HomeContinueData? data;
  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final lessonLabel = data?.lessonLabel ?? text.home.lessonProgress;
    final remaining = data?.remainingMinutes ?? data?.totalMinutes ?? 15;
    final total = data?.totalMinutes ?? 15;
    final progressFactor = data?.progressFactor ?? 0.0;
    final timeCurrent = text.home.minutesLeft(value: remaining);
    final timeTotal = '/ ${total}min';
    // Figma: 398×138, pad dikey 10, gap 10; üst satır space-between
    return Material(
      color: AppColors.primaryTint05,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onContinue ?? () {},
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      text.home.continueConversation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyles.sectionSubtitle.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    lessonLabel,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      height: 16 / 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const HomeAsset(
                    'assets/images/home/clock_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: timeCurrent,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 24,
                              height: 28 / 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' $timeTotal',
                            style: AppTextStyles.sectionSubtitle.copyWith(
                              fontSize: 14,
                              height: 18 / 14,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 32,
                    constraints:
                        const BoxConstraints(minWidth: 96, maxWidth: 120),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text.home.kContinue,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 18 / 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: SizedBox(
                  height: 6,
                  child: Stack(
                    children: [
                      Container(color: AppColors.progressTrack),
                      FractionallySizedBox(
                        widthFactor: progressFactor.clamp(0.0, 1.0),
                        child: Container(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LiveLessonHeader extends StatelessWidget {
  const _LiveLessonHeader({
    required this.title,
    required this.subtitle,
    required this.action,
    this.onActionTap,
  });

  final String title;
  final String subtitle;
  final String action;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.sectionTitle),
              const SizedBox(height: 4),
              Text(subtitle, style: AppTextStyles.sectionSubtitle),
            ],
          ),
        ),
        _LinkPill(label: action, onTap: onActionTap),
      ],
    );
  }
}

class _LinkPill extends StatelessWidget {
  const _LinkPill({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: AppTextStyles.linkPill),
              const SizedBox(width: 4),
              Transform.rotate(
                angle: 3.14159,
                child: const HomeAsset(
                  'assets/images/home/arrow_circle.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LiveTutorCarousel extends StatelessWidget {
  const _LiveTutorCarousel({
    this.tutors,
    this.continueData,
    this.onResumeWithTutor,
  });

  final List<HomeTutorCarouselItem>? tutors;
  final HomeContinueData? continueData;
  final Future<bool> Function(String tutorSlug)? onResumeWithTutor;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final items = (tutors != null && tutors!.isNotEmpty)
        ? tutors!
        : HomeDataService.fallbackTutors(text);

    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final tutor = items[index];
          return _TutorCard(
            name: tutor.name,
            image: tutor.image,
            flagAsset: tutor.slug?.toLowerCase() == 'lingola'
                ? null
                : tutor.flagAsset,
            tags: tutor.tags,
            startTalkLabel: text.home.startTalkNow,
            onStartTalk: () async {
              if (!await PremiumService.requireTutorOrPaywall(
                context,
                tutor.slug,
              )) {
                return;
              }
              if (!context.mounted) return;
              final slug = tutor.slug;
              if (slug != null &&
                  slug.isNotEmpty &&
                  continueData != null &&
                  continueData!.slug.isNotEmpty &&
                  onResumeWithTutor != null) {
                final handled = await onResumeWithTutor!(slug);
                if (handled) return;
              }
              if (!context.mounted) return;
              final data = continueData;
              final lessonBadge = data != null && data.slug.isNotEmpty
                  ? LessonBadge.fromSlug(
                      slug: data.slug,
                      fallbackTitle: data.lessonLabel,
                    )
                  : null;
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => CallingScreen(
                    tutorName: tutor.name,
                    imagePath: tutor.image,
                    riveAsset: tutor.riveAsset,
                    riveCdnUrl: tutor.riveCdnUrl,
                    voiceId: TutorVoiceIds.resolve(
                      tutor.slug,
                      preferred: tutor.voiceId,
                    ),
                    tutorSlug: tutor.slug,
                    lessonSlug: data?.slug,
                    lessonBadge: lessonBadge,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _TutorCard extends StatelessWidget {
  const _TutorCard({
    required this.name,
    required this.image,
    required this.tags,
    required this.startTalkLabel,
    required this.onStartTalk,
    this.flagAsset,
  });

  final String name;
  final String image;
  final String? flagAsset;
  final List<String> tags;
  final String startTalkLabel;
  final VoidCallback onStartTalk;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      height: 300,
      padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 151,
              height: 132,
              decoration: const BoxDecoration(
                // Figma: gorsel arkaplani duz gri degil, yumusak radial.
                gradient: RadialGradient(
                  center: Alignment(0, -0.15),
                  radius: 1.05,
                  colors: [Color(0xFF939393), Color(0xFF969696)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: HomeAsset(
                  image,
                  width: 151,
                  height: 132,
                  // Mei Lin goruntusu ustten kesilmesin.
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (flagAsset != null)
                HomeAsset(flagAsset!, width: 14, height: 11)
              else
                const Text('🌎', style: TextStyle(fontSize: 12, height: 1)),
              const SizedBox(width: 4),
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  height: 23 / 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: .2),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.secondary,
                        fontSize: 10,
                        height: 14 / 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 10),
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onStartTalk,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HomeAsset(
                        'assets/images/home/video_icon.svg',
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        startTalkLabel,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                          height: 14 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomePremiumPill extends StatelessWidget {
  const _HomePremiumPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          width: 1,
          color: AppColors.primary.withValues(alpha: 0.55),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 18,
            height: 18,
            child: HomeAsset(
              AppAssets.premiumDiamond,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            AppText.current.app.premium,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 24 / 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumCard extends StatelessWidget {
  const _PremiumCard();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final premium = text.home.premium;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment(-0.9, -0.4),
          end: Alignment(0.9, 0.4),
          colors: [
            AppColors.premiumGradientStart,
            AppColors.premiumGradientEnd,
          ],
          stops: [0.27, 0.95],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HomeAsset(
                    'assets/images/home/premium_crown.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text.app.premium,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  height: 32 / 24,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(text: premium.titleBefore),
                  TextSpan(
                    text: premium.titleHighlight,
                    style: const TextStyle(color: AppColors.primary),
                  ),
                  TextSpan(text: premium.titleAfter),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 14,
                  height: 18 / 14,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: premium.descriptionBefore),
                  TextSpan(
                    text: premium.descriptionHighlight,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...[
            premium.feature1,
            premium.feature2,
            premium.feature3,
          ].map(
            (feature) => Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 8),
              child: _PremiumFeatureRow(label: feature),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 14, 5, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: premium.priceAmount,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                height: 18 / 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: premium.pricePeriod,
                              style: const TextStyle(
                                color: AppColors.secondary,
                                fontSize: 13,
                                height: 18 / 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        premium.discount,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 12,
                          height: 18 / 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () =>
                        unawaited(PremiumService.presentPaywall(context)),
                    child: Container(
                      width: 179,
                      height: 44,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            premium.cta,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 20 / 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const HomeAsset(
                            'assets/images/home/premium_arrow.svg',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumFeatureRow extends StatelessWidget {
  const _PremiumFeatureRow({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HomeAsset(
          'assets/images/home/premium_check.svg',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.iconAsset,
    required this.label,
    required this.labelColor,
    required this.title,
    required this.body,
    required this.buttonColor,
    required this.buttonLabel,
    this.onTap,
  });

  final String iconAsset;
  final String label;
  final Color labelColor;
  final String title;
  final String body;
  final Color buttonColor;
  final String buttonLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Figma: 194×216, pad 10, gap 4, radius 16, stroke black %10
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 216,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Figma: 3D PNG ikonlar, arka plan kutusu yok
              HomeAsset(iconAsset, width: 56, height: 56),
              const SizedBox(height: 4),
              Text(
                label.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: labelColor,
                  fontSize: 12,
                  height: 18 / 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 20 / 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.sectionSubtitle,
                ),
              ),
              // Figma Get Started: 179×36, radius 12, stroke black %10
              SizedBox(
                width: double.infinity,
                height: 36,
                child: Material(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(12),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border10),
                      ),
                      child: Center(
                        child: Text(
                          buttonLabel,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 14,
                            height: 18 / 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LibraryBanner extends StatelessWidget {
  const _LibraryBanner();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if (!await PremiumService.requirePremium(context)) return;
          if (!context.mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const LibraryScreen()),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF2D46FF), Color(0xFF2980FF), Color(0xFF37B2E3)],
              stops: [0.016, 0.67, 0.97],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text.home.library,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 18 / 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          text.home.libraryTitle,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 24 / 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 179),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  text.home.learnMore,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    height: 22 / 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const HomeAsset(
                  'assets/images/bookAndNotebook.svg',
                  width: 120,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
