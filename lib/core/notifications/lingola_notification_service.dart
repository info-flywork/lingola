import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../constants/app_text.dart';
import '../../features/notifications/notification_inbox_store.dart';
import 'notification_activity_store.dart';

class _ScheduledNotification {
  const _ScheduledNotification({required this.title, required this.body});

  final String title;
  final String body;
}

abstract final class LingolaNotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static final _rng = Random();
  static var _initialized = false;

  static const _channelId = 'lingola_reengagement';
  static const _eveningLessonId = 2100;
  static const _ids = <int, Duration>{
    2002: Duration(hours: 2),
    2004: Duration(hours: 4),
    2008: Duration(hours: 8),
    2024: Duration(hours: 24),
  };

  static Future<void> init() async {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    try {
      final name = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(name));
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: (response) {
        NotificationInboxStore.handleNotificationResponse(response);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    _initialized = true;
  }

  static Future<bool> requestPermission() async {
    await init();
    if (defaultTargetPlatform == TargetPlatform.android) {
      final impl = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      final ok = await impl?.requestNotificationsPermission();
      return ok ?? false;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final impl = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      final ok = await impl?.requestPermissions(alert: true, badge: true, sound: true);
      return ok ?? false;
    }
    return true;
  }

  /// Profil toggle: izin al; planlama yalnızca arka plana geçince yapılır.
  static Future<bool> syncEnabled(bool enabled) async {
    await init();
    if (!enabled) {
      await cancelAll();
      return false;
    }
    final granted = await requestPermission();
    if (!granted) {
      await cancelAll();
      return false;
    }
    return true;
  }

  static Future<void> rescheduleFromNow() async {
    await init();
    await NotificationInboxStore.flushDueDeliveries();
    await cancelAll();
    await NotificationInboxStore.replacePending([]);

    final snapshot = await NotificationActivityStore.buildSnapshot();
    final now = tz.TZDateTime.now(tz.local);

    for (final entry in _ids.entries) {
      final when = _adjustForQuietHours(now.add(entry.value));
      final content = _contentForSlot(entry.key, snapshot);
      await _schedule(
        id: entry.key,
        when: when,
        title: content.title,
        body: content.body,
      );
    }

    if (!snapshot.lessonToday) {
      var evening = tz.TZDateTime(tz.local, now.year, now.month, now.day, 19);
      if (!evening.isAfter(now)) {
        evening = tz.TZDateTime(tz.local, now.year, now.month, now.day, 21);
      }
      if (evening.isAfter(now)) {
        final content = _eveningLessonContent(snapshot);
        await _schedule(
          id: _eveningLessonId,
          when: _adjustForQuietHours(evening),
          title: content.title,
          body: content.body,
        );
      }
    }
  }

  static Future<void> cancelAll() async {
    await init();
    for (final id in _ids.keys) {
      await _plugin.cancel(id);
    }
    await _plugin.cancel(_eveningLessonId);
  }

  static String typeForId(int id) {
    return switch (id) {
      2004 || 2100 => 'lesson',
      2024 => 'streak',
      2002 || 2008 => 'practice',
      _ => 'reminder',
    };
  }

  static String iconAssetForId(int id) {
    return switch (id) {
      2024 || 2004 || 2100 => 'assets/images/notifications/icon_stories.svg',
      _ => 'assets/images/notifications/icon_translation.svg',
    };
  }

  static String iconBgForId(int id) {
    return switch (id) {
      2024 || 2004 || 2100 => '#1A34C759',
      _ => '#1A2D46FF',
    };
  }

  static _ScheduledNotification _contentForSlot(
    int id,
    NotificationActivitySnapshot snapshot,
  ) {
    final push = AppText.current.pushNotifications;

    if (id == 2004 && !snapshot.lessonToday) {
      return _ScheduledNotification(
        title: push.lessonReminderTitle,
        body: _pickFrom(push.lessonReminder),
      );
    }

    if (id == 2008 && !snapshot.quizWithin8Hours) {
      return _quizReminderContent(snapshot);
    }

    if (id == 2024 && snapshot.streakAtRisk) {
      return _ScheduledNotification(
        title: push.streakReminderTitle,
        body: push.streakReminder(streak: snapshot.currentStreak),
      );
    }

    if (id == 2002 &&
        snapshot.savedWordsCount > 0 &&
        !snapshot.quizWithin8Hours) {
      return _ScheduledNotification(
        title: push.quizReminderTitle,
        body: push.quizReminderSaved(savedCount: snapshot.savedWordsCount),
      );
    }

    final list = switch (id) {
      2002 => push.h2,
      2004 => push.h4,
      2008 => push.h8,
      2024 => push.h24,
      _ => push.h2,
    };
    return _ScheduledNotification(
      title: push.title,
      body: _pickFrom(list),
    );
  }

  static _ScheduledNotification _quizReminderContent(
    NotificationActivitySnapshot snapshot,
  ) {
    final push = AppText.current.pushNotifications;
    if (snapshot.recentWordsLearned > 0) {
      return _ScheduledNotification(
        title: push.quizReminderTitle,
        body: push.quizReminderWords(
          count: snapshot.recentWordsLearned,
          savedCount: snapshot.savedWordsCount,
        ),
      );
    }
    if (snapshot.savedWordsCount > 0) {
      return _ScheduledNotification(
        title: push.quizReminderTitle,
        body: push.quizReminderSaved(savedCount: snapshot.savedWordsCount),
      );
    }
    return _ScheduledNotification(
      title: push.quizReminderTitle,
      body: _pickFrom(push.quizReminder),
    );
  }

  static _ScheduledNotification _eveningLessonContent(
    NotificationActivitySnapshot snapshot,
  ) {
    final push = AppText.current.pushNotifications;
    if (snapshot.streakAtRisk) {
      return _ScheduledNotification(
        title: push.streakReminderTitle,
        body: push.streakReminder(streak: snapshot.currentStreak),
      );
    }
    return _ScheduledNotification(
      title: push.eveningLessonTitle,
      body: _pickFrom(push.eveningLesson),
    );
  }

  static String _pickFrom(List<String> list) {
    if (list.isEmpty) return AppText.current.pushNotifications.title;
    return list[_rng.nextInt(list.length)];
  }

  static tz.TZDateTime _adjustForQuietHours(tz.TZDateTime scheduled) {
    final hour = scheduled.hour;
    if (hour >= 22 || hour < 8) {
      var adjusted = tz.TZDateTime(
        tz.local,
        scheduled.year,
        scheduled.month,
        scheduled.day,
        9,
      );
      if (hour >= 22) {
        adjusted = adjusted.add(const Duration(days: 1));
      }
      return adjusted;
    }
    return scheduled;
  }

  static Future<void> _schedule({
    required int id,
    required tz.TZDateTime when,
    required String title,
    required String body,
  }) async {
    final push = AppText.current.pushNotifications;
    final type = typeForId(id);
    final iconAsset = iconAssetForId(id);
    final iconBg = iconBgForId(id);
    final payload = jsonEncode({
      'notificationId': id,
      'title': title,
      'body': body,
      'type': type,
      'iconAsset': iconAsset,
      'iconBg': iconBg,
      'scheduledAt': when.millisecondsSinceEpoch,
    });

    final androidDetails = AndroidNotificationDetails(
      _channelId,
      push.title,
      channelDescription: push.title,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      when,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: payload,
    );

    await NotificationInboxStore.trackPending(
      notificationId: id,
      type: type,
      title: title,
      body: body,
      iconAsset: iconAsset,
      iconBg: iconBg,
      scheduledAt: when,
    );
  }
}
