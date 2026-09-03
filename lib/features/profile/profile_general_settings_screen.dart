import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/auth/auth_service.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../certificate/certificate_api_service.dart';
import '../certificate/certificate_screen.dart';
import '../onboarding/onboarding_flow.dart';
import 'faq_screen.dart';
import 'profile_settings_screen.dart';
import 'share_friend_screen.dart';

class ProfileGeneralSettingsScreen extends StatefulWidget {
  const ProfileGeneralSettingsScreen({super.key});

  @override
  State<ProfileGeneralSettingsScreen> createState() =>
      _ProfileGeneralSettingsScreenState();
}

class _ProfileGeneralSettingsScreenState
    extends State<ProfileGeneralSettingsScreen> {
  static const _premiumOrange = Color(0xFFFF8D28);
  static const _premiumOrangeBg = Color(0xFFFFF1E4);
  static const _sharePurpleBg = Color(0xFFEEEDFE);
  static const _rateOrangeBg = Color(0xFFFFF1E8);
  static const _faqBg = Color(0xFFF3F4F6);
  static const _supportBg = Color(0xFFE8F1FF);
  static const _feedbackBg = Color(0xFFFFF6E8);
  static const _progressionBg = Color(0xFFFFEBEE);
  static const _logoutBg = Color(0xFFFFEBEB);

  static const _instagramUrl = 'https://www.instagram.com/lingolaapp';
  static const _tiktokUrl = 'https://www.tiktok.com/@lingolaapp';

  var _displayName = '';
  var _certificates = CertificatesSummaryDto.empty();
  var _certificatesLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _loadCertificates();
  }

  Future<void> _loadProfile() async {
    final user = await AuthService.restoreSession();
    if (!mounted) return;
    setState(() {
      _displayName = user == null ? 'Lingola' : AuthService.displayNameOf(user);
    });
  }

  Future<void> _loadCertificates() async {
    try {
      final data = await CertificateApiService.fetchMine();
      if (!mounted) return;
      setState(() {
        _certificates = data;
        _certificatesLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _certificatesLoading = false);
    }
  }

  void _openCertificate() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CertificateScreen(
          displayName: _displayName,
          summary: _certificates,
        ),
      ),
    );
  }

  Future<void> _openRateUs() async {
    final uri = Platform.isIOS
        ? Uri.parse('https://apps.apple.com/app/id0000000000')
        : Uri.parse(
            'https://play.google.com/store/apps/details?id=com.flywork.lingolaapp',
          );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static const _contactEmail = 'info@fly-work.com';

  Future<void> _openSupportEmail() async {
    final uri = Uri.parse('mailto:$_contactEmail');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_contactEmail)),
    );
  }

  Future<void> _openFeedbackEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: _contactEmail,
      queryParameters: {'subject': 'Lingola feedback'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_contactEmail)),
    );
  }

  Future<void> _openSocialUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
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

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const HomeAsset(
                      AppAssets.backArrow,
                      width: 24,
                      height: 24,
                    ),
                    tooltip: AppText.current.common.back,
                  ),
                  Text(
                    text.settings,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      height: 24 / 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _SettingsSectionHeader(title: text.settingsShare),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
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
                    icon: AppAssets.profileProgression,
                    iconBg: _progressionBg,
                    label: text.certificateTitle,
                    onTap: _certificatesLoading ? null : _openCertificate,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SettingsSectionHeader(title: text.settingsSupport),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: PremiumService.isPremiumListenable,
                    builder: (context, isPremium, _) {
                      return _SettingsTile(
                        icon: AppAssets.profileCrown,
                        iconBg: _premiumOrangeBg,
                        label: text.premium,
                        labelColor: _premiumOrange,
                        valueLabel: isPremium ? text.active : text.passive,
                        valueColor: _premiumOrange,
                        onTap: isPremium
                            ? null
                            : () => unawaited(
                                  PremiumService.presentPaywall(context),
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
                    onTap: () => unawaited(_openSupportEmail()),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileFeedback,
                    iconBg: _feedbackBg,
                    label: text.feedback,
                    onTap: () => unawaited(_openFeedbackEmail()),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SettingsSectionHeader(title: text.settingsAbout),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: AppAssets.profileInstagram,
                    label: text.followInstagram,
                    plainIcon: true,
                    iconWidth: 40,
                    iconHeight: 40,
                    onTap: () => unawaited(_openSocialUrl(_instagramUrl)),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileTiktok,
                    label: text.followTikTok,
                    plainIcon: true,
                    iconWidth: 40,
                    iconHeight: 40,
                    onTap: () => unawaited(_openSocialUrl(_tiktokUrl)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SettingsSectionHeader(title: text.settingsAccount),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: AppAssets.profileLogout,
                    iconBg: _logoutBg,
                    label: text.logout,
                    onTap: () => _showLogoutSheet(context),
                  ),
                  _SettingsTile(
                    icon: AppAssets.profileDeleteAccount,
                    iconBg: _logoutBg,
                    label: text.deleteAccount,
                    onTap: () => showProfileDeleteAccountSheet(context),
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

class _SettingsSectionHeader extends StatelessWidget {
  const _SettingsSectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w500,
        color: AppColors.ink.withValues(alpha: 0.5),
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
    required this.label,
    this.iconBg = Colors.transparent,
    this.plainIcon = false,
    this.labelColor,
    this.valueLabel,
    this.valueColor,
    this.iconWidth = 24,
    this.iconHeight = 24,
    this.onTap,
  });

  final String icon;
  final Color iconBg;
  final bool plainIcon;
  final String label;
  final Color? labelColor;
  final String? valueLabel;
  final Color? valueColor;
  final double iconWidth;
  final double iconHeight;
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
            plainIcon
                ? SizedBox(
                    width: 46,
                    height: 46,
                    child: Center(
                      child: HomeAsset(
                        icon,
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                  )
                : Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: HomeAsset(
                      icon,
                      width: iconWidth,
                      height: iconHeight,
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
