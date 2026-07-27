import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  /// Local mock list — backend bağlanınca burası API’den gelecek.
  final _words = <(String word, String translation)>[
    ('Boarding Pass', 'Biniş Kartı'),
    ('Where is the gate?', 'Kapı nerede?'),
    ('Passport Control', 'Pasaport Kontrolü'),
    ('Baggage Claim', 'Bagaj Alım'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<(String word, String translation)> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return List.of(_words);
    return _words
        .where(
          (item) =>
              item.$1.toLowerCase().contains(q) ||
              item.$2.toLowerCase().contains(q),
        )
        .toList();
  }

  void _deleteWord(String word) {
    setState(() {
      _words.removeWhere((item) => item.$1 == word);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.libraryPage;
    final items = _filtered;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const HomeAsset(
                        AppAssets.backArrow,
                        width: 24,
                        height: 24,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      text.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: .10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 20,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) => setState(() => _query = value),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            height: 18 / 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: text.searchWord,
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              height: 18 / 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Text(
                  text.savedWordCount(count: _words.length),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _LibraryWordCard(
                      key: ValueKey(item.$1),
                      word: item.$1,
                      translation: item.$2,
                      onDelete: () => _deleteWord(item.$1),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LibraryWordCard extends StatefulWidget {
  const _LibraryWordCard({
    super.key,
    required this.word,
    required this.translation,
    required this.onDelete,
  });

  final String word;
  final String translation;
  final VoidCallback onDelete;

  @override
  State<_LibraryWordCard> createState() => _LibraryWordCardState();
}

class _LibraryWordCardState extends State<_LibraryWordCard>
    with SingleTickerProviderStateMixin {
  /// Figma: 44×44 sil butonu + kartla arası boşluk.
  static const _actionSize = 44.0;
  static const _actionGap = 10.0;
  static const _revealExtent = _actionSize + _actionGap;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
      upperBound: _revealExtent,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _close() {
    _controller.animateTo(0, curve: Curves.easeOutCubic);
  }

  void _open() {
    _controller.animateTo(_revealExtent, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final offset = _controller.value;
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            // Sil butonu — sola kaydırınca görünür
            Positioned(
              right: 0,
              child: Opacity(
                opacity: (offset / _revealExtent).clamp(0.0, 1.0),
                child: _DeleteActionButton(
                  onTap: () {
                    _close();
                    widget.onDelete();
                  },
                ),
              ),
            ),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                final next = (_controller.value - (details.primaryDelta ?? 0))
                    .clamp(0.0, _revealExtent);
                _controller.value = next;
              },
              onHorizontalDragEnd: (details) {
                final vx = details.primaryVelocity ?? 0;
                if (vx < -400) {
                  _open();
                } else if (vx > 400) {
                  _close();
                } else if (_controller.value > _revealExtent / 2) {
                  _open();
                } else {
                  _close();
                }
              },
              onTap: () {
                if (_controller.value > 0) _close();
              },
              child: Transform.translate(
                offset: Offset(-offset, 0),
                child: _WordCardBody(
                  word: widget.word,
                  translation: widget.translation,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Figma: 44×44, radius 8, padding 10, fill #FF0014 @ 20%.
class _DeleteActionButton extends StatelessWidget {
  const _DeleteActionButton({required this.onTap});

  final VoidCallback onTap;

  static const _red = Color(0xFFFF0014);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Delete',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _red.withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/deleteIcon.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WordCardBody extends StatelessWidget {
  const _WordCardBody({
    required this.word,
    required this.translation,
  });

  final String word;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withValues(alpha: .10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            word,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            translation,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
