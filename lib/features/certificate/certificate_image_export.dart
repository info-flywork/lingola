import 'dart:typed_data';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Sertifika görünümünü PNG olarak galeriye kaydeder veya paylaşım sayfasına açar.
abstract final class CertificateImageExport {
  static Future<bool> saveToGallery({
    required GlobalKey boundaryKey,
    required String fileName,
    Rect? shareOrigin,
  }) async {
    final bytes = await _capturePng(boundaryKey);
    if (bytes == null) return false;

    try {
      final hasAccess = await Gal.hasAccess(toAlbum: true);
      if (!hasAccess) {
        await Gal.requestAccess(toAlbum: true);
      }
      await Gal.putImageBytes(
        bytes,
        name: fileName,
        album: 'Lingola',
      );
      return true;
    } on GalException {
      return _shareFallback(bytes, fileName, shareOrigin);
    } catch (_) {
      return _shareFallback(bytes, fileName, shareOrigin);
    }
  }

  static Future<Uint8List?> _capturePng(GlobalKey boundaryKey) async {
    await WidgetsBinding.instance.endOfFrame;

    final renderObject = boundaryKey.currentContext?.findRenderObject();
    if (renderObject is! RenderRepaintBoundary) return null;

    final image = await renderObject.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  static Future<bool> _shareFallback(
    List<int> bytes,
    String fileName,
    Rect? shareOrigin,
  ) async {
    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$fileName.png');
      await file.writeAsBytes(bytes);
      await Share.shareXFiles(
        [
          XFile(
            file.path,
            mimeType: 'image/png',
            name: '$fileName.png',
          ),
        ],
        sharePositionOrigin: shareOrigin,
      );
      return true;
    } catch (_) {
      return false;
    }
  }
}
