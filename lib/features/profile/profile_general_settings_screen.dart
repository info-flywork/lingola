import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
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
import '../legal/legal_document_screen.dart';
import '../onboarding/onboarding_flow.dart';
import 'faq_screen.dart';
import 'profile_settings_screen.dart';

class ProfileGeneralSettingsScreen extends StatefulWidget {
  const ProfileGeneralSettingsScreen({super.key});

  @override
  State<ProfileGeneralSettingsScreen> createState() =>
      _ProfileGeneralSettingsScreenState();
}

class _ProfileGeneralSettingsScreenState
    extends State<ProfileGeneralSettingsScreen> {
  static const _deleteRed = Color(0xFFFF0000);

  static const _instagramUrl = 'https://www.instagram.com/lingolaapp';
  static const _tiktokUrl = 'https://www.tiktok.com/@lingolaapp';
  static const _flyworkUrl = 'https://fly-work.com/about/';

  var _displayName = '';
  var _certificates = CertificatesSummaryDto.empty();
  var _certificatesLoading = true;
  var _restoring = false;

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

  String get _appStoreShareUrl => Platform.isIOS
      ? 'https://apps.apple.com/app/id0000000000'
      : 'https://play.google.com/store/apps/details?id=com.flywork.lingolaapp';

  Future<void> _shareLingola() async {
    final text = AppText.current.profilePage;
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      '${text.shareInviteBody}\n$_appStoreShareUrl',
      subject: text.shareLingola,
      sharePositionOrigin: box == null
          ? null
          : box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Future<void> _openSocialUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _restorePurchases() async {
    if (_restoring) return;
    setState(() => _restoring = true);
    final restored = await PremiumService.restorePurchases();
    if (!mounted) return;
    setState(() => _restoring = false);
    final text = AppText.current.profilePage;
    final message = restored || PremiumService.isPremium
        ? text.restorePurchasesSuccess
        : text.restorePurchasesEmpty;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _showLogoutSheet(BuildContext context) async {
    final text = AppText.current.profilePage;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: .45),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (sheetContext) {
        final bottomInset = MediaQuery.paddingOf(sheetContext).bottom;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16, 24, 16, 30 + bottomInset),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFECECEC), width: 2),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HomeAsset(
                AppAssets.logoutWarning,
                width: 84,
                height: 84,
              ),
              const SizedBox(height: 16),
              Text(
                text.logoutTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  height: 22 / 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 24),
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final auth = AppText.current.auth;

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

              // Paylaş
              _SettingsSectionHeader(title: text.settingsShare),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    label: text.shareLingola,
                    trailing: const HomeAsset(
                      AppAssets.profileShare,
                      width: 24,
                      height: 20,
                    ),
                    onTap: () => unawaited(_shareLingola()),
                  ),
                  _SettingsTile(
                    label: text.settingsCertificates,
                    onTap: _certificatesLoading ? null : _openCertificate,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Hakkında
              _SettingsSectionHeader(title: text.settingsAbout),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    label: text.followInstagram,
                    trailing: const HomeAsset(
                      AppAssets.profileInstagram,
                      width: 28,
                      height: 28,
                    ),
                    onTap: () => unawaited(_openSocialUrl(_instagramUrl)),
                  ),
                  _SettingsTile(
                    label: text.followTikTok,
                    trailing: const HomeAsset(
                      AppAssets.profileTiktok,
                      width: 28,
                      height: 28,
                    ),
                    onTap: () => unawaited(_openSocialUrl(_tiktokUrl)),
                  ),
                  _SettingsTile(
                    label: text.aboutFlywork,
                    onTap: () => unawaited(_openSocialUrl(_flyworkUrl)),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Destek
              _SettingsSectionHeader(title: text.settingsSupport),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    label: text.rateUs,
                    labelSuffix: const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: HomeAsset(
                        AppAssets.profileRateHeart,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    onTap: () => unawaited(_openRateUs()),
                  ),
                  _SettingsTile(
                    label: text.restorePurchases,
                    onTap: _restoring
                        ? null
                        : () => unawaited(_restorePurchases()),
                  ),
                  _SettingsTile(
                    label: text.faqHelp,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const FaqScreen(),
                        ),
                      );
                    },
                  ),
                  _SettingsTile(
                    label: auth.privacy,
                    onTap: () => unawaited(
                      LegalDocumentSheet.open(
                        context,
                        LegalDocumentKind.privacy,
                      ),
                    ),
                  ),
                  _SettingsTile(
                    label: auth.terms,
                    onTap: () => unawaited(
                      LegalDocumentSheet.open(
                        context,
                        LegalDocumentKind.terms,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Hesap
              _SettingsSectionHeader(title: text.settingsAccount),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    label: text.logout,
                    trailing: const HomeAsset(
                      AppAssets.profileLogout,
                      width: 22,
                      height: 22,
                    ),
                    onTap: () => _showLogoutSheet(context),
                  ),
                  _SettingsTile(
                    label: text.deleteAccountAndData,
                    labelColor: _deleteRed,
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
        fontSize: 13,
        height: 20 / 13,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) ...[
                const SizedBox(height: 17.5),
                const Divider(
                  height: 1,
                  thickness: 0.3,
                  color: Color(0xFFC6C6C6),
                ),
                const SizedBox(height: 17.5),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: children[i],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.label,
    this.labelColor,
    this.labelSuffix,
    this.trailing,
    this.onTap,
  });

  final String label;
  final Color? labelColor;
  final Widget? labelSuffix;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        height: 16 / 14,
                        fontWeight: FontWeight.w500,
                        color: labelColor ?? AppColors.ink,
                      ),
                    ),
                  ),
                  ?labelSuffix,
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
