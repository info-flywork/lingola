import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/auth_service.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/i18n/app_locale_sync.dart';
import '../../core/rive/rive_preload_service.dart';
import '../tutor/services/tutor_chat_api_service.dart';
import '../../widgets/lingola_chat_session.dart';
import 'onboarding_draft.dart';
import 'post_onboarding_screens.dart';
import 'services/onboarding_lingola_voice.dart';

/// Sorular bittikten sonra, hesap oluşturma ekranından önce — 1 dk demo sohbet.
/// Paywall gösterilmez; cevaplar backend'de saklanır.
class OnboardingDemoChatScreen extends StatefulWidget {
  const OnboardingDemoChatScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<OnboardingDemoChatScreen> createState() =>
      _OnboardingDemoChatScreenState();
}

class _OnboardingDemoChatScreenState extends State<OnboardingDemoChatScreen> {
  String? _sessionId;
  var _loading = true;
  var _ready = false;
  String? _error;
  List<LingolaChatMessage> _messages = const [];
  var _finishing = false;
  String _ttsVoiceId = OnboardingLingolaVoice.fallback();

  String _openingMessageForDraft(OnboardingDraft draft) {
    final locale = AppLocaleSync.resolve(draft.nativeLanguageCode);
    return locale.buildSync().demoChat.incoming1;
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
        title: 'Onboarding Demo',
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
    setState(() {
      _messages = [..._messages, LingolaChatMessage.user(userMessage)];
    });
    final result = await TutorChatApiService.sendPreviewMessage(
      sessionId: id,
      content: userMessage,
    );
    final reply = result.assistantMessage.content.trim();
    if (reply.isNotEmpty && mounted) {
      setState(() {
        _messages = [..._messages, LingolaChatMessage.bot(reply)];
      });
    }
    return reply.isEmpty ? null : reply;
  }

  Future<void> _finishDemo() async {
    if (_finishing || !mounted) return;
    _finishing = true;

    try {
      await AuthService.saveDemoPersonalization(
        messages: _messages
            .map(
              (m) => {
                'role': m.isUser ? 'user' : 'assistant',
                'content': m.text,
              },
            )
            .toList(growable: false),
      );
    } catch (_) {
      // Demo kaydı başarısız olsa bile akış devam etsin.
    }

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => AccountCreatingScreen(draft: widget.draft),
      ),
    );
  }

  void _onDemoEnd([Duration _ = Duration.zero]) {
    unawaited(_finishDemo());
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.demoChat;

    if (!_ready) {
      return LingolaChatSession(
        key: const ValueKey('demo-bootstrap'),
        brand: text.brand,
        speedLabel: text.speed,
        lessonBadge: text.lessonBadge,
        typeMessageHint: text.typeMessage,
        nativeLanguageCode: widget.draft.nativeLanguageCode,
        busy: _loading || _finishing,
        errorText: _error,
        onRetry: _error != null ? _bootstrap : null,
        onClose: _onDemoEnd,
        initialMessages: const [],
        autoSpeakBot: false,
        riveAsset: AppAssets.tutorLingolaRivCdn,
        fallbackImage: null,
      );
    }

    final canChat = _sessionId != null;

    return LingolaChatSession(
      key: ValueKey('demo-$_sessionId-$_ttsVoiceId'),
      brand: text.brand,
      speedLabel: text.speed,
      lessonBadge: text.lessonBadge,
      typeMessageHint: text.typeMessage,
      nativeLanguageCode: widget.draft.nativeLanguageCode,
      onSendAsync: canChat ? _sendToBackend : null,
      busy: _finishing,
      errorText: _error,
      onRetry: _error != null ? _bootstrap : null,
      sessionLimit: const Duration(minutes: 1),
      onClose: _onDemoEnd,
      onSessionExpired: _onDemoEnd,
      initialMessages: _messages,
      ttsVoiceId: _ttsVoiceId,
      riveAsset: AppAssets.tutorLingolaRivCdn,
      fallbackImage: null,
    );
  }
}
