import 'dart:async';

import 'package:flutter/widgets.dart';

import '../auth/session_store.dart';
import 'lingola_notification_service.dart';

/// Uygulama arka plana gidince hatırlatıcıları planlar; açılınca iptal eder.
class NotificationLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        unawaited(_onBackground());
      case AppLifecycleState.resumed:
        unawaited(_onForeground());
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> _onBackground() async {
    final user = await SessionStore.loadCachedUser();
    if (user == null || !user.notificationsEnabled) return;
    await LingolaNotificationService.rescheduleFromNow();
  }

  Future<void> _onForeground() async {
    await LingolaNotificationService.cancelAll();
  }
}
