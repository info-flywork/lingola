import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/cdn/cdn_file_cache.dart';
import '../../../widgets/home_asset.dart';

/// Mindcoach `video_call_realtime_screen` ile aynı model:
/// `talk` + `visemeNum` + `duration` (ms).
///
/// Kritik: `talk=true` iken Rive baked-in ağız idle animasyonu çalışır.
/// Ses bitince mutlaka `talk=false` + `visemeNum=0` (sadece viseme yetmez).
class TutorRiveAvatar extends StatefulWidget {
  const TutorRiveAvatar({
    required this.assetPath,
    required this.talking,
    this.fallbackImage,
    this.fit = Fit.contain,
    this.alignment = Alignment.bottomCenter,
    /// Ses zamanına hizalı viseme (null → fake cycle yok; ağız kapalı kalır).
    this.lipsyncViseme,
    this.loadingBackgroundColor,
    super.key,
  });

  final String assetPath;
  final bool talking;
  final String? fallbackImage;
  final Fit fit;
  final Alignment alignment;
  final double? lipsyncViseme;
  final Color? loadingBackgroundColor;

  @override
  State<TutorRiveAvatar> createState() => _TutorRiveAvatarState();
}

class _TutorRiveAvatarState extends State<TutorRiveAvatar> {
  FileLoader? _fileLoader;
  ViewModelInstance? _viewModel;
  BooleanInput? _smTalk;
  NumberInput? _smViseme;
  NumberInput? _smDuration;
  Timer? _visemeTimer;
  Timer? _closeLockTimer;
  var _failed = false;
  var _resolving = true;
  var _loadGen = 0;
  /// Mindcoach `_forceCloseLockedUntil` — kapanış sonrası kısa süre tekrar açma.
  DateTime? _forceCloseLockedUntil;

  /// Mindcoach sabitleri (ms).
  static const _talkOpenBlendMs = 45.0;
  static const _visemeBlendMs = 38.0;
  static const _talkCloseBlendMs = 40.0;
  static const _forceCloseLockoutMs = 220;

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  void didUpdateWidget(covariant TutorRiveAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _loadFile();
      return;
    }

