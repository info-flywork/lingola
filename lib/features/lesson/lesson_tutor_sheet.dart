import 'package:flutter/material.dart';

import '../tutor/tutor_screen.dart';
import 'lesson_tutor_choice.dart';

export 'lesson_tutor_choice.dart';

Future<LessonTutorChoice?> showLessonTutorSheet(
  BuildContext context, {
  required String lessonTitle,
}) {
  return Navigator.of(context).push<LessonTutorChoice>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => LessonTutorPickerScreen(lessonTitle: lessonTitle),
    ),
  );
}
