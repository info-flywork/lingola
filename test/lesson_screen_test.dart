import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingola/core/constants/app_text.dart';
import 'package:lingola/features/lesson/lesson_curriculum.dart';
import 'package:lingola/features/lesson/lesson_screen.dart';
import 'package:lingola/i18n/strings.g.dart';

void main() {
  testWidgets('Lesson screen shows A1 path and title', (tester) async {
    await LocaleSettings.setLocale(AppLocale.en);
    await tester.pumpWidget(const MaterialApp(home: LessonScreen()));
    await tester.pump();

    final text = AppText.current;
    expect(find.text(text.lessonPage.title), findsOneWidget);
    expect(find.text(text.lessonPage.levels.a1.title), findsOneWidget);
    expect(find.text(text.lessonPage.levels.a1.lessons.first), findsWidgets);
    expect(find.text(text.lessonPage.levels.a1.lessons[1]), findsWidgets);
  });

  test('Curriculum covers A1 to C2 with matching icon counts', () {
    final text = AppText.current.lessonPage.levels;
    final expected = {
      'a1': text.a1.lessons.length,
      'a2': text.a2.lessons.length,
      'b1': text.b1.lessons.length,
      'b2': text.b2.lessons.length,
      'c1': text.c1.lessons.length,
      'c2': text.c2.lessons.length,
    };
    expect(LessonCurriculum.levels.map((e) => e.id).toList(), [
      'a1',
      'a2',
      'b1',
      'b2',
      'c1',
      'c2',
    ]);
    for (final level in LessonCurriculum.levels) {
      expect(level.iconAssets.length, expected[level.id]);
    }
    final total = expected.values.fold<int>(0, (a, b) => a + b);
    expect(total, greaterThan(200));
  });
}
