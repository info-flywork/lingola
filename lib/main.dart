import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'app/lingola_app.dart';
import 'core/bootstrap/app_bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstrap.prepareForFirstFrame();

  if (kDebugMode) {
    // ignore: avoid_print
    print('[lingola] runApp');
  }

  runApp(const LingolaApp());

  AppBootstrap.startDeferred();
}
