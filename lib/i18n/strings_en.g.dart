///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en._(_root);
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$targetLanguage$en targetLanguage = Translations$targetLanguage$en._(_root);
	late final Translations$language$en language = Translations$language$en._(_root);
	late final Translations$setup$en setup = Translations$setup$en._(_root);
	late final Translations$accountCreating$en accountCreating = Translations$accountCreating$en._(_root);
	late final Translations$previewChat$en previewChat = Translations$previewChat$en._(_root);
	late final Translations$paywall$en paywall = Translations$paywall$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$wordPracticePage$en wordPracticePage = Translations$wordPracticePage$en._(_root);
	late final Translations$quizPage$en quizPage = Translations$quizPage$en._(_root);
	late final Translations$placeholder$en placeholder = Translations$placeholder$en._(_root);
	late final Translations$tutorPage$en tutorPage = Translations$tutorPage$en._(_root);
	late final Translations$lessonPage$en lessonPage = Translations$lessonPage$en._(_root);
	late final Translations$rolePlayPage$en rolePlayPage = Translations$rolePlayPage$en._(_root);
	late final Translations$notificationsPage$en notificationsPage = Translations$notificationsPage$en._(_root);
	late final Translations$profilePage$en profilePage = Translations$profilePage$en._(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get name => 'Lingola';

	/// en: 'PREMIUM'
	String get premium => 'PREMIUM';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Learning streak'
	String get streak => 'Learning streak';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'CONTINUE'
	String get continueLabel => 'CONTINUE';

	/// en: 'BACK'
	String get back => 'BACK';

	/// en: 'Locked'
	String get locked => 'Locked';

	/// en: '$value min'
	String minutes({required Object value}) => '${value} min';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'GET STARTED'
	String get getStarted => 'GET STARTED';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Onboarding page $current of $total'
	String pageA11y({required Object current, required Object total}) => 'Onboarding page ${current} of ${total}';

	late final Translations$onboarding$slide1$en slide1 = Translations$onboarding$slide1$en._(_root);
	late final Translations$onboarding$slide2$en slide2 = Translations$onboarding$slide2$en._(_root);
	late final Translations$onboarding$slide3$en slide3 = Translations$onboarding$slide3$en._(_root);
}

// Path: targetLanguage
class Translations$targetLanguage$en {
	Translations$targetLanguage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select the language you want to learn'
	String get title => 'Select the language you want to learn';

	/// en: 'More languages are coming soon'
	String get comingSoon => 'More languages are coming soon';

	/// en: 'Korean'
	String get korean => 'Korean';

	/// en: 'Portuguese'
	String get portuguese => 'Portuguese';

	/// en: 'Portuguese (Brazil)'
	String get portugueseBrazil => 'Portuguese (Brazil)';

	/// en: 'German'
	String get german => 'German';

	/// en: 'Italian'
	String get italian => 'Italian';

	/// en: 'Simplified Chinese'
	String get simplifiedChinese => 'Simplified Chinese';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'Turkish'
	String get turkish => 'Turkish';

	/// en: 'Hindi'
	String get hindi => 'Hindi';
}

// Path: language
class Translations$language$en {
	Translations$language$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Step $current of $total'
	String step({required Object current, required Object total}) => 'Step ${current} of ${total}';

	/// en: 'What do you want to speak?'
	String get title => 'What do you want to speak?';

	/// en: 'I speak'
	String get nativeSection => 'I speak';

	/// en: 'Native language'
	String get nativeField => 'Native language';

	/// en: 'Turkish'
	String get nativeName => 'Turkish';

	/// en: 'I want to learn'
	String get targetSection => 'I want to learn';

	/// en: 'Target Language'
	String get targetField => 'Target Language';

	/// en: 'English'
	String get targetName => 'English';

	/// en: 'Language direction'
	String get direction => 'Language direction';

	/// en: 'Select language'
	String get selectLanguage => 'Select language';

	/// en: 'Coming soon...'
	String get comingSoonBadge => 'Coming soon...';

	/// en: 'English'
	String get english => 'English';

	/// en: 'French'
	String get french => 'French';

	/// en: 'Japanese'
	String get japanese => 'Japanese';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	/// en: 'Russian'
	String get russian => 'Russian';
}

// Path: setup
class Translations$setup$en {
	Translations$setup$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What's your goal?'
	String get goalTitle => 'What\'s your goal?';

	/// en: 'Career Development'
	String get goalCareer => 'Career Development';

	/// en: 'Travel'
	String get goalTravel => 'Travel';

	/// en: 'Living Abroad'
	String get goalLiving => 'Living Abroad';

	/// en: 'Studying Abroad'
	String get goalStudying => 'Studying Abroad';

	/// en: 'Other'
	String get goalOther => 'Other';

	/// en: 'What's your current language level?'
	String get levelTitle => 'What\'s your current language level?';

	/// en: 'Beginner — I know a few words'
	String get levelBeginner => 'Beginner — I know a few words';

	/// en: 'Intermediate — I can hold simple conversations'
	String get levelIntermediate => 'Intermediate — I can hold simple conversations';

	/// en: 'Advanced — I speak but want to improve'
	String get levelAdvanced => 'Advanced — I speak but want to improve';

	/// en: 'How fast do you want to improve?'
	String get paceTitle => 'How fast do you want to improve?';

	/// en: '5-10 min/day (light)'
	String get paceLight => '5-10 min/day (light)';

	/// en: '15-20 min/day (recommended)'
	String get paceRecommended => '15-20 min/day (recommended)';

	/// en: '30+ min/day (fast results)'
	String get paceFast => '30+ min/day (fast results)';
}

// Path: accountCreating
class Translations$accountCreating$en {
	Translations$accountCreating$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Personal Account Is Being Created'
	String get title => 'Your Personal Account Is Being Created';

	/// en: 'Content is being created'
	String get stepContent => 'Content is being created';

	/// en: 'Dialogues are being prepared'
	String get stepDialogues => 'Dialogues are being prepared';

	/// en: 'Lessons are being optimised'
	String get stepLessons => 'Lessons are being optimised';

	/// en: 'Your plan is being finalised'
	String get stepPlan => 'Your plan is being finalised';

	/// en: 'Optimization'
	String get optimization => 'Optimization';

	/// en: '$value%'
	String progress({required Object value}) => '${value}%';
}

// Path: previewChat
class Translations$previewChat$en {
	Translations$previewChat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get brand => 'Lingola';

	/// en: 'Lesson 1: Greetings'
	String get lessonBadge => 'Lesson 1: Greetings';

	/// en: '1x'
	String get speed => '1x';

	/// en: 'Type a message...'
	String get typeMessage => 'Type a message...';

	/// en: 'Hello Emrah, it was a pleasure meeting you. Could you tell me a little about yourself?'
	String get incoming1 => 'Hello Emrah, it was a pleasure meeting you. Could you tell me a little about yourself?';

	/// en: 'Hi! I just had my morning coffee and I'm ready to find that connection you mentioned.'
	String get outgoing1 => 'Hi! I just had my morning coffee and I\'m ready to find that connection you mentioned.';

	/// en: 'Günaydın'
	String get incoming2Highlight => 'Günaydın';

	/// en: ', Emrah! I'm glad you're feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?'
	String get incoming2Rest => ', Emrah! I\'m glad you\'re feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?';

	/// en: 'Great! Let's keep practicing greetings together.'
	String get botReply => 'Great! Let\'s keep practicing greetings together.';
}

// Path: paywall
class Translations$paywall$en {
	Translations$paywall$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Start Speaking Today — Free'
	String get title => 'Start Speaking Today — Free';

	/// en: 'Unlimited learning opportunities'
	String get subtitle => 'Unlimited learning opportunities';

	/// en: 'No commitment'
	String get noCommitment => 'No commitment';

	/// en: 'Cancel anytime'
	String get cancelAnytime => 'Cancel anytime';

	/// en: 'No payment today'
	String get noPaymentToday => 'No payment today';

	/// en: '3 Days Free'
	String get daysFree => '3 Days Free';

	/// en: 'Then \$1.99/month'
	String get thenPrice => 'Then \$1.99/month';

	/// en: 'Free Trial Active'
	String get trialActive => 'Free Trial Active';

	/// en: 'Payable Today'
	String get payableToday => 'Payable Today';

	/// en: '3 Days Free Of Charge 0.00\$'
	String get payableValue => '3 Days Free Of Charge 0.00\$';

	/// en: 'Payment date: 13 March 2026'
	String get paymentDate => 'Payment date: 13 March 2026';

	/// en: '9.99\$'
	String get paymentAmount => '9.99\$';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Our diverse AI trainers'
	String get trainersBadge => 'Our diverse AI trainers';

	/// en: 'Start Speaking a New Language, Today'
	String get title => 'Start Speaking a New Language, Today';

	/// en: 'Practice real conversations with AI. No pressure. No judgment.'
	String get body => 'Practice real conversations with AI.\nNo pressure. No judgment.';

	/// en: 'Continue with Google'
	String get continueGoogle => 'Continue with Google';

	/// en: 'Continue with Apple'
	String get continueApple => 'Continue with Apple';

	/// en: 'Continue as Guest'
	String get continueGuest => 'Continue as Guest';

	/// en: 'By signing up for Lingola, you agree to our Terms of Service. Learn how we process your data in our Privacy Policy and Cookies Policy'
	String get legal => 'By signing up for Lingola, you agree to our Terms of Service. Learn how we process your data in our Privacy Policy and Cookies Policy';

	/// en: 'Terms of Service'
	String get terms => 'Terms of Service';

	/// en: 'Privacy Policy'
	String get privacy => 'Privacy Policy';

	/// en: 'Cookies Policy'
	String get cookies => 'Cookies Policy';
}

// Path: nav
class Translations$nav$en {
	Translations$nav$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Tutor'
	String get tutor => 'Tutor';

	/// en: 'Lesson'
	String get lesson => 'Lesson';

	/// en: 'Role Play'
	String get rolePlay => 'Role Play';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '2'
	String get streakCount => '2';

	/// en: 'Good Morning, Jhon'
	String get greeting => 'Good Morning, Jhon';

	/// en: 'Today’s Practice'
	String get todayPractice => 'Today’s Practice';

	/// en: 'Continue Conversation'
	String get continueConversation => 'Continue Conversation';

	/// en: 'Lesson 2 — Greetings'
	String get lessonProgress => 'Lesson 2 — Greetings';

	/// en: '46min'
	String get timeCurrent => '46min';

