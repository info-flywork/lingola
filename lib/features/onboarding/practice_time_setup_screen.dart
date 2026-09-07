import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/auth/auth_service.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/practice_time_of_day.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'onboarding_draft.dart';
import 'onboarding_step_header.dart';
import 'promise_commitment_screen.dart';
import 'set_practice_time_sheet.dart';

/// Günlük pratik adımından sonra: hatırlatma zaman dilimi.
class PracticeTimeSetupScreen extends StatefulWidget {
  const PracticeTimeSetupScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PracticeTimeSetupScreen> createState() =>
      _PracticeTimeSetupScreenState();
}

class _PracticeTimeSetupScreenState extends State<PracticeTimeSetupScreen> {
  int? _selected;
  TimeOfDay? _windowStart;
  TimeOfDay? _windowEnd;
  var _saving = false;

  /// Preset (Sabah/Öğleden sonra/Akşam) için bir kez üretilen somut saat.
  /// Aynı slot tekrar seçilirse yeniden random üretilmez.
  TimeOfDay? _lockedPresetTime;
  int? _lockedPresetIndex;

  @override
  void initState() {
    super.initState();
    final slot = widget.draft.practiceTimeOfDay;
    if (slot != null && slot.trim().isNotEmpty) {
      _selected = PracticeTimeOfDay.indexOf(slot);
      if (widget.draft.practiceWindowSet) {
        _windowStart = TimeOfDay(
          hour: widget.draft.reminderHour,
          minute: widget.draft.reminderMinute,
        );
        _windowEnd = TimeOfDay(
          hour: widget.draft.practiceWindowEndHour,
          minute: widget.draft.practiceWindowEndMinute,
        );
        if (!PracticeTimeOfDay.isFlexible(slot)) {
          _lockedPresetIndex = _selected;
          _lockedPresetTime = _windowStart;
        }
      }
    }
  }

  Future<void> _onSelect(int index) async {
    if (_saving) return;
    final slot = PracticeTimeOfDay.values[index];

    if (PracticeTimeOfDay.isFlexible(slot)) {
      setState(() => _selected = index);
      await _openFlexibleSheet();
      return;
    }

    // Sabah / Öğleden sonra / Akşam — sheet yok; bir kez random saat.
    final concrete = (_lockedPresetIndex == index && _lockedPresetTime != null)
        ? _lockedPresetTime!
        : PracticeTimeOfDay.randomConcreteTime(slot);

    setState(() {
      _selected = index;
      _lockedPresetIndex = index;
      _lockedPresetTime = concrete;
      _windowStart = concrete;
      _windowEnd = concrete;
    });
  }

  Future<void> _openFlexibleSheet() async {
    final defaults = PracticeTimeOfDay.defaultRange('flexible');
    final hasFlexibleWindow = _selected == PracticeTimeOfDay.indexOf('flexible') &&
        _windowStart != null &&
        _windowEnd != null &&
        widget.draft.practiceWindowSet &&
        PracticeTimeOfDay.isFlexible(widget.draft.practiceTimeOfDay);

    final result = await showSetPracticeTimeSheet(
      context,
      practiceTimeOfDay: 'flexible',
      initialStart: hasFlexibleWindow ? _windowStart : defaults.$1,
      initialEnd: hasFlexibleWindow ? _windowEnd : defaults.$2,
    );
    if (!mounted) return;
    if (result == null) {
      // Sheet iptal: seçimi geri al (pencere yoksa).
      if (_windowStart == null) {
        setState(() => _selected = null);
      }
      return;
    }

    setState(() {
      _windowStart = result.start;
      _windowEnd = result.end;
      _lockedPresetIndex = null;
      _lockedPresetTime = null;
    });
  }

  Future<void> _onSave() async {
    if (_saving || _selected == null || _windowStart == null || _windowEnd == null) {
      return;
    }
    await _persistAndContinue(
      start: _windowStart!,
      end: _windowEnd!,
      slotIndex: _selected!,
    );
  }

  Future<void> _persistAndContinue({
    required TimeOfDay start,
    required TimeOfDay end,
    required int slotIndex,
  }) async {
    if (_saving) return;
    setState(() => _saving = true);

    widget.draft.setPracticeTimeOfDayIndex(slotIndex);
    widget.draft.setPracticeWindow(
      startHour: start.hour,
      startMinute: start.minute,
      endHour: end.hour,
      endMinute: end.minute,
    );

    unawaited(
      AuthService.syncOnboardingDraft(widget.draft)
          .then((_) {})
          .catchError((_) {}),
    );

    if (!mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PromiseCommitmentScreen(draft: widget.draft),
      ),
    );
    if (mounted) setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current;
    final setup = text.setup;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final labels = [
      setup.practiceTimeMorning,
      setup.practiceTimeAfternoon,
      setup.practiceTimeEvening,
      setup.practiceTimeFlexible,
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const OnboardingStepHeader(
                step: 8,
                totalSteps: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10, 28, 10, 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            setup.practiceTimeTitle,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingSetupTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            setup.practiceTimeHint,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            style: AppTextStyles.onboardingSetupHint,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      for (var i = 0; i < labels.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _PracticeTimeTile(
                          label: labels[i],
                          iconAsset: PracticeTimeOfDay.iconAssets[i],
                          selected: i == _selected,
                          onTap: _saving ? null : () => unawaited(_onSelect(i)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFECECEC), width: 2),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    10,
                    16,
                    10,
                    bottomInset > 0 ? bottomInset + 10 : 30,
                  ),
                  child: PrimaryButton(
                    label: setup.practiceTimeSave,
                    onPressed: () {
                      if (_selected == null ||
                          _windowStart == null ||
                          _windowEnd == null ||
                          _saving) {
                        return;
                      }
                      unawaited(_onSave());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PracticeTimeTile extends StatelessWidget {
  const _PracticeTimeTile({
    required this.label,
    required this.iconAsset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? AppColors.primary : const Color(0xFFECECEC),
            ),
          ),
          child: Row(
            children: [
              HomeAsset(
                iconAsset,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 18 / 14,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
