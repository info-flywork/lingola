import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../widgets/lingola_chat_session.dart';
import 'post_onboarding_screens.dart';

class PreviewChatScreen extends StatelessWidget {
  const PreviewChatScreen({super.key});

  void _goPaywall(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.previewChat;
    return LingolaChatSession(
      brand: text.brand,
      speedLabel: text.speed,
      lessonBadge: text.lessonBadge,
      typeMessageHint: text.typeMessage,
      botReply: text.botReply,
      sessionLimit: const Duration(minutes: 1),
      onClose: () => _goPaywall(context),
      onSessionExpired: () => _goPaywall(context),
      initialMessages: [
        LingolaChatMessage.bot(text.incoming1),
        LingolaChatMessage.user(text.outgoing1),
        LingolaChatMessage.botHighlighted(
          highlight: text.incoming2Highlight,
          rest: text.incoming2Rest,
        ),
      ],
    );
  }
}
