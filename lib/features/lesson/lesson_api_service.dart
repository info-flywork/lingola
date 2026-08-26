import '../../core/auth/api_client.dart';
import '../../core/rive/tutor_rive_paths.dart';

class LessonPathDto {
  const LessonPathDto({
    required this.levels,
    this.currentLessonSlug,
  });

  final List<LessonLevelDto> levels;
  final String? currentLessonSlug;

  factory LessonPathDto.fromJson(Map<String, dynamic> json) {
    final list = json['levels'];
    return LessonPathDto(
      currentLessonSlug: json['currentLessonSlug'] as String?,
      levels: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map(LessonLevelDto.fromJson)
              .toList()
          : const [],
    );
  }
}

class LessonLevelDto {
  const LessonLevelDto({
    required this.id,
    required this.cefrLevel,
    required this.lessons,
  });

  final String id;
  final String cefrLevel;
  final List<LessonNodeDto> lessons;

  factory LessonLevelDto.fromJson(Map<String, dynamic> json) {
    final list = json['lessons'];
    return LessonLevelDto(
      id: json['id'] as String? ?? '',
      cefrLevel: json['cefrLevel'] as String? ?? '',
      lessons: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map(LessonNodeDto.fromJson)
              .toList()
          : const [],
    );
  }
}

class LessonNodeDto {
  const LessonNodeDto({
    required this.slug,
    required this.status,
    this.needsPractice = false,
    this.hasNotes = false,
    this.tutorId,
    this.tutorSlug,
    this.tutorNameKey,
    this.chatSessionId,
    this.titleEn,
    this.titleTr,
    this.startedAt,
    this.elapsedSeconds = 0,
    this.remainingSeconds = 15 * 60,
  });

  final String slug;
  final String status;
  final bool needsPractice;
  final bool hasNotes;
  final String? tutorId;
  final String? tutorSlug;
  final String? tutorNameKey;
  final String? chatSessionId;
  final String? titleEn;
  final String? titleTr;
  final String? startedAt;
  final int elapsedSeconds;
  final int remainingSeconds;

  bool get isLocked => status == 'locked';
  bool get isAvailable => status == 'available';
  bool get isCompleted => status == 'completed';

  int get elapsedMinutes => (elapsedSeconds / 60).floor().clamp(0, 15);
  int get remainingMinutes => (remainingSeconds / 60).ceil().clamp(0, 15);

  factory LessonNodeDto.fromJson(Map<String, dynamic> json) {
    final elapsed = (json['elapsedSeconds'] as num?)?.toInt() ?? 0;
    final remaining = (json['remainingSeconds'] as num?)?.toInt() ??
        (15 * 60 - elapsed).clamp(0, 15 * 60);
    return LessonNodeDto(
      slug: json['slug'] as String? ?? '',
      status: json['status'] as String? ?? 'locked',
      needsPractice: json['needsPractice'] == true,
      hasNotes: json['hasNotes'] == true,
      tutorId: json['tutorId'] as String?,
      tutorSlug: json['tutorSlug'] as String?,
      tutorNameKey: json['tutorNameKey'] as String?,
      chatSessionId: json['chatSessionId'] as String?,
      titleEn: json['titleEn'] as String?,
      titleTr: json['titleTr'] as String?,
      startedAt: json['startedAt'] as String?,
      elapsedSeconds: elapsed.clamp(0, 15 * 60),
      remainingSeconds: remaining.clamp(0, 15 * 60),
    );
  }
}

class LessonStartDto {
  const LessonStartDto({
    required this.slug,
    required this.sessionId,
    required this.openingMessage,
    required this.systemPrompt,
    required this.kind,
    this.tutorId,
    this.tutorSlug,
    this.tutorNameKey,
    this.tutorImage,
    this.tutorVoiceId,
    this.tutorRive,
    this.titleEn,
    this.lessonElapsedSeconds = 0,
    this.remainingSeconds = 15 * 60,
  });

