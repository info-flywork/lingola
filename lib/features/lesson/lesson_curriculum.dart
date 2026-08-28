/// Ders yolu müfredatı — ikon yolları + seviye kimlikleri.
///
/// A1: `assets/learningPath/a1/*` (ders adı ↔ dosya adı).
/// A2: `assets/learningPath/a2/_ordered/00..52.svg` (export sırası = ders sırası).
/// B1: `assets/learningPath/b1/*` + eksikler için lessons/icons.
/// B2: `assets/learningPath/b2/*` (ders adı ↔ dosya adı).
/// C1/C2: `assets/learningPath/c1|c2/*` (ders adı ↔ dosya adı).
class LessonLevelData {
  const LessonLevelData({required this.id, required this.iconAssets});

  final String id;
  final List<String> iconAssets;
}

abstract final class LessonCurriculum {
  static const _legacy = 'assets/images/lessons/icons';
  static const _a1 = 'assets/learningPath/a1';
  static const _a2 = 'assets/learningPath/a2/_ordered';
  static const _b1 = 'assets/learningPath/b1';
  static const _b2 = 'assets/learningPath/b2';
  static const _c1 = 'assets/learningPath/c1';
  static const _c2 = 'assets/learningPath/c2';

  /// A1 — 32 ders; `assets/learningPath/a1/*` isim eşleştirmesi.
  static const a1Icons = <String>[
    '$_a1/greetings.svg', // Greetings
    '$_a1/introduction.svg', // Introductions I
    '$_a1/jobs.svg', // Jobs
    '$_a1/favoriteroom.svg', // A Favorite Room
    '$_a1/dailyroutine.svg', // Daily Routine
    '$_a1/fruits.svg', // Fruits
    '$_a1/advice1.svg', // Advice 1
    '$_a1/family1 1.svg', // Family 1
    '$_a1/everydaythings.svg', // Everyday things
    '$_a1/hometown 1.svg', // Hometown
    '$_a1/house.svg', // House
    '$_a1/food-preferences 1.svg', // Food preferences
    '$_a1/hobbies1 1.svg', // Hobbies 1
    '$_a1/successful-people 1.svg', // Successful people
    '$_a1/food-and-drink 1.svg', // Food and drinks
    '$_a1/ordering-at-restaurant 1.svg', // Ordering at a restaurant
    '$_a1/pets 1.svg', // Pets
    '$_a1/health-fitness 1.svg', // Health and fitness
    '$_a1/weather 1.svg', // Weather
    '$_a1/new-lifestyle 1.svg', // New lifestyle
    '$_a1/getting-better 1.svg', // Getting better
    '$_a1/hobbies2 1.svg', // Hobbies 2
    '$_a1/questions-about-places 1.svg', // Questions about places
    '$_a1/Possession 1.svg', // Possession
    '$_a1/shopping1 1.svg', // Shopping 1
    '$_a1/telling-the-time 1.svg', // Telling the time
    '$_a1/directions.svg', // Directions 1
    '$_a1/shopping2 1.svg', // Shopping 2
    '$_a1/Getting to know you 1.svg', // Getting to know you
    '$_a1/placesofobjects 1.svg', // Places of objects
    '$_a1/appearances 1.svg', // Appearances
    '$_a1/directions2.svg', // Directions 2
  ];

