import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/auth_service.dart';
import '../../core/auth/app_user.dart';
import '../../core/auth/session_store.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/notifications/notification_activity_store.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../tutor/calling_screen.dart';
import '../tutor/chat_screen.dart';
import '../tutor/services/tutor_api_service.dart';
import '../tutor/tutor_scene_theme.dart';
import 'lesson_api_service.dart';
import 'lesson_badge.dart';
import 'lesson_curriculum.dart';
import 'lesson_notes_screen.dart';
import 'lesson_path_view.dart';
import 'lesson_session_result.dart';
import '../onboarding/language_flag.dart';
import '../shell/main_shell.dart';
import '../../widgets/user_avatar.dart';
import '../../widgets/path_scroll_fab.dart';
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
    String? forceTutorSlug,
  }) async {
    final state = _state;
    if (state == null) return;
    await state.resumeFromHome(
      slug: slug,
      label: label,
      tutorId: tutorId,
      tutorSlug: tutorSlug,
      forceTutorSlug: forceTutorSlug,
    );
  }

  /// Ana sayfa path node — doğrudan derse gir.
  static Future<void> openLessonFromHome({
    required String slug,
    required String label,
    required String status,
    required int a1Index,
    bool hasNotes = false,
    String? tutorId,
    String? tutorSlug,
    String? cefrLevel,
    String? userCefrMax,
  }) async {
    final state = _state;
    if (state == null) return;
    await state.openLessonFromHome(
      slug: slug,
      label: label,
      status: status,
      a1Index: a1Index,
      hasNotes: hasNotes,
      tutorId: tutorId,
      tutorSlug: tutorSlug,
      cefrLevel: cefrLevel,
      userCefrMax: userCefrMax,
    );
  }

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  Map<String, List<LessonNodeDto>> _remote = const {};
  String? _userCefrMax;
  var _busy = false;
  final _scrollController = ScrollController();
  final _progressAnchorKey = GlobalKey();
  var _fabPointsToTop = false;
  var _fabVisible = false;

  @override
  void initState() {
    super.initState();
    LessonScreen._state = this;
    _scrollController.addListener(_onScroll);
    _loadPath();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    if (LessonScreen._state == this) LessonScreen._state = null;
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final offset = _scrollController.offset;
    final max = _scrollController.position.maxScrollExtent;
    final visible = max > 80;
    // Üstteyken ↓ (ilerleme), aşağıdaysan ↑ (başa).
    final pointsToTop = offset > 120;
    if (visible != _fabVisible || pointsToTop != _fabPointsToTop) {
      setState(() {
        _fabVisible = visible;
        _fabPointsToTop = pointsToTop;
      });
    }
  }

  void _updateFabAfterLayout() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _onScroll();
    });
  }

  Future<void> _onPathScrollFabTap() async {
    if (!_scrollController.hasClients) return;
    if (_fabPointsToTop) {
      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    await _scrollToProgressNode();
  }

  ({String levelId, int nodeIndex})? _progressTarget() {
    for (final level in LessonCurriculum.levels) {
      final list = _remote[level.id];
      final count = list?.length ?? level.iconAssets.length;
      for (var i = 0; i < count; i++) {
        if (_stateFor(level.id, i) == LessonNodeState.active) {
          return (levelId: level.id, nodeIndex: i);
        }
      }
    }
    for (final level in LessonCurriculum.levels) {
      final list = _remote[level.id];
      final count = list?.length ?? level.iconAssets.length;
      for (var i = 0; i < count; i++) {
        if (_stateFor(level.id, i) == LessonNodeState.unlocked) {
          return (levelId: level.id, nodeIndex: i);
        }
      }
    }
    return const (levelId: 'a1', nodeIndex: 0);
  }

  Future<void> _scrollToProgressNode() async {
    final anchor = _progressAnchorKey.currentContext;
    if (anchor != null) {
      await Scrollable.ensureVisible(
        anchor,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
        alignment: 0.42,
      );
      return;
    }
    if (!_scrollController.hasClients) return;
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _loadPath() async {
    try {
      final path = await LessonApiService.fetchPath();
      if (!mounted) return;
      setState(() {
        _userCefrMax = path.userCefrMax;
        _remote = {
          for (final level in path.levels) level.id: level.lessons,
        };
      });
      _updateFabAfterLayout();
    } catch (_) {
      // Yerel müfredat durur; kilit durumu aşağıda fallback.
    }
  }

  LessonNodeState _stateFor(String levelId, int index) {
    final list = _remote[levelId];
    if (list != null && index < list.length) {
      final status = list[index].status;
      if (status == 'completed') return LessonNodeState.completed;
      if (status == 'available') return LessonNodeState.active;
      if (status == 'unlocked') return LessonNodeState.unlocked;
      return LessonNodeState.locked;
    }
    if (levelId == 'a1' && index == 0) return LessonNodeState.unlocked;
    return LessonNodeState.locked;
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

  Future<void> _showLevelLockedDialog({
    required String userLevel,
    required String lessonLevel,
  }) async {
    final text = AppText.current.lessonPage;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          text.levelLockedTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          text.levelLockedBody(userLevel: userLevel, lessonLevel: lessonLevel),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 21 / 14,
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(text.levelLockedOk),
          ),
        ],
      ),
    );
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
    final lessonCefr =
        (remote?.cefrLevel ?? levelId).toUpperCase();

    if (state == LessonNodeState.locked) {
      final userMax = (_userCefrMax ?? '').toUpperCase();
      if (userMax.isNotEmpty) {
        await _showLevelLockedDialog(
          userLevel: userMax,
          lessonLevel: lessonCefr,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text.lockedHint)),
        );
      }
      return;
    }

    // Free: yalnızca müfredattaki ilk 2 ders (A1 #0–1).
    final globalIndex = _globalLessonIndex(levelId, index);
    if (!PremiumService.canAccessLessonIndex(globalIndex)) {
      await PremiumService.presentPaywall(context);
      return;
    }

    if (state == LessonNodeState.completed && remote?.hasNotes == true) {
      await _openNotes(slug: slug, label: label, offerPractice: true);
      return;
    }

    await _startWithTutor(
      slug: slug,
      label: label,
      kind: 'lesson',
    );
  }

  Future<void> openLessonFromHome({
    required String slug,
    required String label,
    required String status,
    required int a1Index,
    bool hasNotes = false,
    String? tutorId,
    String? tutorSlug,
    String? cefrLevel,
    String? userCefrMax,
  }) async {
    if (_busy) return;
    final text = AppText.current.lessonPage;
    final nodeState = switch (status) {
      'completed' => LessonNodeState.completed,
      'available' => LessonNodeState.active,
      'unlocked' => LessonNodeState.unlocked,
      _ => LessonNodeState.locked,
    };

    if (nodeState == LessonNodeState.locked) {
      final userMax = (userCefrMax ?? _userCefrMax ?? '').toUpperCase();
      final lessonCefr = (cefrLevel ?? 'a1').toUpperCase();
      if (userMax.isNotEmpty) {
        await _showLevelLockedDialog(
          userLevel: userMax,
          lessonLevel: lessonCefr,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text.lockedHint)),
        );
      }
      return;
    }

    if (!PremiumService.canAccessLessonIndex(a1Index)) {
      await PremiumService.presentPaywall(context);
      return;
    }

    if (nodeState == LessonNodeState.completed && hasNotes) {
      await _openNotes(slug: slug, label: label, offerPractice: true);
      return;
    }

    if (tutorId != null || tutorSlug != null) {
      await resumeFromHome(
        slug: slug,
        label: label,
        tutorId: tutorId,
        tutorSlug: tutorSlug,
      );
      return;
    }

    await _startWithTutor(slug: slug, label: label, kind: 'lesson');
  }

  int _globalLessonIndex(String levelId, int index) {
    var offset = 0;
    for (final level in LessonCurriculum.levels) {
      if (level.id == levelId) return offset + index;
      final list = _remote[level.id];
      offset += list?.length ?? level.iconAssets.length;
    }
    return offset + index;
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

      unawaited(NotificationActivityStore.recordLesson());

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
              riveAsset: choice!.tutor.remoteRiveUrl ??
                  AppAssets.tutorRiveCdn(choice.tutor.slug),
              riveCdnUrl: choice.tutor.remoteRiveUrl ??
                  ((start.tutorRive != null &&
                          start.tutorRive!.startsWith('http'))
                      ? start.tutorRive
                      : AppAssets.tutorRiveCdn(choice.tutor.slug)),
              voiceId: TutorVoiceIds.resolve(
                choice.tutor.slug.isNotEmpty
                    ? choice.tutor.slug
                    : start.tutorSlug,
                preferred: choice.tutor.voiceId ?? start.tutorVoiceId,
              ),
              backgroundGradientStart: _parseHex(theme?.gradientStart) ??
                  TutorSceneTheme.gradientForSlug(choice.tutor.slug)?.$1,
              backgroundGradientEnd: _parseHex(theme?.gradientEnd) ??
                  TutorSceneTheme.gradientForSlug(choice.tutor.slug)?.$2,
              openingLine: start.openingMessage,
              systemPrompt: start.systemPrompt,
              returnTranscript: true,
              lessonSegmentMode: true,
              segmentDuration: remaining,
              initialElapsed: priorElapsed,
              tutorSlug: choice.tutor.slug.isNotEmpty
                  ? choice.tutor.slug
                  : start.tutorSlug,
              lessonSlug: slug,
              lessonBadge: LessonBadge.fromSlug(
                slug: slug,
                fallbackTitle: label,
              ),
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
  /// [forceTutorSlug] verilirse sheet atlanır; o hoca ile derse devam edilir.
  Future<void> resumeFromHome({
    required String slug,
    required String label,
    String? tutorId,
    String? tutorSlug,
    String? forceTutorSlug,
  }) async {
    final text = AppText.current;
    TutorDto? previous;
    TutorDto? forced;
    try {
      final tutors = await TutorApiService.fetchTutors();
      for (final t in tutors) {
        if (forceTutorSlug != null &&
            forceTutorSlug.isNotEmpty &&
            t.slug == forceTutorSlug) {
          forced = t;
        }
        if ((tutorId != null && t.id == tutorId) ||
            (tutorSlug != null && t.slug == tutorSlug)) {
          previous = t;
        }
      }
    } catch (_) {}

    if (!mounted) return;

    if (forced != null) {
      await _startWithTutor(
        slug: slug,
        label: label,
        kind: 'lesson',
        preferredTutor: forced,
        preferredMode: 'talk',
      );
      return;
    }

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
    final progress = _progressTarget();
    for (final level in LessonCurriculum.levels) {
      final lessons = lessonLists[level.id]!;
      final icons = level.iconAssets;
      final levelNodes = <LessonPathNode>[
        for (var i = 0; i < lessons.length; i++)
          LessonPathNode(
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
          progressNodeIndex:
              progress != null && progress.levelId == level.id
                  ? progress.nodeIndex
                  : null,
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomScrollView(
                controller: _scrollController,
                scrollCacheExtent: const ScrollCacheExtent.pixels(1200),
                slivers: [
                  SliverToBoxAdapter(child: _LessonHeader(text: text)),
                  for (final section in sections)
                    SliverToBoxAdapter(
                      child: _LevelPathSection(
                        title: section.title,
                        nodes: section.nodes,
                        progressNodeIndex: section.progressNodeIndex,
                        progressAnchorKey: section.progressNodeIndex != null
                            ? _progressAnchorKey
                            : null,
                      ),
                    ),
                  const SliverToBoxAdapter(child: SizedBox(height: 88)),
                ],
              ),
              PathScrollFab(
                visible: _fabVisible,
                pointsToTop: _fabPointsToTop,
                onTap: _onPathScrollFabTap,
                bottom: 16,
                right: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelSectionData {
  const _LevelSectionData({
    required this.title,
    required this.nodes,
    this.progressNodeIndex,
  });

  final String title;
  final List<LessonPathNode> nodes;
  final int? progressNodeIndex;
}

class _LessonHeader extends StatelessWidget {
  const _LessonHeader({required this.text});

  final Translations text;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLocale>(
      valueListenable: AppLocaleSync.localeChanges,
      builder: (context, locale, _) {
        return ValueListenableBuilder<AppUser?>(
          valueListenable: SessionStore.userListenable,
          builder: (context, user, _) {
            final effective = user ?? SessionStore.currentUser;
            final name = AuthService.displayNameOf(effective);
            final avatarUrl = effective?.avatarUrl?.trim() ?? '';

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(21, 12, 21, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFB6BBC4),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => MainShell.goToProfile(context),
                        child: Semantics(
                          button: true,
                          label: text.lessonPage.profile,
                          child: UserAvatar(
                            size: 43,
                            avatarUrl: avatarUrl,
                            displayName: name,
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
                          child: LanguageFlag.badge(
                            locale.languageCode,
                            size: 21,
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
          },
        );
      },
    );
  }
}

/// Tek seviye: başlık + kendi path’i (A1 / A2 / … birbirine bağlı değil).
class _LevelPathSection extends StatelessWidget {
  const _LevelPathSection({
    required this.title,
    required this.nodes,
    this.progressNodeIndex,
    this.progressAnchorKey,
  });

  final String title;
  final List<LessonPathNode> nodes;
  final int? progressNodeIndex;
  final GlobalKey? progressAnchorKey;

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
        LessonPathView(
          nodes: nodes,
          progressNodeIndex: progressNodeIndex,
          progressAnchorKey: progressAnchorKey,
        ),
      ],
    );
  }
}
