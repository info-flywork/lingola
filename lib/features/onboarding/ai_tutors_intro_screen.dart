import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'onboarding_demo_chat_screen.dart';
import 'onboarding_draft.dart';

/// Söz verme sonrası: AI eğitmen bulutu + demo'ya geçiş.
class AiTutorsIntroScreen extends StatefulWidget {
  const AiTutorsIntroScreen({super.key, required this.draft});

  final OnboardingDraft draft;

  @override
  State<AiTutorsIntroScreen> createState() => _AiTutorsIntroScreenState();
}

class _AiTutorsIntroScreenState extends State<AiTutorsIntroScreen>
    with TickerProviderStateMixin {
  /// Figma (≈393 genişlik) — göreli konum + px boyutlar.
  static const _avatars = <_TutorBubble>[
    // Merkez: Lingola robot (~168)
    _TutorBubble(
      asset: AppAssets.tutorRobot,
      dx: 0.50,
      dy: 0.40,
      size: 168,
      phase: 0.2,
    ),
    // Üst: Felix (krem kazak) — 165×165
    _TutorBubble(
      asset: AppAssets.tutorFelix,
      dx: 0.50,
      dy: 0.10,
      size: 165,
      phase: 1.1,
    ),
    // Sol: Freya (gözlüklü)
    _TutorBubble(
      asset: AppAssets.tutorFreya,
      dx: 0.14,
      dy: 0.30,
      size: 140,
      phase: 2.0,
    ),
    // Sağ üst: Elena
    _TutorBubble(
      asset: AppAssets.tutorElena,
      dx: 0.82,
      dy: 0.24,
      size: 118,
      phase: 0.7,
    ),
    // Sol alt: Morgan (takım) — 175×175
    _TutorBubble(
      asset: AppAssets.tutorMorgan,
      dx: 0.18,
      dy: 0.70,
      size: 175,
      phase: 1.6,
    ),
    // Orta alt: Vaelen (cadı) — 89×89 en küçük
    _TutorBubble(
      asset: AppAssets.tutorVaelen,
      dx: 0.48,
      dy: 0.78,
      size: 89,
      phase: 2.4,
    ),
    // Sağ alt: Amara — ~214, yarısı ekrandan taşar
    _TutorBubble(
      asset: AppAssets.tutorAmara,
      dx: 0.96,
      dy: 0.66,
      size: 214,
      phase: 0.4,
    ),
  ];

  late final AnimationController _enterController;
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat();
  }

  @override
  void dispose() {
    _enterController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  void _continue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => OnboardingDemoChatScreen(draft: widget.draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.setup;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
                      child: Column(
                        children: [
                          // Figma: 378×60 — 2 satır; "seçebilirsin" 3. satıra düşmesin.
                          Text(
                            text.aiTutorsIntroTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              height: 30 / 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            text.aiTutorsIntroBody,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              height: 20 / 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.ink.withValues(alpha: 0.65),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Yatay padding yok — sağdaki büyük avatar yarı ekran dışında kalabilsin.
                    Expanded(
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          _enterController,
                          _floatController,
                        ]),
                        builder: (context, _) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  for (var i = 0; i < _avatars.length; i++)
                                    _buildBubble(
                                      _avatars[i],
                                      i,
                                      constraints.biggest,
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFECECEC), width: 2),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    10,
                    16,
                    10,
                    bottomInset > 0 ? bottomInset + 6 : 30,
                  ),
                  child: PrimaryButton(
                    label: text.aiTutorsIntroCta,
                    onPressed: _continue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBubble(_TutorBubble bubble, int index, Size area) {
    final stagger = (index / _avatars.length).clamp(0.0, 0.85);
    final enterT = Curves.easeOutBack.transform(
      ((_enterController.value - stagger) / (1 - stagger)).clamp(0.0, 1.0),
    );
    final float = math.sin(
          (_floatController.value * 2 * math.pi) + bubble.phase,
        ) *
        6;
    final floatX = math.cos(
          (_floatController.value * 2 * math.pi) + bubble.phase * 0.7,
        ) *
        4;

    // Figma 393 referans; ekrana göre hafif ölçek.
    final scale = (area.width / 393).clamp(0.88, 1.12);
    final size = bubble.size * scale;

    final left = area.width * bubble.dx - size / 2 + floatX * enterT;
    final top = area.height * bubble.dy - size / 2 + float * enterT;

    return Positioned(
      left: left,
      top: top,
      child: Opacity(
        opacity: enterT.clamp(0.0, 1.0),
        child: Transform.scale(
          scale: 0.55 + 0.45 * enterT,
          child: SizedBox(
            width: size,
            height: size,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                bubble.asset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => ColoredBox(
                  color: AppColors.primaryTint10,
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.primary.withValues(alpha: 0.5),
                    size: size * 0.4,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TutorBubble {
  const _TutorBubble({
    required this.asset,
    required this.dx,
    required this.dy,
    required this.size,
    required this.phase,
  });

  final String asset;
  final double dx;
  final double dy;
  final double size;
  final double phase;
}
