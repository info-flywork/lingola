import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'services/tutor_chat_api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.tutorName,
    required this.imagePath,
    this.tutorId,
    this.tutorSlug,
    this.sessionId,
    this.sessionTitle,
    this.openingMessage,
    this.forceNew = false,
    this.lessonSlug,
    this.kind,
    this.finishOnPop = false,
    this.lessonSegmentMode = false,
    this.segmentDuration = const Duration(minutes: 15),
    super.key,
  });

  final String tutorName;
  final String imagePath;
  final String? tutorId;
  final String? tutorSlug;
  final String? sessionId;
  final String? sessionTitle;
  final String? openingMessage;
  final bool forceNew;
  final String? lessonSlug;
  final String? kind;
  final bool finishOnPop;

  /// Ders: 15 dk sonra uzatma / bitirme sorusu.
  final bool lessonSegmentMode;
  final Duration segmentDuration;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _messages = <TutorChatMessageDto>[];

  String? _sessionId;
  var _loading = true;
  var _sending = false;
  String? _error;
  Timer? _segmentTimer;
  DateTime _segmentStartedAt = DateTime.now();
  var _checkpointOpen = false;

  @override
  void initState() {
    super.initState();
    _segmentStartedAt = DateTime.now();
    if (widget.lessonSegmentMode || widget.finishOnPop) {
      _segmentTimer = Timer.periodic(const Duration(seconds: 5), (_) {
        _maybeOfferSegment();
      });
    }
    _bootstrap();
  }

  @override
  void dispose() {
    _segmentTimer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeOfferSegment() {
    if (!mounted || _checkpointOpen || _loading || _sending) return;
    if (!(widget.lessonSegmentMode || widget.finishOnPop)) return;
    final spent = DateTime.now().difference(_segmentStartedAt);
    if (spent < widget.segmentDuration) return;
    _checkpointOpen = true;
    unawaited(_showSegmentDialog());
  }

  Future<void> _showSegmentDialog({bool askAgain = false}) async {
    if (!mounted) return;
    final continuePractice = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            askAgain ? 'Still there?' : '15 minutes done',
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          content: Text(
            askAgain
                ? 'Want another 15 minutes of practice, or finish the lesson?'
                : "We've practiced for about 15 minutes. Another 15 minutes of practice, or finish the lesson?",
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Finish'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('15 more min'),
            ),
          ],
        );
      },
    );

    if (!mounted) return;
    if (continuePractice == true) {
      _segmentStartedAt = DateTime.now();
      _checkpointOpen = false;
      return;
    }
    if (continuePractice == false) {
      Navigator.of(context).pop(widget.finishOnPop ? _messages : null);
      return;
    }
    // Dialog dismissed unexpectedly — ask once more, then end on silence.
    if (!askAgain) {
      await Future<void>.delayed(const Duration(seconds: 20));
      if (!mounted) return;
      await _showSegmentDialog(askAgain: true);
      return;
    }
    if (!mounted) return;
    Navigator.of(context).pop(widget.finishOnPop ? _messages : null);
  }

  Future<void> _bootstrap() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final sessionId = widget.sessionId;
      if (sessionId != null && sessionId.isNotEmpty) {
        final messages = await TutorChatApiService.listMessages(sessionId);
        if (!mounted) return;
        setState(() {
          _sessionId = sessionId;
          _messages
            ..clear()
            ..addAll(messages);
          _loading = false;
        });
      } else {
        final session = await TutorChatApiService.openSession(
          tutorId: widget.tutorId,
          tutorSlug: widget.tutorSlug,
          forceNew: widget.forceNew,
          title: widget.sessionTitle,
          openingMessage: widget.openingMessage,
          lessonSlug: widget.lessonSlug,
          kind: widget.kind,
        );
        final messages = await TutorChatApiService.listMessages(session.id);
        if (!mounted) return;
        setState(() {
          _sessionId = session.id;
          _messages
            ..clear()
            ..addAll(messages);
          _loading = false;
        });
      }
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e is ApiException ? e.message : e.toString();
      });
    }
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    final sessionId = _sessionId;
    if (text.isEmpty || sessionId == null || _sending) return;

    setState(() {
      _sending = true;
      _error = null;
      _messages.add(
        TutorChatMessageDto(
          id: 'local-user-${DateTime.now().microsecondsSinceEpoch}',
          sessionId: sessionId,
          role: 'user',
          content: text,
        ),
      );
    });
    _controller.clear();
    _scrollToBottom();

    try {
      final result = await TutorChatApiService.sendMessage(
        sessionId: sessionId,
        content: text,
      );
      if (!mounted) return;
      setState(() {
        // Replace optimistic user bubble with server ids.
        final lastUserIdx = _messages.lastIndexWhere((m) => m.isUser);
        if (lastUserIdx >= 0) {
          _messages[lastUserIdx] = result.userMessage;
        }
        _messages.add(result.assistantMessage);
        _sending = false;
      });
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _sending = false;
        _error = e is ApiException ? e.message : e.toString();
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: AppText.current.common.back,
          onPressed: () => Navigator.of(context).pop(
            widget.finishOnPop ? _messages : null,
          ),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            ClipOval(
              child: HomeAsset(
                widget.imagePath,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.tutorName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
            ),
          ],
        ),
        actions: [
          if (widget.finishOnPop)
            TextButton(
              onPressed: () => Navigator.of(context).pop(_messages),
              child: Text(
                AppText.current.lessonPage.finishLesson,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          if (_error != null)
            Material(
              color: const Color(0xFFFFEBEE),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _error!,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xFFB71C1C),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _loading ? null : _bootstrap,
                      child: const Text('Tekrar dene'),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    itemCount: _messages.length + (_sending ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (_sending && index == _messages.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _Dot(),
                                  SizedBox(width: 4),
                                  _Dot(),
                                  SizedBox(width: 4),
                                  _Dot(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      final message = _messages[index];
                      final top = index == 0 ? 0.0 : 8.0;
                      return Padding(
                        padding: EdgeInsets.only(top: top),
                        child: message.isUser
                            ? _OutgoingBubble(message: message.content)
                            : _IncomingBubble(
                                message: message.content,
                                imagePath: widget.imagePath,
                              ),
                      );
                    },
                  ),
          ),
          SafeArea(
            top: false,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: TextField(
                        controller: _controller,
                        enabled: !_loading && _sessionId != null && !_sending,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _send(),
                        decoration: InputDecoration(
                          hintText: text.typeMessage,
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: AppColors.secondary,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Material(
                    color: AppColors.primary,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: _sending || _loading ? null : _send,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: _sending
                            ? const Padding(
                                padding: EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IncomingBubble extends StatelessWidget {
  const _IncomingBubble({required this.message, required this.imagePath});

  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipOval(
          child: HomeAsset(
            imagePath,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OutgoingBubble extends StatelessWidget {
  const _OutgoingBubble({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.72,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            height: 1.4,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
