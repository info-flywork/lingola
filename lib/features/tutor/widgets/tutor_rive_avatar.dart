import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

import '../../../core/rive/rive_native_bootstrap.dart';
import '../../../core/rive/rive_preload_service.dart';
import '../../../widgets/home_asset.dart';

/// Lingola Buddy yükleme modeli + Lingola lipsync:
/// - `ensureLoader` (disk cache → File.url, Factory.rive → Factory.flutter)
/// - Yüklenene kadar blur placeholder; Rive gelince kaybolur
/// - Inputs: `talk` + `visemeNum` + `duration` (ms)
class TutorRiveAvatar extends StatefulWidget {
  const TutorRiveAvatar({
    required this.assetPath,
    required this.talking,
    this.fallbackImage,
    this.fallbackRivePath,
    this.fit = rive.Fit.contain,
    this.alignment = const Alignment(0, 0.15),
    this.scale = 0.92,
    this.lipsyncViseme,
    this.loadingBackgroundColor,
    this.anchorBottom = false,
    super.key,
  });

  /// CDN `.riv` URL (http/https).
  final String assetPath;
  final bool talking;
  final String? fallbackImage;
  /// CDN fail olursa denenecek ikinci CDN URL.
  final String? fallbackRivePath;
  final rive.Fit fit;
  final Alignment alignment;
  /// Rive yüklendiğinde ek küçültme — tam ekranda omuzların kesilmemesi için.
  final double scale;
  final double? lipsyncViseme;
  final Color? loadingBackgroundColor;
  /// Yarım ekran calling: avatar alt kenarı sohbet alanına yapışsın.
  final bool anchorBottom;

  @override
  State<TutorRiveAvatar> createState() => _TutorRiveAvatarState();
}

class _TutorRiveAvatarState extends State<TutorRiveAvatar> {
  rive.FileLoader? _fileLoader;
  rive.ViewModelInstance? _viewModel;
  rive.BooleanInput? _smTalk;
  rive.NumberInput? _smViseme;
  rive.NumberInput? _smDuration;
  Timer? _visemeTimer;
  Timer? _closeLockTimer;
  var _riveReady = false;
  var _riveEverLoaded = false;
  var _riveFailed = false;
  var _recoveryAttempted = false;
  var _loaderKey = 0;
  var _resolveGen = 0;
  String? _activeUrl;
  DateTime? _forceCloseLockedUntil;

  static const _talkOpenBlendMs = 70.0;
  /// Viseme geçiş blend'i — kısa olursa ağız titrer.
  static const _visemeBlendMs = 88.0;
  static const _talkCloseBlendMs = 55.0;
  static const _forceCloseLockoutMs = 220;
  DateTime? _lastVisemePushAt;

  @override
  void initState() {
    super.initState();
    unawaited(_bootstrap());
  }

  Future<void> _bootstrap() async {
    final url = _resolvePrimaryUrl();
    if (url == null) {
      if (mounted) setState(() => _riveFailed = true);
      return;
    }
    await _resolveLoader(url);
  }

  @override
  void didUpdateWidget(covariant TutorRiveAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath ||
        oldWidget.fallbackRivePath != widget.fallbackRivePath) {
      _recoveryAttempted = false;
      _riveReady = false;
      _riveEverLoaded = false;
      _riveFailed = false;
      _fileLoader = null;
      unawaited(_bootstrap());
      return;
    }

    if (oldWidget.talking != widget.talking) {
      if (widget.talking) {
        _forceCloseLockedUntil = null;
        _closeLockTimer?.cancel();
        _syncTalk(true);
      } else {
        _forceMouthClosed(lock: true);
      }
      return;
    }

    final oldV = oldWidget.lipsyncViseme;
    final newV = widget.lipsyncViseme;
    if (!widget.talking) {
      if (oldWidget.talking || (oldV ?? 0) != 0 || (newV ?? 0) != 0) {
        _forceMouthClosed(lock: true);
      }
      return;
    }

    if (_isCloseLocked) {
      _forceCloseLockedUntil = null;
    }

