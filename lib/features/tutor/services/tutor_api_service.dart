import '../../../core/auth/api_client.dart';
import '../../../core/rive/tutor_rive_paths.dart';

class TutorDto {
  const TutorDto({
    required this.id,
    required this.slug,
    required this.nameKey,
    required this.tagKeys,
    this.voiceId,
    this.imageCdnUrl,
    this.riveCdnUrl,
    this.localImagePath,
    this.localRivePath,
    this.flagAssetPath,
    this.theme,
    this.sortOrder = 0,
  });

  final String id;
  final String slug;
  final String nameKey;
  final List<String> tagKeys;
  final String? voiceId;
  final String? imageCdnUrl;
  final String? riveCdnUrl;
  final String? localImagePath;
  final String? localRivePath;
  final String? flagAssetPath;
  final TutorThemeDto? theme;
  final int sortOrder;

  factory TutorDto.fromJson(Map<String, dynamic> json) {
    final tags = json['tagKeys'];
    return TutorDto(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      nameKey: json['nameKey'] as String? ?? json['slug'] as String? ?? '',
      tagKeys: tags is List
          ? tags.map((e) => e.toString()).toList()
          : const <String>[],
      voiceId: json['voiceId'] as String?,
      imageCdnUrl: json['imageCdnUrl'] as String?,
      riveCdnUrl: json['riveCdnUrl'] as String?,
      localImagePath: json['localImagePath'] as String?,
      localRivePath: json['localRivePath'] as String?,
      flagAssetPath: json['flagAssetPath'] as String?,
      theme: json['theme'] is Map<String, dynamic>
          ? TutorThemeDto.fromJson(json['theme'] as Map<String, dynamic>)
          : null,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );
  }

  /// Prefer bundled asset (instant, reliable in TestFlight). CDN when local missing.
  String? get imagePath {
    if (localImagePath != null && localImagePath!.trim().isNotEmpty) {
      return localImagePath;
    }
    if (imageCdnUrl != null && imageCdnUrl!.trim().isNotEmpty) {
      return imageCdnUrl;
    }
    return null;
  }

  /// Prefer CDN .riv (production); local bundle yedek.
  String? get rivePath {
    if (riveCdnUrl != null && riveCdnUrl!.trim().isNotEmpty) {
      return riveCdnUrl!.trim();
    }
    final local = TutorRivePaths.normalize(localRivePath);
    if (local != null) return local;
    return null;
  }

  /// Bundle path — CDN fail olursa client yedek olarak kullanır.
  String? get bundledRivePath => TutorRivePaths.normalize(localRivePath);

  /// CDN URL when available (prefetch / remote-only tutors).
  String? get remoteRiveUrl =>
      (riveCdnUrl != null && riveCdnUrl!.trim().isNotEmpty) ? riveCdnUrl!.trim() : null;
}

class TutorThemeDto {
  const TutorThemeDto({
    required this.gradientStart,
    required this.gradientEnd,
    required this.buttonColor,
    required this.buttonForeground,
  });

  final String gradientStart;
  final String gradientEnd;
  final String buttonColor;
  final String buttonForeground;

  factory TutorThemeDto.fromJson(Map<String, dynamic> json) {
    return TutorThemeDto(
      gradientStart: json['gradientStart'] as String? ?? '#2D46FF',
      gradientEnd: json['gradientEnd'] as String? ?? '#000088',
      buttonColor: json['buttonColor'] as String? ?? '#2D46FF',
      buttonForeground: json['buttonForeground'] as String? ?? '#FFFFFF',
    );
  }
}

abstract final class TutorApiService {
  static Future<List<TutorDto>> fetchTutors() async {
    final json = await ApiClient.get('/tutors');
    final list = json['tutors'];
    if (list is! List) return const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(TutorDto.fromJson)
        .toList();
  }
}
