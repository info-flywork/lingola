import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rive/rive.dart';

import 'app/lingola_app.dart';
import 'core/config/firebase_options.dart';
import 'i18n/strings.g.dart';

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

  LocaleSettings.setLocaleSync(AppLocale.en);
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
