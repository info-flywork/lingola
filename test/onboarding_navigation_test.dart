import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingola/core/constants/app_text.dart';
import 'package:lingola/features/onboarding/onboarding_draft.dart';
import 'package:lingola/features/onboarding/language_setup_screens.dart';
import 'package:lingola/i18n/strings.g.dart';

Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

Future<void> _tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await _settle(tester);
}

void main() {
  testWidgets('Language setup continues through goal level and pace', (
    tester,
  ) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => LanguageSetupScreen(
                        draft: OnboardingDraft(
                          nativeLanguageCode: 'en',
                          appLocale: 'en',
                        ),
                      ),
                    ),
                  ),
                  child: const Text('Open'),
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await _settle(tester);

    final text = AppText.current;
    expect(find.text(text.language.title), findsOneWidget);

    await tester.tap(find.text(text.common.continueLabel).last);
    await _settle(tester);
    expect(find.text(text.setup.explanationTitle), findsOneWidget);

    await tester.tap(find.text(text.common.continueLabel).last);
    await _settle(tester);
    expect(find.text(text.setup.goalTitle), findsOneWidget);

    await tester.tap(find.text(text.common.continueLabel).last);
    await _settle(tester);
    expect(find.text(text.setup.interestsTitle), findsOneWidget);

    await tester.tap(find.text(text.common.continueLabel).last);
    await _settle(tester);
    expect(find.text(text.setup.paceTitle), findsOneWidget);
  });

  testWidgets('Target language sheet matches Figma layout', (tester) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(const MaterialApp(home: LanguageSetupScreen()));
    await tester.pump();

    final text = AppText.current;
    await tester.tap(find.byIcon(Icons.chevron_right_rounded).last);
    await _settle(tester);

    expect(find.text(text.language.targetField), findsOneWidget);
    expect(find.text(text.language.english), findsWidgets);
    expect(find.text(text.language.comingSoonBadge), findsOneWidget);
    expect(find.text(text.targetLanguage.german), findsOneWidget);
    expect(find.text(text.targetLanguage.italian), findsOneWidget);
    expect(find.text(text.language.french), findsOneWidget);
    expect(find.text(text.targetLanguage.turkish), findsOneWidget);
  });

  testWidgets('Language chevron opens bottom sheet', (tester) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(const MaterialApp(home: LanguageSetupScreen()));
    await tester.pump();

    final text = AppText.current;
    await tester.tap(find.byIcon(Icons.chevron_right_rounded).first);
    await _settle(tester);
    expect(find.text(text.language.selectLanguage), findsOneWidget);
  });
}
