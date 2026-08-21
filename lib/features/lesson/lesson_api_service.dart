import '../../core/auth/api_client.dart';

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
    this.chatSessionId,
  });

  final String slug;
  final String status;
  final bool needsPractice;
  final bool hasNotes;
  final String? tutorId;
  final String? chatSessionId;

  bool get isLocked => status == 'locked';
  bool get isAvailable => status == 'available';
  bool get isCompleted => status == 'completed';

  factory LessonNodeDto.fromJson(Map<String, dynamic> json) {
    return LessonNodeDto(
      slug: json['slug'] as String? ?? '',
      status: json['status'] as String? ?? 'locked',
      needsPractice: json['needsPractice'] == true,
      hasNotes: json['hasNotes'] == true,
      tutorId: json['tutorId'] as String?,
      chatSessionId: json['chatSessionId'] as String?,
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

  factory LessonStartDto.fromJson(Map<String, dynamic> json) {
    final lesson = json['lesson'];
    final session = json['session'];
    final tutor = json['tutor'];
    final lessonMap = lesson is Map<String, dynamic> ? lesson : const <String, dynamic>{};
    final sessionMap = session is Map<String, dynamic> ? session : const <String, dynamic>{};
    final tutorMap = tutor is Map<String, dynamic> ? tutor : const <String, dynamic>{};
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
      tutorImage: (tutorMap['imageCdnUrl'] as String?)?.isNotEmpty == true
          ? tutorMap['imageCdnUrl'] as String
          : tutorMap['localImagePath'] as String?,
      tutorVoiceId: tutorMap['voiceId'] as String?,
      tutorRive: (tutorMap['riveCdnUrl'] as String?)?.isNotEmpty == true
          ? tutorMap['riveCdnUrl'] as String
          : tutorMap['localRivePath'] as String?,
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
  }) async {
    final json = await ApiClient.post(
      '/lessons/$slug/complete',
      auth: true,
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (sessionId != null && sessionId.isNotEmpty) 'sessionId': sessionId,
        'kind': kind,
        'transcript': transcript,
      },
    );
    return LessonNotesDto.fromJson(json);
  }

  static Future<LessonNotesDto> fetchNotes(String slug) async {
    final json = await ApiClient.get('/lessons/$slug/notes', auth: true);
    return LessonNotesDto.fromJson(json);
  }

  static Future<void> deleteNotes(String slug) async {
    await ApiClient.delete('/lessons/$slug/notes', auth: true);
  }
}
