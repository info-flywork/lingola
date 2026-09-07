import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/app_assets.dart';
import '../core/theme/app_theme.dart';
import 'home_asset.dart';

/// Onboarding + roleplay: mesaj / mikrofon / ipucu.
///
/// [holdToRecord] true iken Figma hold-to-record:
/// basılı tut → yeşil + dalga, sola çöp, sağa kilit.
/// Kısa bas-bırak kayıt başlatmaz.
class ChatSessionActionBar extends StatefulWidget {
  const ChatSessionActionBar({
    required this.onMessage,
    required this.onHint,
    this.onMicTap,
    this.onMicHoldStart,
    this.onMicHoldSend,
    this.onMicHoldCancel,
    this.onMicLock,
    this.onMicUnlockSend,
    this.onMicUnlockCancel,
    this.holdToRecord = false,
    this.messageActive = false,
    this.hintActive = false,
    this.hintLoading = false,
    this.listening = false,
    this.recordingLocked = false,
    this.busy = false,
    this.micBusy = false,
    this.enableMic = true,
    this.recordingTimer,
    super.key,
  });

  final VoidCallback onMessage;
  final VoidCallback onHint;
  /// Calling vb. — tek dokunuşla aç/kapa.
  final VoidCallback? onMicTap;
  /// Hold-to-record: basılı tutunca kayıt başlar.
  final VoidCallback? onMicHoldStart;
  /// Hold-to-record: ortada bırakınca gönder.
  final VoidCallback? onMicHoldSend;
  /// Hold-to-record: sola kaydırınca iptal.
  final VoidCallback? onMicHoldCancel;
  /// Hold-to-record: sağa kaydırınca kilit (eller serbest).
  final VoidCallback? onMicLock;
  /// Kilitliyken gönder.
  final VoidCallback? onMicUnlockSend;
  /// Kilitliyken iptal.
  final VoidCallback? onMicUnlockCancel;
  final bool holdToRecord;
  final bool messageActive;
  final bool hintActive;
  final bool hintLoading;
  final bool listening;
  final bool recordingLocked;
  final bool busy;
  final bool micBusy;
  final bool enableMic;
  final String? recordingTimer;

  static const micBlue = Color(0xFF2D46FF);
  static const micBlueShadow = Color(0xFF0A1B9A);
  static const micGreen = Color(0xFF3ECA28);
  static const micGreenShadow = Color(0xFF30B21D);
  static const trashBg = Color(0xFFFFDFDF);
  static const lockBg = Color(0xFFB1BAFF);
  static const sideButtonBg = Color(0x332D46FF);

  @override
  State<ChatSessionActionBar> createState() => _ChatSessionActionBarState();
}

