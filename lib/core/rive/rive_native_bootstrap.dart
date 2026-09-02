import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart';

/// Rive native init — main()'i bloklamaz; ilk avatar yüklemesinde beklenir.
abstract final class RiveNativeBootstrap {
  static Future<void>? _initFuture;
  static var _ready = false;

  static bool get isReady => _ready;

  static Future<void> ensureInitialized() {
    if (_ready) return Future<void>.value();
    return _initFuture ??= _init();
  }

  static Future<void> _init() async {
    try {
      await RiveNative.init().timeout(const Duration(seconds: 20));
      _ready = true;
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('[lingola] RiveNative.init failed: $e');
      }
    }
  }
}
