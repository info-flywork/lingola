import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Boş alana dokununca açık klavyeyi kapatır; metin alanına dokunmayı bozmaz.
class KeyboardDismissScope extends StatelessWidget {
  const KeyboardDismissScope({required this.child, super.key});

  final Widget child;

  void _onPointerDown(PointerDownEvent event) {
    final focus = FocusManager.instance.primaryFocus;
    if (focus == null || !focus.hasFocus) return;

    final focusContext = focus.context;
    if (focusContext == null) {
      focus.unfocus();
      return;
    }

    final renderObject = focusContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      focus.unfocus();
      return;
    }

    final rect = renderObject.localToGlobal(Offset.zero) & renderObject.size;
    if (!rect.contains(event.position)) {
      focus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: child,
    );
  }
}