  final String slug;
  final String sessionId;
  final String openingMessage;
  final String systemPrompt;
  final String kind;
  final String? tutorId;
  final String? tutorSlug;
  final String? tutorNameKey;
  final String? tutorImage;
  final String? tutorVoiceId;
  final String? tutorRive;
  final String? titleEn;
  final int lessonElapsedSeconds;
  final int remainingSeconds;

  factory LessonStartDto.fromJson(Map<String, dynamic> json) {
    final lesson = json['lesson'];
    final session = json['session'];
    final tutor = json['tutor'];
    final lessonMap = lesson is Map<String, dynamic> ? lesson : const <String, dynamic>{};
    final sessionMap = session is Map<String, dynamic> ? session : const <String, dynamic>{};
    final tutorMap = tutor is Map<String, dynamic> ? tutor : const <String, dynamic>{};
    final elapsed = (json['elapsedSeconds'] as num?)?.toInt() ??
        (lessonMap['elapsedSeconds'] as num?)?.toInt() ??
        0;
    final remaining = (json['remainingSeconds'] as num?)?.toInt() ??
        (lessonMap['remainingSeconds'] as num?)?.toInt() ??
        (15 * 60 - elapsed);
    return LessonStartDto(
      slug: lessonMap['slug'] as String? ?? '',
      titleEn: lessonMap['titleEn'] as String?,
      sessionId: sessionMap['id'] as String? ?? '',
      openingMessage: json['openingMessage'] as String? ?? '',
      systemPrompt: json['systemPrompt'] as String? ?? '',
      kind: json['kind'] as String? ?? 'lesson',
      tutorId: tutorMap['id'] as String?,
      tutorSlug: tutorMap['slug'] as String?,
      tutorNameKey: tutorMap['nameKey'] as String?,
      tutorImage: (tutorMap['localImagePath'] as String?)?.isNotEmpty == true
          ? tutorMap['localImagePath'] as String
          : tutorMap['imageCdnUrl'] as String?,
      tutorVoiceId: tutorMap['voiceId'] as String?,
      tutorRive: () {
        final cdn = tutorMap['riveCdnUrl'] as String?;
        if (cdn != null && cdn.trim().isNotEmpty) return cdn.trim();
        final local = TutorRivePaths.normalize(
          tutorMap['localRivePath'] as String?,
        );
        if (local != null) return local;
        return null;
      }(),
      lessonElapsedSeconds: elapsed.clamp(0, 15 * 60),
      remainingSeconds: remaining.clamp(0, 15 * 60),
    );
  }
}

class LessonNotesDto {
  const LessonNotesDto({
    required this.slug,
    required this.spokenSummary,
    required this.notes,
    required this.needsPractice,
    this.score = 0,
    this.previousScore,
    this.bestScore,
    this.participation = 'silent',
    this.evaluation,
    this.userTurns = 0,
    this.attemptCount = 1,
    this.titleEn,
    this.titleTr,
    this.cefrLevel,
    this.chatSessionId,
    this.tutorId,
    this.tutorSlug,
    this.tutorNameKey,
    this.tutorImage,
  });

  final String slug;
  final String spokenSummary;
  final String notes;
  final bool needsPractice;
  final int score;
  final int? previousScore;
  final int? bestScore;
  final String participation;
  final String? evaluation;
  final int userTurns;
  final int attemptCount;
  final String? titleEn;
  final String? titleTr;
  final String? cefrLevel;
  final String? chatSessionId;
  final String? tutorId;
  final String? tutorSlug;
  final String? tutorNameKey;
  final String? tutorImage;

  bool get shouldRetake =>
      participation == 'silent' || participation == 'passive' || needsPractice;

