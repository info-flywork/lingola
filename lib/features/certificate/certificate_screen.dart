import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'certificate_api_service.dart';
import 'certificate_copy.dart';
import 'certificate_image_export.dart';
import 'certificate_level_assets.dart';
import 'certificate_qr_share.dart';

/// Tam ekran sertifika görünümü — kazanılmış veya önizleme modu.
class CertificateScreen extends StatefulWidget {
  const CertificateScreen({
    super.key,
    required this.displayName,
    this.summary,
    this.initialLevel,
  });

  final String displayName;
  final CertificatesSummaryDto? summary;
  final String? initialLevel;

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late CertificatesSummaryDto _summary;
  late bool _loading;
  late String _selectedLevel;
  final _exportKey = GlobalKey();
  var _downloading = false;
  var _sharingQr = false;

  @override
  void initState() {
    super.initState();
    _summary = widget.summary ?? CertificatesSummaryDto.empty();
    _loading = widget.summary == null;
    _selectedLevel = widget.initialLevel ??
        widget.summary?.primary?.cefrLevel ??
        widget.summary?.highestLevel ??
        'A1';
    if (widget.summary == null) {
      _load();
    }
  }

  Future<void> _load() async {
    try {
      final data = await CertificateApiService.fetchMine();
      if (!mounted) return;
      setState(() {
        _summary = data;
        _loading = false;
        if (_selectedLevel.isEmpty && data.primary != null) {
          _selectedLevel = data.primary!.cefrLevel;
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  CertificateDto? get _activeCert {
    if (_summary.certificates.isEmpty) return null;
    for (final c in _summary.certificates.reversed) {
      if (c.cefrLevel == _selectedLevel) return c;
    }
    return _summary.primary;
  }

  bool get _hasCertificate => _summary.certificates.isNotEmpty;

  bool get _canUseCertificate {
    final cert = _activeCert;
    if (cert == null) return false;
    return cert.cefrLevel == _selectedLevel;
  }

  String get _levelCode =>
      _selectedLevel.isNotEmpty ? _selectedLevel : 'A1';

  Future<void> _showCertificateLocked() async {
    final text = AppText.current.profilePage;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          text.certificateNotAvailableTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          text.certificateNotAvailable(level: _levelCode),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 21 / 14,
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(text.certificateNotAvailableOk),
          ),
        ],
      ),
    );
  }

  Future<void> _download() async {
    if (_downloading) return;
    if (!_canUseCertificate) {
      _showCertificateLocked();
      return;
    }
    setState(() => _downloading = true);
    final text = AppText.current.profilePage;
    try {
      final ok = await CertificateImageExport.saveToGallery(
        boundaryKey: _exportKey,
        fileName:
            'lingola_certificate_${_selectedLevel.toLowerCase()}_${DateTime.now().millisecondsSinceEpoch}',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ok ? text.certificateDownloadSaved : text.certificateDownloadFailed,
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  Future<void> _share() async {
    if (!_canUseCertificate) {
      _showCertificateLocked();
      return;
    }
    final cert = _activeCert;
    if (cert == null) return;
    final text = CertificateCopy.page;
    await Share.share(
      '${text.certificateShareBody(level: cert.cefrLevel)}\n${cert.verifyUrl}',
      subject: text.certificateShareSubject(level: cert.cefrLevel),
    );
  }

  Future<void> _shareQr() async {
    if (!_canUseCertificate) {
      _showCertificateLocked();
      return;
    }
    final cert = _activeCert;
    if (cert == null || _sharingQr) return;
    final text = CertificateCopy.page;
    setState(() => _sharingQr = true);
    try {
      final ok = await CertificateQrShare.share(
        context: context,
        verifyUrl: cert.verifyUrl,
        shareText:
            '${text.certificateShareBody(level: cert.cefrLevel)}\n${cert.verifyUrl}',
        subject: text.certificateShareSubject(level: cert.cefrLevel),
      );
      if (!ok && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppText.current.common.genericError)),
        );
      }
    } finally {
      if (mounted) setState(() => _sharingQr = false);
    }
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
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
                    const Spacer(),
                    IconButton(
                      onPressed: _downloading ? null : _download,
                      icon: _downloading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.ink,
                              ),
                            )
                          : const HomeAsset(
                              AppAssets.certificateDownload,
                              width: 24,
                              height: 24,
                            ),
                      tooltip: text.certificateDownload,
                    ),
                  ],
                ),
              ),
              if (_loading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                )
              else
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    children: [
                      if (_hasCertificate && _summary.certificates.length > 1)
                        _LevelChips(
                          levels: _summary.certificates
                              .map((c) => c.cefrLevel)
                              .toList(),
                          selected: _selectedLevel,
                          onSelected: (lv) =>
                              setState(() => _selectedLevel = lv),
                        ),
                      RepaintBoundary(
                        key: _exportKey,
                        child: ColoredBox(
                          color: Colors.white,
                          child: CertificateAchievementView(
                            displayName: widget.displayName,
                            certificate: _activeCert,
                            preview: !_hasCertificate,
                            level: _selectedLevel.isNotEmpty
                                ? _selectedLevel
                                : 'A1',
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        label: text.certificateShare,
                        onPressed: _share,
                      ),
                      const SizedBox(height: 10),
                      SecondaryButton(
                        label: text.certificateCreateQr,
                        onPressed: _sharingQr ? () {} : _shareQr,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Figma sertifika düzeni — başlık, rozet ve tamamlanma bilgileri.
class CertificateAchievementView extends StatelessWidget {
  const CertificateAchievementView({
    super.key,
    required this.displayName,
    required this.level,
    this.certificate,
    this.preview = false,
  });

  final String displayName;
  final String level;
  final CertificateDto? certificate;
  final bool preview;

  static String _formatDate(DateTime? date) {
    if (date == null) return '—';
    final formatted =
        DateFormat('dd MMM yyyy', 'en_US').format(date.toLocal());
    final parts = formatted.split(' ');
    if (parts.length == 3) {
      return '${parts[0]} ${parts[1].toUpperCase()} ${parts[2]}';
    }
    return formatted.toUpperCase();
  }

  String get _certId {
    final token = certificate?.verifyToken;
    if (token != null && token.isNotEmpty) return token;
    return CertificateLevelAssets.defaultCertificateId(level);
  }

  @override
  Widget build(BuildContext context) {
    final text = CertificateCopy.page;
    final levelName = CertificateLevelAssets.levelLabel(level);
    final name = displayName.isEmpty ? 'Lingola Learner' : displayName;
    final dateLabel = preview
        ? _formatDate(DateTime.now())
        : _formatDate(certificate?.issuedAt);

    return Column(
      children: [
        Text(
          text.certificateOf.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            height: 24 / 20,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text.certificatePresentedTo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 18 / 14,
            fontWeight: FontWeight.w500,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            height: 24 / 18,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text.certificateAchievementBody(level: level),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            height: 18 / 12,
            fontWeight: FontWeight.w500,
            color: AppColors.ink.withValues(alpha: 0.65),
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          CertificateLevelAssets.badgeAsset(level),
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        Text(
          text.certificateLevelCompleted(levelName: levelName),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text.certificateDateCompleted(date: dateLabel),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text.certificateIdDisplay(id: _certId),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Lingola',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text.certificateBrandTagline,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

class _LevelChips extends StatelessWidget {
  const _LevelChips({
    required this.levels,
    required this.selected,
    required this.onSelected,
  });

  final List<String> levels;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: levels.map((level) {
          final active = level == selected;
          return ChoiceChip(
            label: Text(level),
            selected: active,
            onSelected: (_) => onSelected(level),
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : AppColors.ink,
            ),
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: active ? AppColors.primary : const Color(0xFFE0E3EF),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Profilde ayar satırı — tıklanınca tam sertifika ekranı açılır.
class ProfileCertificateTile extends StatelessWidget {
  const ProfileCertificateTile({
    super.key,
    required this.summary,
    required this.onTap,
    this.loading = false,
  });

  final CertificatesSummaryDto summary;
  final VoidCallback? onTap;
  final bool loading;

  static const _iconBg = Color(0xFFE8ECFF);

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.profilePage;
    final hasCert = summary.certificates.isNotEmpty;
    final level = summary.highestLevel ?? summary.primary?.cefrLevel;

    return InkWell(
      onTap: loading ? null : onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    )
                  : Icon(
                      hasCert
                          ? Icons.workspace_premium_rounded
                          : Icons.workspace_premium_outlined,
                      size: 18,
                      color: hasCert ? AppColors.primary : AppColors.secondary,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text.certificateTitle,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ink,
                ),
              ),
            ),
            if (loading)
              const SizedBox.shrink()
            else if (hasCert && level != null && level.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF000088), AppColors.primary],
                  ),
                ),
                child: Text(
                  level.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            const SizedBox(width: 6),
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
