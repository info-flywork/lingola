import '../../core/auth/api_client.dart';

enum StreakDayVisualState { done, today, idle }

class StreakDayDto {
  const StreakDayDto({
    required this.date,
    required this.label,
    required this.state,
    this.worked = false,
  });

  final String date;
  final String label;
  final StreakDayVisualState state;
  final bool worked;

  factory StreakDayDto.fromJson(Map<String, dynamic> json) {
    return StreakDayDto(
      date: json['date'] as String? ?? '',
      label: json['label'] as String? ?? '',
      state: _parseState(json['state'] as String?),
      worked: json['worked'] == true,
    );
  }

  static StreakDayVisualState _parseState(String? raw) {
    switch (raw) {
      case 'done':
        return StreakDayVisualState.done;
      case 'today':
        return StreakDayVisualState.today;
      default:
        return StreakDayVisualState.idle;
    }
  }
}

class StreakSummaryDto {
  const StreakSummaryDto({
    required this.currentStreak,
    required this.longestStreak,
    required this.todayWorked,
    required this.days,
  });

  final int currentStreak;
  final int longestStreak;
  final bool todayWorked;
  final List<StreakDayDto> days;

  /// Bugün henüz çalışılmadıysa ve streak < 3 ise gri; alev backend'den gelir.
  factory StreakSummaryDto.empty() {
    const labels = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
    final days = List.generate(7, (i) {
      return StreakDayDto(
        date: '',
        label: labels[i],
        state: StreakDayVisualState.idle,
      );
    });
    return StreakSummaryDto(
      currentStreak: 0,
      longestStreak: 0,
      todayWorked: false,
      days: days,
    );
  }

  factory StreakSummaryDto.fromJson(Map<String, dynamic> json) {
    final list = json['days'];
    return StreakSummaryDto(
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      todayWorked: json['todayWorked'] == true,
      days: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map(StreakDayDto.fromJson)
              .toList()
          : const [],
    );
  }
}

abstract final class StreakApiService {
  static Future<StreakSummaryDto> fetch() async {
    final json = await ApiClient.get('/auth/me/streak', auth: true);
    return StreakSummaryDto.fromJson(json);
  }
}