  factory LessonNotesDto.fromJson(Map<String, dynamic> json) {
    final lesson = json['lesson'];
    final lessonMap = lesson is Map<String, dynamic> ? lesson : const <String, dynamic>{};
    final tutor = json['tutor'];
    final tutorMap = tutor is Map<String, dynamic> ? tutor : null;
    return LessonNotesDto(
      slug: lessonMap['slug'] as String? ?? '',
      titleEn: lessonMap['titleEn'] as String?,
      titleTr: lessonMap['titleTr'] as String?,
      cefrLevel: lessonMap['cefrLevel'] as String?,
      spokenSummary: json['spokenSummary'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      needsPractice: json['needsPractice'] == true,
      score: (json['score'] as num?)?.toInt() ?? 0,
      previousScore: (json['previousScore'] as num?)?.toInt(),
      bestScore: (json['bestScore'] as num?)?.toInt(),
      participation: json['participation'] as String? ?? 'silent',
      evaluation: json['evaluation'] as String?,
      userTurns: (json['userTurns'] as num?)?.toInt() ?? 0,
      attemptCount: (json['attemptCount'] as num?)?.toInt() ?? 1,
      chatSessionId: json['chatSessionId'] as String?,
      tutorId: tutorMap?['id'] as String?,
      tutorSlug: tutorMap?['slug'] as String?,
      tutorNameKey: tutorMap?['nameKey'] as String?,
      tutorImage: (tutorMap?['imageCdnUrl'] as String?)?.isNotEmpty == true
          ? tutorMap!['imageCdnUrl'] as String
          : tutorMap?['localImagePath'] as String?,
    );
  }
}

abstract final class LessonApiService {
  static Future<LessonPathDto> fetchPath() async {
    final json = await ApiClient.get('/lessons/path', auth: true);
    return LessonPathDto.fromJson(json);
  }

  static Future<LessonStartDto> start({
    required String slug,
    String? tutorId,
    String? tutorSlug,
    String kind = 'lesson',
  }) async {
    final json = await ApiClient.post(
      '/lessons/$slug/start',
      auth: true,
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (tutorSlug != null && tutorSlug.isNotEmpty) 'tutorSlug': tutorSlug,
        'kind': kind,
      },
    );
    return LessonStartDto.fromJson(json);
  }

  static Future<LessonNotesDto> complete({
    required String slug,
    String? tutorId,
    String? sessionId,
    String kind = 'lesson',
    List<Map<String, String>> transcript = const [],
    int? addElapsedSeconds,
    int? elapsedSeconds,
  }) async {
    final json = await ApiClient.post(
      '/lessons/$slug/complete',
      auth: true,
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (sessionId != null && sessionId.isNotEmpty) 'sessionId': sessionId,
        'kind': kind,
        'transcript': transcript,
        if (addElapsedSeconds != null) 'addElapsedSeconds': addElapsedSeconds,
        if (elapsedSeconds != null) 'elapsedSeconds': elapsedSeconds,
      },
    );
    return LessonNotesDto.fromJson(json);
  }

  static Future<LessonNodeDto> saveProgress({
    required String slug,
    String? tutorId,
    String? sessionId,
    List<Map<String, String>> transcript = const [],
    int? addElapsedSeconds,
    int? elapsedSeconds,
  }) async {
    final json = await ApiClient.post(
      '/lessons/$slug/progress',
      auth: true,
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (sessionId != null && sessionId.isNotEmpty) 'sessionId': sessionId,
        'transcript': transcript,
        if (addElapsedSeconds != null) 'addElapsedSeconds': addElapsedSeconds,
        if (elapsedSeconds != null) 'elapsedSeconds': elapsedSeconds,
      },
    );
    final lesson = json['lesson'];
    if (lesson is Map<String, dynamic>) {
      return LessonNodeDto.fromJson(lesson);
    }
    return LessonNodeDto(slug: slug, status: 'available');
  }

  static Future<LessonNotesDto> fetchNotes(String slug) async {
    final json = await ApiClient.get('/lessons/$slug/notes', auth: true);
    return LessonNotesDto.fromJson(json);
  }

  static Future<void> deleteNotes(String slug) async {
    await ApiClient.delete('/lessons/$slug/notes', auth: true);
  }
}
