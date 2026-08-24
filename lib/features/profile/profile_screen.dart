import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/i18n/app_locale_sync.dart';
import '../../core/notifications/lingola_notification_service.dart';
import '../../core/auth/auth_service.dart';
import '../../core/auth/session_store.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../../widgets/user_avatar.dart';
import '../onboarding/onboarding_flow.dart';
import '../streak/streak_api_service.dart';
import 'faq_screen.dart';
import 'profile_settings_screen.dart';
import 'progress_screen.dart';
import 'select_language_screen.dart';
import 'share_friend_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _notifPurple = Color(0xFF9333EA);
  static const _notifPurpleBg = Color(0xFFF3E8FF);
  static const _langGreenBg = Color(0xFFE6F7F4);
  static const _premiumOrange = Color(0xFFFF8D28);
  static const _premiumOrangeBg = Color(0xFFFFF1E4);
  static const _sharePurpleBg = Color(0xFFEEEDFE);
  static const _rateOrangeBg = Color(0xFFFFF1E8);
  static const _faqBg = Color(0xFFF3F4F6);
  static const _supportBg = Color(0xFFE8F1FF);
  static const _feedbackBg = Color(0xFFFFF6E8);
  static const _progressionBg = Color(0xFFFFEBEE);
  static const _logoutBg = Color(0xFFFFEBEB);
  static const _settingsBlueBg = Color(0xFFE8ECFF);
  static const _streakDone = Color(0xFF2D46FF);
  static const _streakIdle = Color(0xFFD7D7D7);
  static const _badgeStart = Color(0xFF000088);

  var _streakStates = _streakStatesFromSummary(StreakSummaryDto.empty());
  var _notificationsOn = true;
  var _notificationsBusy = false;
  var _displayName = '';
  var _avatarUrl = '';
  var _appLocale = 'en';

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
      _notificationsOn = user.notificationsEnabled;
      _displayName = AuthService.displayNameOf(user);
      _avatarUrl = user.avatarUrl?.trim() ?? '';
      _appLocale = user.appLocale;
    });
  }

  Future<void> _loadProfile() async {
    final cached = await SessionStore.loadCachedUser();
    if (cached != null && mounted) {
      setState(() {
        _notificationsOn = cached.notificationsEnabled;
        _displayName = AuthService.displayNameOf(cached);
        _avatarUrl = cached.avatarUrl?.trim() ?? '';
        _appLocale = cached.appLocale;
      });
    }

    final user = await AuthService.restoreSession();
    if (!mounted) return;
    if (user != null) {
      setState(() {
        _notificationsOn = user.notificationsEnabled;
        _displayName = AuthService.displayNameOf(user);
        _avatarUrl = user.avatarUrl?.trim() ?? '';
        _appLocale = user.appLocale;
      });
    } else if (cached == null) {
      setState(() {
        _displayName = 'Lingola';
        _avatarUrl = '';
      });
    }
  }

  Future<void> _setNotifications(bool value) async {
    if (_notificationsBusy || _notificationsOn == value) return;
    final previous = _notificationsOn;
    setState(() {
      _notificationsOn = value;
      _notificationsBusy = true;
    });
    try {
      final user = await AuthService.setNotificationsEnabled(value);
      if (!mounted) return;
      setState(() {
        _notificationsOn = user.notificationsEnabled;
        _notificationsBusy = false;
      });
      await LingolaNotificationService.syncEnabled(user.notificationsEnabled);
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _notificationsOn = previous;
        _notificationsBusy = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notifications update failed: $err')),
      );
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
              Text(
                text.title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: UserAvatar(
                  size: 86,
                  avatarUrl: _avatarUrl,
                  displayName: _displayName,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  _displayName.isEmpty ? 'Lingola' : _displayName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 28 / 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: const LinearGradient(
                      colors: [_badgeStart, AppColors.primary],
                    ),
                  ),
                  child: Text(
                    text.freeVersion,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      height: 24 / 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
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
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: AppAssets.profileSettings,
                    iconBg: _settingsBlueBg,
                    label: text.profileSettings,
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ProfileSettingsScreen(),
                        ),
                      );
                      if (mounted) await _loadProfile();
                    },
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileNotification,
                    iconBg: _notifPurpleBg,
                    iconColor: _notifPurple,
                    label: text.notifications,
                    onTap: _notificationsBusy
                        ? null
                        : () => _setNotifications(!_notificationsOn),
                    trailing: Transform.scale(
                      scale: 0.75,
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 39,
                        height: 24,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Switch.adaptive(
                            value: _notificationsOn,
                            activeThumbColor: Colors.white,
                            activeTrackColor: AppColors.primary,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: _notificationsBusy
                                ? null
                                : _setNotifications,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileLangFlag,
                    iconBg: _langGreenBg,
                    label: text.appLanguage,
                    onTap: () async {
                      final selected = await Navigator.of(context)
                          .push<String>(
                        MaterialPageRoute<String>(
                          builder: (_) => SelectLanguageScreen(
                            initialCode: _appLocale,
                          ),
                        ),
                      );
                      if (selected == null || !mounted) return;
                      await AppLocaleSync.applyCode(selected);
                      if (!mounted) return;
                      setState(() => _appLocale = selected);
                      if (_notificationsOn) {
                        await LingolaNotificationService.rescheduleFromNow();
                      }
                      try {
                        await AuthService.updateProfile(appLocale: selected);
                      } catch (_) {}
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                text.general,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  height: 20 / 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: AppAssets.profileCrown,
                    iconBg: _premiumOrangeBg,
                    label: text.premium,
                    labelColor: _premiumOrange,
                    valueLabel: text.passive,
                    valueColor: _premiumOrange,
                    onTap: () => unawaited(_presentProfilePaywall(context)),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileShareFriends,
                    iconBg: _sharePurpleBg,
                    label: text.shareFriend,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ShareFriendScreen(),
                        ),
                      );
                    },
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileRateUs,
                    iconBg: _rateOrangeBg,
                    label: text.rateUs,
                    onTap: () => unawaited(_openRateUs()),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileFaq,
                    iconBg: _faqBg,
                    label: text.faq,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const FaqScreen(),
                        ),
                      );
                    },
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileSupport,
                    iconBg: _supportBg,
                    label: text.support,
                    onTap: () => _openSupportEmail(),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileFeedback,
                    iconBg: _feedbackBg,
                    label: text.feedback,
                    onTap: () => unawaited(_openFeedbackEmail()),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileProgression,
                    iconBg: _progressionBg,
                    label: text.progression,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ProgressScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _LogoutCard(
                label: text.logout,
                onTap: () => _showLogoutSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _presentProfilePaywall(BuildContext context) async {
    final hasKey = AppEnv.revenueCatIosPublicKey.isNotEmpty ||
        AppEnv.revenueCatAndroidPublicKey.isNotEmpty;
    if (!hasKey) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Paywall is not configured yet.')),
      );
      return;
    }
    try {
      await RevenueCatUI.presentPaywall(displayCloseButton: true);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
    }
  }

  Future<void> _openRateUs() async {
    final uri = Platform.isIOS
        ? Uri.parse('https://apps.apple.com/app/id0000000000')
        : Uri.parse(
            'https://play.google.com/store/apps/details?id=com.flywork.lingolaapp',
          );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _openSupportEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'support@fly-work.com',
    );
    await launchUrl(uri);
  }

  Future<void> _openFeedbackEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'feedback@fly-work.com',
      queryParameters: {'subject': 'Lingola feedback'},
    );
    await launchUrl(uri);
  }

  Future<void> _showLogoutSheet(BuildContext context) async {
    final text = AppText.current.profilePage;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: .35),
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 10, 16, 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFFECECEC), width: 2),
                left: BorderSide(color: Color(0xFFECECEC), width: 2),
                right: BorderSide(color: Color(0xFFECECEC), width: 2),
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _logoutBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const HomeAsset(
                    AppAssets.profileLogout,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        text.logoutTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 20 / 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        text.logoutBody,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          height: 18 / 14,
                          fontWeight: FontWeight.w300,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SecondaryButton(
                  label: text.logoutConfirm,
                  onPressed: () async {
                    Navigator.of(sheetContext).pop();
                    await AuthService.logout();
                    if (!context.mounted) return;
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(
                        builder: (_) => const SplashScreen(),
                      ),
                      (_) => false,
                    );
                  },
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  label: text.logoutCancel,
                  onPressed: () => Navigator.of(sheetContext).pop(),
                ),
              ],
            ),
          ),
        );
      },
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

class _LogoutCard extends StatelessWidget {
  const _LogoutCard({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border10),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _ProfileScreenState._logoutBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const HomeAsset(
                  AppAssets.profileLogout,
                  width: 22,
                  height: 22,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC10000),
                ),
              ),
            ],
          ),
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

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconBg,
    required this.label,
    this.iconColor,
    this.labelColor,
    this.valueLabel,
    this.valueColor,
    this.trailing,
    this.onTap,
  });

  final String icon;
  final Color iconBg;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final String? valueLabel;
  final Color? valueColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: HomeAsset(
                icon,
                width: 18,
                height: 18,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
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
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  height: 18 / 13,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.secondary,
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
