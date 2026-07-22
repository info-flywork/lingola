import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/constants/app_text.dart';
import '../core/theme/app_theme.dart';
import '../features/onboarding/onboarding_flow.dart';
import '../i18n/strings.g.dart';

class LingolaApp extends StatelessWidget {
  const LingolaApp({super.key});

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
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
