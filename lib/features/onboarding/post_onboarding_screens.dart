import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/app_user.dart';
import '../../core/auth/auth_service.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../shell/main_shell.dart';
import 'onboarding_draft.dart';
import 'language_setup_screens.dart';

export 'building_account_screen.dart';

/// Preview chat X / süre bitimi → hemen Auth'a geç, paywall üstte açılsın.
///
/// Eski sıra: önce `presentPaywall` await → paywall takılırsa deneme sohbeti
/// hiç kapanmıyordu (QA: "X close does nothing").
Future<void> presentOnboardingPaywallThenAuth(
  BuildContext context,
  OnboardingDraft draft,
) async {
  if (!context.mounted) return;

  // Önce sohbeti kapat — X anında tepki versin (await yok).
  Navigator.of(context, rootNavigator: true).pushReplacement(
    MaterialPageRoute<void>(
      builder: (_) => AuthScreen(draft: draft),
    ),
  );

  final hasKey = AppEnv.revenueCatIosPublicKey.isNotEmpty ||
      AppEnv.revenueCatAndroidPublicKey.isNotEmpty;
  if (!hasKey) return;
  try {
    await RevenueCatUI.presentPaywall(displayCloseButton: true)
        .timeout(const Duration(seconds: 20));
  } catch (_) {}
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    required this.draft,
    this.existingAccount = false,
  });

  final OnboardingDraft draft;

  /// true: Giriş Yap — tamamlanmış hesapta ana sayfaya.
  final bool existingAccount;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _busy = false;

  /// Apple sadece iOS'ta; Android'de Google + Guest.
  bool get _showAppleSignIn => !kIsWeb && Platform.isIOS;

  void _enterApp(AppUser user) {
    final serverDone = user.onboarding?.goal != null &&
        user.onboarding!.goal!.trim().isNotEmpty;
    // Splash'ten giriş: sunucu kaydı. Onboarding sonrası auth: draft dolu olabilir.
    final draftDone = (widget.draft.goal ?? '').trim().isNotEmpty;
    final onboardingDone = serverDone || (!widget.existingAccount && draftDone);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => onboardingDone
            ? const MainShell()
            : LanguageSetupScreen(draft: widget.draft),
      ),
    );
  }

  /// Onboarding'de seçilen pratik başlangıç saatini günlük hatırlatmaya yazar.
  Future<void> _persistReminderFromDraft() async {
    if (widget.existingAccount || !widget.draft.practiceWindowSet) return;
    try {
      await AuthService.updateDailyReminder(
        enabled: true,
        hour: widget.draft.reminderHour,
        minute: widget.draft.reminderMinute,
      );
    } catch (_) {}
  }

  void _showApiError(ApiException err) {
    final detail = err.debugDetail;
    final text = kDebugMode && detail != null && detail.isNotEmpty
        ? '${err.message}\n$detail'
        : err.message;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _continueAsGuest() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final user = await AuthService.signInAsGuest(widget.draft);
      await _persistReminderFromDraft();
      if (!mounted) return;
      _enterApp(user);
    } on ApiException catch (err) {
      if (!mounted) return;
      _showApiError(err);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not sign in as guest')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _continueWithGoogle() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final user = await AuthService.signInWithGoogle(widget.draft);
      await _persistReminderFromDraft();
      if (!mounted) return;
      _enterApp(user);
    } on ApiException catch (err) {
      if (!mounted) return;
      _showApiError(err);
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google sign-in failed: $err')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _continueWithApple() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final user = await AuthService.signInWithApple(widget.draft);
      await _persistReminderFromDraft();
      if (!mounted) return;
      _enterApp(user);
    } on ApiException catch (err) {
      if (!mounted) return;
      _showApiError(err);
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Apple sign-in failed: $err')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final screenW = MediaQuery.sizeOf(context).width;
    // login_hero.png 512×580 — tam genişlikte contain
    final heroH = screenW * (580 / 512);
    const cardOverlap = 20.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: heroH,
              child: Image.asset(
                'assets/images/auth/login_hero.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                gaplessPlayback: true,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: heroH - cardOverlap,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      20,
                      16,
                      10 + bottomInset,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          text.auth.title,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.ink,
                            fontSize: 32,
                            height: 36 / 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          text.auth.body,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.ink.withValues(alpha: .50),
                            fontSize: 16,
                            height: 20 / 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_showAppleSignIn) ...[
                          _SocialAuthButton(
                            label: text.auth.continueApple,
                            background: const Color(0xFF2D2D2D),
                            foreground: Colors.white,
                            iconAsset: 'assets/images/auth/apple.svg',
                            iconWidth: 20,
                            iconHeight: 24,
                            tintIcon: false,
                            shadowColor: const Color(0xFF0A0A0A),
                            onPressed: _busy ? null : _continueWithApple,
                          ),
                          const SizedBox(height: 10),
                        ],
                        _SocialAuthButton(
                          label: text.auth.continueGoogle,
                          background: Colors.white,
                          foreground: AppColors.ink,
                          iconAsset: 'assets/images/auth/google_icon.png',
                          iconWidth: 20,
                          iconHeight: 20,
                          shadowColor: const Color(0xFFD1D1D1),
                          borderColor: const Color(0xFFD1D1D1),
                          onPressed: _busy ? null : _continueWithGoogle,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 18,
                          child: _AuthOrDivider(label: text.auth.or),
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: TextButton(
                            onPressed: _busy ? null : _continueAsGuest,
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  AppColors.ink.withValues(alpha: .65),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                            ),
                            child: _busy
                                ? SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.ink
                                          .withValues(alpha: .65),
                                    ),
                                  )
                                : Text(
                                    text.auth.continueGuest,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: AppColors.ink
                                          .withValues(alpha: .65),
                                      fontSize: 14,
                                      height: 18 / 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthOrDivider extends StatelessWidget {
  const _AuthOrDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final lineColor = AppColors.ink.withValues(alpha: .10);
    final textColor = AppColors.ink.withValues(alpha: .30);

    return Row(
      children: [
        Expanded(
          child: Container(height: 1, color: lineColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: textColor,
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 1, color: lineColor),
        ),
      ],
    );
  }
}

