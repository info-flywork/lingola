import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'reading_test_screen.dart';
import 'speaking_test_screen.dart';
import 'writing_test_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const _readingIconBg = Color(0xFFFFCBCB);
  static const _writingOrange = Color(0xFFFF8D28);
  static const _writingIconBg = Color(0xFFFFE8D4);
  static const _speakingGreen = Color(0xFF34C759);
  static const _speakingIconBg = Color(0xFFD6F4DE);

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.quizPage;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      text.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  children: [
                    Text(
                      text.headline,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        height: 28 / 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text.subtitle,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _QuizOptionCard(
                      iconAsset: AppAssets.quizReading,
                      iconBg: _readingIconBg,
                      title: text.readingTitle,
                      description: text.readingBody,
                      arrowBg: AppColors.primary,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const ReadingTestScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _QuizOptionCard(
                      iconAsset: AppAssets.quizWriting,
                      iconBg: _writingIconBg,
                      title: text.writingTitle,
                      description: text.writingBody,
                      arrowBg: _writingOrange,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const WritingTestScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _QuizOptionCard(
                      iconAsset: AppAssets.quizSpeaking,
                      iconBg: _speakingIconBg,
                      title: text.speakingTitle,
                      description: text.speakingBody,
                      arrowBg: _speakingGreen,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const SpeakingTestScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizOptionCard extends StatelessWidget {
  const _QuizOptionCard({
    required this.iconAsset,
    required this.iconBg,
    required this.title,
    required this.description,
    required this.arrowBg,
    required this.onTap,
  });

  final String iconAsset;
  final Color iconBg;
  final String title;
  final String description;
  final Color arrowBg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  _QuizIconBadge(
                    iconAsset: iconAsset,
                    iconBg: iconBg,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            height: 20 / 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            height: 16 / 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: arrowBg,
                      shape: BoxShape.circle,
                    ),
                    child: const HomeAsset(
                      AppAssets.quizArrow,
                      width: 6,
                      height: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuizIconBadge extends StatelessWidget {
  const _QuizIconBadge({
    required this.iconAsset,
    required this.iconBg,
  });

  final String iconAsset;
  final Color iconBg;

  static const _size = 60.0;
  static const _radius = 10.0;
  static const _padding = 4.0;
  static const _iconSize = 52.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: iconBg,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: HomeAsset(
        iconAsset,
        width: _iconSize,
        height: _iconSize,
      ),
    );
  }
}
