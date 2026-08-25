import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/auth/session_store.dart';
import '../core/constants/app_text.dart';
import '../core/notifications/lingola_notification_service.dart';
import '../core/notifications/notification_lifecycle.dart';
import '../core/theme/app_theme.dart';
import '../features/onboarding/onboarding_flow.dart';
import '../i18n/strings.g.dart';
import '../widgets/keyboard_dismiss_scope.dart';

class LingolaApp extends StatefulWidget {
  const LingolaApp({super.key});

  @override
  State<LingolaApp> createState() => _LingolaAppState();
}

class _LingolaAppState extends State<LingolaApp> {
  final _notificationLifecycle = NotificationLifecycleObserver();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(_notificationLifecycle);
    unawaited(_bootstrapNotifications());
  }

  Future<void> _bootstrapNotifications() async {
    await LingolaNotificationService.init();
    final user = await SessionStore.loadCachedUser();
    if (user?.notificationsEnabled == true) {
      await LingolaNotificationService.syncEnabled(true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_notificationLifecycle);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppText.current.app.name,
          theme: AppTheme.light,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          builder: (context, child) {
            if (child == null) return const SizedBox.shrink();
            return KeyboardDismissScope(child: child);
          },
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
