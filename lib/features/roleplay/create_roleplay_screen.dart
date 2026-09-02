import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' as rive;

import '../../core/auth/api_client.dart';
import '../../core/auth/session_store.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../features/tutor/widgets/tutor_rive_avatar.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'role_play_api_service.dart';

class CreateRolePlayScreen extends StatefulWidget {
  const CreateRolePlayScreen({super.key});

  @override
  State<CreateRolePlayScreen> createState() => _CreateRolePlayScreenState();
}

class _CreateRolePlayScreenState extends State<CreateRolePlayScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _scenarioController;
  late final TextEditingController _tutorRoleController;
  late final TextEditingController _userRoleController;
  late final TextEditingController _extraController;
  late final AnimationController _progressController;
  var _generating = false;
  var _error = '';

  @override
  void initState() {
    super.initState();
    _scenarioController = TextEditingController();
    _tutorRoleController = TextEditingController();
    _userRoleController = TextEditingController();
    _extraController = TextEditingController();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 9000),
    );
  }

  @override
  void dispose() {
    _scenarioController.dispose();
    _tutorRoleController.dispose();
    _userRoleController.dispose();
    _extraController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (_generating) return;

    final text = AppText.current.rolePlayPage;
    final scenario = _scenarioController.text.trim();
    final tutorRole = _tutorRoleController.text.trim();
    final userRole = _userRoleController.text.trim();
    final extraInfo = _extraController.text.trim();

    if (scenario.length < 2 ||
        tutorRole.length < 2 ||
        userRole.length < 2) {
      setState(() => _error = text.createFieldsRequired);
      return;
    }

    setState(() {
      _generating = true;
      _error = '';
    });
    _progressController.forward(from: 0);

    try {
      final nativeCode =
          SessionStore.currentUser?.onboarding?.nativeLanguageCode ?? 'tr';
      final created = await RolePlayApiService.generateCustomScenario(
        scenario: scenario,
        tutorRole: tutorRole,
        userRole: userRole,
        extraInfo: extraInfo.isEmpty ? null : extraInfo,
        nativeLanguageCode: nativeCode,
      );
      if (!mounted) return;
      Navigator.of(context).pop(created);
    } on ApiException catch (err) {
      if (!mounted) return;
      setState(() {
        _generating = false;
        _error = err.message;
      });
      _progressController.reset();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _generating = false;
        _error = text.createFailed;
      });
      _progressController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.rolePlayPage;
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed:
                          _generating ? null : () => Navigator.of(context).maybePop(),
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _generating
                    ? _CreatingHero(
                        progress: _progressController,
                        title: text.creatingScenario,
                        subtitle: text.creatingScenarioSubtitle,
                      )
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        children: [
                          Text(
                            text.createOwnScenarioTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              height: 28 / 22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const _FormAvatarHero(),
                          const SizedBox(height: 24),
                          _RolePlayField(
                            label: text.createFieldScenario,
                            hint: text.createFieldScenarioHint,
                            controller: _scenarioController,
                          ),
                          const SizedBox(height: 16),
                          _RolePlayField(
                            label: text.createFieldTutorRole,
                            hint: text.createFieldTutorRoleHint,
                            controller: _tutorRoleController,
                          ),
                          const SizedBox(height: 16),
                          _RolePlayField(
                            label: text.createFieldYourRole,
                            hint: text.createFieldYourRoleHint,
                            controller: _userRoleController,
                          ),
                          const SizedBox(height: 16),
                          _RolePlayField(
                            label: text.createFieldExtraInfo,
                            hint: text.createFieldExtraInfoHint,
                            controller: _extraController,
                            optional: true,
                            minLines: 3,
                            maxLines: 5,
                          ),
                          if (_error.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Text(
                              _error,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: Color(0xFFEF3F3F),
                              ),
                            ),
                          ],
                        ],
                      ),
              ),
              if (!_generating)
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottom),
                  child: PrimaryButton(
                    label: text.createOwnScenarioContinue,
                    onPressed: _submit,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormAvatarHero extends StatelessWidget {
  const _FormAvatarHero();

  static const _size = 120.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: _size + 36,
        height: _size + 12,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2D46FF), Color(0xFF939DEA)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipOval(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: TutorRiveAvatar(
                    assetPath: AppAssets.tutorLingolaRivCdn,
                    fallbackRivePath: AppAssets.tutorLingolaRivCdn,
                    talking: false,
                    fit: rive.Fit.contain,
                    alignment: const Alignment(0, 0.12),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFFE8EEFF)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.groups_2_outlined, size: 16, color: AppColors.ink),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.ink),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RolePlayField extends StatelessWidget {
  const _RolePlayField({
    required this.label,
    required this.hint,
    required this.controller,
    this.optional = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool optional;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
            if (optional) ...[
              const SizedBox(width: 6),
              Tooltip(
                message: hint,
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: AppColors.ink.withValues(alpha: 0.45),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xFF9AA3B2),
            ),
            filled: true,
            fillColor: const Color(0xFFF7F7F8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w500,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

class _CreatingHero extends StatelessWidget {
  const _CreatingHero({
    required this.progress,
    required this.title,
    required this.subtitle,
  });

  final Animation<double> progress;
  final String title;
  final String subtitle;

  static const _outerSize = 220.0;
  static const _innerSize = 198.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, _) {
        final pct = (progress.value * 100).round().clamp(1, 99);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$pct%',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.primary.withValues(alpha: 0.72),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: _outerSize,
              height: _outerSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(_outerSize, _outerSize),
                    painter: _HeroRingPainter(progress: progress.value),
                  ),
                  Container(
                    width: _innerSize,
                    height: _innerSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF2D46FF), Color(0xFF939DEA)],
                      ),
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: TutorRiveAvatar(
                          assetPath: AppAssets.tutorLingolaRivCdn,
                          fallbackRivePath: AppAssets.tutorLingolaRivCdn,
                          talking: false,
                          fit: rive.Fit.contain,
                          alignment: const Alignment(0, 0.1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  height: 28 / 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeroRingPainter extends CustomPainter {
  const _HeroRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    final track = Paint()
      ..color = const Color(0xFFE8ECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    final arc = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, track);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.08, 0.98),
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant _HeroRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
