import 'package:flutter_test/flutter_test.dart';
import 'package:lingola/app/lingola_app.dart';
import 'package:lingola/i18n/strings.g.dart';

void main() {
  testWidgets('Lingola splash renders and advances', (tester) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(const LingolaApp());
    await tester.pump();
    expect(find.text('Lingola'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      find.text('Speak Confidently in Weeks — Not Months'),
      findsOneWidget,
    );
  });
}
