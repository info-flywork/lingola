import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/auth/app_user.dart';
import '../../core/auth/auth_service.dart';
import '../../core/auth/session_store.dart';
import '../../core/premium/premium_service.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/errors/api_error_localizer.dart';
import '../../core/theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../onboarding/onboarding_flow.dart';

/// Galeriden profil fotoğrafı seçip yükler. Başarılı olursa `true` döner.
Future<bool> pickAndUploadProfileAvatar(BuildContext context) async {
  final text = AppText.current.profilePage;
  final picker = ImagePicker();
  final file = await picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1024,
    maxHeight: 1024,
    imageQuality: 85,
  );
  if (file == null) return false;

  try {
    final bytes = await file.readAsBytes();
    final path = file.path.toLowerCase();
    final mime = path.endsWith('.png')
        ? 'image/png'
        : path.endsWith('.webp')
            ? 'image/webp'
            : 'image/jpeg';
    await AuthService.uploadAvatar(
      bytes: bytes,
      contentType: mime,
    );
    if (!context.mounted) return false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text.profilePhotoUpdated)),
    );
    return true;
  } catch (err) {
    if (!context.mounted) return false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ApiErrorLocalizer.message(err))),
    );
    return false;
  }
}

Future<void> showProfileDeleteAccountSheet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .45),
    builder: (sheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
        ),
        child: const _DeleteAccountSheet(),
      );
    },
  );
}

Future<bool?> showProfileEditSheet(BuildContext context) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .45),
    builder: (sheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
        ),
        child: const _ProfileEditSheet(),
      );
    },
  );
}

class _ProfileEditSheet extends StatefulWidget {
  const _ProfileEditSheet();

  @override
  State<_ProfileEditSheet> createState() => _ProfileEditSheetState();
}

