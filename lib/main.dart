import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rive/rive.dart';

import 'app/lingola_app.dart';
import 'core/config/app_env.dart';
import 'core/config/firebase_options.dart';
import 'core/i18n/app_locale_sync.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env yoksa AppEnv boş kalır; UI hata gösterir.
  }

  // iOS: Yerel Ağ izin diyaloğunu tetikle (LAN API için).
  // ignore: unawaited_futures
  _requestLocalNetworkAccess();

  final firebaseOptions = FirebaseOptionsConfig.currentPlatform;
  if (firebaseOptions != null) {
    await Firebase.initializeApp(options: firebaseOptions);
  }

  await AppLocaleSync.bootstrapFromCache();
  if (kDebugMode) {
    // ignore: avoid_print
    print('[lingola] API_BASE_URL=${AppEnv.apiBaseUrl}');
  }
  await _configureRevenueCat();
  runApp(const LingolaApp());
}

Future<void> _requestLocalNetworkAccess() async {
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

Future<void> _configureRevenueCat() async {
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
      print('[lingola] RevenueCat plugin not linked — stop app, full rebuild: $e');
    }
  } catch (e) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[lingola] RevenueCat init failed: $e');
    }
  }
}
