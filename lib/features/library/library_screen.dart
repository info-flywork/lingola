import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/dictionary/dictionary_service.dart';
import '../../core/practice/practice_service.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';

enum _LibraryTab { saved, dictionary }

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  var _tab = _LibraryTab.saved;
  String _query = '';
  var _loading = true;
  var _loadingMore = false;
  String? _error;

  var _savedCount = 0;
  List<SavedWord> _savedWords = const [];

  var _dictOffset = 0;
  var _dictHasMore = true;
  List<DictionaryWord> _dictWords = const [];

  Timer? _debounce;
  var _dictionaryRequestVersion = 0;
  var _savedRequestVersion = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadSaved();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_tab != _LibraryTab.dictionary) return;
    if (!_dictHasMore || _loadingMore || _loading) return;
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 240) {
      _loadDictionary(append: true);
    }
  }

  void _switchTab(_LibraryTab tab) {
    if (_tab == tab) return;
    if (tab == _LibraryTab.saved) {
      _dictionaryRequestVersion++;
    } else {
      _savedRequestVersion++;
    }
    setState(() {
      _tab = tab;
      _error = null;
    });
    if (tab == _LibraryTab.saved) {
      _loadSaved(query: _query);
    } else {
      _loadDictionary(reset: true);
    }
  }

  void _onSearchChanged(String value) {
    _query = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 280), () {
      if (_tab == _LibraryTab.saved) {
        _loadSaved(query: value);
      } else {
        _loadDictionary(reset: true);
      }
    });
  }

  Future<void> _loadSaved({String? query}) async {
    final requestVersion = ++_savedRequestVersion;
    final requestedQuery = (query ?? _query).trim();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final page = await PracticeService.fetchSavedWords(query: requestedQuery);
      if (!mounted || requestVersion != _savedRequestVersion) return;
      setState(() {
        _savedWords = page.items;
        _savedCount = page.count;
        _loading = false;
      });
    } catch (err) {
      if (!mounted || requestVersion != _savedRequestVersion) return;
      setState(() {
        _error = err.toString();
        _loading = false;
      });
    }
  }

  Future<void> _loadDictionary({bool reset = false, bool append = false}) async {
    final requestVersion = append
        ? _dictionaryRequestVersion
        : ++_dictionaryRequestVersion;
    final requestedQuery = _query.trim();
    if (append) {
      if (_loadingMore || !_dictHasMore) return;
      setState(() => _loadingMore = true);
    } else {
      setState(() {
        _loading = true;
        _error = null;
        if (reset) {
          _dictWords = const [];
          _dictOffset = 0;
          _dictHasMore = true;
        }
      });
    }

    try {
      final page = await DictionaryService.fetchWords(
        limit: 20,
        offset: append ? _dictOffset : 0,
        query: requestedQuery,
      );
      if (!mounted ||
          requestVersion != _dictionaryRequestVersion ||
          requestedQuery != _query.trim()) {
        return;
      }
      setState(() {
        if (append) {
          final existing = _dictWords.map((w) => w.id).toSet();
          final fresh =
              page.items.where((w) => !existing.contains(w.id)).toList();
          _dictWords = [..._dictWords, ...fresh];
        } else {
          _dictWords = page.items;
        }
        _dictOffset = (append ? _dictOffset : 0) + page.items.length;
        _dictHasMore = page.hasMore;
        _loading = false;
        _loadingMore = false;
      });
    } catch (err) {
      if (!mounted || requestVersion != _dictionaryRequestVersion) return;
      setState(() {
        if (!append) _error = err.toString();
        _loading = false;
        _loadingMore = false;
      });
      if (append) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not load more: $err')),
        );
      }
    }
  }

  Future<void> _deleteWord(SavedWord word) async {
    final previous = List<SavedWord>.from(_savedWords);
    final previousCount = _savedCount;
    setState(() {
      _savedWords = _savedWords.where((item) => item.id != word.id).toList();
      _savedCount = (_savedCount - 1).clamp(0, 1 << 30);
    });
    try {
      await PracticeService.unsaveWord(word.id);
    } catch (err) {
      if (!mounted) return;
      setState(() {
        _savedWords = previous;
        _savedCount = previousCount;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not remove: $err')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.libraryPage;
    final isSaved = _tab == _LibraryTab.saved;
    final countLabel = isSaved
        ? text.savedWordCount(count: _savedCount)
        : text.dictionaryLabel;

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
                child: Column(
                  children: [
                    _LibraryTabs(
                      savedLabel: text.savedWordTab,
                      dictionaryLabel: text.dictionaryTab,
                      selected: _tab,
                      onChanged: _switchTab,
                    ),
                    const SizedBox(height: 24),
                    Container(
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
                              onChanged: _onSearchChanged,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Text(
                  countLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              Expanded(child: _buildList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  if (_tab == _LibraryTab.saved) {
                    _loadSaved(query: _query);
                  } else {
                    _loadDictionary(reset: true);
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_tab == _LibraryTab.saved) {
      if (_savedWords.isEmpty) {
        return Center(
          child: Text(
            _query.trim().isEmpty
                ? 'No saved words yet.\nSave words from Word Practice.'
                : 'No matches.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              height: 20 / 14,
              color: AppColors.secondary,
            ),
          ),
        );
      }
      return ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: _savedWords.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = _savedWords[index];
          return _LibraryWordCard(
            key: ValueKey('saved-${item.id}'),
            word: item.word,
            translation: item.translation,
            allowDelete: true,
            onDelete: () => _deleteWord(item),
          );
        },
      );
    }

    if (_dictWords.isEmpty) {
      return const Center(
        child: Text(
          'No matches.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            height: 20 / 14,
            color: AppColors.secondary,
          ),
        ),
      );
    }

    final itemCount = _dictWords.length + (_dictHasMore ? 1 : 0);
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: itemCount,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (index >= _dictWords.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        final item = _dictWords[index];
        return _LibraryWordCard(
          key: ValueKey('dict-${item.id}'),
          word: item.word,
          translation: item.translation,
          allowDelete: false,
          onDelete: () {},
        );
      },
    );
  }
}

class _LibraryTabs extends StatelessWidget {
  const _LibraryTabs({
    required this.savedLabel,
    required this.dictionaryLabel,
    required this.selected,
    required this.onChanged,
  });

  final String savedLabel;
  final String dictionaryLabel;
  final _LibraryTab selected;
  final ValueChanged<_LibraryTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TabChip(
            label: savedLabel,
            selected: selected == _LibraryTab.saved,
            onTap: () => onChanged(_LibraryTab.saved),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TabChip(
            label: dictionaryLabel,
            selected: selected == _LibraryTab.dictionary,
            onTap: () => onChanged(_LibraryTab.dictionary),
          ),
        ),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: selected
                ? null
                : Border.all(color: Colors.black.withValues(alpha: .10)),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              height: 24 / 16,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : AppColors.ink,
            ),
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
    this.allowDelete = true,
  });

  final String word;
  final String translation;
  final VoidCallback onDelete;
  final bool allowDelete;

  @override
  State<_LibraryWordCard> createState() => _LibraryWordCardState();
}

class _LibraryWordCardState extends State<_LibraryWordCard>
    with SingleTickerProviderStateMixin {
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
    if (!widget.allowDelete) return;
    _controller.animateTo(_revealExtent, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final offset = widget.allowDelete ? _controller.value : 0.0;
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            if (widget.allowDelete)
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
              onHorizontalDragUpdate: widget.allowDelete
                  ? (details) {
                      final next = (_controller.value -
                              (details.primaryDelta ?? 0))
                          .clamp(0.0, _revealExtent);
                      _controller.value = next;
                    }
                  : null,
              onHorizontalDragEnd: widget.allowDelete
                  ? (details) {
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
                    }
                  : null,
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
