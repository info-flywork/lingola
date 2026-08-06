/// Onboarding cevapları — ekranlar arası taşınır, auth sırasında API'ye gider.
/// Dil kodları açık string (12+ dil); UI enum'a kilitlenmez.
class OnboardingDraft {
  OnboardingDraft({
    this.nativeLanguageCode = 'tr',
    this.targetLanguageCode = 'en',
    this.goal,
    this.level,
    this.pace,
    this.appLocale = 'en',
  });

  String nativeLanguageCode;
  String targetLanguageCode;
  String? goal;
  String? level;
  String? pace;

  /// Uygulama UI dili (ileride 12 dil).
  String appLocale;

  static const goals = [
    'career',
    'travel',
    'livingAbroad',
    'studyingAbroad',
    'other',
  ];

  static const levels = ['beginner', 'intermediate', 'advanced'];
  static const paces = ['light', 'recommended', 'fast'];

  void setGoalIndex(int index) {
    if (index >= 0 && index < goals.length) goal = goals[index];
  }

  void setLevelIndex(int index) {
    if (index >= 0 && index < levels.length) level = levels[index];
  }

  void setPaceIndex(int index) {
    if (index >= 0 && index < paces.length) pace = paces[index];
  }

  Map<String, dynamic> toApiJson() => {
        'nativeLanguageCode': nativeLanguageCode,
        'targetLanguageCode': targetLanguageCode,
        if (goal != null) 'goal': goal,
        if (level != null) 'level': level,
        if (pace != null) 'pace': pace,
      };
}
