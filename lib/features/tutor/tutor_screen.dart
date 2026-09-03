import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' as rive;

import '../../core/config/app_env.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../i18n/strings.g.dart';
import '../../core/premium/premium_service.dart';
import '../../core/rive/rive_preload_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import '../lesson/lesson_tutor_choice.dart';
import 'chat_history_screen.dart';
import 'chat_screen.dart';
import 'calling_screen.dart';
import 'services/tutor_api_service.dart';
import 'services/tutor_tts_service.dart';
import 'services/viseme_cue.dart';
import 'tutor_filter.dart';
import 'tutor_filter_sheet.dart';
import 'tutor_scene_theme.dart';
import 'widgets/tutor_rive_avatar.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({super.key});

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  List<_TutorData>? _remoteTutors;
  var _loadingRemote = true;
  _TutorData? _focusedTutor;
  TutorFilter _filter = TutorFilter.empty;

  @override
  void initState() {
    super.initState();
    _loadRemoteTutors();
  }

  List<_TutorData> _tutorsFor(dynamic text) =>
      _remoteTutors ?? _TutorScreenState._localTutorCards(text);

  List<_TutorData> _visibleTutors(dynamic text) {
    final all = _tutorsFor(text);
    if (!_filter.isActive) return all;
    return all
        .where(
          (t) => _filter.matches(
            tutorTagKeys: t.filterTagKeys,
            tutorFlagAsset: t.flagAsset,
          ),
        )
        .toList();
  }

  void _applyFilter(TutorFilter filter, dynamic text) {
    final visible = _visibleTutorsFrom(all: _tutorsFor(text), filter: filter);
    setState(() {
      _filter = filter;
      final focused = _focusedTutor;
      if (focused != null &&
          visible.any((t) => t.identity == focused.identity)) {
        return;
      }
      _focusedTutor = visible.isNotEmpty ? visible.first : null;
    });
  }

  List<_TutorData> _visibleTutorsFrom({
    required List<_TutorData> all,
    required TutorFilter filter,
  }) {
    if (!filter.isActive) return all;
    return all
        .where(
          (t) => filter.matches(
            tutorTagKeys: t.filterTagKeys,
            tutorFlagAsset: t.flagAsset,
          ),
        )
        .toList();
  }

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

  void _openCalling(_TutorData tutor) async {
    if (!await PremiumService.requireTutorOrPaywall(context, tutor.slug)) {
      return;
    }
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CallingScreen(
          tutorName: tutor.name,
          imagePath: tutor.image,
          riveAsset: tutor.riveAsset,
          riveCdnUrl: tutor.riveCdnUrl,
        voiceId: TutorVoiceIds.resolve(tutor.slug, preferred: tutor.voiceId),
          backgroundGradientStart: tutor.theme?.gradientStart ??
              TutorSceneTheme.gradientForSlug(tutor.slug)?.$1,
          backgroundGradientEnd: tutor.theme?.gradientEnd ??
              TutorSceneTheme.gradientForSlug(tutor.slug)?.$2,
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
          .map((dto) => _TutorScreenState._mapRemoteTutor(dto, text))
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

  static _TutorData? _mapRemoteTutor(TutorDto dto, dynamic text) {
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
      voiceId: TutorVoiceIds.resolve(dto.slug, preferred: dto.voiceId),
      flagAsset: dto.flagAssetPath?.trim().isNotEmpty == true
          ? dto.flagAssetPath
          : AppAssets.flagForTutorSlug(dto.slug),
      tags: dto.tagKeys
          .map((key) => _tagDisplayName(tags, key))
          .toList(growable: false),
      tagKeys: dto.tagKeys,
      theme: _themeFromDto(dto.theme, slug: dto.slug),
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

  static TutorCardTheme? _themeFromDto(TutorThemeDto? theme, {String? slug}) {
    if (theme != null) {
      final start = _parseHex(theme.gradientStart);
      final end = _parseHex(theme.gradientEnd);
      final button = _parseHex(theme.buttonColor);
      final fg = _parseHex(theme.buttonForeground);
      if (start != null && end != null && button != null && fg != null) {
        return TutorCardTheme(
          gradientStart: start,
          gradientEnd: end,
          buttonColor: button,
          buttonForeground: fg,
        );
      }
    }
    final fallback = TutorSceneTheme.gradientForSlug(slug);
    if (fallback == null) return null;
    return TutorCardTheme(
      gradientStart: fallback.$1,
      gradientEnd: fallback.$2,
      buttonColor: fallback.$1,
      buttonForeground: Colors.white,
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
    final tutors = _visibleTutors(text);
    final focused = tutors.isEmpty
        ? _fallbackLingola(text: text)
        : _resolvedFocus(tutors);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: ColoredBox(
        color: AppColors.surface,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _PinnedTutorHeroDelegate(
                topInset: MediaQuery.paddingOf(context).top,
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
                        onTap: () async {
                          final result = await showTutorFilterSheet(
                            context,
                            initial: _filter,
                          );
                          if (result == null || !mounted) return;
                          _applyFilter(result, text);
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _filter.isActive
                                  ? AppColors.primary
                                  : Colors.black.withValues(alpha: .10),
                              width: _filter.isActive ? 1.5 : 1,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const HomeAsset(
                                AppAssets.tutorFilter,
                                width: 20,
                                height: 20,
                              ),
                              if (_filter.isActive)
                                const Positioned(
                                  top: 6,
                                  right: 6,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SizedBox(width: 7, height: 7),
                                  ),
                                ),
                            ],
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
            if (_filter.isActive)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: AppColors.primaryTint05,
                      borderRadius: BorderRadius.circular(999),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => _applyFilter(TutorFilter.empty, text),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.filter_alt_off_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                text.clearFilter,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: tutors.isEmpty
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          LocaleSettings.currentLocale == AppLocale.tr
                              ? 'Seçilen filtrelere uygun eğitmen bulunamadı.'
                              : 'No tutors match these filters.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    )
                  : SliverGrid(
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
  static List<_TutorData> _localTutorCards(dynamic text) {
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
        voiceId: TutorVoiceIds.female,
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
        voiceId: TutorVoiceIds.female,
        image: AppAssets.tutorFreya,
        riveAsset: AppAssets.tutorFreyaRiv,
        flagAsset: AppAssets.flagDe,
        tags: [tags.calm, tags.attentive],
      ),
      _TutorData(
        name: text.tutors.camila,
        slug: 'camila',
        voiceId: TutorVoiceIds.female,
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
        voiceId: TutorVoiceIds.female,
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
        voiceId: TutorVoiceIds.female,
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
        voiceId: TutorVoiceIds.female,
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
        voiceId: TutorVoiceIds.female,
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

/// Ders başlatmadan önce eğitmen seçimi — Tutor sekmesiyle aynı arayüz.
class LessonTutorPickerScreen extends StatefulWidget {
  const LessonTutorPickerScreen({super.key, required this.lessonTitle});

  final String lessonTitle;

  @override
  State<LessonTutorPickerScreen> createState() =>
      _LessonTutorPickerScreenState();
}

class _LessonTutorPickerScreenState extends State<LessonTutorPickerScreen> {
  List<TutorDto> _rawTutors = const [];
  List<_TutorData>? _remoteTutors;
  var _loadingRemote = true;
  _TutorData? _focusedTutor;
  TutorFilter _filter = TutorFilter.empty;

  @override
  void initState() {
    super.initState();
    _loadRemoteTutors();
  }

  List<_TutorData> _tutorsFor(dynamic text) =>
      _remoteTutors ?? _TutorScreenState._localTutorCards(text);

  List<_TutorData> _visibleTutors(dynamic text) {
    final all = _tutorsFor(text);
    if (!_filter.isActive) return all;
    return all
        .where(
          (t) => _filter.matches(
            tutorTagKeys: t.filterTagKeys,
            tutorFlagAsset: t.flagAsset,
          ),
        )
        .toList();
  }

  void _applyFilter(TutorFilter filter, dynamic text) {
    final visible = _visibleTutorsFrom(all: _tutorsFor(text), filter: filter);
    setState(() {
      _filter = filter;
      final focused = _focusedTutor;
      if (focused != null &&
          visible.any((t) => t.identity == focused.identity)) {
        return;
      }
      _focusedTutor = visible.isNotEmpty ? visible.first : null;
    });
  }

  List<_TutorData> _visibleTutorsFrom({
    required List<_TutorData> all,
    required TutorFilter filter,
  }) {
    if (!filter.isActive) return all;
    return all
        .where(
          (t) => filter.matches(
            tutorTagKeys: t.filterTagKeys,
            tutorFlagAsset: t.flagAsset,
          ),
        )
        .toList();
  }

  _TutorData _resolvedFocus(List<_TutorData> tutors, dynamic text) {
    final focused = _focusedTutor;
    if (focused != null &&
        tutors.any((t) => t.identity == focused.identity)) {
      return focused;
    }
    return tutors.isNotEmpty
        ? tutors.first
        : _TutorScreenState._fallbackLingola(text: text);
  }

  void _focusTutor(_TutorData tutor) {
    if (_focusedTutor?.identity == tutor.identity) return;
    setState(() => _focusedTutor = tutor);
  }

  TutorDto? _dtoFor(_TutorData tutor) {
    for (final dto in _rawTutors) {
      if (dto.id == tutor.id || dto.slug == tutor.slug) return dto;
    }
    final slug = tutor.slug?.trim();
    if (slug == null || slug.isEmpty) return null;
    return TutorDto(
      id: tutor.id ?? slug,
      slug: slug,
      nameKey: slug,
      tagKeys: tutor.filterTagKeys,
      voiceId: tutor.voiceId,
      localImagePath: tutor.image,
      localRivePath: tutor.riveAsset,
      flagAssetPath: tutor.flagAsset,
    );
  }

  void _confirm(String mode) {
    final focused = _focusedTutor;
    if (focused == null) return;
    final dto = _dtoFor(focused);
    if (dto == null) return;
    Navigator.of(context).pop(LessonTutorChoice(tutor: dto, mode: mode));
  }

  Future<void> _loadRemoteTutors() async {
    try {
      final remote = await TutorApiService.fetchTutors();
      if (!mounted) return;
      if (remote.isEmpty) {
        setState(() => _loadingRemote = false);
        return;
      }
      final text = AppText.current.tutorPage;
      final mapped = remote
          .map((dto) => _TutorScreenState._mapRemoteTutor(dto, text))
          .whereType<_TutorData>()
          .toList();
      setState(() {
        _rawTutors = remote;
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

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;
    final lessonText = AppText.current.lessonPage;
    final tutors = _visibleTutors(text);
    final focused = tutors.isEmpty
        ? _TutorScreenState._fallbackLingola(text: text)
        : _resolvedFocus(tutors, text);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        bottomNavigationBar: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              10,
              16,
              MediaQuery.viewPaddingOf(context).bottom + 6,
            ),
            child: Row(
              children: [
                Expanded(
                  child: _LessonPickerActionButton(
                    label: lessonText.chatInstead,
                    filled: false,
                    onPressed: _focusedTutor == null
                        ? null
                        : () => _confirm('chat'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _LessonPickerActionButton(
                    label: lessonText.startTalk,
                    filled: true,
                    onPressed: _focusedTutor == null
                        ? null
                        : () => _confirm('talk'),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _PinnedTutorHeroDelegate(
                topInset: MediaQuery.paddingOf(context).top,
                text: text,
                tutor: focused,
                onChat: () {},
                showChatAction: false,
                leading: Material(
                  color: const Color(0x80000000),
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const SizedBox(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lessonText.pickTutorTitle,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              height: 30 / 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.lessonTitle,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_loadingRemote && _remoteTutors == null)
                      const Padding(
                        padding: EdgeInsets.only(right: 10, top: 4),
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
                        onTap: () async {
                          final result = await showTutorFilterSheet(
                            context,
                            initial: _filter,
                          );
                          if (result == null || !mounted) return;
                          _applyFilter(result, text);
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _filter.isActive
                                  ? AppColors.primary
                                  : Colors.black.withValues(alpha: .10),
                              width: _filter.isActive ? 1.5 : 1,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const HomeAsset(
                                AppAssets.tutorFilter,
                                width: 20,
                                height: 20,
                              ),
                              if (_filter.isActive)
                                const Positioned(
                                  top: 6,
                                  right: 6,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SizedBox(width: 7, height: 7),
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
            if (_filter.isActive)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: AppColors.primaryTint05,
                      borderRadius: BorderRadius.circular(999),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => _applyFilter(TutorFilter.empty, text),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.filter_alt_off_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                text.clearFilter,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: tutors.isEmpty
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          LocaleSettings.currentLocale == AppLocale.tr
                              ? 'Seçilen filtrelere uygun eğitmen bulunamadı.'
                              : 'No tutors match these filters.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    )
                  : SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 194 / 282,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final tutor = tutors[index];
                          final selected =
                              tutor.identity == focused.identity;
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
                              _confirm('talk');
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
}

class _LessonPickerActionButton extends StatelessWidget {
  const _LessonPickerActionButton({
    required this.label,
    required this.filled,
    required this.onPressed,
  });

  final String label;
  final bool filled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final shadow = filled
        ? AppColors.darkShadow
        : AppColors.secondaryButtonShadow;
    final child = filled
        ? FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: .45),
              disabledForegroundColor: Colors.white.withValues(alpha: .8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: AppTextStyles.primaryButton,
            ),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              disabledBackgroundColor: Colors.white,
              disabledForegroundColor: AppColors.primary.withValues(alpha: .45),
              side: BorderSide(color: shadow, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: AppTextStyles.primaryButton.copyWith(
                color: AppColors.primary,
              ),
            ),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );

    return Container(
      decoration: BoxDecoration(
        color: shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: child,
      ),
    );
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
    this.tagKeys = const [],
  });

  static const slugTagKeys = <String, List<String>>{
    'lingola': ['analytic', 'curious'],
    'elena': ['adaptive', 'calm'],
    'kenji': ['patient', 'organized'],
    'freya': ['calm', 'attentive'],
    'camila': ['adaptive', 'relaxed'],
    'marco': ['methodical', 'patient'],
    'julian': ['adaptive', 'calm'],
    'ines': ['patient', 'attentive'],
    'felix': ['organized', 'relaxed'],
    'diego': ['methodical', 'calm'],
    'amara': ['adaptive', 'patient'],
    'erik': ['relaxed', 'attentive'],
    'katie': ['disciplined', 'decisive'],
    'morgan': ['smart', 'patient'],
    'santa': ['cheerful', 'generous'],
    'zephyrion': ['curious', 'observer'],
    'vaelen': ['calm', 'ancientKnowledge'],
    'ukrath': ['clear', 'decisive'],
    'elrion': ['wise', 'patient'],
  };

  final String? id;
  final String? slug;
  final String name;
  final String image;
  final List<String> tags;
  final List<String> tagKeys;
  final TutorCardTheme? theme;
  final String? flagAsset;
  final String? riveAsset;
  final String? riveCdnUrl;
  final String? voiceId;

  String get identity => id ?? slug ?? name;

  String get heroRiveUrl {
    final cdn = riveCdnUrl?.trim();
    if (cdn != null && cdn.isNotEmpty) return cdn;
    final s = slug?.trim();
    if (s != null && s.isNotEmpty) return AppAssets.tutorRiveCdn(s);
    return AppAssets.tutorLingolaRivCdn;
  }

  List<String> get filterTagKeys {
    if (tagKeys.isNotEmpty) return tagKeys;
    final s = slug;
    if (s == null || s.isEmpty) return const [];
    return slugTagKeys[s] ?? const [];
  }
}

class _PinnedTutorHeroDelegate extends SliverPersistentHeaderDelegate {
  _PinnedTutorHeroDelegate({
    required this.topInset,
    required this.text,
    required this.tutor,
    required this.onChat,
    this.showChatAction = true,
    this.leading,
  });

  final double topInset;
  final dynamic text;
  final _TutorData tutor;
  final VoidCallback onChat;
  final bool showChatAction;
  final Widget? leading;

  @override
  double get minExtent => topInset + 280;

  @override
  double get maxExtent => topInset + 280;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _TutorHero(
      key: ValueKey(tutor.identity),
      text: text,
      tutor: tutor,
      topInset: topInset,
      onChat: onChat,
      showChatAction: showChatAction,
      leading: leading,
    );
  }

  @override
  bool shouldRebuild(covariant _PinnedTutorHeroDelegate oldDelegate) {
    return oldDelegate.topInset != topInset ||
        oldDelegate.tutor.identity != tutor.identity ||
        oldDelegate.showChatAction != showChatAction;
  }
}

class _TutorHero extends StatefulWidget {
  const _TutorHero({
    super.key,
    required this.text,
    required this.tutor,
    required this.topInset,
    required this.onChat,
    this.showChatAction = true,
    this.leading,
  });

  final dynamic text;
  final _TutorData tutor;
  final double topInset;
  final VoidCallback onChat;
  final bool showChatAction;
  final Widget? leading;

  @override
  State<_TutorHero> createState() => _TutorHeroState();
}

class _TutorHeroState extends State<_TutorHero> {
  final _player = AudioPlayer();
  final _tts = TutorTtsService();
  var _playbackRate = 1.0;
  var _speaking = false;
  double? _lipsyncViseme;
  List<VisemeCue> _visemeTrack = const [];
  double? _speechEndSec;
  Timer? _lipsyncPollTimer;
  var _currentViseme = 0.0;
  DateTime? _lastVisemeAppliedAt;

  static const _rates = [0.5, 1.0, 1.5, 2.0];

  String get _rateLabel {
    final r = _playbackRate;
    if (r == 0.5) return '0.5x';
    if (r == 1.5) return '1.5x';
    if (r == 2.0) return '2x';
    return '1x';
  }

  String get _previewLine =>
      "Hi, I'm ${widget.tutor.name}. Let's practice English together.";

  String? get _previewVoiceId => TutorVoiceIds.resolve(
        widget.tutor.slug,
        preferred: widget.tutor.voiceId,
      );

  @override
  void initState() {
    super.initState();
    _player.onPlayerComplete.listen((_) {
      if (_speaking) _finishSpeaking();
    });
    unawaited(_prefetchPreview());
  }

  @override
  void dispose() {
    _stopLipsyncPoll();
    _player.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _TutorHero oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tutor.identity != widget.tutor.identity) {
      unawaited(_player.stop());
      _finishSpeaking();
      unawaited(_prefetchPreview());
    }
  }

  Future<void> _prefetchPreview() async {
    try {
      await _tts.synthesizeForLipsync(
        _previewLine,
        voiceId: _previewVoiceId,
        tutorSlug: widget.tutor.slug,
        modelId: TutorTtsService.flashModel,
      );
    } catch (_) {}
  }

  void _stopLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = null;
  }

  void _finishSpeaking() {
    _stopLipsyncPoll();
    if (!mounted) return;
    setState(() {
      _speaking = false;
      _lipsyncViseme = null;
      _visemeTrack = const [];
      _speechEndSec = null;
      _currentViseme = 0;
      _lastVisemeAppliedAt = null;
    });
  }

  void _startLipsyncPoll() {
    _lipsyncPollTimer?.cancel();
    _lipsyncPollTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_speaking || !mounted) {
        _stopLipsyncPoll();
        return;
      }
      unawaited(_pollLipsyncTick());
    });
  }

  Future<void> _pollLipsyncTick() async {
    if (!_speaking || !mounted) return;

    Duration? pos;
    try {
      pos = await _player.getCurrentPosition();
    } catch (_) {
      return;
    }
    final t = (pos?.inMilliseconds ?? 0) / 1000.0;

    final lipEnd = _speechEndSec;
    if (lipEnd != null && lipEnd > 0 && t >= lipEnd) {
      _finishSpeaking();
      return;
    }

    if (_visemeTrack.isEmpty) return;

    final next = visemeAt(
      _visemeTrack,
      t,
      cutOffSec: lipEnd,
      latencySec: kVisemeLatencySec,
    );
    if (next == _currentViseme) return;

    final rate = _playbackRate <= 0 ? 1.0 : _playbackRate;
    final gapMs = (kMinVisemeGapMs / rate).round().clamp(40, kMinVisemeGapMs);
    final now = DateTime.now();
    final last = _lastVisemeAppliedAt;
    if (next != 0 &&
        last != null &&
        now.difference(last).inMilliseconds < gapMs) {
      return;
    }

    _currentViseme = next;
    _lastVisemeAppliedAt = now;
    setState(() => _lipsyncViseme = next);
  }

  Future<void> _speakPreview() async {
    if (_speaking) {
      await _player.stop();
      _finishSpeaking();
      return;
    }

    try {
      final speech = await _tts.synthesizeForLipsync(
        _previewLine,
        voiceId: _previewVoiceId,
        tutorSlug: widget.tutor.slug,
        modelId: TutorTtsService.flashModel,
      );
      if (!mounted) return;

      _visemeTrack = coalesceVisemes(speech.visemes);
      _speechEndSec = effectiveSpeechEndSec(visemes: _visemeTrack);
      _currentViseme = 0;
      _lastVisemeAppliedAt = null;

      await _player.setPlaybackRate(_playbackRate);
      await _player.play(DeviceFileSource(speech.file.path));
      if (!mounted) return;

      // Dudaklar ses başladıktan sonra — TTS beklerken animasyon yok.
      setState(() {
        _speaking = true;
        _lipsyncViseme = 0;
      });
      _startLipsyncPoll();
    } catch (_) {
      if (!mounted) return;
      _finishSpeaking();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppText.current.common.genericError)),
      );
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
    final topInset = widget.topInset;
    final chatLabel = text.startChat as String;
    return SizedBox(
      height: topInset + 280,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _TutorHeroBackdrop(),
          if (widget.leading != null)
            Positioned(
              left: 8,
              top: topInset + 4,
              child: widget.leading!,
            ),
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
                  child: SizedBox(
                    width: 240,
                    height: 260,
                    child: TutorRiveAvatar(
                      key: ValueKey(tutor.identity),
                      assetPath: tutor.heroRiveUrl,
                      talking: _speaking,
                      lipsyncViseme: _speaking ? _lipsyncViseme : null,
                      fallbackImage: tutor.image,
                      fallbackRivePath: AppAssets.tutorLingolaRivCdn,
                      loadingBackgroundColor: Colors.transparent,
                      anchorBottom: true,
                      fit: rive.Fit.contain,
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
                if (widget.showChatAction)
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
                                AppAssets.chatActionMessage,
                                width: 21,
                                height: 21,
                                color: Colors.white,
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
          const ColoredBox(color: Color(0xFF2D46FF)),
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
