import '../../core/auth/api_client.dart';

import 'notification_inbox_item.dart';

class NotificationDto {
  const NotificationDto({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.iconAsset,
    required this.iconBg,
    this.titleColor,
    this.deliveredAt,
    this.readAt,
  });

  final String id;
  final String type;
  final String title;
  final String body;
  final String iconAsset;
  final String iconBg;
  final String? titleColor;
  final DateTime? deliveredAt;
  final String? readAt;

  bool get isUnread => readAt == null || readAt!.isEmpty;

  factory NotificationDto.fromJson(Map<String, dynamic> json) {
    DateTime? delivered;
    final deliveredRaw = json['deliveredAt'];
    if (deliveredRaw is String && deliveredRaw.isNotEmpty) {
      delivered = DateTime.tryParse(deliveredRaw);
    }

    return NotificationDto(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? 'reminder',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      iconAsset: json['iconAsset'] as String? ?? '',
      iconBg: json['iconBg'] as String? ?? '',
      titleColor: json['titleColor'] as String?,
      deliveredAt: delivered,
      readAt: json['readAt'] as String?,
    );
  }

  NotificationInboxItem toInboxItem() {
    DateTime? read;
    if (readAt != null && readAt!.isNotEmpty) {
      read = DateTime.tryParse(readAt!);
    }
    return NotificationInboxItem(
      id: id,
      type: type,
      title: title,
      body: body,
      iconAsset: iconAsset,
      iconBg: iconBg,
      titleColor: titleColor,
      deliveredAt: deliveredAt ?? DateTime.now(),
      readAt: read,
    );
  }
}

class NotificationsPayload {
  const NotificationsPayload({
    required this.notifications,
    required this.unreadCount,
  });

  final List<NotificationDto> notifications;
  final int unreadCount;
}

abstract final class NotificationsApiService {
  static Future<NotificationsPayload> fetchNotifications({
    int limit = 50,
  }) async {
    final json =
        await ApiClient.get('/notifications?limit=$limit', auth: true);
    final list = json['notifications'];
    final unread = json['unreadCount'];
    if (list is! List) {
      return const NotificationsPayload(notifications: [], unreadCount: 0);
    }
    final notifications = list
        .whereType<Map<String, dynamic>>()
        .map(NotificationDto.fromJson)
        .toList();
    return NotificationsPayload(
      notifications: notifications,
      unreadCount: unread is num
          ? unread.toInt()
          : notifications.where((n) => n.isUnread).length,
    );
  }

  static Future<void> record(NotificationInboxItem item) async {
    await ApiClient.post(
      '/notifications',
      auth: true,
      body: _toApiBody(item),
    );
  }

  static Future<void> syncBatch(List<NotificationInboxItem> items) async {
    if (items.isEmpty) return;
    await ApiClient.post(
      '/notifications/sync',
      auth: true,
      body: {
        'notifications': items.map(_toApiBody).toList(),
      },
    );
  }

  static Future<void> markRead(String id) async {
    await ApiClient.patch('/notifications/$id/read', auth: true);
  }

  static Future<void> markAllRead() async {
    await ApiClient.post('/notifications/read-all', auth: true);
  }

  static Future<void> dismiss(String id) async {
    await ApiClient.delete('/notifications/$id', auth: true);
  }

  static Map<String, dynamic> _toApiBody(NotificationInboxItem item) {
    return {
      'clientKey': item.id,
      'id': item.id,
      'notificationType': item.type,
      'type': item.type,
      'title': item.title,
      'body': item.body,
      'iconAsset': item.iconAsset,
      'iconBg': item.iconBg,
      'titleColor': item.titleColor,
      'deliveredAtIso': item.deliveredAt.toUtc().toIso8601String(),
    };
  }
}
