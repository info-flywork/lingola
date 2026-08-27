import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/rive/rive_preload_service.dart';
import '../../i18n/strings.g.dart';
import '../tutor/services/tutor_chat_api_service.dart';
import '../../widgets/lingola_chat_session.dart';
import 'onboarding_draft.dart';
import 'post_onboarding_screens.dart';
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
  String? _error;
  List<LingolaChatMessage> _messages = const [];

  /// Onboarding robot tutor always speaks English (target language).
  static String get _openingMessageEnglish =>
      AppLocale.en.buildSync().previewChat.incoming1;

  @override
  void initState() {
    super.initState();
    RivePreloadService.preload(AppAssets.tutorLingolaRivCdn);
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _error = null;
      _sessionId = null;
      _messages = const [];
    });

    try {
      final payload = await TutorChatApiService.openPreviewSession(
        tutorSlug: 'lingola',
        title: 'Onboarding Preview',
        openingMessage: _openingMessageEnglish,
        kind: 'practice',
      );
      if (!mounted) return;
      setState(() {
        _sessionId = payload.session.id;
        _messages = payload.messages
            .map(
              (m) => m.isUser
                  ? LingolaChatMessage.user(m.content)
                  : LingolaChatMessage.bot(m.content),
            )
            .toList(growable: false);
        _loading = false;
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

  void _closePreview() {
    if (!mounted) return;
    final draft = widget.draft;
    // Navigasyon senkron — X basınca ekran anında kapansın.
    // Paywall (varsa) Auth üstünde, ayrı async yol.
    unawaited(presentOnboardingPaywallThenAuth(context, draft));
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.previewChat;
    final canChat = _sessionId != null && !_loading;

    return LingolaChatSession(
      // Timer only after session is ready — full 1 minute of chat.
      key: ValueKey(canChat ? 'preview-$_sessionId' : 'preview-loading'),
      brand: text.brand,
      speedLabel: text.speed,
      lessonBadge: text.lessonBadge,
      typeMessageHint: text.typeMessage,
      onSendAsync: canChat ? _sendToBackend : null,
      busy: _loading,
      errorText: _error,
      onRetry: _error != null ? _bootstrap : null,
      sessionLimit: canChat ? const Duration(minutes: 1) : null,
      onClose: _closePreview,
      onSessionExpired: _closePreview,
      initialMessages: _messages,
      ttsVoiceId: TutorVoiceIds.male,
      riveAsset: AppAssets.tutorLingolaRivCdn,
      fallbackImage: null,
    );
  }
}
