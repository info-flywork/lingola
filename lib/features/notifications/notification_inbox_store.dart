import 'dart:async' show unawaited;
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/auth/session_store.dart';
import 'notification_inbox_item.dart';
import 'notifications_api_service.dart';

/// Yerel push bildirimlerinin uygulama içi geçmişi (hesap başına, backend ile senkron).
abstract final class NotificationInboxStore {
  static const _guestScope = 'guest';

  static String _scopeKey(String? userId) {
    final id = userId?.trim();
    if (id == null || id.isEmpty) return _guestScope;
    return id;
  }

  static String _deliveredKey(String scope) => 'notif_inbox_delivered_$scope';
  static String _pendingKey(String scope) => 'notif_inbox_pending_$scope';
  static String _deletedKey(String scope) => 'notif_inbox_deleted_$scope';

  static Future<String> _scope() async {
    final user = await SessionStore.loadCachedUser();
    return _scopeKey(user?.id);
  }

  static Future<bool> _hasAuth() async {
    final token = await SessionStore.getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> replacePending(List<PendingNotificationRecord> records) async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final encoded = records.map((e) => e.toJson()).toList();
    await prefs.setString(_pendingKey(scope), jsonEncode(encoded));
  }

  static Future<void> trackPending({
    required int notificationId,
    required String type,
    required String title,
    required String body,
    required String iconAsset,
    required String iconBg,
    required DateTime scheduledAt,
    String? titleColor,
  }) async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final existing = _decodePending(prefs.getString(_pendingKey(scope)));
    existing.removeWhere((e) => e.notificationId == notificationId);
    existing.add(
      PendingNotificationRecord(
        notificationId: notificationId,
        type: type,
        title: title,
        body: body,
        iconAsset: iconAsset,
        iconBg: iconBg,
        titleColor: titleColor,
        scheduledAt: scheduledAt,
      ),
    );
    await prefs.setString(
      _pendingKey(scope),
      jsonEncode(existing.map((e) => e.toJson()).toList()),
    );
  }

  static Future<void> recordDelivered(NotificationInboxItem item) async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final deleted = _decodeDeleted(prefs.getString(_deletedKey(scope)));
    if (deleted.contains(item.id)) return;

    final list = _decodeDelivered(prefs.getString(_deliveredKey(scope)));
    list.removeWhere((e) => e.id == item.id);
    list.insert(0, item);
    final trimmed = list.take(50).toList();
    await prefs.setString(
      _deliveredKey(scope),
      jsonEncode(trimmed.map((e) => e.toJson()).toList()),
    );
    unawaited(_syncItemToBackend(item));
  }

  static Future<void> flushDueDeliveries() async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final pending = _decodePending(prefs.getString(_pendingKey(scope)));
    if (pending.isEmpty) return;

    final now = DateTime.now();
    final due = pending.where((p) => !p.scheduledAt.isAfter(now)).toList();
    if (due.isEmpty) return;

    final remaining =
        pending.where((p) => p.scheduledAt.isAfter(now)).toList();
    for (final p in due) {
      await recordDelivered(p.toInboxItem());
    }
    await prefs.setString(
      _pendingKey(scope),
      jsonEncode(remaining.map((e) => e.toJson()).toList()),
    );
  }

  static Future<List<NotificationInboxItem>> loadDelivered() async {
    await flushDueDeliveries();

    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final local = _decodeDelivered(prefs.getString(_deliveredKey(scope)));
    final deleted = _decodeDeleted(prefs.getString(_deletedKey(scope)));

    if (await _hasAuth()) {
      try {
        final payload = await NotificationsApiService.fetchNotifications();
        final remote = payload.notifications.map((e) => e.toInboxItem()).toList();
        final remoteIds = remote.map((e) => e.id).toSet();
        final missing = local
            .where((e) => !remoteIds.contains(e.id) && !deleted.contains(e.id))
            .toList();
        if (missing.isNotEmpty) {
          unawaited(NotificationsApiService.syncBatch(missing).catchError((_) {}));
        }

        final merged = _mergeItems(remote, local)
            .where((e) => !deleted.contains(e.id))
            .toList();
        await _cacheDelivered(merged);
        final pruned = deleted.where(remoteIds.contains).toSet();
        await prefs.setString(_deletedKey(scope), jsonEncode(pruned.toList()));
        return merged;
      } catch (_) {
        // Ağ hatasında yerel önbelleğe düş.
      }
    }

    return local.where((e) => !deleted.contains(e.id)).toList();
  }

  static Future<int> unreadCount() async {
    final items = await loadDelivered();
    return items.where((e) => e.isUnread).length;
  }

  static Future<void> markAllReadLocal() async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final list = _decodeDelivered(prefs.getString(_deliveredKey(scope)))
        .map((e) => e.isUnread ? e.copyWith(readAt: now) : e)
        .toList();
    await _cacheDelivered(list);
  }

  static Future<void> remove(String id) async {
    if (id.isEmpty) return;

    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    final list = _decodeDelivered(prefs.getString(_deliveredKey(scope)))
      ..removeWhere((e) => e.id == id);
    await prefs.setString(
      _deliveredKey(scope),
      jsonEncode(list.map((e) => e.toJson()).toList()),
    );

    final deleted = _decodeDeleted(prefs.getString(_deletedKey(scope)))..add(id);
    await prefs.setString(_deletedKey(scope), jsonEncode(deleted.toList()));

    if (await _hasAuth()) {
      unawaited(NotificationsApiService.dismiss(id).catchError((_) {}));
    }
  }

  static Future<void> handleNotificationResponse(
    NotificationResponse response,
  ) async {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;

    try {
      final map = jsonDecode(payload) as Map<String, dynamic>;
      final notificationId = (map['notificationId'] as num?)?.toInt() ?? 0;
      final title = map['title'] as String? ?? '';
      final body = map['body'] as String? ?? '';
      final type = map['type'] as String? ?? 'reminder';
      final iconAsset = map['iconAsset'] as String? ?? '';
      final iconBg = map['iconBg'] as String? ?? '';
      final titleColor = map['titleColor'] as String?;
      final scheduledAtMs = (map['scheduledAt'] as num?)?.toInt();
      final deliveredAt = scheduledAtMs != null
          ? DateTime.fromMillisecondsSinceEpoch(scheduledAtMs)
          : DateTime.now();

      await recordDelivered(
        NotificationInboxItem(
          id: '${notificationId}_${deliveredAt.millisecondsSinceEpoch}',
          type: type,
          title: title,
          body: body,
          iconAsset: iconAsset,
          iconBg: iconBg,
          titleColor: titleColor,
          deliveredAt: deliveredAt,
        ),
      );
    } catch (_) {}
  }

  static Future<void> _cacheDelivered(List<NotificationInboxItem> items) async {
    final scope = await _scope();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _deliveredKey(scope),
      jsonEncode(items.take(50).map((e) => e.toJson()).toList()),
    );
  }

  static Future<void> _syncItemToBackend(NotificationInboxItem item) async {
    if (!await _hasAuth()) return;
    try {
      await NotificationsApiService.record(item);
    } catch (_) {}
  }

  static List<NotificationInboxItem> _mergeItems(
    List<NotificationInboxItem> primary,
    List<NotificationInboxItem> secondary,
  ) {
    final byId = <String, NotificationInboxItem>{};
    for (final item in [...primary, ...secondary]) {
      final existing = byId[item.id];
      if (existing == null) {
        byId[item.id] = item;
        continue;
      }
      byId[item.id] = NotificationInboxItem(
        id: item.id,
        type: item.type.isNotEmpty ? item.type : existing.type,
        title: item.title.isNotEmpty ? item.title : existing.title,
        body: item.body.isNotEmpty ? item.body : existing.body,
        iconAsset:
            item.iconAsset.isNotEmpty ? item.iconAsset : existing.iconAsset,
        iconBg: item.iconBg.isNotEmpty ? item.iconBg : existing.iconBg,
        titleColor: item.titleColor ?? existing.titleColor,
        deliveredAt: item.deliveredAt,
        readAt: existing.readAt ?? item.readAt,
      );
    }
    final merged = byId.values.toList()
      ..sort((a, b) => b.deliveredAt.compareTo(a.deliveredAt));
    return merged.take(50).toList();
  }

  static List<NotificationInboxItem> _decodeDelivered(String? raw) {
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .whereType<Map<String, dynamic>>()
          .map(NotificationInboxItem.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static List<PendingNotificationRecord> _decodePending(String? raw) {
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .whereType<Map<String, dynamic>>()
          .map(PendingNotificationRecord.fromJson)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Set<String> _decodeDeleted(String? raw) {
    if (raw == null || raw.isEmpty) return {};
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list.whereType<String>().where((e) => e.isNotEmpty).toSet();
    } catch (_) {
      return {};
    }
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {}
