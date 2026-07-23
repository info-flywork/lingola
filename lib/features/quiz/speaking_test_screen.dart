import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';

class SpeakingTestScreen extends StatefulWidget {
  const SpeakingTestScreen({super.key});

  @override
  State<SpeakingTestScreen> createState() => _SpeakingTestScreenState();
}

class _SpeakingTestScreenState extends State<SpeakingTestScreen>
    with SingleTickerProviderStateMixin {
  static const _prompts = <_SpeakingPrompt>[
    _SpeakingPrompt(
      en: 'Describe your favorite hobby.',
      tr: 'En sevdiğin hobini anlat.',
      keywords: ['hobby', 'read', 'music', 'sport', 'movie', 'film'],
    ),
    _SpeakingPrompt(
      en: 'Talk about your last weekend.',
      tr: 'Geçen hafta sonunu anlat.',
      keywords: ['weekend', 'saturday', 'sunday', 'friend', 'home'],
    ),
    _SpeakingPrompt(
      en: 'What makes you happy?',
      tr: 'Seni ne mutlu eder?',
      keywords: ['happy', 'family', 'friend', 'music', 'travel'],
    ),
    _SpeakingPrompt(
      en: 'Describe your favorite food.',
      tr: 'En sevdiğin yemeği anlat.',
      keywords: ['food', 'eat', 'pizza', 'pasta', 'rice', 'soup'],
    ),
    _SpeakingPrompt(
      en: 'Where do you want to travel?',
      tr: 'Nereye seyahat etmek istersin?',
      keywords: ['travel', 'visit', 'country', 'city', 'beach'],
    ),
    _SpeakingPrompt(
      en: 'Tell me about your best friend.',
      tr: 'En iyi arkadaşını anlat.',
      keywords: ['friend', 'kind', 'funny', 'meet', 'together'],
    ),
  ];

  final _speech = SpeechToText();

  late final AnimationController _waveController;
  Timer? _ticker;

  var _index = 0;
  var _speechReady = false;
  var _isRecording = false;
  var _hasRecording = false;
  var _showTranslation = false;
  var _level = 0.2;
  var _elapsed = Duration.zero;
  var _recordedDuration = Duration.zero;
  var _heardText = '';

  _SpeakingPrompt get _current => _prompts[_index];

  String get _durationLabel {
    final value = _isRecording ? _elapsed : _recordedDuration;
    final minutes = value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    _initSpeech();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _waveController.dispose();
    _speech.stop();
    super.dispose();
  }

  Future<void> _initSpeech() async {
    final ready = await _speech.initialize(
      onError: (_) {
        if (!mounted) return;
        _stopRecording(evaluate: false);
      },
      onStatus: (status) {
        if (!mounted) return;
        if (_isRecording &&
            (status == 'done' || status == 'notListening')) {
          _stopRecording(evaluate: false);
        }
      },
    );
    if (!mounted) return;
    setState(() => _speechReady = ready);
  }

  void _resetForQuestion() {
    _ticker?.cancel();
    _ticker = null;
    _isRecording = false;
    _hasRecording = false;
    _heardText = '';
    _level = 0.2;
    _elapsed = Duration.zero;
    _recordedDuration = Duration.zero;
    _showTranslation = false;
  }

  Future<void> _goPrevious() async {
    if (_index == 0) return;
    await _stopRecording(evaluate: false);
    if (!mounted) return;
    setState(() {
      _index -= 1;
      _resetForQuestion();
    });
  }

  Future<void> _goNext() async {
    if (_index >= _prompts.length - 1) return;
    await _stopRecording(evaluate: false);
    if (!mounted) return;
    setState(() {
      _index += 1;
      _resetForQuestion();
    });
  }

  Future<void> _toggleSpeakUp() async {
    if (_isRecording) {
      await _stopRecording(evaluate: false);
      return;
    }
    await _startRecording();
  }

  Future<void> _startRecording() async {
    final text = AppText.current.quizPage;
    if (!_speechReady) await _initSpeech();
    if (!_speechReady) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.micPermissionDenied)),
      );
      return;
    }

    setState(() {
      _isRecording = true;
      _hasRecording = false;
      _heardText = '';
      _level = 0.25;
      _elapsed = Duration.zero;
      _recordedDuration = Duration.zero;
    });

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !_isRecording) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    await _speech.listen(
      onSoundLevelChange: (level) {
        if (!mounted || !_isRecording) return;
        final normalized = ((level + 2) / 12).clamp(0.15, 1.0);
        setState(() => _level = normalized.toDouble());
      },
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.confirmation,
        partialResults: true,
        cancelOnError: true,
        localeId: 'en_US',
        listenFor: const Duration(seconds: 60),
        pauseFor: const Duration(seconds: 3),
      ),
      onResult: (result) {
        if (!mounted) return;
        setState(() => _heardText = result.recognizedWords);
        if (result.finalResult) {
          _stopRecording(evaluate: false);
        }
      },
    );
  }

  Future<void> _stopRecording({required bool evaluate}) async {
    final wasRecording = _isRecording;
    _ticker?.cancel();
    _ticker = null;

    if (_speech.isListening) {
      await _speech.stop();
    }
    if (!mounted) return;

    setState(() {
      _isRecording = false;
      if (wasRecording) {
        _hasRecording = true;
        _recordedDuration = _elapsed;
      }
    });

    if (evaluate && wasRecording) {
      await _evaluateAnswer();
    }
  }

  Future<void> _submit() async {
    if (_isRecording) {
      await _stopRecording(evaluate: true);
      return;
    }
    if (!_hasRecording) return;
    await _evaluateAnswer();
  }

  Future<void> _evaluateAnswer() async {
    final heard = _heardText;
    final matched = _matchesPrompt(heard, _current);
    if (matched) {
      await _showResultSheet(
        iconAsset: AppAssets.success,
        title: AppText.current.quizPage.successfulTitle,
        body: AppText.current.quizPage.successfulBody,
        buttonLabel: AppText.current.wordPracticePage.next,
        onPressed: _goNext,
      );
      return;
    }

    await _showResultSheet(
      iconAsset: AppAssets.failed,
      title: AppText.current.quizPage.failedTitle,
      body: AppText.current.quizPage.failedBody,
      buttonLabel: AppText.current.quizPage.tryAgain,
      onPressed: () {},
    );
  }

  Future<void> _showResultSheet({
    required String iconAsset,
    required String title,
    required String body,
    required String buttonLabel,
    required VoidCallback onPressed,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: .35),
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeAsset(iconAsset, width: 55, height: 56),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 24 / 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    height: 20 / 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.32,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  label: buttonLabel,
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    onPressed();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static bool _matchesPrompt(String heard, _SpeakingPrompt prompt) {
    final normalized = heard
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (normalized.isEmpty) return false;
    return prompt.keywords.any(normalized.contains);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.quizPage;
    final practice = AppText.current.wordPracticePage;
    final prompt = _showTranslation ? _current.tr : _current.en;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      text.speakingTestTitle,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(19, 0, 19, 10),
                  children: [
                    _SpeakingCard(
                      questionLabel: text.questionOf(
                        current: _index + 1,
                        total: _prompts.length,
                      ),
                      progressIndex: _index,
                      total: _prompts.length,
                      title: text.speakingProficiency,
                      hint: text.speakClearlyHint,
                      prompt: '“$prompt”',
                      speakUpLabel: text.speakUp,
                      submitLabel: text.submit,
                      recordingLabel: text.recording,
                      durationLabel: _durationLabel,
                      isRecording: _isRecording,
                      hasRecording: _hasRecording,
                      level: _level,
                      wave: _waveController,
                      onTranslate: () => setState(
                        () => _showTranslation = !_showTranslation,
                      ),
                      onSpeak: () {},
                      onHint: () {},
                      onSpeakUp: _toggleSpeakUp,
                      onSubmit: _submit,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(19, 0, 19, 16),
                child: Column(
                  children: [
                    Opacity(
                      opacity: _index == 0 ? 0.45 : 1,
                      child: IgnorePointer(
                        ignoring: _index == 0,
                        child: SecondaryButton(
                          label: practice.previous,
                          onPressed: _goPrevious,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Opacity(
                      opacity: _index >= _prompts.length - 1 ? 0.45 : 1,
                      child: IgnorePointer(
                        ignoring: _index >= _prompts.length - 1,
                        child: PrimaryButton(
                          label: practice.next,
                          onPressed: _goNext,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpeakingPrompt {
  const _SpeakingPrompt({
    required this.en,
    required this.tr,
    required this.keywords,
  });

  final String en;
  final String tr;
  final List<String> keywords;
}

class _SpeakingCard extends StatelessWidget {
  const _SpeakingCard({
    required this.questionLabel,
    required this.progressIndex,
    required this.total,
    required this.title,
    required this.hint,
    required this.prompt,
    required this.speakUpLabel,
    required this.submitLabel,
    required this.recordingLabel,
    required this.durationLabel,
    required this.isRecording,
    required this.hasRecording,
    required this.level,
    required this.wave,
    required this.onTranslate,
    required this.onSpeak,
    required this.onHint,
    required this.onSpeakUp,
    required this.onSubmit,
  });

  final String questionLabel;
  final int progressIndex;
  final int total;
  final String title;
  final String hint;
  final String prompt;
  final String speakUpLabel;
  final String submitLabel;
  final String recordingLabel;
  final String durationLabel;
  final bool isRecording;
  final bool hasRecording;
  final double level;
  final Animation<double> wave;
  final VoidCallback onTranslate;
  final VoidCallback onSpeak;
  final VoidCallback onHint;
  final VoidCallback onSpeakUp;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final showPanel = isRecording || hasRecording;
    final showSubmit = hasRecording && !isRecording;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              questionLabel,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.24,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _SegmentProgress(index: progressIndex, total: total),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const HomeAsset(
              AppAssets.speakingHead,
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            hint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            prompt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              height: 24 / 22,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _IconTap(
                onTap: onTranslate,
                child: const HomeAsset(
                  AppAssets.writingTranslate,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              _IconTap(
                onTap: onSpeak,
                child: const HomeAsset(
                  AppAssets.speaker,
                  width: 24,
                  height: 24,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: 12),
              _IconTap(
                onTap: onHint,
                child: const HomeAsset(
                  AppAssets.hint,
                  width: 22,
                  height: 22,
                ),
              ),
              const Spacer(),
              if (showSubmit)
                _SubmitPill(
                  label: submitLabel,
                  onTap: onSubmit,
                )
              else
                _SpeakUpButton(
                  label: speakUpLabel,
                  active: isRecording,
                  onTap: onSpeakUp,
                ),
            ],
          ),
          if (showPanel) ...[
            const SizedBox(height: 16),
            _RecordingPanel(
              isRecording: isRecording,
              recordingLabel: recordingLabel,
              durationLabel: durationLabel,
              level: level,
              wave: wave,
            ),
          ],
        ],
      ),
    );
  }
}

class _SegmentProgress extends StatelessWidget {
  const _SegmentProgress({
    required this.index,
    required this.total,
  });

  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < total; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: i <= index
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: .10),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _SpeakUpButton extends StatelessWidget {
  const _SpeakUpButton({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = active
        ? AppColors.primary
        : AppColors.primary.withValues(alpha: .10);

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(9999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  height: 18 / 13,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              HomeAsset(
                AppAssets.microphone,
                width: 18,
                height: 18,
                color: active ? Colors.white : AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitPill extends StatelessWidget {
  const _SubmitPill({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(9999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  height: 18 / 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const HomeAsset(
                AppAssets.writingSubmit,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecordingPanel extends StatelessWidget {
  const _RecordingPanel({
    required this.isRecording,
    required this.recordingLabel,
    required this.durationLabel,
    required this.level,
    required this.wave,
  });

  final bool isRecording;
  final String recordingLabel;
  final String durationLabel;
  final double level;
  final Animation<double> wave;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 72,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: wave,
              builder: (context, _) {
                return CustomPaint(
                  painter: _SineWavePainter(
                    progress: isRecording ? wave.value : 0.15,
                    amplitude: isRecording ? level : 0.55,
                    color: AppColors.primary,
                    animate: isRecording,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          if (isRecording)
            Text(
              recordingLabel,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .10),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                durationLabel,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  height: 18 / 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.24,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _IconTap extends StatelessWidget {
  const _IconTap({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: child,
      ),
    );
  }
}

/// Figma’daki mavi sine-wave recording göstergesi.
class _SineWavePainter extends CustomPainter {
  _SineWavePainter({
    required this.progress,
    required this.amplitude,
    required this.color,
    this.animate = true,
  });

  final double progress;
  final double amplitude;
  final Color color;
  final bool animate;

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height / 2;
    final baseAmp = size.height * 0.18 * (0.35 + amplitude * 0.9);
    final phase = progress * math.pi * 2;

    final axis = Paint()
      ..color = color.withValues(alpha: .35)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, midY), Offset(size.width, midY), axis);

    for (var layer = 0; layer < 3; layer++) {
      final path = Path();
      final amp = baseAmp * (1 - layer * 0.22);
      final freq = 2.2 + layer * 0.55;
      final layerPhase = phase + layer * 0.7;

      for (var x = 0.0; x <= size.width; x += 1.5) {
        final t = x / size.width;
        final envelope = math.sin(t * math.pi).clamp(0.15, 1.0);
        final y = midY +
            math.sin((t * freq * math.pi * 2) + layerPhase) * amp * envelope;
        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }

      final paint = Paint()
        ..color = color.withValues(alpha: 1 - layer * 0.25)
        ..strokeWidth = 1.6 - layer * 0.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SineWavePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.amplitude != amplitude ||
        oldDelegate.color != color ||
        oldDelegate.animate != animate;
  }
}
