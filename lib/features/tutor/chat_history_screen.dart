import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'chat_screen.dart';
import 'tutor_screen.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final featured = [
      (
        text.tutors.elenaSchmidt,
        'assets/images/tutors/elena.png',
        [
          text.tags.adaptive,
          text.tags.calm,
          text.tags.patient,
          text.tags.more,
        ],
      ),
      (
        text.tutors.kenjiSato,
        'assets/images/tutors/kenji.png',
        [
          text.tags.adaptive,
          text.tags.calm,
          text.tags.patient,
          text.tags.more,
        ],
      ),
    ];
    final history = [
      (
        text.tutors.elenaSchmidt,
        'assets/images/tutors/elena.png',
        text.historyPreview1,
        text.time1,
      ),
      (
        text.tutors.kenjiSato,
        'assets/images/tutors/kenji.png',
        text.historyPreview2,
        text.time2,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: AppText.current.common.back,
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          text.chatHistory,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          SizedBox(
            height: 303,
            child: Row(
              children: [
                for (var i = 0; i < featured.length; i++) ...[
                  if (i > 0) const SizedBox(width: 12),
                  Expanded(
                    child: TutorCard(
                      name: featured[i].$1,
                      imagePath: featured[i].$2,
                      tags: featured[i].$3,
                      onStartTalk: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => ChatScreen(
                              tutorName: featured[i].$1,
                              imagePath: featured[i].$2,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text.history,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          for (final item in history) ...[
            _HistoryTile(
              name: item.$1,
              imagePath: item.$2,
              preview: item.$3,
              time: item.$4,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ChatScreen(
                      tutorName: item.$1,
                      imagePath: item.$2,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.name,
    required this.imagePath,
    required this.preview,
    required this.time,
    required this.onTap,
  });

  final String name;
  final String imagePath;
  final String preview;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: HomeAsset(
                  imagePath,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      preview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        height: 1.35,
                        color: AppColors.secondary,
                      ),
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
