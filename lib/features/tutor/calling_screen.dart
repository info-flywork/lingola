import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/config/app_env.dart';
import '../../core/rive/rive_preload_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/chat_word_chip.dart';
import '../../widgets/chat_session_action_bar.dart';
import '../../widgets/home_asset.dart';
import '../lesson/lesson_api_service.dart';
import '../lesson/lesson_badge.dart';
import '../lesson/lesson_session_result.dart';
import 'services/calling_conversation_controller.dart';
import 'services/tutor_tts_service.dart';
import 'tutor_scene_theme.dart';
import 'widgets/tutor_rive_avatar.dart';

/// Start Talk Now → sesli görüşme (Figma calling) ekranı.
class CallingScreen extends StatefulWidget {
  const CallingScreen({
    required this.tutorName,
    required this.imagePath,
    this.riveAsset,
    this.riveCdnUrl,
    this.voiceId,
    this.backgroundGradientStart,
    this.backgroundGradientEnd,
    this.openingLine,
    this.systemPrompt,
    this.returnTranscript = false,
    this.tutorSlug,
    this.lessonBadge,
    this.lessonSlug,
    this.lessonSegmentMode = false,
    this.segmentDuration = const Duration(minutes: 15),
    this.initialElapsed = Duration.zero,
    super.key,
  });

  final String tutorName;
  final String imagePath;
  /// Varsa Rive avatar (dudak senkronu); yoksa [imagePath].
  final String? riveAsset;
  /// Local .riv patlarsa CDN yedek.
  final String? riveCdnUrl;
  /// ElevenLabs voice ID (hoca özel sesi).
  final String? voiceId;
  /// Özel karakter kartı renkleri (Santa / uzaylı / cadı / ork / elf).
  final Color? backgroundGradientStart;
  final Color? backgroundGradientEnd;
  final String? openingLine;
  final String? systemPrompt;
  final bool returnTranscript;
  final String? tutorSlug;
  /// Üstteki "Ders N : …" rozeti; yoksa API'den yüklenir.
  final String? lessonBadge;
  /// Rozet için tercih edilen ders slug'ı.
  final String? lessonSlug;

  /// Ders oturumu: ~15 dk sonra uzatma sor / sessizlikte bitir.
  final bool lessonSegmentMode;
  final Duration segmentDuration;
  /// Önceki oturumlardan biriken süre (resume).
  final Duration initialElapsed;

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  late final Stopwatch _watch;
  late final CallingConversationController _conversation;
  Timer? _ticker;
  var _elapsed = Duration.zero;
  var _lessonEnding = false;

  /// Altyazı paneli (göz) — konuşma balonları her zaman görünür.
  var _captionsOn = true;

  /// Mesaj yazma modu (chat ikonu) — boş beyaz ekran yerine composer.
  var _textComposeOn = false;
  final _textController = TextEditingController();
  final _textFocus = FocusNode();

  /// İpucu (ampul).
  var _hintsOn = false;
  var _hintLoading = false;
  CallHintSuggestion? _hintSuggestion;

  /// false = yarım ekran (sohbet altta), true = tam ekran calling.
  var _expanded = false;
  String? _lessonBadge;

  DateTime _segmentStartedAt = DateTime.now();
  var _checkpointFired = false;

