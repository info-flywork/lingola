import '../../features/onboarding/onboarding_draft.dart';
import '../../features/onboarding/services/onboarding_preview_chat_store.dart';
import '../../features/tutor/services/tutor_chat_api_service.dart';
import '../i18n/app_locale_sync.dart';
import '../premium/premium_service.dart';
import 'dart:convert';

import 'api_client.dart';
import 'app_user.dart';
import 'device_id_service.dart';
import 'firebase_auth_gateway.dart';
import 'session_store.dart';

abstract final class AuthService {
  static Future<AppUser> signInAsGuest(OnboardingDraft draft) async {
    final deviceId = await DeviceIdService.getStableDeviceId();
    return _persistSession(
      await ApiClient.post(
        '/auth/guest',
        body: {
          ..._authBody(draft),
          'deviceId': deviceId,
        },
      ),
    );
  }

  static Future<AppUser> signInWithGoogle(OnboardingDraft draft) async {
    final social = await FirebaseAuthGateway.signInWithGoogle();
    return _persistSession(
      await ApiClient.post(
        '/auth/google',
        body: {
          ..._authBody(draft),
          'idToken': social.idToken,
          if (social.email != null) 'email': social.email,
          if (social.displayName != null) 'displayName': social.displayName,
          if (social.avatarUrl != null) 'avatarUrl': social.avatarUrl,
        },
      ),
    );
  }

  static Future<AppUser> signInWithApple(OnboardingDraft draft) async {
    final social = await FirebaseAuthGateway.signInWithApple();
    return _persistSession(
      await ApiClient.post(
        '/auth/apple',
        body: {
          ..._authBody(draft),
          'idToken': social.idToken,
          if (social.email != null) 'email': social.email,
          if (social.displayName != null) 'displayName': social.displayName,
          if (social.avatarUrl != null) 'avatarUrl': social.avatarUrl,
        },
      ),
    );
  }

  static Map<String, dynamic> _authBody(OnboardingDraft draft) => {
        'appLocale': draft.appLocale,
        'notificationsEnabled': true,
        'onboarding': draft.toApiJson(),
      };

  static Future<AppUser> _persistSession(Map<String, dynamic> json) async {
    final token = json['token'] as String?;
    final userJson = json['user'];
    if (token == null || userJson is! Map<String, dynamic>) {
      throw ApiException('Invalid auth response');
    }
    final user = AppUser.fromJson(userJson);
    final expiresAt = _parseExpires(json['expiresAt'] ?? json['expires_at']);
    await SessionStore.saveSession(
      token: token,
      user: user,
      expiresAt: expiresAt,
    );
    await _claimOnboardingPreviewIfAny();
    await AppLocaleSync.applyFromUser(user.appLocale);
    await PremiumService.syncIdentity(user);
    return user;
  }

  static Future<void> _claimOnboardingPreviewIfAny() async {
    final previewId = OnboardingPreviewChatStore.sessionId;
    if (previewId == null || previewId.isEmpty) return;
    try {
      await TutorChatApiService.claimPreviewSession(previewId);
      OnboardingPreviewChatStore.clear();
    } catch (_) {
      // Oturum claim edilmezse giriş akışını bozma.
    }
  }

  static DateTime? _parseExpires(dynamic raw) {
    if (raw is String && raw.isNotEmpty) return DateTime.tryParse(raw)?.toUtc();
    return null;
  }

