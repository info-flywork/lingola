import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// BunnyCDN dosyalarını ilk indirmeden sonra cihazda tutar.
/// Aynı URL tekrar istenince ağ çağrısı yapılmaz.
abstract final class CdnFileCache {
  static final _inflight = <String, Future<String>>{};
  static final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 90),
      sendTimeout: const Duration(seconds: 60),
      responseType: ResponseType.bytes,
    ),
  );

  /// HTTP(S) ise yerel kopyayı döner; değilse [url] aynen (asset path).
  static Future<String> resolve(String url, {String kind = 'rive'}) async {
    final trimmed = url.trim();
    if (trimmed.isEmpty || !_isNetwork(trimmed)) return trimmed;

    final cached = _inflight[trimmed];
    if (cached != null) return cached;

    final future = _downloadIfNeeded(trimmed, kind);
    _inflight[trimmed] = future;
    try {
      return await future;
    } finally {
      _inflight.remove(trimmed);
    }
  }

  static Future<void> prefetch(Iterable<String?> urls, {String kind = 'rive'}) async {
    for (final url in urls) {
      final value = url?.trim() ?? '';
      if (!_isNetwork(value)) continue;
      try {
        await resolve(value, kind: kind);
      } catch (err) {
        if (kDebugMode) debugPrint('[cdn-cache] prefetch failed: $err');
      }
    }
  }

  static bool _isNetwork(String value) =>
      value.startsWith('http://') || value.startsWith('https://');

  static Future<String> _downloadIfNeeded(String url, String kind) async {
    final file = await _fileFor(url, kind);
    if (await file.exists() && await file.length() > 64) {
      return file.path;
    }

    final tmp = File('${file.path}.tmp');
    try {
      final res = await _dio.get<List<int>>(url);
      final bytes = res.data;
      if (bytes == null || bytes.length < 64) {
        throw StateError('CDN file empty: $url');
      }
      await tmp.parent.create(recursive: true);
      await tmp.writeAsBytes(bytes, flush: true);
      if (await file.exists()) await file.delete();
      await tmp.rename(file.path);
      if (kDebugMode) {
        debugPrint('[cdn-cache] saved ${bytes.length} bytes → ${file.path}');
      }
      return file.path;
    } catch (_) {
      if (await tmp.exists()) {
        try {
          await tmp.delete();
        } catch (_) {}
      }
      rethrow;
    }
  }

  static Future<File> _fileFor(String url, String kind) async {
    final dir = await getApplicationSupportDirectory();
    final hash = sha1.convert(utf8.encode(url)).toString();
    final ext = _extensionFor(url, kind);
    return File('${dir.path}/cdn_cache/$kind/$hash$ext');
  }

  static String _extensionFor(String url, String kind) {
    final path = Uri.tryParse(url)?.path.toLowerCase() ?? '';
    if (path.endsWith('.riv')) return '.riv';
    if (path.endsWith('.png')) return '.png';
    if (path.endsWith('.jpg') || path.endsWith('.jpeg')) return '.jpg';
    if (path.endsWith('.webp')) return '.webp';
    return kind == 'rive' ? '.riv' : '';
  }
}
