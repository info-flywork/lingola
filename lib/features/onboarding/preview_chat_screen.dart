import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/rive/rive_preload_service.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../tutor/services/tutor_chat_api_service.dart';
import '../../widgets/lingola_chat_session.dart';
import 'onboarding_draft.dart';
import 'post_onboarding_screens.dart';
import 'services/onboarding_lingola_voice.dart';
import 'services/onboarding_preview_chat_store.dart';

class PreviewChatScreen extends StatefulWidget {
  const PreviewChatScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<PreviewChatScreen> createState() => _PreviewChatScreenState();
}

class _PreviewChatScreenState extends State<PreviewChatScreen> {
  String? _sessionId;
  var _loading = true;
  var _ready = false;
  String? _error;
  List<LingolaChatMessage> _messages = const [];
  String _ttsVoiceId = OnboardingLingolaVoice.fallback();

  /// Açılış: native mod → anadilde; english mod → tamamen İngilizce.
  String _openingMessageForDraft(OnboardingDraft draft) {
    if (draft.explanationLanguage == 'english') {
      return AppLocaleSync.resolve('en').buildSync().previewChat.incoming1;
    }
    final locale = AppLocaleSync.resolve(draft.nativeLanguageCode);
    return locale.buildSync().previewChat.incoming1;
  }

  @override
  void initState() {
    super.initState();
    RivePreloadService.preload(AppAssets.tutorLingolaRivCdn);
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _ready = false;
      _error = null;
      _sessionId = null;
      _messages = const [];
    });

    try {
      final payload = await TutorChatApiService.openPreviewSession(
        tutorSlug: 'lingola',
        title: 'Onboarding Preview',
        openingMessage: _openingMessageForDraft(widget.draft),
        kind: 'practice',
        nativeLanguageCode: widget.draft.nativeLanguageCode,
        targetLanguageCode: widget.draft.targetLanguageCode,
        explanationLanguage: widget.draft.explanationLanguage,
      );
      final voiceId = OnboardingLingolaVoice.fromPreferred(payload.tutorVoiceId);
      if (!mounted) return;
      setState(() {
        _ttsVoiceId = voiceId;
        _sessionId = payload.session.id;
        _messages = payload.messages
            .map(
              (m) => m.isUser
                  ? LingolaChatMessage.user(m.content)
                  : LingolaChatMessage.bot(m.content),
            )
            .toList(growable: false);
        _loading = false;
        _ready = true;
      });
      OnboardingPreviewChatStore.setSession(payload.session.id);
    } catch (e) {
      if (!mounted) return;
      final base = AppEnv.apiBaseUrl;
      String message;
      if (e is ApiException) {
        message = e.message;
        if (kDebugMode) {
          message = '$message\n$base'
              '${e.debugDetail != null ? '\n${e.debugDetail}' : ''}';
        }
      } else {
        message = kDebugMode ? '$e\n$base' : e.toString();
      }
      setState(() {
        _loading = false;
        _error = message;
      });
    }
  }

  Future<String?> _sendToBackend(String userMessage) async {
    final id = _sessionId;
    if (id == null || id.isEmpty) {
      throw ApiException(AppText.current.common.connectionError);
    }
    final result = await TutorChatApiService.sendPreviewMessage(
      sessionId: id,
      content: userMessage,
    );
    return result.assistantMessage.content;
  }

  void _closePreview([Duration _ = Duration.zero]) {
    if (!mounted) return;
    final draft = widget.draft;
    // Navigasyon senkron — X basınca ekran anında kapansın.
    // Paywall (varsa) Auth üstünde, ayrı async yol.
    unawaited(presentOnboardingPaywallThenAuth(context, draft));
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.previewChat;

    if (!_ready) {
      return LingolaChatSession(
        key: const ValueKey('preview-bootstrap'),
        brand: text.brand,
        speedLabel: text.speed,
        lessonBadge: text.lessonBadge,
        typeMessageHint: text.typeMessage,
        nativeLanguageCode: widget.draft.nativeLanguageCode,
        busy: _loading,
        errorText: _error,
        onRetry: _error != null ? _bootstrap : null,
        onClose: _closePreview,
        initialMessages: const [],
        autoSpeakBot: false,
        riveAsset: AppAssets.tutorLingolaRivCdn,
        fallbackImage: null,
      );
    }

    final canChat = _sessionId != null;

    return LingolaChatSession(
      key: ValueKey('preview-$_sessionId-$_ttsVoiceId'),
      brand: text.brand,
      speedLabel: text.speed,
      lessonBadge: text.lessonBadge,
      typeMessageHint: text.typeMessage,
      nativeLanguageCode: widget.draft.nativeLanguageCode,
      onSendAsync: canChat ? _sendToBackend : null,
      busy: false,
      errorText: _error,
      onRetry: _error != null ? _bootstrap : null,
      sessionLimit: const Duration(minutes: 1),
      onClose: _closePreview,
      onSessionExpired: _closePreview,
      initialMessages: _messages,
      ttsVoiceId: _ttsVoiceId,
      riveAsset: AppAssets.tutorLingolaRivCdn,
      fallbackImage: null,
    );
  }
}
