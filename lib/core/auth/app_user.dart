class AppUser {
  const AppUser({
    required this.id,
    required this.displayName,
    required this.email,
    required this.avatarUrl,
    required this.authProvider,
    required this.isGuest,
    required this.notificationsEnabled,
    required this.appLocale,
    required this.subscriptionStatus,
    this.deletionRequestedAt,
    this.accessUntil,
    this.onboarding,
  });

  final String id;
  final String? displayName;
  final String? email;
  final String? avatarUrl;
  final String authProvider;
  final bool isGuest;
  final bool notificationsEnabled;
  final String appLocale;
  final String subscriptionStatus;
  final DateTime? deletionRequestedAt;
  final DateTime? accessUntil;
  final UserOnboarding? onboarding;

  bool get isDeletionPending =>
      deletionRequestedAt != null &&
      (accessUntil == null || !DateTime.now().toUtc().isAfter(accessUntil!.toUtc()));

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      avatarUrl: (json['avatarUrl'] ?? json['avatar_url']) as String?,
      authProvider: json['authProvider'] as String? ?? 'guest',
      isGuest: json['isGuest'] as bool? ?? true,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      appLocale: json['appLocale'] as String? ?? 'en',
      subscriptionStatus: json['subscriptionStatus'] as String? ?? 'free',
      deletionRequestedAt: _parseDate(json['deletionRequestedAt']),
      accessUntil: _parseDate(json['accessUntil']),
      onboarding: json['onboarding'] is Map<String, dynamic>
          ? UserOnboarding.fromJson(json['onboarding'] as Map<String, dynamic>)
          : null,
    );
  }

  static DateTime? _parseDate(dynamic raw) {
    if (raw is String && raw.isNotEmpty) return DateTime.tryParse(raw)?.toUtc();
    return null;
  }

  AppUser copyWith({
    String? displayName,
    String? avatarUrl,
    bool? notificationsEnabled,
    String? appLocale,
    DateTime? deletionRequestedAt,
    DateTime? accessUntil,
    bool clearDeletion = false,
  }) {
    return AppUser(
      id: id,
      displayName: displayName ?? this.displayName,
      email: email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      authProvider: authProvider,
      isGuest: isGuest,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      appLocale: appLocale ?? this.appLocale,
      subscriptionStatus: subscriptionStatus,
      deletionRequestedAt:
          clearDeletion ? null : (deletionRequestedAt ?? this.deletionRequestedAt),
      accessUntil: clearDeletion ? null : (accessUntil ?? this.accessUntil),
      onboarding: onboarding,
    );
  }
}

class UserOnboarding {
  const UserOnboarding({
    required this.nativeLanguageCode,
    required this.targetLanguageCode,
    this.goal,
    this.level,
    this.pace,
  });

  final String nativeLanguageCode;
  final String targetLanguageCode;
  final String? goal;
  final String? level;
  final String? pace;

  factory UserOnboarding.fromJson(Map<String, dynamic> json) {
    return UserOnboarding(
      nativeLanguageCode: json['nativeLanguageCode'] as String? ?? 'tr',
      targetLanguageCode: json['targetLanguageCode'] as String? ?? 'en',
      goal: json['goal'] as String?,
      level: json['level'] as String?,
      pace: json['pace'] as String?,
    );
  }
}
