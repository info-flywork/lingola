import '../../core/auth/api_client.dart';

class RolePlayScenarioDto {
  const RolePlayScenarioDto({
    required this.id,
    required this.titleKey,
    required this.imageAsset,
    required this.minutes,
    required this.levelKey,
    this.sectionKey,
    this.progressPercent = 0,
    this.elapsedSeconds = 0,
    this.sessionId,
    this.completed = false,
    this.sortOrder = 0,
  });

  final String id;
  final String titleKey;
  final String imageAsset;
  final String? sectionKey;
  final int minutes;
  final String levelKey;
  final double progressPercent;
  final int elapsedSeconds;
  final String? sessionId;
  final bool completed;
  final int sortOrder;

  factory RolePlayScenarioDto.fromJson(Map<String, dynamic> json) {
    return RolePlayScenarioDto(
      id: json['id'] as String? ?? '',
      titleKey: json['titleKey'] as String? ?? json['id'] as String? ?? '',
      imageAsset: json['imageAsset'] as String? ?? '',
      sectionKey: json['sectionKey'] as String?,
      minutes: (json['minutes'] as num?)?.toInt() ?? 8,
      levelKey: json['levelKey'] as String? ?? 'beginner',
      progressPercent: (json['progressPercent'] as num?)?.toDouble() ?? 0,
      elapsedSeconds: (json['elapsedSeconds'] as num?)?.toInt() ?? 0,
      sessionId: json['sessionId'] as String?,
      completed: json['completed'] == true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );
  }
}

class RolePlayProgressDto {
  const RolePlayProgressDto({
    required this.scenarioId,
    required this.elapsedSeconds,
    required this.progressPercent,
    this.sessionId,
    this.completed = false,
  });

  final String scenarioId;
  final int elapsedSeconds;
  final double progressPercent;
  final String? sessionId;
  final bool completed;

  factory RolePlayProgressDto.fromJson(Map<String, dynamic> json) {
    return RolePlayProgressDto(
      scenarioId: json['scenarioId'] as String? ?? '',
      elapsedSeconds: (json['elapsedSeconds'] as num?)?.toInt() ?? 0,
      progressPercent: (json['progressPercent'] as num?)?.toDouble() ?? 0,
      sessionId: json['sessionId'] as String?,
      completed: json['completed'] == true,
    );
  }
}

abstract final class RolePlayApiService {
  static Future<List<RolePlayScenarioDto>> fetchScenarios() async {
    final json = await ApiClient.get('/roleplay/scenarios', auth: true);
    final list = json['scenarios'];
    if (list is! List) return const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(RolePlayScenarioDto.fromJson)
        .toList();
  }

  static Future<RolePlayProgressDto> saveProgress({
    required String scenarioId,
    required int additionalSeconds,
    String? sessionId,
  }) async {
    final json = await ApiClient.post(
      '/roleplay/scenarios/$scenarioId/progress',
      auth: true,
      body: {
        'additionalSeconds': additionalSeconds,
        if (sessionId != null && sessionId.isNotEmpty) 'sessionId': sessionId,
      },
    );
    final progress = json['progress'];
    if (progress is! Map<String, dynamic>) {
      throw ApiException('Invalid role play progress response');
    }
    return RolePlayProgressDto.fromJson(progress);
  }
}
