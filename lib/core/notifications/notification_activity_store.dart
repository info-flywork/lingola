import 'package:shared_preferences/shared_preferences.dart';

import '../../features/streak/streak_api_service.dart';
import '../practice/practice_service.dart';

/// Yerel bildirimler için son aktivite özeti (ders, quiz, kelime).
class NotificationActivitySnapshot {
  const NotificationActivitySnapshot({
    required this.lessonToday,
    required this.quizWithin8Hours,
    required this.recentWordsLearned,
    required this.savedWordsCount,
    required this.currentStreak,
    required this.streakAtRisk,
  });

  final bool lessonToday;
  final bool quizWithin8Hours;
  final int recentWordsLearned;
  final int savedWordsCount;
  final int currentStreak;
  final bool streakAtRisk;
}

abstract final class NotificationActivityStore {
  static const _lastLessonMs = 'notif_last_lesson_ms';
  static const _lastQuizMs = 'notif_last_quiz_ms';
  static const _wordsLearnedToday = 'notif_words_learned_today';
  static const _wordsLearnedDay = 'notif_words_learned_day';

  static Future<void> recordLesson() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastLessonMs, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<void> recordQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastQuizMs, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<void> recordWordLearned() async {
    final prefs = await SharedPreferences.getInstance();
    final today = _dayKey(DateTime.now());
    final storedDay = prefs.getString(_wordsLearnedDay);
    var count = prefs.getInt(_wordsLearnedToday) ?? 0;
    if (storedDay != today) {
      count = 0;
    }
    await prefs.setString(_wordsLearnedDay, today);
    await prefs.setInt(_wordsLearnedToday, count + 1);
  }

  static Future<NotificationActivitySnapshot> buildSnapshot() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final lessonMs = prefs.getInt(_lastLessonMs);
    final quizMs = prefs.getInt(_lastQuizMs);
    final today = _dayKey(now);

    var wordsToday = prefs.getInt(_wordsLearnedToday) ?? 0;
    if (prefs.getString(_wordsLearnedDay) != today) {
      wordsToday = 0;
    }

    var savedCount = 0;
    var currentStreak = 0;
    var todayWorked = false;
    try {
      savedCount = await PracticeService.fetchSavedCount();
    } catch (_) {}
    try {
      final streak = await StreakApiService.fetch();
      currentStreak = streak.currentStreak;
      todayWorked = streak.todayWorked;
    } catch (_) {}

    final lessonToday =
        lessonMs != null && _isSameDay(DateTime.fromMillisecondsSinceEpoch(lessonMs), now);
    final quizWithin8Hours = quizMs != null &&
        now.difference(DateTime.fromMillisecondsSinceEpoch(quizMs)) <
            const Duration(hours: 8);

    return NotificationActivitySnapshot(
      lessonToday: lessonToday,
      quizWithin8Hours: quizWithin8Hours,
      recentWordsLearned: wordsToday,
      savedWordsCount: savedCount,
      currentStreak: currentStreak,
      streakAtRisk: !todayWorked && currentStreak > 0,
    );
  }

  static String _dayKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';

  static bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
