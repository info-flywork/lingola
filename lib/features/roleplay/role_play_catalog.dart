/// Role-play kategori + zorluk sabitleri (FE).
abstract final class RolePlayCatalog {
  static const categoryKeys = <String>[
    'shopping',
    'flirting',
    'lifeInTheUs',
    'freeDiscussion',
    'jobInterview',
    'dailyInteractions',
    'socialDynamics',
    'restaurant',
    'travel',
  ];

  static const difficultyKeys = <String>[
    'beginner',
    'easy',
    'medium',
    'hard',
  ];

  static const lingolaRolePlay = 'lingolaRolePlay';

  static String baseId(String scenarioId) {
    return scenarioId.replaceFirst(RegExp(r'-(easy|medium|hard)$', caseSensitive: false), '');
  }

  /// Her taban senaryodan bir temsilci (progress > beginner > ilk).
  static List<RolePlayScenarioItem> uniqueByBase(
    List<RolePlayScenarioItem> items,
  ) {
    if (items.isEmpty) return const [];
    final order = <String>[];
    final best = <String, RolePlayScenarioItem>{};
    for (final item in items) {
      final base = baseId(item.id);
      if (!order.contains(base)) order.add(base);
      final existing = best[base];
      if (existing == null) {
        best[base] = item;
        continue;
      }
      final itemProgress = item.progress != null && item.progress! > 0.001;
      final existingProgress =
          existing.progress != null && existing.progress! > 0.001;
      if (itemProgress && !existingProgress) {
        best[base] = item;
      } else if (!existingProgress &&
          item.levelKey == 'beginner' &&
          existing.levelKey != 'beginner') {
        best[base] = item;
      }
    }
    return [for (final id in order) best[id]!];
  }

  static String categoryLabel(dynamic page, String key) {
    return switch (key) {
      'shopping' => page.shopping as String,
      'flirting' => page.flirting as String,
      'lifeInTheUs' => page.lifeInTheUs as String,
      'freeDiscussion' => page.freeDiscussion as String,
      'jobInterview' => page.jobInterview as String,
      'dailyInteractions' => page.dailyInteractions as String,
      'socialDynamics' => page.socialDynamics as String,
      'restaurant' => page.restaurant as String,
      'travel' => page.travel as String,
      'lingolaRolePlay' => page.lingolaRolePlay as String,
      'business' => page.business as String,
      _ => key,
    };
  }

  static String levelLabel(dynamic page, String levelKey) {
    return switch (levelKey) {
      'easy' => page.easy as String,
      'medium' => page.medium as String,
      'hard' => page.hard as String,
      'intermediate' => page.intermediate as String,
      'beginnerIntermediate' => page.beginnerIntermediate as String,
      _ => page.beginner as String,
    };
  }
}

class RolePlayStaticMeta {
  const RolePlayStaticMeta({
    required this.id,
    required this.minutes,
    required this.categoryKey,
    this.titleKey,
  });

  final String id;
  final String? titleKey;
  final int minutes;
  final String categoryKey;
}

/// Taban senaryolar — her biri 4 zorlukta çoğaltılır.
const rolePlayBaseCatalog = <RolePlayStaticMeta>[
  RolePlayStaticMeta(id: 'coffee', minutes: 8, categoryKey: 'shopping'),
  RolePlayStaticMeta(id: 'shoppingClothes', minutes: 6, categoryKey: 'shopping'),
  RolePlayStaticMeta(id: 'flirtingMeet', minutes: 7, categoryKey: 'flirting'),
  RolePlayStaticMeta(id: 'directions', minutes: 8, categoryKey: 'lifeInTheUs'),
  RolePlayStaticMeta(id: 'takingTaxi', minutes: 6, categoryKey: 'lifeInTheUs'),
  RolePlayStaticMeta(id: 'missedTrain', minutes: 5, categoryKey: 'lifeInTheUs'),
  RolePlayStaticMeta(id: 'freeTalkHobby', minutes: 7, categoryKey: 'freeDiscussion'),
  RolePlayStaticMeta(id: 'interview', minutes: 8, categoryKey: 'jobInterview'),
  RolePlayStaticMeta(id: 'doctorAppointment', minutes: 6, categoryKey: 'dailyInteractions'),
  RolePlayStaticMeta(id: 'birthdayParty', minutes: 7, categoryKey: 'dailyInteractions'),
  RolePlayStaticMeta(id: 'rentingApartment', minutes: 7, categoryKey: 'socialDynamics'),
  RolePlayStaticMeta(id: 'restaurantReservation', minutes: 6, categoryKey: 'restaurant'),
  RolePlayStaticMeta(id: 'flightAttendant', minutes: 6, categoryKey: 'travel'),
  RolePlayStaticMeta(id: 'trainTicket', minutes: 6, categoryKey: 'travel'),
];

