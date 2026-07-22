import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';

class ReadingTestScreen extends StatefulWidget {
  const ReadingTestScreen({super.key});

  @override
  State<ReadingTestScreen> createState() => _ReadingTestScreenState();
}

class _ReadingTestScreenState extends State<ReadingTestScreen> {
  static const _saveRed = Color(0xFFF44336);
  static const _saveBg = Color(0x1AFF383C);
  static const _chipText = Color(0xFF000088);
  static const _hintBg = Color(0x0D2D46FF);

  static const _words = <_ReadingWord>[
    _ReadingWord(
      word: 'Friend',
      phonetic: '/frend/',
      translations: ['Arkadaş', 'Dost', 'Yoldaş'],
      exampleEn: 'A good friend is hard to find',
      exampleTr: 'İyi bir arkadaş bulmak zordur.',
    ),
    _ReadingWord(
      word: 'Journey',
      phonetic: '/ˈdʒɜːrni/',
      translations: ['Yolculuk', 'Seyahat', 'Macera'],
      exampleEn: 'The journey was long but exciting',
      exampleTr: 'Yolculuk uzun ama heyecan vericiydi.',
    ),
    _ReadingWord(
      word: 'Courage',
      phonetic: '/ˈkʌrɪdʒ/',
      translations: ['Cesaret', 'Yiğitlik', 'Yüreklilik'],
      exampleEn: 'It takes courage to speak up',
      exampleTr: 'Konuşmak cesaret ister.',
    ),
  ];

  final _speech = SpeechToText();

  var _index = 0;
  var _saved = false;
  var _hintVisible = true;
  var _isRecording = false;
  var _speechReady = false;
  var _elapsed = Duration.zero;
  var _heardText = '';
  var _levels = List<double>.filled(24, 0.25);

  Timer? _ticker;

