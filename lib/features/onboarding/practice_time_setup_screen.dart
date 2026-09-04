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
  late int _selected;
  late TimeOfDay _windowStart;
  late TimeOfDay _windowEnd;
  var _saving = false;
  var _windowConfirmed = false;

  @override
  void initState() {
    super.initState();
    _selected = PracticeTimeOfDay.indexOf(widget.draft.practiceTimeOfDay);
    final defaults =
        PracticeTimeOfDay.defaultRange(widget.draft.practiceTimeOfDay);
    _windowStart = TimeOfDay(
      hour: widget.draft.reminderHour,
      minute: widget.draft.reminderMinute,
    );
    _windowEnd = TimeOfDay(
      hour: widget.draft.practiceWindowEndHour,
      minute: widget.draft.practiceWindowEndMinute,
    );
    // Draft henüz ayarlanmadıysa dilim varsayılanını kullan.
    if (widget.draft.reminderHour ==
            PracticeTimeOfDay.reminderHourFor(widget.draft.practiceTimeOfDay) &&
        widget.draft.reminderMinute == 0 &&
        widget.draft.practiceWindowEndHour == defaults.$2.hour) {
      _windowStart = defaults.$1;
      _windowEnd = defaults.$2;
    }
  }

  Future<void> _openTimeSheet(int index) async {
    final slot = PracticeTimeOfDay.values[index];
    final defaults = PracticeTimeOfDay.defaultRange(slot);
    final sameSlot = index == _selected && _windowConfirmed;
    setState(() => _selected = index);

    final result = await showSetPracticeTimeSheet(
      context,
      practiceTimeOfDay: slot,
      initialStart: sameSlot ? _windowStart : defaults.$1,
      initialEnd: sameSlot ? _windowEnd : defaults.$2,
    );
    if (!mounted || result == null) return;

    setState(() {
      _windowStart = result.start;
      _windowEnd = result.end;
      _windowConfirmed = true;
    });
    widget.draft.setPracticeTimeOfDayIndex(index);
    widget.draft.setPracticeWindow(
      startHour: result.start.hour,
      startMinute: result.start.minute,
      endHour: result.end.hour,
      endMinute: result.end.minute,
    );
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);

    // Sheet açılmadan Kaydet'e basılırsa seçili dilimin varsayılanını kullan.
    if (!_windowConfirmed) {
      final defaults =
          PracticeTimeOfDay.defaultRange(PracticeTimeOfDay.values[_selected]);
      _windowStart = defaults.$1;
      _windowEnd = defaults.$2;
    }

    widget.draft.setPracticeTimeOfDayIndex(_selected);
    widget.draft.setPracticeWindow(
      startHour: _windowStart.hour,
      startMinute: _windowStart.minute,
      endHour: _windowEnd.hour,
      endMinute: _windowEnd.minute,
    );

    unawaited(
      AuthService.syncOnboardingDraft(widget.draft).then((_) {}).catchError((_) {}),
    );
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PromiseCommitmentScreen(draft: widget.draft),
      ),
    );
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  text.language.step(current: 8, total: 8),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: const LinearProgressIndicator(
                    minHeight: 13,
                    value: 1,
                    color: AppColors.primary,
                    backgroundColor: AppColors.border,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                  child: Column(
                    children: [
                      Text(
                        setup.practiceTimeTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.ink,
                          fontSize: 20,
                          height: 30 / 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        setup.practiceTimeHint,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.ink.withValues(alpha: 0.65),
                          fontSize: 16,
                          height: 20 / 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 28),
                      for (var i = 0; i < labels.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _PracticeTimeTile(
                          label: labels[i],
                          iconAsset: PracticeTimeOfDay.iconAssets[i],
                          selected: i == _selected,
                          onTap: () => unawaited(_openTimeSheet(i)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    bottomInset > 0 ? bottomInset + 6 : 16,
                  ),
                  child: PrimaryButton(
                    label: setup.practiceTimeSave,
                    onPressed: () => unawaited(_save()),
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
  final VoidCallback onTap;

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
