import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' show Fit;

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'services/calling_conversation_controller.dart';
import 'widgets/tutor_rive_avatar.dart';

/// Start Talk Now → sesli görüşme (Figma calling) ekranı.
class CallingScreen extends StatefulWidget {
  const CallingScreen({
    required this.tutorName,
    required this.imagePath,
    this.riveAsset,
    this.voiceId,
    super.key,
  });

  final String tutorName;
  final String imagePath;
  /// Varsa Rive avatar (dudak senkronu); yoksa [imagePath].
  final String? riveAsset;
  /// ElevenLabs voice ID (hoca özel sesi).
  final String? voiceId;

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  late final Stopwatch _watch;
  late final CallingConversationController _conversation;
  Timer? _ticker;
  var _elapsed = Duration.zero;

  /// Altyazı paneli (göz) — konuşma balonları her zaman görünür.
  var _captionsOn = true;

  /// İpucu (ampul).
  var _hintsOn = false;

  @override
  void initState() {
    super.initState();
    _watch = Stopwatch()..start();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _elapsed = _watch.elapsed);
    });
    _conversation = CallingConversationController(voiceId: widget.voiceId)
      ..addListener(_onConvo);
    unawaited(_conversation.start());
  }

  void _onConvo() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _conversation
      ..removeListener(_onConvo)
      ..dispose();
    super.dispose();
  }

  String get _timerLabel {
    final h = _elapsed.inHours.toString().padLeft(2, '0');
    final m = (_elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final s = (_elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final calling = text.calling;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final listening = _conversation.listening;
    final busy = _conversation.busy;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF1A2A4A),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2D46FF),
                    Color(0xFF5B9FFF),
                    Color(0xFFB8D4F0),
                  ],
                  stops: [0, 0.35, 1],
                ),
              ),
            ),
            // Hoca kartındaki riveAsset; yoksa statik görsel.
            Positioned.fill(
              child: widget.riveAsset != null
                  ? TutorRiveAvatar(
                      assetPath: widget.riveAsset!,
                      talking: _conversation.speaking,
                      fallbackImage: widget.imagePath,
                      fit: Fit.cover,
                      alignment: const Alignment(0, -0.35),
                    )
                  : Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.35),
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 160,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x992D46FF),
                      Color(0x002D46FF),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 320,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0x99000000),
                    ],
                  ),
                ),
              ),
            ),

            SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Row(
                    children: [
                      _GlassCircleButton(
                        onTap: () {},
                        child: const HomeAsset(
                          AppAssets.callingResize,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _GlassPill(
                        child: Text(
                          text.tutors.lingola,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      _GlassPill(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF3B30),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _timerLabel,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFeatures: [FontFeature.tabularFigures()],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      _GlassCircleButton(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              bottom: bottom + 28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_captionsOn) ...[
                    _ScrollingChat(
                      messages: _conversation.messages,
                      onTranslateSentence:
                          _conversation.toggleSentenceTranslation,
                      onTranslateWord: _conversation.translateText,
                    ),
                    const SizedBox(height: 12),
                  ],
                  if (_conversation.listening) ...[
                    const Text(
                      'Basılı tut — konuş — bırak',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (_conversation.error != null) ...[
                    Text(
                      _conversation.error!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: .75),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  _GlassPill(
                    child: Text(
                      calling.lessonBadge,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ControlCircle(
                        size: 56,
                        onTap: () =>
                            setState(() => _captionsOn = !_captionsOn),
                        child: HomeAsset(
                          _captionsOn
                              ? AppAssets.callingEye
                              : AppAssets.callingClosedEye,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 28),
                      _MicButton(
                        active: listening || (!busy && _captionsOn),
                        listening: listening,
                        busy: busy,
                        onPressStart: () =>
                            unawaited(_conversation.startListening()),
                        onPressEnd: () =>
                            unawaited(_conversation.stopListening()),
                      ),
                      const SizedBox(width: 28),
                      _ControlCircle(
                        size: 56,
                        onTap: () => setState(() => _hintsOn = !_hintsOn),
                        child: HomeAsset(
                          _hintsOn ? AppAssets.lightbulb : AppAssets.hint,
                          width: 22,
                          height: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Figma: kayan mesaj balonları (mavi %30 / beyaz %40) + kelime/cümle çeviri.
class _ScrollingChat extends StatelessWidget {
  const _ScrollingChat({
    required this.messages,
    required this.onTranslateSentence,
    required this.onTranslateWord,
  });

  final List<CallMessage> messages;
  final Future<void> Function(int messageIndex) onTranslateSentence;
  final Future<String> Function(String word) onTranslateWord;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const SizedBox(height: 120);
    }

    return SizedBox(
      height: 200,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.white,
            ],
            stops: [0, 0.18, 1],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: ListView.builder(
          reverse: true,
          padding: EdgeInsets.zero,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            // reverse: index 0 = en yeni
            final messageIndex = messages.length - 1 - index;
            final msg = messages[messageIndex];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ChatBubble(
                message: msg,
                onTranslateSentence: () => onTranslateSentence(messageIndex),
                onTranslateWord: onTranslateWord,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChatBubble extends StatefulWidget {
  const _ChatBubble({
    required this.message,
    required this.onTranslateSentence,
    required this.onTranslateWord,
  });

  final CallMessage message;
  final Future<void> Function() onTranslateSentence;
  final Future<String> Function(String word) onTranslateWord;

  @override
  State<_ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<_ChatBubble> {
  String? _selectedWord;
  String? _wordTranslation;
  var _wordBusy = false;
  var _sentenceBusy = false;
  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void didUpdateWidget(covariant _ChatBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.text != widget.message.text) {
      _clearWordSelection();
    }
  }

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    super.dispose();
  }

  void _clearWordSelection() {
    _selectedWord = null;
    _wordTranslation = null;
    _wordBusy = false;
  }

  Future<void> _onWordTap(String raw) async {
    final word = raw.replaceAll(RegExp(r"[^\w'\-]+"), '');
    if (word.isEmpty) return;

    if (_selectedWord == word && _wordTranslation != null) {
      setState(_clearWordSelection);
      return;
    }

    setState(() {
      _selectedWord = word;
      _wordTranslation = null;
      _wordBusy = true;
    });

    try {
      final tr = await widget.onTranslateWord(word);
      if (!mounted || _selectedWord != word) return;
      setState(() {
        _wordTranslation = tr.isEmpty ? '—' : tr;
        _wordBusy = false;
      });
    } catch (_) {
      if (!mounted || _selectedWord != word) return;
      setState(() {
        _wordTranslation = 'Çeviri alınamadı';
        _wordBusy = false;
      });
    }
  }

  Future<void> _onSentenceTap() async {
    setState(() => _sentenceBusy = true);
    try {
      await widget.onTranslateSentence();
    } finally {
      if (mounted) setState(() => _sentenceBusy = false);
    }
  }

  List<InlineSpan> _buildWordSpans({
    required bool isTutor,
    required Color baseColor,
  }) {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();

    final spans = <InlineSpan>[];
    // Boşlukları ayrı TextSpan yapma — gesture’lı span’lerde Flutter
    // whitespace-only span’leri yutabiliyor (birleşik yazı).
    final words = widget.message.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final display = i < words.length - 1 ? '$word ' : word;
      final clean = word.replaceAll(RegExp(r"[^\w'\-]+"), '');

      if (!isTutor || clean.isEmpty) {
        spans.add(TextSpan(text: display, style: TextStyle(color: baseColor)));
        continue;
      }

      final selected = _selectedWord == clean;
      final recognizer = TapGestureRecognizer()
        ..onTap = () => _onWordTap(word);
      _recognizers.add(recognizer);

      spans.add(
        TextSpan(
          text: display,
          recognizer: recognizer,
          style: TextStyle(
            color: selected ? Colors.white : baseColor,
            backgroundColor:
                selected ? AppColors.primary : Colors.transparent,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final isTutor = widget.message.role == CallMessageRole.tutor;
    final baseColor = isTutor ? Colors.white : AppColors.ink;
    final showWordTip =
        isTutor && _selectedWord != null && (_wordBusy || _wordTranslation != null);

    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isTutor
            ? const Color(0xFF2D46FF).withValues(alpha: 0.30)
            : Colors.white.withValues(alpha: 0.40),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showWordTip) ...[
            _WordTranslationTip(
              text: _wordBusy
                  ? '…'
                  : (_wordTranslation ?? ''),
            ),
            const SizedBox(height: 8),
          ],
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: baseColor,
              ),
              children: _buildWordSpans(isTutor: isTutor, baseColor: baseColor),
            ),
          ),
          if (isTutor && widget.message.translation != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.message.translation!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                height: 1.35,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.92),
              ),
            ),
          ],
        ],
      ),
    );

    if (!isTutor) {
      return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: bubble,
        ),
      );
    }

    return Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 260),
                child: bubble,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _TranslateCircleButton(
            busy: _sentenceBusy,
            active: widget.message.translation != null,
            onTap: _onSentenceTap,
          ),
        ],
      ),
    );
  }
}

class _WordTranslationTip extends StatelessWidget {
  const _WordTranslationTip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          height: 1.2,
        ),
      ),
    );
  }
}

