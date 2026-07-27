import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'chat_history_screen.dart';
import 'calling_screen.dart';
import 'chat_screen.dart';
import 'tutor_filter_sheet.dart';

class TutorScreen extends StatelessWidget {
  const TutorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final tutors = _tutorCards(text);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: ColoredBox(
        color: AppColors.surface,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _TutorHero(text: text)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text.title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          height: 30 / 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => showTutorFilterSheet(context),
                        child: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black.withValues(alpha: .10),
                            ),
                          ),
                          child: const HomeAsset(
                            AppAssets.tutorFilter,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9999),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const ChatHistoryScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(9999),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color: Colors.black.withValues(alpha: .10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text.chatHistory,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const HomeAsset(
                                  AppAssets.quizArrow,
                                  width: 6,
                                  height: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 194 / 282,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final tutor = tutors[index];
                    return TutorCard(
                      name: tutor.name,
                      imagePath: tutor.image,
                      tags: tutor.tags,
                      flagAsset: tutor.flagAsset,
                      theme: tutor.theme,
                      onStartTalk: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => CallingScreen(
                              tutorName: tutor.name,
                              imagePath: tutor.image,
                              riveAsset: tutor.riveAsset,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: tutors.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_TutorData> _tutorCards(dynamic text) {
    final tags = text.tags;
    return [
      _TutorData(
        name: text.tutors.lingola,
        image: AppAssets.tutorRobot,
        tags: [tags.analytic, tags.curious],
      ),
      _TutorData(
        name: text.tutors.elena,
        image: AppAssets.tutorElena,
        riveAsset: AppAssets.tutorElenaRiv,
        tags: [tags.adaptive, tags.calm],
      ),
      _TutorData(
        name: text.tutors.kenji,
        image: AppAssets.tutorKenji,
        riveAsset: AppAssets.tutorKenjiRiv,
        flagAsset: 'assets/images/home/flag_cn.svg',
        tags: [tags.patient, tags.organized],
      ),
      _TutorData(
        name: text.tutors.freya,
        image: AppAssets.tutorFreya,
        riveAsset: AppAssets.tutorFreyaRiv,
        tags: [tags.calm, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.camila,
        image: AppAssets.tutorCamila,
        riveAsset: AppAssets.tutorCamilaRiv,
        tags: [tags.adaptive, tags.relaxed],
      ),
      _TutorData(
        name: text.tutors.marco,
        image: AppAssets.tutorMarco,
        riveAsset: AppAssets.tutorMarcoRiv,
        tags: [tags.methodical, tags.patient],
      ),
      _TutorData(
        name: text.tutors.julian,
        image: AppAssets.tutorJulian,
        riveAsset: AppAssets.tutorJulianRiv,
        tags: [tags.adaptive, tags.calm],
      ),
      _TutorData(
        name: text.tutors.ines,
        image: AppAssets.tutorInes,
        riveAsset: AppAssets.tutorInesRiv,
        tags: [tags.patient, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.felix,
        image: AppAssets.tutorFelix,
        riveAsset: AppAssets.tutorFelixRiv,
        tags: [tags.organized, tags.relaxed],
      ),
      _TutorData(
        name: text.tutors.diego,
        image: AppAssets.tutorDiego,
        riveAsset: AppAssets.tutorDiegoRiv,
        tags: [tags.methodical, tags.calm],
      ),
      _TutorData(
        name: text.tutors.amara,
        image: AppAssets.tutorAmara,
        riveAsset: AppAssets.tutorAmaraRiv,
        tags: [tags.adaptive, tags.patient],
      ),
      _TutorData(
        name: text.tutors.erik,
        image: AppAssets.tutorErik,
        riveAsset: AppAssets.tutorErikRiv,
        tags: [tags.relaxed, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.katie,
        image: AppAssets.tutorKatie,
        riveAsset: AppAssets.tutorKatieRiv,
        tags: [tags.disciplined, tags.decisive],
      ),
      _TutorData(
        name: text.tutors.morgan,
        image: AppAssets.tutorMorgan,
        riveAsset: AppAssets.tutorMorganRiv,
        tags: [tags.smart, tags.patient],
      ),
      // Fantasy dörtlü — listenin en altında (riv’leri ayrı kalır)
      _TutorData(
        name: text.tutors.zephyrion,
        image: AppAssets.tutorZephyrion,
        tags: [tags.curious, tags.observer],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF586168),
          gradientEnd: Color(0xFF184238),
          buttonColor: Color(0xFFE8EEF0),
          buttonForeground: Color(0xFF184238),
        ),
      ),
      _TutorData(
        name: text.tutors.vaelen,
        image: AppAssets.tutorVaelen,
        tags: [tags.calm, tags.ancientKnowledge],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF160A20),
          gradientEnd: Color(0xFF64557E),
          buttonColor: Color(0xFF150D1D),
          buttonForeground: Colors.white,
        ),
      ),
      _TutorData(
        name: text.tutors.ukrath,
        image: AppAssets.tutorUkrath,
        tags: [tags.clear, tags.decisive],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF2A1812),
          gradientEnd: Color(0xFF833A21),
          buttonColor: Color(0xFF533029),
          buttonForeground: Colors.white,
        ),
      ),
      _TutorData(
        name: text.tutors.elrion,
        image: AppAssets.tutorElrion,
        tags: [tags.wise, tags.patient],
        riveAsset: AppAssets.tutorElrionRiv,
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF18452A),
          gradientEnd: Color(0xFFD7B35A),
          buttonColor: Color(0xFF386236),
          buttonForeground: Colors.white,
        ),
      ),
    ];
  }
}

