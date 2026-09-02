import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/auth/app_user.dart';
import '../../core/auth/auth_service.dart';
import '../../core/auth/session_store.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import '../../widgets/user_avatar.dart';
import '../streak/streak_api_service.dart';
import '../onboarding/target_language_options.dart';
import 'daily_reminder_sheet.dart';
import '../onboarding/language_flag.dart';
import 'profile_general_settings_screen.dart';
import 'profile_emoji.dart';
import 'profile_option_sheet.dart';
import 'profile_settings_screen.dart';
import 'select_language_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _badgeStart = Color(0xFF000088);
  static const _streakDone = Color(0xFF2D46FF);
  static const _streakIdle = Color(0xFFD7D7D7);

  static const _accountTargetBg = Color(0xFFEFF6FF);
  static const _accountLevelBg = Color(0x1A28FFCB);
  static const _accountNativeBg = Color(0x1A284FFF);
  static const _accountInterestsBg = Color(0x1AFF28D8);
  static const _accountDailyGoalBg = Color(0x1AFF2828);
  static const _accountReminderBg = Color(0x1AFFC728);

  var _streakStates = _streakStatesFromSummary(StreakSummaryDto.empty());
  var _notificationsOn = true;
  var _notificationsBusy = false;
  var _reminderHour = 15;
  var _reminderMinute = 0;
  var _displayName = '';
  var _avatarUrl = '';
  var _explanationLanguage = 'native';
  var _targetLanguageCode = 'en';
  var _nativeLanguageCode = 'tr';
  var _level = CefrLevels.defaultLevel;
  var _goal = 'career';
  var _pace = DailyPace.defaultPace;
  var _onboardingBusy = false;
  var _uploadingAvatar = false;

  @override
  void initState() {
    super.initState();
    SessionStore.userListenable.addListener(_onSessionUserChanged);
    _loadProfile();
    _loadStreak();
  }

  static List<_StreakDayState> _streakStatesFromSummary(
    StreakSummaryDto summary,
  ) {
    if (summary.days.length == 7) {
      return summary.days.map(_mapStreakVisualState).toList();
    }
    return _streakStatesFromSummary(StreakSummaryDto.empty());
  }

  static _StreakDayState _mapStreakVisualState(StreakDayDto day) {
    switch (day.state) {
      case StreakDayVisualState.done:
        return _StreakDayState.done;
      case StreakDayVisualState.today:
        return _StreakDayState.today;
      case StreakDayVisualState.idle:
        return _StreakDayState.idle;
    }
  }

  Future<void> _loadStreak() async {
    try {
      final streak = await StreakApiService.fetch();
      if (!mounted) return;
      setState(() => _streakStates = _streakStatesFromSummary(streak));
    } catch (_) {}
  }

  @override
  void dispose() {
    SessionStore.userListenable.removeListener(_onSessionUserChanged);
    super.dispose();
  }

  void _onSessionUserChanged() {
    final user = SessionStore.userListenable.value;
    if (!mounted || user == null) return;
    setState(() {
      _applyUser(user);
    });
  }

  void _applyUser(AppUser user) {
    _notificationsOn = user.notificationsEnabled;
    _reminderHour = user.dailyReminderHour;
    _reminderMinute = user.dailyReminderMinute;
    _displayName = AuthService.displayNameOf(user);
    _avatarUrl = user.avatarUrl?.trim() ?? '';
    _explanationLanguage = user.onboarding?.explanationLanguage ?? 'native';
    _targetLanguageCode = user.onboarding?.targetLanguageCode ?? 'en';
    _nativeLanguageCode = user.onboarding?.nativeLanguageCode ?? 'tr';
    _level = CefrLevels.normalize(user.onboarding?.level);
    _goal = user.onboarding?.goal ?? 'career';
    _pace = DailyPace.normalize(user.onboarding?.pace);
  }

  Future<void> _loadProfile() async {
    final cached = await SessionStore.loadCachedUser();
    if (cached != null && mounted) {
      setState(() => _applyUser(cached));
    }

    final user = await AuthService.restoreSession();
    if (!mounted) return;
    if (user != null) {
      setState(() => _applyUser(user));
    } else if (cached == null) {
      setState(() {
        _displayName = 'Lingola';
        _avatarUrl = '';
      });
    }
  }

  Future<void> _openProfileSettings() async {
    final changed = await showProfileEditSheet(context);
    if (changed == true && mounted) {
      await _loadProfile();
    }
  }

  Future<void> _pickAvatarFromGallery() async {
    if (_uploadingAvatar) return;
    setState(() => _uploadingAvatar = true);
    try {
      final ok = await pickAndUploadProfileAvatar(context);
      if (ok && mounted) await _loadProfile();
    } finally {
      if (mounted) setState(() => _uploadingAvatar = false);
    }
  }

  Future<void> _openGeneralSettings() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const ProfileGeneralSettingsScreen(),
      ),
    );
    if (mounted) await _loadProfile();
  }

  String _languageLabel(String code) {
    final t = AppText.current;
    return switch (code) {
      'en' => t.language.english,
      'de' => t.targetLanguage.german,
      'fr' => t.language.french,
      'es' => t.language.spanish,
      'it' => t.targetLanguage.italian,
      'tr' => t.targetLanguage.turkish,
      'jp' || 'ja' => t.language.japanese,
      'ru' => t.language.russian,
      'hi' => t.targetLanguage.hindi,
      'pt' => t.targetLanguage.portuguese,
      'zh' => t.targetLanguage.simplifiedChinese,
      _ => t.language.english,
    };
  }

  String _levelLabel(String? level) => CefrLevels.displayCode(level);

  String _goalLabel(String? goal) {
    final ready = AppText.current.planReady;
    return switch (goal) {
      'travel' => ready.goalTravel,
      'livingAbroad' => ready.goalLiving,
      'studyingAbroad' => ready.goalStudying,
      'other' => ready.goalOther,
      _ => ready.goalCareer,
    };
  }

  String _paceLabel(String? pace) => DailyPace.label(AppText.current, pace);

  List<ProfileOption> _paceOptions() {
    return [
      for (var i = 0; i < DailyPace.values.length; i++)
        ProfileOption(
          id: DailyPace.values[i],
          label: DailyPace.label(AppText.current, DailyPace.values[i]),
          emoji: DailyPace.emojis[i],
        ),
    ];
  }

  Future<void> _updateOnboarding({
    String? explanationLanguage,
    String? targetLanguageCode,
    String? nativeLanguageCode,
    String? goal,
    String? level,
    String? pace,
  }) async {
    if (_onboardingBusy) return;
    setState(() => _onboardingBusy = true);
    try {
      final user = await AuthService.updateOnboarding(
        explanationLanguage: explanationLanguage,
        targetLanguageCode: targetLanguageCode,
        nativeLanguageCode: nativeLanguageCode,
        goal: goal,
        level: level,
        pace: pace != null ? DailyPace.normalize(pace) : null,
      );
      if (!mounted) return;
      setState(() => _applyUser(user));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.profilePage.explanationUpdateFailed)),
      );
    } finally {
      if (mounted) setState(() => _onboardingBusy = false);
    }
  }

  List<ProfileOption> _targetLanguageOptions() {
    return targetLanguageOptions(AppText.current)
        .map(
          (item) => ProfileOption(
            id: item.code,
            label: item.label,
            flagCode: item.code,
          ),
        )
        .toList();
  }

  List<ProfileOption> _levelOptions() {
    return [
      for (final level in CefrLevels.values)
        ProfileOption(
          id: level,
          label: CefrLevels.displayCode(level),
        ),
    ];
  }

  List<ProfileOption> _goalOptions() {
    final page = AppText.current.profilePage;
    return [
      ProfileOption(
        id: 'career',
        label: page.goalChipCareer,
        iconAsset: AppAssets.goalCareer,
      ),
      ProfileOption(
        id: 'travel',
        label: page.goalChipTravel,
        iconAsset: AppAssets.goalTravel,
      ),
      ProfileOption(
        id: 'livingAbroad',
        label: page.goalChipLiving,
        iconAsset: AppAssets.goalLivingAbroad,
      ),
      ProfileOption(
        id: 'studyingAbroad',
        label: page.goalChipStudying,
        iconAsset: AppAssets.goalStudyingAbroad,
      ),
      ProfileOption(
        id: 'other',
        label: page.goalChipOther,
        iconAsset: AppAssets.goalOther,
      ),
    ];
  }

  Future<void> _pickTargetLanguage() async {
    final text = AppText.current.profilePage;
    await showProfileOptionSheet(
      context,
      title: text.targetLanguageLabel,
      titleIcon: AppAssets.profileTargetLang,
      options: _targetLanguageOptions(),
      selectedId: _targetLanguageCode,
      columns: 3,
      gridIcons: true,
      readOnly: true,
    );
  }

  Future<void> _pickNativeLanguage() async {
    final selected = await Navigator.of(context).push<String>(
      MaterialPageRoute<String>(
        builder: (_) => SelectLanguageScreen(
          initialCode: _nativeLanguageCode,
          kind: LanguagePickerKind.nativeLanguage,
        ),
      ),
    );
    if (selected == null || selected == _nativeLanguageCode) return;
    await _updateOnboarding(nativeLanguageCode: selected);
  }

  Future<void> _pickLevel() async {
    final text = AppText.current.profilePage;
    final selected = await showProfileOptionSheet(
      context,
      title: text.languageLevel,
      titleIcon: AppAssets.profileLangLevel,
      options: _levelOptions(),
      selectedId: _level,
      columns: 3,
      compact: true,
    );
    if (selected == null || selected == _level) return;
    await _updateOnboarding(level: selected);
  }

  Future<void> _pickGoal() async {
    final text = AppText.current.profilePage;
    final selected = await showProfileOptionSheet(
      context,
      title: text.interests,
      titleIcon: AppAssets.profileHobbies,
      options: _goalOptions(),
      selectedId: _goal,
      columns: 3,
      gridIcons: true,
    );
    if (selected == null || selected == _goal) return;
    await _updateOnboarding(goal: selected);
  }

  Future<void> _pickPace() async {
    final text = AppText.current.profilePage;
    final selected = await showProfileOptionSheet(
      context,
      title: text.dailyGoal,
      titleIcon: AppAssets.profileDailyTarget,
      options: _paceOptions(),
      selectedId: _pace,
      columns: 3,
      gridIcons: true,
    );
    if (selected == null || selected == _pace) return;
    await _updateOnboarding(pace: selected);
  }

  String _reminderValueLabel() {
    final text = AppText.current.profilePage;
    if (!_notificationsOn) return text.reminderOff;
    final h = _reminderHour.toString().padLeft(2, '0');
    final m = _reminderMinute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Future<void> _openDailyReminderSheet() async {
    if (_notificationsBusy) return;
    final changed = await showDailyReminderSheet(
      context,
      enabled: _notificationsOn,
      hour: _reminderHour,
      minute: _reminderMinute,
    );
    if (changed == true && mounted) {
      await _loadProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final dayLabels = [
      text.days.mon,
      text.days.tue,
      text.days.wed,
      text.days.thu,
      text.days.fri,
      text.days.sat,
      text.days.sun,
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _openGeneralSettings,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: _ProfileSettingsIcon(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: _uploadingAvatar ? null : _openProfileSettings,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: PremiumService.isPremiumListenable,
                        builder: (context, isPremium, _) {
                          if (_uploadingAvatar) {
                            return const SizedBox(
                              width: 86,
                              height: 86,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          }
                          return UserAvatar(
                            size: 86,
                            avatarUrl: _avatarUrl,
                            displayName: _displayName,
                            showPremiumBadge: isPremium,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Material(
                        color: AppColors.primary,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: _uploadingAvatar ? null : _pickAvatarFromGallery,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            alignment: Alignment.center,
                            child: const HomeAsset(
                              AppAssets.profileCamera,
                              width: 14,
                              height: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: InkWell(
                  onTap: _openProfileSettings,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _displayName.isEmpty ? 'Lingola' : _displayName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            height: 28 / 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const HomeAsset(
                          AppAssets.profileEditPen,
                          width: 18,
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ValueListenableBuilder<bool>(
                  valueListenable: PremiumService.isPremiumListenable,
                  builder: (context, isPremium, _) {
                    if (isPremium) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          gradient: const LinearGradient(
                            colors: [_badgeStart, AppColors.primary],
                          ),
                        ),
                        child: Text(
                          text.premiumVersion,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            height: 24 / 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Text(
                        text.freeVersion,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          height: 24 / 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              _DayStreakCard(
                title: text.dayStreak,
                labels: dayLabels,
                states: _streakStates,
              ),
              const SizedBox(height: 24),
              Text(
                text.accountSettings,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 20 / 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 10),
              _LearnNativeToggleRow(
                label: text.learnInNativeLanguage,
                value: _explanationLanguage != 'english',
                busy: _onboardingBusy,
                onChanged: (value) {
                  final next = value ? 'native' : 'english';
                  if (next == _explanationLanguage) return;
                  unawaited(_updateOnboarding(explanationLanguage: next));
                },
              ),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: AppAssets.profileTargetLang,
                    iconBg: _accountTargetBg,
                    preserveIconColors: true,
                    label: text.targetLanguageLabel,
                    valueLabel: _languageLabel(_targetLanguageCode),
                    onTap: _onboardingBusy ? null : _pickTargetLanguage,
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileLangLevel,
                    iconBg: _accountLevelBg,
                    preserveIconColors: true,
                    label: text.languageLevel,
                    valueLabel: _levelLabel(_level),
                    onTap: _onboardingBusy ? null : _pickLevel,
                  ),
                  _SettingsTile(
                    iconFlagCode: _nativeLanguageCode,
                    iconBg: _accountNativeBg,
                    label: text.nativeLanguage,
                    valueLabel: _languageLabel(_nativeLanguageCode),
                    onTap: _onboardingBusy ? null : _pickNativeLanguage,
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileHobbies,
                    iconBg: _accountInterestsBg,
                    preserveIconColors: true,
                    label: text.interests,
                    valueLabel: _goalLabel(_goal),
                    onTap: _onboardingBusy ? null : _pickGoal,
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileDailyTarget,
                    iconBg: _accountDailyGoalBg,
                    preserveIconColors: true,
                    label: text.dailyGoal,
                    valueLabel: _paceLabel(_pace),
                    onTap: _onboardingBusy ? null : _pickPace,
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileDailyReminder,
                    iconBg: _accountReminderBg,
                    preserveIconColors: true,
                    label: text.dailyReminder,
                    valueLabel: _reminderValueLabel(),
                    onTap: _notificationsBusy ? null : _openDailyReminderSheet,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _StreakDayState { done, today, idle }

class _DayStreakCard extends StatelessWidget {
  const _DayStreakCard({
    required this.title,
    required this.labels,
    required this.states,
  });

  final String title;
  final List<String> labels;
  final List<_StreakDayState> states;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 22 / 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (var i = 0; i < labels.length; i++) ...[
                if (i > 0) const SizedBox(width: 6),
                Expanded(
                  child: _StreakDay(
                    label: labels[i],
                    state: states[i],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _StreakDay extends StatelessWidget {
  const _StreakDay({
    required this.label,
    required this.state,
  });

  final String label;
  final _StreakDayState state;

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Widget? child;

    switch (state) {
      case _StreakDayState.done:
        bg = _ProfileScreenState._streakDone;
        child = const Icon(Icons.check_rounded, size: 16, color: Colors.white);
      case _StreakDayState.today:
        bg = Colors.transparent;
        child = const HomeAsset(
          AppAssets.profileFireOrange,
          width: 29,
          height: 32,
        );
      case _StreakDayState.idle:
        bg = _ProfileScreenState._streakIdle;
        child = null;
    }

    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: child,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            height: 14 / 10,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class _ProfileSettingsIcon extends StatelessWidget {
  const _ProfileSettingsIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 32,
      height: 32,
      child: Center(
        child: HomeAsset(
          AppAssets.profileSettingsGear,
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(height: 16),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _LearnNativeToggleRow extends StatelessWidget {
  const _LearnNativeToggleRow({
    required this.label,
    required this.value,
    required this.busy,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final bool busy;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w500,
                color: AppColors.ink,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.78,
            alignment: Alignment.centerRight,
            child: Switch.adaptive(
              value: value,
              activeThumbColor: Colors.white,
              activeTrackColor: AppColors.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: busy ? null : onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    this.icon,
    this.iconEmoji,
    this.iconFlagCode,
    required this.iconBg,
    required this.label,
    this.iconColor,
    this.labelColor,
    this.valueLabel,
    this.valueColor,
    this.preserveIconColors = false,
    this.trailing,
    this.onTap,
  }) : assert(
         icon != null || iconEmoji != null || iconFlagCode != null,
         'icon, iconEmoji veya iconFlagCode gerekli',
       );

  final String? icon;
  final String? iconEmoji;
  final String? iconFlagCode;
  final Color iconBg;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final String? valueLabel;
  final Color? valueColor;
  final bool preserveIconColors;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: iconFlagCode != null
                  ? LanguageFlag.badge(iconFlagCode!, size: 22)
                  : iconEmoji != null
                  ? profileEmoji(iconEmoji!, size: 22)
                  : HomeAsset(
                      icon!,
                      width: 28,
                      height: 28,
                      color: preserveIconColors ? null : iconColor,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w500,
                  color: labelColor ?? AppColors.ink,
                ),
              ),
            ),
            if (valueLabel != null) ...[
              Text(
                valueLabel!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.ink.withValues(alpha: 0.35),
                ),
              ),
              const SizedBox(width: 6),
            ],
            if (trailing != null)
              trailing!
            else
              const HomeAsset(
                AppAssets.quizArrow,
                width: 6,
                height: 12,
                color: Color(0xFF828282),
              ),
          ],
        ),
      ),
    );
  }
}