	/// en: '/ 60min'
	String get timeTotal => '/ 60min';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'A1 - Starter'
	String get learningPath => 'A1 - Starter';

	/// en: 'All Lessons'
	String get allLessons => 'All Lessons';

	/// en: 'Introductions I'
	String get introductions => 'Introductions I';

	/// en: 'Greetings'
	String get greetings => 'Greetings';

	/// en: 'Jobs'
	String get jobs => 'Jobs';

	/// en: 'A Favorite Room'
	String get favoriteRoom => 'A Favorite Room';

	/// en: 'Daily Routine'
	String get dailyRoutine => 'Daily Routine';

	/// en: 'Scroll'
	String get scroll => 'Scroll';

	/// en: 'Live Lesson'
	String get liveLesson => 'Live Lesson';

	/// en: 'Have a video call with our tutor'
	String get liveLessonSubtitle => 'Have a video call with our tutor';

	/// en: 'More Tutor'
	String get moreTutor => 'More Tutor';

	/// en: 'Start Talk Now'
	String get startTalkNow => 'Start Talk Now';

	/// en: 'Lingola'
	String get tutorLingola => 'Lingola';

	/// en: 'Mei Lin'
	String get tutorMei => 'Mei Lin';

	/// en: 'Kate'
	String get tutorKate => 'Kate';

	/// en: 'Adaptive'
	String get tagAdaptive => 'Adaptive';

	/// en: 'Calm'
	String get tagCalm => 'Calm';

	/// en: 'Patient'
	String get tagPatient => 'Patient';

	/// en: 'Methodical'
	String get tagMethodical => 'Methodical';

	/// en: 'Encouraging'
	String get tagEncouraging => 'Encouraging';

	/// en: '+5'
	String get tagMore => '+5';

	/// en: 'More Features'
	String get moreFeatures => 'More Features';

	/// en: 'PRACTICE'
	String get practiceLabel => 'PRACTICE';

	/// en: 'Word Practice'
	String get wordPractice => 'Word Practice';

	/// en: 'Build your vocabulary in your chosen language daily'
	String get wordPracticeBody => 'Build your vocabulary in your chosen language daily';

	/// en: 'IMMERSIVE'
	String get immersiveLabel => 'IMMERSIVE';

	/// en: 'Quiz'
	String get quiz => 'Quiz';

	/// en: 'Learn through real'
	String get quizBodyLine1 => 'Learn through real';

	/// en: 'examples in context'
	String get quizBodyLine2 => 'examples in context';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Library'
	String get library => 'Library';

	/// en: 'Learn and Save'
	String get libraryTitle => 'Learn and Save';

	/// en: 'Learn More'
	String get learnMore => 'Learn More';

	late final Translations$home$premium$en premium = Translations$home$premium$en._(_root);
}

// Path: wordPracticePage
class Translations$wordPracticePage$en {
	Translations$wordPracticePage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Word Practice'
	String get title => 'Word Practice';

	/// en: 'TURKISH'
	String get turkish => 'TURKISH';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Listen'
	String get listen => 'Listen';

	/// en: 'Hint'
	String get hint => 'Hint';

	/// en: 'PREVIOUS'
	String get previous => 'PREVIOUS';

	/// en: 'NEXT'
	String get next => 'NEXT';
}

// Path: quizPage
class Translations$quizPage$en {
	Translations$quizPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quiz'
	String get title => 'Quiz';

	/// en: 'What do you want to improve today?'
	String get headline => 'What do you want to improve today?';

	/// en: 'Choose your training — takes less than 3 minutes 🚀'
	String get subtitle => 'Choose your training — takes less than 3 minutes 🚀';

	/// en: 'Reading'
	String get readingTitle => 'Reading';

	/// en: 'Comprehension via articles & stories'
	String get readingBody => 'Comprehension via articles & stories';

	/// en: 'Writing'
	String get writingTitle => 'Writing';

	/// en: 'Grammar & vocabulary exercises'
	String get writingBody => 'Grammar & vocabulary exercises';

	/// en: 'Speaking'
	String get speakingTitle => 'Speaking';

	/// en: 'Pronunciation via AI speech engine'
	String get speakingBody => 'Pronunciation via AI speech engine';

	/// en: 'Reading Test'
	String get readingTestTitle => 'Reading Test';

	/// en: 'Read'
	String get read => 'Read';

	/// en: 'Speak the English word clearly…'
	String get listeningHint => 'Speak the English word clearly…';

	/// en: 'Microphone or speech recognition is unavailable.'
	String get micPermissionDenied => 'Microphone or speech recognition is unavailable.';

	/// en: 'Great! That matches the word.'
	String get matchSuccess => 'Great! That matches the word.';

	/// en: 'Heard "$heard". Try again.'
	String matchFail({required Object heard}) => 'Heard "${heard}". Try again.';

	/// en: 'Successful!'
	String get successfulTitle => 'Successful!';

	/// en: 'Pronunciation like a native speaker!'
	String get successfulBody => 'Pronunciation like a native speaker!';

	/// en: 'Failed'
	String get failedTitle => 'Failed';

	/// en: 'It was almost happening, give it one more chance'
	String get failedBody => 'It was almost happening, give it one more chance';

	/// en: 'TRY AGAIN'
	String get tryAgain => 'TRY AGAIN';

	/// en: 'Writing Test'
	String get writingTestTitle => 'Writing Test';

	/// en: 'SOURCE LANGUAGE'
	String get sourceLanguage => 'SOURCE LANGUAGE';

	/// en: 'ANSWER'
	String get answer => 'ANSWER';

	/// en: 'Write your answer here...'
	String get writeAnswerHint => 'Write your answer here...';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Speaking Test'
	String get speakingTestTitle => 'Speaking Test';

	/// en: 'Speaking Proficiency'
	String get speakingProficiency => 'Speaking Proficiency';

	/// en: 'Speak clearly into your microphone:'
	String get speakClearlyHint => 'Speak clearly into your microphone:';

	/// en: 'Speak Up'
	String get speakUp => 'Speak Up';

	/// en: 'Recording...'
	String get recording => 'Recording...';

	/// en: 'QUESTION $current OF $total'
	String questionOf({required Object current, required Object total}) => 'QUESTION ${current} OF ${total}';
}

// Path: placeholder
class Translations$placeholder$en {
	Translations$placeholder$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$tab is on the way'
	String title({required Object tab}) => '${tab} is on the way';

	/// en: 'We’re preparing a focused $tab experience for you.'
	String body({required Object tab}) => 'We’re preparing a focused ${tab} experience for you.';
}

// Path: tutorPage
class Translations$tutorPage$en {
	Translations$tutorPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tutor'
	String get title => 'Tutor';

	/// en: 'Chat with Lingola'
	String get chatWithLingola => 'Chat with Lingola';

	/// en: 'Chat History'
	String get chatHistory => 'Chat History';

	/// en: 'History'
	String get history => 'History';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Focus'
	String get focus => 'Focus';

	/// en: '8+ more'
	String get moreCountries => '8+ more';

	/// en: '+8'
	String get moreFocus => '+8';

	/// en: 'SAVE'
	String get save => 'SAVE';

	/// en: 'Start Talk Now'
	String get startTalkNow => 'Start Talk Now';

	/// en: 'Type a message...'
	String get typeMessage => 'Type a message...';

	/// en: 'Speaker'
	String get speaker => 'Speaker';

	/// en: '12'
	String get messagesCount => '12';

	late final Translations$tutorPage$tutors$en tutors = Translations$tutorPage$tutors$en._(_root);
	late final Translations$tutorPage$tags$en tags = Translations$tutorPage$tags$en._(_root);

	/// en: 'Hey! I was about to explode with boredom...'
	String get historyPreview1 => 'Hey! I was about to explode with boredom...';

	/// en: 'Shall we practice ordering food today?'
	String get historyPreview2 => 'Shall we practice ordering food today?';

	/// en: '11:00 AM'
	String get time1 => '11:00 AM';

	/// en: 'Yesterday'
	String get time2 => 'Yesterday';

	late final Translations$tutorPage$chat$en chat = Translations$tutorPage$chat$en._(_root);
}

// Path: lessonPage
class Translations$lessonPage$en {
	Translations$lessonPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue to Learn'
	String get title => 'Continue to Learn';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Target language'
	String get language => 'Target language';

	/// en: 'Completed'
	String get completed => 'Completed';

	/// en: 'Locked'
	String get locked => 'Locked';

	late final Translations$lessonPage$levels$en levels = Translations$lessonPage$levels$en._(_root);
}

// Path: rolePlayPage
class Translations$rolePlayPage$en {
	Translations$rolePlayPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Role Play'
	String get title => 'Role Play';

	/// en: 'Choose your role — experience a real-life scenario 🎭'
	String get subtitle => 'Choose your role — experience a real-life scenario 🎭';

	/// en: '%$value completed'
	String progressCompleted({required Object value}) => '%${value} completed';

	/// en: '$value Min'
	String minutes({required Object value}) => '${value} Min';

	/// en: 'Beginner'
	String get beginner => 'Beginner';

	/// en: 'SCREENPLAY'
	String get screenplay => 'SCREENPLAY';

	/// en: 'Daily Interactions'
	String get dailyInteractions => 'Daily Interactions';

	/// en: 'Business'
	String get business => 'Business';

	late final Translations$rolePlayPage$coffee$en coffee = Translations$rolePlayPage$coffee$en._(_root);
	late final Translations$rolePlayPage$directions$en directions = Translations$rolePlayPage$directions$en._(_root);
	late final Translations$rolePlayPage$interview$en interview = Translations$rolePlayPage$interview$en._(_root);
}

// Path: notificationsPage
class Translations$notificationsPage$en {
	Translations$notificationsPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	late final Translations$notificationsPage$translation$en translation = Translations$notificationsPage$translation$en._(_root);
	late final Translations$notificationsPage$offer$en offer = Translations$notificationsPage$offer$en._(_root);
	late final Translations$notificationsPage$stories$en stories = Translations$notificationsPage$stories$en._(_root);
}

// Path: profilePage
class Translations$profilePage$en {
	Translations$profilePage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Jhon Doe'
	String get userName => 'Jhon Doe';

	/// en: 'Free Version'
	String get freeVersion => 'Free Version';

	/// en: 'Day Streak!'
	String get dayStreak => 'Day Streak!';

	/// en: 'Account Settings'
	String get accountSettings => 'Account Settings';

