import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

/// Sertifika QR kodunu PNG olarak oluşturup sistem paylaşım sayfasına gönderir.
abstract final class CertificateQrShare {
  static Future<bool> share({
    required BuildContext context,
    required String verifyUrl,
    required String shareText,
    required String subject,
  }) async {
    final origin = _shareOrigin(context);

    final validation = QrValidator.validate(
      data: verifyUrl,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.M,
    );
    if (validation.status != QrValidationStatus.valid) return false;

    final painter = QrPainter.withQr(
      qr: validation.qrCode!,
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Color(0xFF000000),
      ),
      dataModuleStyle: const QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: Color(0xFF2D46FF),
      ),
      gapless: true,
    );

    final imageData = await painter.toImageData(
      512,
      format: ui.ImageByteFormat.png,
    );
    if (imageData == null) return false;

    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/lingola_certificate_qr_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(imageData.buffer.asUint8List());

    await Share.shareXFiles(
      [
        XFile(
          file.path,
          mimeType: 'image/png',
          name: 'lingola_certificate_qr.png',
        ),
      ],
      text: shareText,
      subject: subject,
      sharePositionOrigin: origin,
    );
    return true;
  }

  static Rect? _shareOrigin(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return null;
    final offset = renderBox.localToGlobal(Offset.zero);
    return offset & renderBox.size;
  }
}
