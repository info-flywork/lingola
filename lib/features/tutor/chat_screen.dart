import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/auth/session_store.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/premium/premium_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/chat_session_action_bar.dart';
import '../../widgets/home_asset.dart';
import '../../widgets/chat_word_chip.dart';
import '../lesson/lesson_session_result.dart';
import 'services/hold_to_speak_service.dart';
import 'services/openai_chat_service.dart';
import 'services/tutor_chat_api_service.dart';
import 'services/tutor_tts_service.dart';
import 'calling_screen.dart';

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
    this.initialElapsed = Duration.zero,
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
  final Duration initialElapsed;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _textFocus = FocusNode();
  final _scrollController = ScrollController();
  final _messages = <TutorChatMessageDto>[];
  /// Boş alana tıklanınca kelime seçimini temizler.
  final _wordSelectionEpoch = ValueNotifier<int>(0);
  late final HoldToSpeakService _mic;

  String? _sessionId;
  var _loading = true;
  var _sending = false;
  String? _error;
  Timer? _segmentTimer;
  DateTime _segmentStartedAt = DateTime.now();
  var _checkpointOpen = false;
  late final Stopwatch _watch;

  var _textComposeOn = false;
  var _recording = false;
  var _transcribing = false;
  Timer? _recordingTicker;
  Duration _recordingElapsed = Duration.zero;
  var _hintLoading = false;
  var _hintsOn = false;

  @override
  void initState() {
    super.initState();
    _mic = HoldToSpeakService(
      multilingual: true,
      nativeLanguageCode:
          SessionStore.currentUser?.onboarding?.nativeLanguageCode,
    );
    _watch = Stopwatch()..start();
    _segmentStartedAt = DateTime.now();
    if (widget.lessonSegmentMode || widget.finishOnPop) {
      _segmentTimer = Timer.periodic(const Duration(seconds: 5), (_) {
        _maybeOfferSegment();
      });
    }
    _bootstrap();
  }

  int get _sessionElapsedSeconds =>
      (widget.initialElapsed + _watch.elapsed).inSeconds;

  bool get _composerBusy =>
      _loading || _sessionId == null || _sending || _transcribing;

  void _popSession({required bool finish}) {
    if (widget.lessonSegmentMode) {
      Navigator.of(context).pop(
        LessonSessionResult(
          finish: finish,
          elapsedSeconds: _sessionElapsedSeconds,
          chatMessages: List<TutorChatMessageDto>.of(_messages),
        ),
      );
      return;
    }
    Navigator.of(context).pop(widget.finishOnPop ? _messages : null);
  }

  @override
  void dispose() {
    _segmentTimer?.cancel();
    _recordingTicker?.cancel();
    unawaited(_mic.dispose());
    _controller.dispose();
    _textFocus.dispose();
    _scrollController.dispose();
    _wordSelectionEpoch.dispose();
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
      _popSession(finish: true);
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
    _popSession(finish: true);
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
        final result = await TutorChatApiService.openSession(
          tutorId: widget.tutorId,
          tutorSlug: widget.tutorSlug,
          forceNew: widget.forceNew,
          title: widget.sessionTitle,
          openingMessage: widget.openingMessage,
          lessonSlug: widget.lessonSlug,
          kind: widget.kind,
        );
        final messages = await TutorChatApiService.listMessages(result.session.id);
        if (!mounted) return;
        setState(() {
          _sessionId = result.session.id;
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
    await _sendText(_controller.text.trim());
  }

  Future<void> _sendText(String text) async {
    final sessionId = _sessionId;
    if (text.isEmpty || sessionId == null || _sending) return;

    setState(() {
      _sending = true;
      _error = null;
      _textComposeOn = false;
      _hintsOn = false;
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
    _textFocus.unfocus();
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

  void _startRecordingTimer() {
    _recordingTicker?.cancel();
    _recordingElapsed = Duration.zero;
    _recordingTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !_recording) return;
      setState(() => _recordingElapsed += const Duration(seconds: 1));
    });
  }

  void _stopRecordingTimer() {
    _recordingTicker?.cancel();
    _recordingTicker = null;
    _recordingElapsed = Duration.zero;
  }

  Future<void> _onMicHoldStart() async {
    if (_composerBusy || _recording) return;
    setState(() {
      _recording = true;
      _error = null;
    });
    _startRecordingTimer();
    try {
      await _mic.start();
      if (!mounted) return;
    } catch (e) {
      if (!mounted) return;
      _stopRecordingTimer();
      setState(() {
        _recording = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _onMicHoldSend() async {
    if (!_recording) return;
    await _stopMicAndSend();
  }

  Future<void> _stopMicAndSend() async {
    if (!_recording) return;
    _stopRecordingTimer();
    setState(() {
      _recording = false;
      _transcribing = true;
    });
    try {
      final text = (await _mic.stopAndGetText()).trim();
      if (!mounted) return;
      setState(() => _transcribing = false);
      if (text.isEmpty) {
        setState(() => _error = 'Ses anlaşılamadı — tekrar dene');
        return;
      }
      await _sendText(text);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _transcribing = false;
        _error = e.toString();
      });
    }
  }

  void _toggleTextCompose() {
    setState(() {
      _textComposeOn = !_textComposeOn;
      if (!_textComposeOn) _textFocus.unfocus();
    });
    if (_textComposeOn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _textFocus.requestFocus();
      });
    }
  }

  Future<void> _requestHint() async {
    if (_hintLoading || _composerBusy) return;
    if (_hintsOn) {
      setState(() => _hintsOn = false);
      return;
    }
    String? lastBot;
    for (var i = _messages.length - 1; i >= 0; i--) {
      if (!_messages[i].isUser) {
        lastBot = _messages[i].content;
        break;
      }
    }
    if (lastBot == null || lastBot.trim().isEmpty) return;
    setState(() {
      _hintsOn = true;
      _hintLoading = true;
      _textComposeOn = true;
    });
    try {
      final hint = await OpenAiChatService().suggestStudentReply(
        tutorLastMessage: lastBot,
        lessonContext: widget.sessionTitle ?? 'English practice',
      );
      if (!mounted) return;
      final cleaned = hint.trim();
      setState(() {
        _hintLoading = false;
        if (cleaned.isEmpty) {
          _hintsOn = false;
        } else {
          _controller.text = cleaned;
        }
      });
      _textFocus.requestFocus();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hintLoading = false;
        _hintsOn = false;
        _error = e.toString();
      });
    }
  }

  Widget _buildComposer() {
    final hint = AppText.current.tutorPage.typeMessage;
    if (_textComposeOn && !_recording) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, _) {
            final hasText = value.text.trim().isNotEmpty;
            return Row(
              children: [
                Material(
                  color: ChatSessionActionBar.sideButtonBg,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: _composerBusy ? null : _toggleTextCompose,
                    child: const SizedBox(
                      width: 44,
                      height: 44,
                      child: Icon(
                        Icons.mic_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.only(left: 16, right: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: .05),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            focusNode: _textFocus,
                            enabled: !_composerBusy,
                            autofocus: true,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) {
                              if (hasText) unawaited(_send());
                            },
                            decoration: InputDecoration(
                              hintText: hint,
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: AppColors.secondary,
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: !_composerBusy && hasText
                                ? () => unawaited(_send())
                                : null,
                            child: const HomeAsset(
                              AppAssets.send,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: ChatSessionActionBar(
        holdToRecord: false,
        enableMic: !_composerBusy,
        busy: _composerBusy && !_recording,
        micBusy: _transcribing,
        listening: _recording,
        hintActive: _hintsOn,
        hintLoading: _hintLoading,
        onMessage: _toggleTextCompose,
        onHint: () => unawaited(_requestHint()),
        onMicTap: () => unawaited(_toggleMicTap()),
      ),
    );
  }

  Future<void> _toggleMicTap() async {
    if (_composerBusy || _transcribing) return;
    if (_recording) {
      await _onMicHoldSend();
      return;
    }
    await _onMicHoldStart();
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

  Future<void> _openVideoCall() async {
    final slug = widget.tutorSlug ?? 'lingola';
    if (!await PremiumService.requireTutorOrPaywall(context, slug)) return;
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CallingScreen(
          tutorName: widget.tutorName,
          imagePath: widget.imagePath,
          tutorSlug: slug,
          voiceId: TutorVoiceIds.resolve(slug),
          riveCdnUrl: AppAssets.tutorRiveCdn(slug),
          lessonSlug: widget.lessonSlug,
          lessonSegmentMode: widget.lessonSegmentMode,
          segmentDuration: widget.segmentDuration,
          initialElapsed: widget.initialElapsed + _watch.elapsed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: AppText.current.common.back,
          onPressed: () => _popSession(finish: false),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF2D46FF), width: 3),
              ),
              child: ClipOval(
                child: HomeAsset(
                  widget.imagePath,
                  width: 37,
                  height: 37,
                  fit: BoxFit.cover,
                ),
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
          IconButton(
            tooltip: 'Video call',
            onPressed: _loading ? null : _openVideoCall,
            icon: const HomeAsset(
              AppAssets.chatVideo,
              width: 28,
              height: 28,
            ),
          ),
          if (widget.finishOnPop)
            TextButton(
              onPressed: () => _popSession(finish: true),
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
                : GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _wordSelectionEpoch.value++,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      itemCount: _messages.length + (_sending ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_sending && index == _messages.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _TypingIndicator(imagePath: widget.imagePath),
                          );
                        }
                        final message = _messages[index];
                        final top = index == 0 ? 0.0 : 10.0;
                        return Padding(
                          padding: EdgeInsets.only(top: top),
                          child: message.isUser
                              ? _OutgoingBubble(message: message.content)
                              : _IncomingBubble(
                                  message: message.content,
                                  imagePath: widget.imagePath,
                                  dismissEpoch: _wordSelectionEpoch,
                                  voiceId: TutorVoiceIds.resolve(
                                    widget.tutorSlug,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
          ),
          SafeArea(
            top: false,
            child: _buildComposer(),
          ),
        ],
      ),
    );
  }
}

class _IncomingBubble extends StatefulWidget {
  const _IncomingBubble({
    required this.message,
    required this.imagePath,
    required this.dismissEpoch,
    this.voiceId,
  });

  final String message;
  final String imagePath;
  final ValueNotifier<int> dismissEpoch;
  final String? voiceId;

  @override
  State<_IncomingBubble> createState() => _IncomingBubbleState();
}

class _IncomingBubbleState extends State<_IncomingBubble> {
  String? _selectedClean;
  String? _translatedDisplay;
  var _busy = false;
  /// true iken balonda çeviri yerine orijinal kelime gösterilir.
  var _showOriginal = false;
  final _tts = TutorTtsService();
  final _player = AudioPlayer();
  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void initState() {
    super.initState();
    widget.dismissEpoch.addListener(_onDismissEpoch);
  }

  @override
  void didUpdateWidget(covariant _IncomingBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dismissEpoch != widget.dismissEpoch) {
      oldWidget.dismissEpoch.removeListener(_onDismissEpoch);
      widget.dismissEpoch.addListener(_onDismissEpoch);
    }
    if (oldWidget.message != widget.message) {
      _clearSelection();
    }
  }

  @override
  void dispose() {
    widget.dismissEpoch.removeListener(_onDismissEpoch);
    for (final r in _recognizers) {
      r.dispose();
    }
    unawaited(_player.dispose());
    _tts.dispose();
    super.dispose();
  }

  void _onDismissEpoch() {
    if (_selectedClean == null) return;
    setState(_clearSelection);
  }

  void _clearSelection() {
    _selectedClean = null;
    _translatedDisplay = null;
    _busy = false;
    _showOriginal = false;
  }

  String _cleanWord(String raw) =>
      raw.replaceAll(RegExp(r"[^\w'\-]+"), '');

  String _withPunctuation(String original, String translated) {
    final prefix = RegExp(r"^[^\w']+").firstMatch(original)?.group(0) ?? '';
    final suffix = RegExp(r"[^\w']+$").firstMatch(original)?.group(0) ?? '';
    return '$prefix$translated$suffix';
  }

  Future<void> _onWordTap(String raw) async {
    final clean = _cleanWord(raw);
    if (clean.isEmpty) return;

    // Aynı kelimeye tekrar → kapat
    if (_selectedClean == clean && _translatedDisplay != null && !_busy) {
      setState(_clearSelection);
      return;
    }

    setState(() {
      _selectedClean = clean;
      _translatedDisplay = null;
      _busy = true;
      _showOriginal = false;
    });

    try {
      final tr = await OpenAiChatService().translateToNative(clean);
      if (!mounted || _selectedClean != clean) return;
      final trimmed = tr.trim();
      setState(() {
        _translatedDisplay = trimmed.isEmpty
            ? clean
            : _withPunctuation(raw, trimmed);
        _busy = false;
      });
    } catch (_) {
      if (!mounted || _selectedClean != clean) return;
      setState(() {
        _translatedDisplay = raw;
        _busy = false;
      });
    }
  }

  Future<void> _onTranslateIcon() async {
    if (_selectedClean == null) return;
    if (_busy) return;
    setState(() => _showOriginal = !_showOriginal);
  }

  Future<void> _onSpeakIcon() async {
    final source = _selectedClean;
    if (source == null || source.isEmpty) return;
    try {
      // Öğrenilen İngilizce kelimenin telaffuzu.
      final file = await _tts.synthesizeToFile(
        source,
        voiceId: widget.voiceId,
      );
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (_) {}
  }

  List<InlineSpan> _buildWordSpans() {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();

    const baseStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      height: 20 / 13,
      fontWeight: FontWeight.w400,
      color: Color(0xFF3D3D3D),
    );

    final words = widget.message
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    final spans = <InlineSpan>[];

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final space = i < words.length - 1 ? ' ' : '';
      final clean = _cleanWord(word);
      final selected = _selectedClean != null && _selectedClean == clean;

      if (clean.isEmpty) {
        spans.add(TextSpan(text: '$word$space', style: baseStyle));
        continue;
      }

      final recognizer = TapGestureRecognizer()..onTap = () => _onWordTap(word);
      _recognizers.add(recognizer);

      String display = word;
      if (selected && !_showOriginal && _translatedDisplay != null) {
        display = _translatedDisplay!;
      }

      if (selected) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: space.isEmpty ? 0 : 4),
              child: ChatWordChip(
                label: display,
                fontSize: 13,
                onTap: () => _onWordTap(word),
              ),
            ),
          ),
        );
        if (space.isNotEmpty) {
          spans.add(TextSpan(text: space, style: baseStyle));
        }
        continue;
      }

      spans.add(
        TextSpan(
          text: '$display$space',
          recognizer: recognizer,
          style: baseStyle,
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final showActions = _selectedClean != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: HomeAsset(
            widget.imagePath,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: chatBubbleDecoration(
                    wordSelected: _selectedClean != null,
                    radius: 16,
                  ),
                  child: Text.rich(
                    TextSpan(children: _buildWordSpans()),
                  ),
                ),
              ),
              if (showActions) ...[
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ChatBubbleActionIcon(
                      asset: AppAssets.translate,
                      color: AppColors.primary,
                      onTap: _busy ? null : _onTranslateIcon,
                    ),
                    const SizedBox(width: 6),
                    _ChatBubbleActionIcon(
                      asset: AppAssets.speaker,
                      color: AppColors.secondary,
                      onTap: _busy ? null : _onSpeakIcon,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatBubbleActionIcon extends StatelessWidget {
  const _ChatBubbleActionIcon({
    required this.asset,
    required this.color,
    required this.onTap,
  });

  final String asset;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: color, width: 1.4)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 34,
          height: 34,
          child: Center(
            child: HomeAsset(
              asset,
              width: 16,
              height: 16,
              color: color,
            ),
          ),
        ),
      ),
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
            height: 20 / 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator({required this.imagePath});

  final String imagePath;

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipOval(
          child: HomeAsset(
            widget.imagePath,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withValues(alpha: 0.10)),
          ),
          child: AnimatedBuilder(
            animation: _pulse,
            builder: (context, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    if (i > 0) const SizedBox(width: 4),
                    _TypingDot(
                      phase: (_pulse.value + i / 3) % 1.0,
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TypingDot extends StatelessWidget {
  const _TypingDot({required this.phase});

  final double phase;

  @override
  Widget build(BuildContext context) {
    // 0→1 pulse opacity/scale
    final t = phase < 0.5 ? phase * 2 : (1 - phase) * 2;
    final opacity = 0.35 + 0.65 * t;
    final size = 9.0 + 2.0 * t;
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