    if (newV != null && oldV != newV) {
      _pushLipsyncViseme(newV);
    } else if (newV == null && oldV != null) {
      _startTalkIdleCycle();
    }
  }

  bool get _isCloseLocked {
    final until = _forceCloseLockedUntil;
    return until != null && DateTime.now().isBefore(until);
  }

  @override
  void dispose() {
    _resolveGen++;
    _visemeTimer?.cancel();
    _closeLockTimer?.cancel();
    _smTalk?.dispose();
    _smViseme?.dispose();
    _smDuration?.dispose();
    // Cache'lenen FileLoader dispose edilmez (Buddy/Mindcoach).
    super.dispose();
  }

  String? _resolvePrimaryUrl() {
    return RivePreloadService.normalizeRiveUrl(widget.assetPath);
  }

  Future<void> _resolveLoader(String url) async {
    final gen = ++_resolveGen;
    _activeUrl = url;
    await RiveNativeBootstrap.ensureInitialized();
    if (mounted) {
      setState(() {
        _fileLoader = null;
        _riveFailed = false;
        _riveReady = false;
        _viewModel = null;
        _smTalk = null;
        _smViseme = null;
        _smDuration = null;
      });
    }

    final loader = await RivePreloadService.ensureLoader(url);
    if (!mounted || gen != _resolveGen) return;

    setState(() {
      _fileLoader = loader;
      _riveFailed = loader == null;
      _loaderKey++;
    });
    debugPrint(
      '[rive] ensureLoader url=$url ok=${loader != null} failed=$_riveFailed',
    );

    if (loader == null && !_recoveryAttempted) {
      unawaited(_recoverAfterFailure());
    }
  }

  Future<void> _recoverAfterFailure() async {
    if (_riveEverLoaded || _recoveryAttempted || !mounted) return;
    _recoveryAttempted = true;

    final current = RivePreloadService.normalizeRiveUrl(_activeUrl);
    if (current != null) {
      RivePreloadService.invalidate(current);
    }

    // Aynı eğitmen için alternatif CDN — başka karaktere (Lingola robot) düşme.
    final alt = RivePreloadService.normalizeRiveUrl(widget.fallbackRivePath);
    if (alt != null && alt != current) {
      debugPrint('[rive] recover → alt CDN $alt');
      final ok = await RivePreloadService.ensurePreloaded(alt);
      if (!mounted) return;
      if (ok) {
        await _resolveLoader(alt);
        return;
      }
    }

    if (!mounted) return;
    debugPrint('[rive] recover failed — PNG fallback');
    setState(() {
      _riveFailed = true;
      _fileLoader = null;
    });
  }

  rive.RiveWidgetController _createController(rive.File file) {
    Object? lastError;
    final attempts = <rive.RiveWidgetController Function()>[
      () => rive.RiveWidgetController(file),
      () => rive.RiveWidgetController(
            file,
            artboardSelector: const rive.ArtboardAtIndex(0),
            stateMachineSelector: const rive.StateMachineAtIndex(0),
          ),
    ];
    for (final create in attempts) {
      try {
        return create();
      } catch (e) {
        lastError = e;
        debugPrint('[rive] controller denemesi başarısız: $e');
      }
    }
    throw lastError ?? StateError('Rive controller oluşturulamadı');
  }

  void _onLoaded(rive.RiveLoaded loaded) {
    final controller = loaded.controller;
    debugPrint('[rive] LOADED $_activeUrl');

    try {
      _viewModel = controller.dataBind(rive.DataBind.auto());
    } catch (e) {
      _viewModel = null;
      debugPrint('[rive] ViewModel yok: $e');
    }

    try {
      final sm = controller.stateMachine;
      // ignore: deprecated_member_use
      final inputs = sm.inputs;
      debugPrint(
        '[rive] SM inputs: ${inputs.map((i) => '${i.name}(${i.runtimeType})').join(', ')}',
      );
      for (final input in inputs) {
        final n = input.name.toLowerCase();
        if (n == 'talk' && input is rive.BooleanInput) {
          _smTalk = input;
        } else if (n == 'visemenum' && input is rive.NumberInput) {
          _smViseme = input;
        } else if (n == 'duration' && input is rive.NumberInput) {
          _smDuration = input;
        }
      }
      // ignore: deprecated_member_use
      _smTalk ??= sm.boolean('talk');
      // ignore: deprecated_member_use
      _smViseme ??= sm.number('visemeNum');
      // ignore: deprecated_member_use
      _smDuration ??= sm.number('duration');
    } catch (e) {
      debugPrint('[rive] SM input hatası: $e');
    }

    if (widget.talking) {
      _syncTalk(true);
    } else {
      _forceMouthClosed(lock: true);
    }

    final wasReady = _riveReady;
    _riveReady = true;
    _riveEverLoaded = true;
    _riveFailed = false;
    if (mounted && !wasReady) setState(() {});
  }

  void _onFailed(Object error, StackTrace stack) {
    debugPrint('[rive] onFailed ($_activeUrl)');
    if (_riveEverLoaded) return;
    unawaited(_recoverAfterFailure());
  }

  void _syncTalk(bool talking) {
    if (talking) {
      _visemeTimer?.cancel();
      _visemeTimer = null;
      _forceCloseLockedUntil = null;
      _closeLockTimer?.cancel();
      _setRiveBool('talk', true);
      _setRiveNumber('duration', _talkOpenBlendMs);
      final v = widget.lipsyncViseme;
      if (v != null) {
        _pushLipsyncViseme(v, force: true);
      } else {
        _startTalkIdleCycle();
      }
    } else {
      _forceMouthClosed(lock: true);
    }
  }

  void _startTalkIdleCycle() {
    _visemeTimer?.cancel();
    // Yavaş idle — gerçek lipsync yokken bile ağız koşmasın.
    const cycle = <double>[6, 10, 14, 6, 2, 10];
    var i = 0;
    _pushLipsyncViseme(cycle[0], force: true);
    _visemeTimer = Timer.periodic(const Duration(milliseconds: 240), (_) {
      if (!mounted || !widget.talking) {
        _visemeTimer?.cancel();
        _visemeTimer = null;
        return;
      }
      if (widget.lipsyncViseme != null) {
        _visemeTimer?.cancel();
        _visemeTimer = null;
        return;
      }
      i = (i + 1) % cycle.length;
      _setRiveBool('talk', true);
      _pushLipsyncViseme(cycle[i], force: true);
    });
  }

  void _forceMouthClosed({required bool lock}) {
    _visemeTimer?.cancel();
    _visemeTimer = null;
    _setRiveNumber('duration', lock ? 0 : _talkCloseBlendMs);
    _setVisemeValues(0);
    _setRiveBool('talk', false);
    if (!lock) return;

    _forceCloseLockedUntil = DateTime.now().add(
      const Duration(milliseconds: _forceCloseLockoutMs),
    );
    _closeLockTimer?.cancel();
    _closeLockTimer = Timer(const Duration(milliseconds: 40), () {
      if (!mounted || widget.talking) return;
      _setRiveNumber('duration', 0);
      _setVisemeValues(0);
      _setRiveBool('talk', false);
    });
    Timer(const Duration(milliseconds: 120), () {
      if (!mounted || widget.talking) return;
      _setRiveNumber('duration', 0);
      _setVisemeValues(0);
      _setRiveBool('talk', false);
    });
  }

  /// Rive'a viseme bas — min aralık + yumuşak blend.
  /// id=0: kelime arası / sessizlik → ağız kapat (lockout YOK, hece gecikmesin).
  void _pushLipsyncViseme(double id, {bool force = false}) {
    final now = DateTime.now();
    final last = _lastVisemePushAt;
    if (!force &&
        id != 0 &&
        last != null &&
        now.difference(last).inMilliseconds < 58) {
      return;
    }
    _lastVisemePushAt = now;

    if (id == 0) {
      _forceCloseLockedUntil = null;
      _closeLockTimer?.cancel();
      _setRiveNumber('duration', _talkCloseBlendMs);
      _setVisemeValues(0);
      _setRiveBool('talk', false);
      return;
    }

    _forceCloseLockedUntil = null;
    _setRiveBool('talk', true);
    _setVisemeValues(id);
    _setRiveNumber('duration', _visemeBlendMs);
  }

  void _setVisemeValues(double id) {
    _setRiveNumber('visemeNum', id);
    _setRiveNumber('viseme', id);
  }

  void _setRiveNumber(String key, double value) {
    final vm = _viewModel;
    if (vm != null) {
      try {
        final n = vm.number(key);
        if (n != null) n.value = value;
      } catch (_) {}
      try {
        final lower = key.toLowerCase();
        for (final prop in vm.properties) {
          if (prop.name.toLowerCase() == lower) {
            (prop as dynamic).value = value;
            break;
          }
        }
      } catch (_) {}
    }
    if (key == 'visemeNum' || key == 'viseme') {
      _smViseme?.value = value;
    } else if (key == 'duration') {
      _smDuration?.value = value;
    }
  }

  void _setRiveBool(String key, bool value) {
    final vm = _viewModel;
    if (vm != null) {
      try {
        final b = vm.boolean(key);
        if (b != null) b.value = value;
      } catch (_) {}
      try {
        final lower = key.toLowerCase();
        for (final prop in vm.properties) {
          if (prop.name.toLowerCase() == lower) {
            (prop as dynamic).value = value;
            break;
          }
        }
      } catch (_) {}
    }
    if (key == 'talk') {
      _smTalk?.value = value;
    }
  }

  rive.Fit get _effectiveFit =>
      widget.anchorBottom ? rive.Fit.cover : widget.fit;

  Alignment get _effectiveAlignment => widget.anchorBottom
      ? Alignment.bottomCenter
      : widget.alignment;

  Widget _buildFallbackPhoto({double opacity = 1}) {
    final image = widget.fallbackImage?.trim() ?? '';
    if (image.isEmpty) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity,
        child: HomeAsset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildFallbackPhotoContained({double opacity = 1}) {
    final image = widget.fallbackImage?.trim() ?? '';
    if (image.isEmpty) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity,
        child: HomeAsset(
          image,
          height: 280,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    final bg = widget.loadingBackgroundColor ?? const Color(0xFF2D46FF);
    if (widget.anchorBottom) {
      return ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: bg),
            _buildFallbackPhoto(opacity: 0.55),
          ],
        ),
      );
    }
    final image = widget.fallbackImage?.trim() ?? '';
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: bg),
          if (image.isNotEmpty)
            Positioned(
              top: -24,
              bottom: -24,
              left: -24,
              right: -24,
              child: Opacity(
                opacity: 0.55,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: HomeAsset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiveAvatar(rive.RiveLoaded loaded) {
    if (!_riveReady) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _onLoaded(loaded);
      });
    }
    final riveWidget = rive.RiveWidget(
      controller: loaded.controller,
      fit: _effectiveFit,
      alignment: _effectiveAlignment,
    );
    if (widget.anchorBottom || widget.scale >= 0.999) return riveWidget;
    return Transform.scale(
      scale: widget.scale,
      alignment: Alignment.center,
      child: riveWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hidePlaceholder = _riveEverLoaded;
    final loader = _fileLoader;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: widget.loadingBackgroundColor ?? const Color(0xFF2D46FF),
          ),
        ),
        if (!_riveFailed && loader != null)
          RepaintBoundary(
            child: KeyedSubtree(
              key: ValueKey('rive-$_loaderKey-$_activeUrl'),
              child: rive.RiveWidgetBuilder(
                fileLoader: loader,
                controller: _createController,
                onLoaded: _onLoaded,
                onFailed: _onFailed,
                builder: (context, state) {
                  return switch (state) {
                    rive.RiveLoading() => const SizedBox.shrink(),
                    rive.RiveFailed() => const SizedBox.shrink(),
                    rive.RiveLoaded loaded => _buildRiveAvatar(loaded),
                  };
                },
              ),
            ),
          ),
        IgnorePointer(
          ignoring: hidePlaceholder,
          child: AnimatedOpacity(
            opacity: hidePlaceholder ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 140),
            curve: Curves.easeOut,
            child: _riveFailed
                ? (widget.anchorBottom
                    ? _buildFallbackPhoto()
                    : _buildFallbackPhotoContained())
                : _buildPlaceholder(),
          ),
        ),
      ],
    );
  }
}