class _ProfileEditSheetState extends State<_ProfileEditSheet> {
  static const _deleteRed = Color(0xFFEF3F3F);
  static const _fieldRadius = 10.0;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  var _saving = false;
  var _loading = true;
  var _uploadingAvatar = false;
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _hydrateFrom(SessionStore.currentUser);
    _loadUser();
  }

  void _hydrateFrom(AppUser? user) {
    final name = user?.displayName?.trim() ?? '';
    final email = user?.email?.trim() ?? '';
    _nameController.value = TextEditingValue(
      text: name,
      selection: TextSelection.collapsed(offset: name.length),
    );
    _emailController.value = TextEditingValue(
      text: email,
      selection: TextSelection.collapsed(offset: email.length),
    );
    _avatarUrl = user?.avatarUrl;
  }

  Future<void> _loadUser() async {
    setState(() => _loading = true);
    final cached = await SessionStore.loadCachedUser();
    if (mounted && cached != null) {
      setState(() => _hydrateFrom(cached));
    }

    final user = await AuthService.restoreSession();
    if (!mounted) return;
    setState(() {
      _hydrateFrom(user ?? cached ?? SessionStore.currentUser);
      _loading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    FocusScope.of(context).unfocus();
    if (_saving || _loading) return;

    final text = AppText.current.profilePage;
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.nameCannotBeEmpty)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final updated = await AuthService.updateProfile(displayName: name);
      if (!mounted) return;
      _hydrateFrom(updated);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.profileSaved)),
      );
      Navigator.of(context).pop(true);
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ApiErrorLocalizer.message(err))),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _pickAndUploadAvatar() async {
    if (_uploadingAvatar || _loading) return;
    setState(() => _uploadingAvatar = true);
    try {
      final ok = await pickAndUploadProfileAvatar(context);
      if (!mounted || !ok) return;
      setState(() => _hydrateFrom(SessionStore.currentUser));
    } finally {
      if (mounted) setState(() => _uploadingAvatar = false);
    }
  }

  Widget _buildAvatar() {
    final url = _avatarUrl?.trim();
    final image = (url != null && url.isNotEmpty)
        ? ClipOval(
            child: Image.network(
              url,
              width: 86,
              height: 86,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const HomeAsset(
                AppAssets.profileAvatar,
                width: 86,
                height: 86,
              ),
            ),
          )
        : const HomeAsset(
            AppAssets.profileAvatar,
            width: 86,
            height: 86,
          );

    return SizedBox(
      width: 92,
      height: 92,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: _uploadingAvatar
                ? const SizedBox(
                    width: 86,
                    height: 86,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : image,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 1,
              shadowColor: Colors.black26,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: _uploadingAvatar ? null : _pickAndUploadAvatar,
                child: const SizedBox(
                  width: 32,
                  height: 32,
                  child: Center(
                    child: HomeAsset(
                      AppAssets.profileCamera,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteAccountSheet(BuildContext context) async {
    await showProfileDeleteAccountSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.92,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
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
            const SizedBox(height: 14),
            Text(
              text.profileSettings,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                height: 24 / 18,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Column(
                  children: [
                    Center(child: _buildAvatar()),
                    const SizedBox(height: 24),
                    _LabeledField(
                      label: text.fullName,
                      child: _InputBox(
                        child: TextField(
                          controller: _nameController,
                          enabled: !_loading && !_saving,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            height: 18 / 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                          cursorColor: AppColors.primary,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _LabeledField(
                      label: text.email,
                      child: _InputBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                enabled: false,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  height: 18 / 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondary,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: _loading ? '…' : '—',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                            ),
                            const HomeAsset(
                              AppAssets.profileLock,
                              width: 16,
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _showDeleteAccountSheet(context),
                        borderRadius: BorderRadius.circular(_fieldRadius),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const HomeAsset(
                                AppAssets.profileDeleteAccount,
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                text.deleteAccount,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  height: 21 / 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.28,
                                  color: _deleteRed,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottomInset),
              child: PrimaryButton(
                label: _saving ? '…' : text.save,
                onPressed: _onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 18 / 14,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

class _InputBox extends StatelessWidget {
  const _InputBox({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class _DeleteAccountSheet extends StatefulWidget {
  const _DeleteAccountSheet();

  @override
  State<_DeleteAccountSheet> createState() => _DeleteAccountSheetState();
}

enum _DeleteStep { survey, offer, farewell }

class _DeleteAccountSheetState extends State<_DeleteAccountSheet> {
  static const _border = Color(0x0D000000);

  static const _reasonCodes = <String>[
    'ai_characters',
    'video_issues',
    'pricing',
    'no_match',
    'short_trial',
    'other',
  ];

  final _messageController = TextEditingController();
  int? _selectedIndex;
  _DeleteStep _step = _DeleteStep.survey;
  var _busy = false;
  String _accessUntilLabel = '—';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _close() => Navigator.of(context).pop();

  Future<void> _finishAfterDeletion() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await AuthService.logout();
      if (!mounted) return;
      final rootNav = Navigator.of(context, rootNavigator: true);
      rootNav.pop();
      rootNav.pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (_) => const SplashScreen()),
        (_) => false,
      );
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not sign out: $err')),
      );
      setState(() => _busy = false);
    }
  }

  Future<void> _acceptOffer(String offerType) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await AuthService.acceptRetentionOffer(offerType);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Offer saved — glad you\'re staying!')),
      );
      _close();
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not save offer: $err')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirmDeletion() async {
    if (_busy) return;
    final index = _selectedIndex;
    if (index == null || index < 0 || index >= _reasonCodes.length) return;

    final text = AppText.current.profilePage;
    final reasons = [
      text.deleteReasons.aiCharacters,
      text.deleteReasons.videoIssues,
      text.deleteReasons.pricing,
      text.deleteReasons.noMatch,
      text.deleteReasons.shortTrial,
      text.deleteReasons.other,
    ];

    setState(() => _busy = true);
    try {
      final result = await AuthService.requestAccountDeletion(
        reasonCode: _reasonCodes[index],
        reasonLabel: reasons[index],
        message: _messageController.text,
      );
      if (!mounted) return;
      await PremiumService.logOut();
      setState(() {
        _accessUntilLabel = AuthService.formatAccessDate(result.accessUntil);
        _step = _DeleteStep.farewell;
      });
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not delete account: $err')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _reactivate() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await AuthService.reactivateAccount();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Welcome back — account reactivated')),
      );
      _close();
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not reactivate: $err')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _onNext() async {
    if (_busy) return;
    switch (_step) {
      case _DeleteStep.survey:
        if (_selectedIndex == null) return;
        setState(() => _step = _DeleteStep.offer);
      case _DeleteStep.offer:
        await _confirmDeletion();
      case _DeleteStep.farewell:
        await _finishAfterDeletion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final canNext =
        !_busy && (_step != _DeleteStep.survey || _selectedIndex != null);
    final isFarewell = _step == _DeleteStep.farewell;

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
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
            const SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: switch (_step) {
                  _DeleteStep.survey => _buildSurvey(text),
                  _DeleteStep.offer => _buildOffer(text),
                  _DeleteStep.farewell => _buildFarewell(text),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_busy)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: LinearProgressIndicator(minHeight: 2),
                    ),
                  if (_step == _DeleteStep.offer) ...[
                    PrimaryButton(
                      label: text.switchMonthlyCta,
                      onPressed: () => _acceptOffer('monthly_plan'),
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      label: text.acceptDiscountCta,
                      onPressed: () => _acceptOffer('discount_60'),
                    ),
                    const SizedBox(height: 10),
                  ],
                  if (isFarewell)
                    SecondaryButton(
                      label: text.done,
                      onPressed: _finishAfterDeletion,
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: _step == _DeleteStep.survey
                              ? PrimaryButton(
                                  label: text.logoutCancel,
                                  onPressed: _close,
                                )
                              : SecondaryButton(
                                  label: text.logoutCancel,
                                  onPressed: _close,
                                ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Opacity(
                            opacity: canNext ? 1 : 0.55,
                            child: IgnorePointer(
                              ignoring: !canNext,
                              child: SecondaryButton(
                                label: text.next,
                                onPressed: _onNext,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSurvey(Translations$profilePage$en text) {
    final reasons = [
      text.deleteReasons.aiCharacters,
      text.deleteReasons.videoIssues,
      text.deleteReasons.pricing,
      text.deleteReasons.noMatch,
      text.deleteReasons.shortTrial,
      text.deleteReasons.other,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SheetHeader(title: text.deleteTitle, body: text.deleteBody),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _border),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              for (var i = 0; i < reasons.length; i++) ...[
                if (i > 0) const SizedBox(height: 8),
                _ReasonOption(
                  label: reasons[i],
                  selected: _selectedIndex == i,
                  onTap: () => setState(() => _selectedIndex = i),
                ),
              ],
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text.messageOptional,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 14 / 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ink,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(minHeight: 51),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _border),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _messageController,
                  maxLines: 3,
                  minLines: 2,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.ink,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: text.messageHint,
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      height: 16 / 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      ],
    );
  }

  Widget _buildOffer(Translations$profilePage$en text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SheetHeader(
          title: text.specialOfferTitle,
          body: text.specialOfferBody,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _border),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const HomeAsset(
                              AppAssets.profilePremiumIconDeleteAccount,
                              width: 48,
                              height: 48,
                            ),
                            Positioned(
                              right: -4,
                              bottom: -4,
                              child: const HomeAsset(
                                AppAssets.profileCornesTik,
                                width: 21,
                                height: 21,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                text.monthlyPlanTitle,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  height: 18 / 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ink,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                text.monthlyPlanPrice,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  height: 16 / 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      text.monthlyPlanDesc,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        height: 16 / 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _border),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _WhatYoullKeepTitle(),
                    const SizedBox(height: 10),
                    _KeepCheckRow(label: text.keepCharacters),
                    const SizedBox(height: 8),
                    _KeepCheckRow(label: text.keepVideo),
                    const SizedBox(height: 8),
                    _KeepCheckRow(label: text.keepCourses),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFarewell(Translations$profilePage$en text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SheetHeader(
          title: text.farewellTitle,
          body: text.farewellBody(date: _accessUntilLabel),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: _border),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.changeMindTitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    height: 18 / 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  text.changeMindBody(date: _accessUntilLabel),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _reactivate,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: _border),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const HomeAsset(
                            AppAssets.profileChain,
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              text.reactivateCta,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                height: 16 / 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SheetHeader extends StatelessWidget {
  const _SheetHeader({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withValues(alpha: .05),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 18 / 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatYoullKeepTitle extends StatelessWidget {
  const _WhatYoullKeepTitle();

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    return Row(
      children: [
        const HomeAsset(
          AppAssets.profileStarsGroup,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text.whatYoullKeep,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              height: 18 / 13,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _KeepCheckRow extends StatelessWidget {
  const _KeepCheckRow({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HomeAsset(
          AppAssets.profileDeleteAccountTik,
          width: 17,
          height: 17,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _ReasonOption extends StatelessWidget {
  const _ReasonOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColors.primary : AppColors.secondary,
                  width: selected ? 5 : 1.5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  height: 14 / 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
