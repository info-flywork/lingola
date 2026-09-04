import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/rive/rive_preload_service.dart';
import '../../../i18n/strings.g.dart';
import '../../lesson/lesson_api_service.dart';
import '../../lesson/lesson_curriculum.dart';
import '../../tutor/services/tutor_api_service.dart';

enum HomePathNodeStatus { locked, active, completed, unlocked }

class HomeContinueData {
  const HomeContinueData({
    required this.lessonLabel,
    required this.elapsedMinutes,
    required this.totalMinutes,
    required this.progressFactor,
    required this.slug,
    this.remainingMinutes,
    this.tutorId,
    this.tutorSlug,
  });

  final String lessonLabel;
  final int elapsedMinutes;
  final int totalMinutes;
  final double progressFactor;
  final String slug;
  final int? remainingMinutes;
  final String? tutorId;
  final String? tutorSlug;
}

class HomePathPreviewNode {
  const HomePathPreviewNode({
    required this.asset,
    required this.label,
    required this.labelColor,
    required this.showStars,
    required this.status,
    required this.slug,
    required this.a1Index,
    required this.globalIndex,
    this.hasNotes = false,
    this.tutorId,
    this.tutorSlug,
    this.cefrLevel,
  });

  final String asset;
  final String label;
  final int labelColor; // ARGB via Color.value on caller side
  final bool showStars;
  final HomePathNodeStatus status;
  final String slug;
  /// Seviye içi index (slug / i18n fallback).
  final int a1Index;
  /// Müfredattaki global index (premium gate).
  final int globalIndex;
  final bool hasNotes;
  final String? tutorId;
  final String? tutorSlug;
  final String? cefrLevel;

  bool get canOpen =>
      status != HomePathNodeStatus.locked && slug.isNotEmpty;
}

class HomePathLevelSection {
  const HomePathLevelSection({
    required this.levelId,
    required this.title,
    required this.nodes,
  });

  final String levelId;
  final String title;
  final List<HomePathPreviewNode> nodes;
}

class HomeTutorCarouselItem {
  const HomeTutorCarouselItem({
    required this.name,
    required this.image,
    required this.tags,
    this.flagAsset,
    this.slug,
    this.riveAsset,
    this.riveCdnUrl,
    this.voiceId,
  });

  final String name;
  final String image;
  final List<String> tags;
  final String? flagAsset;
  final String? slug;
  final String? riveAsset;
  final String? riveCdnUrl;
  final String? voiceId;
}

class HomeRemoteData {
  const HomeRemoteData({
    this.continueData,
    this.pathSections = const [],
    this.tutors = const [],
  });

  final HomeContinueData? continueData;
  final List<HomePathLevelSection> pathSections;
  final List<HomeTutorCarouselItem> tutors;
}

abstract final class HomeDataService {
  static const _estimatedLessonMinutes = 15;
  static HomeRemoteData? _cached;

  /// Son başarılı home yanıtı — açılışta path anında görünsün.
  static HomeRemoteData? get cached => _cached;

  static Future<HomeRemoteData?> fetch() async {
    try {
      final results = await Future.wait([
        LessonApiService.fetchPath(),
        TutorApiService.fetchTutors(),
      ]);
      final path = results[0] as LessonPathDto;
      final tutors = results[1] as List<TutorDto>;
      final text = AppText.current;

      RivePreloadService.preloadMany([
        AppAssets.tutorLingolaRivCdn,
        ...tutors.map((t) => t.remoteRiveUrl),
      ]);

      final data = HomeRemoteData(
        continueData: _buildContinue(path, text),
        pathSections: _buildPathSections(path, text),
        tutors: _buildTutors(tutors, text),
      );
      _cached = data;
      return data;
    } catch (_) {
      return null;
    }
  }

