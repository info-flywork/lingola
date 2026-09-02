import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../tutor/chat_screen.dart';
import 'lesson_api_service.dart';

class LessonNotesScreen extends StatefulWidget {
  const LessonNotesScreen({
    required this.notes,
    required this.onPractice,
    this.onRetake,
    super.key,
  });

  final LessonNotesDto notes;
  final VoidCallback onPractice;
  final VoidCallback? onRetake;

  @override
  State<LessonNotesScreen> createState() => _LessonNotesScreenState();
}

class _LessonNotesScreenState extends State<LessonNotesScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter;

  LessonNotesDto get notes => widget.notes;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _enter.dispose();
    super.dispose();
  }

  Future<void> _delete(BuildContext context) async {
    final text = AppText.current.lessonPage;
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

  Animation<double> _slot(double start, double end) {
    return CurvedAnimation(
      parent: _enter,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.lessonPage;
    final title = notes.titleTr?.isNotEmpty == true
        ? notes.titleTr!
        : (notes.titleEn ?? text.notesTitle);
    final warn = notes.shouldRetake;
    final sections = _NotesSection.parse(notes.notes);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          text.notesTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 17,
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
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 36),
        children: [
          _Enter(
            animation: _slot(0.0, 0.35),
            child: _HeroHeader(
              title: title,
              cefr: notes.cefrLevel,
            ),
          ),
          const SizedBox(height: 14),
          _Enter(
            animation: _slot(0.08, 0.48),
            child: _ScoreHeroCard(notes: notes, text: text),
          ),
          const SizedBox(height: 12),
          _Enter(
            animation: _slot(0.16, 0.55),
            child: _SummaryCard(
              label: text.whatWeLearned,
              body: notes.spokenSummary,
            ),
          ),
          if (sections.isNotEmpty) ...[
            const SizedBox(height: 18),
            _Enter(
              animation: _slot(0.22, 0.62),
              child: Text(
                text.notesTitle,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 10),
            for (var i = 0; i < sections.length; i++) ...[
              _Enter(
                animation: _slot(
                  (0.28 + i * 0.06).clamp(0.0, 0.85),
                  (0.55 + i * 0.08).clamp(0.4, 1.0),
                ),
                child: _NoteSectionCard(section: sections[i], index: i),
              ),
              if (i < sections.length - 1) const SizedBox(height: 10),
            ],
          ] else if (notes.notes.trim().isNotEmpty) ...[
            const SizedBox(height: 14),
            _Enter(
              animation: _slot(0.28, 0.7),
              child: _NoteSectionCard(
                section: _NotesSection(title: null, lines: [notes.notes]),
                index: 0,
              ),
            ),
          ],
          if (warn) ...[
            const SizedBox(height: 18),
            _Enter(
              animation: _slot(0.55, 0.95),
              child: _PracticeCallout(
                message: notes.evaluation?.trim().isNotEmpty == true
                    ? notes.evaluation!
                    : text.practiceCta,
                practiceLabel: text.practiceNow,
                retakeLabel: text.retakeLesson,
                onPractice: widget.onPractice,
                onRetake: widget.onRetake,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Enter extends StatelessWidget {
  const _Enter({required this.animation, required this.child});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.title, this.cefr});

  final String title;
  final String? cefr;

  @override
  Widget build(BuildContext context) {
    final level = (cefr ?? '').trim().toUpperCase();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2D46FF),
            Color(0xFF1A2FCC),
            Color(0xFF0014AB),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.28),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (level.isNotEmpty) ...[
            Container(
              width: 64,
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                level,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 14),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 26 / 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppText.current.lessonPage.notesTitle,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.78),
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

class _ScoreHeroCard extends StatelessWidget {
  const _ScoreHeroCard({required this.notes, required this.text});

  final LessonNotesDto notes;
  final dynamic text;

  @override
  Widget build(BuildContext context) {
    final warn = notes.shouldRetake;
    final color = warn ? const Color(0xFFFF5623) : AppColors.primary;
    final label = switch (notes.participation) {
      'silent' => text.participationSilent as String,
      'passive' => text.participationPassive as String,
      'strong' => text.participationStrong as String,
      _ => text.participationActive as String,
    };
    final prev = notes.previousScore;
    final changed = prev != null && prev != notes.score;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border10),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          _AnimatedScoreRing(
            score: notes.score.clamp(0, 100),
            color: color,
          ),
          const SizedBox(width: 16),
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
                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    height: 22 / 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    if (changed)
                      _MetaChip(
                        text.scoreChanged(prev: '$prev', now: '${notes.score}')
                            as String,
                        color: color,
                      ),
                    if (notes.bestScore != null)
                      _MetaChip(
                        text.bestScore(score: '${notes.bestScore}') as String,
                        color: AppColors.secondary,
                      ),
                    if (notes.attemptCount > 1)
                      _MetaChip(
                        '×${notes.attemptCount}',
                        color: AppColors.secondary,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip(this.label, {required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _AnimatedScoreRing extends StatelessWidget {
  const _AnimatedScoreRing({required this.score, required this.color});

  final int score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: score / 100),
      duration: const Duration(milliseconds: 1100),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return SizedBox(
          width: 84,
          height: 84,
          child: CustomPaint(
            painter: _ScoreRingPainter(
              progress: value,
              color: color,
              track: color.withValues(alpha: 0.12),
            ),
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: score.toDouble()),
                duration: const Duration(milliseconds: 1100),
                curve: Curves.easeOutCubic,
                builder: (context, n, _) {
                  return Text(
                    '${n.round()}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: color,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ScoreRingPainter extends CustomPainter {
  _ScoreRingPainter({
    required this.progress,
    required this.color,
    required this.track,
  });

  final double progress;
  final Color color;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 5;
    final trackPaint = Paint()
      ..color = track
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    final progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        colors: [color.withValues(alpha: 0.55), color],
        stops: const [0.0, 1.0],
        transform: const GradientRotation(-math.pi / 2),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.track != track;
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.body});

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    if (body.trim().isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.10),
            AppColors.primary.withValues(alpha: 0.04),
          ],
        ),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            body.trim(),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotesSection {
  const _NotesSection({required this.title, required this.lines});

  final String? title;
  final List<String> lines;

  static List<_NotesSection> parse(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return const [];

    final sections = <_NotesSection>[];
    String? currentTitle;
    var currentLines = <String>[];

    void flush() {
      final lines = currentLines
          .map((e) => e.trimRight())
          .where((e) => e.trim().isNotEmpty)
          .toList();
      if (currentTitle == null && lines.isEmpty) return;
      sections.add(_NotesSection(title: currentTitle, lines: lines));
      currentTitle = null;
      currentLines = <String>[];
    }

    for (final line in trimmed.split('\n')) {
      final t = line.trim();
      if (t.startsWith('## ') || t.startsWith('# ') || t.startsWith('### ')) {
        flush();
        currentTitle = t.replaceFirst(RegExp(r'^#{1,3}\s+'), '').trim();
        continue;
      }
      currentLines.add(line);
    }
    flush();
    return sections;
  }
}

class _NoteSectionCard extends StatelessWidget {
  const _NoteSectionCard({required this.section, required this.index});

  final _NotesSection section;
  final int index;

  static const _accents = [
    AppColors.primary,
    Color(0xFF2D85FF),
    Color(0xFF63B1D9),
    Color(0xFFFF5623),
  ];

  @override
  Widget build(BuildContext context) {
    final accent = _accents[index % _accents.length];
    final bullets = <String>[];
    final paragraphs = <String>[];

    for (final line in section.lines) {
      final t = line.trim();
      if (t.isEmpty) continue;
      if (t.startsWith('- ') || t.startsWith('* ')) {
        bullets.add(t.substring(2).trim());
      } else {
        paragraphs.add(t);
      }
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (section.title != null && section.title!.isNotEmpty) ...[
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    section.title!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          for (final p in paragraphs)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text.rich(
                _boldSpans(
                  p,
                  const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.5,
                    height: 20 / 13.5,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ),
          for (final b in bullets)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text.rich(
                      _boldSpans(
                        b,
                        const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13.5,
                          height: 20 / 13.5,
                          color: AppColors.ink,
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

class _PracticeCallout extends StatelessWidget {
  const _PracticeCallout({
    required this.message,
    required this.practiceLabel,
    required this.retakeLabel,
    required this.onPractice,
    this.onRetake,
  });

  final String message;
  final String practiceLabel;
  final String retakeLabel;
  final VoidCallback onPractice;
  final VoidCallback? onRetake;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F0),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFF5623).withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5623).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  color: Color(0xFFFF5623),
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.5,
                    height: 19 / 13.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (onRetake != null) ...[
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: onRetake,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  retakeLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: onPractice,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                practiceLabel,
                style: const TextStyle(
                  fontFamily: 'Poppins',
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