  _ReadingWord get _current => _words[_index];

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _speech.stop();
    super.dispose();
  }

  Future<void> _initSpeech() async {
    final ready = await _speech.initialize(
      onError: (error) {
        if (!mounted) return;
        _stopRecording(showResult: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.errorMsg)),
        );
      },
      onStatus: (status) {
        if (!mounted) return;
        if (status == 'done' || status == 'notListening') {
          if (_isRecording) _stopRecording(showResult: true);
        }
      },
    );
    if (!mounted) return;
    setState(() => _speechReady = ready);
  }

  void _goPrevious() {
    if (_index == 0) return;
    _stopRecording(showResult: false);
    setState(() {
      _index -= 1;
      _saved = false;
      _hintVisible = true;
      _heardText = '';
    });
  }

  void _goNext() {
    if (_index >= _words.length - 1) return;
    _stopRecording(showResult: false);
    setState(() {
      _index += 1;
      _saved = false;
      _hintVisible = true;
      _heardText = '';
    });
  }

  Future<void> _toggleRead() async {
    if (_isRecording) {
      await _stopRecording(showResult: true);
      return;
    }
    await _startRecording();
  }

  Future<void> _startRecording() async {
    final text = AppText.current.quizPage;
    if (!_speechReady) {
      await _initSpeech();
    }
    if (!_speechReady) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.micPermissionDenied)),
      );
      return;
    }

    setState(() {
      _isRecording = true;
      _elapsed = Duration.zero;
      _heardText = '';
      _levels = List<double>.filled(24, 0.25);
    });

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !_isRecording) return;
      setState(() => _elapsed += const Duration(seconds: 1));
    });

    await _speech.listen(
      onSoundLevelChange: (level) {
        if (!mounted || !_isRecording) return;
        // speech_to_text roughly reports ~ -2..10; normalize to 0..1
        final normalized = ((level + 2) / 12).clamp(0.15, 1.0);
        setState(() {
          _levels = [
            ..._levels.skip(1),
            normalized.toDouble(),
          ];
        });
      },
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.confirmation,
        partialResults: true,
        cancelOnError: true,
        localeId: 'en_US',
        listenFor: const Duration(seconds: 15),
        pauseFor: const Duration(seconds: 3),
      ),
      onResult: (result) {
        if (!mounted) return;
        setState(() => _heardText = result.recognizedWords);
        if (result.finalResult) {
          _stopRecording(showResult: true);
        }
      },
    );
  }

  Future<void> _stopRecording({required bool showResult}) async {
    _ticker?.cancel();
    _ticker = null;

    if (_speech.isListening) {
      await _speech.stop();
    }

    if (!mounted) return;

    final heard = _heardText;
    final wasRecording = _isRecording;
    setState(() {
      _isRecording = false;
      _levels = List<double>.filled(24, 0.25);
    });

    if (!showResult || !wasRecording) return;

    final matched = _matchesTarget(heard, _current.word, _current.exampleEn);
    final text = AppText.current.quizPage;
    if (matched) {
      await _showSuccessSheet();
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text.matchFail(heard: heard.isEmpty ? '—' : heard),
        ),
      ),
    );
  }

  Future<void> _showSuccessSheet() async {
    final text = AppText.current.quizPage;
    final nextLabel = AppText.current.wordPracticePage.next;

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
                const HomeAsset(
                  'assets/images/quizSection/succesfull.svg',
                  width: 55,
                  height: 56,
                ),
                const SizedBox(height: 10),
                Text(
                  text.successfulTitle,
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
                  text.successfulBody,
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
                  label: nextLabel,
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    _goNext();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static bool _matchesTarget(String heard, String word, String sentence) {
    final normalizedHeard = _normalize(heard);
    if (normalizedHeard.isEmpty) return false;
    final targetWord = _normalize(word);
    final targetSentence = _normalize(sentence);
    return normalizedHeard == targetWord ||
        normalizedHeard == targetSentence ||
        normalizedHeard.contains(targetWord) ||
        targetSentence.contains(normalizedHeard);
  }

  static String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r"[^a-z0-9\s]"), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  String get _timerLabel {
    final minutes = _elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final practice = AppText.current.wordPracticePage;
    final quiz = AppText.current.quizPage;

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
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: AppColors.ink,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      quiz.readingTestTitle,
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(19, 0, 19, 10),
                  child: Column(
                    children: [
                      _ReadingCard(
                        word: _current,
                        languageLabel: practice.turkish,
                        hintVisible: _hintVisible,
                        saved: _saved,
                        saveLabel: practice.save,
                        readLabel: quiz.read,
                        hintLabel: practice.hint,
                        onSave: () => setState(() => _saved = !_saved),
                        onRead: _toggleRead,
                        onHint: () =>
                            setState(() => _hintVisible = !_hintVisible),
                        saveRed: _saveRed,
                        saveBg: _saveBg,
                        chipText: _chipText,
                        hintBg: _hintBg,
                        isRecording: _isRecording,
                      ),
                      if (_isRecording) ...[
                        const SizedBox(height: 10),
                        _RecordingBar(
                          timerLabel: _timerLabel,
                          levels: _levels,
                          onStop: () => _stopRecording(showResult: true),
                        ),
                      ],
                    ],
                  ),
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
                      opacity: _index >= _words.length - 1 ? 0.45 : 1,
                      child: IgnorePointer(
                        ignoring: _index >= _words.length - 1,
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

class _ReadingWord {
  const _ReadingWord({
    required this.word,
    required this.phonetic,
    required this.translations,
    required this.exampleEn,
    required this.exampleTr,
  });

  final String word;
  final String phonetic;
  final List<String> translations;
  final String exampleEn;
  final String exampleTr;
}

class _ReadingCard extends StatelessWidget {
  const _ReadingCard({
    required this.word,
    required this.languageLabel,
    required this.hintVisible,
    required this.saved,
    required this.saveLabel,
    required this.readLabel,
    required this.hintLabel,
    required this.onSave,
    required this.onRead,
    required this.onHint,
    required this.saveRed,
    required this.saveBg,
    required this.chipText,
    required this.hintBg,
    required this.isRecording,
  });

  final _ReadingWord word;
  final String languageLabel;
  final bool hintVisible;
  final bool saved;
  final String saveLabel;
  final String readLabel;
  final String hintLabel;
  final VoidCallback onSave;
  final VoidCallback onRead;
  final VoidCallback onHint;
  final Color saveRed;
  final Color saveBg;
  final Color chipText;
  final Color hintBg;
  final bool isRecording;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            word.word,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 36,
              height: 54 / 36,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
          Text(
            word.phonetic,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 10),
          _TranslationBox(
            languageLabel: languageLabel,
            translations: word.translations,
            hintVisible: hintVisible,
            chipText: chipText,
          ),
          const SizedBox(height: 10),
          _ExampleBlock(
            exampleEn: word.exampleEn,
            exampleTr: word.exampleTr,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _ActionChipButton(
                  label: saveLabel,
                  background: saved ? const Color(0x33FF383C) : saveBg,
                  foreground: saveRed,
                  icon: const HomeAsset(
                    'assets/images/heart.svg',
                    width: 20,
                    height: 20,
                  ),
                  onTap: onSave,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ActionChipButton(
                  label: readLabel,
                  background: AppColors.ink,
                  foreground: Colors.white,
                  icon: SvgPicture.asset(
                    'assets/images/microphone.svg',
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: onRead,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ActionChipButton(
                  label: hintLabel,
                  background: hintBg,
                  foreground: AppColors.primary,
                  icon: const HomeAsset(
                    'assets/images/noHint.svg',
                    width: 20,
                    height: 20,
                  ),
                  onTap: onHint,
                ),
              ),
            ],
          ),
          if (isRecording) ...[
            const SizedBox(height: 8),
            Text(
              AppText.current.quizPage.listeningHint,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RecordingBar extends StatelessWidget {
  const _RecordingBar({
    required this.timerLabel,
    required this.levels,
    required this.onStop,
  });

  final String timerLabel;
  final List<double> levels;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              timerLabel,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w400,
                color: AppColors.ink,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (final level in levels) ...[
                    Container(
                      width: 3,
                      height: 8 + level * 28,
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                      decoration: BoxDecoration(
                        color: AppColors.ink,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onStop,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TranslationBox extends StatelessWidget {
  const _TranslationBox({
    required this.languageLabel,
    required this.translations,
    required this.hintVisible,
    required this.chipText,
  });

  final String languageLabel;
  final List<String> translations;
  final bool hintVisible;
  final Color chipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            enabled: !hintVisible,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: translations
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.border10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          height: 21 / 14,
                          fontWeight: FontWeight.w600,
                          color: chipText,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleBlock extends StatelessWidget {
  const _ExampleBlock({
    required this.exampleEn,
    required this.exampleTr,
  });

  final String exampleEn;
  final String exampleTr;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 3,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .25),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exampleEn,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 21 / 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exampleTr,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    height: 21 / 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionChipButton extends StatelessWidget {
  const _ActionChipButton({
    required this.label,
    required this.background,
    required this.foreground,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final Color background;
  final Color foreground;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w600,
                      color: foreground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
