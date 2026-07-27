import 'package:flutter/material.dart';

import '../../core/constants/app_text.dart';
import '../../widgets/lingola_chat_session.dart';

enum RolePlayScenarioId { coffee, directions, interview }

class RolePlayChatScreen extends StatelessWidget {
  const RolePlayChatScreen({required this.scenarioId, super.key});

  final RolePlayScenarioId scenarioId;

  @override
  Widget build(BuildContext context) {
    final page = AppText.current.rolePlayPage;
    final preview = AppText.current.previewChat;

    final ({
      String title,
      String incoming1,
      String outgoing1,
      String incoming2Highlight,
      String incoming2Rest,
      String botReply,
    }) chat = switch (scenarioId) {
      RolePlayScenarioId.coffee => (
          title: page.coffee.title,
          incoming1: page.coffee.chat.incoming1,
          outgoing1: page.coffee.chat.outgoing1,
          incoming2Highlight: page.coffee.chat.incoming2Highlight,
          incoming2Rest: page.coffee.chat.incoming2Rest,
          botReply: page.coffee.chat.botReply,
        ),
      RolePlayScenarioId.directions => (
          title: page.directions.title,
          incoming1: page.directions.chat.incoming1,
          outgoing1: page.directions.chat.outgoing1,
          incoming2Highlight: page.directions.chat.incoming2Highlight,
          incoming2Rest: page.directions.chat.incoming2Rest,
          botReply: page.directions.chat.botReply,
        ),
      RolePlayScenarioId.interview => (
          title: page.interview.title,
          incoming1: page.interview.chat.incoming1,
          outgoing1: page.interview.chat.outgoing1,
          incoming2Highlight: page.interview.chat.incoming2Highlight,
          incoming2Rest: page.interview.chat.incoming2Rest,
          botReply: page.interview.chat.botReply,
        ),
    };

    return LingolaChatSession(
      brand: preview.brand,
      speedLabel: preview.speed,
      lessonBadge: chat.title,
      typeMessageHint: preview.typeMessage,
      botReply: chat.botReply,
      onClose: () => Navigator.of(context).pop(),
      initialMessages: [
        LingolaChatMessage.bot(chat.incoming1),
        LingolaChatMessage.user(chat.outgoing1),
        LingolaChatMessage.botHighlighted(
          highlight: chat.incoming2Highlight,
          rest: chat.incoming2Rest,
        ),
      ],
    );
  }
}