class TutorCardTheme {
  const TutorCardTheme({
    required this.gradientStart,
    required this.gradientEnd,
    required this.buttonColor,
    required this.buttonForeground,
  });

  final Color gradientStart;
  final Color gradientEnd;
  final Color buttonColor;
  final Color buttonForeground;
}

class _TutorData {
  const _TutorData({
    required this.name,
    required this.image,
    required this.tags,
    this.theme,
    this.flagAsset,
    this.riveAsset,
  });

  final String name;
  final String image;
  final List<String> tags;
  final TutorCardTheme? theme;
  final String? flagAsset;
  final String? riveAsset;
}

class _TutorHero extends StatelessWidget {
  const _TutorHero({required this.text});

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    return SizedBox(
      height: topInset + 280,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _TutorHeroBackdrop(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 280,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeAsset(
                    AppAssets.tutorRobot,
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 20,
                  child: Row(
                    children: [
                      _GlassIconButton(
                        tooltip: text.speaker as String,
                        onTap: () {},
                        child: const HomeAsset(
                          AppAssets.tutorSpeaker,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0x80000000),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          AppText.current.previewChat.speed,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 20,
                  child: Material(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => ChatScreen(
                              tutorName: text.tutors.lingola as String,
                              imagePath: AppAssets.tutorRobot,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(999),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const HomeAsset(
                              AppAssets.tutorChatWithLingola,
                              width: 21,
                              height: 21,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              text.chatWithLingola as String,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}

/// Figma: #2D46FF / #2D85FF / #37B2E3 blur ellipses → surface.
class _TutorHeroBackdrop extends StatelessWidget {
  const _TutorHeroBackdrop();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: AppColors.surface),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2D46FF),
                  Color(0xFF2D85FF),
                  Color(0xFF37B2E3),
                  AppColors.surface,
                ],
                stops: [0, 0.28, 0.55, 1],
              ),
            ),
          ),
          Positioned(
            left: -84,
            top: -180,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: Container(
                width: 320,
                height: 320,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D46FF),
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            top: -100,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 75, sigmaY: 75),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF37B2E3),
                ),
              ),
            ),
          ),
          Positioned(
            left: -20,
            top: -40,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D85FF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({
    required this.tooltip,
    required this.onTap,
    required this.child,
  });

  final String tooltip;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: const Color(0x80000000),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: 36,
            height: 36,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

class TutorCard extends StatelessWidget {
  const TutorCard({
    required this.name,
    required this.imagePath,
    required this.tags,
    required this.onStartTalk,
    this.theme,
    this.flagAsset,
    super.key,
  });

  final String name;
  final String imagePath;
  final List<String> tags;
  final VoidCallback onStartTalk;
  final TutorCardTheme? theme;
  final String? flagAsset;

  @override
  Widget build(BuildContext context) {
    final themed = theme != null;
    if (!themed) return _buildClassic(context);
    return _buildThemed(context, theme!);
  }

  Widget _buildClassic(BuildContext context) {
    final text = AppText.current.tutorPage;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.15),
                    radius: 1.05,
                    colors: [Color(0xFF939393), Color(0xFF969696)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SizedBox.expand(
                    child: HomeAsset(
                      imagePath,
                      // Figma gibi alan dolsun ama kafa üstten kesilmesin.
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.55),
                    ),
                  ),
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
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    height: 23 / 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 10,
            runSpacing: 4,
            children: tags
                .take(2)
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
              onTap: onStartTalk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomeAsset(
                      AppAssets.tutorChatWithLingola,
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        text.startTalkNow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                          height: 14 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemed(BuildContext context, TutorCardTheme theme) {
    final text = AppText.current.tutorPage;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: .10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.gradientStart, theme.gradientEnd],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.expand(
                child: HomeAsset(
                  imagePath,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.55),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              height: 23 / 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: tags
                .take(2)
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .20),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
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
            color: theme.buttonColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: onStartTalk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeAsset(
                      AppAssets.tutorChatWithLingola,
                      width: 15,
                      height: 15,
                      color: theme.buttonForeground,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        text.startTalkNow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: theme.buttonForeground,
                          fontSize: 12,
                          height: 14 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
