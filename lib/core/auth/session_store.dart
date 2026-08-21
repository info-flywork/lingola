import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_user.dart';

abstract final class SessionStore {
  static const _tokenKey = 'lingola_access_token';
  static const _expiresKey = 'lingola_token_expires_at';
  static const _userKey = 'lingola_user_json';

  static AppUser? currentUser;
  static DateTime? expiresAt;

  /// Profil / avatar / isim değişikliklerinde Home vb. anlık dinler.
  static final ValueNotifier<AppUser?> userListenable =
      ValueNotifier<AppUser?>(null);

  static void _publish(AppUser? user) {
    currentUser = user;
    // Yeni AppUser her seferinde farklı referans → dinleyiciler tetiklenir.
    userListenable.value = user;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveSession({
    required String token,
    required AppUser user,
    DateTime? expiresAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, jsonEncode(_userToJson(user)));
    if (expiresAt != null) {
      await prefs.setString(_expiresKey, expiresAt.toUtc().toIso8601String());
      SessionStore.expiresAt = expiresAt.toUtc();
    }
    _publish(user);
  }

  /// Token’a dokunmadan kullanıcı cache’ini günceller (profil / avatar).
  static Future<void> updateUser(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(_userToJson(user)));
    _publish(user);
  }

  static Future<AppUser?> loadCachedUser() async {
    if (currentUser != null) {
      if (userListenable.value == null) userListenable.value = currentUser;
      return currentUser;
    }
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);
    final expiresRaw = prefs.getString(_expiresKey);
    if (expiresRaw != null && expiresRaw.isNotEmpty) {
      expiresAt = DateTime.tryParse(expiresRaw)?.toUtc();
    }
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw);
      if (map is! Map<String, dynamic>) return null;
      final user = AppUser.fromJson(map);
      _publish(user);
      return user;
    } catch (_) {
      return null;
    }
  }

  /// True when expiry is within [within] (default 14 days) or already past.
  static Future<bool> shouldRefresh({
    Duration within = const Duration(days: 14),
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_expiresKey);
    if (raw == null || raw.isEmpty) return false;
    final exp = DateTime.tryParse(raw)?.toUtc();
    if (exp == null) return false;
    expiresAt = exp;
    return DateTime.now().toUtc().isAfter(exp.subtract(within));
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_expiresKey);
    await prefs.remove(_userKey);
    expiresAt = null;
    _publish(null);
  }

  static Map<String, dynamic> _userToJson(AppUser user) => {
        'id': user.id,
        'displayName': user.displayName,
        'email': user.email,
        'avatarUrl': user.avatarUrl,
        'authProvider': user.authProvider,
        'isGuest': user.isGuest,
        'notificationsEnabled': user.notificationsEnabled,
        'appLocale': user.appLocale,
        'subscriptionStatus': user.subscriptionStatus,
        'deletionRequestedAt': user.deletionRequestedAt?.toUtc().toIso8601String(),
        'accessUntil': user.accessUntil?.toUtc().toIso8601String(),
        if (user.onboarding != null)
          'onboarding': {
            'nativeLanguageCode': user.onboarding!.nativeLanguageCode,
            'targetLanguageCode': user.onboarding!.targetLanguageCode,
            'goal': user.onboarding!.goal,
            'level': user.onboarding!.level,
            'pace': user.onboarding!.pace,
          },
      };
}
