import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rive/rive.dart';

import 'app/lingola_app.dart';
import 'i18n/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env yoksa AppEnv boş kalır; UI hata gösterir.
  }
  LocaleSettings.setLocaleSync(AppLocale.en);
  runApp(const LingolaApp());
}
