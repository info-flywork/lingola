import '../../core/i18n/app_locale_sync.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';

/// Onboarding cevapları — ekranlar arası taşınır, auth sırasında API'ye gider.
/// Dil kodları açık string (12+ dil); UI enum'a kilitlenmez.
class OnboardingDraft {
  OnboardingDraft({
    this.nativeLanguageCode = 'tr',
    this.targetLanguageCode = 'en',
    this.goal = 'career',
    this.level = CefrLevels.defaultLevel,
    this.pace = DailyPace.defaultPace,
    this.explanationLanguage = 'native',
    String? appLocale,
  }) : appLocale = appLocale ?? AppLocaleSync.deviceLocaleCode();

  String nativeLanguageCode;
  String targetLanguageCode;
  String? goal;
  String? level;
  String? pace;
  String explanationLanguage;

  /// Uygulama UI dili — ilk kurulumda telefon dili (destek yoksa en).
  String appLocale;

  static const goals = [
    'career',
    'travel',
    'livingAbroad',
    'studyingAbroad',
    'other',
  ];

  static const levels = CefrLevels.values;
  static const paces = DailyPace.values;
  static const explanationLanguages = ['native', 'english'];

  void setGoalIndex(int index) {
    if (index >= 0 && index < goals.length) goal = goals[index];
  }

  void setLevelIndex(int index) {
    if (index >= 0 && index < levels.length) level = levels[index];
  }

  void setPaceIndex(int index) {
    if (index >= 0 && index < paces.length) pace = paces[index];
  }

  void setExplanationLanguageIndex(int index) {
    if (index >= 0 && index < explanationLanguages.length) {
      explanationLanguage = explanationLanguages[index];
    }
  }

  Map<String, dynamic> toApiJson() => {
        'nativeLanguageCode': nativeLanguageCode,
        'targetLanguageCode': targetLanguageCode,
        'explanationLanguage': explanationLanguage,
        'goal': goal,
        'level': CefrLevels.forApi(level),
        'pace': DailyPace.normalize(pace),
      };
}
