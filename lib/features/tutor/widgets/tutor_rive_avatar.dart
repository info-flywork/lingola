import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/cdn/cdn_file_cache.dart';

/// Mindcoach ile aynı model: `talk` + `visemeNum` + `duration`.
/// Sadece talk yetmez; bu riv ağız şeklini viseme ile sürüyor.
class TutorRiveAvatar extends StatefulWidget {
  const TutorRiveAvatar({
    required this.assetPath,
    required this.talking,
    this.fallbackImage,
    this.fit = Fit.contain,
    this.alignment = Alignment.bottomCenter,
    /// Ses zamanına hizalı viseme (null → yavaş fake cycle).
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
  /// Riv yüklenirken arka plan (özel karakter teması).
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
  var _failed = false;
  var _resolving = true;
  var _loadGen = 0;
  var _visemePhase = 0;

  static const _visemeCycle = <double>[0, 6, 14, 6, 10, 2];
  static const _openBlendMs = 80.0;
  static const _visemeBlendMs = 55.0;

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
      _syncTalk(widget.talking);
    } else if (widget.talking &&
        widget.lipsyncViseme != null &&
        oldWidget.lipsyncViseme != widget.lipsyncViseme) {
      _applyLipsyncViseme(widget.lipsyncViseme!);
    } else if (!widget.talking &&
        oldWidget.lipsyncViseme != null &&
        (widget.lipsyncViseme ?? 0) == 0) {
      _forceMouthClosed();
    }
  }

  @override
  void dispose() {
    _loadGen++;
    _visemeTimer?.cancel();
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
      final localPath = await CdnFileCache.resolve(source, kind: 'rive');
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

    // 1) DataBind ViewModel (Mindcoach primary path)
    try {
      _viewModel = controller.dataBind(DataBind.auto());
      debugPrint(
        'Rive ViewModel bağlandı, props=${_viewModel?.properties.length}',
      );
    } catch (e) {
      _viewModel = null;
      debugPrint('Rive ViewModel yok: $e');
    }

    // 2) StateMachine inputs (fallback) — isimleri listele, case-insensitive bul
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
      // API ile bir kez daha dene
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

    _syncTalk(widget.talking);
  }

  void _onFailed(Object error, StackTrace stack) {
    debugPrint('Rive yükleme hatası (${widget.assetPath}): $error');
    if (mounted) setState(() => _failed = true);
  }

  void _syncTalk(bool talking) {
    if (talking) {
      _setBool('talk', true);
      _setNumber('duration', _openBlendMs);
      if (widget.lipsyncViseme != null) {
        _visemeTimer?.cancel();
        _visemeTimer = null;
        _applyLipsyncViseme(widget.lipsyncViseme!);
      } else {
        _startVisemeLoop();
      }
    } else {
      _forceMouthClosed();
    }
  }

  void _forceMouthClosed() {
    _visemeTimer?.cancel();
    _visemeTimer = null;
    _setNumber('visemeNum', 0);
    _setNumber('duration', 0);
    _setBool('talk', false);
  }

  void _applyLipsyncViseme(double id) {
    _setNumber('visemeNum', id);
    _setNumber('duration', _visemeBlendMs);
  }

  void _startVisemeLoop() {
    _visemeTimer?.cancel();
    _visemePhase = 0;
    // Fallback (timestamp yok): yavaş cycle — önceki 90ms çok hızlıydı.
    _visemeTimer = Timer.periodic(const Duration(milliseconds: 160), (_) {
      if (!widget.talking || widget.lipsyncViseme != null) return;
      final id = _visemeCycle[_visemePhase % _visemeCycle.length];
      _visemePhase++;
      _applyLipsyncViseme(id);
    });
  }

  void _setBool(String key, bool value) {
    var applied = false;
    final vm = _viewModel;
    if (vm != null) {
      try {
        final b = vm.boolean(key);
        if (b != null) {
          b.value = value;
          applied = true;
        }
      } catch (_) {}
      try {
        for (final prop in vm.properties) {
          if (prop.name == key) {
            (prop as dynamic).value = value;
            applied = true;
            break;
          }
        }
      } catch (_) {}
    }
    if (key == 'talk') {
      if (_smTalk != null) {
        _smTalk!.value = value;
        applied = true;
      }
    }
    debugPrint('Rive setBool $key=$value applied=$applied');
  }

  void _setNumber(String key, double value) {
    final vm = _viewModel;
    if (vm != null) {
      try {
        final n = vm.number(key);
        if (n != null) {
          n.value = value;
          return;
        }
      } catch (_) {}
      try {
        for (final prop in vm.properties) {
          if (prop.name == key) {
            (prop as dynamic).value = value;
            return;
          }
        }
      } catch (_) {}
    }
    if (key == 'visemeNum') {
      _smViseme?.value = value;
    } else if (key == 'duration') {
      _smDuration?.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_failed) {
      return _Fallback(imagePath: widget.fallbackImage);
    }

    final loader = _fileLoader;
    if (_resolving || loader == null) {
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
          RiveLoading() => ColoredBox(
              color: widget.loadingBackgroundColor ?? const Color(0xFF2D46FF),
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
    if (imagePath == null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }
    return Image.asset(
      imagePath!,
      fit: BoxFit.contain,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
