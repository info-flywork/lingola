import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'create_roleplay_screen.dart';
import 'role_play_api_service.dart';
import 'role_play_catalog.dart';
import 'role_play_category_screen.dart';
import 'role_play_widgets.dart';

class RolePlayScreen extends StatefulWidget {
  const RolePlayScreen({super.key});

  @override
  State<RolePlayScreen> createState() => _RolePlayScreenState();
}

class _RolePlayScreenState extends State<RolePlayScreen> {
  List<RolePlayScenarioDto>? _remoteDtos;
  String? _openSwipeId;
  String _categoryFilter = 'all';
  String _difficultyFilter = 'all';

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
      // Yerel katalog korunur.
    }
  }

  List<RolePlayScenarioItem> _scenariosFor(dynamic text) {
    final base = _fallbackScenarios(text);
    final remote = _remoteDtos;
    if (remote == null || remote.isEmpty) return base;

    final remoteById = {
      for (final dto in remote.where((d) => !d.isCustom)) dto.id: dto,
    };

    final custom = remote
        .where((dto) => dto.isCustom)
        .map((dto) => _mapScenario(dto, text))
        .whereType<RolePlayScenarioItem>()
        .toList();

    final localIds = base.map((s) => s.id).toSet();
    final mergedStatic = base.map((scenario) {
      final dto = remoteById[scenario.id];
      if (dto == null) return scenario;
      final progress = dto.progressPercent > 0.001
          ? dto.progressPercent.clamp(0.0, 1.0)
          : scenario.progress;
      return RolePlayScenarioItem(
        id: scenario.id,
        title: scenario.title,
        image: scenario.image,
        progress: progress,
        sessionId: dto.sessionId ?? scenario.sessionId,
        minutes: scenario.minutes,
        level: scenario.level,
        levelKey: scenario.levelKey,
        screenplay: scenario.screenplay,
        categoryKey: scenario.categoryKey,
        section: scenario.section,
      );
    }).toList();

    final extraStatic = remote
        .where((dto) => !dto.isCustom && !localIds.contains(dto.id))
        .map((dto) => _mapScenario(dto, text))
        .whereType<RolePlayScenarioItem>()
        .toList();

    return [...custom, ...mergedStatic, ...extraStatic];
  }

  static List<RolePlayScenarioItem> _fallbackScenarios(dynamic text) {
    final page = text.rolePlayPage;
    return expandRolePlayCatalog()
        .map((item) {
          final title = _titleFor(page, item.titleKey);
          final screenplay = _screenplayFor(page, item.titleKey);
          if (title == null || screenplay == null) return null;
          return RolePlayScenarioItem(
            id: item.id,
            title: title,
            image: _imageFor(item.id),
            minutes: item.minutes,
            level: RolePlayCatalog.levelLabel(page, item.levelKey),
            levelKey: item.levelKey,
            screenplay: screenplay,
            categoryKey: item.categoryKey,
            section: RolePlayCatalog.categoryLabel(page, item.categoryKey),
          );
        })
        .whereType<RolePlayScenarioItem>()
        .toList();
  }

  static RolePlayScenarioItem? _mapScenario(
    RolePlayScenarioDto dto,
    dynamic text,
  ) {
    final page = text.rolePlayPage;
    if (dto.isCustom) {
      final title = dto.title?.trim();
      final screenplay = dto.screenplay?.trim();
      if (title == null ||
          title.isEmpty ||
          screenplay == null ||
          screenplay.isEmpty) {
        return null;
      }
      return RolePlayScenarioItem(
        id: dto.id,
        title: title,
        image: dto.imageAsset.isNotEmpty ? dto.imageAsset : '',
        progress:
            dto.progressPercent > 0.001 ? dto.progressPercent.clamp(0, 1) : null,
        sessionId: dto.sessionId,
        minutes: dto.minutes,
        level: RolePlayCatalog.levelLabel(page, dto.levelKey),
        levelKey: dto.levelKey,
        screenplay: screenplay,
        categoryKey: RolePlayCatalog.lingolaRolePlay,
        section: RolePlayCatalog.categoryLabel(
          page,
          RolePlayCatalog.lingolaRolePlay,
        ),
        isCustom: true,
        openingMessage: dto.openingMessage,
      );
    }

    final lookupKey = RolePlayCatalog.baseId(dto.titleKey);
    final title = _titleFor(page, lookupKey);
    final screenplay = _screenplayFor(page, lookupKey);
    if (title == null || screenplay == null) return null;
    final categoryKey =
        dto.categoryKey ?? dto.sectionKey ?? 'dailyInteractions';
    return RolePlayScenarioItem(
      id: dto.id,
      title: title,
      image: dto.imageAsset.isNotEmpty ? dto.imageAsset : _imageFor(dto.id),
      progress:
          dto.progressPercent > 0.001 ? dto.progressPercent.clamp(0, 1) : null,
      sessionId: dto.sessionId,
      minutes: dto.minutes,
      level: RolePlayCatalog.levelLabel(page, dto.levelKey),
      levelKey: dto.levelKey,
      screenplay: screenplay,
      categoryKey: categoryKey,
      section: RolePlayCatalog.categoryLabel(page, categoryKey),
    );
  }

  static String? _titleFor(dynamic page, String key) {
    final base = RolePlayCatalog.baseId(key);
    return switch (base) {
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
      'flirtingMeet' => page.flirtingMeet.title as String?,
      'freeTalkHobby' => page.freeTalkHobby.title as String?,
      _ => null,
    };
  }

  static String? _screenplayFor(dynamic page, String key) {
    final base = RolePlayCatalog.baseId(key);
    return switch (base) {
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
      'flirtingMeet' => page.flirtingMeet.screenplay as String?,
      'freeTalkHobby' => page.freeTalkHobby.screenplay as String?,
      _ => null,
    };
  }

  static String _imageFor(String id) {
    return switch (RolePlayCatalog.baseId(id)) {
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
      'flirtingMeet' => AppAssets.rolePlayCoffee,
      'freeTalkHobby' => AppAssets.rolePlayBirthdayParty,
      _ => AppAssets.rolePlayCoffee,
    };
  }

  RolePlayScenarioItem _previewFor(List<RolePlayScenarioItem> items) {
    final beginners =
        items.where((s) => s.levelKey == 'beginner').toList(growable: false);
    final withProgress = beginners
        .where((s) => s.progress != null && s.progress! > 0.001)
        .toList(growable: false);
    if (withProgress.isNotEmpty) return withProgress.first;
    if (beginners.isNotEmpty) return beginners.first;
    return items.first;
  }

  void _setCategoryFilter(String key) {
    setState(() {
      _categoryFilter = key;
      _difficultyFilter = 'all';
      _openSwipeId = null;
    });
  }

  Future<void> _openCategoryScreen({
    required String categoryKey,
    required String categoryTitle,
    required List<RolePlayScenarioItem> scenarios,
  }) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => RolePlayCategoryScreen(
          categoryKey: categoryKey,
          categoryTitle: categoryTitle,
          scenarios: scenarios,
          onOpenDetail: (ctx, scenario) => openRolePlayScenarioDetail(
            context: ctx,
            scenario: scenario,
            onChatClosed: _loadScenarios,
          ),
        ),
      ),
    );
    if (!mounted) return;
    await _loadScenarios();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final page = text.rolePlayPage;
    final allScenarios = _scenariosFor(text);
    final customScenarios =
        allScenarios.where((scenario) => scenario.isCustom).toList();
    final staticScenarios =
        allScenarios.where((scenario) => !scenario.isCustom).toList();

    final filterChips = <({String key, String label})>[
      (key: 'all', label: page.filterAll),
      for (final key in RolePlayCatalog.categoryKeys)
        (key: key, label: RolePlayCatalog.categoryLabel(page, key)),
      (
        key: RolePlayCatalog.lingolaRolePlay,
        label: RolePlayCatalog.categoryLabel(page, RolePlayCatalog.lingolaRolePlay),
      ),
    ];

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
                page.title,
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
                page.subtitle,
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
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterChips.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final chip = filterChips[index];
                    return RolePlayFilterChip(
                      label: chip.label,
                      selected: _categoryFilter == chip.key,
                      onTap: () => _setCategoryFilter(chip.key),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ..._buildFilteredBody(
                page: page,
                customScenarios: customScenarios,
                staticScenarios: staticScenarios,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilteredBody({
    required dynamic page,
    required List<RolePlayScenarioItem> customScenarios,
    required List<RolePlayScenarioItem> staticScenarios,
  }) {
    if (_categoryFilter == RolePlayCatalog.lingolaRolePlay) {
      if (customScenarios.isEmpty) return const [];
      return [
        for (final scenario in customScenarios) ...[
          _RolePlaySwipeRow(
            isOpen: _openSwipeId == scenario.id,
            onOpenChanged: (open) {
              setState(() {
                _openSwipeId = open ? scenario.id : null;
              });
            },
            onDeleteTap: () => _deleteCustom(scenario),
            child: RolePlayScenarioCard(
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
      ];
    }

    if (_categoryFilter == 'all') {
      final widgets = <Widget>[];
      for (final key in RolePlayCatalog.categoryKeys) {
        final group = staticScenarios
            .where((s) => s.categoryKey == key)
            .toList(growable: false);
        if (group.isEmpty) continue;
        final title = RolePlayCatalog.categoryLabel(page, key);
        final preview = _previewFor(group);
        widgets.addAll([
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    height: 20 / 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _openCategoryScreen(
                  categoryKey: key,
                  categoryTitle: title,
                  scenarios: group,
                ),
                child: Text(
                  page.seeAll,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 20 / 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RolePlayScenarioCard(
            scenario: preview,
            onTap: () => _openDetail(context, preview),
          ),
          const SizedBox(height: 16),
        ]);
      }
      return widgets;
    }

    final categoryItems = staticScenarios
        .where((s) => s.categoryKey == _categoryFilter)
        .toList(growable: false);
    final filtered = _difficultyFilter == 'all'
        ? categoryItems
        : categoryItems
            .where((s) => s.levelKey == _difficultyFilter)
            .toList(growable: false);

    return [
      SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + RolePlayCatalog.difficultyKeys.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            if (index == 0) {
              return RolePlayFilterChip(
                label: page.filterAll,
                selected: _difficultyFilter == 'all',
                onTap: () => setState(() => _difficultyFilter = 'all'),
              );
            }
            final key = RolePlayCatalog.difficultyKeys[index - 1];
            return RolePlayFilterChip(
              label: RolePlayCatalog.levelLabel(page, key),
              selected: _difficultyFilter == key,
              onTap: () => setState(() => _difficultyFilter = key),
            );
          },
        ),
      ),
      const SizedBox(height: 16),
      for (final scenario in filtered) ...[
        RolePlayScenarioCard(
          scenario: scenario,
          onTap: () => _openDetail(context, scenario),
        ),
        const SizedBox(height: 12),
      ],
    ];
  }

  Future<void> _deleteCustom(RolePlayScenarioItem scenario) async {
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
    RolePlayScenarioItem scenario,
  ) {
    return openRolePlayScenarioDetail(
      context: context,
      scenario: scenario,
      onChatClosed: _loadScenarios,
    );
  }
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
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE2E2E2)),
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
                  style: TextStyle(
                    color: const Color(0xFF1A1714).withValues(alpha: 0.65),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 1,
                    letterSpacing: -0.28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary,
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
                  child: Center(
                    child: HomeAsset(
                      AppAssets.deleteIcon,
                      width: AppAssets.deleteIconSize,
                      height: AppAssets.deleteIconSize,
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
