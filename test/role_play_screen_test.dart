import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingola/core/constants/app_text.dart';
import 'package:lingola/features/roleplay/role_play_screen.dart';
import 'package:lingola/i18n/strings.g.dart';

Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  testWidgets('Role play list opens detail sheet then chat', (tester) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(const MaterialApp(home: RolePlayScreen()));
    await tester.pump();

    final text = AppText.current;
    expect(find.text(text.rolePlayPage.title), findsOneWidget);
    expect(find.text(text.rolePlayPage.directions.title), findsOneWidget);

    await tester.tap(find.text(text.rolePlayPage.directions.title));
    await _settle(tester);

    expect(find.text(text.rolePlayPage.screenplay), findsOneWidget);
    expect(find.text(text.rolePlayPage.directions.screenplay), findsOneWidget);
    expect(find.text(text.common.getStarted), findsOneWidget);

    await tester.ensureVisible(find.text(text.common.getStarted));
    await tester.tap(find.text(text.common.getStarted));
    await _settle(tester);
    await tester.pumpAndSettle();

    expect(
      find.text(text.rolePlayPage.directions.chat.incoming1),
      findsOneWidget,
    );
    expect(find.text(text.previewChat.brand), findsOneWidget);
  });
}