class _SocialAuthButton extends StatelessWidget {
  const _SocialAuthButton({
    required this.label,
    required this.background,
    required this.foreground,
    required this.iconAsset,
    required this.onPressed,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.tintIcon = true,
    this.borderColor,
    this.shadowColor,
  });

  final String label;
  final Color background;
  final Color foreground;
  final String iconAsset;
  final VoidCallback? onPressed;
  final double iconWidth;
  final double iconHeight;
  final bool tintIcon;
  final Color? borderColor;
  final Color? shadowColor;

  static const _iconSlotW = 20.0;
  static const _iconSlotH = 24.0;

  @override
  Widget build(BuildContext context) {
    final Widget icon;
    if (iconAsset.endsWith('.png')) {
      icon = Image.asset(
        iconAsset,
        width: iconWidth,
        height: iconHeight,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.none,
        isAntiAlias: false,
      );
    } else {
      icon = SvgPicture.asset(
        iconAsset,
        width: iconWidth,
        height: iconHeight,
        fit: BoxFit.contain,
        colorFilter: tintIcon && foreground == Colors.white
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : null,
      );
    }

    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _iconSlotW,
            height: _iconSlotH,
            child: Center(child: icon),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: foreground,
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    final radius = BorderRadius.circular(10);
    final shadow = shadowColor;

    return SizedBox(
      height: 48,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (shadow != null)
            Positioned(
              left: 0,
              right: 0,
              top: 4,
              height: 48,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: shadow,
                  borderRadius: radius,
                ),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 48,
            child: Material(
              color: background,
              borderRadius: radius,
              child: InkWell(
                onTap: onPressed,
                borderRadius: radius,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: borderColor == null
                        ? null
                        : Border.all(color: borderColor!),
                  ),
                  child: Center(child: content),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
