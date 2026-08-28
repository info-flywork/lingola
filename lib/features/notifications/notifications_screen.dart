import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'notification_inbox_item.dart';
import 'notification_inbox_store.dart';
import 'notifications_api_service.dart';
import 'notifications_unread_store.dart';

/// Figma stroke: 1px siyah %10 — kartlarda hafif daha belirgin.
const _notificationCardBorder = Color(0x24000000);
const _offerTitle = Color(0xFFFF8A00);

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<_NotificationItem> _items = [];
  String? _openSwipeId;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _loading = true);
    try {
      final inbox = await NotificationInboxStore.loadDelivered();
      if (!mounted) return;

      if (inbox.any((item) => item.isUnread)) {
        try {
          await NotificationsApiService.markAllRead();
          await NotificationInboxStore.markAllReadLocal();
        } catch (_) {}
      }

      final items = inbox.map(_mapItem).toList();
      NotificationsUnreadStore.setCount(0);

      setState(() {
        _items = items;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _deleteItem(_NotificationItem item) async {
    setState(() {
      _items = List<_NotificationItem>.from(_items)
        ..removeWhere((i) => i.id == item.id);
      if (_openSwipeId == item.id) _openSwipeId = null;
    });

    try {
      await NotificationInboxStore.remove(item.id);
      await NotificationsUnreadStore.refresh();
    } catch (_) {}
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
    await _deleteItem(item);
  }

  static _NotificationItem _mapItem(NotificationInboxItem item) {
    return _NotificationItem(
      id: item.id,
      icon: item.iconAsset.isNotEmpty
          ? item.iconAsset
          : 'assets/images/notifications/icon_translation.svg',
      iconBg: _parseColor(item.iconBg) ?? const Color(0x1A2D46FF),
      title: item.title,
      body: item.body,
      titleColor: _parseColor(item.titleColor) ??
          (item.type == 'premium' ? _offerTitle : AppColors.ink),
      isUnread: item.isUnread,
    );
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.surface,
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
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _items.isEmpty
                        ? _NotificationsEmptyState(
                            title: text.emptyTitle,
                            subtitle: text.emptySubtitle,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                            itemCount: _items.length,
                            separatorBuilder: (_, _) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final item = _items[index];
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

class _NotificationsEmptyState extends StatelessWidget {
  const _NotificationsEmptyState({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.notificationsEmptyBell,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                height: 36 / 24,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 21 / 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ),
          ],
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
    this.isUnread = false,
  });

  final String id;
  final String icon;
  final Color iconBg;
  final String title;
  final String body;
  final Color titleColor;
  final bool isUnread;
}

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
        border: Border.all(
          color: _notificationCardBorder,
          width: 1,
        ),
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
          if (item.isUnread)
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 4),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
