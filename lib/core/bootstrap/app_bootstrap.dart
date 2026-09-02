import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../config/app_env.dart';
import '../config/firebase_options.dart';
import '../i18n/app_locale_sync.dart';
import '../rive/rive_native_bootstrap.dart';

/// Açılışta UI'ı bloklamadan arka planda çalışan init adımları.
abstract final class AppBootstrap {
  static var _started = false;
  static var _firebaseReady = false;
  static Future<void>? _deferredFuture;
  static Future<void>? _firebaseFuture;

  /// Splash öncesi minimum init — hızlı, timeout'lu.
  static Future<void> prepareForFirstFrame() async {
    await _withTimeout(
      'dotenv',
      () => dotenv.load(fileName: '.env'),
      const Duration(seconds: 3),
    );
    await _withTimeout(
      'locale',
      AppLocaleSync.bootstrapFromCache,
      const Duration(seconds: 5),
    );
  }

  /// runApp sonrası — Rive, Firebase, RevenueCat.
  static void startDeferred() {
    if (_started) return;
    _started = true;
    _deferredFuture ??= _runDeferred();
    unawaited(_deferredFuture);
    unawaited(_requestLocalNetworkAccess());
  }

  static Future<void> ensureFirebase() async {
    if (_firebaseReady) return;
    _firebaseFuture ??= _initFirebase();
    await _firebaseFuture;
  }

  static Future<void> _runDeferred() async {
    await RiveNativeBootstrap.ensureInitialized();

    await ensureFirebase();

    if (kDebugMode) {
      // ignore: avoid_print
      print('[lingola] API_BASE_URL=${AppEnv.apiBaseUrl}');
    }

    await _withTimeout(
      'revenuecat',
      _configureRevenueCat,
      const Duration(seconds: 10),
    );
  }

  static Future<void> _initFirebase() async {
    if (_firebaseReady) return;
    final options = FirebaseOptionsConfig.currentPlatform;
    if (options == null) {
      _firebaseReady = true;
      return;
    }
    await _withTimeout(
      'firebase',
      () => Firebase.initializeApp(options: options),
      const Duration(seconds: 12),
    );
    _firebaseReady = true;
  }

  static Future<void> _configureRevenueCat() async {
    if (kIsWeb) return;

    final apiKey = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => AppEnv.revenueCatIosPublicKey,
      TargetPlatform.android => AppEnv.revenueCatAndroidPublicKey,
      _ => '',
    };
    if (apiKey.isEmpty) return;

    try {
      await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.warn);
      await Purchases.configure(PurchasesConfiguration(apiKey));
    } on MissingPluginException catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('[lingola] RevenueCat plugin not linked: $e');
      }
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('[lingola] RevenueCat init failed: $e');
      }
    }
  }

  static Future<void> _requestLocalNetworkAccess() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
    try {
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      socket.broadcastEnabled = true;
      socket.send(
        const [0],
        InternetAddress('224.0.0.251'),
        5353,
      );
      socket.close();
    } catch (_) {}
  }

  static Future<void> _withTimeout(
    String label,
    Future<void> Function() action,
    Duration timeout,
  ) async {
    try {
      await action().timeout(timeout);
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('[lingola] $label init skipped: $e');
      }
    }
  }
}