class _ChatSessionActionBarState extends State<ChatSessionActionBar>
    with SingleTickerProviderStateMixin {
  /// Sola çöp eşiği (daha kolay).
  static const _cancelThreshold = 40.0;
  /// Sağa kilit eşiği (yanlışlıkla kilitlenmesin).
  static const _lockThreshold = 72.0;
  /// Tek basış kayıt başlatmaz — en az bu kadar basılı tutulmalı.
  static const _holdArm = Duration(milliseconds: 380);
  /// Arm olduktan sonra çok kısa bırakılırsa gönderilmez, iptal edilir.
  static const _minRecord = Duration(milliseconds: 450);
  /// Sola: çöp üstüne kayma (görsel).
  static const _slideIntoTrash = 72.0;
  /// Sağa: ok + kilit üstüne kayma (görsel).
  static const _slideIntoLock = 90.0;
  /// Kilit → gönder geçiş animasyonu.
  static const _lockAnim = Duration(milliseconds: 320);

  late final AnimationController _wave;
  final _dragDx = ValueNotifier<double>(0);
  final _micKey = GlobalKey();

  var _pressing = false;
  var _recordingArmed = false;
  var _lockedBySlide = false;
  var _cancelledBySlide = false;
  var _lockAnimating = false;
  Offset? _pointerStart;
  int? _activePointer;
  Timer? _armTimer;
  DateTime? _armedAt;
  var _lastHot = 0; // -1 cancel, 0 mid, 1 lock

  bool get _useHold =>
      widget.holdToRecord && widget.onMicHoldStart != null;

  bool get _showRecordingUi =>
      _useHold &&
      (widget.listening || widget.recordingLocked || _recordingArmed);

  @override
  void initState() {
    super.initState();
    _wave = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
  }

  @override
  void didUpdateWidget(covariant ChatSessionActionBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final active = widget.listening || widget.recordingLocked;
    if (active && !_wave.isAnimating) {
      _wave.repeat();
    } else if (!active && !_recordingArmed && _wave.isAnimating) {
      _wave.stop();
      _wave.reset();
    }
  }

  @override
  void dispose() {
    _armTimer?.cancel();
    _dragDx.dispose();
    _wave.dispose();
    super.dispose();
  }

  void _cancelArmTimer() {
    _armTimer?.cancel();
    _armTimer = null;
  }

  bool _isOnMic(Offset globalPos) {
    final ctx = _micKey.currentContext;
    if (ctx == null) return false;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return false;
    final local = box.globalToLocal(globalPos);
    // Biraz pad — basması kolay olsun.
    return (Offset.zero & box.size).inflate(12).contains(local);
  }

  void _armRecording() {
    if (!_pressing || _recordingArmed || _lockedBySlide || _cancelledBySlide) {
      return;
    }
    _armedAt = DateTime.now();
    setState(() => _recordingArmed = true);
    _wave.repeat();
    HapticFeedback.mediumImpact();
    widget.onMicHoldStart?.call();
  }

  void _onPointerDown(PointerDownEvent event) {
    if (!_useHold || !widget.enableMic || widget.busy || widget.micBusy) return;
    if (widget.recordingLocked) return;
    if (_pressing) return;
    if (!_isOnMic(event.position)) return;

    _cancelArmTimer();
    _activePointer = event.pointer;
    _dragDx.value = 0;
    _lastHot = 0;
    _armedAt = null;
    setState(() {
      _pressing = true;
      _recordingArmed = false;
      _lockedBySlide = false;
      _cancelledBySlide = false;
      _pointerStart = event.position;
    });
    // Kayıt hemen başlamaz — basılı tutulunca arm olur.
    _armTimer = Timer(_holdArm, _armRecording);
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (!_pressing || _pointerStart == null) return;
    if (_activePointer != null && event.pointer != _activePointer) return;
    if (_lockedBySlide || _cancelledBySlide || _lockAnimating) return;
    if (!_recordingArmed) return;

    final dx = event.position.dx - _pointerStart!.dx;
    _dragDx.value = dx;

    final hot = dx <= -_cancelThreshold
        ? -1
        : dx >= _lockThreshold
            ? 1
            : 0;
    if (hot != _lastHot) {
      _lastHot = hot;
      if (hot != 0) HapticFeedback.selectionClick();
    }
  }

  Future<void> _commitLock() async {
    if (_lockedBySlide || _lockAnimating) return;
    _lockAnimating = true;
    _lockedBySlide = true;
    _cancelArmTimer();
    _activePointer = null;
    _armedAt = null;

    // Mic'i kilit üstüne yumuşak taşı, sonra gönder UI.
    final start = _dragDx.value;
    final swatch = Stopwatch()..start();
    while (swatch.elapsed < _lockAnim) {
      final t = (swatch.elapsedMilliseconds / _lockAnim.inMilliseconds)
          .clamp(0.0, 1.0);
      final eased = Curves.easeOutCubic.transform(t);
      _dragDx.value = start + (_slideIntoLock - start) * eased;
      await Future<void>.delayed(const Duration(milliseconds: 16));
      if (!mounted) return;
    }
    _dragDx.value = _slideIntoLock;

    if (!mounted) return;
    setState(() {
      _pressing = false;
      _recordingArmed = false;
      _pointerStart = null;
      _lockAnimating = false;
    });
    _dragDx.value = 0;
    HapticFeedback.mediumImpact();
    widget.onMicLock?.call();
  }

  void _finishHold({required bool cancelledBySystem}) {
    if (!_pressing) return;
    if (cancelledBySystem) return;
    if (_lockAnimating) return;

    _cancelArmTimer();
    _activePointer = null;

    if (_lockedBySlide || _cancelledBySlide) {
      _dragDx.value = 0;
      setState(() {
        _pressing = false;
        _recordingArmed = false;
        _pointerStart = null;
      });
      return;
    }

    final armed = _recordingArmed;
    final dx = _dragDx.value;
    final armedAt = _armedAt;
    _armedAt = null;

    // Arm olmadan bırakıldı → tek basış, kayıt yok.
    if (!armed) {
      _dragDx.value = 0;
      setState(() {
        _pressing = false;
        _recordingArmed = false;
        _pointerStart = null;
      });
      return;
    }

    // Sola → çöp (parmak bırakınca).
    if (dx <= -_cancelThreshold) {
      _cancelledBySlide = true;
      _dragDx.value = 0;
      setState(() {
        _pressing = false;
        _recordingArmed = false;
        _pointerStart = null;
      });
      HapticFeedback.lightImpact();
      widget.onMicHoldCancel?.call();
      return;
    }

    // Sağa → yumuşak kilit → gönder.
    if (dx >= _lockThreshold) {
      unawaited(_commitLock());
      return;
    }

    _dragDx.value = 0;
    setState(() {
      _pressing = false;
      _recordingArmed = false;
      _pointerStart = null;
    });

    // Çok kısa tutulduysa gönderme — iptal et.
    final held = armedAt == null
        ? Duration.zero
        : DateTime.now().difference(armedAt);
    if (held < _minRecord) {
      HapticFeedback.lightImpact();
      widget.onMicHoldCancel?.call();
      return;
    }

    widget.onMicHoldSend?.call();
  }

  @override
  Widget build(BuildContext context) {
    final locked = widget.recordingLocked && _useHold;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, anim) {
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1).animate(anim),
            child: child,
          ),
        );
      },
      child: locked
          ? KeyedSubtree(
              key: const ValueKey('locked'),
              child: _LockedRecordingBar(
                timer: widget.recordingTimer ?? '00:00',
                enabled: !widget.busy,
                onCancel: widget.onMicUnlockCancel,
                onSend: widget.onMicUnlockSend,
                wave: _wave,
              ),
            )
          : KeyedSubtree(
              key: const ValueKey('hold'),
              child: _buildHoldShell(),
            ),
    );
  }

  Widget _buildHoldShell() {
    final recordingUi = _showRecordingUi;

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _useHold ? _onPointerDown : null,
      onPointerMove: _useHold ? _onPointerMove : null,
      onPointerUp: _useHold
          ? (e) {
              if (_activePointer != null && e.pointer != _activePointer) return;
              _finishHold(cancelledBySystem: false);
            }
          : null,
      onPointerCancel: _useHold
          ? (e) {
              if (_activePointer != null && e.pointer != _activePointer) return;
            }
          : null,
      child: SizedBox(
        height: recordingUi ? 108 : 90,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (recordingUi) _buildRecordingRow() else _buildIdleRow(),
            if (_useHold)
              Center(
                child: SizedBox(
                  key: _micKey,
                  width: 96,
                  height: 96,
                  child: const ColoredBox(color: Color(0x00000000)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ActionCircle(
          size: 44,
          background: widget.messageActive
              ? AppColors.primary.withValues(alpha: .28)
              : ChatSessionActionBar.sideButtonBg,
          onTap: widget.busy ? null : widget.onMessage,
          child: const HomeAsset(
            AppAssets.chatKeyboard,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 20),
        IgnorePointer(
          ignoring: _useHold,
          child: GestureDetector(
            onTap: (!_useHold &&
                    widget.enableMic &&
                    !widget.micBusy &&
                    !widget.busy)
                ? widget.onMicTap
                : null,
            child: _PulsingMic(
              recording: false,
              wave: _wave,
              size: 74,
              enabled: widget.enableMic && !widget.micBusy && !widget.busy,
              showSpinner: widget.micBusy,
            ),
          ),
        ),
        const SizedBox(width: 20),
        _ActionCircle(
          size: 44,
          background: widget.hintActive
              ? AppColors.primary.withValues(alpha: .28)
              : ChatSessionActionBar.sideButtonBg,
          onTap: widget.busy || widget.hintLoading ? null : widget.onHint,
          child: widget.hintLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                )
              : const HomeAsset(
                  AppAssets.chatBulb,
                  width: 24,
                  height: 24,
                ),
        ),
      ],
    );
  }

  Widget _buildRecordingRow() {
    return ValueListenableBuilder<double>(
      valueListenable: _dragDx,
      builder: (context, dx, _) {
        final cancelHot = dx <= -_cancelThreshold * 0.4;
        final lockHot = dx >= _lockThreshold * 0.4;

        // Sola çöp üstüne net kayma; sağa ok+kilit üstüne.
        final visualDx = dx < 0
            ? dx.clamp(-_slideIntoTrash, 0.0)
            : (dx * 0.85).clamp(0.0, _slideIntoLock);
        final trashT = (-visualDx / _slideIntoTrash).clamp(0.0, 1.0);
        final lockT = (visualDx / _slideIntoLock).clamp(0.0, 1.0);
        final micScale = dx < 0
            ? (1.0 - 0.2 * trashT)
            : (1.0 - 0.15 * lockT);

        return SizedBox(
          height: 108,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Tasarım sabit: pill'ler yerinde kalır.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SlidePill(
                    background: ChatSessionActionBar.trashBg,
                    hot: cancelHot,
                    leading: const HomeAsset(
                      AppAssets.chatTrash,
                      width: 24,
                      height: 24,
                    ),
                    trailing: Icon(
                      Icons.chevron_left_rounded,
                      size: 22,
                      color: cancelHot
                          ? const Color(0xFFE53935)
                          : const Color(0xFFFF6B6B),
                    ),
                  ),
                  const SizedBox(width: 115),
                  _SlidePill(
                    background: ChatSessionActionBar.lockBg,
                    hot: lockHot,
                    leading: Icon(
                      Icons.chevron_right_rounded,
                      size: 22,
                      color: lockHot
                          ? ChatSessionActionBar.micBlue
                          : const Color(0xFF5B6CFF),
                    ),
                    trailing: const HomeAsset(
                      AppAssets.chatLock,
                      width: 22,
                      height: 22,
                    ),
                  ),
                ],
              ),
              // Mic kayması belli olsun; pill layout'u bozmasın.
              IgnorePointer(
                child: Transform.translate(
                  offset: Offset(visualDx, 0),
                  child: Transform.scale(
                    scale: micScale,
                    child: _PulsingMic(
                      recording: true,
                      wave: _wave,
                      size: 75,
                      wavePad: (trashT > 0.7 || lockT > 0.7) ? 2 : 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LockedRecordingBar extends StatelessWidget {
  const _LockedRecordingBar({
    required this.timer,
    required this.enabled,
    required this.wave,
    this.onCancel,
    this.onSend,
  });

  final String timer;
  final bool enabled;
  final Animation<double> wave;
  final VoidCallback? onCancel;
  final VoidCallback? onSend;

  @override
  Widget build(BuildContext context) {
    // Sabit yükseklik yok — gölge + dalga taşmasın, overflow olmasın.
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: ChatSessionActionBar.trashBg,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: enabled ? onCancel : null,
              child: const SizedBox(
                width: 52,
                height: 52,
                child: Center(
                  child: HomeAsset(
                    AppAssets.chatTrash,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _PulsingMic(
                recording: true,
                wave: wave,
                size: 68,
                wavePad: 4,
              ),
              Text(
                timer,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                  color: ChatSessionActionBar.micGreen,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Material(
            color: ChatSessionActionBar.micBlue,
            shape: const CircleBorder(),
            elevation: 0,
            shadowColor: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: enabled ? onSend : null,
              child: const SizedBox(
                width: 52,
                height: 52,
                child: Icon(Icons.send_rounded, color: Colors.white, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlidePill extends StatelessWidget {
  const _SlidePill({
    required this.background,
    required this.leading,
    required this.trailing,
    required this.hot,
  });

  final Color background;
  final Widget leading;
  final Widget trailing;
  final bool hot;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: hot ? 1.06 : 1,
      duration: const Duration(milliseconds: 120),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(9999),
          border: hot
              ? Border.all(color: Colors.white.withValues(alpha: .55), width: 1.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: hot ? 0.12 : 0.06),
              blurRadius: hot ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedBox(width: 10),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _PulsingMic extends StatelessWidget {
  const _PulsingMic({
    required this.recording,
    required this.wave,
    required this.size,
    this.enabled = true,
    this.showSpinner = false,
    this.wavePad,
  });

  final bool recording;
  final Animation<double> wave;
  final double size;
  final bool enabled;
  final bool showSpinner;
  /// Eski API — layout'u etkilemez (gölge kaymasın diye yok sayılır).
  final double? wavePad;

  /// Figma: X0 Y4 Blur0 — butona yapışık, asla oynamaz.
  static const _shadowY = 4.0;

  @override
  Widget build(BuildContext context) {
    final fill = !enabled
        ? ChatSessionActionBar.micBlue.withValues(alpha: .45)
        : recording
            ? ChatSessionActionBar.micGreen
            : ChatSessionActionBar.micBlue;
    final shadowColor = recording
        ? ChatSessionActionBar.micGreenShadow
        : ChatSessionActionBar.micBlueShadow;

    // Sabit kutu: dalga/pad gölge konumunu değiştiremez.
    return SizedBox(
      width: size,
      height: size + _shadowY,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          if (recording)
            Positioned(
              left: -14,
              top: -14,
              width: size + 28,
              height: size + 28,
              child: AnimatedBuilder(
                animation: wave,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _MicWavePainter(
                      progress: wave.value,
                      micSize: size,
                      shadowY: 0,
                    ),
                  );
                },
              ),
            ),
          // Gölge + fill tek decoration — birbirinden ayrılmaz.
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: fill,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, _shadowY),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: showSpinner
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : const HomeAsset(
                    AppAssets.chatTalkMic,
                    width: 34,
                    height: 34,
                  ),
          ),
        ],
      ),
    );
  }
}

/// Figma yeşil kayıt: soft pastel konsantrik halkalar.
class _MicWavePainter extends CustomPainter {
  _MicWavePainter({
    required this.progress,
    required this.micSize,
    this.shadowY = 0,
  });

  final double progress;
  final double micSize;
  final double shadowY;

  static const _ringColors = [
    Color(0xFF9BE08A),
    Color(0xFFB6EBA8),
    Color(0xFFD2F5C8),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // Dalga merkezi = mavi/yeşil butonun merkezi (alt gölge hariç).
    final center = Offset(size.width / 2, (size.height - shadowY) / 2);
    final baseR = micSize / 2;

    for (var i = 0; i < 3; i++) {
      final t = (progress + i / 3) % 1.0;
      // Max ~+12px — 20px gap içinde kalsın, yan ikonlara değmesin.
      final radius = baseR + 3 + t * 9;
      final fade = (1.0 - t);
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = _ringColors[i].withValues(alpha: 0.18 + fade * 0.32);
      canvas.drawCircle(center, radius, paint);

      final stroke = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = _ringColors[i].withValues(alpha: 0.12 + fade * 0.28);
      canvas.drawCircle(center, radius, stroke);
    }
  }

  @override
  bool shouldRepaint(covariant _MicWavePainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.micSize != micSize ||
      oldDelegate.shadowY != shadowY;
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


