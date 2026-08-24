import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  List<_NotificationItem>? _remoteItems;

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
      setState(() => _remoteItems = mapped);
    } catch (_) {
      // Yerel kartlar korunur.
    }
  }

  List<_NotificationItem> _itemsFor(dynamic text) {
    return _remoteItems ?? _fallbackItems(text);
  }

  static List<_NotificationItem> _fallbackItems(dynamic text) {
    return [
      _NotificationItem(
        icon: 'assets/images/notifications/icon_translation.svg',
        iconBg: const Color(0x1A2D46FF),
        title: text.translation.title,
        body: text.translation.body,
        titleColor: AppColors.ink,
      ),
      _NotificationItem(
        icon: 'assets/images/notifications/icon_offer.svg',
        iconBg: const Color(0x1AFF8A00),
        title: text.offer.title,
        body: text.offer.body,
        titleColor: _offerTitle,
      ),
      _NotificationItem(
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
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _NotificationCard(item: items[index]);
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
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.body,
    required this.titleColor,
  });

  final String icon;
  final Color iconBg;
  final String title;
  final String body;
  final Color titleColor;
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
