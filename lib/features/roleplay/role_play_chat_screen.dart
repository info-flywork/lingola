import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/lingola_chat_session.dart';
import '../tutor/services/tutor_api_service.dart';
import '../tutor/services/tutor_chat_api_service.dart';
import 'role_play_api_service.dart';

enum RolePlayScenarioId { coffee, directions, interview }

extension RolePlayScenarioIdX on RolePlayScenarioId {
  String get apiId => name;
}

class RolePlayChatScreen extends StatefulWidget {
  const RolePlayChatScreen({
    required this.scenarioId,
    this.sessionId,
    super.key,
  });

  final RolePlayScenarioId scenarioId;
  final String? sessionId;

  @override
  State<RolePlayChatScreen> createState() => _RolePlayChatScreenState();
}

class _RolePlayChatScreenState extends State<RolePlayChatScreen> {
  static const _sessionDuration = Duration(minutes: 8);

  String? _sessionId;
  var _syncingSession = false;
  String? _error;
  List<LingolaChatMessage> _messages = const [];
  TutorDto? _tutor;
  var _savingProgress = false;

  /// UI rozeti — kullanıcının dilinde olabilir.
  String get _lessonBadge {
    final page = AppText.current.rolePlayPage;
    return switch (widget.scenarioId) {
      RolePlayScenarioId.coffee => page.coffee.title,
      RolePlayScenarioId.directions => page.directions.title,
      RolePlayScenarioId.interview => page.interview.title,
    };
  }

  /// Konuşma içeriği her zaman İngilizce (UI dili ne olursa olsun).
  ({String titleEn, String openingEn}) get _scenarioEnglish {
    final page = AppLocale.en.buildSync().rolePlayPage;
    return switch (widget.scenarioId) {
      RolePlayScenarioId.coffee => (
          titleEn: page.coffee.title,
          openingEn: page.coffee.chat.briefing,
        ),
      RolePlayScenarioId.directions => (
          titleEn: page.directions.title,
          openingEn: page.directions.chat.briefing,
        ),
      RolePlayScenarioId.interview => (
          titleEn: page.interview.title,
          openingEn: page.interview.chat.briefing,
        ),
    };
  }

  /// Role play avatar: yalnızca yerel robot .riv (PNG yok).
  static const _riveAsset = AppAssets.tutorLingolaRivCdn;

  String? get _ttsVoiceId => _tutor?.voiceId;

  @override
  void initState() {
    super.initState();
    final en = _scenarioEnglish;
    _messages = [LingolaChatMessage.bot(en.openingEn)];
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
      final en = _scenarioEnglish;
      final session = await TutorChatApiService.openSession(
        tutorSlug: 'lingola',
        forceNew: false,
        title: 'Role Play: ${en.titleEn}',
        openingMessage: en.openingEn,
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

  Future<void> _persistProgress(Duration elapsed) async {
    if (_savingProgress) return;
    final seconds = elapsed.inSeconds;
    if (seconds <= 0) return;
    final sessionId = _sessionId;
    if (sessionId == null) return;

    _savingProgress = true;
    try {
      await RolePlayApiService.saveProgress(
        scenarioId: widget.scenarioId.apiId,
        sessionId: sessionId,
        additionalSeconds: seconds,
      );
    } catch (_) {
      // Liste yenilenince tekrar denenebilir.
    } finally {
      _savingProgress = false;
    }
  }

  Future<void> _handleClose(Duration elapsed) async {
    await _persistProgress(elapsed);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final preview = AppText.current.previewChat;
    final sessionReady = _sessionId != null;

    return LingolaChatSession(
      key: ValueKey('roleplay-${widget.scenarioId.name}'),
      brand: preview.brand,
      speedLabel: preview.speed,
      lessonBadge: _lessonBadge,
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
      fallbackImage: null,
      sessionLimit: _sessionDuration,
      onClose: _handleClose,
      onSessionExpired: _handleClose,
    );
  }
}
