import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/auth/auth_service.dart';
import '../../core/constants/app_text.dart';
import '../../core/errors/api_error_localizer.dart';
import '../../core/notifications/lingola_notification_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';

Future<bool?> showDailyReminderSheet(
  BuildContext context, {
  required bool enabled,
  required int hour,
  required int minute,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    builder: (sheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
        ),
        child: _DailyReminderSheet(
          initialEnabled: enabled,
          initialHour: hour,
          initialMinute: minute,
        ),
      );
    },
  );
}

class _DailyReminderSheet extends StatefulWidget {
  const _DailyReminderSheet({
    required this.initialEnabled,
    required this.initialHour,
    required this.initialMinute,
  });

  final bool initialEnabled;
  final int initialHour;
  final int initialMinute;

  @override
  State<_DailyReminderSheet> createState() => _DailyReminderSheetState();
}

class _DailyReminderSheetState extends State<_DailyReminderSheet> {
  static const _minutes = [0, 15, 30, 45];
  static const _hours = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
    12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
  ];

  late bool _enabled;
  late int _hour;
  late int _minute;
  var _saving = false;

  late final FixedExtentScrollController _hourController;
  late final FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    _enabled = widget.initialEnabled;
    _hour = widget.initialHour.clamp(0, 23);
    _minute = _snapMinute(widget.initialMinute);
    _hourController = FixedExtentScrollController(initialItem: _hour);
    _minuteController = FixedExtentScrollController(
      initialItem: _minutes.indexOf(_minute).clamp(0, _minutes.length - 1),
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  int _snapMinute(int minute) {
    final snapped = (minute.clamp(0, 59) ~/ 15) * 15;
    return _minutes.contains(snapped) ? snapped : 0;
  }

  String _two(int value) => value.toString().padLeft(2, '0');

  Future<void> _save() async {
    if (_saving) return;
    final text = AppText.current.profilePage;
    setState(() => _saving = true);
    try {
      final user = await AuthService.updateDailyReminder(
        enabled: _enabled,
        hour: _hour,
        minute: _minute,
      );
      final granted =
          await LingolaNotificationService.syncEnabled(user.notificationsEnabled);
      if (!mounted) return;
      if (_enabled && !granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text.notificationsPermissionDenied)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(text.reminderSaved)),
        );
      }
      Navigator.of(context).pop(true);
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ApiErrorLocalizer.message(err))),
      );
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        // Figma: üst köşe radius yok
        border: Border(
          top: BorderSide(color: Color(0xFFECECEC), width: 2),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 16 + 7, 16, 30 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const HomeAsset(
                AppAssets.profileDailyReminder,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              Text(
                text.dailyReminder,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16 + 7),
          // Figma Frame 7: pad 12, radius 10, primary %10
          Container(
            width: double.infinity,
            height: 52,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryTint10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text.remindMe,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Switch.adaptive(
                  value: _enabled,
                  activeTrackColor: AppColors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: _saving
                      ? null
                      : (value) => setState(() => _enabled = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Liste tipi saat seçici (tekerlek değil)
          SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TimeColumn(
                  controller: _hourController,
                  values: _hours,
                  selected: _hour,
                  enabled: _enabled && !_saving,
                  format: _two,
                  onSelected: (value) => setState(() => _hour = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    ':',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      // Figma: ayraç siyah; seçili rakamlar primary
                      color: AppColors.ink.withValues(alpha: 0.25),
                    ),
                  ),
                ),
                _TimeColumn(
                  controller: _minuteController,
                  values: _minutes,
                  selected: _minute,
                  enabled: _enabled && !_saving,
                  format: _two,
                  onSelected: (value) => setState(() => _minute = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Figma Kaydet: 54 yükseklik, radius 10, shadow #0015B4
          _SaveButton(
            label: _saving ? '…' : text.reminderSave,
            onPressed: _saving ? null : _save,
          ),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  const _TimeColumn({
    required this.controller,
    required this.values,
    required this.selected,
    required this.enabled,
    required this.format,
    required this.onSelected,
  });

  final FixedExtentScrollController controller;
  final List<int> values;
  final int selected;
  final bool enabled;
  final String Function(int) format;
  final ValueChanged<int> onSelected;

  static const _itemExtent = 38.0;
  // Figma: seçili olmayan = #000 %25
  static final _idleColor = const Color(0xFF000000).withValues(alpha: 0.25);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Opacity(
        opacity: enabled ? 1 : 0.45,
        child: ListWheelScrollView.useDelegate(
          controller: controller,
          itemExtent: _itemExtent,
          perspective: 0.0001,
          diameterRatio: 100,
          physics: enabled
              ? const FixedExtentScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          onSelectedItemChanged: enabled
              ? (index) {
                  final i = index % values.length;
                  onSelected(values[i < 0 ? i + values.length : i]);
                }
              : null,
          // Döngü: 00 seçiliyken üstte de 45/30 görünsün (boş kalmasın)
          childDelegate: ListWheelChildLoopingListDelegate(
            children: [
              for (final value in values)
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    width: 60,
                    height: _itemExtent,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: value == selected
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
                        fontWeight: FontWeight.w600,
                        color: value == selected
                            ? AppColors.primary
                            : _idleColor,
                      ),
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

/// Figma Kaydet — 54px, radius 10, solid shadow #0015B4 (y:4).
class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(bottom: 4),
      child: SizedBox(
        height: 54,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
