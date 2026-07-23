import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';

class WritingTestScreen extends StatefulWidget {
  const WritingTestScreen({super.key});

  @override
  State<WritingTestScreen> createState() => _WritingTestScreenState();
}

class _WritingTestScreenState extends State<WritingTestScreen> {
  static const _promptEn = 'What do you do on Sundays?';
  static const _promptTr = 'Pazar günleri ne yaparsın?';
  static const _expectedAnswers = <String>[
    'i read books',
    'i watch films',
    'i watch movies',
    'i rest',
    'i sleep',
  ];

  final _answerController = TextEditingController();
  final _focusNode = FocusNode();

  var _showTranslation = false;
  var _answerText = '';

  bool get _canSubmit => _answerText.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _answerController.addListener(() {
      setState(() => _answerText = _answerController.text);
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _copyAnswer() async {
    final value = _answerText.trim();
    if (value.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: value));
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    FocusScope.of(context).unfocus();

    final normalized = _normalize(_answerText);
    final matched = _expectedAnswers.any(
      (expected) =>
          normalized == expected ||
          normalized.contains(expected) ||
          expected.contains(normalized),
    );

    if (matched) {
      await _showResultSheet(
        iconAsset: AppAssets.success,
        title: AppText.current.quizPage.successfulTitle,
        body: AppText.current.quizPage.successfulBody,
        buttonLabel: AppText.current.wordPracticePage.next,
        onPressed: () => Navigator.of(context).maybePop(),
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

  static String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
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
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(19, 0, 19, 24),
                  children: [
                    _SourceCard(
                      label: text.sourceLanguage,
                      prompt: _showTranslation ? _promptTr : _promptEn,
                      onTranslate: () => setState(
                        () => _showTranslation = !_showTranslation,
                      ),
                      onSpeak: () {},
                    ),
                    const SizedBox(height: 10),
                    _AnswerCard(
                      label: text.answer,
                      hint: text.writeAnswerHint,
                      controller: _answerController,
                      focusNode: _focusNode,
                      canSubmit: _canSubmit,
                      submitLabel: text.submit,
                      onCopy: _copyAnswer,
                      onMic: () {},
                      onHint: () {},
                      onSubmit: _submit,
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
  });

  final String label;
  final String prompt;
  final VoidCallback onTranslate;
  final VoidCallback onSpeak;

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
              _IconTap(
                onTap: onCopy,
                child: const HomeAsset(
                  AppAssets.writingCopy,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              _IconTap(
                onTap: onMic,
                child: const HomeAsset(
                  AppAssets.microphone,
                  width: 22,
                  height: 22,
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
              _SubmitButton(
                label: submitLabel,
                enabled: canSubmit,
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
    // Figma: pasif = #000 %10, aktif = primary blue
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
