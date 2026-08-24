import '../../core/auth/api_client.dart';

class NotificationDto {
  const NotificationDto({
    required this.id,
    required this.type,
    required this.titleKey,
    required this.bodyKey,
    required this.iconAsset,
    required this.iconBg,
    this.titleColor,
    this.readAt,
  });

  final String id;
  final String type;
  final String titleKey;
  final String bodyKey;
  final String iconAsset;
  final String iconBg;
  final String? titleColor;
  final String? readAt;

  factory NotificationDto.fromJson(Map<String, dynamic> json) {
    return NotificationDto(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      titleKey: json['titleKey'] as String? ?? '',
      bodyKey: json['bodyKey'] as String? ?? '',
      iconAsset: json['iconAsset'] as String? ?? '',
      iconBg: json['iconBg'] as String? ?? '',
      titleColor: json['titleColor'] as String?,
      readAt: json['readAt'] as String?,
    );
  }
}

abstract final class NotificationsApiService {
  static Future<List<NotificationDto>> fetchNotifications({
    int limit = 20,
  }) async {
    final json = await ApiClient.get('/notifications?limit=$limit', auth: true);
    final list = json['notifications'];
    if (list is! List) return const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(NotificationDto.fromJson)
        .toList();
  }

  static Future<void> markRead(String id) async {
    await ApiClient.patch('/notifications/$id/read', auth: true);
  }
}
