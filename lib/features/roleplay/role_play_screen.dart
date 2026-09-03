import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'role_play_api_service.dart';
import 'create_roleplay_screen.dart';
import 'role_play_chat_screen.dart';

class RolePlayScreen extends StatefulWidget {
  const RolePlayScreen({super.key});

  @override
  State<RolePlayScreen> createState() => _RolePlayScreenState();
}

class _RolePlayScreenState extends State<RolePlayScreen> {
  List<RolePlayScenarioDto>? _remoteDtos;
  String? _openSwipeId;

  @override
  void initState() {
    super.initState();
    _loadScenarios();
  }

  Future<void> _loadScenarios() async {
    try {
      final remote = await RolePlayApiService.fetchScenarios();
      if (!mounted) return;
      setState(() => _remoteDtos = remote);
    } catch (_) {
      // Yerel katalog korunur; ilerleme/özel senaryolar yüklenemez.
    }
  }

  List<_RolePlayScenario> _scenariosFor(dynamic text) {
    final base = _fallbackScenarios(text);
    final remote = _remoteDtos;
    if (remote == null || remote.isEmpty) return base;

    final remoteById = {
      for (final dto in remote.where((d) => !d.isCustom)) dto.id: dto,
    };

    final custom = remote
        .where((dto) => dto.isCustom)
        .map((dto) => _mapScenario(dto, text))
        .whereType<_RolePlayScenario>()
        .toList();

    final localIds = base.map((s) => s.id).toSet();
    final mergedStatic = base.map((scenario) {
      final dto = remoteById[scenario.id];
      if (dto == null) return scenario;
      final progress = dto.progressPercent > 0.001
          ? dto.progressPercent.clamp(0.0, 1.0)
          : scenario.progress;
      return _RolePlayScenario(
        id: scenario.id,
        title: scenario.title,
        image: scenario.image,
        progress: progress,
        sessionId: dto.sessionId ?? scenario.sessionId,
        minutes: scenario.minutes,
        level: scenario.level,
        screenplay: scenario.screenplay,
        section: scenario.section,
      );
    }).toList();

    // Backend uygulamadan önde ise (deploy sonrası) ek statik senaryolar.
    final extraStatic = remote
        .where((dto) => !dto.isCustom && !localIds.contains(dto.id))
        .map((dto) => _mapScenario(dto, text))
        .whereType<_RolePlayScenario>()
        .toList();

    return [...custom, ...mergedStatic, ...extraStatic];
  }

  static List<_RolePlayScenario> _fallbackScenarios(dynamic text) {
    final page = text.rolePlayPage;
    return _staticCatalog
        .map((item) {
          final title = _titleFor(page, item.id);
          final screenplay = _screenplayFor(page, item.id);
          if (title == null || screenplay == null) return null;
          return _RolePlayScenario(
            id: item.id,
            title: title,
            image: _imageFor(item.id),
            progress: item.id == 'coffee' ? 0.6 : null,
            minutes: item.minutes,
            level: _levelFor(page, item.levelKey),
            screenplay: screenplay,
            section: item.sectionKey != null
                ? _sectionFor(page, item.sectionKey)
                : null,
          );
        })
        .whereType<_RolePlayScenario>()
        .toList();
  }

  static const _staticCatalog = [
    _StaticScenarioMeta(id: 'coffee', minutes: 8, levelKey: 'beginner'),
    _StaticScenarioMeta(
      id: 'directions',
      minutes: 8,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'missedTrain',
      minutes: 5,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'flightAttendant',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'trainTicket',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'restaurantReservation',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'doctorAppointment',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'shoppingClothes',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'takingTaxi',
      minutes: 6,
      levelKey: 'beginner',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'birthdayParty',
      minutes: 7,
      levelKey: 'beginnerIntermediate',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'rentingApartment',
      minutes: 7,
      levelKey: 'intermediate',
      sectionKey: 'dailyInteractions',
    ),
    _StaticScenarioMeta(
      id: 'interview',
      minutes: 8,
      levelKey: 'beginner',
      sectionKey: 'business',
    ),
  ];

