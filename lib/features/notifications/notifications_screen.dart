import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'notifications_api_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static const _offerTitle = Color(0xFFFF8A00);

  List<_NotificationItem>? _items;
  String? _openSwipeId;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    try {
      final remote = await NotificationsApiService.fetchNotifications();
      if (!mounted || remote.isEmpty) return;
      final text = AppText.current.notificationsPage;
      final mapped = remote
          .map((dto) => _mapNotification(dto, text))
          .whereType<_NotificationItem>()
          .toList();
      if (mapped.isEmpty) return;
      setState(() => _items = mapped);
    } catch (_) {
      // Yerel kartlar korunur.
    }
  }

  List<_NotificationItem> _itemsFor(dynamic text) {
    return _items ?? _fallbackItems(text);
  }

  void _deleteItem(String id) {
    setState(() {
      final current = List<_NotificationItem>.from(
        _items ?? _fallbackItems(AppText.current.notificationsPage),
      );
      current.removeWhere((item) => item.id == id);
      _items = current;
      if (_openSwipeId == id) _openSwipeId = null;
    });
  }

  Future<void> _confirmAndDelete(_NotificationItem item) async {
    final text = AppText.current.notificationsPage;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(text.deleteConfirmTitle),
        content: Text(text.deleteConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(text.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF0014)),
            child: Text(text.delete),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    _deleteItem(item.id);
  }

  static List<_NotificationItem> _fallbackItems(dynamic text) {
    return [
      _NotificationItem(
        id: 'fallback-translation',
        icon: 'assets/images/notifications/icon_translation.svg',
        iconBg: const Color(0x1A2D46FF),
        title: text.translation.title,
        body: text.translation.body,
        titleColor: AppColors.ink,
      ),
      _NotificationItem(
        id: 'fallback-offer',
        icon: 'assets/images/notifications/icon_offer.svg',
        iconBg: const Color(0x1AFF8A00),
        title: text.offer.title,
        body: text.offer.body,
        titleColor: _offerTitle,
      ),
      _NotificationItem(
        id: 'fallback-stories',
        icon: 'assets/images/notifications/icon_stories.svg',
        iconBg: const Color(0x1A34C759),
        title: text.stories.title,
        body: text.stories.body,
        titleColor: AppColors.ink,
      ),
    ];
  }

  static _NotificationItem? _mapNotification(
    NotificationDto dto,
    dynamic text,
  ) {
    final resolved = _resolveCopy(text, dto.titleKey, dto.bodyKey);
    if (resolved == null) return null;
    return _NotificationItem(
      id: dto.id.isNotEmpty ? dto.id : '${dto.titleKey}-${dto.bodyKey}',
      icon: dto.iconAsset,
      iconBg: _parseColor(dto.iconBg) ?? const Color(0x1A2D46FF),
      title: resolved.$1,
      body: resolved.$2,
      titleColor: _parseColor(dto.titleColor) ?? AppColors.ink,
    );
  }

  static (String, String)? _resolveCopy(
    dynamic text,
    String titleKey,
    String bodyKey,
  ) {
    final title = switch (titleKey) {
      'translation.title' => text.translation.title as String?,
      'offer.title' => text.offer.title as String?,
      'stories.title' => text.stories.title as String?,
      _ => null,
    };
    final body = switch (bodyKey) {
      'translation.body' => text.translation.body as String?,
      'offer.body' => text.offer.body as String?,
      'stories.body' => text.stories.body as String?,
      _ => null,
    };
    if (title == null || body == null) return null;
    return (title, body);
  }

  static Color? _parseColor(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    final value = raw.replaceFirst('#', '');
    if (value.length == 6) {
      final parsed = int.tryParse('FF$value', radix: 16);
      if (parsed != null) return Color(parsed);
    }
    if (value.length == 8) {
      final parsed = int.tryParse(value, radix: 16);
      if (parsed != null) return Color(parsed);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.notificationsPage;
    final items = _itemsFor(text);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: AppColors.ink,
                      ),
                      tooltip: AppText.current.common.back,
                    ),
                    Text(
                      text.title,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: items.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return _NotificationSwipeRow(
                            item: item,
                            isOpen: _openSwipeId == item.id,
                            onOpenChanged: (open) {
                              setState(() {
                                _openSwipeId = open ? item.id : null;
                              });
                            },
                            onDeleteTap: () => _confirmAndDelete(item),
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

class _NotificationItem {
  const _NotificationItem({
    required this.id,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.body,
    required this.titleColor,
  });

  final String id;
  final String icon;
  final Color iconBg;
  final String title;
  final String body;
  final Color titleColor;
}

/// Sola kaydır → Figma 44×44 çöp butonu; tık → onay diyalogu.
class _NotificationSwipeRow extends StatefulWidget {
  const _NotificationSwipeRow({
    required this.item,
    required this.isOpen,
    required this.onOpenChanged,
    required this.onDeleteTap,
  });

  final _NotificationItem item;
  final bool isOpen;
  final ValueChanged<bool> onOpenChanged;
  final VoidCallback onDeleteTap;

  @override
  State<_NotificationSwipeRow> createState() => _NotificationSwipeRowState();
}

class _NotificationSwipeRowState extends State<_NotificationSwipeRow> {
  static const _actionW = 44.0;
  static const _gap = 8.0;
  static const _reveal = _actionW + _gap;

  double _dx = 0;

  @override
  void didUpdateWidget(covariant _NotificationSwipeRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen && _dx > -_reveal + 0.5) {
      setState(() => _dx = -_reveal);
    } else if (!widget.isOpen && _dx < -0.5) {
      setState(() => _dx = 0);
    }
  }

  void _settle(double velocity) {
    final shouldOpen = velocity < -200 || _dx < -_reveal / 2;
    final next = shouldOpen ? -_reveal : 0.0;
    setState(() => _dx = next);
    widget.onOpenChanged(shouldOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // Çöp — kartın sağında (Figma: 44×44, radius 8, #FF0014 @ 20%)
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Material(
              color: const Color(0x33FF0014),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: widget.onDeleteTap,
                borderRadius: BorderRadius.circular(8),
                child: const SizedBox(
                  width: _actionW,
                  height: _actionW,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: HomeAsset(
                      AppAssets.notificationTrash,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              _dx = (_dx + details.delta.dx).clamp(-_reveal, 0.0);
            });
          },
          onHorizontalDragEnd: (details) {
            _settle(details.primaryVelocity ?? 0);
          },
          onTap: () {
            if (_dx < -1) {
              setState(() => _dx = 0);
              widget.onOpenChanged(false);
            }
          },
          child: Transform.translate(
            offset: Offset(_dx, 0),
            child: _NotificationCard(item: widget.item),
          ),
        ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: item.iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: HomeAsset(
              item.icon,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: item.titleColor,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.body,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      height: 16 / 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
