import '../tutor/services/tutor_api_service.dart';

class LessonTutorChoice {
  const LessonTutorChoice({required this.tutor, required this.mode});

  final TutorDto tutor;
  /// `talk` or `chat`
  final String mode;
}
