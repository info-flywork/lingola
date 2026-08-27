import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/quiz/quiz_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../tutor/services/tutor_tts_service.dart';

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

  final _speech = SpeechToText();
  final _recorder = AudioRecorder();
  final _player = AudioPlayer();
  final _tts = TutorTtsService();

  var _words = <_ReadingWord>[];
  var _loading = true;
  String? _error;
  var _index = 0;
  var _saved = false;
  var _hintActive = false;
  var _hintPlaying = false;
  var _isRecording = false;
  var _isPlaying = false;
  var _showRecordingBar = false;
  var _speechReady = false;
  var _elapsed = Duration.zero;
  var _playbackElapsed = Duration.zero;
  var _heardText = '';
  var _levels = List<double>.filled(48, 0.12);
  var _recordedLevels = <double>[];
  var _recordedDuration = Duration.zero;
  String? _recordingPath;

  Timer? _ticker;
  Timer? _playbackTicker;
  StreamSubscription<Amplitude>? _amplitudeSub;
  StreamSubscription<void>? _playerCompleteSub;
  StreamSubscription<Duration>? _playerPositionSub;

  _ReadingWord? get _current {
    if (_words.isEmpty || _index < 0 || _index >= _words.length) return null;
    return _words[_index];
  }

  @override
  void initState() {
    super.initState();
    _loadWords();
    _initSpeech();
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() {
        _isPlaying = false;
        _playbackElapsed = _recordedDuration;
        if (_recordedLevels.isNotEmpty) {
          _levels = _visibleLevelsFromRecording(_recordedLevels.length - 1);
        }
      });
    });
    _playerPositionSub = _player.onPositionChanged.listen((pos) {
      if (!mounted || !_isPlaying) return;
      final progress = _recordedDuration.inMilliseconds == 0
          ? 0.0
          : pos.inMilliseconds / _recordedDuration.inMilliseconds;
      final idx = _recordedLevels.isEmpty
          ? 0
          : (progress * (_recordedLevels.length - 1))
              .round()
              .clamp(0, _recordedLevels.length - 1);
      setState(() {
        _playbackElapsed = pos;
        if (_recordedLevels.isNotEmpty) {
          _levels = _visibleLevelsFromRecording(idx);
        }
      });
    });
  }

  Future<void> _loadWords({bool append = false}) async {
    if (!append) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
    try {
      final exclude = _words.map((w) => w.id).where((id) => id.isNotEmpty).toList();
      final cards = await QuizService.fetchReadingWords(
        count: 10,
        excludeIds: exclude,
      );
      if (!mounted) return;
      final mapped = cards
          .map(
            (c) => _ReadingWord(
              id: c.id,
              word: c.word,
              phonetic: c.phonetic.isEmpty
                  ? ''
                  : (c.phonetic.startsWith('/')
                      ? c.phonetic
                      : '/${c.phonetic}/'),
              translations: c.translations,
              exampleEn: c.sentence,
              exampleTr: c.sentenceTranslation,
            ),
          )
          .toList();
      setState(() {
        if (append && mapped.isNotEmpty) {
          _words = [..._words, ...mapped];
          _index = (_words.length - mapped.length).clamp(0, _words.length - 1);
        } else {
          _words = mapped;
          _index = 0;
        }
        _saved = false;
        _hintActive = false;
        _loading = false;
        _error = mapped.isEmpty ? 'No words found' : null;
        _resetRecorderForWord();
      });
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        if (!append) _error = err.toString();
      });
      if (append) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not load more: $err')),
        );
      }
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _playbackTicker?.cancel();
    _amplitudeSub?.cancel();
    _playerCompleteSub?.cancel();
    _playerPositionSub?.cancel();
    _speech.stop();
    _recorder.dispose();
    _player.dispose();
    _tts.dispose();
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

  void _resetRecorderForWord() {
    _ticker?.cancel();
    _playbackTicker?.cancel();
    _amplitudeSub?.cancel();
    _ticker = null;
    _playbackTicker = null;
    _amplitudeSub = null;
    unawaited(_player.stop());
    final oldPath = _recordingPath;
    _isRecording = false;
    _isPlaying = false;
    _showRecordingBar = false;
    _elapsed = Duration.zero;
    _playbackElapsed = Duration.zero;
    _recordedDuration = Duration.zero;
    _recordedLevels = [];
    _levels = List<double>.filled(48, 0.12);
    _heardText = '';
    _recordingPath = null;
    if (oldPath != null) {
      try {
        final file = File(oldPath);
        if (file.existsSync()) {
          unawaited(file.delete());
        }
      } catch (_) {}
    }
  }

  Future<void> _onTryAgain() async {
    try {
      if (await _recorder.isRecording()) {
        await _recorder.stop();
      }
    } catch (_) {}
    if (_speech.isListening) {
      await _speech.stop();
    }
    if (!mounted) return;
    setState(_resetRecorderForWord);
  }

  Future<void> _onToggleHint() async {
    final next = !_hintActive;
    setState(() => _hintActive = next);
    if (!next) {
      await _player.stop();
      return;
    }
    await _playHintAudio();
  }

  Future<void> _playHintAudio() async {
    final card = _current;
    if (card == null || _hintPlaying) return;
    final speakText =
        card.word.trim().isNotEmpty ? card.word.trim() : card.exampleEn.trim();
    if (speakText.isEmpty) return;

    setState(() => _hintPlaying = true);
    try {
      final file = await _tts.synthesizeToFile(
        speakText,
        voiceId: TutorVoiceIds.female,
        modelId: TutorTtsService.flashModel,
      );
      if (!mounted || !_hintActive) return;
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
    } finally {
      if (mounted) setState(() => _hintPlaying = false);
    }
  }

  Future<void> _goPrevious() async {
    if (_index == 0) return;
    await _stopRecording(showResult: false);
    if (!mounted) return;
    setState(() {
      _index -= 1;
      _saved = false;
      _hintActive = false;
      _resetRecorderForWord();
    });
  }

  Future<void> _goNext() async {
    if (_index >= _words.length - 1) {
      await _stopRecording(showResult: false);
      if (!mounted) return;
      await _loadWords(append: true);
      return;
    }
    await _stopRecording(showResult: false);
    if (!mounted) return;
    setState(() {
      _index += 1;
      _saved = false;
      _hintActive = false;
      _resetRecorderForWord();
    });
  }

  Future<void> _toggleRead() async {
    if (_isPlaying) {
      await _pausePlayback();
    }
    if (_isRecording) {
      await _stopRecording(showResult: true);
      return;
    }
    await _startRecording();
  }

  void _pushLevel(double normalized) {
    _levels = [..._levels.skip(1), normalized];
    _recordedLevels = [..._recordedLevels, normalized];
    if (_recordedLevels.length > 240) {
      _recordedLevels = _recordedLevels.sublist(_recordedLevels.length - 240);
    }
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

    final hasMic = await _recorder.hasPermission();
    if (!hasMic) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text.micPermissionDenied)),
      );
      return;
    }

    await _player.stop();
    _amplitudeSub?.cancel();

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/lingola_read_${DateTime.now().millisecondsSinceEpoch}.m4a';

    setState(() {
      _isRecording = true;
      _isPlaying = false;
      _showRecordingBar = true;
      _elapsed = Duration.zero;
      _playbackElapsed = Duration.zero;
      _heardText = '';
      _recordedLevels = [];
      _recordingPath = path;
      _levels = List<double>.filled(48, 0.12);
    });

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 200), (_) {
      if (!mounted || !_isRecording) return;
      setState(() => _elapsed += const Duration(milliseconds: 200));
    });

    try {
      await _recorder.start(
        const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path,
      );
      _amplitudeSub = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 80))
          .listen((amp) {
        if (!mounted || !_isRecording) return;
        // amp.current ~ -160..0 dBFS
        final normalized = ((amp.current + 45) / 45).clamp(0.08, 1.0);
        setState(() => _pushLevel(normalized.toDouble()));
      });
    } catch (_) {
      // Kayıt dosyası açılamazsa sadece konuşma tanıma ile devam.
    }

    await _speech.listen(
      onSoundLevelChange: (level) {
        if (!mounted || !_isRecording) return;
        // record amplitude zaten varsa speech seviyesini yoksay
        if (_amplitudeSub != null) return;
        final normalized = ((level + 2) / 12).clamp(0.08, 1.0);
        setState(() => _pushLevel(normalized.toDouble()));
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
    await _amplitudeSub?.cancel();
    _amplitudeSub = null;

    String? savedPath = _recordingPath;
    try {
      if (await _recorder.isRecording()) {
        savedPath = await _recorder.stop() ?? savedPath;
      }
    } catch (_) {}

    if (_speech.isListening) {
      await _speech.stop();
    }

    if (!mounted) return;

    final heard = _heardText;
    final wasRecording = _isRecording;
    setState(() {
      _isRecording = false;
      _isPlaying = false;
      _recordingPath = savedPath;
      if (wasRecording || _recordedLevels.isNotEmpty || savedPath != null) {
        _showRecordingBar = true;
        _recordedDuration = _elapsed;
        _playbackElapsed = Duration.zero;
        if (_recordedLevels.isNotEmpty) {
          _levels = _visibleLevelsFromRecording(_recordedLevels.length - 1);
        }
      }
    });

    if (!showResult || !wasRecording) return;

    final card = _current;
    if (card == null) return;
    final matched = _matchesTarget(heard, card.word, card.exampleEn);
    if (matched) {
      await _showSuccessSheet();
      return;
    }

    await _showFailedSheet();
  }

  List<double> _visibleLevelsFromRecording(int playIndex) {
    if (_recordedLevels.isEmpty) {
      return List<double>.filled(48, 0.12);
    }
    final end = (playIndex + 1).clamp(1, _recordedLevels.length);
    final start = (end - 48).clamp(0, end);
    final slice = _recordedLevels.sublist(start, end);
    if (slice.length >= 48) return slice;
    return [
      ...List<double>.filled(48 - slice.length, 0.12),
      ...slice,
    ];
  }

  Future<void> _togglePlayback() async {
    if (_isRecording) return;
    if (_isPlaying) {
      await _pausePlayback();
    } else {
      await _startPlayback();
    }
  }

  Future<void> _startPlayback() async {
    final path = _recordingPath;
    _playbackTicker?.cancel();
    _playbackTicker = null;

    if (path == null || !File(path).existsSync()) {
      _startWaveformPlaybackOnly();
      return;
    }

    if (_playbackElapsed >= _recordedDuration &&
        _recordedDuration > Duration.zero) {
      _playbackElapsed = Duration.zero;
    }

    setState(() => _isPlaying = true);
    try {
      await _player.play(
        DeviceFileSource(path),
        position: _playbackElapsed,
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _isPlaying = false);
      _startWaveformPlaybackOnly();
    }
  }

  void _startWaveformPlaybackOnly() {
    if (_recordedLevels.isEmpty && _recordedDuration == Duration.zero) return;
    if (_playbackElapsed >= _recordedDuration &&
        _recordedDuration > Duration.zero) {
      _playbackElapsed = Duration.zero;
    }

    setState(() => _isPlaying = true);

    _playbackTicker?.cancel();
    _playbackTicker = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted || !_isPlaying) {
        timer.cancel();
        return;
      }
      final next = _playbackElapsed + const Duration(milliseconds: 80);
      if (next >= _recordedDuration && _recordedDuration > Duration.zero) {
        setState(() {
          _isPlaying = false;
          _playbackElapsed = _recordedDuration;
          if (_recordedLevels.isNotEmpty) {
            _levels = _visibleLevelsFromRecording(_recordedLevels.length - 1);
          }
        });
        timer.cancel();
        _playbackTicker = null;
        return;
      }
      final progress = _recordedDuration.inMilliseconds == 0
          ? 0.0
          : next.inMilliseconds / _recordedDuration.inMilliseconds;
      final idx = _recordedLevels.isEmpty
          ? 0
          : (progress * (_recordedLevels.length - 1))
              .round()
              .clamp(0, _recordedLevels.length - 1);
      setState(() {
        _playbackElapsed = next;
        if (_recordedLevels.isNotEmpty) {
          _levels = _visibleLevelsFromRecording(idx);
        }
      });
    });
  }

  Future<void> _pausePlayback() async {
    _playbackTicker?.cancel();
    _playbackTicker = null;
    await _player.pause();
    if (!mounted) return;
    setState(() => _isPlaying = false);
  }

  String get _timerLabel {
    final value = _isRecording
        ? _elapsed
        : (_showRecordingBar ? _playbackElapsed : Duration.zero);
    final minutes = value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> _showSuccessSheet() async {
    final text = AppText.current.quizPage;
    await _showResultSheet(
      iconAsset: AppAssets.success,
      title: text.successfulTitle,
      body: text.successfulBody,
      buttonLabel: AppText.current.wordPracticePage.next,
      onPressed: _goNext,
    );
  }

  Future<void> _showFailedSheet() async {
    final text = AppText.current.quizPage;
    await _showResultSheet(
      iconAsset: AppAssets.failed,
      title: text.failedTitle,
      body: text.failedBody,
      buttonLabel: text.tryAgain,
      onPressed: () {
        unawaited(_onTryAgain());
      },
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
                HomeAsset(
                  iconAsset,
                  width: 55,
                  height: 56,
                ),
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
        .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
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
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
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
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null || _current == null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _error ?? 'No words found',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextButton(
                                    onPressed: _loadWords,
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(19, 0, 19, 10),
                  child: Column(
                    children: [
                      _ReadingCard(
                        word: _current!,
                        languageLabel: practice.turkish,
                        hintActive: _hintActive,
                        saved: _saved,
                        saveLabel: practice.save,
                        readLabel: quiz.read,
                        hintLabel: practice.hint,
                        onSave: () => setState(() => _saved = !_saved),
                        onRead: _toggleRead,
                        onHint: () {
                          unawaited(_onToggleHint());
                        },
                        saveRed: _saveRed,
                        saveBg: _saveBg,
                        chipText: _chipText,
                        hintBg: _hintBg,
                        isRecording: _isRecording,
                      ),
                      if (_showRecordingBar) ...[
                        const SizedBox(height: 10),
                        _RecordingBar(
                          timerLabel: _timerLabel,
                          levels: _levels,
                          isRecording: _isRecording,
                          isPlaying: _isPlaying,
                          onPrimaryAction: () {
                            if (_isRecording) {
                              _stopRecording(showResult: true);
                            } else {
                              _togglePlayback();
                            }
                          },
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
                        ignoring: _index == 0 || _loading,
                        child: SecondaryButton(
                          label: practice.previous,
                          onPressed: _goPrevious,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Opacity(
                      opacity: _loading || _current == null ? 0.45 : 1,
                      child: IgnorePointer(
                        ignoring: _loading || _current == null,
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
    required this.id,
    required this.word,
    required this.phonetic,
    required this.translations,
    required this.exampleEn,
    required this.exampleTr,
  });

  final String id;
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
    required this.hintActive,
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
  final bool hintActive;
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
            hintActive: hintActive,
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
                    AppAssets.heart,
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
                    AppAssets.microphone,
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
                  icon: HomeAsset(
                    hintActive ? AppAssets.hintOn : AppAssets.hint,
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
    required this.isRecording,
    required this.isPlaying,
    required this.onPrimaryAction,
  });

  final String timerLabel;
  final List<double> levels;
  final bool isRecording;
  final bool isPlaying;
  final VoidCallback onPrimaryAction;

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
              height: 31,
              child: ClipRect(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (final level in levels) _WaveBar(level: level),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onPrimaryAction,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: isRecording
                  ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                  : Icon(
                      isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaveBar extends StatelessWidget {
  const _WaveBar({required this.level});

  final double level;

  @override
  Widget build(BuildContext context) {
    // Sessizken nokta, seslenince ince dikey çubuk (Figma)
    final isDot = level < 0.22;
    final height = isDot ? 4.0 : (8 + level * 22).clamp(8.0, 31.0);
    final width = isDot ? 3.0 : 2.0;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: AppColors.ink,
        borderRadius: BorderRadius.circular(isDot ? 99 : 1.5),
      ),
    );
  }
}

class _TranslationBox extends StatelessWidget {
  const _TranslationBox({
    required this.languageLabel,
    required this.translations,
    required this.hintActive,
    required this.chipText,
  });

  final String languageLabel;
  final List<String> translations;
  final bool hintActive;
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
            enabled: !hintActive,
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
