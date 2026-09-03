import '../../core/auth/api_client.dart';

class RolePlayScenarioDto {
  const RolePlayScenarioDto({
    required this.id,
    required this.titleKey,
    required this.imageAsset,
    required this.minutes,
    required this.levelKey,
    this.title,
    this.screenplay,
    this.openingMessage,
    this.sectionKey,
    this.isCustom = false,
    this.progressPercent = 0,
    this.elapsedSeconds = 0,
    this.sessionId,
    this.completed = false,
    this.sortOrder = 0,
  });

  final String id;
  final String titleKey;
  final String? title;
  final String? screenplay;
  final String? openingMessage;
  final String imageAsset;
  final String? sectionKey;
  final int minutes;
  final String levelKey;
  final bool isCustom;
  final double progressPercent;
  final int elapsedSeconds;
  final String? sessionId;
  final bool completed;
  final int sortOrder;

  factory RolePlayScenarioDto.fromJson(Map<String, dynamic> json) {
    return RolePlayScenarioDto(
      id: json['id'] as String? ?? '',
      titleKey: json['titleKey'] as String? ?? json['id'] as String? ?? '',
      title: json['title'] as String?,
      screenplay: json['screenplay'] as String?,
      openingMessage: json['openingMessage'] as String?,
      imageAsset: json['imageAsset'] as String? ?? '',
      sectionKey: json['sectionKey'] as String?,
      minutes: (json['minutes'] as num?)?.toInt() ?? 8,
      levelKey: json['levelKey'] as String? ?? 'beginner',
      isCustom: json['isCustom'] == true,
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

  static Future<RolePlayScenarioDto> generateCustomScenario({
    required String scenario,
    required String tutorRole,
    required String userRole,
    String? extraInfo,
    String? nativeLanguageCode,
    String? levelKey,
  }) async {
    final json = await ApiClient.post(
      '/roleplay/scenarios/custom/generate',
      auth: true,
      receiveTimeout: const Duration(seconds: 120),
      body: {
        'scenario': scenario,
        'tutorRole': tutorRole,
        'userRole': userRole,
        if (extraInfo != null && extraInfo.isNotEmpty) 'extraInfo': extraInfo,
        if (nativeLanguageCode != null && nativeLanguageCode.isNotEmpty)
          'nativeLanguageCode': nativeLanguageCode,
        if (levelKey != null && levelKey.isNotEmpty) 'levelKey': levelKey,
      },
    );
    final created = json['scenario'];
    if (created is! Map<String, dynamic>) {
      throw ApiException('Invalid custom role play response');
    }
    return RolePlayScenarioDto.fromJson(created);
  }

  static Future<void> deleteCustomScenario(String scenarioId) async {
    final id = scenarioId.trim();
    if (id.isEmpty) throw ApiException('scenarioId is required');
    await ApiClient.delete('/roleplay/scenarios/$id', auth: true);
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