    if (oldWidget.talking != widget.talking) {
      if (widget.talking) {
        if (_isCloseLocked) return;
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

    if (_isCloseLocked) return;

    if (newV != null && oldV != newV) {
      if (newV == 0) {
        // Kelime arası sessizlik: talk kapat, lockout yok (hemen devam edebilsin).
        _forceMouthClosed(lock: false);
      } else {
        _setRiveBool('talk', true);
        _applyLipsyncViseme(newV);
      }
    }
  }

  bool get _isCloseLocked {
    final until = _forceCloseLockedUntil;
    return until != null && DateTime.now().isBefore(until);
  }

  @override
  void dispose() {
    _loadGen++;
    _visemeTimer?.cancel();
    _closeLockTimer?.cancel();
    _smTalk?.dispose();
    _smViseme?.dispose();
    _smDuration?.dispose();
    _fileLoader?.dispose();
    super.dispose();
  }

  Future<void> _loadFile() async {
    final gen = ++_loadGen;
    final source = widget.assetPath.trim();
    _fileLoader?.dispose();
    _fileLoader = null;
    _viewModel = null;
    _smTalk = null;
    _smViseme = null;
    _smDuration = null;
    _failed = false;
    _resolving = true;
    if (mounted) setState(() {});

    try {
      final loader = await _loaderFor(source);
      if (!mounted || gen != _loadGen) {
        loader.dispose();
        return;
      }
      setState(() {
        _fileLoader = loader;
        _resolving = false;
      });
    } catch (err) {
      if (!mounted || gen != _loadGen) return;
      debugPrint('Rive cache/load hatası ($source): $err');
      setState(() {
        _failed = true;
        _resolving = false;
      });
    }
  }

  Future<FileLoader> _loaderFor(String source) async {
    final isNetwork =
        source.startsWith('http://') || source.startsWith('https://');
    if (!isNetwork) {
      return FileLoader.fromAsset(source, riveFactory: Factory.rive);
    }

    try {
      final localPath = await CdnFileCache.resolve(source, kind: 'rive')
          .timeout(const Duration(seconds: 25));
      final decoded = await File.path(localPath, riveFactory: Factory.rive);
      if (decoded != null) {
        return FileLoader.fromFile(decoded, riveFactory: Factory.rive);
      }
    } catch (err) {
      debugPrint('Rive disk cache miss, CDN fallback: $err');
    }

    return FileLoader.fromUrl(source, riveFactory: Factory.rive);
  }

  RiveWidgetController _createController(File file) {
    Object? lastError;
    final isElrion = widget.assetPath.toLowerCase().contains('elrion');
    final attempts = <RiveWidgetController Function()>[
      () => RiveWidgetController(file),
      () => RiveWidgetController(
            file,
            artboardSelector: const ArtboardAtIndex(0),
            stateMachineSelector: const StateMachineAtIndex(0),
          ),
      if (isElrion)
        () => RiveWidgetController(
              file,
              artboardSelector: ArtboardSelector.byName('Elrion'),
              stateMachineSelector:
                  StateMachineSelector.byName('State Machine 1'),
            ),
    ];
    for (final create in attempts) {
      try {
        return create();
      } catch (e) {
        lastError = e;
        debugPrint('Rive controller denemesi başarısız: $e');
      }
    }
    throw lastError ?? StateError('Rive controller oluşturulamadı');
  }

  void _onLoaded(RiveLoaded loaded) {
    final controller = loaded.controller;

    try {
      _viewModel = controller.dataBind(DataBind.auto());
    } catch (e) {
      _viewModel = null;
      debugPrint('Rive ViewModel yok: $e');
    }

    try {
      final sm = controller.stateMachine;
      // ignore: deprecated_member_use
      final inputs = sm.inputs;
      debugPrint(
        'Rive SM inputs: ${inputs.map((i) => '${i.name}(${i.runtimeType})').join(', ')}',
      );
      for (final input in inputs) {
        final n = input.name.toLowerCase();
        if (n == 'talk' && input is BooleanInput) {
          _smTalk = input;
        } else if (n == 'visemenum' && input is NumberInput) {
          _smViseme = input;
        } else if (n == 'duration' && input is NumberInput) {
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
      debugPrint('Rive SM input okuma hatası: $e');
    }

    debugPrint(
      'Rive bağlar → talkSM=${_smTalk != null} '
      'visemeSM=${_smViseme != null} durationSM=${_smDuration != null} '
      'vm=${_viewModel != null}',
    );

    if (widget.talking) {
      _syncTalk(true);
    } else {
      _forceMouthClosed(lock: true);
    }
  }

  void _onFailed(Object error, StackTrace stack) {
    debugPrint('Rive yükleme hatası (${widget.assetPath}): $error');
    if (mounted) setState(() => _failed = true);
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
        if (v == 0) {
          _forceMouthClosed(lock: false);
        } else {
          _applyLipsyncViseme(v);
        }
      } else {
        _setVisemeValues(0);
      }
    } else {
      _forceMouthClosed(lock: true);
    }
  }

  /// Mindcoach `_forceCloseMouthForSilence`.
  /// [lock] true → cümle bitti; kısa süre tekrar açılmasın.
  void _forceMouthClosed({required bool lock}) {
    _visemeTimer?.cancel();
    _visemeTimer = null;
    // Anında kapat — uzun blend son 1 sn ağız açık bırakıyordu.
    _setRiveNumber('duration', lock ? 0 : _talkCloseBlendMs);
    _setVisemeValues(0);
    _setRiveBool('talk', false);
    if (!lock) return;

    _forceCloseLockedUntil = DateTime.now().add(
      const Duration(milliseconds: _forceCloseLockoutMs),
    );
    _closeLockTimer?.cancel();
    // İkinci ve üçüncü vuruş — Rive idle animasyonu direnmesin.
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

  void _applyLipsyncViseme(double id) {
    _setVisemeValues(id);
    _setRiveNumber('duration', _visemeBlendMs);
  }

  void _setVisemeValues(double id) {
    _setRiveNumber('visemeNum', id);
    _setRiveNumber('viseme', id);
  }

  /// Mindcoach: VM + SM ikisine birden yaz (kapanışta SM kaçmasın).
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

  @override
  Widget build(BuildContext context) {
    if (_failed) {
      return _Fallback(imagePath: widget.fallbackImage);
    }

    final loader = _fileLoader;
    if (_resolving || loader == null) {
      if (widget.fallbackImage != null &&
          widget.fallbackImage!.trim().isNotEmpty) {
        return _Fallback(
          imagePath: widget.fallbackImage,
          alignment: widget.alignment,
        );
      }
      return ColoredBox(
        color: widget.loadingBackgroundColor ?? const Color(0xFF2D46FF),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return RiveWidgetBuilder(
      fileLoader: loader,
      controller: _createController,
      onLoaded: _onLoaded,
      onFailed: _onFailed,
      builder: (context, state) {
        return switch (state) {
          RiveLoading() => widget.fallbackImage != null &&
                  widget.fallbackImage!.trim().isNotEmpty
              ? _Fallback(
                  imagePath: widget.fallbackImage,
                  alignment: widget.alignment,
                )
              : ColoredBox(
                  color: widget.loadingBackgroundColor ??
                      const Color(0xFF2D46FF),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
          RiveFailed() => _Fallback(
                imagePath: widget.fallbackImage,
                alignment: widget.alignment,
              ),
          RiveLoaded(:final controller) => RiveWidget(
              controller: controller,
              fit: widget.fit,
              alignment: widget.alignment,
            ),
        };
      },
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({this.imagePath, this.alignment = Alignment.bottomCenter});

  final String? imagePath;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.trim().isEmpty) {
      return const Center(
        child: Icon(Icons.person_rounded, color: Colors.white54, size: 72),
      );
    }
    return HomeAsset(
      imagePath!,
      fit: BoxFit.contain,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
