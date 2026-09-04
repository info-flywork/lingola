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
import 'role_play_catalog.dart';

class RolePlayChatScreen extends StatefulWidget {
  const RolePlayChatScreen({
    required this.scenarioId,
    required this.titleEn,
    required this.openingEn,
    required this.lessonBadge,
    this.sessionId,
    this.isCustom = false,
    super.key,
  });

  final String scenarioId;
  final String titleEn;
  final String openingEn;
  final String lessonBadge;
  final String? sessionId;
  final bool isCustom;

  @override
  State<RolePlayChatScreen> createState() => _RolePlayChatScreenState();
}

class _RolePlayChatScreenState extends State<RolePlayChatScreen> {
  static const _sessionDuration = Duration(minutes: 8);
  static const _welcomeBackEn =
      'Welcome back! Let\'s pick up where we left off.';

  String? _sessionId;
  var _syncingSession = false;
  var _bootstrapDone = false;
  var _isResume = false;
  String? _error;
  List<LingolaChatMessage> _messages = const [];
  TutorDto? _tutor;
  var _savingProgress = false;

  /// Role play avatar: yalnızca yerel robot .riv (PNG yok).
  static const _riveAsset = AppAssets.tutorLingolaRivCdn;

  String get _sessionTitle {
    if (widget.isCustom) {
      return 'Role Play: ${widget.titleEn} #custom:${widget.scenarioId}';
    }
    // scenarioId taşı: coffee-hard → ayrı session + backend zorluk
    return 'Role Play: ${widget.titleEn} #scenario:${widget.scenarioId}';
  }

  @override
  void initState() {
    super.initState();
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
      final result = await TutorChatApiService.openSession(
        tutorSlug: 'lingola',
        forceNew: false,
        title: _sessionTitle,
        openingMessage: widget.openingEn,
        kind: 'practice',
      );
      final messages = await TutorChatApiService.listMessages(result.session.id);
      if (!mounted) return;

      final mapped = messages
          .map(
            (m) => m.isUser
                ? LingolaChatMessage.user(m.content)
                : LingolaChatMessage.bot(m.content),
          )
          .toList(growable: false);

      final hasUserTurn = messages.any((m) => m.isUser);
      final isResume = !result.created && (hasUserTurn || messages.length > 1);

      setState(() {
        _sessionId = result.session.id;
        _isResume = isResume;
        if (mapped.isNotEmpty) {
          _messages = mapped;
        } else {
          _messages = [LingolaChatMessage.bot(widget.openingEn)];
        }
        _syncingSession = false;
        _bootstrapDone = true;
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
        scenarioId: widget.scenarioId,
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

    if (!_bootstrapDone) {
      return LingolaChatSession(
        key: const ValueKey('roleplay-bootstrap'),
        brand: preview.brand,
        speedLabel: preview.speed,
        lessonBadge: widget.lessonBadge,
        typeMessageHint: preview.typeMessage,
        busy: _syncingSession || _error == null,
        errorText: _error,
        onRetry: _error != null ? _bootstrap : null,
        initialMessages: const [],
        autoSpeakBot: false,
        onClose: _handleClose,
        riveAsset: _riveAsset,
        fallbackImage: null,
        sessionLimit: _sessionDuration,
        onSessionExpired: _handleClose,
      );
    }

    return LingolaChatSession(
      key: ValueKey('roleplay-${widget.scenarioId}-$_sessionId'),
      brand: preview.brand,
      speedLabel: preview.speed,
      lessonBadge: widget.lessonBadge,
      typeMessageHint: preview.typeMessage,
      busy: false,
      errorText: _error,
      onRetry: _error != null ? _bootstrap : null,
      initialMessages: _messages,
      autoSpeakBot: !_isResume,
      speakOnMount: _isResume ? _welcomeBackEn : null,
      onSendAsync: sessionReady ? _sendToBackend : null,
      botReply: sessionReady
          ? null
          : 'Great — keep going! What would you like to say next?',
      ttsVoiceId: TutorVoiceIds.resolve('lingola', preferred: _tutor?.voiceId),
      riveAsset: _riveAsset,
      fallbackImage: null,
      sessionLimit: _sessionDuration,
      onClose: _handleClose,
      onSessionExpired: _handleClose,
    );
  }
}

({String titleEn, String openingEn, String badge}) rolePlayEnglishContent({
  required String scenarioId,
  String? title,
  String? openingMessage,
}) {
  final page = AppLocale.en.buildSync().rolePlayPage;
  final baseId = RolePlayCatalog.baseId(scenarioId);
  return switch (baseId) {
    'coffee' => (
        titleEn: page.coffee.title,
        openingEn: page.coffee.chat.briefing,
        badge: page.coffee.title,
      ),
    'directions' => (
        titleEn: page.directions.title,
        openingEn: page.directions.chat.briefing,
        badge: page.directions.title,
      ),
    'interview' => (
        titleEn: page.interview.title,
        openingEn: page.interview.chat.briefing,
        badge: page.interview.title,
      ),
    'missedTrain' => (
        titleEn: page.missedTrain.title,
        openingEn: page.missedTrain.chat.briefing,
        badge: page.missedTrain.title,
      ),
    'flightAttendant' => (
        titleEn: page.flightAttendant.title,
        openingEn: page.flightAttendant.chat.briefing,
        badge: page.flightAttendant.title,
      ),
    'trainTicket' => (
        titleEn: page.trainTicket.title,
        openingEn: page.trainTicket.chat.briefing,
        badge: page.trainTicket.title,
      ),
    'restaurantReservation' => (
        titleEn: page.restaurantReservation.title,
        openingEn: page.restaurantReservation.chat.briefing,
        badge: page.restaurantReservation.title,
      ),
    'doctorAppointment' => (
        titleEn: page.doctorAppointment.title,
        openingEn: page.doctorAppointment.chat.briefing,
        badge: page.doctorAppointment.title,
      ),
    'shoppingClothes' => (
        titleEn: page.shoppingClothes.title,
        openingEn: page.shoppingClothes.chat.briefing,
        badge: page.shoppingClothes.title,
      ),
    'takingTaxi' => (
        titleEn: page.takingTaxi.title,
        openingEn: page.takingTaxi.chat.briefing,
        badge: page.takingTaxi.title,
      ),
    'rentingApartment' => (
        titleEn: page.rentingApartment.title,
        openingEn: page.rentingApartment.chat.briefing,
        badge: page.rentingApartment.title,
      ),
    'birthdayParty' => (
        titleEn: page.birthdayParty.title,
        openingEn: page.birthdayParty.chat.briefing,
        badge: page.birthdayParty.title,
      ),
    'flirtingMeet' => (
        titleEn: page.flirtingMeet.title,
        openingEn: page.flirtingMeet.chat.briefing,
        badge: page.flirtingMeet.title,
      ),
    'freeTalkHobby' => (
        titleEn: page.freeTalkHobby.title,
        openingEn: page.freeTalkHobby.chat.briefing,
        badge: page.freeTalkHobby.title,
      ),
    _ => (
        titleEn: title?.trim().isNotEmpty == true ? title!.trim() : 'Role Play',
        openingEn: openingMessage?.trim().isNotEmpty == true
            ? openingMessage!.trim()
            : 'Hi! Ready to practice this scene together?',
        badge: title?.trim().isNotEmpty == true ? title!.trim() : 'Role Play',
      ),
  };
}
