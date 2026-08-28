import 'package:flutter/foundation.dart';

import 'notification_inbox_store.dart';

/// Ana ekran bildirim rozeti için okunmamış sayısı.
abstract final class NotificationsUnreadStore {
  static final unreadCount = ValueNotifier<int>(0);

  static Future<void> refresh() async {
    try {
      final count = await NotificationInboxStore.unreadCount();
      unreadCount.value = count.clamp(0, 99);
    } catch (_) {
      unreadCount.value = 0;
    }
  }

  static void setCount(int value) {
    unreadCount.value = value.clamp(0, 99);
  }
}
