import '../../core/constants/app_text.dart';
import '../../i18n/strings.g.dart';
import 'lesson_api_service.dart';
import 'lesson_curriculum.dart';

/// Calling / chat üstündeki "Lesson N : Title" rozeti.
abstract final class LessonBadge {
  static Future<String> resolveCurrent() async {
    try {
      final path = await LessonApiService.fetchPath();
      return fromPath(path);
    } catch (_) {
      return fallback();
    }
  }

  static String fromPath(LessonPathDto path, {String? preferSlug}) {
    final lesson = _resolveLesson(path, preferSlug: preferSlug);
    if (lesson == null) return fallback();
    return forLesson(lesson);
  }

  static String forLesson(LessonNodeDto lesson) {
    final located = LessonCurriculum.locateSlug(lesson.slug);
    final index = located?.index ?? 0;
    final title = _displayTitle(lesson, index, located?.levelId ?? 'a1');
    return format(number: index + 1, title: title);
  }

  static String fromSlug({
    required String slug,
    String? fallbackTitle,
  }) {
    final located = LessonCurriculum.locateSlug(slug);
    final index = located?.index ?? 0;
    final title = fallbackTitle?.trim();
    if (title != null && title.isNotEmpty) {
      return format(number: index + 1, title: title);
    }
    return format(
      number: index + 1,
      title: _i18nTitleForLevelIndex(located?.levelId ?? 'a1', index),
    );
  }

  static String format({required int number, required String title}) {
    return AppText.current.tutorPage.calling.lessonBadgeFormat(
      number: number,
      title: title,
    );
  }

  static String fallback() => AppText.current.tutorPage.calling.lessonBadge;

  static LessonNodeDto? _resolveLesson(
    LessonPathDto path, {
    String? preferSlug,
  }) {
    final allLessons = path.levels.expand((l) => l.lessons).toList();
    if (allLessons.isEmpty) return null;

    if (preferSlug != null && preferSlug.isNotEmpty) {
      final hit = allLessons.where((l) => l.slug == preferSlug).firstOrNull;
      if (hit != null) return hit;
    }

    final currentSlug = path.currentLessonSlug;
    if (currentSlug != null && currentSlug.isNotEmpty) {
      final hit = allLessons.where((l) => l.slug == currentSlug).firstOrNull;
      if (hit != null) return hit;
    }

    final engaged = allLessons
        .where(
          (l) =>
              !l.isCompleted &&
              (l.elapsedSeconds > 0 ||
                  (l.startedAt != null && l.startedAt!.isNotEmpty)),
        )
        .toList()
      ..sort((a, b) {
        final ta =
            DateTime.tryParse(a.startedAt ?? '')?.millisecondsSinceEpoch ?? 0;
        final tb =
            DateTime.tryParse(b.startedAt ?? '')?.millisecondsSinceEpoch ?? 0;
        if (tb != ta) return tb.compareTo(ta);
        return b.elapsedSeconds.compareTo(a.elapsedSeconds);
      });
    if (engaged.isNotEmpty) return engaged.first;

    return allLessons.where((l) => l.isAvailable).firstOrNull ??
        allLessons.where((l) => l.isUnlocked).firstOrNull ??
        allLessons.first;
  }

  static String _displayTitle(
    LessonNodeDto lesson,
    int indexInLevel,
    String levelId,
  ) {
    final locale = LocaleSettings.currentLocale;
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
    } else {
      final en = lesson.titleEn?.trim();
      if (en != null && en.isNotEmpty) return en;
      final tr = lesson.titleTr?.trim();
      if (tr != null && tr.isNotEmpty) return tr;
    }
    return _i18nTitleForLevelIndex(levelId, indexInLevel);
  }

  static String _i18nTitleForLevelIndex(String levelId, int index) {
    final lessons = AppText.current.lessonPage.levels;
    final list = switch (levelId) {
      'a2' => lessons.a2.lessons,
      'b1' => lessons.b1.lessons,
      'b2' => lessons.b2.lessons,
      'c1' => lessons.c1.lessons,
      'c2' => lessons.c2.lessons,
      _ => lessons.a1.lessons,
    };
    if (index >= 0 && index < list.length) return list[index];
    return list.isNotEmpty ? list.first : 'Lesson';
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}