  /// B1 — 57 ders; learningPath/b1 + 3 legacy (projede zaten vardı).
  static const b1Icons = <String>[
    '$_b1/culturaltraditions.svg', // Cultural traditions
    '$_b1/celebrities.svg', // Celebrities
    '$_b1/artandcreativiy.svg', // Art and creativity
    '$_b1/futureplans.svg', // Future plans
    '$_b1/planningevents.svg', // Planning events
    '$_b1/goalsand.svg', // Goals and plans
    '$_b1/historicalevents.svg', // Historical events
    '$_b1/technology.svg', // Technology
    '$_b1/neverever.svg', // Never ever
    '$_b1/whatison.svg', // What is on
    '$_b1/dreamvacation.svg', // Dream vacation
    '$_b1/socialmedia.svg', // Social media
    '$_b1/books 1.svg', // Book recommendations
    '$_b1/oneofthosedays.svg', // One of those days
    '$_b1/speacialphotos.svg', // Special photos
    '$_b1/personalachivements.svg', // Personal achievements
    '$_b1/favoritemovies.svg', // Favourite movies
    '$_b1/newflash.svg', // News flash
    '$_b1/happiness.svg', // Happiness
    '$_b1/abusyweek.svg', // A busy week
    '$_b1/whereIgrewUp.svg', // Where I grew up
    '$_b1/schooldays.svg', // School days
    '$_b1/profiles.svg', // Profiles
    '$_b1/lifemaps.svg', // Life maps
    '$_b1/everyday.svg', // Everyday
    '$_b1/whatisnext.svg', // What is next
    '$_b1/suggestionMaking.svg', // Suggestion making
    '$_legacy/clock.svg', // What happened (projede vardı)
    '$_b1/memories.svg', // Memories
    '$_b1/cultureShock.svg', // Culture shock
    '$_b1/interestPhrases.svg', // Interest phrases
    '$_b1/business-meeting 1.svg', // Job interviews
    '$_b1/task-checklist 1.svg', // Bucket lists
    '$_b1/mykindofhome.svg', // My kind of town
    '$_b1/internetGeneration.svg', // The internet generation
    '$_b1/brand 1.svg', // Popular brands
    '$_b1/opinionPhrases.svg', // Opinion phrases
    '$_b1/howdoesItLook.svg', // How does it look
    '$_b1/couch 1.svg', // Living space
    '$_b1/eatingWell.svg', // Eating well
    '$_b1/unusualHobbies.svg', // Unusual hobbies
    '$_b1/difficultChoice.svg', // A difficult choice
    '$_b1/takeActions.svg', // Take action
    '$_b1/newSkills.svg', // New skills
    '$_b1/makingComplaint.svg', // Making a complaint
    '$_b1/education.svg', // Education
    '$_b1/greenCities.svg', // Green cities
    '$_legacy/briefcase.svg', // What is in a job (projede vardı)
    '$_b1/user-hard-work 1.svg', // Personal challenges
    '$_b1/interviewPhrases.svg', // Interview phrases
    '$_legacy/handshake.svg', // Polite endings (projede vardı)
    '$_b1/headlineNews.svg', // Headline news
    '$_b1/smallChanges.svg', // Small changes
    '$_b1/apologiesExcuses.svg', // Apologies excuses
    '$_b1/phone-call 1.svg', // Phone etiquette
    '$_b1/sorryToInterrupt.svg', // Sorry to interrupt…
    '$_b1/complaintResponses.svg', // Complaint responses
  ];

  /// B2 — 24 ders; `assets/learningPath/b2/*` isim eşleştirmesi.
  static const b2Icons = <String>[
    '$_b2/personalities.svg', // Personalities
    '$_b2/greatRivals.svg', // Great leads
    '$_b2/healthyLifestyle.svg', // Healthy lifestyle
    '$_b2/search 1.svg', // What is the truth?
    '$_b2/personalGrowth.svg', // Personal growth
    '$_b2/explanationPhrases.svg', // Speaking out
    '$_b2/runningWild.svg', // Acting out?
    '$_b2/remember.svg', // I remember...
    '$_b2/foodFeedback.svg', // Social feedback
    '$_b2/crimeScreen.svg', // Crime scene
    '$_b2/bubleTrouble.svg', // Polite trouble
    '$_b2/conflictResolution.svg', // Conflict resolution
    '$_b2/heart-half-stroke 1.svg', // Love it or loathe it?
    '$_b2/bigissues.svg', // Environmental issues
    '$_b2/wecanWorkout.svg', // We can work it out
    '$_b2/mysteriousAndCrime.svg', // Mysteries and crimes
    '$_b2/whatIf.svg', // Possible futures
    '$_b2/plan-strategy 1.svg', // Business plans
    '$_b2/meetingDecisions.svg', // Meeting decisions
    '$_b2/itSoPredictable.svg', // It's so predictable...
    '$_b2/dutiesResponsibilities.svg', // On the job
    '$_b2/scienceAndTechnology.svg', // Science and technology
    '$_b2/timeManagement.svg', // Time management
    '$_b2/humanRights.svg', // Human rights
  ];


