import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/auth/auth_service.dart';
import '../../core/constants/app_text.dart';
import '../../core/errors/api_error_localizer.dart';
import '../../core/notifications/lingola_notification_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'profile_emoji.dart';

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
  late bool _enabled;
  late DateTime _selectedTime;
  var _saving = false;

  @override
  void initState() {
    super.initState();
    _enabled = widget.initialEnabled;
    _selectedTime = DateTime(
      2020,
      1,
      1,
      widget.initialHour.clamp(0, 23),
      _snapMinute(widget.initialMinute),
    );
  }

  int _snapMinute(int minute) => (minute.clamp(0, 59) ~/ 15) * 15;

  Future<void> _save() async {
    if (_saving) return;
    final text = AppText.current.profilePage;
    setState(() => _saving = true);
    try {
      final user = await AuthService.updateDailyReminder(
        enabled: _enabled,
        hour: _selectedTime.hour,
        minute: _selectedTime.minute,
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 33,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(height: 18),
          profileTitleWithIcon(
            iconPath: AppAssets.profileDailyReminder,
            title: text.dailyReminder,
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text.remindMe,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 20 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.82,
                    alignment: Alignment.centerRight,
                    child: Switch.adaptive(
                      value: _enabled,
                      activeTrackColor: AppColors.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: _saving
                          ? null
                          : (value) => setState(() => _enabled = value),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.light,
                primaryColor: AppColors.primary,
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                minuteInterval: 15,
                initialDateTime: _selectedTime,
                onDateTimeChanged: (value) {
                  setState(() => _selectedTime = value);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottomInset),
            child: PrimaryButton(
              label: _saving ? '…' : text.reminderSave,
              onPressed: _saving ? () {} : _save,
            ),
          ),
        ],
      ),
    );
  }
}
