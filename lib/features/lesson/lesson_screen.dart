import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../tutor/calling_screen.dart';
import '../tutor/chat_screen.dart';
import '../tutor/services/tutor_api_service.dart';
import 'lesson_api_service.dart';
import 'lesson_curriculum.dart';
import 'lesson_notes_screen.dart';
import 'lesson_session_result.dart';
import 'lesson_tutor_sheet.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  static _LessonScreenState? _state;

  /// Home Continue kartından dersi aynı/farklı hoca ile sürdür.
  static Future<void> resumeFromHome({
    required String slug,
    required String label,
    String? tutorId,
    String? tutorSlug,
  }) async {
    final state = _state;
    if (state == null) return;
    await state.resumeFromHome(
      slug: slug,
      label: label,
      tutorId: tutorId,
      tutorSlug: tutorSlug,
    );
  }

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  Map<String, List<LessonNodeDto>> _remote = const {};
  var _busy = false;

  @override
  void initState() {
    super.initState();
    LessonScreen._state = this;
    _loadPath();
  }

  @override
  void dispose() {
    if (LessonScreen._state == this) LessonScreen._state = null;
    super.dispose();
  }

  Future<void> _loadPath() async {
    try {
      final path = await LessonApiService.fetchPath();
      if (!mounted) return;
      setState(() {
        _remote = {
          for (final level in path.levels) level.id: level.lessons,
        };
      });
    } catch (_) {
      // Yerel müfredat durur; kilit durumu aşağıda fallback.
    }
  }

  _NodeState _stateFor(String levelId, int index) {
    final list = _remote[levelId];
    if (list != null && index < list.length) {
      final status = list[index].status;
      if (status == 'completed') return _NodeState.completed;
      if (status == 'available') return _NodeState.active;
      return _NodeState.locked;
    }
    if (levelId == 'a1' && index == 0) return _NodeState.active;
    return _NodeState.locked;
  }

  LessonNodeDto? _remoteAt(String levelId, int index) {
    final list = _remote[levelId];
    if (list == null || index >= list.length) return null;
    return list[index];
  }

  String? _slugFor(String levelId, int index) {
    final remote = _remoteAt(levelId, index);
    if (remote != null && remote.slug.isNotEmpty) return remote.slug;
    return LessonCurriculum.slugAt(levelId, index);
  }

  Future<void> _onNodeTap({
    required String levelId,
    required int index,
    required String label,
  }) async {
    if (_busy) return;
    final text = AppText.current.lessonPage;
    final remote = _remoteAt(levelId, index);
    final slug = _slugFor(levelId, index);
    final state = _stateFor(levelId, index);

    if (state == _NodeState.locked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.lockedHint)),
      );
      return;
    }

    if (state == _NodeState.completed && remote?.hasNotes == true) {
      await _openNotes(slug: slug, label: label, offerPractice: true);
      return;
    }

    await _startWithTutor(
      slug: slug,
      label: label,
      kind: 'lesson',
    );
  }

  Future<void> _openNotes({
    String? slug,
    required String label,
    required bool offerPractice,
  }) async {
    if (slug == null || slug.isEmpty) return;
    final text = AppText.current.lessonPage;
    try {
      final notes = await LessonApiService.fetchNotes(slug);
      if (!mounted) return;
      await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => LessonNotesScreen(
            notes: notes,
            onPractice: () {
              Navigator.of(context).pop();
              _startWithTutor(slug: slug, label: label, kind: 'practice');
            },
            onRetake: () {
              Navigator.of(context).pop();
              _startWithTutor(slug: slug, label: label, kind: 'lesson');
            },
          ),
        ),
      );
      await _loadPath();
    } on ApiException catch (err) {
      if (!mounted) return;
      if (err.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text.noNotes)),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
    }
  }

  Future<void> _startWithTutor({
    required String? slug,
    required String label,
    required String kind,
    TutorDto? preferredTutor,
    String preferredMode = 'talk',
  }) async {
    if (slug == null || slug.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lesson catalog is not ready yet.')),
      );
      return;
    }

    LessonTutorChoice? choice;
    if (preferredTutor != null) {
      choice = LessonTutorChoice(tutor: preferredTutor, mode: preferredMode);
    } else {
      choice = await showLessonTutorSheet(context, lessonTitle: label);
    }
    if (choice == null || !mounted) return;

    setState(() => _busy = true);
    try {
      final start = await LessonApiService.start(
        slug: slug,
        tutorId: choice.tutor.id,
        tutorSlug: choice.tutor.slug,
        kind: kind,
      );
      if (!mounted) return;

      final tutorName = _tutorName(choice.tutor);
      final image = _resolveTutorImage(choice.tutor, start.tutorImage);
      final priorElapsed = Duration(seconds: start.lessonElapsedSeconds);
      final remaining = Duration(
        seconds: start.remainingSeconds.clamp(60, 15 * 60),
      );
      LessonSessionResult? sessionResult;

      if (choice.mode == 'chat') {
        sessionResult = await Navigator.of(context).push<LessonSessionResult>(
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              tutorName: tutorName,
              imagePath: image,
              tutorId: choice!.tutor.id,
              tutorSlug: choice.tutor.slug,
              sessionId: start.sessionId,
              finishOnPop: true,
              lessonSegmentMode: true,
              segmentDuration: remaining,
              initialElapsed: priorElapsed,
            ),
          ),
        );
      } else {
        final theme = choice.tutor.theme;
        sessionResult = await Navigator.of(context).push<LessonSessionResult>(
          MaterialPageRoute(
            builder: (_) => CallingScreen(
              tutorName: tutorName,
              imagePath: image,
              riveAsset: choice!.tutor.bundledRivePath,
              riveCdnUrl: choice.tutor.remoteRiveUrl ??
                  ((start.tutorRive != null &&
                          start.tutorRive!.startsWith('http'))
                      ? start.tutorRive
                      : null),
              voiceId: choice.tutor.voiceId ?? start.tutorVoiceId,
              backgroundGradientStart: _parseHex(theme?.gradientStart),
              backgroundGradientEnd: _parseHex(theme?.gradientEnd),
              openingLine: start.openingMessage,
              systemPrompt: start.systemPrompt,
              returnTranscript: true,
              lessonSegmentMode: true,
              segmentDuration: remaining,
              initialElapsed: priorElapsed,
              tutorSlug: choice.tutor.slug.isNotEmpty
                  ? choice.tutor.slug
                  : start.tutorSlug,
            ),
          ),
        );
      }

      if (!mounted || sessionResult == null) return;

      final transcript = sessionResult.transcript;
      final sessionSeconds = sessionResult.elapsedSeconds;

      if (sessionResult.finish) {
        await _completeAndShowNotes(
          slug: slug,
          label: label,
          tutorId: choice.tutor.id,
          sessionId: start.sessionId,
          kind: kind,
          transcript: transcript,
          addElapsedSeconds: sessionSeconds - priorElapsed.inSeconds,
        );
      } else {
        await LessonApiService.saveProgress(
          slug: slug,
          tutorId: choice.tutor.id,
          sessionId: start.sessionId,
          transcript: transcript,
          addElapsedSeconds: (sessionSeconds - priorElapsed.inSeconds)
              .clamp(0, 15 * 60),
        );
        await _loadPath();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppText.current.home.continueConversation,
            ),
          ),
        );
      }
    } on ApiException catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Home "Continue" — aynı hoca veya yeni hoca seçimi.
  Future<void> resumeFromHome({
    required String slug,
    required String label,
    String? tutorId,
    String? tutorSlug,
  }) async {
    final text = AppText.current;
    TutorDto? previous;
    if (tutorId != null || (tutorSlug != null && tutorSlug.isNotEmpty)) {
      try {
        final tutors = await TutorApiService.fetchTutors();
        for (final t in tutors) {
          if ((tutorId != null && t.id == tutorId) ||
              (tutorSlug != null && t.slug == tutorSlug)) {
            previous = t;
            break;
          }
        }
      } catch (_) {}
    }

    if (!mounted) return;

    if (previous != null) {
      final action = await showModalBottomSheet<String>(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (ctx) {
          final name = _tutorName(previous!);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text.home.continueConversation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text.home.continueWithTutor(name: name),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () => Navigator.pop(ctx, 'same'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(text.home.continueSameTutor(name: name)),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(ctx, 'other'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(text.home.chooseOtherTutor),
                  ),
                ],
              ),
            ),
          );
        },
      );
      if (!mounted) return;
      if (action == 'same') {
        await _startWithTutor(
          slug: slug,
          label: label,
          kind: 'lesson',
          preferredTutor: previous,
        );
        return;
      }
      if (action != 'other') return;
    }

    await _startWithTutor(slug: slug, label: label, kind: 'lesson');
  }

  Future<void> _completeAndShowNotes({
    required String slug,
    required String label,
    required String tutorId,
    required String sessionId,
    required String kind,
    required List<Map<String, String>> transcript,
    int? addElapsedSeconds,
  }) async {
    final text = AppText.current.lessonPage;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Expanded(child: Text(text.savingNotes)),
          ],
        ),
      ),
    );
    try {
      final notes = await LessonApiService.complete(
        slug: slug,
        tutorId: tutorId,
        sessionId: sessionId,
        kind: kind,
        transcript: transcript,
        addElapsedSeconds: addElapsedSeconds,
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      await _loadPath();
      if (!mounted) return;
      await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => LessonNotesScreen(
            notes: notes,
            onPractice: () {
              Navigator.of(context).pop();
              _startWithTutor(slug: slug, label: label, kind: 'practice');
            },
            onRetake: () {
              Navigator.of(context).pop();
              _startWithTutor(slug: slug, label: label, kind: 'lesson');
            },
          ),
        ),
      );
      await _loadPath();
    } catch (err) {
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }

  static String _resolveTutorImage(TutorDto tutor, String? fromStart) {
    final local = tutor.imagePath ?? fromStart;
    if (local != null && local.trim().isNotEmpty) return local.trim();
    return AppAssets.tutorRobot;
  }

  static String _tutorName(TutorDto tutor) {
    final key = tutor.nameKey;
    final tutors = AppText.current.tutorPage.tutors;
    switch (key) {
      case 'lingola':
        return tutors.lingola;
      case 'zephyrion':
        return tutors.zephyrion;
      case 'vaelen':
        return tutors.vaelen;
      case 'elrion':
        return tutors.elrion;
      case 'ukrath':
        return tutors.ukrath;
      case 'elena':
        return tutors.elena;
      case 'kenji':
        return tutors.kenji;
      case 'freya':
        return tutors.freya;
      case 'camila':
        return tutors.camila;
      case 'marco':
        return tutors.marco;
      case 'julian':
        return tutors.julian;
      case 'ines':
        return tutors.ines;
      case 'felix':
        return tutors.felix;
      case 'diego':
        return tutors.diego;
      case 'amara':
        return tutors.amara;
      case 'erik':
        return tutors.erik;
      case 'katie':
        return tutors.katie;
      case 'morgan':
        return tutors.morgan;
      case 'santa':
        return tutors.santa;
      default:
        return tutor.slug;
    }
  }

  static Color? _parseHex(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    var hex = raw.trim().replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }

  @override
  Widget build(BuildContext context) {
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

    final sections = <_LevelSectionData>[];
    for (final level in LessonCurriculum.levels) {
      final lessons = lessonLists[level.id]!;
      final icons = level.iconAssets;
      final levelNodes = <_LessonPathNodeData>[
        for (var i = 0; i < lessons.length; i++)
          _LessonPathNodeData(
            label: lessons[i],
            iconAsset: icons[i < icons.length ? i : icons.length - 1],
            state: _stateFor(level.id, i),
            onTap: () => _onNodeTap(
              levelId: level.id,
              index: i,
              label: lessons[i],
            ),
          ),
      ];
      sections.add(
        _LevelSectionData(
          title: titles[level.id]!,
          nodes: levelNodes,
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            scrollCacheExtent: const ScrollCacheExtent.pixels(1200),
            slivers: [
              SliverToBoxAdapter(child: _LessonHeader(text: text)),
              for (final section in sections)
                SliverToBoxAdapter(
                  child: _LevelPathSection(
                    title: section.title,
                    nodes: section.nodes,
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonPathNodeData {
  const _LessonPathNodeData({
    required this.label,
    required this.iconAsset,
    required this.state,
    required this.onTap,
  });
  final String label;
  final String iconAsset;
  final _NodeState state;
  final VoidCallback onTap;
}

class _LevelSectionData {
  const _LevelSectionData({
    required this.title,
    required this.nodes,
  });

  final String title;
  final List<_LessonPathNodeData> nodes;
}

class _LessonHeader extends StatelessWidget {
  const _LessonHeader({required this.text});

  final Translations text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(21, 12, 21, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Semantics(
                label: text.lessonPage.profile,
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE5E5E5)),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
              ),
              const Spacer(),
              Semantics(
                label: text.lessonPage.language,
                child: Container(
                  width: 33,
                  height: 33,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'assets/images/flags/en.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            text.lessonPage.title,
            style: const TextStyle(
              color: AppColors.ink,
              fontFamily: 'Poppins',
              fontSize: 28,
              height: 36 / 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tek seviye: başlık + kendi path’i (A1 / A2 / … birbirine bağlı değil).
class _LevelPathSection extends StatelessWidget {
  const _LevelPathSection({
    required this.title,
    required this.nodes,
  });

  final String title;
  final List<_LessonPathNodeData> nodes;

  @override
  Widget build(BuildContext context) {
    if (nodes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(21, 20, 21, 4),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF3D3D3D),
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _LevelLessonPath(
          nodes: nodes,
        ),
      ],
    );
  }
}

/// Bir seviyenin bağımsız S-yolu — yumuşak U, ikon apex ortasında.
class _LevelLessonPath extends StatelessWidget {
  const _LevelLessonPath({
    required this.nodes,
  });

  final List<_LessonPathNodeData> nodes;

  static const _designWidth = 398.0;
  static const _leftX = 65.0;
  static const _rightX = 278.0;
  static const _nodeSize = 63.0;
  static const _pitch = 112.0;
  static const _y0 = 40.0;
  static const _trackStroke = 22.0;

  bool _isLeft(int index) => index.isOdd;

  ({List<double> hs, List<double> nodeCenters}) _layout(int n) {
    final hs = <double>[_y0];
    final nodeCenters = <double>[_y0];
    for (var i = 1; i < n; i++) {
      hs.add(hs.last + _pitch);
      final yTop = hs[hs.length - 2];
      final yBot = hs[hs.length - 1];
      nodeCenters.add((yTop + yBot) / 2);
    }
    return (hs: hs, nodeCenters: nodeCenters);
  }

  @override
  Widget build(BuildContext context) {
    final n = nodes.length;
    if (n == 0) return const SizedBox.shrink();

    final layout = _layout(n);
    final nodeCenters = layout.nodeCenters;
    final horizontalYs = layout.hs;

    double nodeTop(int i) => nodeCenters[i] - _nodeSize / 2;

    final lastTop = nodeTop(n - 1);
    final height = lastTop + _nodeSize + 48;
    final leftApex = _leftX + _nodeSize / 2;
    final rightApex = _rightX + _nodeSize / 2;
    const radius = _pitch / 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: height * (constraints.maxWidth / _designWidth),
          width: constraints.maxWidth,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: _designWidth,
              height: height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _LessonPathTrackPainter(
                        horizontalYs: horizontalYs,
                        leftApexX: leftApex,
                        rightApexX: rightApex,
                        radius: radius,
                        strokeWidth: _trackStroke,
                      ),
                    ),
                  ),
                  for (var i = 0; i < n; i++)
                    Positioned(
                      left: _isLeft(i) ? _leftX : _rightX,
                      top: nodeTop(i),
                      child: _LessonNode(
                        label: nodes[i].label,
                        iconAsset: nodes[i].iconAsset,
                        state: nodes[i].state,
                        onTap: nodes[i].onTap,
                        // İlk node (Greetings): Figma’da etiket ikonun altında.
                        labelSide: i == 0
                            ? _LabelSide.below
                            : (_isLeft(i)
                                ? _LabelSide.right
                                : _LabelSide.left),
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

enum _NodeState { active, completed, locked }

enum _LabelSide { left, right, below }

class _LessonNode extends StatelessWidget {
  const _LessonNode({
    required this.label,
    required this.iconAsset,
    required this.state,
    required this.labelSide,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final _NodeState state;
  final _LabelSide labelSide;
  final VoidCallback onTap;

  static const _size = 63.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final isLocked = state == _NodeState.locked;
    final circle = isLocked ? const Color(0xFFDBDBDB) : AppColors.primary;
    final iconColor = isLocked ? const Color(0xFF656565) : Colors.white;
    final labelColor = switch (state) {
      _NodeState.active => AppColors.primary,
      _NodeState.completed => AppColors.ink,
      _NodeState.locked => AppColors.secondary,
    };

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              color: circle,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .18),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconAsset,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              placeholderBuilder: (_) => const SizedBox(width: 28, height: 28),
            ),
          ),
          if (state == _NodeState.completed)
            Positioned(
              right: -4,
              bottom: -4,
              child: Semantics(
                label: text.lessonPage.completed,
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34C759),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (isLocked)
            Positioned(
              // SVG viewBox 30x30; görünür daire ~22–23 (Figma).
              right: -6,
              bottom: -2,
              child: Semantics(
                label: text.lessonPage.locked,
                child: SvgPicture.asset(
                  'assets/learningPath/a1/badge_lock.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          if (labelSide == _LabelSide.right)
            Positioned(
              left: _size + 10,
              top: (_size - 30) / 2,
              width: 118,
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: _labelStyle(labelColor),
              ),
            ),
          if (labelSide == _LabelSide.left)
            Positioned(
              left: -128,
              top: (_size - 30) / 2,
              width: 118,
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: _labelStyle(labelColor),
              ),
            ),
          if (labelSide == _LabelSide.below)
            Positioned(
              left: (_size - 118) / 2,
              top: _size + 6,
              width: 118,
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: _labelStyle(labelColor),
              ),
            ),
        ],
      ),
      ),
    );
  }

  TextStyle _labelStyle(Color color) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 12,
      height: 15 / 12,
      fontWeight: FontWeight.w500,
    );
  }
}

/// Yumuşak yarım daire U’lar; sabit yarıçap.
class _LessonPathTrackPainter extends CustomPainter {
  _LessonPathTrackPainter({
    required this.horizontalYs,
    required this.leftApexX,
    required this.rightApexX,
    required this.radius,
    required this.strokeWidth,
  });

  final List<double> horizontalYs;
  final double leftApexX;
  final double rightApexX;
  final double radius;
  final double strokeWidth;

  Path _buildCenterline() {
    final hs = horizontalYs;
    final path = Path();
    if (hs.isEmpty) return path;

    final leftInner = leftApexX + radius;
    final rightInner = rightApexX - radius;

    path.moveTo(rightApexX, hs[0]);
    if (hs.length == 1) return path;

    for (var i = 0; i < hs.length - 1; i++) {
      final yA = hs[i];
      final yB = hs[i + 1];
      if (i.isEven) {
        path.lineTo(leftInner, yA);
        path.arcToPoint(
          Offset(leftInner, yB),
          radius: Radius.circular(radius),
          clockwise: false,
        );
      } else {
        path.lineTo(rightInner, yA);
        path.arcToPoint(
          Offset(rightInner, yB),
          radius: Radius.circular(radius),
          clockwise: true,
        );
      }
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (horizontalYs.isEmpty) return;

    final track = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(_buildCenterline(), track);
  }

  @override
  bool shouldRepaint(covariant _LessonPathTrackPainter oldDelegate) {
    return oldDelegate.horizontalYs != horizontalYs ||
        oldDelegate.leftApexX != leftApexX ||
        oldDelegate.rightApexX != rightApexX ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
