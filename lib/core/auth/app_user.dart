class AppUser {
  const AppUser({
    required this.id,
    required this.displayName,
    required this.email,
    required this.avatarUrl,
    required this.authProvider,
    required this.isGuest,
    required this.notificationsEnabled,
    this.dailyReminderHour = 15,
    this.dailyReminderMinute = 0,
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
  final int dailyReminderHour;
  final int dailyReminderMinute;
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
      dailyReminderHour: _parseReminderHour(json['dailyReminderHour']),
      dailyReminderMinute: _parseReminderMinute(json['dailyReminderMinute']),
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

  static int _parseReminderHour(dynamic raw) {
    final n = raw is num ? raw.toInt() : int.tryParse('$raw');
    if (n == null) return 15;
    return n.clamp(0, 23);
  }

  static int _parseReminderMinute(dynamic raw) {
    final n = raw is num ? raw.toInt() : int.tryParse('$raw');
    if (n == null) return 0;
    final clamped = n.clamp(0, 59);
    return clamped - (clamped % 15);
  }

  AppUser copyWith({
    String? displayName,
    String? avatarUrl,
    bool? notificationsEnabled,
    int? dailyReminderHour,
    int? dailyReminderMinute,
    String? appLocale,
    String? subscriptionStatus,
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
      dailyReminderHour: dailyReminderHour ?? this.dailyReminderHour,
      dailyReminderMinute: dailyReminderMinute ?? this.dailyReminderMinute,
      appLocale: appLocale ?? this.appLocale,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      deletionRequestedAt:
          clearDeletion ? null : (deletionRequestedAt ?? this.deletionRequestedAt),
      accessUntil: clearDeletion ? null : (accessUntil ?? this.accessUntil),
      onboarding: onboarding,
    );
  }

  bool get isPremium => subscriptionStatus.toLowerCase() == 'premium';
}

class UserOnboarding {
  const UserOnboarding({
    required this.nativeLanguageCode,
    required this.targetLanguageCode,
    this.goal,
    this.interests = const [],
    this.level,
    this.pace,
    this.explanationLanguage = 'native',
  });

  final String nativeLanguageCode;
  final String targetLanguageCode;
  final String? goal;
  final List<String> interests;
  final String? level;
  final String? pace;
  final String explanationLanguage;

  bool get explainInNativeLanguage => explanationLanguage != 'english';

  factory UserOnboarding.fromJson(Map<String, dynamic> json) {
    return UserOnboarding(
      nativeLanguageCode: json['nativeLanguageCode'] as String? ?? 'tr',
      targetLanguageCode: json['targetLanguageCode'] as String? ?? 'en',
      goal: json['goal'] as String?,
      interests: _parseInterests(json['interests']),
      level: json['level'] as String?,
      pace: json['pace'] as String?,
      explanationLanguage:
          json['explanationLanguage'] as String? ?? 'native',
    );
  }

  static List<String> _parseInterests(dynamic raw) {
    if (raw is! List) return const [];
    return raw
        .map((e) => e?.toString().trim() ?? '')
        .where((e) => e.isNotEmpty)
        .toList();
  }

  UserOnboarding copyWith({
    String? nativeLanguageCode,
    String? targetLanguageCode,
    String? explanationLanguage,
    String? goal,
    List<String>? interests,
    String? level,
    String? pace,
  }) {
    return UserOnboarding(
      nativeLanguageCode: nativeLanguageCode ?? this.nativeLanguageCode,
      targetLanguageCode: targetLanguageCode ?? this.targetLanguageCode,
      goal: goal ?? this.goal,
      interests: interests ?? this.interests,
      level: level ?? this.level,
      pace: pace ?? this.pace,
      explanationLanguage: explanationLanguage ?? this.explanationLanguage,
    );
  }
}
