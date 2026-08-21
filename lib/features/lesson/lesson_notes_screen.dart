import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../tutor/chat_screen.dart';
import 'lesson_api_service.dart';

class LessonNotesScreen extends StatelessWidget {
  const LessonNotesScreen({
    required this.notes,
    required this.onPractice,
    this.onRetake,
    super.key,
  });

  final LessonNotesDto notes;
  final VoidCallback onPractice;
  final VoidCallback? onRetake;

  Future<void> _delete(BuildContext context) async {
    final text = AppText.current.lessonPage;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(text.deleteNotes),
        content: Text(text.deleteNotesConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(text.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              text.delete,
              style: const TextStyle(color: Color(0xFFB71C1C)),
            ),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    try {
      await LessonApiService.deleteNotes(notes.slug);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.notesDeleted)),
      );
      Navigator.of(context).pop(true);
    } on ApiException catch (err) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.lessonPage;
    final title = notes.titleTr?.isNotEmpty == true
        ? notes.titleTr!
        : (notes.titleEn ?? text.notesTitle);
    final warn = notes.shouldRetake;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          text.notesTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        actions: [
          if (notes.chatSessionId != null && notes.chatSessionId!.isNotEmpty)
            IconButton(
              tooltip: text.openChat,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ChatScreen(
                      tutorName: notes.tutorNameKey ?? 'Tutor',
                      imagePath: notes.tutorImage ?? '',
                      tutorId: notes.tutorId,
                      tutorSlug: notes.tutorSlug,
                      sessionId: notes.chatSessionId,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppColors.primary,
              ),
            ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: AppColors.ink),
            onSelected: (value) {
              if (value == 'delete') _delete(context);
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  text.delete,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFB71C1C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          if (notes.cefrLevel != null) ...[
            const SizedBox(height: 4),
            Text(
              notes.cefrLevel!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: AppColors.secondary,
              ),
            ),
          ],
          const SizedBox(height: 16),
          _ScoreCard(notes: notes, text: text),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryTint10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.whatWeLearned,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  notes.spokenSummary,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    height: 22 / 15,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _NotesBody(notes.notes),
          if (warn) ...[
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes.evaluation?.trim().isNotEmpty == true
                        ? notes.evaluation!
                        : text.practiceCta,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 20 / 14,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (onRetake != null)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: onRetake,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: Text(text.retakeLesson),
                      ),
                    ),
                  if (onRetake != null) const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onPractice,
                      child: Text(text.practiceNow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({required this.notes, required this.text});

  final LessonNotesDto notes;
  final dynamic text;

  @override
  Widget build(BuildContext context) {
    final warn = notes.shouldRetake;
    final color = warn ? const Color(0xFFC2410C) : AppColors.primary;
    final label = switch (notes.participation) {
      'silent' => text.participationSilent as String,
      'passive' => text.participationPassive as String,
      'strong' => text.participationStrong as String,
      _ => text.participationActive as String,
    };
    final body = (notes.evaluation != null && notes.evaluation!.trim().isNotEmpty)
        ? notes.evaluation!
        : switch (notes.participation) {
            'silent' => text.participationSilentBody as String,
            'passive' => text.participationPassiveBody as String,
            'strong' => text.participationStrongBody as String,
            _ => text.participationActiveBody as String,
          };
    final prev = notes.previousScore;
    final changed = prev != null && prev != notes.score;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: warn ? const Color(0xFFFFF1E8) : const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: (notes.score.clamp(0, 100)) / 100,
                  strokeWidth: 6,
                  backgroundColor: color.withValues(alpha: 0.15),
                  color: color,
                ),
                Text(
                  '${notes.score}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.yourScore as String,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    height: 18 / 13,
                    color: AppColors.ink,
                  ),
                ),
                if (changed) ...[
                  const SizedBox(height: 6),
                  Text(
                    text.scoreChanged(prev: '$prev', now: '${notes.score}')
                        as String,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
                if (notes.bestScore != null &&
                    notes.bestScore != notes.score) ...[
                  const SizedBox(height: 2),
                  Text(
                    text.bestScore(score: '${notes.bestScore}') as String,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotesBody extends StatelessWidget {
  const _NotesBody(this.raw);

  final String raw;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    for (final line in raw.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        widgets.add(const SizedBox(height: 8));
        continue;
      }
      var text = trimmed;
      var style = const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        height: 22 / 14,
        color: AppColors.ink,
      );
      if (text.startsWith('### ')) {
        text = text.substring(4);
        style = style.copyWith(fontSize: 15, fontWeight: FontWeight.w600);
      } else if (text.startsWith('## ')) {
        text = text.substring(3);
        style = style.copyWith(fontSize: 16, fontWeight: FontWeight.w700);
      } else if (text.startsWith('# ')) {
        text = text.substring(2);
        style = style.copyWith(fontSize: 17, fontWeight: FontWeight.w700);
      } else if (text.startsWith('- ') || text.startsWith('* ')) {
        text = '• ${text.substring(2)}';
      }
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text.rich(_boldSpans(text, style)),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  static TextSpan _boldSpans(String text, TextStyle style) {
    final spans = <TextSpan>[];
    final re = RegExp(r'\*\*(.+?)\*\*');
    var start = 0;
    for (final m in re.allMatches(text)) {
      if (m.start > start) {
        spans.add(TextSpan(text: text.substring(start, m.start)));
      }
      spans.add(
        TextSpan(
          text: m.group(1),
          style: style.copyWith(fontWeight: FontWeight.w700),
        ),
      );
      start = m.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }
    return TextSpan(style: style, children: spans);
  }
}