  /// Home learning path — tüm CEFR seviyeleri (A1 → C2), Lesson sekmesiyle aynı.
  static List<HomePathLevelSection> _buildPathSections(
    LessonPathDto path,
    Translations text,
  ) {
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
    final remoteByLevel = {
      for (final level in path.levels) level.id: level.lessons,
    };

    var global = 0;
    final sections = <HomePathLevelSection>[];
    for (final level in LessonCurriculum.levels) {
      final labels = lessonLists[level.id] ?? const <String>[];
      final icons = level.iconAssets;
      final remoteLessons = remoteByLevel[level.id] ?? const <LessonNodeDto>[];
      final count = labels.isNotEmpty
          ? labels.length
          : [
              remoteLessons.length,
              icons.length,
            ].reduce((a, b) => a > b ? a : b);

      final nodes = <HomePathPreviewNode>[
        for (var i = 0; i < count; i++)
          () {
            final lesson = i < remoteLessons.length ? remoteLessons[i] : null;
            final status = _nodeStatus(lesson);
            final label = _lessonDisplayTitle(lesson, text, level.id, i);
            final labelColor = switch (status) {
              HomePathNodeStatus.completed => 0xFF2D46FF,
              HomePathNodeStatus.active => 0xFF2D46FF,
              HomePathNodeStatus.unlocked => 0xFF8A8A8A,
              HomePathNodeStatus.locked => 0xFF8A8A8A,
            };
            final slug = lesson != null && lesson.slug.isNotEmpty
                ? lesson.slug
                : (LessonCurriculum.slugAt(level.id, i) ?? '');
            final icon = icons.isEmpty
                ? ''
                : icons[i < icons.length ? i : icons.length - 1];
            final node = HomePathPreviewNode(
              asset: icon,
              label: label,
              labelColor: labelColor,
              showStars: status == HomePathNodeStatus.completed ||
                  status == HomePathNodeStatus.active,
              status: status,
              slug: slug,
              a1Index: i,
              globalIndex: global,
              hasNotes: lesson?.hasNotes ?? false,
              tutorId: lesson?.tutorId,
              tutorSlug: lesson?.tutorSlug,
              cefrLevel: lesson?.cefrLevel ?? level.id,
            );
            global += 1;
            return node;
          }(),
      ];

      sections.add(
        HomePathLevelSection(
          levelId: level.id,
          title: titles[level.id] ?? level.id.toUpperCase(),
          nodes: nodes,
        ),
      );
    }
    return sections;
  }

  static HomeContinueData? _buildContinue(
    LessonPathDto path,
    Translations text,
  ) {
    final allLessons = path.levels.expand((l) => l.lessons).toList();
    if (allLessons.isEmpty) return null;

    LessonNodeDto? current;
    final currentSlug = path.currentLessonSlug;
    if (currentSlug != null && currentSlug.isNotEmpty) {
      current = allLessons.where((l) => l.slug == currentSlug).firstOrNull;
    }

    // En son etkileşim: elapsed > 0 veya startedAt olanlar
    current ??= () {
      final engaged = allLessons
          .where(
            (l) =>
                !l.isCompleted &&
                (l.elapsedSeconds > 0 ||
                    (l.startedAt != null && l.startedAt!.isNotEmpty)),
          )
          .toList()
        ..sort((a, b) {
          final ta = DateTime.tryParse(a.startedAt ?? '')?.millisecondsSinceEpoch ?? 0;
          final tb = DateTime.tryParse(b.startedAt ?? '')?.millisecondsSinceEpoch ?? 0;
          if (tb != ta) return tb.compareTo(ta);
          return b.elapsedSeconds.compareTo(a.elapsedSeconds);
        });
      return engaged.isEmpty ? null : engaged.first;
    }();

    current ??= allLessons.where((l) => l.isAvailable).firstOrNull;
    current ??= allLessons.where((l) => l.isUnlocked).firstOrNull;
    current ??= allLessons.first;

    final located = LessonCurriculum.locateSlug(current.slug);
    final levelId =
        (located?.levelId ?? current.cefrLevel ?? 'a1').toLowerCase();
    final fallbackIndex = located?.index ?? 0;
    final title = _lessonDisplayTitle(current, text, levelId, fallbackIndex);

    final elapsedSeconds = current.elapsedSeconds;
    final elapsed = current.elapsedMinutes;
    final remaining = current.remainingMinutes;
    final progressFactor = (elapsedSeconds / (15 * 60)).clamp(0.0, 1.0);

    return HomeContinueData(
      lessonLabel: title,
      elapsedMinutes: elapsed,
      remainingMinutes: remaining,
      totalMinutes: _estimatedLessonMinutes,
      progressFactor: progressFactor,
      slug: current.slug,
      tutorId: current.tutorId,
      tutorSlug: current.tutorSlug,
    );
  }

  static HomePathNodeStatus _nodeStatus(LessonNodeDto? lesson) {
    if (lesson == null) return HomePathNodeStatus.locked;
    if (lesson.isCompleted) return HomePathNodeStatus.completed;
    if (lesson.isAvailable) {
      final engaged = lesson.elapsedSeconds > 0 ||
          (lesson.startedAt != null && lesson.startedAt!.isNotEmpty);
      if (!engaged) return HomePathNodeStatus.unlocked;
      return HomePathNodeStatus.active;
    }
    if (lesson.isUnlocked) return HomePathNodeStatus.unlocked;
    return HomePathNodeStatus.locked;
  }

  /// TR/EN için API başlığı; diğer UI dilleri için i18n (ja, de, …).
  static String _lessonDisplayTitle(
    LessonNodeDto? lesson,
    Translations text,
    String levelId,
    int fallbackIndex,
  ) {
    final locale = LocaleSettings.currentLocale;
    if (lesson != null) {
      if (locale == AppLocale.tr) {
        final tr = lesson.titleTr?.trim();
        if (tr != null && tr.isNotEmpty) return tr;
        final en = lesson.titleEn?.trim();
        if (en != null && en.isNotEmpty) return en;
      } else if (locale == AppLocale.en) {
        final en = lesson.titleEn?.trim();
        if (en != null && en.isNotEmpty) return en;
        final tr = lesson.titleTr?.trim();
        if (tr != null && tr.isNotEmpty) return tr;
      }
    }
    return _i18nPathLabel(levelId, fallbackIndex, text);
  }

