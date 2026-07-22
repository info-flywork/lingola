/// Ders yolu müfredatı — başlıklar slang i18n üzerinden gelir.
class LessonLevelData {
  const LessonLevelData({required this.id, required this.iconKeys});
  final String id;
  final List<String> iconKeys;
}

abstract final class LessonCurriculum {
  static const levels = <LessonLevelData>[
    LessonLevelData(id: 'a1', iconKeys: ['handshake', 'wave', 'briefcase', 'chair', 'alarm', 'fruit', 'bulb', 'family', 'generic', 'home', 'home', 'food', 'sport', 'star', 'food', 'food', 'heart', 'sport', 'globe', 'generic', 'generic', 'sport', 'map', 'shop', 'shop', 'clock', 'map', 'shop', 'chat', 'map', 'generic', 'map']),
    LessonLevelData(id: 'a2', iconKeys: ['generic', 'home', 'home', 'food', 'sport', 'star', 'food', 'food', 'heart', 'sport', 'globe', 'generic', 'generic', 'sport', 'map', 'shop', 'shop', 'clock', 'map', 'shop', 'chat', 'map', 'generic', 'map', 'family', 'family', 'family', 'gift', 'city', 'city', 'home', 'clock', 'alarm', 'sport', 'food', 'shop', 'plane', 'plane', 'chat', 'shop', 'shop', 'bulb', 'star', 'shop', 'chat', 'food', 'food', 'map', 'plane', 'plane', 'city', 'plane', 'home']),
    LessonLevelData(id: 'b1', iconKeys: ['heart', 'sport', 'globe', 'generic', 'generic', 'sport', 'map', 'shop', 'shop', 'clock', 'map', 'shop', 'chat', 'map', 'generic', 'map', 'family', 'family', 'family', 'gift', 'city', 'city', 'home', 'clock', 'alarm', 'sport', 'food', 'shop', 'plane', 'plane', 'chat', 'shop', 'shop', 'bulb', 'star', 'shop', 'chat', 'food', 'food', 'map', 'plane', 'plane', 'city', 'plane', 'home', 'heart', 'heart', 'book', 'music', 'sport', 'sport', 'chat', 'chat', 'chat', 'plane', 'book', 'book']),
    LessonLevelData(id: 'b2', iconKeys: ['shop', 'clock', 'map', 'shop', 'chat', 'map', 'generic', 'map', 'family', 'family', 'family', 'gift', 'city', 'city', 'home', 'clock', 'alarm', 'sport', 'food', 'shop', 'plane', 'plane', 'chat', 'shop']),
    LessonLevelData(id: 'c1', iconKeys: ['alarm', 'fruit', 'bulb', 'family', 'generic', 'home', 'home', 'food', 'sport', 'star', 'food', 'food', 'heart', 'sport', 'globe', 'generic', 'generic', 'sport', 'map', 'shop', 'shop', 'clock', 'map', 'shop']),
    LessonLevelData(id: 'c2', iconKeys: ['sport', 'star', 'food', 'food', 'heart', 'sport', 'globe', 'generic', 'generic', 'sport', 'map', 'shop', 'shop', 'clock', 'map', 'shop', 'chat', 'map', 'generic', 'map', 'family', 'family', 'family', 'gift']),
  ];
}
