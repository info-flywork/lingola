class NotificationInboxItem {
  const NotificationInboxItem({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.iconAsset,
    required this.iconBg,
    required this.deliveredAt,
    this.titleColor,
    this.readAt,
  });

  final String id;
  final String type;
  final String title;
  final String body;
  final String iconAsset;
  final String iconBg;
  final String? titleColor;
  final DateTime deliveredAt;
  final DateTime? readAt;

  bool get isUnread => readAt == null;

  NotificationInboxItem copyWith({
    DateTime? readAt,
  }) {
    return NotificationInboxItem(
      id: id,
      type: type,
      title: title,
      body: body,
      iconAsset: iconAsset,
      iconBg: iconBg,
      titleColor: titleColor,
      deliveredAt: deliveredAt,
      readAt: readAt ?? this.readAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'body': body,
        'iconAsset': iconAsset,
        'iconBg': iconBg,
        'titleColor': titleColor,
        'deliveredAt': deliveredAt.millisecondsSinceEpoch,
        'readAt': readAt?.millisecondsSinceEpoch,
      };

  factory NotificationInboxItem.fromJson(Map<String, dynamic> json) {
    final readMs = (json['readAt'] as num?)?.toInt();
    return NotificationInboxItem(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? 'reminder',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      iconAsset: json['iconAsset'] as String? ?? '',
      iconBg: json['iconBg'] as String? ?? '',
      titleColor: json['titleColor'] as String?,
      deliveredAt: DateTime.fromMillisecondsSinceEpoch(
        (json['deliveredAt'] as num?)?.toInt() ??
            DateTime.now().millisecondsSinceEpoch,
      ),
      readAt: readMs == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(readMs),
    );
  }
}

class PendingNotificationRecord {
  const PendingNotificationRecord({
    required this.notificationId,
    required this.type,
    required this.title,
    required this.body,
    required this.iconAsset,
    required this.iconBg,
    required this.scheduledAt,
    this.titleColor,
  });

  final int notificationId;
  final String type;
  final String title;
  final String body;
  final String iconAsset;
  final String iconBg;
  final String? titleColor;
  final DateTime scheduledAt;

  Map<String, dynamic> toJson() => {
        'notificationId': notificationId,
        'type': type,
        'title': title,
        'body': body,
        'iconAsset': iconAsset,
        'iconBg': iconBg,
        'titleColor': titleColor,
        'scheduledAt': scheduledAt.millisecondsSinceEpoch,
      };

  factory PendingNotificationRecord.fromJson(Map<String, dynamic> json) {
    return PendingNotificationRecord(
      notificationId: (json['notificationId'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? 'reminder',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      iconAsset: json['iconAsset'] as String? ?? '',
      iconBg: json['iconBg'] as String? ?? '',
      titleColor: json['titleColor'] as String?,
      scheduledAt: DateTime.fromMillisecondsSinceEpoch(
        (json['scheduledAt'] as num?)?.toInt() ?? 0,
      ),
    );
  }

  NotificationInboxItem toInboxItem() {
    return NotificationInboxItem(
      id: '${notificationId}_${scheduledAt.millisecondsSinceEpoch}',
      type: type,
      title: title,
      body: body,
      iconAsset: iconAsset,
      iconBg: iconBg,
      titleColor: titleColor,
      deliveredAt: scheduledAt,
    );
  }
}
