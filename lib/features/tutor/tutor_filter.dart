import '../../core/constants/app_assets.dart';

/// Tutors ekranı filtre durumu — ülke bayrağı asset yolları + tag key'leri.
class TutorFilter {
  const TutorFilter({
    this.flagAssets = const {},
    this.tagKeys = const {},
  });

  final Set<String> flagAssets;
  final Set<String> tagKeys;

  static const empty = TutorFilter();

  bool get isActive => flagAssets.isNotEmpty || tagKeys.isNotEmpty;

  TutorFilter copyWith({
    Set<String>? flagAssets,
    Set<String>? tagKeys,
  }) {
    return TutorFilter(
      flagAssets: flagAssets ?? this.flagAssets,
      tagKeys: tagKeys ?? this.tagKeys,
    );
  }

  bool matches({
    required List<String> tutorTagKeys,
    String? tutorFlagAsset,
  }) {
    if (!isActive) return true;
    final countryOk =
        flagAssets.isEmpty || _flagMatches(tutorFlagAsset, flagAssets);
    final tagOk =
        tagKeys.isEmpty || tutorTagKeys.any(tagKeys.contains);
    return countryOk && tagOk;
  }

  static bool _flagMatches(String? tutorFlag, Set<String> selected) {
    final normalized = _normalizeFlag(tutorFlag);
    if (normalized == null) return false;
    for (final flag in selected) {
      if (_normalizeFlag(flag) == normalized) return true;
    }
    return false;
  }

  static String? _normalizeFlag(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) return null;
    final parts = value.split('/');
    return parts.isEmpty ? value : parts.last;
  }
}

class TutorCountryOption {
  const TutorCountryOption({
    required this.flagAsset,
    required this.emoji,
  });

  final String flagAsset;
  final String emoji;
}

abstract final class TutorFilterOptions {
  static const primaryCountries = <TutorCountryOption>[
    TutorCountryOption(flagAsset: AppAssets.flagEn, emoji: '🇬🇧'),
    TutorCountryOption(flagAsset: AppAssets.flagDe, emoji: '🇩🇪'),
    TutorCountryOption(flagAsset: AppAssets.flagIt, emoji: '🇮🇹'),
    TutorCountryOption(flagAsset: AppAssets.flagFr, emoji: '🇫🇷'),
  ];

  static const extraCountries = <TutorCountryOption>[
    TutorCountryOption(flagAsset: AppAssets.flagJp, emoji: '🇯🇵'),
    TutorCountryOption(flagAsset: AppAssets.flagEs, emoji: '🇪🇸'),
    TutorCountryOption(flagAsset: AppAssets.flagPt, emoji: '🇵🇹'),
    TutorCountryOption(flagAsset: AppAssets.flagHi, emoji: '🇮🇳'),
    TutorCountryOption(flagAsset: AppAssets.flagCn, emoji: '🇨🇳'),
    TutorCountryOption(flagAsset: AppAssets.flagRu, emoji: '🇷🇺'),
    TutorCountryOption(flagAsset: AppAssets.flagTr, emoji: '🇹🇷'),
  ];

  static const focusTagKeys = <String>[
    'calm',
    'organized',
    'patient',
    'relaxed',
    'adaptive',
    'methodical',
    'attentive',
  ];

  static String tagLabel(dynamic tags, String key) {
    return switch (key) {
      'adaptive' => tags.adaptive as String,
      'calm' => tags.calm as String,
      'patient' => tags.patient as String,
      'organized' => tags.organized as String,
      'relaxed' => tags.relaxed as String,
      'methodical' => tags.methodical as String,
      'attentive' => tags.attentive as String,
      _ => key,
    };
  }
}