  /// C1 — 24 ders; `assets/learningPath/c1/*` açıklama eşleştirmesi.
  static const c1Icons = <String>[
    '$_c1/culturalNorms.svg', // Cultural norms
    '$_c1/socialMedia.svg', // Social media influence
    '$_c1/career-path 1.svg', // Career choices
    '$_c1/academicPerformance.svg', // Accelerate performance
    '$_c1/inventions.svg', // Inventions
    '$_c1/timeTravel.svg', // Time travel
    '$_c1/possessions.svg', // Possessions
    '$_c1/jobSkilss.svg', // Job skills
    '$_c1/historicalChanges.svg', // Historical changes
    '$_c1/reviewWriting.svg', // Review writing
    '$_c1/mysterious.svg', // Mysteries
    '$_c1/strangeTherious.svg', // Strange theories
    '$_c1/celebrity.svg', // Celebrity
    '$_c1/globalPolitics.svg', // Global politics
    '$_c1/productIssues.svg', // Product boom
    '$_c1/willIbeHappy.svg', // Will be happy?
    '$_c1/maybeLater.svg', // Maybe later...
    '$_c1/newSolutions.svg', // New solutions
    '$_c1/contextualinference.svg', // Contextual influence
    '$_c1/giveItaGo.svg', // A lost logo
    '$_c1/kindActs.svg', // Kind acts
    '$_c1/whataMovie.svg', // What a movie
    '$_c1/howAnnoying.svg', // How annoying
    '$_c1/onTheMend.svg', // In the news
  ];

  /// C2 — 24 ders; `assets/learningPath/c2/*` isim eşleştirmesi.
  static const c2Icons = <String>[
    '$_c2/globalisation.svg', // Globalization
    '$_c2/naturalDisaster.svg', // Natural disasters
    '$_c2/reactingToInformation.svg', // Reacting to information
    '$_c2/workLifeBalance.svg', // Work-life balance
    '$_c2/remoteWork.svg', // Remote work
    '$_c2/familyIssues.svg', // Family issues
    '$_c2/basicHumanAnatomy.svg', // Basic human anatomy
    '$_c2/healthPredictions.svg', // Health predictions
    '$_c2/healthcareAccess.svg', // Healthcare access
    '$_c2/globalTravel.svg', // Global travel experience
    '$_c2/superPowers.svg', // Superpowers
    '$_c2/teamBuilding.svg', // Team building
    '$_c2/psychology 1.svg', // Biofluorescence
    '$_c2/dystopias.svg', // Dilemmas
    '$_c2/socialEnthusiasm.svg', // Social enthusiasm
    '$_c2/changes.svg', // Changes
    '$_c2/work.svg', // Work, work, work
    '$_c2/localIssues.svg', // Local issues
    '$_c2/problems.svg', // Problems, problems
    '$_c2/factOrFiction.svg', // Fact or fiction?
    '$_c2/journeys.svg', // Sightseeing
    '$_c2/volunteer-vest 1.svg', // Volunteering
    '$_c2/eye 2.svg', // The mind's eye
    '$_c2/mediaconsumption.svg', // Media consumption
  ];

  static List<String> _a2Icons() => [
        for (var i = 0; i < 53; i++)
          '$_a2/${i.toString().padLeft(2, '0')}.svg',
      ];

