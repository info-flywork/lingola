import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import '../core/theme/app_theme.dart';
import 'home_asset.dart';

/// Profil fotoğrafı: network URL → baş harf → varsayılan ikon.
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    required this.size,
    this.avatarUrl,
    this.displayName,
    this.showPremiumBadge = false,
    super.key,
  });

  final double size;
  final String? avatarUrl;
  final String? displayName;
  final bool showPremiumBadge;

  static const _networkHeaders = {
    // Google / CDN fotoğrafları User-Agent olmadan 403 verebiliyor.
    'User-Agent':
        'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15',
  };

  String get _initials {
    final raw = (displayName ?? '').trim();
    if (raw.isEmpty) return '?';
    final parts = raw.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.length >= 2) {
      final a = parts[0].characters.first;
      final b = parts[1].characters.first;
      return ('$a$b').toUpperCase();
    }
    return raw.characters.take(2).toString().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final url = avatarUrl?.trim() ?? '';
    final avatar = ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: url.isNotEmpty
            ? Image.network(
                url,
                width: size,
                height: size,
                fit: BoxFit.cover,
                headers: _networkHeaders,
                gaplessPlayback: true,
                errorBuilder: (_, _, _) => _fallback(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _fallback();
                },
              )
            : _fallback(),
      ),
    );

    if (!showPremiumBadge) return avatar;

    final badge = (size * 0.38).clamp(14.0, 22.0);
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              width: badge,
              height: badge,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              padding: EdgeInsets.all(badge * 0.18),
              child: const HomeAsset(
                AppAssets.homePremiumCrown,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fallback() {
    final name = (displayName ?? '').trim();
    if (name.isNotEmpty) {
      return ColoredBox(
        color: AppColors.primaryTint10,
        child: Center(
          child: Text(
            _initials,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size * 0.36,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              height: 1,
            ),
          ),
        ),
      );
    }
    return HomeAsset(
      AppAssets.profileAvatar,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}