	/// en: 'General'
	String get general => 'General';

	/// en: 'Profile Settings'
	String get profileSettings => 'Profile Settings';

	/// en: 'Full Name'
	String get fullName => 'Full Name';

	/// en: 'E-mail'
	String get email => 'E-mail';

	/// en: 'Delete Account'
	String get deleteAccount => 'Delete Account';

	/// en: 'SAVE'
	String get save => 'SAVE';

	/// en: 'Gitmeni istemiyoruz ama seni anlıyoruz.'
	String get deleteTitle => 'Gitmeni istemiyoruz ama seni anlıyoruz.';

	/// en: 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?'
	String get deleteBody => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?';

	late final Translations$profilePage$deleteReasons$en deleteReasons = Translations$profilePage$deleteReasons$en._(_root);

	/// en: 'Mesaj (opsiyonel)'
	String get messageOptional => 'Mesaj (opsiyonel)';

	/// en: 'Mesajınız varsa lütfen yazın.'
	String get messageHint => 'Mesajınız varsa lütfen yazın.';

	/// en: 'NEXT'
	String get next => 'NEXT';

	/// en: 'Özel teklif'
	String get specialOfferTitle => 'Özel teklif';

	/// en: 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.'
	String get specialOfferBody => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.';

	/// en: 'Switch to 1-Month Plan'
	String get monthlyPlanTitle => 'Switch to 1-Month Plan';

	/// en: '\$79/month, cancel anytime'
	String get monthlyPlanPrice => '\$79/month, cancel anytime';

	/// en: 'No long-term commitment. Stay connected with our community on a month-to-month basis.'
	String get monthlyPlanDesc => 'No long-term commitment. Stay connected with our community on a month-to-month basis.';

	/// en: 'What you'll keep:'
	String get whatYoullKeep => 'What you\'ll keep:';

	/// en: 'Access all characters'
	String get keepCharacters => 'Access all characters';

	/// en: 'Unlimited video calls'
	String get keepVideo => 'Unlimited video calls';

	/// en: 'Access to all courses'
	String get keepCourses => 'Access to all courses';

	/// en: 'Switch to Monthly Plan'
	String get switchMonthlyCta => 'Switch to Monthly Plan';

	/// en: 'Are you sure?'
	String get confirmTitle => 'Are you sure?';

	/// en: 'We really don't want to see you go. Here's what you'll lose:'
	String get confirmBody => 'We really don\'t want to see you go. Here\'s what you\'ll lose:';

	/// en: 'Unlimited character access'
	String get loseCharacters => 'Unlimited character access';

	/// en: 'Unlimited video call access'
	String get loseVideo => 'Unlimited video call access';

	/// en: 'Access to all courses'
	String get loseCourses => 'Access to all courses';

	/// en: 'Stay and get 60% off for 1 month'
	String get discountTitle => 'Stay and get 60% off for 1 month';

	/// en: 'Our best offer ever. Just \$27.60/month'
	String get discountSubtitle => 'Our best offer ever. Just \$27.60/month';

	/// en: 'Accept 60% Off & Stay'
	String get acceptDiscountCta => 'Accept 60% Off & Stay';

	/// en: 'We're sad to see you go'
	String get farewellTitle => 'We\'re sad to see you go';

	/// en: 'Your membership has been cancelled. You'll have access until the end of your current billing period on $date.'
	String farewellBody({required Object date}) => 'Your membership has been cancelled. You\'ll have access until the end of your current billing period on ${date}.';

	/// en: '✨ Change your mind?'
	String get changeMindTitle => '✨ Change your mind?';

	/// en: 'You can reactivate your membership anytime before $date to keep your benefits.'
	String changeMindBody({required Object date}) => 'You can reactivate your membership anytime before ${date} to keep your benefits.';

	/// en: 'Wait, I want to reactivate'
	String get reactivateCta => 'Wait, I want to reactivate';

	/// en: 'DONE'
	String get done => 'DONE';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'App Language'
	String get appLanguage => 'App Language';

	/// en: 'Select Language'
	String get selectLanguageTitle => 'Select Language';

	/// en: 'Premium'
	String get premium => 'Premium';

	/// en: 'Passive'
	String get passive => 'Passive';

	/// en: 'Share Friend'
	String get shareFriend => 'Share Friend';

	/// en: 'Share with Friend'
	String get shareWithFriendTitle => 'Share with Friend';

	/// en: 'Invite your friends and enjoy translate together'
	String get shareInviteBody => 'Invite your friends and enjoy translate together';

	/// en: 'Rate Us'
	String get rateUs => 'Rate Us';

	/// en: 'F.A.Q.'
	String get faq => 'F.A.Q.';

	late final Translations$profilePage$faqItems$en faqItems = Translations$profilePage$faqItems$en._(_root);

	/// en: 'Support'
	String get support => 'Support';

	/// en: 'Feedback'
	String get feedback => 'Feedback';

	/// en: 'Progression'
	String get progression => 'Progression';

	/// en: 'Progress'
	String get progressTitle => 'Progress';

	/// en: 'Good Morning,'
	String get goodMorning => 'Good Morning,';

	/// en: 'Jhon'
	String get progressUserName => 'Jhon';

	/// en: 'English'
	String get progressLanguage => 'English';

	/// en: 'Past 7 Days'
	String get past7Days => 'Past 7 Days';

	/// en: 'Study every day to build your streak and create a powerful learning habit.'
	String get past7DaysBody => 'Study every day to build your streak and create a powerful learning habit.';

	/// en: 'Current Level'
	String get currentLevel => 'Current Level';

	/// en: 'Just $xp XP left to reach $level!'
	String xpLeft({required Object xp, required Object level}) => 'Just ${xp} XP left to reach ${level}!';

	/// en: 'TO NEXT LEVEL'
	String get toNextLevel => 'TO NEXT LEVEL';

	/// en: 'Day Streak'
	String get dayStreakLabel => 'Day Streak';

	/// en: 'Total Points'
	String get totalPoints => 'Total Points';

	/// en: 'Saved Words'
	String get savedWords => 'Saved Words';

	/// en: '$count items to review'
	String itemsToReview({required Object count}) => '${count} items to review';

	/// en: 'Log Out'
	String get logout => 'Log Out';

	/// en: 'You are about to log out'
	String get logoutTitle => 'You are about to log out';

	/// en: 'See you again soon! We'll miss your breathing exercises.'
	String get logoutBody => 'See you again soon! We\'ll miss your breathing exercises.';

	/// en: 'LOGOUT'
	String get logoutConfirm => 'LOGOUT';

	/// en: 'CANCEL'
	String get logoutCancel => 'CANCEL';

	late final Translations$profilePage$days$en days = Translations$profilePage$days$en._(_root);
}

// Path: onboarding.slide1
class Translations$onboarding$slide1$en {
	Translations$onboarding$slide1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Speak Confidently in Weeks — Not Months'
	String get title => 'Speak Confidently in Weeks — Not Months';

	/// en: 'Practice real conversations with AI. Improve your accent, confidence, and fluency, daily.'
	String get body => 'Practice real conversations with AI. Improve your accent, confidence, and fluency, daily.';

	/// en: 'Sarah Williams, 24'
	String get testimonialName => 'Sarah Williams, 24';

	/// en: 'I couldn’t speak English before. Now I talk daily at work.'
	String get testimonialBody => 'I couldn’t speak English before. Now I talk daily at work.';
}

// Path: onboarding.slide2
class Translations$onboarding$slide2$en {
	Translations$onboarding$slide2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A Private Tutor Without the Price'
	String get title => 'A Private Tutor Without the Price';

	/// en: 'Real conversations. Instant feedback. No scheduling. No pressure.'
	String get body => 'Real conversations. Instant feedback.\nNo scheduling. No pressure.';

	/// en: 'Real Tutor'
	String get realTutor => 'Real Tutor';

	/// en: 'Lingola'
	String get lingola => 'Lingola';

	/// en: '\$30 / hr'
	String get priceReal => '\$30 / hr';

	/// en: '\$9.99 / yr'
	String get priceLingola => '\$9.99 / yr';

	/// en: 'VS'
	String get versus => 'VS';

	/// en: 'Scheduled'
	String get scheduled => 'Scheduled';

	/// en: 'Anytime'
	String get anytime => 'Anytime';

	/// en: 'Stressful'
	String get stressful => 'Stressful';

	/// en: 'No pressure'
	String get noPressure => 'No pressure';

	/// en: 'Price'
	String get price => 'Price';

	/// en: 'Availability'
	String get availability => 'Availability';

	/// en: 'Feeling'
	String get feeling => 'Feeling';
}

// Path: onboarding.slide3
class Translations$onboarding$slide3$en {
	Translations$onboarding$slide3$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A Learning Plan Built Around You'
	String get title => 'A Learning Plan Built Around You';

	/// en: 'Your goals, your pace, your level. From beginner to fluent — step by step.'
	String get body => 'Your goals, your pace, your level.\nFrom beginner to fluent — step by step.';

	/// en: 'Goal'
	String get goal => 'Goal';

	/// en: 'Practice'
	String get practice => 'Practice';

	/// en: 'Progress'
	String get progress => 'Progress';
}

// Path: home.premium
class Translations$home$premium$en {
	Translations$home$premium$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The path to '
	String get titleBefore => 'The path to ';

	/// en: 'speaking fluently'
	String get titleHighlight => 'speaking fluently';

	/// en: ' without fear of making mistakes.'
	String get titleAfter => ' without fear of making mistakes.';

	/// en: 'Join millions of students worldwide. Start breaking the language barrier today — '
	String get descriptionBefore => 'Join millions of students worldwide. Start breaking the language barrier today — ';

	/// en: 'first 3 days completely free.'
	String get descriptionHighlight => 'first 3 days completely free.';

	/// en: '24/7 accessible AI Tutor'
	String get feature1 => '24/7 accessible AI Tutor';

	/// en: 'Unlimited access to Private Tutors'
	String get feature2 => 'Unlimited access to Private Tutors';

	/// en: 'Daily lesson plan tailored for you'
	String get feature3 => 'Daily lesson plan tailored for you';

	/// en: '1.99$'
	String get priceAmount => '1.99\$';

	/// en: '/mo'
	String get pricePeriod => '/mo';

	/// en: '40% off with annual purchase'
	String get discount => '40% off with annual purchase';

	/// en: 'Start'
	String get cta => 'Start';
}

// Path: tutorPage.tutors
class Translations$tutorPage$tutors$en {
	Translations$tutorPage$tutors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get lingola => 'Lingola';