/// Taban senaryo → zorluk başına farklı i18n titleKey.
/// beginner her zaman base id; easy/medium/hard ayrı senaryo metinleri.
const rolePlayVariantTitleKeys = <String, Map<String, String>>{
  'coffee': {
    'beginner': 'coffee',
    'easy': 'coffeeQueue',
    'medium': 'coffeeRecommendation',
    'hard': 'coffeeWrongOrder',
  },
  'shoppingClothes': {
    'beginner': 'shoppingClothes',
    'easy': 'shoppingFittingRoom',
    'medium': 'shoppingReturn',
    'hard': 'shoppingDiscount',
  },
  'flirtingMeet': {
    'beginner': 'flirtingMeet',
    'easy': 'flirtingCompliment',
    'medium': 'flirtingAskOut',
    'hard': 'flirtingAwkward',
  },
  'directions': {
    'beginner': 'directions',
    'easy': 'directionsLost',
    'medium': 'directionsTransit',
    'hard': 'directionsWrongWay',
  },
  'takingTaxi': {
    'beginner': 'takingTaxi',
    'easy': 'taxiFare',
    'medium': 'taxiTraffic',
    'hard': 'taxiComplaint',
  },
  'missedTrain': {
    'beginner': 'missedTrain',
    'easy': 'missedTrainNext',
    'medium': 'missedTrainTicket',
    'hard': 'missedTrainRefund',
  },
  'freeTalkHobby': {
    'beginner': 'freeTalkHobby',
    'easy': 'freeTalkWeekend',
    'medium': 'freeTalkMovies',
    'hard': 'freeTalkDisagree',
  },
  'interview': {
    'beginner': 'interview',
    'easy': 'interviewStrengths',
    'medium': 'interviewExperience',
    'hard': 'interviewSalary',
  },
  'doctorAppointment': {
    'beginner': 'doctorAppointment',
    'easy': 'doctorSymptoms',
    'medium': 'doctorPrescription',
    'hard': 'doctorFollowUp',
  },
  'birthdayParty': {
    'beginner': 'birthdayParty',
    'easy': 'birthdayInvite',
    'medium': 'birthdayGifts',
    'hard': 'birthdaySurprise',
  },
  'rentingApartment': {
    'beginner': 'rentingApartment',
    'easy': 'rentingApartmentTour',
    'medium': 'rentingApartmentAgent',
    'hard': 'rentingApartmentNegotiate',
  },
  'restaurantReservation': {
    'beginner': 'restaurantReservation',
    'easy': 'restaurantChange',
    'medium': 'restaurantAllergy',
    'hard': 'restaurantComplaint',
  },
  'flightAttendant': {
    'beginner': 'flightAttendant',
    'easy': 'flightSeat',
    'medium': 'flightSpecialMeal',
    'hard': 'flightDelay',
  },
  'trainTicket': {
    'beginner': 'trainTicket',
    'easy': 'trainTicketChange',
    'medium': 'trainTicketPlatform',
    'hard': 'trainTicketUpgrade',
  },
};

List<({String id, String titleKey, int minutes, String categoryKey, String levelKey})>
    expandRolePlayCatalog() {
  const diffs = [
    (key: 'beginner', suffix: '', delta: 0),
    (key: 'easy', suffix: '-easy', delta: 0),
    (key: 'medium', suffix: '-medium', delta: 1),
    (key: 'hard', suffix: '-hard', delta: 2),
  ];
  return [
    for (final base in rolePlayBaseCatalog)
      for (final d in diffs)
        (
          id: '${base.id}${d.suffix}',
          titleKey: _variantTitleKey(base, d.key),
          minutes: base.minutes + d.delta,
          categoryKey: base.categoryKey,
          levelKey: d.key,
        ),
  ];
}

String _variantTitleKey(RolePlayStaticMeta base, String levelKey) {
  final map = rolePlayVariantTitleKeys[base.id];
  if (map != null) {
    return map[levelKey] ?? base.titleKey ?? base.id;
  }
  return base.titleKey ?? base.id;
}

/// scenarioId (coffee-easy) → i18n titleKey (coffeeQueue).
String rolePlayTitleKeyForScenarioId(String scenarioId) {
  final base = RolePlayCatalog.baseId(scenarioId);
  final level = switch (scenarioId) {
    final s when s.endsWith('-hard') => 'hard',
    final s when s.endsWith('-medium') => 'medium',
    final s when s.endsWith('-easy') => 'easy',
    _ => 'beginner',
  };
  return rolePlayVariantTitleKeys[base]?[level] ?? base;
}

/// Ortak senaryo modeli (liste + kategori ekranı).
class RolePlayScenarioItem {
  const RolePlayScenarioItem({
    required this.id,
    required this.title,
    required this.image,
    required this.minutes,
    required this.level,
    required this.levelKey,
    required this.screenplay,
    required this.categoryKey,
    this.progress,
    this.sessionId,
    this.section,
    this.isCustom = false,
    this.openingMessage,
  });

  final String id;
  final String title;
  final String image;
  final double? progress;
  final String? sessionId;
  final int minutes;
  final String level;
  final String levelKey;
  final String screenplay;
  final String categoryKey;
  final String? section;
  final bool isCustom;
  final String? openingMessage;
}