  static _RolePlayScenario? _mapScenario(RolePlayScenarioDto dto, dynamic text) {
    final page = text.rolePlayPage;
    if (dto.isCustom) {
      final title = dto.title?.trim();
      final screenplay = dto.screenplay?.trim();
      if (title == null || title.isEmpty || screenplay == null || screenplay.isEmpty) {
        return null;
      }
      return _RolePlayScenario(
        id: dto.id,
        title: title,
      image: dto.imageAsset.isNotEmpty ? dto.imageAsset : '',
        progress: dto.progressPercent > 0.001 ? dto.progressPercent.clamp(0, 1) : null,
        sessionId: dto.sessionId,
        minutes: dto.minutes,
        level: _levelFor(page, dto.levelKey),
        screenplay: screenplay,
        section: null,
        isCustom: true,
        openingMessage: dto.openingMessage,
      );
    }

    final title = _titleFor(page, dto.titleKey);
    final screenplay = _screenplayFor(page, dto.titleKey);
    if (title == null || screenplay == null) return null;
    return _RolePlayScenario(
      id: dto.id,
      title: title,
      image: dto.imageAsset.isNotEmpty ? dto.imageAsset : _imageFor(dto.id),
      progress: dto.progressPercent > 0.001 ? dto.progressPercent.clamp(0, 1) : null,
      sessionId: dto.sessionId,
      minutes: dto.minutes,
      level: _levelFor(page, dto.levelKey),
      screenplay: screenplay,
      section: _sectionFor(page, dto.sectionKey),
    );
  }

  static String? _titleFor(dynamic page, String key) {
    return switch (key) {
      'coffee' => page.coffee.title as String?,
      'directions' => page.directions.title as String?,
      'interview' => page.interview.title as String?,
      'missedTrain' => page.missedTrain.title as String?,
      'flightAttendant' => page.flightAttendant.title as String?,
      'trainTicket' => page.trainTicket.title as String?,
      'restaurantReservation' => page.restaurantReservation.title as String?,
      'doctorAppointment' => page.doctorAppointment.title as String?,
      'shoppingClothes' => page.shoppingClothes.title as String?,
      'takingTaxi' => page.takingTaxi.title as String?,
      'rentingApartment' => page.rentingApartment.title as String?,
      'birthdayParty' => page.birthdayParty.title as String?,
      _ => null,
    };
  }

  static String? _screenplayFor(dynamic page, String key) {
    return switch (key) {
      'coffee' => page.coffee.screenplay as String?,
      'directions' => page.directions.screenplay as String?,
      'interview' => page.interview.screenplay as String?,
      'missedTrain' => page.missedTrain.screenplay as String?,
      'flightAttendant' => page.flightAttendant.screenplay as String?,
      'trainTicket' => page.trainTicket.screenplay as String?,
      'restaurantReservation' => page.restaurantReservation.screenplay as String?,
      'doctorAppointment' => page.doctorAppointment.screenplay as String?,
      'shoppingClothes' => page.shoppingClothes.screenplay as String?,
      'takingTaxi' => page.takingTaxi.screenplay as String?,
      'rentingApartment' => page.rentingApartment.screenplay as String?,
      'birthdayParty' => page.birthdayParty.screenplay as String?,
      _ => null,
    };
  }

  static String? _sectionFor(dynamic page, String? key) {
    return switch (key) {
      'dailyInteractions' => page.dailyInteractions as String?,
      'business' => page.business as String?,
      _ => null,
    };
  }

  static String _levelFor(dynamic page, String levelKey) {
    return switch (levelKey) {
      'intermediate' => page.intermediate as String,
      'beginnerIntermediate' => page.beginnerIntermediate as String,
      _ => page.beginner as String,
    };
  }

