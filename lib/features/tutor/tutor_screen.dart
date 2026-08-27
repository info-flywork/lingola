import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/rive/rive_preload_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'chat_history_screen.dart';
import 'chat_screen.dart';
import 'calling_screen.dart';
import 'services/tutor_api_service.dart';
import 'services/tutor_tts_service.dart';
import 'tutor_filter_sheet.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({super.key});

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  List<_TutorData>? _remoteTutors;
  var _loadingRemote = true;
  _TutorData? _focusedTutor;

  @override
  void initState() {
    super.initState();
    _loadRemoteTutors();
  }

  List<_TutorData> _tutorsFor(dynamic text) =>
      _remoteTutors ?? _localTutorCards(text);

  _TutorData _resolvedFocus(List<_TutorData> tutors) {
    final focused = _focusedTutor;
    if (focused != null &&
        tutors.any((t) => t.identity == focused.identity)) {
      return focused;
    }
    return tutors.isNotEmpty ? tutors.first : _fallbackLingola(text: AppText.current.tutorPage);
  }

  static _TutorData _fallbackLingola({required dynamic text}) {
    return _TutorData(
      name: text.tutors.lingola as String,
      image: AppAssets.tutorRobot,
      slug: 'lingola',
      tags: [text.tags.analytic as String, text.tags.curious as String],
    );
  }

  void _focusTutor(_TutorData tutor) {
    if (_focusedTutor?.identity == tutor.identity) return;
    setState(() => _focusedTutor = tutor);
  }

  void _openChat(_TutorData tutor) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatScreen(
          tutorName: tutor.name,
          imagePath: tutor.image,
          tutorId: tutor.id,
          tutorSlug: tutor.slug,
        ),
      ),
    );
  }

  void _openCalling(_TutorData tutor) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CallingScreen(
          tutorName: tutor.name,
          imagePath: tutor.image,
          riveAsset: tutor.riveAsset,
          riveCdnUrl: tutor.riveCdnUrl,
          voiceId: tutor.voiceId,
          backgroundGradientStart: tutor.theme?.gradientStart,
          backgroundGradientEnd: tutor.theme?.gradientEnd,
          tutorSlug: tutor.slug,
        ),
      ),
    );
  }

  Future<void> _loadRemoteTutors() async {
    try {
      final remote = await TutorApiService.fetchTutors();
      if (!mounted || remote.isEmpty) {
        setState(() => _loadingRemote = false);
        return;
      }
      final text = AppText.current.tutorPage;
      final mapped = remote
          .map((dto) => _mapRemoteTutor(dto, text))
          .whereType<_TutorData>()
          .toList();
      setState(() {
        _remoteTutors = mapped;
        _focusedTutor ??= mapped.isNotEmpty ? mapped.first : null;
        _loadingRemote = false;
      });
      RivePreloadService.preloadMany([
        AppAssets.tutorLingolaRivCdn,
        ...mapped.map((t) => t.riveCdnUrl),
      ]);
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingRemote = false);
    }
  }

  _TutorData? _mapRemoteTutor(TutorDto dto, dynamic text) {
    final image = dto.imagePath;
    if (image == null || image.isEmpty) return null;
    final tags = text.tags;
    return _TutorData(
      id: dto.id,
      slug: dto.slug,
      name: _tutorDisplayName(text.tutors, dto.nameKey, dto.slug),
      image: image,
      riveAsset: dto.remoteRiveUrl ?? AppAssets.tutorRiveCdn(dto.slug),
      riveCdnUrl: dto.remoteRiveUrl ?? AppAssets.tutorRiveCdn(dto.slug),
      voiceId: dto.voiceId,
      flagAsset: dto.flagAssetPath?.trim().isNotEmpty == true
          ? dto.flagAssetPath
          : AppAssets.flagForTutorSlug(dto.slug),
      tags: dto.tagKeys
          .map((key) => _tagDisplayName(tags, key))
          .toList(growable: false),
      theme: _themeFromDto(dto.theme),
    );
  }

  static String _tutorDisplayName(dynamic tutors, String key, String slug) {
    switch (key) {
      case 'lingola':
        return tutors.lingola as String;
      case 'zephyrion':
        return tutors.zephyrion as String;
      case 'vaelen':
        return tutors.vaelen as String;
      case 'elrion':
        return tutors.elrion as String;
      case 'ukrath':
        return tutors.ukrath as String;
      case 'elena':
        return tutors.elena as String;
      case 'kenji':
        return tutors.kenji as String;
      case 'freya':
        return tutors.freya as String;
      case 'camila':
        return tutors.camila as String;
      case 'marco':
        return tutors.marco as String;
      case 'julian':
        return tutors.julian as String;
      case 'ines':
        return tutors.ines as String;
      case 'felix':
        return tutors.felix as String;
      case 'diego':
        return tutors.diego as String;
      case 'amara':
        return tutors.amara as String;
      case 'erik':
        return tutors.erik as String;
      case 'katie':
        return tutors.katie as String;
      case 'morgan':
        return tutors.morgan as String;
      case 'santa':
        return tutors.santa as String;
      default:
        return slug;
    }
  }

  static String _tagDisplayName(dynamic tags, String key) {
    switch (key) {
      case 'adaptive':
        return tags.adaptive as String;
      case 'calm':
        return tags.calm as String;
      case 'patient':
        return tags.patient as String;
      case 'organized':
        return tags.organized as String;
      case 'relaxed':
        return tags.relaxed as String;
      case 'methodical':
        return tags.methodical as String;
      case 'attentive':
        return tags.attentive as String;
      case 'curious':
        return tags.curious as String;
      case 'observer':
        return tags.observer as String;
      case 'ancientKnowledge':
        return tags.ancientKnowledge as String;
      case 'wise':
        return tags.wise as String;
      case 'clear':
        return tags.clear as String;
      case 'decisive':
        return tags.decisive as String;
      case 'disciplined':
        return tags.disciplined as String;
      case 'smart':
        return tags.smart as String;
      case 'analytic':
        return tags.analytic as String;
      case 'cheerful':
        return tags.cheerful as String;
      case 'generous':
        return tags.generous as String;
      default:
        return key;
    }
  }

  static TutorCardTheme? _themeFromDto(TutorThemeDto? theme) {
    if (theme == null) return null;
    final start = _parseHex(theme.gradientStart);
    final end = _parseHex(theme.gradientEnd);
    final button = _parseHex(theme.buttonColor);
    final fg = _parseHex(theme.buttonForeground);
    if (start == null || end == null || button == null || fg == null) {
      return null;
    }
    return TutorCardTheme(
      gradientStart: start,
      gradientEnd: end,
      buttonColor: button,
      buttonForeground: fg,
    );
  }

  static Color? _parseHex(String raw) {
    var hex = raw.trim().replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final tutors = _tutorsFor(text);
    final focused = _resolvedFocus(tutors);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: ColoredBox(
        color: AppColors.surface,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _TutorHero(
                text: text,
                tutor: focused,
                onChat: () => _openChat(focused),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text.title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          height: 30 / 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    if (_loadingRemote && _remoteTutors == null)
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => showTutorFilterSheet(context),
                        child: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black.withValues(alpha: .10),
                            ),
                          ),
                          child: const HomeAsset(
                            AppAssets.tutorFilter,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9999),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const ChatHistoryScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(9999),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color: Colors.black.withValues(alpha: .10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text.chatHistory,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const HomeAsset(
                                  AppAssets.quizArrow,
                                  width: 6,
                                  height: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 194 / 282,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final tutor = tutors[index];
                    final selected = tutor.identity == focused.identity;
                    return TutorCard(
                      name: tutor.name,
                      imagePath: tutor.image,
                      tags: tutor.tags,
                      theme: tutor.theme,
                      selected: selected,
                      onHoverChanged: (hovering) {
                        if (hovering) _focusTutor(tutor);
                      },
                      onSelect: () => _focusTutor(tutor),
                      onStartTalk: () {
                        _focusTutor(tutor);
                        _openCalling(tutor);
                      },
                    );
                  },
                  childCount: tutors.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Local fallback — bundled assets stay in the app (never delete).
  List<_TutorData> _localTutorCards(dynamic text) {
    final tags = text.tags;
    return [
      _TutorData(
        name: text.tutors.lingola,
        slug: 'lingola',
        image: AppAssets.tutorRobot,
        riveAsset: AppAssets.tutorLingolaRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagGeneric,
        tags: [tags.analytic, tags.curious],
      ),
      _TutorData(
        name: text.tutors.elena,
        slug: 'elena',
        image: AppAssets.tutorElena,
        riveAsset: AppAssets.tutorElenaRiv,
        flagAsset: AppAssets.flagEn,
        tags: [tags.adaptive, tags.calm],
      ),
      _TutorData(
        name: text.tutors.kenji,
        slug: 'kenji',
        image: AppAssets.tutorKenji,
        riveAsset: AppAssets.tutorKenjiRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagJp,
        tags: [tags.patient, tags.organized],
      ),
      _TutorData(
        name: text.tutors.freya,
        slug: 'freya',
        image: AppAssets.tutorFreya,
        riveAsset: AppAssets.tutorFreyaRiv,
        flagAsset: AppAssets.flagDe,
        tags: [tags.calm, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.camila,
        slug: 'camila',
        image: AppAssets.tutorCamila,
        riveAsset: AppAssets.tutorCamilaRiv,
        flagAsset: AppAssets.flagEs,
        tags: [tags.adaptive, tags.relaxed],
      ),
      _TutorData(
        name: text.tutors.marco,
        slug: 'marco',
        image: AppAssets.tutorMarco,
        riveAsset: AppAssets.tutorMarcoRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagIt,
        tags: [tags.methodical, tags.patient],
      ),
      _TutorData(
        name: text.tutors.julian,
        slug: 'julian',
        image: AppAssets.tutorJulian,
        riveAsset: AppAssets.tutorJulianRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagFr,
        tags: [tags.adaptive, tags.calm],
      ),
      _TutorData(
        name: text.tutors.ines,
        slug: 'ines',
        image: AppAssets.tutorInes,
        riveAsset: AppAssets.tutorInesRiv,
        flagAsset: AppAssets.flagPt,
        tags: [tags.patient, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.felix,
        slug: 'felix',
        image: AppAssets.tutorFelix,
        riveAsset: AppAssets.tutorFelixRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagDe,
        tags: [tags.organized, tags.relaxed],
      ),
      _TutorData(
        name: text.tutors.diego,
        slug: 'diego',
        image: AppAssets.tutorDiego,
        riveAsset: AppAssets.tutorDiegoRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagEs,
        tags: [tags.methodical, tags.calm],
      ),
      _TutorData(
        name: text.tutors.amara,
        slug: 'amara',
        image: AppAssets.tutorAmara,
        riveAsset: AppAssets.tutorAmaraRiv,
        flagAsset: AppAssets.flagHi,
        tags: [tags.adaptive, tags.patient],
      ),
      _TutorData(
        name: text.tutors.erik,
        slug: 'erik',
        image: AppAssets.tutorErik,
        riveAsset: AppAssets.tutorErikRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagDe,
        tags: [tags.relaxed, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.katie,
        slug: 'katie',
        image: AppAssets.tutorKatie,
        riveAsset: AppAssets.tutorKatieRiv,
        flagAsset: AppAssets.flagEn,
        tags: [tags.disciplined, tags.decisive],
      ),
      _TutorData(
        name: text.tutors.morgan,
        slug: 'morgan',
        image: AppAssets.tutorMorgan,
        riveAsset: AppAssets.tutorMorganRiv,
        voiceId: TutorVoiceIds.male,
        flagAsset: AppAssets.flagEn,
        tags: [tags.smart, tags.patient],
      ),
      _TutorData(
        name: text.tutors.santa,
        slug: 'santa',
        image: AppAssets.tutorHeroBg,
        riveAsset: AppAssets.tutorSantaRiv,
        voiceId: TutorVoiceIds.santa,
        tags: [tags.cheerful, tags.generous],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFFE85D04),
          gradientEnd: Color(0xFF9B2226),
          buttonColor: Color(0xFFD00000),
          buttonForeground: Colors.white,
        ),
      ),
      _TutorData(
        name: text.tutors.zephyrion,
        slug: 'zephyrion',
        image: AppAssets.tutorZephyrion,
        riveAsset: AppAssets.tutorZephyrionRiv,
        voiceId: TutorVoiceIds.zephyrion,
        tags: [tags.curious, tags.observer],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF586168),
          gradientEnd: Color(0xFF184238),
          buttonColor: Color(0xFFE8EEF0),
          buttonForeground: Color(0xFF184238),
        ),
      ),
      _TutorData(
        name: text.tutors.vaelen,
        slug: 'vaelen',
        image: AppAssets.tutorVaelen,
        riveAsset: AppAssets.tutorVaelenRiv,
        tags: [tags.calm, tags.ancientKnowledge],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF160A20),
          gradientEnd: Color(0xFF64557E),
          buttonColor: Color(0xFF150D1D),
          buttonForeground: Colors.white,
        ),
      ),
      _TutorData(
        name: text.tutors.ukrath,
        slug: 'ukrath',
        image: AppAssets.tutorUkrath,
        riveAsset: AppAssets.tutorUkrathRiv,
        voiceId: TutorVoiceIds.ukrath,
        tags: [tags.clear, tags.decisive],
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF2A1812),
          gradientEnd: Color(0xFF833A21),
          buttonColor: Color(0xFF533029),
          buttonForeground: Colors.white,
        ),
      ),
      _TutorData(
        name: text.tutors.elrion,
        slug: 'elrion',
        image: AppAssets.tutorElrion,
        tags: [tags.wise, tags.patient],
        riveAsset: AppAssets.tutorElrionRiv,
        voiceId: TutorVoiceIds.male,
        theme: const TutorCardTheme(
          gradientStart: Color(0xFF18452A),
          gradientEnd: Color(0xFFD7B35A),
          buttonColor: Color(0xFF386236),
          buttonForeground: Colors.white,
        ),
      ),
    ];
  }
}

