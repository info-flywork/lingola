import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/home_asset.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int? _expandedIndex = 0;

  List<({String q, String a})> _faqItems(page) {
    final items = page.faqItems;
    return [
      (q: items.supportedLanguages.question, a: items.supportedLanguages.answer),
      (q: items.howAiWorks.question, a: items.howAiWorks.answer),
      (q: items.offlineUse.question, a: items.offlineUse.answer),
      (q: items.isFree.question, a: items.isFree.answer),
      (q: items.pronunciationEval.question, a: items.pronunciationEval.answer),
      (q: items.dailyPractice.question, a: items.dailyPractice.answer),
      (q: items.levelDetermination.question, a: items.levelDetermination.answer),
      (q: items.realPeopleChat.question, a: items.realPeopleChat.answer),
      (q: items.dataSecurity.question, a: items.dataSecurity.answer),
      (q: items.disableReminders.question, a: items.disableReminders.answer),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLocale>(
      valueListenable: AppLocaleSync.localeChanges,
      builder: (context, _, __) {
        final text = AppText.current.profilePage;
        final items = _faqItems(text);

        return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
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
                    Expanded(
                      child: Text(
                        text.faq,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final expanded = _expandedIndex == index;
                    return _FaqCard(
                      question: item.q,
                      answer: item.a,
                      expanded: expanded,
                      onTap: () {
                        setState(() {
                          _expandedIndex = expanded ? null : index;
                        });
                      },
                    );
                  },
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

class _FaqCard extends StatelessWidget {
  const _FaqCard({
    required this.question,
    required this.answer,
    required this.expanded,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        height: 16 / 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  HomeAsset(
                    expanded
                        ? AppAssets.profileTopArrow
                        : AppAssets.profileBottomArrow,
                    width: 18,
                    height: 18,
                  ),
                ],
              ),
              if (expanded) ...[
                const SizedBox(height: 8),
                Text(
                  answer,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 18 / 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