  static String _imageFor(String id) {
    return switch (id) {
      'coffee' => AppAssets.rolePlayCoffee,
      'directions' => AppAssets.rolePlayDirections,
      'interview' => AppAssets.rolePlayInterview,
      'missedTrain' => AppAssets.rolePlayMissedTrain,
      'flightAttendant' => AppAssets.rolePlayFlightAttendant,
      'trainTicket' => AppAssets.rolePlayTrainTicket,
      'restaurantReservation' => AppAssets.rolePlayRestaurantReservation,
      'doctorAppointment' => AppAssets.rolePlayDoctorAppointment,
      'shoppingClothes' => AppAssets.rolePlayShoppingClothes,
      'takingTaxi' => AppAssets.rolePlayTakingTaxi,
      'rentingApartment' => AppAssets.rolePlayRentingApartment,
      'birthdayParty' => AppAssets.rolePlayBirthdayParty,
      _ => AppAssets.rolePlayCoffee,
    };
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final allScenarios = _scenariosFor(text);
    final customScenarios =
        allScenarios.where((scenario) => scenario.isCustom).toList();
    final staticScenarios =
        allScenarios.where((scenario) => !scenario.isCustom).toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F8),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Text(
                text.rolePlayPage.title,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  height: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text.rolePlayPage.subtitle,
                style: const TextStyle(
                  color: Color(0xFF8A8A8A),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              _CreateRolePlayCard(
                onTap: () => _openCreate(context),
              ),
              const SizedBox(height: 12),
              if (customScenarios.isNotEmpty) ...[
                Text(
                  text.rolePlayPage.customScenarios,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    height: 20 / 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                for (final scenario in customScenarios) ...[
                  _RolePlaySwipeRow(
                    isOpen: _openSwipeId == scenario.id,
                    onOpenChanged: (open) {
                      setState(() {
                        _openSwipeId = open ? scenario.id : null;
                      });
                    },
                    onDeleteTap: () => _deleteCustom(scenario),
                    child: _RolePlayCard(
                      scenario: scenario,
                      onTap: () {
                        if (_openSwipeId == scenario.id) {
                          setState(() => _openSwipeId = null);
                          return;
                        }
                        _openDetail(context, scenario);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
              for (final scenario in staticScenarios) ...[
                if (scenario.section != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    scenario.section!,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      height: 20 / 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                _RolePlayCard(
                  scenario: scenario,
                  onTap: () => _openDetail(context, scenario),
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _deleteCustom(_RolePlayScenario scenario) async {
    final previous = _remoteDtos;
    setState(() {
      _remoteDtos = [
        for (final dto in _remoteDtos ?? const <RolePlayScenarioDto>[])
          if (dto.id != scenario.id) dto,
      ];
      if (_openSwipeId == scenario.id) _openSwipeId = null;
    });
    try {
      await RolePlayApiService.deleteCustomScenario(scenario.id);
    } catch (_) {
      if (!mounted) return;
      setState(() => _remoteDtos = previous);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.rolePlayPage.deleteFailed)),
      );
    }
  }

  Future<void> _openCreate(BuildContext context) async {
    if (!await PremiumService.requirePremium(context)) return;
    if (!context.mounted) return;
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const CreateRolePlayScreen(),
      ),
    );
    if (!mounted) return;
    await _loadScenarios();
  }

  Future<void> _openDetail(
    BuildContext context,
    _RolePlayScenario scenario,
  ) async {
    if (!await PremiumService.requirePremium(context)) return;
    if (!context.mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => _RolePlayDetailSheet(
        scenario: scenario,
        onGetStarted: () async {
          Navigator.of(sheetContext).pop();
          final english = rolePlayEnglishContent(
            scenarioId: scenario.id,
            title: scenario.title,
            openingMessage: scenario.openingMessage,
          );
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => RolePlayChatScreen(
                scenarioId: scenario.id,
                sessionId: scenario.sessionId,
                titleEn: english.titleEn,
                openingEn: english.openingEn,
                lessonBadge: english.badge,
                isCustom: scenario.isCustom,
              ),
            ),
          );
          if (!mounted) return;
          await _loadScenarios();
        },
      ),
    );
  }
}

class _RolePlayScenario {
  const _RolePlayScenario({
    required this.id,
    required this.title,
    required this.image,
    required this.minutes,
    required this.level,
    required this.screenplay,
    this.progress,
    this.sessionId,
    this.section,
    this.isCustom = false,
    this.openingMessage,
  });

  final String id;
  final String title;
  final String image;
  final double? progress;
  final String? sessionId;
  final int minutes;
  final String level;
  final String screenplay;
  final String? section;
  final bool isCustom;
  final String? openingMessage;
}

class _CreateRolePlayCard extends StatelessWidget {
  const _CreateRolePlayCard({required this.onTap});

  final VoidCallback onTap;

  static const _avatarSize = 44.0;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.rolePlayPage.createOwnScenario;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE8EEFF)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 108,
                height: _avatarSize,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _AvatarBubble(
                      left: 0,
                      image: AppAssets.rolePlayCoffee,
                    ),
                    _AvatarBubble(
                      left: 28,
                      image: AppAssets.rolePlayDirections,
                    ),
                    Positioned(
                      left: 56,
                      child: CustomPaint(
                        painter: _DashedCirclePainter(),
                        child: SizedBox(
                          width: _avatarSize,
                          height: _avatarSize,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 22,
                              color: Color(0xFF8A8A8A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    height: 20 / 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.ink,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBFC6D4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    const dash = 4.0;
    const gap = 3.0;
    final radius = size.width / 2 - 1;
    final center = Offset(size.width / 2, size.height / 2);
    final circumference = 2 * 3.141592653589793 * radius;
    final count = (circumference / (dash + gap)).floor();
    for (var i = 0; i < count; i++) {
      final start = -3.141592653589793 / 2 + (2 * 3.141592653589793 / count) * i;
      final sweep = (2 * 3.141592653589793 / count) * (dash / (dash + gap));
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AvatarBubble extends StatelessWidget {
  const _AvatarBubble({
    required this.left,
    required this.image,
  });

  final double left;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        width: _CreateRolePlayCard._avatarSize,
        height: _CreateRolePlayCard._avatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: HomeAsset(
            image,
            width: _CreateRolePlayCard._avatarSize,
            height: _CreateRolePlayCard._avatarSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _RolePlaySwipeRow extends StatefulWidget {
  const _RolePlaySwipeRow({
    required this.child,
    required this.isOpen,
    required this.onOpenChanged,
    required this.onDeleteTap,
  });

  final Widget child;
  final bool isOpen;
  final ValueChanged<bool> onOpenChanged;
  final VoidCallback onDeleteTap;

  @override
  State<_RolePlaySwipeRow> createState() => _RolePlaySwipeRowState();
}

class _RolePlaySwipeRowState extends State<_RolePlaySwipeRow> {
  static const _actionW = 44.0;
  static const _gap = 8.0;
  static const _reveal = _actionW + _gap;

  double _dx = 0;

  @override
  void didUpdateWidget(covariant _RolePlaySwipeRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen && _dx > -_reveal + 0.5) {
      setState(() => _dx = -_reveal);
    } else if (!widget.isOpen && _dx < -0.5) {
      setState(() => _dx = 0);
    }
  }

  void _settle(double velocity) {
    final shouldOpen = velocity < -200 || _dx < -_reveal / 2;
    final next = shouldOpen ? -_reveal : 0.0;
    setState(() => _dx = next);
    widget.onOpenChanged(shouldOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Material(
              color: const Color(0x33FF0014),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: widget.onDeleteTap,
                borderRadius: BorderRadius.circular(8),
                child: const SizedBox(
                  width: _actionW,
                  height: _actionW,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: HomeAsset(
                      AppAssets.notificationTrash,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              _dx = (_dx + details.delta.dx).clamp(-_reveal, 0.0);
            });
          },
          onHorizontalDragEnd: (details) {
            _settle(details.primaryVelocity ?? 0);
          },
          child: Transform.translate(
            offset: Offset(_dx, 0),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class _RolePlayCard extends StatelessWidget {
  const _RolePlayCard({required this.scenario, required this.onTap});

  final _RolePlayScenario scenario;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 114),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE8EEFF)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: HomeAsset(
                  scenario.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 94,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scenario.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          height: 20 / 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      if (scenario.progress != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: LinearProgressIndicator(
                            minHeight: 4,
                            value: scenario.progress,
                            color: AppColors.primary,
                            backgroundColor: const Color(0xFFDCE3FF),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          text.rolePlayPage.progressCompleted(
                            value: ((scenario.progress ?? 0) * 100).round(),
                          ),
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            height: 14 / 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ] else
                        Row(
                          children: [
                            _MetaChip(
                              label: text.rolePlayPage.minutes(
                                value: scenario.minutes,
                              ),
                              background: const Color(0xFFF0F0F0),
                              foreground: const Color(0xFF6F6F6F),
                            ),
                            const SizedBox(width: 6),
                            _MetaChip(
                              label: scenario.level,
                              background: AppColors.primaryTint10,
                              foreground: AppColors.primary,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const HomeAsset(
                  AppAssets.quizArrow,
                  width: 6,
                  height: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({
    required this.label,
    required this.background,
    required this.foreground,
    this.outlined = false,
    this.fontWeight = FontWeight.w500,
  });

  final String label;
  final Color background;
  final Color foreground;
  final bool outlined;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: outlined ? Border.all(color: foreground) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontFamily: 'Poppins',
          fontSize: 12,
          height: 15 / 12,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class _RolePlayDetailSheet extends StatelessWidget {
  const _RolePlayDetailSheet({
    required this.scenario,
    required this.onGetStarted,
  });

  final _RolePlayScenario scenario;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .78,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 34,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 18, 16, 16 + bottom),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: HomeAsset(
                      scenario.image,
                      width: 189,
                      height: 189,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    scenario.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      height: 24 / 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _MetaChip(
                        label: text.rolePlayPage.minutes(
                          value: scenario.minutes,
                        ),
                        background: Colors.white,
                        foreground: const Color(0xFF6F6F6F),
                        outlined: true,
                      ),
                      const SizedBox(width: 8),
                      _MetaChip(
                        label: scenario.level,
                        background: Colors.white,
                        foreground: AppColors.primary,
                        outlined: true,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HomeAsset(
                              AppAssets.rolePlayScreenplay,
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              text.rolePlayPage.screenplay,
                              style: const TextStyle(
                                color: AppColors.ink,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                height: 18 / 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          scenario.screenplay,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            height: 16 / 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(
                    label: text.common.getStarted,
                    onPressed: onGetStarted,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaticScenarioMeta {
  const _StaticScenarioMeta({
    required this.id,
    required this.minutes,
    required this.levelKey,
    this.sectionKey,
  });

  final String id;
  final int minutes;
  final String levelKey;
  final String? sectionKey;
}
