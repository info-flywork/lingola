import '../../../core/config/app_env.dart';
import '../../tutor/services/tutor_api_service.dart';

/// Onboarding robot TTS — önce DB/API `lingola.voice_id`, yoksa yerel fallback.
abstract final class OnboardingLingolaVoice {
  static String fallback() => TutorVoiceIds.lingola;

  static String fromPreferred(String? preferred) =>
      TutorVoiceIds.resolve('lingola', preferred: preferred);

  static Future<String> resolve() async {
    try {
      final tutors = await TutorApiService.fetchTutors();
      for (final t in tutors) {
        if (t.slug.toLowerCase() == 'lingola') {
          return TutorVoiceIds.resolve('lingola', preferred: t.voiceId);
        }
      }
    } catch (_) {
      // Ağ yoksa veya API hata verirse bundle fallback.
    }
    return fallback();
  }
}