class TutorCardTheme {
  const TutorCardTheme({
    required this.gradientStart,
    required this.gradientEnd,
    required this.buttonColor,
    required this.buttonForeground,
  });

  final Color gradientStart;
  final Color gradientEnd;
  final Color buttonColor;
  final Color buttonForeground;
}

class _TutorData {
  const _TutorData({
    required this.name,
    required this.image,
    required this.tags,
    this.id,
    this.slug,
    this.theme,
    this.flagAsset,
    this.riveAsset,
    this.riveCdnUrl,
    this.voiceId,
  });

  final String? id;
  final String? slug;
  final String name;
  final String image;
  final List<String> tags;
  final TutorCardTheme? theme;
  final String? flagAsset;
  final String? riveAsset;
  final String? riveCdnUrl;
  final String? voiceId;

  String get identity => id ?? slug ?? name;
}

class _TutorHero extends StatefulWidget {
  const _TutorHero({
    required this.text,
    required this.tutor,
    required this.onChat,
  });

  final dynamic text;
  final _TutorData tutor;
  final VoidCallback onChat;

  @override
  State<_TutorHero> createState() => _TutorHeroState();
}

class _TutorHeroState extends State<_TutorHero> {
  final _player = AudioPlayer();
  final _tts = TutorTtsService();
  var _playbackRate = 1.0;
  var _speaking = false;

