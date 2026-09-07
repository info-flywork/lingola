import '../../core/i18n/app_locale_sync.dart';
import '../../core/constants/cefr_levels.dart';
import '../../core/constants/daily_pace.dart';
import '../../core/constants/daily_practice_minutes.dart';
import '../../core/constants/practice_time_of_day.dart';

/// Onboarding cevapları — ekranlar arası taşınır, auth sırasında API'ye gider.
/// Dil kodları açık string (12+ dil); UI enum'a kilitlenmez.
/// Seviye / tempo / dakika / pratik dilimi kullanıcı seçene kadar null/boş kalır.
class OnboardingDraft {
  OnboardingDraft({
    this.nativeLanguageCode = 'tr',
    this.targetLanguageCode = 'en',
    this.goal,
    List<String>? interests,
    this.level,
    this.pace,
    this.dailyMinutes,
    this.practiceTimeOfDay,
    int? reminderHour,
    this.reminderMinute = 0,
    int? practiceWindowEndHour,
    this.practiceWindowEndMinute = 0,
    this.explanationLanguage,
    String? appLocale,
  })  : interests = List<String>.from(interests ?? const <String>[]),
        reminderHour = reminderHour ?? 12,
        practiceWindowEndHour = practiceWindowEndHour ?? 18,
        appLocale = appLocale ?? AppLocaleSync.deviceLocaleCode();

  String nativeLanguageCode;
  String targetLanguageCode;
  String? goal;
  List<String> interests;
  String? level;
  String? pace;
  int? dailyMinutes;
  String? practiceTimeOfDay;
  int reminderHour;
  int reminderMinute;
  int practiceWindowEndHour;
  int practiceWindowEndMinute;
  String? explanationLanguage;

  /// Uygulama UI dili — ilk kurulumda telefon dili (destek yoksa en).
  String appLocale;

  /// Pratik zamanı ekranında kullanıcı (veya Kaydet varsayılanı) saat seçti mi?
  var practiceWindowSet = false;

  static const goals = [
    'career',
    'travel',
    'studyingAbroad',
    'livingAbroad',
    'other',
  ];

  static const levels = CefrLevels.values;
  static const paces = DailyPace.values;
  static const explanationLanguages = ['native', 'english'];

  void setGoalIndex(int index) {
    if (index >= 0 && index < goals.length) goal = goals[index];
  }

  void setInterests(Iterable<String> ids) {
    interests =
        ids.map((e) => e.trim()).where((e) => e.isNotEmpty).toSet().toList();
  }

  void setLevelIndex(int index) {
    if (index >= 0 && index < levels.length) level = levels[index];
  }

  void setPaceIndex(int index) {
    if (index >= 0 && index < paces.length) pace = paces[index];
  }

  void setDailyMinutes(int minutes) {
    dailyMinutes = DailyPracticeMinutes.normalize(minutes);
  }

  void setPracticeTimeOfDayIndex(int index) {
    if (index >= 0 && index < PracticeTimeOfDay.values.length) {
      practiceTimeOfDay = PracticeTimeOfDay.values[index];
    }
  }

  void setPracticeWindow({
    required int startHour,
    required int startMinute,
    required int endHour,
    required int endMinute,
  }) {
    reminderHour = startHour.clamp(0, 23);
    reminderMinute = startMinute.clamp(0, 59);
    practiceWindowEndHour = endHour.clamp(0, 23);
    practiceWindowEndMinute = endMinute.clamp(0, 59);
    practiceWindowSet = true;
  }

  void setExplanationLanguageIndex(int index) {
    if (index >= 0 && index < explanationLanguages.length) {
      explanationLanguage = explanationLanguages[index];
    }
  }

  Map<String, dynamic> toApiJson() => {
        'nativeLanguageCode': nativeLanguageCode,
        'targetLanguageCode': targetLanguageCode,
        'explanationLanguage': explanationLanguage ?? 'native',
        'goal': goal,
        'interests': interests,
        'level': CefrLevels.forApi(level),
        'pace': DailyPace.normalize(pace),
        'dailyMinutes': DailyPracticeMinutes.normalize(dailyMinutes),
        'practiceTimeOfDay': PracticeTimeOfDay.normalize(practiceTimeOfDay),
        if (practiceWindowSet) ...{
          'reminderHour': reminderHour,
          'reminderMinute': reminderMinute,
          'practiceWindowEndHour': practiceWindowEndHour,
          'practiceWindowEndMinute': practiceWindowEndMinute,
        },
      };
}
