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

  static List<String> _legacyKeys(List<String> keys) => [
        for (final k in keys) '$_legacy/$k.svg',
      ];

  static final levels = <LessonLevelData>[
    const LessonLevelData(id: 'a1', iconAssets: a1Icons),
    LessonLevelData(id: 'a2', iconAssets: _a2Icons()),
    const LessonLevelData(id: 'b1', iconAssets: b1Icons),
    const LessonLevelData(id: 'b2', iconAssets: b2Icons),
    const LessonLevelData(id: 'c1', iconAssets: c1Icons),
    const LessonLevelData(id: 'c2', iconAssets: c2Icons),
  ];
}
