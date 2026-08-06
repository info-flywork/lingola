import 'dart:async';
import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/auth_service.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../shell/main_shell.dart';
import 'language_flag.dart';
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
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFE8F2FF), AppColors.primary],
              stops: [0, .42, 1],
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final robotHeight = (constraints.maxHeight * 0.42).clamp(
                  220.0,
                  320.0,
                );
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: robotHeight,
                      child: const _FadedRobotHero(
                        asset: 'auth/account_robot.png',
                        fadeStart: 0.52,
                      ),
                    ),
                    // Figma: kart üstünden robota doğru ince blurlu beyaz ışınlar
                    Positioned(
                      top: robotHeight - 72 - 88,
                      left: 0,
                      right: 0,
                      height: 96,
                      child: const IgnorePointer(
                        child: _AccountCardTopLightRays(),
                      ),
                    ),
                    Positioned(
                      top: robotHeight - 72,
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: .18),
                              blurRadius: 28,
                              offset: const Offset(0, 12),
                            ),
                            // Üst kenardan yukarı süzülen yumuşak beyaz bloom
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.95),
                              blurRadius: 28,
                              spreadRadius: 2,
                              offset: const Offset(0, -10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
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
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
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
                Color(0xF2FFFFFF),
                Color(0x66FFFFFF),
                Color(0x00FFFFFF),
              ],
              stops: [0.0, 0.42, 1.0],
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
          width: 300,
          height: 320,
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

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  bool _trialActive = true;

  void _openAuth() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => AuthScreen(draft: widget.draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFE8F1FF), AppColors.primary],
              stops: [0, .42, 1],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    tooltip: text.common.close,
                    onPressed: _openAuth,
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
                const _PaywallHero(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            text.paywall.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 22,
                              height: 28 / 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            text.paywall.subtitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _PaywallCheck(text.paywall.noCommitment),
                          _PaywallCheck(text.paywall.cancelAnytime),
                          _PaywallCheck(text.paywall.noPaymentToday),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.primaryTint05,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: .35),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text.paywall.daysFree,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  text.paywall.thenPrice,
                                  style: const TextStyle(
                                    color: AppColors.ink,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  text.paywall.trialActive,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Switch.adaptive(
                                value: _trialActive,
                                activeThumbColor: Colors.white,
                                activeTrackColor: AppColors.primary,
                                onChanged: (value) =>
                                    setState(() => _trialActive = value),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _PaywallMetaRow(
                            left: text.paywall.payableToday,
                            right: text.paywall.payableValue,
                          ),
                          const SizedBox(height: 8),
                          _PaywallMetaRow(
                            left: text.paywall.paymentDate,
                            right: text.paywall.paymentAmount,
                          ),
                          const SizedBox(height: 18),
                          PrimaryButton(
                            label: text.common.getStarted,
                            onPressed: _openAuth,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PaywallHero extends StatelessWidget {
  const _PaywallHero();

  @override
  Widget build(BuildContext context) {
    const flags = ['en', 'fr', 'it', 'es', 'de'];
    return SizedBox(
      height: 168,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (var i = 0; i < flags.length; i++)
            Transform.translate(
              offset: Offset((i - 2) * 42.0, i.isEven ? -28.0 : 18.0),
              child: Container(
                width: 54,
                height: 54,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: LanguageFlag(flags[i], width: 38, height: 28),
              ),
            ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF7B61FF),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(
              Icons.emoji_people_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaywallCheck extends StatelessWidget {
  const _PaywallCheck(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_rounded, color: AppColors.primary, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaywallMetaRow extends StatelessWidget {
  const _PaywallMetaRow({required this.left, required this.right});

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            left,
            style: const TextStyle(
              color: Color(0xFF6F6F6F),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          right,
          style: const TextStyle(
            color: Color(0xFF6F6F6F),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
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

  Future<void> _continueAsGuest() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await AuthService.signInAsGuest(widget.draft);
      if (!mounted) return;
      _enterApp();
    } on ApiException catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message)),
      );
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
        backgroundColor: AppColors.primary,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            // Figma: beyaz → yumuşak ton geçişiyle maviye (keskin bant yok)
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFFF7F9FF),
                Color(0xFFE4EBFF),
                Color(0xFFC5D0FF),
                Color(0xFF8FA3FF),
                Color(0xFF546BFF),
                AppColors.primary,
                Color(0xFF1F33C9),
              ],
              stops: [0.0, 0.16, 0.28, 0.40, 0.55, 0.70, 0.86, 1.0],
            ),
          ),
          child: SafeArea(
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
                          // Full-bleed + hafif zoom: PNG’deki siyah yan boşluklar kırpılır.
                          // scale↑ → yan boşluk daha az (örn. 1.08 → 1.15)
                          AspectRatio(
                            aspectRatio: 860 / 380,
                            child: ClipRect(
                              child: Transform.scale(
                                scale: 1.12,
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
                          ),
                          Transform.translate(
                            // Negatif = yukarı; küçültünce badge aşağı iner
                            offset: const Offset(0, 20),
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
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.person_outline_rounded,
                                      color: Colors.white,
                                      size: 15,
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
                                color: Colors.white.withValues(alpha: .92),
                                fontSize: 14,
                                height: 20 / 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _SocialAuthButton(
                              label: text.auth.continueGoogle,
                              background: Colors.white,
                              foreground: AppColors.ink,
                              iconAsset: 'assets/images/auth/google.svg',
                              iconSize: 22,
                              onPressed: _busy ? null : _continueWithGoogle,
                            ),
                          ),
                          if (_showAppleSignIn) ...[
                            const SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: _SocialAuthButton(
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
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class _AuthLegalText extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
    var remaining = fullText;
    final keys = [terms, privacy, cookies];

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
      spans.add(TextSpan(text: nextKey, style: link));
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
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: .28),
                Colors.white.withValues(alpha: .12),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: .28),
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
