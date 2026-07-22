import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import '../notifications/notifications_screen.dart';
import '../practice/word_practice_screen.dart';
import '../quiz/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _heavyContentReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _heavyContentReady = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final topInset = MediaQuery.paddingOf(context).top;

    return ColoredBox(
      color: AppColors.surface,
      child: CustomScrollView(
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _ContinueConversationCard(),
                ),
                if (!_heavyContentReady)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 48),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                else ...[
                  const SizedBox(height: 16),
                  _LearningPathSection(
                    title: text.home.learningPath,
                    action: text.home.allLessons,
                    scrollLabel: text.home.scroll,
                  ),
                  const SizedBox(height: 16),
                  _LiveLessonSection(
                    title: text.home.liveLesson,
                    subtitle: text.home.liveLessonSubtitle,
                    action: text.home.moreTutor,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _PremiumCard(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningPathSection extends StatelessWidget {
  const _LearningPathSection({
    required this.title,
    required this.action,
    required this.scrollLabel,
  });

  final String title;
  final String action;
  final String scrollLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _SectionLinkHeader(title: title, action: action),
        ),
        // Yildizlar All Lessons butonuna degmesin.
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _LearningPathMap(),
        ),
        const SizedBox(height: 8),
        Center(child: _ScrollPill(label: scrollLabel)),
      ],
    );
  }
}

class _LiveLessonSection extends StatelessWidget {
  const _LiveLessonSection({
    required this.title,
    required this.subtitle,
    required this.action,
  });

  final String title;
  final String subtitle;
  final String action;

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
          ),
        ),
        const SizedBox(height: 16),
        const _LiveTutorCarousel(),
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
                  iconAsset: 'assets/images/practiceIconHome.svg',
                  iconBg: const Color(0x332D85FF),
                  label: text.home.practiceLabel,
                  labelColor: AppColors.primary,
                  title: text.home.wordPractice,
                  body: text.home.wordPracticeBody,
                  buttonColor: AppColors.primary,
                  buttonLabel: text.home.getStarted,
                  onTap: () {
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
                  iconAsset: 'assets/images/home/feature_quiz.svg',
                  iconBg: const Color(0x33FF3D02),
                  label: text.home.immersiveLabel,
                  labelColor: AppColors.immersiveLabel,
                  title: text.home.quiz,
                  body:
                      '${text.home.quizBodyLine1}\n${text.home.quizBodyLine2}',
                  buttonColor: AppColors.quizOrange,
                  buttonLabel: text.home.getStarted,
                  onTap: () {
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

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Figma icon satırı: yatay 16, dikey 10
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Semantics(
                label: text.app.profile,
                child: const HomeAsset(
                  'assets/images/home/profile_avatar.svg',
                  width: 43,
                  height: 43,
                ),
              ),
              const Spacer(),
              _TopIconBadge(
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
                        text.home.streakCount,
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
              const SizedBox(width: 10),
              const _TopIconBadge(
                child: HomeAsset(
                  'assets/images/home/flag_icon.svg',
                  width: 21,
                  height: 21,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                },
                child: _TopIconBadge(
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
              ),
            ],
          ),
        ),
        // Figma: icon satırı ↔ greeting bloğu = 16
        const SizedBox(height: 16),
        // Greeting: üst/alt 16 — Continue beyazın DIŞINDA
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text.home.greeting, style: AppTextStyles.homeGreeting),
              const SizedBox(height: 2),
              Text(text.home.todayPractice, style: AppTextStyles.homeTitle),
            ],
          ),
        ),
      ],
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
  const _ContinueConversationCard();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    // Figma: 398×138, pad dikey 10, gap 10; üst satır space-between
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
      decoration: BoxDecoration(
        color: AppColors.primaryTint05,
        borderRadius: BorderRadius.circular(10),
      ),
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
                  style: AppTextStyles.sectionSubtitle.copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                text.home.lessonProgress,
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
                        text: text.home.timeCurrent,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 24,
                          height: 28 / 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ${text.home.timeTotal}',
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
                constraints: const BoxConstraints(minWidth: 96, maxWidth: 120),
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
                    widthFactor: 101 / 378,
                    child: Container(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLinkHeader extends StatelessWidget {
  const _SectionLinkHeader({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.sectionTitle,
          ),
        ),
        const SizedBox(width: 8),
        _LinkPill(label: action),
      ],
    );
  }
}

class _LiveLessonHeader extends StatelessWidget {
  const _LiveLessonHeader({
    required this.title,
    required this.subtitle,
    required this.action,
  });

  final String title;
  final String subtitle;
  final String action;

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
        _LinkPill(label: action),
      ],
    );
  }
}

