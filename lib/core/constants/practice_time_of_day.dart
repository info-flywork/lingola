import 'dart:math' as math;

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

  static bool isFlexible(String? value) => normalize(value) == 'flexible';

  /// Seçilen dilime göre varsayılan pratik aralığı (Esneğim sheet).
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

  /// Preset (Sabah/Öğleden sonra/Akşam) için tek somut saat.
  /// Aralık: morning [06,12), afternoon [12,18), evening [18,23).
  /// Çağıran taraf sonucu state'te saklamalı — render'da yeniden üretme.
  static TimeOfDay randomConcreteTime(
    String? value, {
    math.Random? random,
  }) {
    final r = random ?? math.Random();
    final (startMin, spanMin) = switch (normalize(value)) {
      'morning' => (6 * 60, 6 * 60), // 06:00 .. 11:59
      'afternoon' => (12 * 60, 6 * 60), // 12:00 .. 17:59
      'evening' => (18 * 60, 5 * 60), // 18:00 .. 22:59
      _ => (12 * 60, 6 * 60),
    };
    final total = startMin + r.nextInt(spanMin);
    return TimeOfDay(hour: total ~/ 60, minute: total % 60);
  }
}