  /// Proactive token rotation when nearing expiry.
  static Future<AppUser?> refreshSession() async {
    final token = await SessionStore.getToken();
    if (token == null || token.isEmpty) return null;
    try {
      final json = await ApiClient.post(
        '/auth/refresh',
        auth: true,
        allowRefresh: false,
      );
      return _persistSession(json);
    } on ApiException catch (err) {
      if (err.statusCode == 401) {
        await SessionStore.clear();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Restore session for app launch. Network hiccups keep cached user.
  static Future<AppUser?> restoreSession() async {
    final token = await SessionStore.getToken();
    if (token == null || token.isEmpty) {
      await SessionStore.clear();
      return null;
    }

    final cached = await SessionStore.loadCachedUser();

    if (await SessionStore.shouldRefresh()) {
      final refreshed = await refreshSession();
      if (refreshed != null) return refreshed;
    }

    try {
      final json = await ApiClient.get('/auth/me', auth: true);
      final userJson = json['user'];
      if (userJson is! Map<String, dynamic>) {
        await AppLocaleSync.applyFromUser(cached?.appLocale);
        return cached;
      }
      final user = AppUser.fromJson(userJson);
      await SessionStore.saveSession(
        token: token,
        user: user,
        expiresAt: SessionStore.expiresAt,
      );
      await AppLocaleSync.applyFromUser(user.appLocale);
      await PremiumService.syncIdentity(user);
      return user;
    } on ApiException catch (err) {
      if (err.statusCode == 401) {
        final refreshed = await refreshSession();
        if (refreshed != null) return refreshed;
        await SessionStore.clear();
        return null;
      }
      await AppLocaleSync.applyFromUser(cached?.appLocale);
      if (cached != null) await PremiumService.syncIdentity(cached);
      return cached;
    } catch (_) {
      await AppLocaleSync.applyFromUser(cached?.appLocale);
      if (cached != null) await PremiumService.syncIdentity(cached);
      return cached;
    }
  }

  static Future<AppUser> updateProfile({
    String? displayName,
    bool? notificationsEnabled,
    String? appLocale,
    String? avatarUrl,
  }) async {
    final body = <String, dynamic>{};
    if (displayName != null) body['displayName'] = displayName;
    if (notificationsEnabled != null) {
      body['notificationsEnabled'] = notificationsEnabled;
    }
    if (appLocale != null) body['appLocale'] = appLocale;
    if (avatarUrl != null) body['avatarUrl'] = avatarUrl;

    final json = await ApiClient.patch('/auth/me', body: body, auth: true);
    return _persistUserOnly(json);
  }

  static Future<AppUser> setNotificationsEnabled(bool enabled) async {
    final json = await ApiClient.patch(
      '/auth/me/notifications',
      auth: true,
      body: {'notificationsEnabled': enabled},
    );
    return _persistUserOnly(json);
  }

  static Future<AppUser> uploadAvatar({
    required List<int> bytes,
    required String contentType,
  }) async {
    final b64 = base64Encode(bytes);
    final json = await ApiClient.post(
      '/auth/me/avatar',
      auth: true,
      body: {
        'imageBase64': b64,
        'contentType': contentType,
      },
    );
    return _persistUserOnly(json);
  }

  static Future<AppUser> acceptRetentionOffer(String offerType) async {
    final json = await ApiClient.post(
      '/auth/retention-offer',
      auth: true,
      body: {
        'offerType': offerType,
        'action': 'accepted',
      },
    );
    return _persistUserOnly(json);
  }

  /// Schedules deletion; returns accessUntil (grace end).
  static Future<({AppUser user, DateTime? accessUntil})> requestAccountDeletion({
    required String reasonCode,
    String? reasonLabel,
    String? message,
  }) async {
    final json = await ApiClient.post(
      '/auth/delete-account',
      auth: true,
      body: {
        'reasonCode': reasonCode,
        'reasonLabel': ?reasonLabel,
        if (message != null && message.trim().isNotEmpty)
          'message': message.trim(),
      },
    );
    final user = await _persistUserOnly(json);
    DateTime? until;
    final raw = json['accessUntil'];
    if (raw is String) until = DateTime.tryParse(raw)?.toUtc();
    return (user: user, accessUntil: until ?? user.accessUntil);
  }

  static Future<AppUser> reactivateAccount() async {
    final json = await ApiClient.post('/auth/reactivate', auth: true);
    return _persistUserOnly(json);
  }

  static Future<AppUser> _persistUserOnly(Map<String, dynamic> json) async {
    final userJson = json['user'];
    if (userJson is! Map<String, dynamic>) {
      throw ApiException('Invalid user response');
    }
    final user = AppUser.fromJson(userJson);
    final token = await SessionStore.getToken();
    if (token != null && token.isNotEmpty) {
      await SessionStore.saveSession(
        token: token,
        user: user,
        expiresAt: SessionStore.expiresAt,
      );
    } else {
      await SessionStore.updateUser(user);
    }
    await AppLocaleSync.applyFromUser(user.appLocale);
    return user;
  }

  static Future<void> logout() async {
    try {
      await ApiClient.post('/auth/logout', auth: true, allowRefresh: false);
    } catch (_) {}
    await FirebaseAuthGateway.signOut();
    await PremiumService.logOut();
    await SessionStore.clear();
    await AppLocaleSync.applyCode('en');
  }

  static String displayNameOf(AppUser? user) {
    final name = user?.displayName?.trim();
    if (name != null && name.isNotEmpty) return name;
    if (user?.isGuest == true) return 'Guest';
    final email = user?.email?.trim();
    if (email != null && email.isNotEmpty) {
      return email.split('@').first;
    }
    return 'Lingola';
  }

  static String formatAccessDate(DateTime? date) {
    if (date == null) return '—';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final local = date.toLocal();
    return '${months[local.month - 1]} ${local.day}, ${local.year}';
  }
}
