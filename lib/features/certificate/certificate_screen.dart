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

/// Sertifika listesi — boşsa empty state, doluysa satır listesi.
class CertificateScreen extends StatefulWidget {
  const CertificateScreen({
    super.key,
    required this.displayName,
    this.summary,
  });

  final String displayName;
  final CertificatesSummaryDto? summary;

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late CertificatesSummaryDto _summary;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _summary = widget.summary ?? CertificatesSummaryDto.empty();
    _loading = true;
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await CertificateApiService.fetchMine();
      if (!mounted) return;
      setState(() {
        _summary = data;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  void _openDetail(CertificateDto cert) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CertificateDetailScreen(
          displayName: widget.displayName,
          certificate: cert,
        ),
      ),
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
                    Expanded(
                      child: Text(
                        text.myCertificates,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : _summary.certificates.isEmpty
                        ? _CertificatesEmptyState(
                            title: text.certificatesEmptyTitle,
                            subtitle: text.certificatesEmptySubtitle,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                            itemCount: _summary.certificates.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final cert = _summary.certificates[index];
                              return _CertificateListTile(
                                title: cert.title?.trim().isNotEmpty == true
                                    ? cert.title!
                                    : CertificateLevelAssets.listTitle(
                                        cert.cefrLevel,
                                      ),
                                onTap: () => _openDetail(cert),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertificatesEmptyState extends StatelessWidget {
  const _CertificatesEmptyState({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.certificatesEmpty,
              width: 129,
              height: 129,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                height: 1,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 1,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Figma liste satırı — 12 pad, radius 10, border #ECECEC.
class _CertificateListTile extends StatelessWidget {
  const _CertificateListTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  static const _border = Color(0xFFECECEC);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border),
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 22 / 14,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}

/// Kazanılmış sertifika detayı — paylaş / QR / indir.
class CertificateDetailScreen extends StatefulWidget {
  const CertificateDetailScreen({
    super.key,
    required this.displayName,
    required this.certificate,
  });

  final String displayName;
  final CertificateDto certificate;

  @override
  State<CertificateDetailScreen> createState() =>
      _CertificateDetailScreenState();
}

class _CertificateDetailScreenState extends State<CertificateDetailScreen> {
  final _exportKey = GlobalKey();
  var _downloading = false;
  var _sharingQr = false;

  Future<void> _download() async {
    if (_downloading) return;
    setState(() => _downloading = true);
    final text = AppText.current.profilePage;
    try {
      final ok = await CertificateImageExport.saveToGallery(
        boundaryKey: _exportKey,
        fileName:
            'lingola_certificate_${widget.certificate.cefrLevel.toLowerCase()}_${DateTime.now().millisecondsSinceEpoch}',
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
    final cert = widget.certificate;
    final text = CertificateCopy.page;
    await Share.share(
      '${text.certificateShareBody(level: cert.cefrLevel)}\n${cert.verifyUrl}',
      subject: text.certificateShareSubject(level: cert.cefrLevel),
    );
  }

  Future<void> _shareQr() async {
    if (_sharingQr) return;
    final cert = widget.certificate;
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
    final cert = widget.certificate;

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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                  children: [
                    RepaintBoundary(
                      key: _exportKey,
                      child: ColoredBox(
                        color: Colors.white,
                        child: CertificateAchievementView(
                          displayName: widget.displayName,
                          certificate: cert,
                          level: cert.cefrLevel,
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
    required this.certificate,
  });

  final String displayName;
  final String level;
  final CertificateDto certificate;

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
    final token = certificate.verifyToken;
    if (token.isNotEmpty) return token;
    return CertificateLevelAssets.defaultCertificateId(level);
  }

  @override
  Widget build(BuildContext context) {
    final text = CertificateCopy.page;
    final levelName = CertificateLevelAssets.levelLabel(level);
    final name = displayName.isEmpty ? 'Lingola Learner' : displayName;
    final dateLabel = _formatDate(certificate.issuedAt);

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

/// Profilde ayar satırı — tıklanınca sertifika listesi açılır.
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
                text.myCertificates,
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