	/// en: 'Elena'
	String get elena => 'Elena';

	/// en: 'Kaj'
	String get kaj => 'Kaj';

	/// en: 'Mei Lin'
	String get mei => 'Mei Lin';

	/// en: 'Kate'
	String get kate => 'Kate';

	/// en: 'Sofia'
	String get sofia => 'Sofia';

	/// en: 'Elena Schmidt'
	String get elenaSchmidt => 'Elena Schmidt';

	/// en: 'Kenji Sato'
	String get kenjiSato => 'Kenji Sato';
}

// Path: tutorPage.tags
class Translations$tutorPage$tags$en {
	Translations$tutorPage$tags$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Adaptive'
	String get adaptive => 'Adaptive';

	/// en: 'Calm'
	String get calm => 'Calm';

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Organized'
	String get organized => 'Organized';

	/// en: 'Relaxed'
	String get relaxed => 'Relaxed';

	/// en: 'Methodical'
	String get methodical => 'Methodical';

	/// en: 'Attentive'
	String get attentive => 'Attentive';

	/// en: '+5'
	String get more => '+5';
}

// Path: tutorPage.chat
class Translations$tutorPage$chat$en {
	Translations$tutorPage$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Good morning! I'm glad you're feeling ready to practice today.'
	String get incoming1 => 'Good morning! I\'m glad you\'re feeling ready to practice today.';

	/// en: 'Yes, let's start with greetings.'
	String get outgoing1 => 'Yes, let\'s start with greetings.';

	/// en: 'Perfect. How would you say hello to a colleague?'
	String get incoming2 => 'Perfect. How would you say hello to a colleague?';

	/// en: 'Typing'
	String get typing => 'Typing';
}

// Path: lessonPage.levels
class Translations$lessonPage$levels$en {
	Translations$lessonPage$levels$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$lessonPage$levels$a1$en a1 = Translations$lessonPage$levels$a1$en._(_root);
	late final Translations$lessonPage$levels$a2$en a2 = Translations$lessonPage$levels$a2$en._(_root);
	late final Translations$lessonPage$levels$b1$en b1 = Translations$lessonPage$levels$b1$en._(_root);
	late final Translations$lessonPage$levels$b2$en b2 = Translations$lessonPage$levels$b2$en._(_root);
	late final Translations$lessonPage$levels$c1$en c1 = Translations$lessonPage$levels$c1$en._(_root);
	late final Translations$lessonPage$levels$c2$en c2 = Translations$lessonPage$levels$c2$en._(_root);
}

// Path: rolePlayPage.coffee
class Translations$rolePlayPage$coffee$en {
	Translations$rolePlayPage$coffee$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ordering at the Coffee Shop'
	String get title => 'Ordering at the Coffee Shop';

	/// en: 'Order your favorite drink, ask about sizes and extras, confirm your total, and pick up your coffee at the counter.'
	String get screenplay => 'Order your favorite drink, ask about sizes and extras, confirm your total, and pick up your coffee at the counter.';
}

// Path: rolePlayPage.directions
class Translations$rolePlayPage$directions$en {
	Translations$rolePlayPage$directions$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Asking for Directions on the Street'
	String get title => 'Asking for Directions on the Street';

	/// en: 'Ask for directions to a place, find out how to get to the subway or bus, get information about tickets, and listen to restaurant recommendations.'
	String get screenplay => 'Ask for directions to a place, find out how to get to the subway or bus, get information about tickets, and listen to restaurant recommendations.';
}

// Path: rolePlayPage.interview
class Translations$rolePlayPage$interview$en {
	Translations$rolePlayPage$interview$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Job Interview'
	String get title => 'Job Interview';

	/// en: 'Introduce yourself, answer common interview questions, talk about your experience, and ask about the role and next steps.'
	String get screenplay => 'Introduce yourself, answer common interview questions, talk about your experience, and ask about the role and next steps.';
}

// Path: notificationsPage.translation
class Translations$notificationsPage$translation$en {
	Translations$notificationsPage$translation$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New Translation Ready'
	String get title => 'New Translation Ready';

	/// en: 'Your audio translation file has been successfully converted to text and translated.'
	String get body => 'Your audio translation file has been successfully converted to text and translated.';
}

// Path: notificationsPage.offer
class Translations$notificationsPage$offer$en {
	Translations$notificationsPage$offer$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A Special Offer Awaits You'
	String get title => 'A Special Offer Awaits You';

	/// en: 'Upgrade to Premium for unlimited photo translations at 50% off.'
	String get body => 'Upgrade to Premium for unlimited photo translations at 50% off.';
}

// Path: notificationsPage.stories
class Translations$notificationsPage$stories$en {
	Translations$notificationsPage$stories$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Discover New Stories'
	String get title => 'Discover New Stories';

	/// en: 'Learn new words through stories'
	String get body => 'Learn new words through stories';
}

// Path: profilePage.deleteReasons
class Translations$profilePage$deleteReasons$en {
	Translations$profilePage$deleteReasons$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Yapay zeka karakterlerini gerçekçi bulmadım.'
	String get aiCharacters => 'Yapay zeka karakterlerini gerçekçi bulmadım.';

	/// en: 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.'
	String get videoIssues => 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.';

	/// en: 'Abonelik fiyatları beklentimin üzerinde.'
	String get pricing => 'Abonelik fiyatları beklentimin üzerinde.';

	/// en: 'Aradığım tarzda karakterler bulamadım.'
	String get noMatch => 'Aradığım tarzda karakterler bulamadım.';

	/// en: 'Sadece kısa bir süreliğine denemek istemiştim.'
	String get shortTrial => 'Sadece kısa bir süreliğine denemek istemiştim.';

	/// en: 'Diğer'
	String get other => 'Diğer';
}

// Path: profilePage.faqItems
class Translations$profilePage$faqItems$en {
	Translations$profilePage$faqItems$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$profilePage$faqItems$howItWorks$en howItWorks = Translations$profilePage$faqItems$howItWorks$en._(_root);
	late final Translations$profilePage$faqItems$replacePsychologist$en replacePsychologist = Translations$profilePage$faqItems$replacePsychologist$en._(_root);
	late final Translations$profilePage$faqItems$dataPrivate$en dataPrivate = Translations$profilePage$faqItems$dataPrivate$en._(_root);
}

// Path: profilePage.days
class Translations$profilePage$days$en {
	Translations$profilePage$days$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MON'
	String get mon => 'MON';

	/// en: 'TUE'
	String get tue => 'TUE';

	/// en: 'WED'
	String get wed => 'WED';

	/// en: 'THU'
	String get thu => 'THU';

	/// en: 'FRI'
	String get fri => 'FRI';

	/// en: 'SAT'
	String get sat => 'SAT';

	/// en: 'SUN'
	String get sun => 'SUN';
}

// Path: lessonPage.levels.a1
class Translations$lessonPage$levels$a1$en {
	Translations$lessonPage$levels$a1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A1 - Starter'
	String get title => 'A1 - Starter';

	List<String> get lessons => [
		'Introductions I',
		'Greetings',
		'Jobs',
		'A Favorite Room',
		'Daily Routine',
		'Fruits',
		'Advice 1',
		'Family 1',
		'Everyday things',
		'Hometown',
		'House',
		'Food preferences',
		'Hobbies 1',
		'Successful people',
		'Food and drinks',
		'Ordering at a restaurant',
		'Pets',
		'Health and fitness',
		'Weather',
		'New lifestyle',
		'Getting better',
		'Hobbies 2',
		'Questions about places',
		'Possession',
		'Shopping 1',
		'Telling the time',
		'Directions 1',
		'Shopping 2',
		'Getting to know you',
		'Places of objects',
		'Appearances',
		'Directions 2',
	];
}

// Path: lessonPage.levels.a2
class Translations$lessonPage$levels$a2$en {
	Translations$lessonPage$levels$a2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A2 - Basic'
	String get title => 'A2 - Basic';

	List<String> get lessons => [
		'Family 2',
		'People and places',
		'Family 3',
		'Describing objects',
		'City',
		'The building project',
		'Home sweet home',
		'What time is it',
		'Daily routine 2',
		'Free time',
		'Food and nutrition',
		'Shopping and consumer',
		'Holidays',
		'Weekend plans',
		'Formal or casual',
		'Fashion',
		'Shopping 3',
		'Advice 2',
		'You can do it',
		'Shopping 4',
		'Small talk',
		'One latte please',
		'Food',
		'Getting around',
		'Ready for a trip',
		'Travel 1',
		'Urban escapes',
		'Travel 2',
		'A place to stay',
		'So exciting',
		'The right person',
		'School',
		'Music preferences',
		'Sports',
		'Rules of the race',
		'Leave a message',
		'Requests',
		'Invitations',
		'Travel experiences',
		'Past tense 1',
		'Past tense 2',
		'Past tense 3',
		'Questions about the past',
		'You are never too old',
		'Childhood memories',
		'Compliments',
		'Excuses',
		'It\'s so annoying!',
		'A digital world',
		'Work life',
		'I did not get that',
		'Save or spend?',
		'Say sorry',
	];
}

// Path: lessonPage.levels.b1
class Translations$lessonPage$levels$b1$en {
	Translations$lessonPage$levels$b1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'B1 - Intermediate'
	String get title => 'B1 - Intermediate';

	List<String> get lessons => [
		'Celebrities',
		'Cultural traditions',
		'Art and creativity',
		'Future plans',
		'Planning events',
		'Goals and plans',
		'Historical events',
		'Technology',
		'Never ever',
		'What is on',
		'Dream vacation',
		'Social media',
		'Book recommendations',
		'One of those days',
		'Special photos',
		'Personal achievements',
		'Favourite movies',
		'News flash',
		'Happiness',
		'A busy week',
		'Where I grew up',
		'School days',
		'Profiles',
		'Life maps',
		'Everyday',
		'What is next',
		'Suggestion making',
		'What happened',
		'Memories',
		'Culture shock',
		'Interest phrases',
		'Job interviews',
		'Bucket lists',
		'My kind of town',
		'The internet generation',
		'Popular brands',
		'Opinion phrases',
		'How does it look',
		'Living space',
		'Eating well',
		'Unusual hobbies',
		'A difficult choice',
		'Take action',
		'New skills',
		'Making a complaint',
		'Education',
		'Green cities',
		'What is in a job',
		'Personal challenges',
		'Interview phrases',
		'Polite endings',
		'Headline news',
		'Small changes',
		'Apologies excuses',
		'Phone etiquette',
		'Sorry to interrupt…',
		'Complaint responses',
	];
}

