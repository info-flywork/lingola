import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../widgets/lingola_chat_session.dart';
import '../tutor/services/tutor_chat_api_service.dart';

enum RolePlayScenarioId { coffee, directions, interview }

class RolePlayChatScreen extends StatefulWidget {
  const RolePlayChatScreen({required this.scenarioId, super.key});

  final RolePlayScenarioId scenarioId;

  @override
  State<RolePlayChatScreen> createState() => _RolePlayChatScreenState();
}

class _RolePlayChatScreenState extends State<RolePlayChatScreen> {
  String? _sessionId;
  var _loading = true;
  String? _error;
  List<LingolaChatMessage> _messages = const [];

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  ({String title, String opening}) get _scenario {
    final page = AppText.current.rolePlayPage;
    return switch (widget.scenarioId) {
      RolePlayScenarioId.coffee => (
          title: page.coffee.title,
          opening: page.coffee.chat.briefing,
        ),
      RolePlayScenarioId.directions => (
          title: page.directions.title,
          opening: page.directions.chat.briefing,
        ),
      RolePlayScenarioId.interview => (
          title: page.interview.title,
          opening: page.interview.chat.briefing,
        ),
    };
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final scenario = _scenario;
      final session = await TutorChatApiService.openSession(
        tutorSlug: 'lingola',
        forceNew: true,
        title: 'Role Play: ${scenario.title}',
        openingMessage: scenario.opening,
      );
      final messages = await TutorChatApiService.listMessages(session.id);
      if (!mounted) return;
      setState(() {
        _sessionId = session.id;
        _messages = messages
            .map(
              (m) => m.isUser
                  ? LingolaChatMessage.user(m.content)
                  : LingolaChatMessage.bot(m.content),
            )
            .toList(growable: false);
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      // Offline / backend yoksa local açılış mesajıyla devam.
      final scenario = _scenario;
      setState(() {
        _loading = false;
        _error = e is ApiException ? e.message : e.toString();
        _messages = [LingolaChatMessage.bot(scenario.opening)];
      });
    }
  }

  Future<String?> _sendToBackend(String userMessage) async {
    final sessionId = _sessionId;
    if (sessionId == null) {
      throw ApiException('Chat session not ready');
    }
    final result = await TutorChatApiService.sendMessage(
      sessionId: sessionId,
      content: userMessage,
    );
    return result.assistantMessage.content;
  }

  @override
  Widget build(BuildContext context) {
    final preview = AppText.current.previewChat;
    final scenario = _scenario;

    return LingolaChatSession(
      key: ValueKey(_sessionId ?? 'boot-$_loading'),
      brand: preview.brand,
      speedLabel: preview.speed,
      lessonBadge: scenario.title,
      typeMessageHint: preview.typeMessage,
      busy: _loading,
      errorText: _error,
      initialMessages: _messages,
      onSendAsync: _sessionId == null ? null : _sendToBackend,
      botReply: _sessionId == null
          ? 'Great — keep going! What would you like to say next?'
          : null,
      ttsVoiceId: TutorVoiceIds.male,
      riveAsset: AppAssets.tutorLingolaRiv,
      fallbackImage: AppAssets.tutorRobot,
      onClose: () => Navigator.of(context).pop(),
    );
  }
}
