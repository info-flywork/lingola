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
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
  late final TextEditingController _nameController;
  var _saving = false;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(() {
      if (mounted) setState(() {});
    });
    _hydrateFrom(SessionStore.currentUser);
    _loadUser();
  }

  void _hydrateFrom(AppUser? user) {
    final name = user?.displayName?.trim() ?? '';
    _nameController.value = TextEditingValue(
      text: name,
      selection: TextSelection.collapsed(offset: name.length),
    );
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

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final hasText = _nameController.text.isNotEmpty;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          10,
          16,
          16 + MediaQuery.paddingOf(context).bottom,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 33,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HomeAsset(
                    AppAssets.profileEditPen,
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text.changeName,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      height: 24 / 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFD7DCFF)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        enabled: !_loading && !_saving,
                        autofocus: true,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink,
                        ),
                        cursorColor: AppColors.primary,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _onSave(),
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    if (hasText)
                      GestureDetector(
                        onTap: (_loading || _saving)
                            ? null
                            : () {
                                _nameController.clear();
                              },
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: Color(0xFFB0B4C3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: _saving ? '…' : text.saveTitle,
                onPressed: _onSave,
              ),
            ],
          ),
        ),
    );
  }
}

class _DeleteAccountSheet extends StatefulWidget {
  const _DeleteAccountSheet();

  @override
  State<_DeleteAccountSheet> createState() => _DeleteAccountSheetState();
}

enum _DeleteStep { gate, survey, offer, farewell }

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
  _DeleteStep _step = _DeleteStep.gate;
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
      case _DeleteStep.gate:
        setState(() => _step = _DeleteStep.survey);
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
    final isGate = _step == _DeleteStep.gate;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFECECEC), width: 2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isGate) ...[
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
          ],
          if (isGate)
            _buildGate(text)
          else
            Flexible(
              child: SingleChildScrollView(
                child: switch (_step) {
                  _DeleteStep.gate => const SizedBox.shrink(),
                  _DeleteStep.survey => _buildSurvey(text),
                  _DeleteStep.offer => _buildOffer(text),
                  _DeleteStep.farewell => _buildFarewell(text),
                },
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              (_step == _DeleteStep.offer ? 24 : 16) + bottomInset,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_busy)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: LinearProgressIndicator(minHeight: 2),
                  ),
                if (isGate) ...[
                  SecondaryButton(
                    label: text.deleteAccountAndData,
                    onPressed: () =>
                        setState(() => _step = _DeleteStep.survey),
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    label: text.confirmKeepGoing,
                    onPressed: _close,
                  ),
                ] else if (_step == _DeleteStep.offer) ...[
                  PrimaryButton(
                    label: text.acceptDiscountCta,
                    onPressed: () => _acceptOffer('discount_50_yearly'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          label: text.logoutCancel,
                          onPressed: _close,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SecondaryButton(
                          label: text.deleteCta,
                          onPressed: _onNext,
                        ),
                      ),
                    ],
                  ),
                ] else if (isFarewell)
                  SecondaryButton(
                    label: text.done,
                    onPressed: _finishAfterDeletion,
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
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
    );
  }

  Widget _buildGate(Translations$profilePage$en text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 4),
      child: Column(
        children: [
          const HomeAsset(
            AppAssets.profileDeleteAreYouSure,
            width: 72,
            height: 72,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text(
            text.confirmTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              height: 1,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text.confirmDeleteWarning,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              height: 22 / 18,
              fontWeight: FontWeight.w500,
              color: AppColors.ink.withValues(alpha: 0.36),
            ),
          ),
        ],
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
    // Figma: Are you sure? → keep list (icons) → 50% offer → Accept / Cancel / Delete
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0x0D000000), // #000000 @ 5%
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.confirmTitle,
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
                  text.confirmBody,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    height: 20 / 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.13,
                    color: AppColors.ink.withValues(alpha: 0.60),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
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
                _KeepIconRow(
                  iconAsset: AppAssets.profileDeleteOfferTutors,
                  label: text.keepCharacters,
                ),
                const SizedBox(height: 8),
                _KeepIconRow(
                  iconAsset: AppAssets.profileDeleteOfferVideo,
                  label: text.keepVideo,
                ),
                const SizedBox(height: 8),
                _KeepIconRow(
                  iconAsset: AppAssets.profileDeleteOfferLessons,
                  label: text.keepCourses,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const HomeAsset(
                    AppAssets.profileDeleteOfferTicket,
                    width: 38,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text.discountTitle,
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
                        text.discountSubtitle,
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
          ),
        ],
      ),
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

class _KeepIconRow extends StatelessWidget {
  const _KeepIconRow({
    required this.iconAsset,
    required this.label,
  });

  final String iconAsset;
  final String label;

  static const _tileBlue = Color(0x1A2D46FF); // #2D46FF @ 10%
  static const double _tileW = 38;
  static const double _tileH = 36;
  static const double _iconSize = 24; // Figma: 24×24

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: _tileW,
          height: _tileH,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _tileBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SizedBox(
                width: _iconSize,
                height: _iconSize,
                child: HomeAsset(
                  iconAsset,
                  width: _iconSize,
                  height: _iconSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              height: 22 / 13,
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