// Path: lessonPage.levels.b2
class Translations$lessonPage$levels$b2$en {
	Translations$lessonPage$levels$b2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'B2 - Upper Intermediate'
	String get title => 'B2 - Upper Intermediate';

	List<String> get lessons => [
		'Great leads',
		'Personalities',
		'Healthy lifestyle',
		'What is the truth?',
		'Personal growth',
		'Speaking out',
		'Acting out?',
		'I remember...',
		'Social feedback',
		'Crime scene',
		'Polite trouble',
		'Conflict resolution',
		'Love it or loathe it?',
		'Environmental issues',
		'We can work it out',
		'Mysteries and crimes',
		'Possible futures',
		'Business plans',
		'Meeting decisions',
		'It\'s so predictable...',
		'On the job',
		'Science and technology',
		'Time management',
		'Human rights',
	];
}

// Path: lessonPage.levels.c1
class Translations$lessonPage$levels$c1$en {
	Translations$lessonPage$levels$c1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'C1 - Advanced'
	String get title => 'C1 - Advanced';

	List<String> get lessons => [
		'Cultural norms',
		'Social media influence',
		'Career choices',
		'Accelerate performance',
		'Inventions',
		'Time travel',
		'Possessions',
		'Job skills',
		'Historical changes',
		'Review writing',
		'Mysteries',
		'Strange theories',
		'Celebrity',
		'Global politics',
		'Product boom',
		'Will be happy?',
		'Maybe later...',
		'New solutions',
		'Contextual influence',
		'A lost logo',
		'Kind acts',
		'What a movie',
		'How annoying',
		'In the news',
	];
}

// Path: lessonPage.levels.c2
class Translations$lessonPage$levels$c2$en {
	Translations$lessonPage$levels$c2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'C2 - Expert'
	String get title => 'C2 - Expert';

	List<String> get lessons => [
		'Globalization',
		'Natural disasters',
		'Reacting to information',
		'Work-life balance',
		'Remote work',
		'Family issues',
		'Basic human anatomy',
		'Health predictions',
		'Healthcare access',
		'Global travel experience',
		'Superpowers',
		'Team building',
		'Biofluorescence',
		'Dilemmas',
		'Social enthusiasm',
		'Changes',
		'Work, work, work',
		'Local issues',
		'Problems, problems',
		'Fact or fiction?',
		'Sightseeing',
		'Volunteering',
		'The mind\'s eye',
		'Media consumption',
	];
}

// Path: profilePage.faqItems.howItWorks
class Translations$profilePage$faqItems$howItWorks$en {
	Translations$profilePage$faqItems$howItWorks$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How does this app work?'
	String get question => 'How does this app work?';

	/// en: 'Our app uses artificial intelligence to analyze your emotional state through your written or spoken inputs. It provides personalized insights, mood tracking, and mental-wellness exercises designed to help you better understand and manage your emotions.'
	String get answer => 'Our app uses artificial intelligence to analyze your emotional state through your written or spoken inputs. It provides personalized insights, mood tracking, and mental-wellness exercises designed to help you better understand and manage your emotions.';
}

// Path: profilePage.faqItems.replacePsychologist
class Translations$profilePage$faqItems$replacePsychologist$en {
	Translations$profilePage$faqItems$replacePsychologist$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Can this app replace a real psychologist?'
	String get question => 'Can this app replace a real psychologist?';

	/// en: 'No. This app is designed to support your wellbeing and learning journey, but it does not replace professional mental health care. If you need clinical support, please consult a licensed specialist.'
	String get answer => 'No. This app is designed to support your wellbeing and learning journey, but it does not replace professional mental health care. If you need clinical support, please consult a licensed specialist.';
}

// Path: profilePage.faqItems.dataPrivate
class Translations$profilePage$faqItems$dataPrivate$en {
	Translations$profilePage$faqItems$dataPrivate$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Are my conversations and data private?'
	String get question => 'Are my conversations and data private?';

