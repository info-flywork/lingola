import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// Mindcoach ile aynı model: `talk` + `visemeNum` + `duration`.
/// Sadece talk yetmez; bu riv ağız şeklini viseme ile sürüyor.
class TutorRiveAvatar extends StatefulWidget {
  const TutorRiveAvatar({
    required this.assetPath,
    required this.talking,
    this.fallbackImage,
    this.fit = Fit.contain,
    this.alignment = Alignment.bottomCenter,
    super.key,
  });

  final String assetPath;
  final bool talking;
  final String? fallbackImage;
  final Fit fit;
  final Alignment alignment;

  @override
  State<TutorRiveAvatar> createState() => _TutorRiveAvatarState();
}

class _TutorRiveAvatarState extends State<TutorRiveAvatar> {
  late final FileLoader _fileLoader;
  ViewModelInstance? _viewModel;
  BooleanInput? _smTalk;
  NumberInput? _smViseme;
  NumberInput? _smDuration;
  Timer? _visemeTimer;
  var _failed = false;
  var _visemePhase = 0;

  static const _visemeCycle = <double>[0, 6, 14, 6, 10, 2];
  static const _openBlendMs = 40.0;
  static const _closeBlendMs = 26.0;
  static const _visemeBlendMs = 24.0;

  @override
  void initState() {
    super.initState();
    _fileLoader = FileLoader.fromAsset(
      widget.assetPath,
      riveFactory: Factory.rive,
    );
  }

  @override
  void didUpdateWidget(covariant TutorRiveAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.talking != widget.talking) {
      _syncTalk(widget.talking);
    }
  }

  @override
  void dispose() {
    _visemeTimer?.cancel();
    _smTalk?.dispose();
    _smViseme?.dispose();
    _smDuration?.dispose();
    _fileLoader.dispose();
    super.dispose();
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
      _startVisemeLoop();
    } else {
      _visemeTimer?.cancel();
      _visemeTimer = null;
      _setNumber('duration', _closeBlendMs);
      _setBool('talk', false);
      _setNumber('visemeNum', 0);
    }
  }

  void _startVisemeLoop() {
    _visemeTimer?.cancel();
    _visemePhase = 0;
    // Ses varken ağız şekillerini döndür (Mindcoach’taki RMS yerine basit cycle).
    _visemeTimer = Timer.periodic(const Duration(milliseconds: 90), (_) {
      if (!widget.talking) return;
      final id = _visemeCycle[_visemePhase % _visemeCycle.length];
      _visemePhase++;
      _setNumber('visemeNum', id);
      _setNumber('duration', _visemeBlendMs);
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

    return RiveWidgetBuilder(
      fileLoader: _fileLoader,
      controller: _createController,
      onLoaded: _onLoaded,
      onFailed: _onFailed,
      builder: (context, state) {
        return switch (state) {
          RiveLoading() => const ColoredBox(
              color: Color(0xFF2D46FF),
              child: Center(
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
      fit: BoxFit.cover,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