class _TranslateCircleButton extends StatelessWidget {
  const _TranslateCircleButton({
    required this.onTap,
    required this.busy,
    required this.active,
  });

  final VoidCallback onTap;
  final bool busy;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.primary.withValues(alpha: 0.85) : AppColors.primary,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: busy ? null : onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: busy
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const HomeAsset(
                    AppAssets.writingTranslate,
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({
    required this.active,
    required this.listening,
    required this.busy,
    required this.onPressStart,
    required this.onPressEnd,
  });

  final bool active;
  final bool listening;
  final bool busy;
  final VoidCallback onPressStart;
  final VoidCallback onPressEnd;

  @override
  Widget build(BuildContext context) {
    final size = listening ? 78.0 : 74.0;
    return Listener(
      onPointerDown: busy
          ? null
          : (_) {
              onPressStart();
            },
      onPointerUp: busy
          ? null
          : (_) {
              onPressEnd();
            },
      onPointerCancel: busy
          ? null
          : (_) {
              onPressEnd();
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: busy
              ? AppColors.primary.withValues(alpha: .55)
              : listening
                  ? const Color(0xFFFF3B30)
                  : AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: (listening ? const Color(0xFFFF3B30) : AppColors.primary)
                  .withValues(alpha: .45),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: busy
            ? const SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : const HomeAsset(
                AppAssets.microphone,
                width: 32,
                height: 32,
                color: Colors.white,
              ),
      ),
    );
  }
}

class _ControlCircle extends StatelessWidget {
  const _ControlCircle({
    required this.size,
    required this.onTap,
    required this.child,
  });

  final double size;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: .28),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: .85)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassPill extends StatelessWidget {
  const _GlassPill({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .45),
        borderRadius: BorderRadius.circular(999),
      ),
      child: child,
    );
  }
}

class _GlassCircleButton extends StatelessWidget {
  const _GlassCircleButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: .45),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(child: child),
        ),
      ),
    );
  }
}
