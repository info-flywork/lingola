import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../widgets/lingola_chat_session.dart';
import '../tutor/services/tutor_api_service.dart';
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
  var _syncingSession = false;
  String? _error;
  List<LingolaChatMessage> _messages = const [];
  TutorDto? _tutor;

  ({String title, String opening, String heroImage}) get _scenario {
    final page = AppText.current.rolePlayPage;
    return switch (widget.scenarioId) {
      RolePlayScenarioId.coffee => (
          title: page.coffee.title,
          opening: page.coffee.chat.briefing,
          heroImage: AppAssets.rolePlayCoffee,
        ),
      RolePlayScenarioId.directions => (
          title: page.directions.title,
          opening: page.directions.chat.briefing,
          heroImage: AppAssets.rolePlayDirections,
        ),
      RolePlayScenarioId.interview => (
          title: page.interview.title,
          opening: page.interview.chat.briefing,
          heroImage: AppAssets.rolePlayInterview,
        ),
    };
  }

  String get _heroImage =>
      _tutor?.imagePath ?? _scenario.heroImage;

  String? get _riveAsset =>
      _tutor?.rivePath ?? AppAssets.tutorLingolaRiv;

  String? get _ttsVoiceId => _tutor?.voiceId;

  @override
  void initState() {
    super.initState();
    final scenario = _scenario;
    _messages = [LingolaChatMessage.bot(scenario.opening)];
    unawaited(_loadTutor());
    unawaited(_bootstrap());
  }

  Future<void> _loadTutor() async {
    try {
      final tutors = await TutorApiService.fetchTutors();
      TutorDto? lingola;
      for (final t in tutors) {
        if (t.slug.toLowerCase() == 'lingola') {
          lingola = t;
          break;
        }
      }
      if (!mounted || lingola == null) return;
      setState(() => _tutor = lingola);
    } catch (_) {}
  }

  Future<void> _bootstrap() async {
    if (!mounted) return;
    setState(() {
      _syncingSession = true;
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
        if (messages.isNotEmpty) {
          _messages = messages
              .map(
                (m) => m.isUser
                    ? LingolaChatMessage.user(m.content)
                    : LingolaChatMessage.bot(m.content),
              )
              .toList(growable: false);
        }
        _syncingSession = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _syncingSession = false;
        _error = e is ApiException ? e.message : e.toString();
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
    final sessionReady = _sessionId != null;

    return LingolaChatSession(
      key: ValueKey(_sessionId ?? 'roleplay-local'),
      brand: preview.brand,
      speedLabel: preview.speed,
      lessonBadge: scenario.title,
      typeMessageHint: preview.typeMessage,
      busy: _syncingSession && _messages.isEmpty,
      errorText: _error,
      onRetry: _error != null ? _bootstrap : null,
      initialMessages: _messages,
      onSendAsync: sessionReady ? _sendToBackend : null,
      botReply: sessionReady
          ? null
          : 'Great — keep going! What would you like to say next?',
      ttsVoiceId: _ttsVoiceId ?? TutorVoiceIds.male,
      riveAsset: _riveAsset,
      fallbackImage: _heroImage,
      onClose: () => Navigator.of(context).pop(),
    );
  }
}
