import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppColors {
  static const primary = Color(0xFF2D46FF);
  static const darkShadow = Color(0xFF0015B4);
  static const secondary = Color(0xFFA1A4B7);
  static const ink = Color(0xFF000000);
  static const surface = Color(0xFFF5F6FA);
  static const border = Color(0xFFEAEAEA);
  static const navInactive = Color(0xFFCAD5E2);
  static const quizOrange = Color(0xFFFF5623);
  /// Figma More Features — IMMERSIVE label (butonla aynı turuncu).
  static const immersiveLabel = Color(0xFFFF5623);
  static const progressTrack = Color(0xFFC5C7D4);
  static const onboardingSky = Color(0xFF63B1D9);
  static const onboardingBlue = Color(0xFF2D85FF);
  static const success = Color(0xFF34C759);
  static const disabledSurface = Color(0xFFFCFCFC);
  static const disabledText = Color(0xFFB4B4B4);
  static const secondaryButtonShadow = Color(0xFFE2E2E2);
  static const secondaryButtonText = Color(0xFF8F8F8F);
  static const premiumGradientStart = Color(0xFF000845);
  static const premiumGradientEnd = Color(0xFF0014AB);

  static Color get primaryTint05 => primary.withValues(alpha: .05);
  static Color get primaryTint10 => primary.withValues(alpha: .10);
  static Color get border10 => Colors.black.withValues(alpha: .10);
}

abstract final class AppTextStyles {
  static const onboardingTitle = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 28,
    height: 34 / 28,
    fontWeight: FontWeight.w600,
  );

  static const onboardingBody = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.28,
  );

  static const primaryButton = TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const languagePickerTitle = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 24,
    height: 30 / 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.48,
  );

  static const languageName = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static const homeGreeting = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );

  static const homeTitle = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w600,
  );

  static const sectionTitle = TextStyle(
    color: AppColors.ink,
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w600,
  );

  static const sectionSubtitle = TextStyle(
    color: AppColors.secondary,
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );

  static const linkPill = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 28 / 12,
    fontWeight: FontWeight.w500,
  );

  static const navLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    height: 1,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.2,
  );
}

abstract final class AppTheme {
  static ThemeData get light {
    final textTheme = ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    );
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: textTheme,
    );
  }
}
