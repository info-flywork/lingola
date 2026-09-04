import 'dart:async' show unawaited;

import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart' as rive;

import '../cdn/cdn_file_cache.dart';

/// Lingola Buddy `RivePreloadService` — CDN .riv yükleme (production-safe).
///
/// 1) Disk cache (`CdnFileCache`) → `File.path`
/// 2) Yoksa ağ → `File.url`
/// 3) Her adımda `Factory.rive` sonra `Factory.flutter`
///    (Release/TestFlight'ta native renderer sessizce düşebilir).
///
/// FileLoader'lar uygulama ömrü boyunca cache'de kalır; dispose edilmez.
abstract final class RivePreloadService {
  static final Map<String, rive.FileLoader> _cache = {};
  static final Map<String, Future<rive.FileLoader?>> _loading = {};

  static const defaultFallbackUrl =
      'https://lingola.b-cdn.net/tutors/lingola/avatar.riv';

  /// Şema yoksa `https://` eklenir. Asset path kabul edilmez.
  static String? normalizeRiveUrl(String? raw) {
    if (raw == null) return null;
    final t = raw.trim();
    if (t.isEmpty) return null;
    final lower = t.toLowerCase();
    if (lower.startsWith('assets/')) return null;
    if (lower.startsWith('http://') || lower.startsWith('https://')) return t;
    final withScheme = 'https://$t';
    final uri = Uri.tryParse(withScheme);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    return uri.toString();
  }

  static void invalidate(String? rawUrl) {
    final url = normalizeRiveUrl(rawUrl);
    if (url == null) return;
    _cache.remove(url);
    _loading.remove(url);
    unawaited(CdnFileCache.evict(url, kind: 'rive'));
  }

  static void preload(String? rawUrl) {
    unawaited(ensureLoader(rawUrl));
  }

  static void preloadMany(Iterable<String?> urls) {
    for (final u in urls) {
      preload(u);
    }
  }

  static Future<rive.FileLoader?> ensureLoader(String? rawUrl) async {
    final url = normalizeRiveUrl(rawUrl);
    if (url == null) return null;

    final cached = _cache[url];
    if (cached != null) return cached;

    return _loading.putIfAbsent(url, () async {
      try {
        final loader = await _loadLoader(url);
        if (loader != null) _cache[url] = loader;
        return loader;
      } finally {
        _loading.remove(url);
      }
    });
  }

  /// Eski API uyumu — sync cache lookup; yoksa arka planda yüklemeyi başlatır.
  static rive.FileLoader? obtainOrCreateLoader(String? rawUrl) {
    final url = normalizeRiveUrl(rawUrl);
    if (url == null) return null;
    final cached = _cache[url];
    if (cached != null) return cached;
    preload(rawUrl);
    return _cache[url];
  }

  static rive.FileLoader? getLoader(String? rawUrl) {
    final url = normalizeRiveUrl(rawUrl);
    if (url == null) return null;
    return _cache[url];
  }

  static Future<bool> ensurePreloaded(
    String? rawUrl, {
    Duration timeout = const Duration(seconds: 25),
  }) async {
    try {
      final loader = await ensureLoader(rawUrl).timeout(timeout);
      if (loader == null) return false;
      if (loader.isFileAvailable) return true;
      await loader.file().timeout(timeout);
      return loader.isFileAvailable;
    } catch (_) {
      return false;
    }
  }

  static Future<rive.FileLoader?> _loadLoader(String url) async {
    try {
      final localPath = await CdnFileCache.resolve(url, kind: 'rive');
      if (localPath.isNotEmpty && !localPath.startsWith('http')) {
        final fromDisk = await _loaderFromPath(localPath);
        if (fromDisk != null) {
          _log('ready (disk) $url');
          return fromDisk;
        }
      }
    } catch (e) {
      _log('disk failed $url — $e');
      if ('$e'.contains('not Rive')) {
        _log('failed $url');
        return null;
      }
    }

    final fromNetwork = await _loaderFromUrl(url);
    if (fromNetwork != null) {
      _log('ready (network) $url');
      return fromNetwork;
    }

    _log('failed $url');
    return null;
  }

  static Future<rive.FileLoader?> _loaderFromPath(String path) async {
    for (final factory in _factories) {
      try {
        final riveFile = await rive.File.path(path, riveFactory: factory);
        if (riveFile == null) continue;
        return rive.FileLoader.fromFile(riveFile, riveFactory: factory);
      } catch (e) {
        _log('path $factory — $e');
      }
    }
    return null;
  }

  static Future<rive.FileLoader?> _loaderFromUrl(String url) async {
    for (final factory in _factories) {
      try {
        final riveFile = await rive.File.url(url, riveFactory: factory);
        if (riveFile == null) continue;
        return rive.FileLoader.fromFile(riveFile, riveFactory: factory);
      } catch (e) {
        _log('url $factory — $e');
      }
    }
    return null;
  }

  /// Release iOS'ta native renderer sessizce düşebilir — Flutter renderer yedek.
  static List<rive.Factory> get _factories => [
        rive.Factory.rive,
        rive.Factory.flutter,
      ];

  static void _log(String message) {
    if (!kDebugMode) return;
    final safe = message.replaceAll(RegExp(r'[^\x09\x0A\x0D\x20-\x7E]'), '.');
    debugPrint('[RivePreload] $safe');
  }
}
