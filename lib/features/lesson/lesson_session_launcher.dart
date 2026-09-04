import 'lesson_screen.dart';

/// Home / diğer giriş noktalarından ders oturumu — Lesson sekmesi olmadan.
///
/// [LessonScreen] arka planda mount edilmiş olmalı (`MainShell` Offstage host).
abstract final class LessonSessionLauncher {
  static Future<void> openLesson({
    required String slug,
    required String label,
    required String status,
    required int a1Index,
    bool hasNotes = false,
    String? tutorId,
    String? tutorSlug,
    String? cefrLevel,
    String? userCefrMax,
  }) {
    return LessonScreen.openLessonFromHome(
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

  static Future<void> resumeLesson({
    required String slug,
    required String label,
    String? tutorId,
    String? tutorSlug,
    String? forceTutorSlug,
  }) {
    return LessonScreen.resumeFromHome(
      slug: slug,
      label: label,
      tutorId: tutorId,
      tutorSlug: tutorSlug,
      forceTutorSlug: forceTutorSlug,
    );
  }
}
