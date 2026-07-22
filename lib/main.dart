import 'package:flutter/widgets.dart';

import 'app/lingola_app.dart';
import 'i18n/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocaleSync(AppLocale.en);
  runApp(const LingolaApp());
}
