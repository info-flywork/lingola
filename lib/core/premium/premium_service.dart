import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/api_client.dart';
import '../auth/app_user.dart';
import '../auth/session_store.dart';
import '../config/app_env.dart';
import '../constants/app_text.dart';

/// RevenueCat entitlement id (Dashboard → Entitlements).
/// Boş/yanlış olsa bile aktif herhangi bir entitlement premium sayılır.
abstract final class RevenueCatConfig {
  static const entitlementId = 'premium';
  static const freeLessonLimit = 2;
  static const freeTutorPrefKey = 'lingola_free_tutor_slug';
}

/// Premium durumu: backend `subscriptionStatus` + RevenueCat entitlements.
abstract final class PremiumService {
  static final ValueNotifier<bool> isPremiumListenable = ValueNotifier<bool>(
    false,
  );

  static bool get isPremium => isPremiumListenable.value;

  static bool get _backendPremium {
    final status =
        SessionStore.currentUser?.subscriptionStatus.toLowerCase() ?? '';
    return status == 'premium';
  }

  static void _publish(bool value) {
    if (isPremiumListenable.value == value) return;
    isPremiumListenable.value = value;
  }

  static void syncFromUser(AppUser? user) {
    final backend =
        (user?.subscriptionStatus.toLowerCase() ?? '') == 'premium';
    if (backend) {
      _publish(true);
      return;
    }
    unawaited(refreshFromRevenueCat());
  }

  static Future<void> syncIdentity(AppUser user) async {
    try {
      await Purchases.logIn(user.id);
    } on MissingPluginException {
      // ignore
    } catch (e) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('[premium] Purchases.logIn failed: $e');
      }
    }
    syncFromUser(user);
    await refreshFromRevenueCat();
    if (!isPremium) {
      await _tryRestorePurchases();
    }
  }

  /// App Store / Play aboneliği başka RC kimliğinde kalmışsa geri yükle.
  static Future<void> _tryRestorePurchases() async {
    try {
      await Purchases.restorePurchases();
      await refreshFromRevenueCat();
    } on MissingPluginException {
      // ignore
    } catch (_) {}
  }

  static Future<void> logOut() async {
    try {
      await Purchases.logOut();
    } catch (_) {}
    _publish(false);
  }

  static Future<bool> refreshFromRevenueCat() async {
    try {
      final info = await Purchases.getCustomerInfo();
      final active = info.entitlements.active;
      final fromRc = active.containsKey(RevenueCatConfig.entitlementId) ||
          active.isNotEmpty;
      final premium = fromRc || _backendPremium;
      _publish(premium);

      final user = SessionStore.currentUser;
      if (fromRc && user != null && user.subscriptionStatus != 'premium') {
        await SessionStore.updateUser(
          user.copyWith(subscriptionStatus: 'premium'),
        );
      }
      return premium;
    } on MissingPluginException {
      _publish(_backendPremium);
      return _backendPremium;
    } catch (_) {
      _publish(_backendPremium);
      return _backendPremium;
    }
  }

  static Future<void> _refreshUserFromApi() async {
    try {
      final json = await ApiClient.get('/auth/me', auth: true);
      final userJson = json['user'];
      if (userJson is! Map<String, dynamic>) return;
      final user = AppUser.fromJson(userJson);
      await SessionStore.updateUser(user);
      syncFromUser(user);
    } catch (_) {}
  }

  /// Paywall göster; kapanınca premium durumunu yenile.
  static Future<bool> presentPaywall(BuildContext context) async {
    if (isPremium) return true;
    final hasKey = AppEnv.revenueCatIosPublicKey.isNotEmpty ||
        AppEnv.revenueCatAndroidPublicKey.isNotEmpty;
    if (!hasKey) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Paywall is not configured yet.')),
        );
      }
      return false;
    }
    try {
      await RevenueCatUI.presentPaywall(displayCloseButton: true);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppText.current.common.genericError)),
        );
      }
      return false;
    }
    await refreshFromRevenueCat();
    await _refreshUserFromApi();
    return isPremium;
  }

  /// Premium değilse paywall aç; false → aksiyonu iptal et.
  static Future<bool> requirePremium(BuildContext context) async {
    if (isPremium) return true;
    return presentPaywall(context);
  }

  /// Free: yalnızca 1 hoca. İlk seçilen slug kilitlenir.
  static Future<bool> canUseTutor(String? slug) async {
    if (isPremium) return true;
    final s = (slug ?? '').trim().toLowerCase();
    if (s.isEmpty) return false;
    final prefs = await SharedPreferences.getInstance();
    final locked = prefs.getString(RevenueCatConfig.freeTutorPrefKey)?.trim();
    if (locked == null || locked.isEmpty) {
      await prefs.setString(RevenueCatConfig.freeTutorPrefKey, s);
      return true;
    }
    return locked.toLowerCase() == s;
  }

  static Future<bool> requireTutorOrPaywall(
    BuildContext context,
    String? slug,
  ) async {
    if (await canUseTutor(slug)) return true;
    if (!context.mounted) return false;
    return presentPaywall(context);
  }

  /// Free: müfredatta index < 2 (0-based).
  static bool canAccessLessonIndex(int index) {
    if (isPremium) return true;
    return index >= 0 && index < RevenueCatConfig.freeLessonLimit;
  }
}
