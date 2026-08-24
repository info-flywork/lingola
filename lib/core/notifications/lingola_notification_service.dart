import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../constants/app_text.dart';
abstract final class LingolaNotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static final _rng = Random();
  static var _initialized = false;

  static const _channelId = 'lingola_reengagement';
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

  /// Profil toggle ve uygulama açılışı ile senkronize et.
  static Future<void> syncEnabled(bool enabled) async {
    await init();
    if (!enabled) {
      await cancelAll();
      return;
    }
    final granted = await requestPermission();
    if (!granted) {
      await cancelAll();
      return;
    }
    await rescheduleFromNow();
  }

  static Future<void> rescheduleFromNow() async {
    await init();
    await cancelAll();
    final now = tz.TZDateTime.now(tz.local);
    for (final entry in _ids.entries) {
      final when = _adjustForQuietHours(now.add(entry.value));
      final body = _pickBody(entry.key);
      await _schedule(id: entry.key, when: when, body: body);
    }
  }

  static Future<void> cancelAll() async {
    await init();
    for (final id in _ids.keys) {
      await _plugin.cancel(id);
    }
  }

  static String _pickBody(int id) {
    final push = AppText.current.pushNotifications;
    final list = switch (id) {
      2002 => push.h2,
      2004 => push.h4,
      2008 => push.h8,
      2024 => push.h24,
      _ => push.h2,
    };
    if (list.isEmpty) return push.title;
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
    required String body,
  }) async {
    final push = AppText.current.pushNotifications;
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
      push.title,
      body,
      when,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