class _LinkPill extends StatelessWidget {
  const _LinkPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _LearningPathMap extends StatelessWidget {
  const _LearningPathMap();

  static const _designWidth = 398.0;
  static const _designHeight = 425.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return LayoutBuilder(
      builder: (context, constraints) {
        final height =
            constraints.maxWidth / _designWidth * _designHeight;
        return SizedBox(
          width: constraints.maxWidth,
          height: height,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: _designWidth,
              height: _designHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    left: (398 - 227) / 2,
                    top: 0,
                    width: 227,
                    height: 468,
                    child: HomeAsset(
                      'assets/images/home/learning_path.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  // Path ikonları: hafif yukarı (-8); Greetings yıldızları
                  // All Lessons’a değmesin diye min top 18
                  Positioned(
                    left: 65,
                    top: 30,
                    child: _PathNode(
                      asset: 'assets/images/home/node_introductions.svg',
                      label: text.home.introductions,
                      labelColor: AppColors.primary,
                      labelSide: _PathLabelSide.right,
                      showStars: true,
                    ),
                  ),
                  Positioned(
                    left: 278,
                    top: -12,
                    child: _PathNode(
                      asset: 'assets/images/home/node_greetings.svg',
                      label: text.home.greetings,
                      labelColor: AppColors.ink,
                      labelSide: _PathLabelSide.below,
                      showStars: true,
                    ),
                  ),
                  Positioned(
                    left: 278,
                    top: 115,
                    child: _PathNode(
                      asset: 'assets/images/home/node_jobs.svg',
                      label: text.home.jobs,
                      labelColor: AppColors.secondary,
                      labelSide: _PathLabelSide.left,
                    ),
                  ),
                  Positioned(
                    left: 65,
                    top: 204,
                    child: _PathNode(
                      asset: 'assets/images/home/node_favorite_room.svg',
                      label: text.home.favoriteRoom,
                      labelColor: AppColors.secondary,
                      labelSide: _PathLabelSide.right,
                    ),
                  ),
                  Positioned(
                    left: 278,
                    top: 297,
                    child: _PathNode(
                      asset: 'assets/images/home/node_daily_routine.svg',
                      label: text.home.dailyRoutine,
                      labelColor: AppColors.secondary,
                      labelSide: _PathLabelSide.left,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 90,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // A1 path alt fade — eski #FFFFFF
                            // Colors.white.withValues(alpha: 0),
                            // Colors.white,
                            AppColors.surface.withValues(alpha: 0),
                            AppColors.surface,
                          ],
                        ),
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

enum _PathLabelSide { left, right, below }

class _PathNode extends StatelessWidget {
  const _PathNode({
    required this.asset,
    required this.label,
    required this.labelColor,
    required this.labelSide,
    this.showStars = false,
  });

  final String asset;
  final String label;
  final Color labelColor;
  final _PathLabelSide labelSide;
  final bool showStars;

  static const _nodeSize = 63.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _nodeSize,
      height: _nodeSize,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          HomeAsset(asset, width: _nodeSize, height: _nodeSize, fit: BoxFit.contain),
          if (showStars)
            // Figma: yıldızlar icon’a daha yakın (-10 overlap)
            const Positioned(
              top: -13,
              left: (63 - 39) / 2,
              child: _StarArc(),
            ),
          if (labelSide == _PathLabelSide.below)
            Positioned(
              top: _nodeSize + 4,
              left: -20,
              width: _nodeSize + 40,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: _labelStyle(labelColor),
              ),
            ),
          if (labelSide == _PathLabelSide.right)
            Positioned(
              left: _nodeSize + 8,
              top: (_nodeSize - 16) / 2,
              width: 110,
              child: Text(
                label,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: _labelStyle(labelColor),
              ),
            ),
          if (labelSide == _PathLabelSide.left)
            Positioned(
              left: -118,
              top: (_nodeSize - 16) / 2,
              width: 110,
              child: Text(
                label,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.visible,
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
      height: 16 / 12,
      fontWeight: FontWeight.w500,
    );
  }
}

class _StarArc extends StatelessWidget {
  const _StarArc();

  @override
  Widget build(BuildContext context) {
    // Figma: 39×24, gap -10 → yıldızlar bitişik / hafif overlap
    return SizedBox(
      width: 39,
      height: 24,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Transform.rotate(
              angle: -0.28,
              child: const HomeAsset(
                'assets/images/home/star_small.svg',
                width: 14,
                height: 14,
              ),
            ),
          ),
          const Positioned(
            left: 9,
            top: 0,
            child: HomeAsset(
              'assets/images/home/star_large.svg',
              width: 20,
              height: 20,
            ),
          ),
          Positioned(
            left: 25,
            bottom: 0,
            child: Transform.rotate(
              angle: 0.28,
              child: const HomeAsset(
                'assets/images/home/star_small.svg',
                width: 14,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollPill extends StatelessWidget {
  const _ScrollPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryTint10,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HomeAsset(
            'assets/images/home/arrow_down.svg',
            width: 19,
            height: 19,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveTutorCarousel extends StatelessWidget {
  const _LiveTutorCarousel();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final tutors = [
      (
        text.home.tutorLingola,
        'assets/images/tutor_lingola.png',
        null,
        [
          text.home.tagAdaptive,
          text.home.tagCalm,
          text.home.tagPatient,
          text.home.tagMore,
        ],
      ),
      (
        text.home.tutorMei,
        'assets/images/tutor_mei.png',
        'assets/images/home/flag_cn.svg',
        [
          text.home.tagPatient,
          text.home.tagMethodical,
          text.home.tagEncouraging,
          text.home.tagMore,
        ],
      ),
      (
        text.home.tutorKate,
        'assets/images/tutor_kate.png',
        null,
        [
          text.home.tagAdaptive,
          text.home.tagPatient,
          text.home.tagMore,
        ],
      ),
    ];

    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.none,
        itemCount: tutors.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final tutor = tutors[index];
          return _TutorCard(
            name: tutor.$1,
            image: tutor.$2,
            flagAsset: tutor.$3,
            tags: tutor.$4,
            startTalkLabel: text.home.startTalkNow,
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
    this.flagAsset,
  });

  final String name;
  final String image;
  final String? flagAsset;
  final List<String> tags;
  final String startTalkLabel;

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
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
    required this.iconBg,
    required this.label,
    required this.labelColor,
    required this.title,
    required this.body,
    required this.buttonColor,
    required this.buttonLabel,
    this.onTap,
  });

  final String iconAsset;
  final Color iconBg;
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 216,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                width: 59,
                height: 56,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: HomeAsset(iconAsset, width: 36, height: 36),
              ),
              const SizedBox(height: 4),
              Text(
                label.toUpperCase(),
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
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: buttonColor,
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
    return Container(
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
    );
  }
}
