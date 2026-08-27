import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/quiz/quiz_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../tutor/services/tutor_tts_service.dart';

class SpeakingTestScreen extends StatefulWidget {
  const SpeakingTestScreen({super.key});

  @override
  State<SpeakingTestScreen> createState() => _SpeakingTestScreenState();
}

class _SpeakingTestScreenState extends State<SpeakingTestScreen>
    with SingleTickerProviderStateMixin {
  static const _defaultPrompts = <_SpeakingPrompt>[
    _SpeakingPrompt(
      id: 'hobby',
      en: 'Describe your favorite hobby.',
      tr: 'En sevdiğin hobini anlat.',
      exampleEn:
          'My favorite hobby is reading. I usually read novels at night and also listen to music when I relax.',
      keywords: ['hobby', 'read', 'music', 'sport', 'movie', 'film'],
    ),
    _SpeakingPrompt(
      id: 'weekend',
      en: 'Talk about your last weekend.',
      tr: 'Geçen hafta sonunu anlat.',
      exampleEn:
          'Last weekend I stayed home on Saturday and met a friend on Sunday. We watched a movie together.',
      keywords: ['weekend', 'saturday', 'sunday', 'friend', 'home'],
    ),
    _SpeakingPrompt(
      id: 'happy',
      en: 'What makes you happy?',
      tr: 'Seni ne mutlu eder?',
      exampleEn:
          'Spending time with my family makes me happy. I also feel happy when I listen to music or travel.',
      keywords: ['happy', 'family', 'friend', 'music', 'travel'],
    ),
    _SpeakingPrompt(
      id: 'food',
      en: 'Describe your favorite food.',
      tr: 'En sevdiğin yemeği anlat.',
      exampleEn:
          'My favorite food is pizza. I also love pasta and a warm bowl of soup on cold days.',
      keywords: ['food', 'eat', 'pizza', 'pasta', 'rice', 'soup'],
    ),
    _SpeakingPrompt(
      id: 'travel',
      en: 'Where do you want to travel?',
      tr: 'Nereye seyahat etmek istersin?',
      exampleEn:
          'I want to travel to Italy and visit Rome. I also dream of a quiet beach city by the sea.',
      keywords: ['travel', 'visit', 'country', 'city', 'beach'],
    ),
    _SpeakingPrompt(
      id: 'friend',
      en: 'Tell me about your best friend.',
      tr: 'En iyi arkadaşını anlat.',
      exampleEn:
          'My best friend is kind and funny. We meet every week and always have a good time together.',
      keywords: ['friend', 'kind', 'funny', 'meet', 'together'],
    ),
  ];

  var _prompts = _defaultPrompts;

  final _speech = SpeechToText();
  final _tts = TutorTtsService();
  final _player = AudioPlayer();

  late final AnimationController _waveController;
  Timer? _ticker;

  var _index = 0;
  var _speechReady = false;
  var _isRecording = false;
  var _hasRecording = false;
  var _showTranslation = false;
  var _showHint = false;
  var _speakingPrompt = false;
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
    _loadPrompts();
  }

  Future<void> _loadPrompts() async {
    try {
      final remote = await QuizService.fetchSpeakingPrompts();
      if (!mounted || remote.isEmpty) return;
      setState(() {
        _prompts = remote
            .map(
              (row) => _SpeakingPrompt(
                id: row.id,
                en: row.promptEn,
                tr: row.promptNative,
                exampleEn: row.exampleAnswerEn,
                keywords: row.keywords,
              ),
            )
            .toList();
      });
    } catch (_) {
      // Yerel prompt listesi korunur.
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _waveController.dispose();
    _speech.stop();
    _tts.dispose();
    _player.dispose();
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
    _showHint = false;
  }

  String get _promptDisplay {
    if (_showTranslation) return _current.tr;
    return _current.en;
  }

  String? get _exampleHint {
    if (!_showHint) return null;
    final example = _current.exampleEn.trim();
    return example.isEmpty ? null : example;
  }

  Future<void> _speakPrompt() async {
    if (_speakingPrompt) return;
    final text = _current.en.trim();
    if (text.isEmpty) return;

    setState(() => _speakingPrompt = true);
    try {
      final file = await _tts.synthesizeToFile(
        text,
        voiceId: TutorVoiceIds.female,
        modelId: TutorTtsService.flashModel,
      );
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
    } finally {
      if (mounted) setState(() => _speakingPrompt = false);
    }
  }

  void _toggleHint() {
    setState(() {
      _showHint = !_showHint;
      if (_showHint) _showTranslation = false;
    });
  }

  void _toggleTranslation() {
    setState(() {
      _showTranslation = !_showTranslation;
      if (_showTranslation) _showHint = false;
    });
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
    var matched = false;
    try {
      final result = await QuizService.evaluateSpeaking(
        promptId: _current.id,
        transcript: heard,
      );
      matched = result.matched;
    } catch (_) {
      matched = _matchesPrompt(heard, _current);
    }
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
      onPressed: () => setState(_resetForQuestion),
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
    final prompt = _promptDisplay;

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
                      exampleAnswer: _exampleHint,
                      speakUpLabel: text.speakUp,
                      submitLabel: text.submit,
                      durationLabel: _durationLabel,
                      isRecording: _isRecording,
                      hasRecording: _hasRecording,
                      level: _level,
                      wave: _waveController,
                      translationActive: _showTranslation,
                      hintActive: _showHint,
                      speakingPrompt: _speakingPrompt,
                      onTranslate: _toggleTranslation,
                      onSpeak: _speakPrompt,
                      onHint: _toggleHint,
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
    required this.id,
    required this.en,
    required this.tr,
    required this.exampleEn,
    required this.keywords,
  });

  final String id;
  final String en;
  final String tr;
  final String exampleEn;
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
    this.exampleAnswer,
    this.translationActive = false,
    this.hintActive = false,
    this.speakingPrompt = false,
  });

  final String questionLabel;
  final int progressIndex;
  final int total;
  final String title;
  final String hint;
  final String prompt;
  final String? exampleAnswer;
  final String speakUpLabel;
  final String submitLabel;
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
  final bool translationActive;
  final bool hintActive;
  final bool speakingPrompt;

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
          if (exampleAnswer != null && exampleAnswer!.trim().isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              exampleAnswer!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
          ],
          const SizedBox(height: 20),
          Row(
            children: [
              _QuizIconButton(
                onTap: onTranslate,
                active: translationActive,
                child: HomeAsset(
                  AppAssets.writingTranslate,
                  width: 24,
                  height: 24,
                  color: translationActive ? AppColors.primary : null,
                ),
              ),
              const SizedBox(width: 4),
              _QuizIconButton(
                onTap: speakingPrompt ? null : onSpeak,
                child: Opacity(
                  opacity: speakingPrompt ? 0.45 : 1,
                  child: const HomeAsset(
                    AppAssets.speaker,
                    width: 24,
                    height: 24,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              _QuizIconButton(
                onTap: onHint,
                active: hintActive,
                child: HomeAsset(
                  hintActive ? AppAssets.hintOn : AppAssets.hint,
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
              durationLabel: durationLabel,
              recordingLabel: AppText.current.quizPage.recording,
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
    required this.durationLabel,
    required this.recordingLabel,
    required this.level,
    required this.wave,
  });

  final bool isRecording;
  final String durationLabel;
  final String recordingLabel;
  final double level;
  final Animation<double> wave;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 56,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: wave,
              builder: (context, _) {
                return CustomPaint(
                  painter: _NestedArcWavePainter(
                    progress: isRecording ? wave.value : 0.08,
                    amplitude: isRecording ? level.clamp(0.15, 1.0) : 0.55,
                    color: AppColors.primary,
                    animate: isRecording,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isRecording ? recordingLabel : durationLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizIconButton extends StatelessWidget {
  const _QuizIconButton({
    required this.child,
    this.onTap,
    this.active = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.primary.withValues(alpha: .08) : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(child: child),
        ),
      ),
    );
  }
}

/// Figma: tabandan yükselen iç içe tepe dalgaları (4 pulse + katmanlı yaylar).
class _NestedArcWavePainter extends CustomPainter {
  _NestedArcWavePainter({
    required this.progress,
    required this.amplitude,
    required this.color,
    this.animate = true,
  });

  final double progress;
  final double amplitude;
  final Color color;
  final bool animate;

  /// [centerX, relativeHeight, halfWidth]
  static const _peaks = <List<double>>[
    [0.14, 0.42, 0.10],
    [0.40, 1.00, 0.18],
    [0.66, 0.62, 0.13],
    [0.88, 0.36, 0.09],
  ];
  static const _layers = 9;

  @override
  void paint(Canvas canvas, Size size) {
    final baseY = size.height * 0.92;
    final maxH = size.height * 0.86;
    final phase = progress * math.pi * 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (var p = 0; p < _peaks.length; p++) {
      final cx = size.width * _peaks[p][0];
      final peakH = _peaks[p][1];
      final halfW = size.width * _peaks[p][2];

      var live = peakH;
      if (animate) {
        live *= 0.55 + amplitude * 0.45;
        live *= 1 + 0.12 * math.sin(phase * 1.6 + p * 1.1);
      }

      for (var layer = 0; layer < _layers; layer++) {
        final t = (layer + 1) / _layers;
        final h = maxH * live * t;
        final w = halfW * (0.35 + 0.65 * t);
        final alpha = (0.28 + 0.72 * t).clamp(0.28, 1.0);

        final path = Path()
          ..moveTo(cx - w, baseY)
          ..cubicTo(
            cx - w * 0.55,
            baseY,
            cx - w * 0.35,
            baseY - h,
            cx,
            baseY - h,
          )
          ..cubicTo(
            cx + w * 0.35,
            baseY - h,
            cx + w * 0.55,
            baseY,
            cx + w,
            baseY,
          );

        paint
          ..color = color.withValues(alpha: alpha)
          ..strokeWidth = 1.05;
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _NestedArcWavePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.amplitude != amplitude ||
        oldDelegate.color != color ||
        oldDelegate.animate != animate;
  }
}
