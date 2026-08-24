import '../tutor/services/calling_conversation_controller.dart';
import '../tutor/services/tutor_chat_api_service.dart';

/// Result when leaving a lesson call/chat session.
class LessonSessionResult {
  const LessonSessionResult({
    required this.finish,
    required this.elapsedSeconds,
    this.callMessages = const [],
    this.chatMessages = const [],
  });

  /// true → complete lesson + notes; false → pause and save progress only.
  final bool finish;
  final int elapsedSeconds;
  final List<CallMessage> callMessages;
  final List<TutorChatMessageDto> chatMessages;

  List<Map<String, String>> get transcript {
    if (callMessages.isNotEmpty) {
      return [
        for (final m in callMessages)
          {
            'role': m.role == CallMessageRole.user ? 'user' : 'assistant',
            'content': m.text,
          },
      ];
    }
    return [
      for (final m in chatMessages)
        {'role': m.role, 'content': m.content},
    ];
  }
}
