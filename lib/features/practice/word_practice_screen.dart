import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';

class WordPracticeScreen extends StatefulWidget {
  const WordPracticeScreen({super.key});

  @override
  State<WordPracticeScreen> createState() => _WordPracticeScreenState();
}

class _WordPracticeScreenState extends State<WordPracticeScreen> {
  static const _saveRed = Color(0xFFF44336);
  static const _saveBg = Color(0x1AFF383C);
  static const _chipText = Color(0xFF000088);
  static const _hintBg = Color(0x0D2D46FF);

  static const _words = <_PracticeWord>[
    _PracticeWord(
      word: 'Friend',
      phonetic: '/frend/',
      translations: ['Arkadaş', 'Dost', 'Yoldaş'],
      exampleEn: 'A good friend is hard to find',
      exampleTr: 'İyi bir arkadaş bulmak zordur.',
    ),
    _PracticeWord(
      word: 'Journey',
      phonetic: '/ˈdʒɜːrni/',
      translations: ['Yolculuk', 'Seyahat', 'Macera'],
      exampleEn: 'The journey was long but exciting',
      exampleTr: 'Yolculuk uzun ama heyecan vericiydi.',
    ),
    _PracticeWord(
      word: 'Courage',
      phonetic: '/ˈkʌrɪdʒ/',
      translations: ['Cesaret', 'Yiğitlik', 'Yüreklilik'],
      exampleEn: 'It takes courage to speak up',
      exampleTr: 'Konuşmak cesaret ister.',
    ),
  ];

  var _index = 0;
  var _saved = false;
  var _hintVisible = true;

  _PracticeWord get _current => _words[_index];

  void _goPrevious() {
    if (_index == 0) return;
    setState(() {
      _index -= 1;
      _saved = false;
      _hintVisible = true;
    });
  }

  void _goNext() {
    if (_index >= _words.length - 1) return;
    setState(() {
      _index += 1;
      _saved = false;
      _hintVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.wordPracticePage;

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
                      text.title,
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
                  child: _WordCard(
                    word: _current,
                    languageLabel: text.turkish,
                    hintVisible: _hintVisible,
                    saved: _saved,
                    saveLabel: text.save,
                    listenLabel: text.listen,
                    hintLabel: text.hint,
                    onSave: () => setState(() => _saved = !_saved),
                    onListen: () {},
                    onHint: () => setState(() => _hintVisible = !_hintVisible),
                    saveRed: _saveRed,
                    saveBg: _saveBg,
                    chipText: _chipText,
                    hintBg: _hintBg,
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
                          label: text.previous,
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
                          label: text.next,
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

class _PracticeWord {
  const _PracticeWord({
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

class _WordCard extends StatelessWidget {
  const _WordCard({
    required this.word,
    required this.languageLabel,
    required this.hintVisible,
    required this.saved,
    required this.saveLabel,
    required this.listenLabel,
    required this.hintLabel,
    required this.onSave,
    required this.onListen,
    required this.onHint,
    required this.saveRed,
    required this.saveBg,
    required this.chipText,
    required this.hintBg,
  });

  final _PracticeWord word;
  final String languageLabel;
  final bool hintVisible;
  final bool saved;
  final String saveLabel;
  final String listenLabel;
  final String hintLabel;
  final VoidCallback onSave;
  final VoidCallback onListen;
  final VoidCallback onHint;
  final Color saveRed;
  final Color saveBg;
  final Color chipText;
  final Color hintBg;

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
                  label: listenLabel,
                  background: AppColors.ink,
                  foreground: Colors.white,
                  icon: const HomeAsset(
                    'assets/images/whiteSpeaker.svg',
                    width: 20,
                    height: 20,
                  ),
                  onTap: onListen,
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
