import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../core/constants/practice_time_of_day.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class PracticeTimeWindow {
  const PracticeTimeWindow({required this.start, required this.end});

  final TimeOfDay start;
  final TimeOfDay end;
}

Future<PracticeTimeWindow?> showSetPracticeTimeSheet(
  BuildContext context, {
  required String practiceTimeOfDay,
  TimeOfDay? initialStart,
  TimeOfDay? initialEnd,
}) {
  final defaults = PracticeTimeOfDay.defaultRange(practiceTimeOfDay);
  return showModalBottomSheet<PracticeTimeWindow>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    builder: (sheetContext) {
      return _SetPracticeTimeSheet(
        initialStart: initialStart ?? defaults.$1,
        initialEnd: initialEnd ?? defaults.$2,
      );
    },
  );
}

class _SetPracticeTimeSheet extends StatefulWidget {
  const _SetPracticeTimeSheet({
    required this.initialStart,
    required this.initialEnd,
  });

  final TimeOfDay initialStart;
  final TimeOfDay initialEnd;

  @override
  State<_SetPracticeTimeSheet> createState() => _SetPracticeTimeSheetState();
}

class _SetPracticeTimeSheetState extends State<_SetPracticeTimeSheet> {
  /// Figma: saat 00–11 (hour % 12), dakika 00–59, AM/PM.
  static const _hours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  static const _minutes = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,
    38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55,
    56, 57, 58, 59,
  ];

  late TimeOfDay _start;
  late TimeOfDay _end;
  var _editingStart = true;

  late FixedExtentScrollController _hourCtrl;
  late FixedExtentScrollController _minuteCtrl;
  late FixedExtentScrollController _periodCtrl;

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
    final active = _start;
    _hourCtrl = FixedExtentScrollController(initialItem: active.hour % 12);
    _minuteCtrl = FixedExtentScrollController(initialItem: active.minute);
    _periodCtrl = FixedExtentScrollController(
      initialItem: active.period == DayPeriod.am ? 0 : 1,
    );
  }

  @override
  void dispose() {
    _hourCtrl.dispose();
    _minuteCtrl.dispose();
    _periodCtrl.dispose();
    super.dispose();
  }

  int _displayHour(TimeOfDay t) => t.hour % 12;

  TimeOfDay _fromParts(int hour12, int minute, DayPeriod period) {
    final h = period == DayPeriod.am ? hour12 % 12 : (hour12 % 12) + 12;
    return TimeOfDay(hour: h, minute: minute.clamp(0, 59));
  }

  void _syncControllers(TimeOfDay t) {
    _hourCtrl.jumpToItem(_displayHour(t));
    _minuteCtrl.jumpToItem(t.minute);
    _periodCtrl.jumpToItem(t.period == DayPeriod.am ? 0 : 1);
  }

  void _selectEndpoint({required bool start}) {
    if (_editingStart == start) return;
    setState(() {
      _editingStart = start;
      _syncControllers(start ? _start : _end);
    });
  }

  void _applyPicker({int? hour12, int? minute, DayPeriod? period}) {
    final current = _editingStart ? _start : _end;
    final next = _fromParts(
      hour12 ?? _displayHour(current),
      minute ?? current.minute,
      period ?? current.period,
    );
    setState(() {
      if (_editingStart) {
        _start = next;
      } else {
        _end = next;
      }
    });
  }

  String _periodLabel(DayPeriod period) {
    final setup = AppText.current.setup;
    return period == DayPeriod.am ? setup.periodAm : setup.periodPm;
  }

  String _clock(TimeOfDay t) {
    final h = _displayHour(t).toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _two(int value) => value.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.setup;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.82;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: maxHeight),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Başlık + sağ üst çarpı (yazıdan ayrı)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
                    child: Column(
                      children: [
                        Text(
                          text.setPracticeTimeTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          text.setPracticeTimeHint,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            height: 24 / 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.32,
                            color:
                                const Color(0xFF1A1714).withValues(alpha: 0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE1E1E1),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 16,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _RangeTimeLabel(
                  clock: _clock(_start),
                  period: _periodLabel(_start.period),
                  selected: _editingStart,
                  onTap: () => _selectEndpoint(start: true),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.ink,
                  ),
                ),
                _RangeTimeLabel(
                  clock: _clock(_end),
                  period: _periodLabel(_end.period),
                  selected: !_editingStart,
                  onTap: () => _selectEndpoint(start: false),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Düz liste seçici (tekerlek efekti yok) — 00 yanında 00 hizalı
            SizedBox(
              height: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FlatTimeColumn(
                    controller: _hourCtrl,
                    values: _hours,
                    selected: _displayHour(
                      _editingStart ? _start : _end,
                    ),
                    format: _two,
                    onSelected: (value) => _applyPicker(hour12: value),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      ':',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        height: 1,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  _FlatTimeColumn(
                    controller: _minuteCtrl,
                    values: _minutes,
                    selected: (_editingStart ? _start : _end).minute,
                    format: _two,
                    onSelected: (value) => _applyPicker(minute: value),
                  ),
                  const SizedBox(width: 12),
                  _FlatTimeColumn(
                    controller: _periodCtrl,
                    values: const [0, 1],
                    selected:
                        (_editingStart ? _start : _end).period == DayPeriod.am
                            ? 0
                            : 1,
                    format: (i) =>
                        i == 0 ? text.periodAm : text.periodPm,
                    width: 72,
                    itemFontWeight: FontWeight.w400,
                    onSelected: (value) => _applyPicker(
                      period: value == 0 ? DayPeriod.am : DayPeriod.pm,
                    ),
                  ),
                ],
              ),
            ),
            // Figma Frame 333: üst border + pad 16/10/30 + 54px buton
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
                  label: AppText.current.common.continueLabel,
                  onPressed: () {
                    Navigator.of(context).pop(
                      PracticeTimeWindow(start: _start, end: _end),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RangeTimeLabel extends StatelessWidget {
  const _RangeTimeLabel({
    required this.clock,
    required this.period,
    required this.selected,
    required this.onTap,
  });

  final String clock;
  final String period;
  final bool selected;
  final VoidCallback onTap;

  static const _letterSpacing = 32 * -0.02;
  static const _height = 24 / 32;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? AppColors.primary
        : const Color(0xFF1A1714).withValues(alpha: 0.65);
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: clock,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                height: _height,
                fontWeight: FontWeight.w600,
                letterSpacing: _letterSpacing,
                color: color,
              ),
            ),
            TextSpan(
              text: ' $period',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                height: _height,
                fontWeight: FontWeight.w400,
                letterSpacing: _letterSpacing,
                color: color,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Liste tipi sütun — perspective/diameter ile düz; tekerlek eğimi yok.
class _FlatTimeColumn extends StatelessWidget {
  const _FlatTimeColumn({
    required this.controller,
    required this.values,
    required this.selected,
    required this.format,
    required this.onSelected,
    this.width = 60,
    this.itemFontWeight = FontWeight.w600,
  });

  final FixedExtentScrollController controller;
  final List<int> values;
  final int selected;
  final String Function(int) format;
  final ValueChanged<int> onSelected;
  final double width;
  final FontWeight itemFontWeight;

  static const _itemExtent = 38.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: _itemExtent,
        perspective: 0.0001,
        diameterRatio: 100,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => onSelected(values[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: values.length,
          builder: (context, index) {
            final value = values[index];
            final isSelected = value == selected;
            return Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                width: width,
                height: _itemExtent,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryTint10
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  format(value),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 1,
                    fontWeight: itemFontWeight,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.ink.withValues(alpha: 0.25),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
