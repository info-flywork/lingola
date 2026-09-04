import 'package:flutter/material.dart';

/// Onboarding: günün hangi diliminde pratik yapılacağı.
class PracticeTimeOfDay {
  PracticeTimeOfDay._();

  static const values = ['morning', 'afternoon', 'evening', 'flexible'];
  static const defaultValue = 'afternoon';

  static const iconAssets = [
    'assets/images/onboarding/whichTimes/morning.png',
    'assets/images/onboarding/whichTimes/afternoon.png',
    'assets/images/onboarding/whichTimes/night.png',
    'assets/images/onboarding/whichTimes/flexible.png',
  ];

  /// Hatırlatma saati (varsayılan dakika: 0) — aralık başlangıcı.
  static const reminderHours = [6, 12, 18, 9];

  static String normalize(String? value) {
    final raw = value?.trim().toLowerCase();
    if (raw == null || raw.isEmpty) return defaultValue;
    return values.contains(raw) ? raw : defaultValue;
  }

  static int indexOf(String? value) {
    final index = values.indexOf(normalize(value));
    return index >= 0 ? index : values.indexOf(defaultValue);
  }

  static int reminderHourFor(String? value) => reminderHours[indexOf(value)];

  static String iconFor(String? value) => iconAssets[indexOf(value)];

  /// Seçilen dilime göre varsayılan pratik aralığı.
  static (TimeOfDay start, TimeOfDay end) defaultRange(String? value) {
    switch (normalize(value)) {
      case 'morning':
        return (
          const TimeOfDay(hour: 6, minute: 0),
          const TimeOfDay(hour: 12, minute: 0),
        );
      case 'afternoon':
        return (
          const TimeOfDay(hour: 12, minute: 0),
          const TimeOfDay(hour: 18, minute: 0),
        );
      case 'evening':
        return (
          const TimeOfDay(hour: 18, minute: 0),
          const TimeOfDay(hour: 23, minute: 0),
        );
      case 'flexible':
      default:
        return (
          const TimeOfDay(hour: 6, minute: 0),
          const TimeOfDay(hour: 22, minute: 0),
        );
    }
  }
}
