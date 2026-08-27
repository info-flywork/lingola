import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/auth/api_client.dart';
import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/quiz/quiz_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../tutor/services/hold_to_speak_service.dart';
import '../tutor/services/tutor_tts_service.dart';

class WritingTestScreen extends StatefulWidget {
  const WritingTestScreen({super.key});

  @override
  State<WritingTestScreen> createState() => _WritingTestScreenState();
}

class _WritingTestScreenState extends State<WritingTestScreen> {
  final _answerController = TextEditingController();
  final _focusNode = FocusNode();
  final _tts = TutorTtsService();
  final _player = AudioPlayer();
  final _mic = HoldToSpeakService();

  final _seenIds = <String>[];

  QuizWritingPrompt? _prompt;
  var _loading = true;
  var _busy = false;
  var _speaking = false;
  var _recording = false;
  var _showTranslation = false;
  var _showHint = false;
  var _answerText = '';
  String? _error;

  bool get _canSubmit =>
      !_busy && !_loading && _prompt != null && _answerText.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _answerController.addListener(() {
      setState(() => _answerText = _answerController.text);
    });
    _loadPrompt();
    unawaited(_mic.warmUp());
  }

  @override
  void dispose() {
    _answerController.dispose();
    _focusNode.dispose();
    _tts.dispose();
    _player.dispose();
    unawaited(_mic.dispose());
    super.dispose();
  }

  Future<void> _loadPrompt() async {
    setState(() {
      _loading = true;
      _error = null;
      _showTranslation = false;
      _showHint = false;
      _answerController.clear();
      _answerText = '';
    });
    try {
      final prompt = await QuizService.fetchWritingPrompt(
        excludeIds: _seenIds,
      );
      if (!mounted) return;
      if (prompt == null) {
        setState(() {
          _prompt = null;
          _loading = false;
          _error = 'No writing prompts found';
        });
        return;
      }
      _seenIds.add(prompt.id);
      if (_seenIds.length > 80) {
        _seenIds.removeRange(0, _seenIds.length - 80);
      }
      setState(() {
        _prompt = prompt;
        _loading = false;
      });
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = _friendlyError(err);
      });
    }
  }

  String _friendlyError(Object err) {
    if (err is ApiException) return err.message;
    return AppText.current.common.genericError;
  }

  Future<void> _copyOrPasteAnswer() async {
    final answer = _answerText.trim();
    if (answer.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: answer));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cevap panoya kopyalandı')),
      );
      return;
    }

    final clip = await Clipboard.getData(Clipboard.kTextPlain);
    final pasted = clip?.text?.trim();
    if (pasted != null && pasted.isNotEmpty) {
      _answerController.text = pasted;
      setState(() => _answerText = pasted);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Panodan yapıştırıldı')),
      );
      return;
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kopyalanacak veya yapıştırılacak metin yok')),
    );
  }

  Future<void> _speakSource() async {
    final prompt = _prompt;
    if (prompt == null || _speaking) return;
    // Always speak the English target sentence so the learner can hear the answer.
    final text = prompt.sentenceEn.trim();
    if (text.isEmpty) return;

    setState(() => _speaking = true);
    try {
      final file = await _tts.synthesizeToFile(
        text,
        voiceId: TutorVoiceIds.female,
        modelId: TutorTtsService.flashModel,
      );
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Speak failed: $err')),
      );
    } finally {
      if (mounted) setState(() => _speaking = false);
    }
  }

  Future<void> _toggleMic() async {
    if (_busy) return;
    if (_recording) {
      await _stopRecordingToField();
      return;
    }
    await _startMic();
  }

  Future<void> _startMic() async {
    final quiz = AppText.current.quizPage;
    try {
      await _player.stop();
      await _mic.start();
      if (!mounted) return;
      setState(() => _recording = true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(quiz.micPermissionDenied)),
      );
    }
  }

  Future<void> _stopRecordingToField() async {
    if (!_recording) return;
    setState(() {
      _recording = false;
      _busy = true;
    });

    try {
      final text = await _mic.stopAndGetText();
      if (!mounted) return;
      if (text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ses anlaşılamadı — tekrar dene')),
        );
        return;
      }
      _answerController.text = text.trim();
      setState(() => _answerText = text.trim());
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_friendlyError(err))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _submit() async {
    final prompt = _prompt;
    if (!_canSubmit || prompt == null) return;
    FocusScope.of(context).unfocus();

    setState(() => _busy = true);
    try {
      final result = await QuizService.evaluateWritingText(
        wordId: prompt.id,
        answer: _answerText,
      );
      if (!mounted) return;
      await _showEvalResult(matched: result.matched);
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_friendlyError(err))),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _showEvalResult({required bool matched}) async {
    final quiz = AppText.current.quizPage;
    if (matched) {
      await _showResultSheet(
        iconAsset: AppAssets.success,
        title: quiz.successfulTitle,
        body: quiz.successfulBody,
        buttonLabel: AppText.current.wordPracticePage.next,
        onPressed: _loadPrompt,
      );
      return;
    }

    await _showResultSheet(
      iconAsset: AppAssets.failed,
      title: quiz.failedTitle,
      body: quiz.failedBody,
      buttonLabel: quiz.tryAgain,
      onPressed: () {
        _answerController.clear();
        setState(() => _answerText = '');
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

  String get _sourceText {
    final prompt = _prompt;
    if (prompt == null) return '';
    if (_showHint || _showTranslation) return prompt.sentenceEn;
    if (prompt.sentenceNative.trim().isNotEmpty) return prompt.sentenceNative;
    return prompt.sentenceEn;
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.quizPage;

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
                      text.writingTestTitle,
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
                    : _error != null || _prompt == null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _error ??
                                        AppText.current.common.genericError,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextButton(
                                    onPressed: _loadPrompt,
                                    child: Text(
                                      AppText.current.common.tryAgain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView(
                            padding: const EdgeInsets.fromLTRB(19, 0, 19, 24),
                            children: [
                              _SourceCard(
                                label: text.sourceLanguage,
                                prompt: _sourceText,
                                speaking: _speaking,
                                translationActive: _showTranslation,
                                onTranslate: () => setState(() {
                                  _showTranslation = !_showTranslation;
                                  if (_showTranslation) _showHint = false;
                                }),
                                onSpeak: _speakSource,
                              ),
                              const SizedBox(height: 10),
                              _AnswerCard(
                                label: text.answer,
                                hint: text.writeAnswerHint,
                                controller: _answerController,
                                focusNode: _focusNode,
                                canSubmit: _canSubmit,
                                submitLabel: _busy
                                    ? '...'
                                    : (_recording
                                        ? text.recording
                                        : text.submit),
                                recording: _recording,
                                busy: _busy,
                                hintActive: _showHint,
                                onCopy: _copyOrPasteAnswer,
                                onMic: _toggleMic,
                                onHint: () => setState(() {
                                  _showHint = !_showHint;
                                  if (_showHint) _showTranslation = false;
                                }),
                                onSubmit: () {
                                  if (_recording) {
                                    unawaited(_stopRecordingToField());
                                  } else {
                                    unawaited(_submit());
                                  }
                                },
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

class _SourceCard extends StatelessWidget {
  const _SourceCard({
    required this.label,
    required this.prompt,
    required this.onTranslate,
    required this.onSpeak,
    this.speaking = false,
    this.translationActive = false,
  });

  final String label;
  final String prompt;
  final VoidCallback onTranslate;
  final VoidCallback onSpeak;
  final bool speaking;
  final bool translationActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            prompt,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 1, color: AppColors.border),
          const SizedBox(height: 10),
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
                onTap: speaking ? null : onSpeak,
                child: Opacity(
                  opacity: speaking ? 0.45 : 1,
                  child: const HomeAsset(
                    AppAssets.speaker,
                    width: 24,
                    height: 24,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({
    required this.label,
    required this.hint,
    required this.controller,
    required this.focusNode,
    required this.canSubmit,
    required this.submitLabel,
    required this.onCopy,
    required this.onMic,
    required this.onHint,
    required this.onSubmit,
    this.recording = false,
    this.busy = false,
    this.hintActive = false,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool canSubmit;
  final String submitLabel;
  final VoidCallback onCopy;
  final VoidCallback onMic;
  final VoidCallback onHint;
  final VoidCallback onSubmit;
  final bool recording;
  final bool busy;
  final bool hintActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            focusNode: focusNode,
            minLines: 3,
            maxLines: 6,
            enabled: !busy && !recording,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 21 / 14,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 21 / 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 1, color: AppColors.border),
          const SizedBox(height: 10),
          Row(
            children: [
              _QuizIconButton(
                onTap: busy ? null : onCopy,
                child: const HomeAsset(
                  AppAssets.writingCopy,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 4),
              _QuizIconButton(
                onTap: busy ? null : onMic,
                active: recording,
                child: HomeAsset(
                  AppAssets.microphone,
                  width: 22,
                  height: 22,
                  color: recording ? AppColors.primary : AppColors.secondary,
                ),
              ),
              const SizedBox(width: 4),
              _QuizIconButton(
                onTap: busy ? null : onHint,
                active: hintActive,
                child: HomeAsset(
                  hintActive ? AppAssets.hintOn : AppAssets.hint,
                  width: 22,
                  height: 22,
                ),
              ),
              const Spacer(),
              _SubmitButton(
                label: submitLabel,
                enabled: recording || canSubmit,
                onTap: onSubmit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = enabled
        ? AppColors.primary
        : Colors.black.withValues(alpha: .10);

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(9999),
      child: InkWell(
        onTap: enabled ? onTap : null,
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
