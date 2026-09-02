import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import '../core/theme/app_theme.dart';
import 'home_asset.dart';

/// Onboarding + tutor yarım ekran: mesaj / mikrofon / ipucu üçlüsü (Figma).
class ChatSessionActionBar extends StatelessWidget {
  const ChatSessionActionBar({
    required this.onMessage,
    required this.onHint,
    this.onMicTap,
    this.onMicPointerDown,
    this.onMicPointerUp,
    this.onPointerCancel,
    this.messageActive = false,
    this.hintActive = false,
    this.hintLoading = false,
    this.listening = false,
    this.busy = false,
    this.micBusy = false,
    this.enableMic = true,
    super.key,
  });

  final VoidCallback onMessage;
  final VoidCallback onHint;
  final VoidCallback? onMicTap;
  final void Function(PointerDownEvent event)? onMicPointerDown;
  final void Function(PointerUpEvent event)? onMicPointerUp;
  final void Function(PointerCancelEvent event)? onPointerCancel;
  final bool messageActive;
  final bool hintActive;
  final bool hintLoading;
  final bool listening;
  final bool busy;
  /// Yalnızca ses tanıma (STT) sırasında mikrofonda spinner.
  final bool micBusy;
  final bool enableMic;

  static const _centerBg = Color(0xFFF5F6FA);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ActionCircle(
          size: 44,
          background: messageActive
              ? AppColors.primary.withValues(alpha: .28)
              : const Color(0x332D46FF),
          onTap: busy ? null : onMessage,
          child: const HomeAsset(
            AppAssets.chatActionMessage,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 24),
        _MicActionButton(
          listening: listening,
          showSpinner: micBusy,
          enabled: enableMic && !micBusy && !busy,
          onTap: onMicTap,
          onPointerDown: onMicPointerDown,
          onPointerUp: onMicPointerUp,
          onPointerCancel: onPointerCancel,
        ),
        const SizedBox(width: 24),
        _ActionCircle(
          size: 44,
          background: hintActive
              ? AppColors.primary.withValues(alpha: .28)
              : const Color(0x332D46FF),
          onTap: busy || hintLoading ? null : onHint,
          child: hintLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                )
              : HomeAsset(
                  hintActive ? AppAssets.lightbulb : AppAssets.hint,
                  width: 22,
                  height: 22,
                  color: AppColors.primary,
                ),
        ),
      ],
    );
  }
}

class _ActionCircle extends StatelessWidget {
  const _ActionCircle({
    required this.size,
    required this.background,
    required this.onTap,
    required this.child,
  });

  final double size;
  final Color background;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _MicActionButton extends StatelessWidget {
  const _MicActionButton({
    required this.listening,
    required this.showSpinner,
    required this.enabled,
    this.onTap,
    this.onPointerDown,
    this.onPointerUp,
    this.onPointerCancel,
  });

  final bool listening;
  final bool showSpinner;
  final bool enabled;
  final VoidCallback? onTap;
  final void Function(PointerDownEvent event)? onPointerDown;
  final void Function(PointerUpEvent event)? onPointerUp;
  final void Function(PointerCancelEvent event)? onPointerCancel;

  @override
  Widget build(BuildContext context) {
    const size = 67.0;
    final micBody = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: !enabled
            ? ChatSessionActionBar._centerBg.withValues(alpha: .55)
            : showSpinner
                ? ChatSessionActionBar._centerBg.withValues(alpha: .7)
                : listening
                    ? const Color(0xFFFFEBEE)
                    : ChatSessionActionBar._centerBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: listening
              ? const Color(0xFFFF3B30).withValues(alpha: .45)
              : Colors.transparent,
          width: listening ? 2 : 0,
        ),
      ),
      alignment: Alignment.center,
      child: showSpinner
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            )
          : HomeAsset(
              AppAssets.chatActionMic,
              width: 28,
              height: 28,
              color: enabled ? null : AppColors.primary.withValues(alpha: .45),
            ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: enabled ? onTap : null,
        child: micBody,
      );
    }

    return Listener(
      onPointerDown: enabled ? onPointerDown : null,
      onPointerUp: enabled ? onPointerUp : null,
      onPointerCancel: enabled ? onPointerCancel : null,
      child: micBody,
    );
  }
}
