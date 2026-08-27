import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/practice/practice_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/home_asset.dart';
import '../tutor/services/tutor_tts_service.dart';

class WordPracticeScreen extends StatefulWidget {
  const WordPracticeScreen({super.key});

  @override
  State<WordPracticeScreen> createState() => _WordPracticeScreenState();
}

class _WordPracticeScreenState extends State<WordPracticeScreen> {
  static const _saveIdle = Color(0xFFA1A4B7);
  /// Quiz Reading ikon arka planı ile aynı (`#2D46FF` @ 10%).
  static const _saveBg = Color(0x1A2D46FF);
  static const _chipText = Color(0xFF000088);
  static const _hintBg = Color(0x0D2D46FF);

  final _tts = TutorTtsService();
  final _player = AudioPlayer();

  var _loading = true;
  String? _error;
  PracticeSession? _session;
  var _index = 0;
  var _saved = false;
  var _hintVisible = false;
  var _listening = false;

  PracticeCard? get _current {
    final cards = _session?.cards;
    if (cards == null || cards.isEmpty) return null;
    if (_index < 0 || _index >= cards.length) return null;
    return cards[_index];
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _player.dispose();
    _tts.dispose();
    super.dispose();
  }

  Future<void> _load({bool append = false}) async {
    if (!append) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
    try {
      final session = await PracticeService.fetchCards(count: 5);
      if (!mounted) return;
      setState(() {
        if (append && _session != null) {
          final existingIds = _session!.cards.map((c) => c.id).toSet();
          final fresh = session.cards
              .where((c) => c.id.isNotEmpty && !existingIds.contains(c.id))
              .toList();
          _session = PracticeSession(
            nativeLang: session.nativeLang,
            targetLang: session.targetLang,
            level: session.level,
            cards: [..._session!.cards, ...fresh],
          );
          if (fresh.isNotEmpty) {
            _index = _session!.cards.length - fresh.length;
            _saved = _session!.cards[_index].saved;
            _hintVisible = false;
          }
        } else {
          _session = session;
          _index = 0;
          _saved = _current?.saved ?? false;
          _hintVisible = false;
        }
        _loading = false;
        _error = null;
      });
      _warmAudio();
    } catch (err) {
      if (!mounted) return;
      if (append) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not load more: $err')),
        );
        return;
      }
      setState(() {
        _error = err.toString();
        _loading = false;
      });
    }
  }

  /// Synthesise the current and next word ahead of time so "Listen" plays
  /// from the local cache instead of waiting on the TTS API.
  void _warmAudio() {
    final cards = _session?.cards ?? const <PracticeCard>[];
    for (final offset in const [0, 1]) {
      final i = _index + offset;
      if (i < 0 || i >= cards.length) continue;
      _tts.prefetch(
        cards[i].word,
        voiceId: TutorVoiceIds.female,
        modelId: TutorTtsService.flashModel,
      );
    }
  }

  void _goPrevious() {
    if (_index == 0) return;
    setState(() {
      _index -= 1;
      _saved = _current?.saved ?? false;
      _hintVisible = false;
    });
    _warmAudio();
  }

  Future<void> _goNext() async {
    final cards = _session?.cards ?? const <PracticeCard>[];
    if (_index < cards.length - 1) {
      final nextIndex = _index + 1;
      setState(() {
        _index = nextIndex;
        _saved = cards[nextIndex].saved;
        _hintVisible = false;
      });
      _warmAudio();
      return;
    }
    // Append the next batch so Previous can walk the full history.
    await _load(append: true);
  }

  Future<void> _onToggleSave() async {
    final card = _current;
    if (card == null || card.id.isEmpty) return;
    final next = !_saved;
    setState(() => _saved = next);
    try {
      if (next) {
        await PracticeService.saveWord(card.id);
      } else {
        await PracticeService.unsaveWord(card.id);
      }
      if (!mounted) return;
      final session = _session;
      if (session == null) return;
      final cards = List<PracticeCard>.from(session.cards);
      final i = _index;
      if (i >= 0 && i < cards.length) {
        cards[i] = cards[i].copyWith(saved: next);
        setState(() {
          _session = PracticeSession(
            nativeLang: session.nativeLang,
            targetLang: session.targetLang,
            level: session.level,
            cards: cards,
          );
          _saved = next;
        });
      }
    } catch (err) {
      if (!mounted) return;
      setState(() => _saved = !next);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save failed: $err')),
      );
    }
  }

  Future<void> _onListen() async {
    final card = _current;
    if (card == null || _listening) return;
    setState(() => _listening = true);
    try {
      final file = await _tts.synthesizeToFile(
        card.word,
        voiceId: TutorVoiceIds.female,
        modelId: TutorTtsService.flashModel,
      );
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (err) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Listen failed: $err')),
      );
    } finally {
      if (mounted) setState(() => _listening = false);
    }
  }

  String _nativeLanguageLabel(String code) {
    final target = AppText.current.targetLanguage;
    final language = AppText.current.language;
    switch (code.toLowerCase()) {
      case 'tr':
        return target.turkish.toUpperCase();
      case 'de':
        return target.german.toUpperCase();
      case 'it':
        return target.italian.toUpperCase();
      case 'fr':
        return language.french.toUpperCase();
      case 'es':
        return language.spanish.toUpperCase();
      case 'ru':
        return language.russian.toUpperCase();
      case 'ja':
      case 'jp':
        return language.japanese.toUpperCase();
      case 'pt':
        return target.portuguese.toUpperCase();
      case 'ko':
        return target.korean.toUpperCase();
      case 'zh':
        return target.simplifiedChinese.toUpperCase();
      case 'ar':
        return target.arabic.toUpperCase();
      case 'hi':
        return target.hindi.toUpperCase();
      case 'en':
        return language.english.toUpperCase();
      default:
        return code.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.wordPracticePage;
    final card = _current;
    final cardsLen = _session?.cards.length ?? 0;

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
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _error!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  PrimaryButton(
                                    label: 'Retry',
                                    onPressed: _load,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : card == null
                            ? const Center(child: Text('No words'))
                            : SingleChildScrollView(
                                padding:
                                    const EdgeInsets.fromLTRB(19, 0, 19, 10),
                                child: _WordCard(
                                  word: card.word,
                                  phonetic: card.phonetic,
                                  translations: card.translations,
                                  exampleTarget: card.sentence,
                                  exampleNative: card.sentenceTranslation,
                                  languageLabel: _nativeLanguageLabel(
                                    _session?.nativeLang ?? 'tr',
                                  ),
                                  hintVisible: _hintVisible,
                                  saved: _saved,
                                  listening: _listening,
                                  saveLabel: _saved ? text.saved : text.save,
                                  listenLabel: text.listen,
                                  hintLabel: text.hint,
                                  onSave: _onToggleSave,
                                  onListen: _onListen,
                                  onHint: () => setState(
                                    () => _hintVisible = !_hintVisible,
                                  ),
                                  saveIdle: _saveIdle,
                                  saveBg: _saveBg,
                                  chipText: _chipText,
                                  hintBg: _hintBg,
                                ),
                              ),
              ),
              if (!_loading && _error == null && card != null)
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
                      PrimaryButton(
                        label: text.next,
                        onPressed: _goNext,
                      ),
                      if (cardsLen > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '${_index + 1} / $cardsLen',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: AppColors.secondary,
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

class _WordCard extends StatelessWidget {
  const _WordCard({
    required this.word,
    required this.phonetic,
    required this.translations,
    required this.exampleTarget,
    required this.exampleNative,
    required this.languageLabel,
    required this.hintVisible,
    required this.saved,
    required this.listening,
    required this.saveLabel,
    required this.listenLabel,
    required this.hintLabel,
    required this.onSave,
    required this.onListen,
    required this.onHint,
    required this.saveIdle,
    required this.saveBg,
    required this.chipText,
    required this.hintBg,
  });

  final String word;
  final String phonetic;
  final List<String> translations;
  final String exampleTarget;
  final String exampleNative;
  final String languageLabel;
  final bool hintVisible;
  final bool saved;
  final bool listening;
  final String saveLabel;
  final String listenLabel;
  final String hintLabel;
  final VoidCallback onSave;
  final VoidCallback onListen;
  final VoidCallback onHint;
  final Color saveIdle;
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
            word,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 36,
              height: 54 / 36,
              fontWeight: FontWeight.w500,
              color: AppColors.ink,
            ),
          ),
          if (phonetic.isNotEmpty)
            Text(
              phonetic,
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
            translations: translations,
            hintVisible: hintVisible,
            chipText: chipText,
          ),
          const SizedBox(height: 10),
          _ExampleBlock(
            exampleTarget: exampleTarget,
            exampleNative: exampleNative,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _ActionChipButton(
                  label: saveLabel,
                  background: saveBg,
                  foreground:
                      saved ? AppColors.primary : saveIdle,
                  icon: HomeAsset(
                    AppAssets.profileSaveButton,
                    width: 20,
                    height: 20,
                    color: saved ? AppColors.primary : saveIdle,
                  ),
                  onTap: onSave,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ActionChipButton(
                  label: listening ? '…' : listenLabel,
                  background: AppColors.ink,
                  foreground: Colors.white,
                  icon: const HomeAsset(
                    'assets/images/whiteSpeaker.svg',
                    width: 20,
                    height: 20,
                  ),
                  onTap: listening ? () {} : onListen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ActionChipButton(
                  label: hintLabel,
                  background: hintBg,
                  foreground: AppColors.primary,
                  icon: HomeAsset(
                    hintVisible
                        ? AppAssets.hintOn
                        : AppAssets.hint,
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
              children: (translations.isEmpty ? const ['—'] : translations)
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
    required this.exampleTarget,
    required this.exampleNative,
  });

  final String exampleTarget;
  final String exampleNative;

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
                  exampleTarget.isEmpty ? '—' : exampleTarget,
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
                  exampleNative.isEmpty ? '—' : exampleNative,
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
