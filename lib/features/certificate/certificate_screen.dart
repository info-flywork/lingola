import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import 'certificate_api_service.dart';
import 'certificate_copy.dart';
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
  var _sharingQr = false;

  @override
  void initState() {
    super.initState();
    _summary = widget.summary ?? CertificatesSummaryDto.empty();
    _loading = widget.summary == null;
    _selectedLevel = widget.initialLevel ??
        widget.summary?.primary?.cefrLevel ??
        widget.summary?.highestLevel ??
        '';
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

  Future<void> _share() async {
    final cert = _activeCert;
    if (cert == null) return;
    final text = CertificateCopy.page;
    await Share.share(
      '${text.certificateShareBody(level: cert.cefrLevel)}\n${cert.verifyUrl}',
      subject: text.certificateShareSubject(level: cert.cefrLevel),
    );
  }

  Future<void> _shareQr() async {
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
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
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
                    Text(
                      text.certificateTitle,
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
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
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
                      CertificateCard(
                        displayName: widget.displayName,
                        certificate: _activeCert,
                        preview: !_hasCertificate,
                      ),
                      const SizedBox(height: 20),
                      if (!_hasCertificate)
                        Text(
                          text.certificatePreviewBody,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            height: 22 / 14,
                            color: AppColors.secondary,
                          ),
                        )
                      else ...[
                        PrimaryButton(
                          label: text.certificateShare,
                          onPressed: _share,
                        ),
                        const SizedBox(height: 10),
                        SecondaryButton(
                          label: text.certificateShareQr,
                          onPressed: _sharingQr ? () {} : _shareQr,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          text.certificateVerifyHint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            height: 18 / 12,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
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

/// Resmi Lingola sertifikası — uluslararası sertifika düzeni.
class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.displayName,
    this.certificate,
    this.preview = false,
  });

  final String displayName;
  final CertificateDto? certificate;
  final bool preview;

  static const _navyFrame = Color(0xFF1A2A5E);
  static const _paper = Color(0xFFFFFEFF);

  @override
  Widget build(BuildContext context) {
    final text = CertificateCopy.page;
    final level = preview ? 'A1' : (certificate?.cefrLevel ?? 'A1');
    final showLevel = !preview && certificate != null;
    final name = displayName.isEmpty ? 'Lingola Learner' : displayName;
    final date = certificate?.issuedAt;
    final dateLabel = date != null
        ? DateFormat('dd MMMM yyyy', 'en_US').format(date.toLocal())
        : '—';
    final certId = certificate?.verifyToken.isNotEmpty == true
        ? certificate!.verifyToken
        : '—';

    return Container(
      decoration: BoxDecoration(
        color: _paper,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _navyFrame, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _CertificateSidePatternPainter()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
              child: Column(
                children: [
                  _LingolaBrandRow(),
                  const SizedBox(height: 16),
                  Text(
                    text.certificateLevelTitle(level: level),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    text.certificateOf,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary.withValues(alpha: 0.95),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    text.certificateCertifiesThat,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      height: 1.15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    text.certificateCompletedDetail,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      height: 1.55,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    text.certificateLevelLine(level: level),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 1.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _GoldSeal(locked: !showLevel),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              dateLabel,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ink,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              text.certificateDateOfCompletion,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9,
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 80,
                              height: 1,
                              color: AppColors.border,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Lingola',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary.withValues(alpha: 0.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (showLevel && certificate != null)
                        _VerifyQrBox(
                          certificateId: certId,
                          verifyUrl: certificate!.verifyUrl,
                        )
                      else
                        _VerifyQrBox.preview(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: AppColors.border),
                  const SizedBox(height: 10),
                  const _FlyworkFooter(),
                  if (showLevel) ...[
                    const SizedBox(height: 8),
                    Text(
                      '${text.certificateIdLabel}: $certId',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        letterSpacing: 0.3,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LingolaBrandRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF000845), AppColors.primary],
          ).createShader(bounds),
          child: const Text(
            'Lingola',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          CertificateCopy.page.certificatePathway,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class _GoldSeal extends StatelessWidget {
  const _GoldSeal({required this.locked});

  final bool locked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: locked
            ? null
            : const RadialGradient(
                colors: [Color(0xFFF5DF7A), Color(0xFFD4AF37)],
              ),
        color: locked ? const Color(0xFFF5F6FA) : null,
        border: Border.all(
          color: locked ? AppColors.border : const Color(0xFFB8941F),
          width: 2,
        ),
      ),
      child: Icon(
        locked ? Icons.lock_outline_rounded : Icons.verified_rounded,
        color: locked ? AppColors.secondary : Colors.white,
        size: 26,
      ),
    );
  }
}

class _VerifyQrBox extends StatelessWidget {
  const _VerifyQrBox({
    required this.certificateId,
    required this.verifyUrl,
  });

  const _VerifyQrBox.preview()
      : certificateId = '—',
        verifyUrl = null;

  final String certificateId;
  final String? verifyUrl;

  @override
  Widget build(BuildContext context) {
    final text = CertificateCopy.page;
    final url = verifyUrl;

    return Container(
      width: 108,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E3EF)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            text.certificateIdLabel.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 7,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            certificateId.length > 12
                ? '${certificateId.substring(0, 12)}…'
                : certificateId,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 7,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 6),
          if (url != null)
            QrImageView(
              data: url,
              version: QrVersions.auto,
              size: 72,
              backgroundColor: Colors.white,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: AppColors.ink,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: AppColors.primary,
              ),
            )
          else
            Container(
              width: 72,
              height: 72,
              alignment: Alignment.center,
              color: const Color(0xFFF5F6FA),
              child: Icon(
                Icons.qr_code_2_rounded,
                size: 36,
                color: AppColors.secondary.withValues(alpha: 0.35),
              ),
            ),
          const SizedBox(height: 4),
          Text(
            text.certificateVerifyAuthenticity,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 6.5,
              letterSpacing: 0.4,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _FlyworkFooter extends StatelessWidget {
  const _FlyworkFooter();

  @override
  Widget build(BuildContext context) {
    final providedBy = CertificateCopy.page.certificateProvidedBy;

    return Column(
      children: [
        Text(
          providedBy,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.flyworkLogo,
              height: 22,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => Image.network(
                'https://lingola.b-cdn.net/branding/flywork-logo.png',
                height: 22,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              'flywork',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF78CAD2),
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CertificateSidePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.04)
      ..style = PaintingStyle.fill;

    for (var i = 0; i < 8; i++) {
      final y = i * (size.height / 7);
      canvas.drawPath(
        Path()
          ..moveTo(0, y)
          ..lineTo(28, y + 18)
          ..lineTo(0, y + 36)
          ..close(),
        paint,
      );
      canvas.drawPath(
        Path()
          ..moveTo(size.width, y)
          ..lineTo(size.width - 28, y + 18)
          ..lineTo(size.width, y + 36)
          ..close(),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
      padding: const EdgeInsets.only(bottom: 12),
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