	/// en: 'Yes. Your conversations and personal data are kept private and handled according to our privacy policy. We do not sell your data to third parties.'
	String get answer => 'Yes. Your conversations and personal data are kept private and handled according to our privacy policy. We do not sell your data to third parties.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Notifications',
			'app.streak' => 'Learning streak',
			'app.profile' => 'Profile',
			'common.continueLabel' => 'CONTINUE',
			'common.back' => 'BACK',
			'common.locked' => 'Locked',
			'common.minutes' => ({required Object value}) => '${value} min',
			'common.close' => 'Close',
			'common.getStarted' => 'GET STARTED',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Onboarding page ${current} of ${total}',
			'onboarding.slide1.title' => 'Speak Confidently in Weeks — Not Months',
			'onboarding.slide1.body' => 'Practice real conversations with AI. Improve your accent, confidence, and fluency, daily.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'I couldn’t speak English before. Now I talk daily at work.',
			'onboarding.slide2.title' => 'A Private Tutor Without the Price',
			'onboarding.slide2.body' => 'Real conversations. Instant feedback.\nNo scheduling. No pressure.',
			'onboarding.slide2.realTutor' => 'Real Tutor',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / hr',
			'onboarding.slide2.priceLingola' => '\$9.99 / yr',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Scheduled',
			'onboarding.slide2.anytime' => 'Anytime',
			'onboarding.slide2.stressful' => 'Stressful',
			'onboarding.slide2.noPressure' => 'No pressure',
			'onboarding.slide2.price' => 'Price',
			'onboarding.slide2.availability' => 'Availability',
			'onboarding.slide2.feeling' => 'Feeling',
			'onboarding.slide3.title' => 'A Learning Plan Built Around You',
			'onboarding.slide3.body' => 'Your goals, your pace, your level.\nFrom beginner to fluent — step by step.',
			'onboarding.slide3.goal' => 'Goal',
			'onboarding.slide3.practice' => 'Practice',
			'onboarding.slide3.progress' => 'Progress',
			'targetLanguage.title' => 'Select the language you want to learn',
			'targetLanguage.comingSoon' => 'More languages are coming soon',
			'targetLanguage.korean' => 'Korean',
			'targetLanguage.portuguese' => 'Portuguese',
			'targetLanguage.portugueseBrazil' => 'Portuguese (Brazil)',
			'targetLanguage.german' => 'German',
			'targetLanguage.italian' => 'Italian',
			'targetLanguage.simplifiedChinese' => 'Simplified Chinese',
			'targetLanguage.arabic' => 'Arabic',
			'targetLanguage.turkish' => 'Turkish',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Step ${current} of ${total}',
			'language.title' => 'What do you want to speak?',
			'language.nativeSection' => 'I speak',
			'language.nativeField' => 'Native language',
			'language.nativeName' => 'Turkish',
			'language.targetSection' => 'I want to learn',
			'language.targetField' => 'Target Language',
			'language.targetName' => 'English',
			'language.direction' => 'Language direction',
			'language.selectLanguage' => 'Select language',
			'language.comingSoonBadge' => 'Coming soon...',
			'language.english' => 'English',
			'language.french' => 'French',
			'language.japanese' => 'Japanese',
			'language.spanish' => 'Spanish',
			'language.russian' => 'Russian',
			'setup.goalTitle' => 'What\'s your goal?',
			'setup.goalCareer' => 'Career Development',
			'setup.goalTravel' => 'Travel',
			'setup.goalLiving' => 'Living Abroad',
			'setup.goalStudying' => 'Studying Abroad',
			'setup.goalOther' => 'Other',
			'setup.levelTitle' => 'What\'s your current language level?',
			'setup.levelBeginner' => 'Beginner — I know a few words',
			'setup.levelIntermediate' => 'Intermediate — I can hold simple conversations',
			'setup.levelAdvanced' => 'Advanced — I speak but want to improve',
			'setup.paceTitle' => 'How fast do you want to improve?',
			'setup.paceLight' => '5-10 min/day (light)',
			'setup.paceRecommended' => '15-20 min/day (recommended)',
			'setup.paceFast' => '30+ min/day (fast results)',
			'accountCreating.title' => 'Your Personal Account Is Being Created',
			'accountCreating.stepContent' => 'Content is being created',
			'accountCreating.stepDialogues' => 'Dialogues are being prepared',
			'accountCreating.stepLessons' => 'Lessons are being optimised',
			'accountCreating.stepPlan' => 'Your plan is being finalised',
			'accountCreating.optimization' => 'Optimization',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lesson 1: Greetings',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Type a message...',
			'previewChat.incoming1' => 'Hello Emrah, it was a pleasure meeting you. Could you tell me a little about yourself?',
			'previewChat.outgoing1' => 'Hi! I just had my morning coffee and I\'m ready to find that connection you mentioned.',
			'previewChat.incoming2Highlight' => 'Günaydın',
			'previewChat.incoming2Rest' => ', Emrah! I\'m glad you\'re feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?',
			'previewChat.botReply' => 'Great! Let\'s keep practicing greetings together.',
			'paywall.title' => 'Start Speaking Today — Free',
			'paywall.subtitle' => 'Unlimited learning opportunities',
			'paywall.noCommitment' => 'No commitment',
			'paywall.cancelAnytime' => 'Cancel anytime',
			'paywall.noPaymentToday' => 'No payment today',
			'paywall.daysFree' => '3 Days Free',
			'paywall.thenPrice' => 'Then \$1.99/month',
			'paywall.trialActive' => 'Free Trial Active',
			'paywall.payableToday' => 'Payable Today',
			'paywall.payableValue' => '3 Days Free Of Charge 0.00\$',
			'paywall.paymentDate' => 'Payment date: 13 March 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Our diverse AI trainers',
			'auth.title' => 'Start Speaking a New Language, Today',
			'auth.body' => 'Practice real conversations with AI.\nNo pressure. No judgment.',
			'auth.continueGoogle' => 'Continue with Google',
			'auth.continueApple' => 'Continue with Apple',
			'auth.continueGuest' => 'Continue as Guest',
			'auth.legal' => 'By signing up for Lingola, you agree to our Terms of Service. Learn how we process your data in our Privacy Policy and Cookies Policy',
			'auth.terms' => 'Terms of Service',
			'auth.privacy' => 'Privacy Policy',
			'auth.cookies' => 'Cookies Policy',
			'nav.home' => 'Home',
			'nav.tutor' => 'Tutor',
			'nav.lesson' => 'Lesson',
			'nav.rolePlay' => 'Role Play',
			'nav.profile' => 'Profile',
			'home.streakCount' => '2',
			'home.greeting' => 'Good Morning, Jhon',
			'home.todayPractice' => 'Today’s Practice',
			'home.continueConversation' => 'Continue Conversation',
			'home.lessonProgress' => 'Lesson 2 — Greetings',
			'home.timeCurrent' => '46min',
			'home.timeTotal' => '/ 60min',
			'home.kContinue' => 'Continue',
			'home.learningPath' => 'A1 - Starter',
			'home.allLessons' => 'All Lessons',
			'home.introductions' => 'Introductions I',
			'home.greetings' => 'Greetings',
			'home.jobs' => 'Jobs',
			'home.favoriteRoom' => 'A Favorite Room',
			'home.dailyRoutine' => 'Daily Routine',
			'home.scroll' => 'Scroll',
			'home.liveLesson' => 'Live Lesson',
			'home.liveLessonSubtitle' => 'Have a video call with our tutor',
			'home.moreTutor' => 'More Tutor',
			'home.startTalkNow' => 'Start Talk Now',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adaptive',
			'home.tagCalm' => 'Calm',
			'home.tagPatient' => 'Patient',
			'home.tagMethodical' => 'Methodical',
			'home.tagEncouraging' => 'Encouraging',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'More Features',
			'home.practiceLabel' => 'PRACTICE',
			'home.wordPractice' => 'Word Practice',
			'home.wordPracticeBody' => 'Build your vocabulary in your chosen language daily',
			'home.immersiveLabel' => 'IMMERSIVE',
			'home.quiz' => 'Quiz',
			'home.quizBodyLine1' => 'Learn through real',
			'home.quizBodyLine2' => 'examples in context',
			'home.getStarted' => 'Get Started',
			'home.library' => 'Library',
			'home.libraryTitle' => 'Learn and Save',
			'home.learnMore' => 'Learn More',
			'home.premium.titleBefore' => 'The path to ',
			'home.premium.titleHighlight' => 'speaking fluently',
			'home.premium.titleAfter' => ' without fear of making mistakes.',
			'home.premium.descriptionBefore' => 'Join millions of students worldwide. Start breaking the language barrier today — ',
			'home.premium.descriptionHighlight' => 'first 3 days completely free.',
			'home.premium.feature1' => '24/7 accessible AI Tutor',
			'home.premium.feature2' => 'Unlimited access to Private Tutors',
			'home.premium.feature3' => 'Daily lesson plan tailored for you',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/mo',
			'home.premium.discount' => '40% off with annual purchase',
			'home.premium.cta' => 'Start',
			'wordPracticePage.title' => 'Word Practice',
			'wordPracticePage.turkish' => 'TURKISH',
			'wordPracticePage.save' => 'Save',
			'wordPracticePage.listen' => 'Listen',
			'wordPracticePage.hint' => 'Hint',
			'wordPracticePage.previous' => 'PREVIOUS',
			'wordPracticePage.next' => 'NEXT',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'What do you want to improve today?',
			'quizPage.subtitle' => 'Choose your training — takes less than 3 minutes 🚀',
			'quizPage.readingTitle' => 'Reading',
			'quizPage.readingBody' => 'Comprehension via articles & stories',
			'quizPage.writingTitle' => 'Writing',
			'quizPage.writingBody' => 'Grammar & vocabulary exercises',
			'quizPage.speakingTitle' => 'Speaking',
			'quizPage.speakingBody' => 'Pronunciation via AI speech engine',
			'quizPage.readingTestTitle' => 'Reading Test',
			'quizPage.read' => 'Read',
			'quizPage.listeningHint' => 'Speak the English word clearly…',
			'quizPage.micPermissionDenied' => 'Microphone or speech recognition is unavailable.',
			'quizPage.matchSuccess' => 'Great! That matches the word.',
			'quizPage.matchFail' => ({required Object heard}) => 'Heard "${heard}". Try again.',
			'quizPage.successfulTitle' => 'Successful!',
			'quizPage.successfulBody' => 'Pronunciation like a native speaker!',
			'quizPage.failedTitle' => 'Failed',
			'quizPage.failedBody' => 'It was almost happening, give it one more chance',
			'quizPage.tryAgain' => 'TRY AGAIN',
			'quizPage.writingTestTitle' => 'Writing Test',
			'quizPage.sourceLanguage' => 'SOURCE LANGUAGE',
			'quizPage.answer' => 'ANSWER',
			'quizPage.writeAnswerHint' => 'Write your answer here...',
			'quizPage.submit' => 'Submit',
			'quizPage.speakingTestTitle' => 'Speaking Test',
			'quizPage.speakingProficiency' => 'Speaking Proficiency',
			'quizPage.speakClearlyHint' => 'Speak clearly into your microphone:',
			'quizPage.speakUp' => 'Speak Up',
			'quizPage.recording' => 'Recording...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'QUESTION ${current} OF ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} is on the way',
			'placeholder.body' => ({required Object tab}) => 'We’re preparing a focused ${tab} experience for you.',
			'tutorPage.title' => 'Tutor',
			'tutorPage.chatWithLingola' => 'Chat with Lingola',
			'tutorPage.chatHistory' => 'Chat History',
			'tutorPage.history' => 'History',
			'tutorPage.filter' => 'Filter',
			'tutorPage.country' => 'Country',
			'tutorPage.focus' => 'Focus',
			'tutorPage.moreCountries' => '8+ more',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'SAVE',
			'tutorPage.startTalkNow' => 'Start Talk Now',
			'tutorPage.typeMessage' => 'Type a message...',
			'tutorPage.speaker' => 'Speaker',
			'tutorPage.messagesCount' => '12',
			'tutorPage.tutors.lingola' => 'Lingola',
			'tutorPage.tutors.elena' => 'Elena',
			'tutorPage.tutors.kaj' => 'Kaj',
			'tutorPage.tutors.mei' => 'Mei Lin',
			'tutorPage.tutors.kate' => 'Kate',
			'tutorPage.tutors.sofia' => 'Sofia',
			'tutorPage.tutors.elenaSchmidt' => 'Elena Schmidt',
			'tutorPage.tutors.kenjiSato' => 'Kenji Sato',
			'tutorPage.tags.adaptive' => 'Adaptive',
			'tutorPage.tags.calm' => 'Calm',
			'tutorPage.tags.patient' => 'Patient',
			'tutorPage.tags.organized' => 'Organized',
			'tutorPage.tags.relaxed' => 'Relaxed',
			'tutorPage.tags.methodical' => 'Methodical',
			'tutorPage.tags.attentive' => 'Attentive',
			'tutorPage.tags.more' => '+5',
			'tutorPage.historyPreview1' => 'Hey! I was about to explode with boredom...',
			'tutorPage.historyPreview2' => 'Shall we practice ordering food today?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'Yesterday',
			'tutorPage.chat.incoming1' => 'Good morning! I\'m glad you\'re feeling ready to practice today.',
			'tutorPage.chat.outgoing1' => 'Yes, let\'s start with greetings.',
			'tutorPage.chat.incoming2' => 'Perfect. How would you say hello to a colleague?',
			'tutorPage.chat.typing' => 'Typing',
			'lessonPage.title' => 'Continue to Learn',
			'lessonPage.profile' => 'Profile',
			'lessonPage.language' => 'Target language',
			'lessonPage.completed' => 'Completed',
			'lessonPage.locked' => 'Locked',
			'lessonPage.levels.a1.title' => 'A1 - Starter',
			'lessonPage.levels.a1.lessons.0' => 'Introductions I',
			'lessonPage.levels.a1.lessons.1' => 'Greetings',
			'lessonPage.levels.a1.lessons.2' => 'Jobs',
			'lessonPage.levels.a1.lessons.3' => 'A Favorite Room',
			'lessonPage.levels.a1.lessons.4' => 'Daily Routine',
			'lessonPage.levels.a1.lessons.5' => 'Fruits',
			'lessonPage.levels.a1.lessons.6' => 'Advice 1',
			'lessonPage.levels.a1.lessons.7' => 'Family 1',
			'lessonPage.levels.a1.lessons.8' => 'Everyday things',
			'lessonPage.levels.a1.lessons.9' => 'Hometown',
			'lessonPage.levels.a1.lessons.10' => 'House',
			'lessonPage.levels.a1.lessons.11' => 'Food preferences',
			'lessonPage.levels.a1.lessons.12' => 'Hobbies 1',
			'lessonPage.levels.a1.lessons.13' => 'Successful people',
			'lessonPage.levels.a1.lessons.14' => 'Food and drinks',
			'lessonPage.levels.a1.lessons.15' => 'Ordering at a restaurant',
			'lessonPage.levels.a1.lessons.16' => 'Pets',
			'lessonPage.levels.a1.lessons.17' => 'Health and fitness',
			'lessonPage.levels.a1.lessons.18' => 'Weather',
			'lessonPage.levels.a1.lessons.19' => 'New lifestyle',
			'lessonPage.levels.a1.lessons.20' => 'Getting better',
			'lessonPage.levels.a1.lessons.21' => 'Hobbies 2',
			'lessonPage.levels.a1.lessons.22' => 'Questions about places',
			'lessonPage.levels.a1.lessons.23' => 'Possession',
			'lessonPage.levels.a1.lessons.24' => 'Shopping 1',
			'lessonPage.levels.a1.lessons.25' => 'Telling the time',
			'lessonPage.levels.a1.lessons.26' => 'Directions 1',
			'lessonPage.levels.a1.lessons.27' => 'Shopping 2',
			'lessonPage.levels.a1.lessons.28' => 'Getting to know you',
			'lessonPage.levels.a1.lessons.29' => 'Places of objects',
			'lessonPage.levels.a1.lessons.30' => 'Appearances',
			'lessonPage.levels.a1.lessons.31' => 'Directions 2',
			'lessonPage.levels.a2.title' => 'A2 - Basic',
			'lessonPage.levels.a2.lessons.0' => 'Family 2',
			'lessonPage.levels.a2.lessons.1' => 'People and places',
			'lessonPage.levels.a2.lessons.2' => 'Family 3',
			'lessonPage.levels.a2.lessons.3' => 'Describing objects',
			'lessonPage.levels.a2.lessons.4' => 'City',
			'lessonPage.levels.a2.lessons.5' => 'The building project',
			'lessonPage.levels.a2.lessons.6' => 'Home sweet home',
			'lessonPage.levels.a2.lessons.7' => 'What time is it',
			'lessonPage.levels.a2.lessons.8' => 'Daily routine 2',
			'lessonPage.levels.a2.lessons.9' => 'Free time',
			'lessonPage.levels.a2.lessons.10' => 'Food and nutrition',
			'lessonPage.levels.a2.lessons.11' => 'Shopping and consumer',
			'lessonPage.levels.a2.lessons.12' => 'Holidays',
			'lessonPage.levels.a2.lessons.13' => 'Weekend plans',
			'lessonPage.levels.a2.lessons.14' => 'Formal or casual',
			'lessonPage.levels.a2.lessons.15' => 'Fashion',
			'lessonPage.levels.a2.lessons.16' => 'Shopping 3',
			'lessonPage.levels.a2.lessons.17' => 'Advice 2',
			'lessonPage.levels.a2.lessons.18' => 'You can do it',
			'lessonPage.levels.a2.lessons.19' => 'Shopping 4',
			'lessonPage.levels.a2.lessons.20' => 'Small talk',
			'lessonPage.levels.a2.lessons.21' => 'One latte please',
			'lessonPage.levels.a2.lessons.22' => 'Food',
			'lessonPage.levels.a2.lessons.23' => 'Getting around',
			'lessonPage.levels.a2.lessons.24' => 'Ready for a trip',
			'lessonPage.levels.a2.lessons.25' => 'Travel 1',
			'lessonPage.levels.a2.lessons.26' => 'Urban escapes',
			'lessonPage.levels.a2.lessons.27' => 'Travel 2',
			'lessonPage.levels.a2.lessons.28' => 'A place to stay',
			'lessonPage.levels.a2.lessons.29' => 'So exciting',
			'lessonPage.levels.a2.lessons.30' => 'The right person',
			'lessonPage.levels.a2.lessons.31' => 'School',
			'lessonPage.levels.a2.lessons.32' => 'Music preferences',
			'lessonPage.levels.a2.lessons.33' => 'Sports',
			'lessonPage.levels.a2.lessons.34' => 'Rules of the race',
			'lessonPage.levels.a2.lessons.35' => 'Leave a message',
			'lessonPage.levels.a2.lessons.36' => 'Requests',
			'lessonPage.levels.a2.lessons.37' => 'Invitations',
			'lessonPage.levels.a2.lessons.38' => 'Travel experiences',
			'lessonPage.levels.a2.lessons.39' => 'Past tense 1',
			'lessonPage.levels.a2.lessons.40' => 'Past tense 2',
			'lessonPage.levels.a2.lessons.41' => 'Past tense 3',
			'lessonPage.levels.a2.lessons.42' => 'Questions about the past',
			'lessonPage.levels.a2.lessons.43' => 'You are never too old',
			'lessonPage.levels.a2.lessons.44' => 'Childhood memories',
			'lessonPage.levels.a2.lessons.45' => 'Compliments',
			'lessonPage.levels.a2.lessons.46' => 'Excuses',
			'lessonPage.levels.a2.lessons.47' => 'It\'s so annoying!',
			'lessonPage.levels.a2.lessons.48' => 'A digital world',
			'lessonPage.levels.a2.lessons.49' => 'Work life',
			'lessonPage.levels.a2.lessons.50' => 'I did not get that',
			'lessonPage.levels.a2.lessons.51' => 'Save or spend?',
			'lessonPage.levels.a2.lessons.52' => 'Say sorry',
			'lessonPage.levels.b1.title' => 'B1 - Intermediate',
			'lessonPage.levels.b1.lessons.0' => 'Celebrities',
			'lessonPage.levels.b1.lessons.1' => 'Cultural traditions',
			'lessonPage.levels.b1.lessons.2' => 'Art and creativity',
			'lessonPage.levels.b1.lessons.3' => 'Future plans',
			'lessonPage.levels.b1.lessons.4' => 'Planning events',
			'lessonPage.levels.b1.lessons.5' => 'Goals and plans',
			'lessonPage.levels.b1.lessons.6' => 'Historical events',
			'lessonPage.levels.b1.lessons.7' => 'Technology',
			'lessonPage.levels.b1.lessons.8' => 'Never ever',
			'lessonPage.levels.b1.lessons.9' => 'What is on',
			'lessonPage.levels.b1.lessons.10' => 'Dream vacation',
			'lessonPage.levels.b1.lessons.11' => 'Social media',
			'lessonPage.levels.b1.lessons.12' => 'Book recommendations',
			'lessonPage.levels.b1.lessons.13' => 'One of those days',
			'lessonPage.levels.b1.lessons.14' => 'Special photos',
			'lessonPage.levels.b1.lessons.15' => 'Personal achievements',
			'lessonPage.levels.b1.lessons.16' => 'Favourite movies',
			'lessonPage.levels.b1.lessons.17' => 'News flash',
			'lessonPage.levels.b1.lessons.18' => 'Happiness',
			'lessonPage.levels.b1.lessons.19' => 'A busy week',
			'lessonPage.levels.b1.lessons.20' => 'Where I grew up',
			'lessonPage.levels.b1.lessons.21' => 'School days',
			'lessonPage.levels.b1.lessons.22' => 'Profiles',
			'lessonPage.levels.b1.lessons.23' => 'Life maps',
			'lessonPage.levels.b1.lessons.24' => 'Everyday',
			'lessonPage.levels.b1.lessons.25' => 'What is next',
			'lessonPage.levels.b1.lessons.26' => 'Suggestion making',
			'lessonPage.levels.b1.lessons.27' => 'What happened',
			'lessonPage.levels.b1.lessons.28' => 'Memories',
			'lessonPage.levels.b1.lessons.29' => 'Culture shock',
			'lessonPage.levels.b1.lessons.30' => 'Interest phrases',
			'lessonPage.levels.b1.lessons.31' => 'Job interviews',
			'lessonPage.levels.b1.lessons.32' => 'Bucket lists',
			'lessonPage.levels.b1.lessons.33' => 'My kind of town',
			'lessonPage.levels.b1.lessons.34' => 'The internet generation',
			'lessonPage.levels.b1.lessons.35' => 'Popular brands',
			'lessonPage.levels.b1.lessons.36' => 'Opinion phrases',
			'lessonPage.levels.b1.lessons.37' => 'How does it look',
			'lessonPage.levels.b1.lessons.38' => 'Living space',
			'lessonPage.levels.b1.lessons.39' => 'Eating well',
			'lessonPage.levels.b1.lessons.40' => 'Unusual hobbies',
			'lessonPage.levels.b1.lessons.41' => 'A difficult choice',
			'lessonPage.levels.b1.lessons.42' => 'Take action',
			'lessonPage.levels.b1.lessons.43' => 'New skills',
			'lessonPage.levels.b1.lessons.44' => 'Making a complaint',
			'lessonPage.levels.b1.lessons.45' => 'Education',
			'lessonPage.levels.b1.lessons.46' => 'Green cities',
			'lessonPage.levels.b1.lessons.47' => 'What is in a job',
			'lessonPage.levels.b1.lessons.48' => 'Personal challenges',
			'lessonPage.levels.b1.lessons.49' => 'Interview phrases',
			'lessonPage.levels.b1.lessons.50' => 'Polite endings',
			'lessonPage.levels.b1.lessons.51' => 'Headline news',
			'lessonPage.levels.b1.lessons.52' => 'Small changes',
			'lessonPage.levels.b1.lessons.53' => 'Apologies excuses',
			'lessonPage.levels.b1.lessons.54' => 'Phone etiquette',
			'lessonPage.levels.b1.lessons.55' => 'Sorry to interrupt…',
			'lessonPage.levels.b1.lessons.56' => 'Complaint responses',
			'lessonPage.levels.b2.title' => 'B2 - Upper Intermediate',
			'lessonPage.levels.b2.lessons.0' => 'Great leads',
			'lessonPage.levels.b2.lessons.1' => 'Personalities',
			'lessonPage.levels.b2.lessons.2' => 'Healthy lifestyle',
			'lessonPage.levels.b2.lessons.3' => 'What is the truth?',
			'lessonPage.levels.b2.lessons.4' => 'Personal growth',
			'lessonPage.levels.b2.lessons.5' => 'Speaking out',
			'lessonPage.levels.b2.lessons.6' => 'Acting out?',
			'lessonPage.levels.b2.lessons.7' => 'I remember...',
			'lessonPage.levels.b2.lessons.8' => 'Social feedback',
			'lessonPage.levels.b2.lessons.9' => 'Crime scene',
			'lessonPage.levels.b2.lessons.10' => 'Polite trouble',
			'lessonPage.levels.b2.lessons.11' => 'Conflict resolution',
			'lessonPage.levels.b2.lessons.12' => 'Love it or loathe it?',
			'lessonPage.levels.b2.lessons.13' => 'Environmental issues',
			'lessonPage.levels.b2.lessons.14' => 'We can work it out',
			'lessonPage.levels.b2.lessons.15' => 'Mysteries and crimes',
			'lessonPage.levels.b2.lessons.16' => 'Possible futures',
			'lessonPage.levels.b2.lessons.17' => 'Business plans',
			'lessonPage.levels.b2.lessons.18' => 'Meeting decisions',
			'lessonPage.levels.b2.lessons.19' => 'It\'s so predictable...',
			'lessonPage.levels.b2.lessons.20' => 'On the job',
			'lessonPage.levels.b2.lessons.21' => 'Science and technology',
			'lessonPage.levels.b2.lessons.22' => 'Time management',
			'lessonPage.levels.b2.lessons.23' => 'Human rights',
			'lessonPage.levels.c1.title' => 'C1 - Advanced',
			'lessonPage.levels.c1.lessons.0' => 'Cultural norms',
			'lessonPage.levels.c1.lessons.1' => 'Social media influence',
			'lessonPage.levels.c1.lessons.2' => 'Career choices',
			'lessonPage.levels.c1.lessons.3' => 'Accelerate performance',
			'lessonPage.levels.c1.lessons.4' => 'Inventions',
			'lessonPage.levels.c1.lessons.5' => 'Time travel',
			'lessonPage.levels.c1.lessons.6' => 'Possessions',
			'lessonPage.levels.c1.lessons.7' => 'Job skills',
			'lessonPage.levels.c1.lessons.8' => 'Historical changes',
			'lessonPage.levels.c1.lessons.9' => 'Review writing',
			'lessonPage.levels.c1.lessons.10' => 'Mysteries',
			'lessonPage.levels.c1.lessons.11' => 'Strange theories',
			'lessonPage.levels.c1.lessons.12' => 'Celebrity',
			'lessonPage.levels.c1.lessons.13' => 'Global politics',
			'lessonPage.levels.c1.lessons.14' => 'Product boom',
			'lessonPage.levels.c1.lessons.15' => 'Will be happy?',
			'lessonPage.levels.c1.lessons.16' => 'Maybe later...',
			'lessonPage.levels.c1.lessons.17' => 'New solutions',
			'lessonPage.levels.c1.lessons.18' => 'Contextual influence',
			'lessonPage.levels.c1.lessons.19' => 'A lost logo',
			'lessonPage.levels.c1.lessons.20' => 'Kind acts',
			'lessonPage.levels.c1.lessons.21' => 'What a movie',
			'lessonPage.levels.c1.lessons.22' => 'How annoying',
			'lessonPage.levels.c1.lessons.23' => 'In the news',
			'lessonPage.levels.c2.title' => 'C2 - Expert',
			'lessonPage.levels.c2.lessons.0' => 'Globalization',
			'lessonPage.levels.c2.lessons.1' => 'Natural disasters',
			'lessonPage.levels.c2.lessons.2' => 'Reacting to information',
			'lessonPage.levels.c2.lessons.3' => 'Work-life balance',
			'lessonPage.levels.c2.lessons.4' => 'Remote work',
			'lessonPage.levels.c2.lessons.5' => 'Family issues',
			'lessonPage.levels.c2.lessons.6' => 'Basic human anatomy',
			'lessonPage.levels.c2.lessons.7' => 'Health predictions',
			'lessonPage.levels.c2.lessons.8' => 'Healthcare access',
			'lessonPage.levels.c2.lessons.9' => 'Global travel experience',
			'lessonPage.levels.c2.lessons.10' => 'Superpowers',
			'lessonPage.levels.c2.lessons.11' => 'Team building',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescence',
			'lessonPage.levels.c2.lessons.13' => 'Dilemmas',
			'lessonPage.levels.c2.lessons.14' => 'Social enthusiasm',
			'lessonPage.levels.c2.lessons.15' => 'Changes',
			'lessonPage.levels.c2.lessons.16' => 'Work, work, work',
			'lessonPage.levels.c2.lessons.17' => 'Local issues',
			'lessonPage.levels.c2.lessons.18' => 'Problems, problems',
			'lessonPage.levels.c2.lessons.19' => 'Fact or fiction?',
			'lessonPage.levels.c2.lessons.20' => 'Sightseeing',
			'lessonPage.levels.c2.lessons.21' => 'Volunteering',
			'lessonPage.levels.c2.lessons.22' => 'The mind\'s eye',
			'lessonPage.levels.c2.lessons.23' => 'Media consumption',
			'rolePlayPage.title' => 'Role Play',
			'rolePlayPage.subtitle' => 'Choose your role — experience a real-life scenario 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} completed',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Beginner',
			'rolePlayPage.screenplay' => 'SCREENPLAY',
			'rolePlayPage.dailyInteractions' => 'Daily Interactions',
			'rolePlayPage.business' => 'Business',
			'rolePlayPage.coffee.title' => 'Ordering at the Coffee Shop',
			'rolePlayPage.coffee.screenplay' => 'Order your favorite drink, ask about sizes and extras, confirm your total, and pick up your coffee at the counter.',
			'rolePlayPage.directions.title' => 'Asking for Directions on the Street',
			'rolePlayPage.directions.screenplay' => 'Ask for directions to a place, find out how to get to the subway or bus, get information about tickets, and listen to restaurant recommendations.',
			'rolePlayPage.interview.title' => 'Job Interview',
			'rolePlayPage.interview.screenplay' => 'Introduce yourself, answer common interview questions, talk about your experience, and ask about the role and next steps.',
			'notificationsPage.title' => 'Notifications',
			'notificationsPage.translation.title' => 'New Translation Ready',
			'notificationsPage.translation.body' => 'Your audio translation file has been successfully converted to text and translated.',
			'notificationsPage.offer.title' => 'A Special Offer Awaits You',
			'notificationsPage.offer.body' => 'Upgrade to Premium for unlimited photo translations at 50% off.',
			'notificationsPage.stories.title' => 'Discover New Stories',
			'notificationsPage.stories.body' => 'Learn new words through stories',
			'profilePage.title' => 'Profile',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Free Version',
			'profilePage.dayStreak' => 'Day Streak!',
			'profilePage.accountSettings' => 'Account Settings',
			'profilePage.general' => 'General',
			'profilePage.profileSettings' => 'Profile Settings',
			'profilePage.fullName' => 'Full Name',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Delete Account',
			'profilePage.save' => 'SAVE',
			'profilePage.deleteTitle' => 'Gitmeni istemiyoruz ama seni anlıyoruz.',
			'profilePage.deleteBody' => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?',
			'profilePage.deleteReasons.aiCharacters' => 'Yapay zeka karakterlerini gerçekçi bulmadım.',
			'profilePage.deleteReasons.videoIssues' => 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.',
			'profilePage.deleteReasons.pricing' => 'Abonelik fiyatları beklentimin üzerinde.',
			_ => null,
		} ?? switch (path) {
			'profilePage.deleteReasons.noMatch' => 'Aradığım tarzda karakterler bulamadım.',
			'profilePage.deleteReasons.shortTrial' => 'Sadece kısa bir süreliğine denemek istemiştim.',
			'profilePage.deleteReasons.other' => 'Diğer',
			'profilePage.messageOptional' => 'Mesaj (opsiyonel)',
			'profilePage.messageHint' => 'Mesajınız varsa lütfen yazın.',
			'profilePage.next' => 'NEXT',
			'profilePage.specialOfferTitle' => 'Özel teklif',
			'profilePage.specialOfferBody' => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.',
			'profilePage.monthlyPlanTitle' => 'Switch to 1-Month Plan',
			'profilePage.monthlyPlanPrice' => '\$79/month, cancel anytime',
			'profilePage.monthlyPlanDesc' => 'No long-term commitment. Stay connected with our community on a month-to-month basis.',
			'profilePage.whatYoullKeep' => 'What you\'ll keep:',
			'profilePage.keepCharacters' => 'Access all characters',
			'profilePage.keepVideo' => 'Unlimited video calls',
			'profilePage.keepCourses' => 'Access to all courses',
			'profilePage.switchMonthlyCta' => 'Switch to Monthly Plan',
			'profilePage.confirmTitle' => 'Are you sure?',
			'profilePage.confirmBody' => 'We really don\'t want to see you go. Here\'s what you\'ll lose:',
			'profilePage.loseCharacters' => 'Unlimited character access',
			'profilePage.loseVideo' => 'Unlimited video call access',
			'profilePage.loseCourses' => 'Access to all courses',
			'profilePage.discountTitle' => 'Stay and get 60% off for 1 month',
			'profilePage.discountSubtitle' => 'Our best offer ever. Just \$27.60/month',
			'profilePage.acceptDiscountCta' => 'Accept 60% Off & Stay',
			'profilePage.farewellTitle' => 'We\'re sad to see you go',
			'profilePage.farewellBody' => ({required Object date}) => 'Your membership has been cancelled. You\'ll have access until the end of your current billing period on ${date}.',
			'profilePage.changeMindTitle' => '✨ Change your mind?',
			'profilePage.changeMindBody' => ({required Object date}) => 'You can reactivate your membership anytime before ${date} to keep your benefits.',
			'profilePage.reactivateCta' => 'Wait, I want to reactivate',
			'profilePage.done' => 'DONE',
			'profilePage.notifications' => 'Notifications',
			'profilePage.appLanguage' => 'App Language',
			'profilePage.selectLanguageTitle' => 'Select Language',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passive',
			'profilePage.shareFriend' => 'Share Friend',
			'profilePage.shareWithFriendTitle' => 'Share with Friend',
			'profilePage.shareInviteBody' => 'Invite your friends and enjoy translate together',
			'profilePage.rateUs' => 'Rate Us',
			'profilePage.faq' => 'F.A.Q.',
			'profilePage.faqItems.howItWorks.question' => 'How does this app work?',
			'profilePage.faqItems.howItWorks.answer' => 'Our app uses artificial intelligence to analyze your emotional state through your written or spoken inputs. It provides personalized insights, mood tracking, and mental-wellness exercises designed to help you better understand and manage your emotions.',
			'profilePage.faqItems.replacePsychologist.question' => 'Can this app replace a real psychologist?',
			'profilePage.faqItems.replacePsychologist.answer' => 'No. This app is designed to support your wellbeing and learning journey, but it does not replace professional mental health care. If you need clinical support, please consult a licensed specialist.',
			'profilePage.faqItems.dataPrivate.question' => 'Are my conversations and data private?',
			'profilePage.faqItems.dataPrivate.answer' => 'Yes. Your conversations and personal data are kept private and handled according to our privacy policy. We do not sell your data to third parties.',
			'profilePage.support' => 'Support',
			'profilePage.feedback' => 'Feedback',
			'profilePage.progression' => 'Progression',
			'profilePage.progressTitle' => 'Progress',
			'profilePage.goodMorning' => 'Good Morning,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'English',
			'profilePage.past7Days' => 'Past 7 Days',
			'profilePage.past7DaysBody' => 'Study every day to build your streak and create a powerful learning habit.',
			'profilePage.currentLevel' => 'Current Level',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Just ${xp} XP left to reach ${level}!',
			'profilePage.toNextLevel' => 'TO NEXT LEVEL',
			'profilePage.dayStreakLabel' => 'Day Streak',
			'profilePage.totalPoints' => 'Total Points',
			'profilePage.savedWords' => 'Saved Words',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} items to review',
			'profilePage.logout' => 'Log Out',
			'profilePage.logoutTitle' => 'You are about to log out',
			'profilePage.logoutBody' => 'See you again soon! We\'ll miss your breathing exercises.',
			'profilePage.logoutConfirm' => 'LOGOUT',
			'profilePage.logoutCancel' => 'CANCEL',
			'profilePage.days.mon' => 'MON',
			'profilePage.days.tue' => 'TUE',
			'profilePage.days.wed' => 'WED',
			'profilePage.days.thu' => 'THU',
			'profilePage.days.fri' => 'FRI',
			'profilePage.days.sat' => 'SAT',
			'profilePage.days.sun' => 'SUN',
			_ => null,
		};
	}
}