  static String _i18nPathLabel(String levelId, int index, Translations text) {
    final levels = text.lessonPage.levels;
    final list = switch (levelId) {
      'a2' => levels.a2.lessons,
      'b1' => levels.b1.lessons,
      'b2' => levels.b2.lessons,
      'c1' => levels.c1.lessons,
      'c2' => levels.c2.lessons,
      _ => levels.a1.lessons,
    };
    if (index >= 0 && index < list.length) return list[index];
    final home = text.home;
    return switch (index) {
      0 => home.greetings,
      1 => home.introductions,
      2 => home.jobs,
      3 => home.favoriteRoom,
      _ => home.dailyRoutine,
    };
  }

  static List<HomeTutorCarouselItem> _buildTutors(
    List<TutorDto> remote,
    Translations text,
  ) {
    if (remote.isEmpty) return const [];
    final sorted = [...remote]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return sorted
        .take(3)
        .map((dto) => _mapTutor(dto, text))
        .whereType<HomeTutorCarouselItem>()
        .toList();
  }

  static HomeTutorCarouselItem? _mapTutor(TutorDto dto, Translations text) {
    final image = dto.imagePath;
    if (image == null || image.isEmpty) return null;
    final home = text.home;
    final tutorPage = text.tutorPage;
    final tagLabels = dto.tagKeys
        .take(3)
        .map((key) => _tagLabel(tutorPage.tags, key))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tagLabels.isNotEmpty) {
      tagLabels.add(home.tagMore);
    }
    return HomeTutorCarouselItem(
      name: _tutorName(tutorPage.tutors, dto.nameKey, dto.slug),
      image: image,
      flagAsset: dto.slug.toLowerCase() == 'lingola'
          ? null
          : (dto.flagAssetPath?.trim().isNotEmpty == true
              ? dto.flagAssetPath
              : AppAssets.flagForTutorSlug(dto.slug)),
      tags: tagLabels,
      slug: dto.slug,
      riveAsset: dto.remoteRiveUrl ?? AppAssets.tutorRiveCdn(dto.slug),
      riveCdnUrl: dto.remoteRiveUrl ?? AppAssets.tutorRiveCdn(dto.slug),
      voiceId: dto.voiceId,
    );
  }

  static String _tutorName(dynamic tutors, String key, String slug) {
    final value = switch (key) {
      'lingola' => tutors.lingola,
      'mei' => tutors.mei,
      'kate' => tutors.kate,
      'elena' => tutors.elena,
      'kenji' => tutors.kenji,
      'freya' => tutors.freya,
      'camila' => tutors.camila,
      'marco' => tutors.marco,
      'julian' => tutors.julian,
      'santa' => tutors.santa,
      'zephyrion' => tutors.zephyrion,
      'vaelen' => tutors.vaelen,
      'elrion' => tutors.elrion,
      'ukrath' => tutors.ukrath,
      _ => null,
    };
    if (value is String && value.isNotEmpty) return value;
    if (slug.isNotEmpty) {
      return slug[0].toUpperCase() + slug.substring(1);
    }
    return key;
  }

  static String _tagLabel(dynamic tags, String key) {
    final value = switch (key) {
      'adaptive' => tags.adaptive,
      'calm' => tags.calm,
      'patient' => tags.patient,
      'methodical' => tags.methodical,
      'encouraging' => tags.encouraging,
      'analytic' => tags.analytic,
      'curious' => tags.curious,
      'organized' => tags.organized,
      'attentive' => tags.attentive,
      'relaxed' => tags.relaxed,
      _ => null,
    };
    return value is String ? value : key;
  }

  static List<HomeTutorCarouselItem> fallbackTutors(Translations text) {
    final home = text.home;
    return [
      HomeTutorCarouselItem(
        name: home.tutorLingola,
        image: 'assets/images/tutor_lingola.png',
        tags: [
          home.tagAdaptive,
          home.tagCalm,
          home.tagPatient,
          home.tagMore,
        ],
        slug: 'lingola',
        riveAsset: AppAssets.tutorLingolaRivCdn,
        riveCdnUrl: AppAssets.tutorLingolaRivCdn,
      ),
      HomeTutorCarouselItem(
        name: home.tutorMei,
        image: 'assets/images/tutor_mei.png',
        flagAsset: 'assets/images/home/flag_cn.svg',
        tags: [
          home.tagPatient,
          home.tagMethodical,
          home.tagEncouraging,
          home.tagMore,
        ],
      ),
      HomeTutorCarouselItem(
        name: home.tutorKate,
        image: 'assets/images/tutor_kate.png',
        tags: [
          home.tagAdaptive,
          home.tagPatient,
          home.tagMore,
        ],
      ),
    ];
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}
