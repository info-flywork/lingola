import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'reading_test_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

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
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: AppColors.ink,
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
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text.subtitle,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _QuizOptionCard(
                      iconAsset: 'assets/images/quizSection/readingSection.svg',
                      iconBg: Colors.white.withValues(alpha: .22),
                      title: text.readingTitle,
                      description: text.readingBody,
                      titleColor: Colors.white,
                      descriptionColor: Colors.white,
                      arrowBg: const Color(0xFF1A2FCC),
                      arrowColor: Colors.white,
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF2D46FF), Color(0xFF6B7CFF)],
                      ),
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
                      iconAsset: 'assets/images/quizSection/writingSection.svg',
                      iconBg: _writingIconBg,
                      title: text.writingTitle,
                      description: text.writingBody,
                      titleColor: AppColors.ink,
                      descriptionColor: AppColors.secondary,
                      arrowBg: _writingOrange,
                      arrowColor: Colors.white,
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _QuizOptionCard(
                      iconAsset: 'assets/images/quizSection/speakingSection.svg',
                      iconBg: _speakingIconBg,
                      title: text.speakingTitle,
                      description: text.speakingBody,
                      titleColor: AppColors.ink,
                      descriptionColor: AppColors.secondary,
                      arrowBg: _speakingGreen,
                      arrowColor: Colors.white,
                      onTap: () {},
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
    required this.titleColor,
    required this.descriptionColor,
    required this.arrowBg,
    required this.arrowColor,
    required this.onTap,
    this.gradient,
  });

  final String iconAsset;
  final Color iconBg;
  final String title;
  final String description;
  final Color titleColor;
  final Color descriptionColor;
  final Color arrowBg;
  final Color arrowColor;
  final VoidCallback onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          height: 100,
          decoration: BoxDecoration(
            color: gradient == null ? Colors.white : null,
            gradient: gradient,
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: HomeAsset(iconAsset, width: 32, height: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 20 / 16,
                          fontWeight: FontWeight.w700,
                          color: titleColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w500,
                          color: descriptionColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: arrowBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: arrowColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