  static const slugsByLevel = <String, List<String>>{
    'a1': <String>[
      'a1-greetings',
      'a1-introductions-i',
      'a1-jobs',
      'a1-a-favorite-room',
      'a1-daily-routine',
      'a1-fruits',
      'a1-advice-1',
      'a1-family-1',
      'a1-everyday-things',
      'a1-hometown',
      'a1-house',
      'a1-food-preferences',
      'a1-hobbies-1',
      'a1-successful-people',
      'a1-food-and-drinks',
      'a1-ordering-at-a-restaurant',
      'a1-pets',
      'a1-health-and-fitness',
      'a1-weather',
      'a1-new-lifestyle',
      'a1-getting-better',
      'a1-hobbies-2',
      'a1-questions-about-places',
      'a1-possession',
      'a1-shopping-1',
      'a1-telling-the-time',
      'a1-directions-1',
      'a1-shopping-2',
      'a1-getting-to-know-you',
      'a1-places-of-objects',
      'a1-appearances',
      'a1-directions-2',
    ],
    'a2': <String>[
      'a2-family-2',
      'a2-people-and-places',
      'a2-family-3',
      'a2-describing-objects',
      'a2-city',
      'a2-the-building-project',
      'a2-home-sweet-home',
      'a2-what-time-is-it',
      'a2-daily-routine-2',
      'a2-free-time',
      'a2-food-and-nutrition',
      'a2-shopping-and-consumer',
      'a2-holidays',
      'a2-weekend-plans',
      'a2-formal-or-casual',
      'a2-fashion',
      'a2-shopping-3',
      'a2-advice-2',
      'a2-you-can-do-it',
      'a2-shopping-4',
      'a2-small-talk',
      'a2-one-latte-please',
      'a2-food',
      'a2-getting-around',
      'a2-ready-for-a-trip',
      'a2-travel-1',
      'a2-urban-escapes',
      'a2-travel-2',
      'a2-a-place-to-stay',
      'a2-so-exciting',
      'a2-the-right-person',
      'a2-school',
      'a2-music-preferences',
      'a2-sports',
      'a2-rules-of-the-race',
      'a2-leave-a-message',
      'a2-requests',
      'a2-invitations',
      'a2-travel-experiences',
      'a2-past-tense-1',
      'a2-past-tense-2',
      'a2-past-tense-3',
      'a2-questions-about-the-past',
      'a2-you-are-never-too-old',
      'a2-childhood-memories',
      'a2-compliments',
      'a2-excuses',
      'a2-its-so-annoying',
      'a2-a-digital-world',
      'a2-work-life',
      'a2-i-did-not-get-that',
      'a2-save-or-spend',
      'a2-say-sorry',
    ],
    'b1': <String>[
      'b1-cultural-traditions',
      'b1-celebrities',
      'b1-art-and-creativity',
      'b1-future-plans',
      'b1-planning-events',
      'b1-goals-and-plans',
      'b1-historical-events',
      'b1-technology',
      'b1-never-ever',
      'b1-what-is-on',
      'b1-dream-vacation',
      'b1-social-media',
      'b1-book-recommendations',
      'b1-one-of-those-days',
      'b1-special-photos',
      'b1-personal-achievements',
      'b1-favourite-movies',
      'b1-news-flash',
      'b1-happiness',
      'b1-a-busy-week',
      'b1-where-i-grew-up',
      'b1-school-days',
      'b1-profiles',
      'b1-life-maps',
      'b1-everyday',
      'b1-what-is-next',
      'b1-suggestion-making',
      'b1-what-happened',
      'b1-memories',
      'b1-culture-shock',
      'b1-interest-phrases',
      'b1-job-interviews',
      'b1-bucket-lists',
      'b1-my-kind-of-town',
      'b1-the-internet-generation',
      'b1-popular-brands',
      'b1-opinion-phrases',
      'b1-how-does-it-look',
      'b1-living-space',
      'b1-eating-well',
      'b1-unusual-hobbies',
      'b1-a-difficult-choice',
      'b1-take-action',
      'b1-new-skills',
      'b1-making-a-complaint',
      'b1-education',
      'b1-green-cities',
      'b1-what-is-in-a-job',
      'b1-personal-challenges',
      'b1-interview-phrases',
      'b1-polite-endings',
      'b1-headline-news',
      'b1-small-changes',
      'b1-apologies-excuses',
      'b1-phone-etiquette',
      'b1-sorry-to-interrupt',
      'b1-complaint-responses',
    ],
    'b2': <String>[
      'b2-personalities',
      'b2-great-leads',
      'b2-healthy-lifestyle',
      'b2-what-is-the-truth',
      'b2-personal-growth',
      'b2-speaking-out',
      'b2-acting-out',
      'b2-i-remember',
      'b2-social-feedback',
      'b2-crime-scene',
      'b2-polite-trouble',
      'b2-conflict-resolution',
      'b2-love-it-or-loathe-it',
      'b2-environmental-issues',
      'b2-we-can-work-it-out',
      'b2-mysteries-and-crimes',
      'b2-possible-futures',
      'b2-business-plans',
      'b2-meeting-decisions',
      'b2-its-so-predictable',
      'b2-on-the-job',
      'b2-science-and-technology',
      'b2-time-management',
      'b2-human-rights',
    ],
    'c1': <String>[
      'c1-cultural-norms',
      'c1-social-media-influence',
      'c1-career-choices',
      'c1-accelerate-performance',
      'c1-inventions',
      'c1-time-travel',
      'c1-possessions',
      'c1-job-skills',
      'c1-historical-changes',
      'c1-review-writing',
      'c1-mysteries',
      'c1-strange-theories',
      'c1-celebrity',
      'c1-global-politics',
      'c1-product-boom',
      'c1-will-be-happy',
      'c1-maybe-later',
      'c1-new-solutions',
      'c1-contextual-influence',
      'c1-a-lost-logo',
      'c1-kind-acts',
      'c1-what-a-movie',
      'c1-how-annoying',
      'c1-in-the-news',
    ],
    'c2': <String>[
      'c2-globalization',
      'c2-natural-disasters',
      'c2-reacting-to-information',
      'c2-work-life-balance',
      'c2-remote-work',
      'c2-family-issues',
      'c2-basic-human-anatomy',
      'c2-health-predictions',
      'c2-healthcare-access',
      'c2-global-travel-experience',
      'c2-superpowers',
      'c2-team-building',
      'c2-biofluorescence',
      'c2-dilemmas',
      'c2-social-enthusiasm',
      'c2-changes',
      'c2-work-work-work',
      'c2-local-issues',
      'c2-problems-problems',
      'c2-fact-or-fiction',
      'c2-sightseeing',
      'c2-volunteering',
      'c2-the-minds-eye',
      'c2-media-consumption',
    ],
  };

  static String? slugAt(String levelId, int index) {
    final list = slugsByLevel[levelId];
    if (list == null || index < 0 || index >= list.length) return null;
    return list[index];
  }

  /// Ders slug'ı → seviye + sıra indeksi (rozet numarası için).
  static ({String levelId, int index})? locateSlug(String slug) {
    final needle = slug.trim().toLowerCase();
    if (needle.isEmpty) return null;
    for (final entry in slugsByLevel.entries) {
      final idx = entry.value.indexWhere((s) => s.toLowerCase() == needle);
      if (idx >= 0) return (levelId: entry.key, index: idx);
    }
    return null;
  }

  static final levels = <LessonLevelData>[
    const LessonLevelData(id: 'a1', iconAssets: a1Icons),
    LessonLevelData(id: 'a2', iconAssets: _a2Icons()),
    const LessonLevelData(id: 'b1', iconAssets: b1Icons),
    const LessonLevelData(id: 'b2', iconAssets: b2Icons),
    const LessonLevelData(id: 'c1', iconAssets: c1Icons),
    const LessonLevelData(id: 'c2', iconAssets: c2Icons),
  ];
}
