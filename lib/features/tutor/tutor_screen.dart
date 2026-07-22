import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'chat_history_screen.dart';
import 'chat_screen.dart';
import 'tutor_filter_sheet.dart';

class TutorScreen extends StatelessWidget {
  const TutorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final tutors = _tutorCards(text);

    return ColoredBox(
      color: Colors.white,
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
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: text.filter,
                    onPressed: () => showTutorFilterSheet(context),
                    icon: const Icon(Icons.tune_rounded, color: AppColors.ink),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ChatHistoryScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.chevron_right_rounded, size: 18),
                      ],
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
                // Live Lesson kart oranı (~168×300)
                childAspectRatio: 168 / 300,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final tutor = tutors[index];
                  return TutorCard(
                    name: tutor.name,
                    imagePath: tutor.image,
                    tags: tutor.tags,
                    flagAsset: tutor.flagAsset,
                    onStartTalk: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChatScreen(
                            tutorName: tutor.name,
                            imagePath: tutor.image,
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
    );
  }

  List<_TutorData> _tutorCards(dynamic text) {
    final tags = text.tags;
    return [
      _TutorData(
        name: text.tutors.lingola,
        image: 'assets/images/tutors/lingola.png',
        tags: [tags.adaptive, tags.calm, tags.patient, tags.more],
      ),
      _TutorData(
        name: text.tutors.elena,
        image: 'assets/images/tutors/elena.png',
        tags: [tags.adaptive, tags.calm, tags.more],
      ),
      _TutorData(
        name: text.tutors.kaj,
        image: 'assets/images/tutors/kaj.png',
        tags: [tags.patient, tags.organized, tags.more],
      ),
      _TutorData(
        name: text.tutors.mei,
        image: 'assets/images/tutors/mei.png',
        // Home Live Lesson ile aynı; diğer bayraklar sonra eklenecek.
        flagAsset: 'assets/images/home/flag_cn.svg',
        tags: [tags.calm, tags.attentive, tags.more],
      ),
      _TutorData(
        name: text.tutors.kate,
        image: 'assets/images/tutors/kate.png',
        tags: [tags.adaptive, tags.relaxed, tags.more],
      ),
      _TutorData(
        name: text.tutors.sofia,
        image: 'assets/images/tutors/sofia.png',
        tags: [tags.methodical, tags.patient, tags.more],
      ),
    ];
  }
}

class _TutorData {
  const _TutorData({
    required this.name,
    required this.image,
    required this.tags,
    this.flagAsset,
  });

  final String name;
  final String image;
  final List<String> tags;
  final String? flagAsset;
}

class _TutorHero extends StatelessWidget {
  const _TutorHero({required this.text});

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFB8C4FF), Color(0xFFE8ECFF), Colors.white],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: HomeAsset(
              'assets/images/tutors/hero.png',
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
                _RoundIconButton(
                  icon: Icons.volume_up_rounded,
                  tooltip: text.speaker as String,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    text.messagesCount as String,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 20,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ChatScreen(
                      tutorName: text.tutors.lingola as String,
                      imagePath: 'assets/images/tutors/lingola.png',
                    ),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
              label: Text(
                text.chatWithLingola as String,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: 36,
            height: 36,
            child: Icon(icon, size: 18, color: AppColors.ink),
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
    this.flagAsset,
    super.key,
  });

  final String name;
  final String imagePath;
  final List<String> tags;
  final VoidCallback onStartTalk;
  final String? flagAsset;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    // Home Live Lesson kartı ile aynı düzen.
    return Container(
      padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 151 / 132,
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
                  child: HomeAsset(
                    imagePath,
                    fit: BoxFit.fitHeight,
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
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: tags
                .take(4)
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
          const Spacer(),
          const SizedBox(height: 10),
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: onStartTalk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
}
