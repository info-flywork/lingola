import 'dart:async';
import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/auth_service.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../legal/legal_document_screen.dart';
import '../shell/main_shell.dart';
import 'onboarding_draft.dart';
import 'preview_chat_screen.dart';

class AccountCreatingScreen extends StatefulWidget {
  const AccountCreatingScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<AccountCreatingScreen> createState() => _AccountCreatingScreenState();
}

class _AccountCreatingScreenState extends State<AccountCreatingScreen> {
  int _doneCount = 1;
  double _progress = .2;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (!mounted) return;
      setState(() {
        if (_doneCount < 4) {
          _doneCount += 1;
          _progress = (_doneCount / 4).clamp(0.2, 1);
        } else {
          _progress = 1;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _openPreviewChat() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => PreviewChatScreen(draft: widget.draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final steps = [
      text.accountCreating.stepContent,
      text.accountCreating.stepDialogues,
      text.accountCreating.stepLessons,
      text.accountCreating.stepPlan,
    ];
    final percent = (_progress * 100).round();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primary,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          fit: StackFit.expand,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final topInset = MediaQuery.paddingOf(context).top;
                final fullHeight = MediaQuery.sizeOf(context).height;
                final contentHeight = fullHeight - topInset;

                final robotHeight = (contentHeight * 0.42).clamp(
                  220.0,
                  320.0,
                );
                const cardOverlap = 40.0;
                final cardTop = robotHeight - cardOverlap;
                const colorTransitionFromCardTop =
                    34.0 + 30.0 + 16.0 + 28.0 + 10.0;
                final whiteGradientEnd =
                    ((topInset + cardTop + colorTransitionFromCardTop) /
                            fullHeight)
                        .clamp(0.44, 0.62);
                final blueGradientMid = (whiteGradientEnd + 0.14)
                    .clamp(whiteGradientEnd + 0.08, 0.88);

                return DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                        Colors.white,
                        Colors.white,
                        Color(0xFFE8F2FF),
                        AppColors.primary,
                      ],
                      stops: [
                        0,
                        whiteGradientEnd,
                        blueGradientMid,
                        1,
                      ],
                    ),
                  ),
                );
              },
            ),
            SafeArea(
              bottom: false,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bottomInset = MediaQuery.paddingOf(context).bottom;
                  final robotHeight = (constraints.maxHeight * 0.42).clamp(
                    220.0,
                    320.0,
                  );
                  const cardOverlap = 40.0;
                  final cardTop = robotHeight - cardOverlap;
                  const colorTransitionFromCardTop =
                      34.0 + 30.0 + 16.0 + 28.0 + 10.0;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: robotHeight,
                      child: const _FadedRobotHero(
                        asset: 'auth/account_robot_final.png',
                        fadeStart: 0.54,
                      ),
                    ),
                    // Figma: kart üstünden robota doğru ince blurlu beyaz ışınlar
                    Positioned(
                      top: cardTop - 52,
                      left: 0,
                      right: 0,
                      height: 108,
                      child: const IgnorePointer(
                        child: _AccountCardTopLightRays(),
                      ),
                    ),
                    Positioned(
                      top: cardTop,
                      left: 16,
                      right: 16,
                      bottom: 16 + bottomInset,
                      child: _AccountCreatingCard(
                        colorTransitionFromTop: colorTransitionFromCardTop,
                        child: LayoutBuilder(
                            builder: (context, cardConstraints) {
                              return SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: cardConstraints.maxHeight,
                                  ),
                                  child: IntrinsicHeight(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          text.accountCreating.title,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColors.ink,
                                            fontSize: 24,
                                            height: 30 / 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        for (var i = 0;
                                            i < steps.length;
                                            i++) ...[
                                          if (i > 0) const SizedBox(height: 10),
                                          _AccountStepRow(
                                            label: steps[i],
                                            done: i < _doneCount,
                                          ),
                                        ],
                                        const SizedBox(height: 18),
                                        Row(
                                          children: [
                                            Text(
                                              text.accountCreating.optimization,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: AppColors.ink,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              text.accountCreating.progress(
                                                value: percent,
                                              ),
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: AppColors.ink,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(99),
                                          child: LinearProgressIndicator(
                                            minHeight: 7,
                                            value: _progress,
                                            color: AppColors.primary,
                                            backgroundColor:
                                                const Color(0x80D9D9D9),
                                          ),
                                        ),
                                        const Spacer(),
                                        const SizedBox(height: 16),
                                        PrimaryButton(
                                          label: text.common.getStarted,
                                          onPressed: _openPreviewChat,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                  ],
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Üst kenar görünmez (robota kayar), yan/alt kenarlar belirgin mavi glow.
class _AccountCreatingCard extends StatelessWidget {
  const _AccountCreatingCard({
    required this.child,
    required this.colorTransitionFromTop,
  });

  final Widget child;
  final double colorTransitionFromTop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final transitionFrac =
            (colorTransitionFromTop / constraints.maxHeight).clamp(0.24, 0.46);
        final glowTop = (colorTransitionFromTop - 8).clamp(40.0, 200.0);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: glowTop,
              left: -4,
              right: -4,
              bottom: -2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.24),
                      blurRadius: 36,
                      offset: const Offset(0, 16),
                    ),
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.16),
                      blurRadius: 26,
                      offset: const Offset(-7, 12),
                    ),
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.16),
                      blurRadius: 26,
                      offset: const Offset(7, 12),
                    ),
                  ],
                ),
                child: const SizedBox.expand(),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0),
                          Colors.white.withValues(alpha: 0.45),
                          Colors.white.withValues(alpha: 0.88),
                          Colors.white,
                          Colors.white,
                        ],
                        stops: [
                          0.0,
                          transitionFrac * 0.35,
                          transitionFrac * 0.72,
                          transitionFrac,
                          1.0,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 34, 16, 16),
                      child: child,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: (colorTransitionFromTop * 0.55).clamp(48.0, 88.0),
                    child: IgnorePointer(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 14,
                          tileMode: TileMode.decal,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withValues(alpha: 0),
                                Colors.white.withValues(alpha: 0.4),
                                Colors.white.withValues(alpha: 0),
                              ],
                              stops: const [0.0, 0.52, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Figma: kartın üst kenarından robota doğru ince, blurlu beyaz linear ışınlar.
class _AccountCardTopLightRays extends StatelessWidget {
  const _AccountCardTopLightRays();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        // Geniş yumuşak sis / bloom (kart kenarından yukarı)
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xE6FFFFFF),
                Color(0x66FFFFFF),
                Color(0x00FFFFFF),
              ],
              stops: [0.0, 0.40, 1.0],
            ),
          ),
        ),
        // İnce ışınlar — hafif blur (keskin çizgi hissi korunsun)
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 1.6,
            sigmaY: 5.5,
            tileMode: TileMode.decal,
          ),
          child: const SizedBox.expand(
            child: CustomPaint(
              painter: _LightRaysPainter(layer: 0),
            ),
          ),
        ),
        // Daha yumuşak / geniş ikinci katman
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 4.5,
            sigmaY: 11,
            tileMode: TileMode.decal,
          ),
          child: const SizedBox.expand(
            child: CustomPaint(
              painter: _LightRaysPainter(layer: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class _LightRaysPainter extends CustomPainter {
  const _LightRaysPainter({required this.layer});

  final int layer;

  /// (xFraction, heightFraction, width, tiltRad, opacity)
  static const _sharp = <(double, double, double, double, double)>[
    (0.22, 0.42, 1.4, -0.055, 0.35),
    (0.30, 0.68, 1.2, -0.035, 0.55),
    (0.36, 0.52, 1.8, -0.02, 0.40),
    (0.42, 0.88, 1.3, -0.008, 0.70),
    (0.47, 0.95, 1.6, 0.0, 0.85),
    (0.51, 0.78, 1.2, 0.01, 0.65),
    (0.56, 0.92, 1.5, 0.018, 0.75),
    (0.62, 0.60, 1.3, 0.032, 0.48),
    (0.68, 0.74, 1.1, 0.045, 0.55),
    (0.76, 0.40, 1.5, 0.06, 0.32),
  ];

  static const _soft = <(double, double, double, double, double)>[
    (0.34, 0.55, 3.5, -0.025, 0.22),
    (0.48, 0.72, 4.0, 0.0, 0.28),
    (0.58, 0.58, 3.2, 0.028, 0.20),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rays = layer == 0 ? _sharp : _soft;
    for (final ray in rays) {
      final cx = size.width * ray.$1;
      final h = size.height * ray.$2;
      final w = ray.$3;
      final tilt = ray.$4;
      final opacity = ray.$5;

      canvas.save();
      canvas.translate(cx, size.height);
      canvas.rotate(tilt);

      final rect = Rect.fromLTWH(-w / 2, -h, w, h);
      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white.withValues(alpha: opacity),
            Colors.white.withValues(alpha: opacity * 0.45),
            Colors.white.withValues(alpha: 0),
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(rect);

      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(w)),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _LightRaysPainter oldDelegate) =>
      oldDelegate.layer != layer;
}

class _FadedRobotHero extends StatelessWidget {
  const _FadedRobotHero({
    required this.asset,
    this.fadeStart = 0.55,
  });

  final String asset;
  final double fadeStart;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.white,
            Colors.white,
            Color(0x00FFFFFF),
          ],
          stops: [0, fadeStart, 1],
        ).createShader(bounds);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: LocalPicture(
          asset,
          width: 324,
          height: 334,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class _AccountStepRow extends StatelessWidget {
  const _AccountStepRow({required this.label, required this.done});

  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/figmatik.svg',
          width: 26,
          height: 26,
          colorFilter: ColorFilter.mode(
            done ? AppColors.primary : const Color(0xFF8F8F8F),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: done ? AppColors.ink : const Color(0x80000000),
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

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
  const AuthScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _busy = false;

  /// Apple sadece iOS'ta; Android'de Google + Guest.
  bool get _showAppleSignIn => !kIsWeb && Platform.isIOS;

  void _enterApp() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const MainShell()),
    );
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
      await AuthService.signInAsGuest(widget.draft);
      if (!mounted) return;
      _enterApp();
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
      await AuthService.signInWithGoogle(widget.draft);
      if (!mounted) return;
      _enterApp();
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
      await AuthService.signInWithApple(widget.draft);
      if (!mounted) return;
      _enterApp();
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
    final topInset = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primary,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7FBFF),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned.fill(child: _AuthBackground()),
            SafeArea(
              top: false,
              bottom: true,
              child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  // Yatay padding yok: hero kenara kadar. Metin/butonlar ayrı 16.
                  padding: EdgeInsets.fromLTRB(0, topInset, 0, 12),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - topInset,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Builder(
                            builder: (context) {
                              final imageH = constraints.maxWidth *
                                  _AuthHero.aspectH /
                                  _AuthHero.aspectW;
                              final badgeTop = 35 + imageH + 28;

                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 35),
                                    child: _AuthHero(),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: badgeTop,
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withValues(
                                            alpha: .40,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/auth/trainers_badge_icon.png',
                                              width: 15,
                                              height: 15,
                                              fit: BoxFit.contain,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              text.auth.trainersBadge,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const Spacer(flex: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              text.auth.title,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 32,
                                height: 36 / 32,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    color: Color(0x40002A66),
                                    blurRadius: 18,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              text.auth.body,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white.withValues(alpha: .88),
                                fontSize: 14,
                                height: 20 / 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                if (_showAppleSignIn) ...[
                                  _SocialAuthButton(
                                    label: text.auth.continueApple,
                                    background:
                                        Colors.white.withValues(alpha: .20),
                                    foreground: Colors.white,
                                    iconAsset: 'assets/images/auth/apple.svg',
                                    iconSize: 28,
                                    glassGradient: true,
                                    onPressed:
                                        _busy ? null : _continueWithApple,
                                  ),
                                  const SizedBox(height: 12),
                                ],
                                _SocialAuthButton(
                                  label: text.auth.continueGoogle,
                                  background: Colors.white,
                                  foreground: AppColors.ink,
                                  iconAsset: 'assets/images/auth/google.svg',
                                  iconSize: 22,
                                  onPressed: _busy ? null : _continueWithGoogle,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: TextButton(
                              onPressed: _busy ? null : _continueAsGuest,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              child: _busy
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      text.auth.continueGuest,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 18 / 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _AuthLegalText(
                              fullText: text.auth.legal,
                              terms: text.auth.terms,
                              privacy: text.auth.privacy,
                              cookies: text.auth.cookies,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Yüzler tam görünsün; alt fade arka planla aynı beyaz tonunda erir.
class _AuthHero extends StatelessWidget {
  const _AuthHero();

  static const aspectW = 860.0;
  static const aspectH = 380.0;
  static const fadeExtend = 56.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageH = constraints.maxWidth * aspectH / aspectW;

        return SizedBox(
          height: imageH + fadeExtend,
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xF0FFFFFF),
                  Color(0xB8FFFFFF),
                  Color(0x60FFFFFF),
                  Color(0x18FFFFFF),
                  Color(0x00FFFFFF),
                ],
                stops: const [0.0, 0.58, 0.72, 0.82, 0.90, 0.96, 1.0],
              ).createShader(bounds);
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/loginHero.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                gaplessPlayback: true,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Üst beyaz; mavi glow yalnızca alt yarıda (başlık/butonlar).
class _AuthBackground extends StatelessWidget {
  const _AuthBackground();

  static const _figmaW = 430.0;
  static const _figmaH = 852.0;
  static const _blurPad = 140.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sx = size.width / _figmaW;
    final sy = size.height / _figmaH;
    final s = (sx + sy) / 2;

    Widget circle({
      required double left,
      required double top,
      required double diameter,
      required Color color,
      double blur = 70,
    }) {
      final d = diameter * s;
      final sigma = blur * s;
      return Positioned(
        left: left * sx - _blurPad,
        top: top * sy - _blurPad,
        width: d + _blurPad * 2,
        height: d + _blurPad * 2,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: sigma,
            sigmaY: sigma,
            tileMode: TileMode.decal,
          ),
          child: Center(
            child: Container(
              width: d,
              height: d,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );
    }

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Color(0xFFF7FBFF),
                  Color(0xFFE8F4FF),
                  Color(0xFFD6EBFF),
                  Color(0xFF7EB8F5),
                ],
                stops: [0, 0.34, 0.42, 0.48, 0.56, 1],
              ),
            ),
          ),
          circle(
            left: -22,
            top: 400,
            diameter: 490,
            color: const Color(0xFF2D85FF),
          ),
          circle(
            left: -81,
            top: 470,
            diameter: 594,
            color: const Color(0xFF37B2E3),
          ),
          circle(
            left: -65,
            top: 620,
            diameter: 559,
            color: const Color(0xFF2D46FF),
          ),
        ],
      ),
    );
  }
}

class _AuthLegalText extends StatefulWidget {
  const _AuthLegalText({
    required this.fullText,
    required this.terms,
    required this.privacy,
    required this.cookies,
  });

  final String fullText;
  final String terms;
  final String privacy;
  final String cookies;

  @override
  State<_AuthLegalText> createState() => _AuthLegalTextState();
}

class _AuthLegalTextState extends State<_AuthLegalText> {
  final _recognizers = <TapGestureRecognizer>[];

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    super.dispose();
  }

  LegalDocumentKind? _kindForKey(String key) {
    if (key == widget.terms) return LegalDocumentKind.terms;
    if (key == widget.privacy) return LegalDocumentKind.privacy;
    if (key == widget.cookies) return LegalDocumentKind.cookies;
    return null;
  }

  TapGestureRecognizer _recognizerFor(LegalDocumentKind kind) {
    final r = TapGestureRecognizer()
      ..onTap = () => LegalDocumentSheet.open(context, kind);
    _recognizers.add(r);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    _recognizers.clear();

    final base = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white.withValues(alpha: .90),
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w400,
    );
    final link = base.copyWith(
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
    );

    final spans = <InlineSpan>[];
    var remaining = widget.fullText;
    final keys = [widget.terms, widget.privacy, widget.cookies];

    while (remaining.isNotEmpty) {
      var nextIndex = -1;
      String? nextKey;
      for (final key in keys) {
        final index = remaining.indexOf(key);
        if (index >= 0 && (nextIndex < 0 || index < nextIndex)) {
          nextIndex = index;
          nextKey = key;
        }
      }

      if (nextIndex < 0 || nextKey == null) {
        spans.add(TextSpan(text: remaining, style: base));
        break;
      }

      if (nextIndex > 0) {
        spans.add(
          TextSpan(text: remaining.substring(0, nextIndex), style: base),
        );
      }

      final kind = _kindForKey(nextKey);
      spans.add(
        TextSpan(
          text: nextKey,
          style: link,
          recognizer: kind == null ? null : _recognizerFor(kind),
        ),
      );
      remaining = remaining.substring(nextIndex + nextKey.length);
    }

    return Text.rich(
      TextSpan(children: spans),
      textAlign: TextAlign.center,
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
    this.iconSize = 22,
    this.glassGradient = false,
  });

  final String label;
  final Color background;
  final Color foreground;
  final String iconAsset;
  final VoidCallback? onPressed;
  final double iconSize;
  final bool glassGradient;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconAsset,
          width: iconSize,
          height: iconSize,
          colorFilter: foreground == Colors.white
              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
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
    );

    if (glassGradient) {
      return SizedBox(
        height: 52,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withValues(alpha: .22),
                border: Border.all(
                  color: Colors.white.withValues(alpha: .32),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: content,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 52,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: content,
      ),
    );
  }
}