  @override
  void initState() {
    super.initState();
    final cdn = widget.riveCdnUrl?.trim();
    final slug = widget.tutorSlug?.trim();
    RivePreloadService.preload(
      (cdn != null && cdn.isNotEmpty)
          ? cdn
          : (slug != null && slug.isNotEmpty
              ? AppAssets.tutorRiveCdn(slug)
              : null),
    );
    // Backend pm2 log: bu tutor için CDN .riv gerçekten erişilebilir mi?
    unawaited(_reportCallEnterToBackend());
    _watch = Stopwatch()..start();
    _elapsed = widget.initialElapsed;
    _segmentStartedAt = DateTime.now();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _elapsed = widget.initialElapsed + _watch.elapsed);
      _maybeOfferSegmentCheckpoint();
    });
    _conversation = CallingConversationController(
      voiceId: TutorVoiceIds.resolve(widget.tutorSlug, preferred: widget.voiceId),
      openingLine: widget.openingLine,
      systemPrompt: widget.systemPrompt,
      tutorSlug: widget.tutorSlug,
      lessonMode: widget.lessonSegmentMode,
    );
    _lessonBadge = widget.lessonBadge;
    if (_lessonBadge == null) {
      unawaited(_loadLessonBadge());
    }
    debugPrint(
      '[calling] slug=${widget.tutorSlug} voiceId=${_conversation.voiceId}',
    );
    _conversation
      ..addListener(_onConvo)
      ..onRequestEndLesson = () {
        if (widget.lessonSegmentMode) {
          unawaited(_endLessonAndPop());
        } else {
          _popSession(finish: false);
        }
      }
      ..onSegmentContinued = _resetSegmentClock;
    unawaited(_conversation.start());
  }

  /// Backend'e "görüntülü konuşmaya girdim" bildir — CDN .riv probe loglanır.
  Future<void> _reportCallEnterToBackend() async {
    final slug = widget.tutorSlug?.trim();
    if (slug == null || slug.isEmpty) {
      debugPrint('[call-enter] skip: tutorSlug yok');
      return;
    }
    final cdn = widget.riveCdnUrl?.trim();
    final q = (cdn != null && cdn.isNotEmpty)
        ? '?riveUrl=${Uri.encodeComponent(cdn)}'
        : '';
    try {
      final json = await ApiClient.get('/tutors/$slug/call-enter$q');
      final rive = json['rive'];
      final ok = json['ok'] == true;
      debugPrint(
        '[call-enter] slug=$slug ok=$ok'
        ' reachable=${rive is Map ? rive['reachable'] : '-'}'
        ' magic=${rive is Map ? rive['magic'] : '-'}'
        ' url=${rive is Map ? rive['url'] : '-'}',
      );
    } catch (e) {
      debugPrint('[call-enter] backend probe fail: $e');
    }
  }

  void _resetSegmentClock() {
    _segmentStartedAt = DateTime.now();
    _checkpointFired = false;
  }

  void _maybeOfferSegmentCheckpoint() {
    if (!widget.lessonSegmentMode || _checkpointFired) return;
    final spent = DateTime.now().difference(_segmentStartedAt);
    if (spent < widget.segmentDuration) return;
    if (_conversation.listening || _conversation.busy || _conversation.speaking) {
      return;
    }
    _checkpointFired = true;
    unawaited(_conversation.offerFifteenMinuteCheckpoint());
  }

  int get _sessionElapsedSeconds =>
      (widget.initialElapsed + _watch.elapsed).inSeconds;

  void _popSession({required bool finish}) {
    if (!mounted) return;
    if (widget.lessonSegmentMode && widget.returnTranscript) {
      Navigator.of(context).pop(
        LessonSessionResult(
          finish: finish,
          elapsedSeconds: _sessionElapsedSeconds,
          callMessages: List<CallMessage>.of(_conversation.messages),
        ),
      );
      return;
    }
    Navigator.of(context).pop(
      widget.returnTranscript ? _conversation.messages : null,
    );
  }

  Future<void> _endLessonAndPop() async {
    if (_lessonEnding || !mounted) return;
    if (widget.lessonSegmentMode) {
      _lessonEnding = true;
      while (_conversation.speaking && mounted) {
        await Future<void>.delayed(const Duration(milliseconds: 80));
      }
      if (!mounted) return;
      _popSession(finish: true);
      return;
    }
    while (_conversation.speaking && mounted) {
      await Future<void>.delayed(const Duration(milliseconds: 80));
    }
    if (!mounted) return;
    _popSession(finish: false);
  }

  void _onConvo() {
    if (mounted) setState(() {});
  }

  String get _displayLessonBadge =>
      _lessonBadge ?? LessonBadge.fallback();

  Future<void> _loadLessonBadge() async {
    try {
      final path = await LessonApiService.fetchPath();
      final slug = widget.lessonSlug?.trim();
      final badge = LessonBadge.fromPath(
        path,
        preferSlug: (slug != null && slug.isNotEmpty) ? slug : null,
      );
      if (!mounted) return;
      setState(() => _lessonBadge = badge);
    } catch (_) {
      if (!mounted) return;
      setState(() => _lessonBadge = LessonBadge.fallback());
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _textController.dispose();
    _textFocus.dispose();
    _conversation
      ..removeListener(_onConvo)
      ..dispose();
    super.dispose();
  }

  Future<void> _submitTypedMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    _textController.clear();
    // Klavye/composer açık kalsın — arka arkaya mesaj yazılabilsin.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _textComposeOn) _textFocus.requestFocus();
    });
    await _conversation.sendTypedMessage(text);
  }

  void _toggleTextCompose() {
    setState(() {
      _textComposeOn = !_textComposeOn;
      if (_textComposeOn) {
        _captionsOn = true;
        _hintsOn = false;
      }
    });
    if (_textComposeOn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _textFocus.requestFocus();
      });
    } else {
      _textFocus.unfocus();
    }
  }

  String get _timerLabel {
    final h = _elapsed.inHours.toString().padLeft(2, '0');
    final m = (_elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final s = (_elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  /// Kart teması varsa o renkler; yoksa slug fallback / Figma default.
  Color? get _sceneStart => TutorSceneTheme.resolveStart(
        start: widget.backgroundGradientStart,
        slug: widget.tutorSlug,
      );

  Color? get _sceneEnd => TutorSceneTheme.resolveEnd(
        end: widget.backgroundGradientEnd,
        slug: widget.tutorSlug,
      );

  Color get _topScrimColor =>
      _sceneStart ?? const Color(0xFF2D46FF);

  bool get _useOnboardingHeroBg =>
      !TutorSceneTheme.isThemedSlug(widget.tutorSlug);

  Widget _buildCompactHeroBackdrop() {
    if (_useOnboardingHeroBg) {
      return const OnboardingHeroBackdrop();
    }
    return TutorSceneBackdrop(
      gradientStart: _sceneStart,
      gradientEnd: _sceneEnd,
      fadeToWhite: true,
    );
  }

  void _toggleExpanded() {
    setState(() => _expanded = !_expanded);
  }

  void _close() {
    _popSession(finish: false);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _expanded ? Colors.black : Colors.white,
      ),
      child: PopScope(
        canPop: !widget.returnTranscript,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop || !widget.returnTranscript) return;
          _popSession(finish: false);
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 280),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: _expanded
              ? KeyedSubtree(
                  key: const ValueKey('calling-expanded'),
                  child: _buildExpanded(context),
                )
              : KeyedSubtree(
                  key: const ValueKey('calling-compact'),
                  child: _buildCompact(context),
                ),
        ),
      ),
    );
  }

  Widget _buildTopBar({required bool onDark}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
      child: Row(
        children: [
          _GlassCircleButton(
            onTap: _toggleExpanded,
            child: const HomeAsset(
              AppAssets.callingResize,
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(width: 8),
          _GlassPill(
            child: Text(
              widget.tutorName,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          // Kırmızı kayıt pill’i: tıklayınca hız 0.5 → 1 → 1.5 → 2
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () => unawaited(_conversation.cyclePlaybackRate()),
              child: _GlassPill(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF3B30),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _conversation.playbackRateLabel,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _timerLabel,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _GlassCircleButton(
            onTap: _close,
            child: const Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeedChip() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () => unawaited(_conversation.cyclePlaybackRate()),
        child: _GlassPill(
          child: Text(
            _conversation.playbackRateLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar({
    required EdgeInsets padding,
    Alignment alignment = Alignment.bottomCenter,
    bool anchorBottom = false,
  }) {
    // DB `tutors.rive_cdn_url` → CDN only (Mindcoach gibi). Yerel .riv yok.
    final cdnRaw = widget.riveCdnUrl?.trim();
    final slug = widget.tutorSlug?.trim();
    final primary = (cdnRaw != null && cdnRaw.isNotEmpty)
        ? cdnRaw
        : (slug != null && slug.isNotEmpty
            ? AppAssets.tutorRiveCdn(slug)
            : AppAssets.tutorLingolaRivCdn);
    final rivFallback = primary == AppAssets.tutorLingolaRivCdn
        ? null
        : AppAssets.tutorLingolaRivCdn;

    return Padding(
      padding: padding,
      child: TutorRiveAvatar(
        assetPath: primary,
        talking: _conversation.avatarTalking,
        fallbackImage: widget.imagePath,
        fallbackRivePath: rivFallback,
        lipsyncViseme: _conversation.avatarTalking
            ? (_conversation.hasLipsyncTrack
                ? _conversation.currentViseme
                : null)
            : null,
        loadingBackgroundColor: Colors.transparent,
        anchorBottom: anchorBottom,
      ),
    );
  }

  Widget _buildSessionActionBar({required bool darkChrome}) {
    if (darkChrome) {
      return _buildMicRow(darkChrome: true);
    }
    final listening = _conversation.listening;
    final busy = _conversation.busy;
    return ChatSessionActionBar(
      listening: listening,
      busy: busy,
      messageActive: _textComposeOn,
      hintActive: _hintsOn,
      hintLoading: _hintLoading,
      onMessage: _toggleTextCompose,
      onHint: () => unawaited(_toggleHint()),
      onMicPointerDown: (_) => unawaited(_conversation.startListening()),
      onMicPointerUp: (_) => unawaited(_conversation.stopListening()),
      onPointerCancel: (_) => unawaited(_conversation.stopListening()),
    );
  }

  Widget _buildTextComposeField() {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 16, right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.black.withValues(alpha: .05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _textFocus,
              autofocus: true,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => unawaited(_submitTypedMessage()),
              decoration: InputDecoration(
                hintText: AppText.current.tutorPage.typeMessage,
                border: InputBorder.none,
                isDense: true,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  height: 18 / 14,
                  color: AppColors.secondary,
                ),
              ),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 18 / 14,
                color: AppColors.ink,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => unawaited(_submitTypedMessage()),
              child: const HomeAsset(
                AppAssets.send,
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMicRow({required bool darkChrome}) {
    final listening = _conversation.listening;
    final busy = _conversation.busy;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ControlCircle(
          size: 56,
          light: !darkChrome,
          onTap: () {
            if (darkChrome) {
              setState(() => _captionsOn = !_captionsOn);
            } else {
              _toggleTextCompose();
            }
          },
          child: darkChrome
              ? HomeAsset(
                  _captionsOn
                      ? AppAssets.callingEye
                      : AppAssets.callingClosedEye,
                  width: 24,
                  height: 24,
                )
              : Icon(
                  _textComposeOn
                      ? Icons.keyboard_hide_rounded
                      : Icons.chat_bubble_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
        ),
        const SizedBox(width: 28),
        _MicButton(
          active: listening || !busy,
          listening: listening,
          busy: busy,
          onPressStart: () => unawaited(_conversation.startListening()),
          onPressEnd: () => unawaited(_conversation.stopListening()),
        ),
        const SizedBox(width: 28),
        _ControlCircle(
          size: 56,
          light: !darkChrome,
          onTap: () => unawaited(_toggleHint()),
          child: _hintLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: darkChrome ? Colors.white : AppColors.primary,
                  ),
                )
              : HomeAsset(
                  _hintsOn ? AppAssets.lightbulb : AppAssets.hint,
                  width: 22,
                  height: 22,
                  color: darkChrome ? Colors.white : AppColors.primary,
                ),
        ),
      ],
    );
  }

  Future<void> _toggleHint() async {
    if (_hintLoading) return;
    if (_hintsOn) {
      setState(() {
        _hintsOn = false;
        _hintSuggestion = null;
      });
      return;
    }

    setState(() {
      _hintsOn = true;
      _hintLoading = true;
      _hintSuggestion = null;
      _textComposeOn = false;
    });

    try {
      final hint = await _conversation.suggestHint(
        lessonLabel: _displayLessonBadge,
      );
      if (!mounted) return;
      if (hint == null) {
        setState(() {
          _hintsOn = false;
          _hintLoading = false;
        });
        return;
      }
      setState(() {
        _hintSuggestion = hint;
        _hintLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _hintsOn = false;
        _hintLoading = false;
        _hintSuggestion = null;
      });
    }
  }

  Widget? _buildHintCard({required bool onDark}) {
    final hint = _hintSuggestion;
    if (!_hintsOn || hint == null) return null;

    final bg = onDark ? Colors.white.withValues(alpha: 0.94) : Colors.white;
    final titleColor = onDark ? const Color(0xFF1A2A4A) : AppColors.ink;
    final muted = onDark
        ? const Color(0xFF1A2A4A).withValues(alpha: 0.65)
        : AppColors.secondary;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.lightbulb_rounded, color: AppColors.primary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hocanın son cümlesine göre şöyle diyebilirsin:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: muted,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    hint.turkish,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hint.english,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: muted,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              onPressed: () {
                setState(() {
                  _hintsOn = false;
                  _hintSuggestion = null;
                });
              },
              icon: Icon(Icons.close_rounded, size: 18, color: muted),
            ),
          ],
        ),
      ),
    );
  }

  /// Yarım ekran: üstte Rive hoca, altta sohbet + mikrofon.
  Widget _buildCompact(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    const heroHeight = 400.0;
    final listening = _conversation.listening;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: topInset + heroHeight,
                  child: _buildCompactHeroBackdrop(),
                ),
                SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      _buildTopBar(onDark: true),
                      SizedBox(
                        height: heroHeight - 48,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 300,
                                width: double.infinity,
                                child: _buildAvatar(
                                  padding: EdgeInsets.zero,
                                  anchorBottom: false,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 16,
                              bottom: 24,
                              child: _GlassPill(
                                child: Text(
                                  _displayLessonBadge,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 24,
                              child: _buildSpeedChip(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ColoredBox(
                          color: Colors.white,
                          child: _captionsOn
                              ? _CompactMessageList(
                                  messages: _conversation.messages,
                                  onTranslateSentence:
                                      _conversation.toggleSentenceTranslation,
                                  onTranslateWord: _conversation.translateText,
                                )
                              : const SizedBox.expand(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_conversation.error != null) ...[
                    Text(
                      _conversation.error!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Color(0xFFB71C1C),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (listening) ...[
                    const Text(
                      'Basılı tut — konuş — bırak',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (_buildHintCard(onDark: false) case final hint?) ...[
                    hint,
                    const SizedBox(height: 10),
                  ],
                  if (_textComposeOn) _buildTextComposeField(),
                  _buildSessionActionBar(darkChrome: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Tam ekran calling (eski layout).
  Widget _buildExpanded(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final listening = _conversation.listening;

    return Scaffold(
      backgroundColor: _sceneStart ?? const Color(0xFF1A2A4A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TutorSceneBackdrop(
            gradientStart: _sceneStart,
            gradientEnd: _sceneEnd,
          ),
          Positioned.fill(
            child: _buildAvatar(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 40),
              alignment: const Alignment(0, -0.05),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 160,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _topScrimColor.withValues(alpha: 0.55),
                    _topScrimColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 320,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x99000000),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topCenter,
              child: _buildTopBar(onDark: true),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: bottom + 28,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_captionsOn) ...[
                  _ScrollingChat(
                    messages: _conversation.messages,
                    onTranslateSentence:
                        _conversation.toggleSentenceTranslation,
                    onTranslateWord: _conversation.translateText,
                  ),
                  const SizedBox(height: 12),
                ],
                if (listening) ...[
                  const Text(
                    'Basılı tut — konuş — bırak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                if (_conversation.error != null) ...[
                  Text(
                    _conversation.error!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: .75),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                _GlassPill(
                  child: Text(
                    _displayLessonBadge,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSpeedChip(),
                if (_buildHintCard(onDark: true) case final hint?) ...[
                  const SizedBox(height: 12),
                  hint,
                ],
                const SizedBox(height: 18),
                _buildSessionActionBar(darkChrome: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Yarım ekranda beyaz zemin için sohbet listesi.
class _CompactMessageList extends StatelessWidget {
  const _CompactMessageList({
    required this.messages,
    required this.onTranslateSentence,
    required this.onTranslateWord,
  });

  final List<CallMessage> messages;
  final Future<void> Function(int messageIndex) onTranslateSentence;
  final Future<String> Function(String word) onTranslateWord;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemCount: messages.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final msg = messages[index];
        return _CallingMessageBubble(
          message: msg,
          onTranslateSentence: () => onTranslateSentence(index),
          onTranslateWord: onTranslateWord,
        );
      },
    );
  }
}

/// Figma: kayan mesaj balonları (mavi %30 / beyaz %40) + kelime/cümle çeviri.
class _ScrollingChat extends StatelessWidget {
  const _ScrollingChat({
    required this.messages,
    required this.onTranslateSentence,
    required this.onTranslateWord,
  });

  final List<CallMessage> messages;
  final Future<void> Function(int messageIndex) onTranslateSentence;
  final Future<String> Function(String word) onTranslateWord;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const SizedBox(height: 120);
    }

    return SizedBox(
      height: 200,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.white,
            ],
            stops: [0, 0.18, 1],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: ListView.builder(
          reverse: true,
          padding: EdgeInsets.zero,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            // reverse: index 0 = en yeni
            final messageIndex = messages.length - 1 - index;
            final msg = messages[messageIndex];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _CallingMessageBubble(
                message: msg,
                onTranslateSentence: () => onTranslateSentence(messageIndex),
                onTranslateWord: onTranslateWord,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CallingMessageBubble extends StatefulWidget {
  const _CallingMessageBubble({
    required this.message,
    required this.onTranslateSentence,
    required this.onTranslateWord,
  });

  final CallMessage message;
  final Future<void> Function() onTranslateSentence;
  final Future<String> Function(String word) onTranslateWord;

  @override
  State<_CallingMessageBubble> createState() => _CallingMessageBubbleState();
}

class _CallingMessageBubbleState extends State<_CallingMessageBubble> {
  String? _selectedWord;
  String? _wordTranslation;
  var _wordBusy = false;
  var _sentenceBusy = false;
  final List<TapGestureRecognizer> _recognizers = [];
  final _tts = TutorTtsService();
  final _player = AudioPlayer();

  @override
  void didUpdateWidget(covariant _CallingMessageBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.text != widget.message.text) {
      _clearWordSelection();
    }
  }

  @override
  void dispose() {
    for (final r in _recognizers) {
      r.dispose();
    }
    unawaited(_player.dispose());
    _tts.dispose();
    super.dispose();
  }

  void _clearWordSelection() {
    _selectedWord = null;
    _wordTranslation = null;
    _wordBusy = false;
  }

  String _withPunctuation(String original, String translated) {
    final prefix = RegExp(r"^[^\w']+").firstMatch(original)?.group(0) ?? '';
    final suffix = RegExp(r"[^\w']+$").firstMatch(original)?.group(0) ?? '';
    return '$prefix$translated$suffix';
  }

  Future<void> _onWordTap(String raw) async {
    final word = raw.replaceAll(RegExp(r"[^\w'\-]+"), '');
    if (word.isEmpty) return;

    if (_selectedWord == word && _wordTranslation != null) {
      setState(_clearWordSelection);
      return;
    }

    setState(() {
      _selectedWord = word;
      _wordTranslation = null;
      _wordBusy = true;
    });

    try {
      final tr = await widget.onTranslateWord(word);
      if (!mounted || _selectedWord != word) return;
      setState(() {
        _wordTranslation = tr.isEmpty ? '—' : tr;
        _wordBusy = false;
      });
    } catch (_) {
      if (!mounted || _selectedWord != word) return;
      setState(() {
        _wordTranslation = 'Çeviri alınamadı';
        _wordBusy = false;
      });
    }
  }

  Future<void> _onSentenceTap() async {
    setState(() => _sentenceBusy = true);
    try {
      await widget.onTranslateSentence();
    } finally {
      if (mounted) setState(() => _sentenceBusy = false);
    }
  }

  Future<void> _onSpeak() async {
    final source = (_selectedWord != null && _selectedWord!.isNotEmpty)
        ? _selectedWord!
        : widget.message.text.trim();
    if (source.isEmpty) return;
    try {
      final file = await _tts.synthesizeToFile(source);
      await _player.stop();
      await _player.play(DeviceFileSource(file.path));
    } catch (_) {}
  }

  List<InlineSpan> _buildWordSpans({
    required bool isTutor,
    required Color baseColor,
  }) {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();

    final spans = <InlineSpan>[];
    // Boşlukları ayrı TextSpan yapma — gesture’lı span’lerde Flutter
    // whitespace-only span’leri yutabiliyor (birleşik yazı).
    final words = widget.message.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final display = i < words.length - 1 ? '$word ' : word;
      final clean = word.replaceAll(RegExp(r"[^\w'\-]+"), '');

      if (!isTutor || clean.isEmpty) {
        spans.add(TextSpan(text: display, style: TextStyle(color: baseColor)));
        continue;
      }

      final selected =
          _selectedWord != null &&
          _selectedWord!.toLowerCase() == clean.toLowerCase();
      final recognizer = TapGestureRecognizer()
        ..onTap = () => _onWordTap(word);
      _recognizers.add(recognizer);

      var displayText = display;
      if (selected &&
          !_wordBusy &&
          _wordTranslation != null &&
          _wordTranslation != '—' &&
          _wordTranslation != 'Çeviri alınamadı') {
        displayText = _withPunctuation(word, _wordTranslation!);
      }

      if (selected) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: i < words.length - 1 ? 4 : 0),
              child: ChatWordChip(
                label: displayText.trim(),
                fontSize: 13,
                onTap: () => _onWordTap(word),
              ),
            ),
          ),
        );
        continue;
      }

      spans.add(
        TextSpan(
          text: displayText,
          recognizer: recognizer,
          style: TextStyle(
            color: baseColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final isTutor = widget.message.role == CallMessageRole.tutor;

    if (!isTutor) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.78,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            widget.message.text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    final baseColor = AppColors.ink;

    final bubble = Container(
      padding: const EdgeInsets.all(12),
      decoration: chatBubbleDecoration(
        wordSelected: _selectedWord != null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w400,
                color: AppColors.ink,
              ),
              children: _buildWordSpans(isTutor: true, baseColor: baseColor),
            ),
          ),
          if (widget.message.translation != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.message.translation!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                height: 18 / 13,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: AppColors.ink.withValues(alpha: .78),
              ),
            ),
          ],
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.72,
            ),
            child: bubble,
          ),
        ),
        const SizedBox(width: 8),
        _CallingBubbleActions(
          translateBusy: _sentenceBusy,
          onTranslate: _onSentenceTap,
          onSpeak: _onSpeak,
        ),
      ],
    );
  }
}

/// Figma: balon sağında, dikey ortada — çeviri + hoparlör.
class _CallingBubbleActions extends StatelessWidget {
  const _CallingBubbleActions({
    required this.translateBusy,
    required this.onTranslate,
    required this.onSpeak,
  });

  final bool translateBusy;
  final VoidCallback onTranslate;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CallingBubbleActionIcon(
          asset: AppAssets.translate,
          color: AppColors.primary,
          onTap: translateBusy ? null : onTranslate,
          busy: translateBusy,
        ),
        const SizedBox(width: 6),
        _CallingBubbleActionIcon(
          asset: AppAssets.speaker,
          color: AppColors.secondary,
          onTap: onSpeak,
        ),
      ],
    );
  }
}

class _CallingBubbleActionIcon extends StatelessWidget {
  const _CallingBubbleActionIcon({
    required this.asset,
    required this.color,
    required this.onTap,
    this.busy = false,
  });

  final String asset;
  final Color color;
  final VoidCallback? onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: color, width: 1.4)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 34,
          height: 34,
          child: busy
              ? Center(
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: color,
                    ),
                  ),
                )
              : Center(
                  child: HomeAsset(
                    asset,
                    width: 16,
                    height: 16,
                    color: color,
                  ),
                ),
        ),
      ),
    );
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({
    required this.active,
    required this.listening,
    required this.busy,
    required this.onPressStart,
    required this.onPressEnd,
  });

  final bool active;
  final bool listening;
  final bool busy;
  final VoidCallback onPressStart;
  final VoidCallback onPressEnd;

  @override
  Widget build(BuildContext context) {
    final size = listening ? 78.0 : 74.0;
    return Listener(
      onPointerDown: busy
          ? null
          : (_) {
              onPressStart();
            },
      onPointerUp: busy
          ? null
          : (_) {
              onPressEnd();
            },
      onPointerCancel: busy
          ? null
          : (_) {
              onPressEnd();
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: busy
              ? AppColors.primary.withValues(alpha: .55)
              : listening
                  ? const Color(0xFFFF3B30)
                  : AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: (listening ? const Color(0xFFFF3B30) : AppColors.primary)
                  .withValues(alpha: .45),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: busy
            ? const SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : const HomeAsset(
                AppAssets.microphone,
                width: 32,
                height: 32,
                color: Colors.white,
              ),
      ),
    );
  }
}

class _ControlCircle extends StatelessWidget {
  const _ControlCircle({
    required this.size,
    required this.onTap,
    required this.child,
    this.light = false,
  });

  final double size;
  final VoidCallback onTap;
  final Widget child;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: light ? const Color(0xFFE8F1FF) : Colors.black.withValues(alpha: .28),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: light
                ? null
                : Border.all(color: Colors.white.withValues(alpha: .85)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassPill extends StatelessWidget {
  const _GlassPill({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .45),
        borderRadius: BorderRadius.circular(999),
      ),
      child: child,
    );
  }
}

class _GlassCircleButton extends StatelessWidget {
  const _GlassCircleButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: .45),
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
    );
  }
}