  static const _rates = [0.5, 1.0, 1.5, 2.0];

  String get _rateLabel {
    final r = _playbackRate;
    if (r == 0.5) return '0.5x';
    if (r == 1.5) return '1.5x';
    if (r == 2.0) return '2x';
    return '1x';
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _speakPreview() async {
    if (_speaking) {
      await _player.stop();
      if (mounted) setState(() => _speaking = false);
      return;
    }
    setState(() => _speaking = true);
    try {
      final file = await _tts.synthesizeToFile(
        "Hi, I'm ${widget.tutor.name}. Let's practice English together.",
        voiceId: widget.tutor.voiceId ?? TutorVoiceIds.male,
      );
      await _player.setPlaybackRate(_playbackRate);
      await _player.play(DeviceFileSource(file.path));
      await _player.onPlayerComplete.first;
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
    } finally {
      if (mounted) setState(() => _speaking = false);
    }
  }

  Future<void> _cycleRate() async {
    final i = _rates.indexOf(_playbackRate);
    final next = _rates[(i < 0 ? 0 : i + 1) % _rates.length];
    setState(() => _playbackRate = next);
    try {
      await _player.setPlaybackRate(next);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final tutor = widget.tutor;
    final topInset = MediaQuery.paddingOf(context).top;
    final chatLabel = text.chatWithTutor(name: tutor.name) as String;
    return SizedBox(
      height: topInset + 280,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _TutorHeroBackdrop(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 280,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 280),
                    child: HomeAsset(
                      tutor.image,
                      key: ValueKey(tutor.identity),
                      width: 220,
                      height: 220,
                      fit: BoxFit.contain,
                      alignment: const Alignment(0, -0.2),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 20,
                  child: Row(
                    children: [
                      _GlassIconButton(
                        tooltip: text.speaker as String,
                        onTap: _speakPreview,
                        child: const HomeAsset(
                          AppAssets.tutorSpeaker,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: const Color(0x80000000),
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: _cycleRate,
                          child: SizedBox(
                            width: 36,
                            height: 36,
                            child: Center(
                              child: Text(
                                _rateLabel,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 20,
                  child: Material(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                    child: InkWell(
                      onTap: widget.onChat,
                      borderRadius: BorderRadius.circular(999),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const HomeAsset(
                              AppAssets.tutorChatWithLingola,
                              width: 21,
                              height: 21,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              chatLabel,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

/// Figma: #2D46FF / #2D85FF / #37B2E3 blur ellipses → surface.
class _TutorHeroBackdrop extends StatelessWidget {
  const _TutorHeroBackdrop();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: AppColors.surface),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2D46FF),
                  Color(0xFF2D85FF),
                  Color(0xFF37B2E3),
                  AppColors.surface,
                ],
                stops: [0, 0.28, 0.55, 1],
              ),
            ),
          ),
          Positioned(
            left: -84,
            top: -180,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: Container(
                width: 320,
                height: 320,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D46FF),
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            top: -100,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 75, sigmaY: 75),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF37B2E3),
                ),
              ),
            ),
          ),
          Positioned(
            left: -20,
            top: -40,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2D85FF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({
    required this.tooltip,
    required this.onTap,
    required this.child,
  });

  final String tooltip;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: const Color(0x80000000),
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
      ),
    );
  }
}

class TutorCard extends StatelessWidget {
  const TutorCard({
    required this.name,
    required this.imagePath,
    required this.tags,
    required this.onStartTalk,
    this.selected = false,
    this.onSelect,
    this.onHoverChanged,
    this.theme,
    super.key,
  });

  final String name;
  final String imagePath;
  final List<String> tags;
  final VoidCallback onStartTalk;
  final bool selected;
  final VoidCallback? onSelect;
  final ValueChanged<bool>? onHoverChanged;
  final TutorCardTheme? theme;

  @override
  Widget build(BuildContext context) {
    final themed = theme != null;
    final child = themed ? _buildThemed(context, theme!) : _buildClassic(context);
    return MouseRegion(
      onEnter: (_) => onHoverChanged?.call(true),
      onExit: (_) => onHoverChanged?.call(false),
      child: GestureDetector(
        onTap: onSelect,
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }

  Widget _buildClassic(BuildContext context) {
    final text = AppText.current.tutorPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryTint10 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.15),
                    radius: 1.05,
                    colors: [Color(0xFF939393), Color(0xFF969696)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SizedBox.expand(
                    child: HomeAsset(
                      imagePath,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.55),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              height: 23 / 15,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 10,
            runSpacing: 4,
            children: tags
                .take(2)
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFFE8EBFF)
                          : const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: selected
                            ? AppColors.primary
                            : AppColors.secondary,
                        fontSize: 10,
                        height: 14 / 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 4),
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: onStartTalk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomeAsset(
                      AppAssets.tutorChatWithLingola,
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        text.startTalkNow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                          height: 14 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemed(BuildContext context, TutorCardTheme theme) {
    final text = AppText.current.tutorPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected
              ? Colors.white
              : Colors.black.withValues(alpha: .10),
          width: selected ? 2 : 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.gradientStart, theme.gradientEnd],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.expand(
                child: HomeAsset(
                  imagePath,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.55),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              height: 23 / 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: tags
                .take(2)
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .20),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 10,
                        height: 14 / 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 4),
          Material(
            color: theme.buttonColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: onStartTalk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeAsset(
                      AppAssets.tutorChatWithLingola,
                      width: 15,
                      height: 15,
                      color: theme.buttonForeground,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        text.startTalkNow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: theme.buttonForeground,
                          fontSize: 12,
                          height: 14 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
