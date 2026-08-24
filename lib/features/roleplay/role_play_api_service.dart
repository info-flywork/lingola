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
    this.sortOrder = 0,
  });

  final String id;
  final String titleKey;
  final String imageAsset;
  final String? sectionKey;
  final int minutes;
  final String levelKey;
  final double progressPercent;
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
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
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
}
