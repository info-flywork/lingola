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
	late final Translations$apiErrors$en apiErrors = Translations$apiErrors$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$targetLanguage$en targetLanguage = Translations$targetLanguage$en._(_root);
	late final Translations$language$en language = Translations$language$en._(_root);
	late final Translations$setup$en setup = Translations$setup$en._(_root);
	late final Translations$accountCreating$en accountCreating = Translations$accountCreating$en._(_root);
	late final Translations$planReady$en planReady = Translations$planReady$en._(_root);
	late final Translations$demoChat$en demoChat = Translations$demoChat$en._(_root);
	late final Translations$previewChat$en previewChat = Translations$previewChat$en._(_root);
	late final Translations$paywall$en paywall = Translations$paywall$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$libraryPage$en libraryPage = Translations$libraryPage$en._(_root);
	late final Translations$wordPracticePage$en wordPracticePage = Translations$wordPracticePage$en._(_root);
	late final Translations$quizPage$en quizPage = Translations$quizPage$en._(_root);
	late final Translations$placeholder$en placeholder = Translations$placeholder$en._(_root);
	late final Translations$tutorPage$en tutorPage = Translations$tutorPage$en._(_root);
	late final Translations$lessonPage$en lessonPage = Translations$lessonPage$en._(_root);
	late final Translations$rolePlayPage$en rolePlayPage = Translations$rolePlayPage$en._(_root);
	late final Translations$pushNotifications$en pushNotifications = Translations$pushNotifications$en._(_root);
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

	/// en: 'No connection. Check your internet and try again.'
	String get connectionError => 'No connection. Check your internet and try again.';

	/// en: 'Something went wrong. Please try again.'
	String get genericError => 'Something went wrong. Please try again.';

	/// en: 'Try again'
	String get tryAgain => 'Try again';
}

// Path: apiErrors
class Translations$apiErrors$en {
	Translations$apiErrors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please sign in again.'
	String get unauthorized => 'Please sign in again.';

	/// en: 'We couldn't find what you were looking for.'
	String get notFound => 'We couldn\'t find what you were looking for.';

	/// en: 'Please check your input and try again.'
	String get validationFailed => 'Please check your input and try again.';

	/// en: 'Name cannot be empty.'
	String get nameRequired => 'Name cannot be empty.';

	/// en: 'Please choose a photo to upload.'
	String get imageRequired => 'Please choose a photo to upload.';

	/// en: 'Only JPEG, PNG, or WebP photos are allowed.'
	String get avatarInvalidType => 'Only JPEG, PNG, or WebP photos are allowed.';

	/// en: 'The selected photo is empty.'
	String get avatarEmpty => 'The selected photo is empty.';

	/// en: 'Photo is too large (max 5 MB).'
	String get avatarTooLarge => 'Photo is too large (max 5 MB).';

	/// en: 'Notification preference is required.'
	String get notificationsRequired => 'Notification preference is required.';

	/// en: 'Premium is required for this lesson.'
	String get premiumRequired => 'Premium is required for this lesson.';

	/// en: 'Complete earlier lessons to unlock this level.'
	String get levelRequired => 'Complete earlier lessons to unlock this level.';

	/// en: 'Something went wrong. Please try again.'
	String get internalError => 'Something went wrong. Please try again.';
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

	/// en: 'Which language do you want to learn?'
	String get title => 'Which language do you want to learn?';

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

	/// en: 'A1 — I know a few words'
	String get levelA1 => 'A1 — I know a few words';

	/// en: 'A2 — I can use simple phrases'
	String get levelA2 => 'A2 — I can use simple phrases';

	/// en: 'B1 — I can hold everyday conversations'
	String get levelB1 => 'B1 — I can hold everyday conversations';

	/// en: 'B2 — I communicate fluently on familiar topics'
	String get levelB2 => 'B2 — I communicate fluently on familiar topics';

	/// en: 'C1 — Advanced, I want to refine my skills'
	String get levelC1 => 'C1 — Advanced, I want to refine my skills';

	/// en: 'C2 — Near-native mastery'
	String get levelC2 => 'C2 — Near-native mastery';

	/// en: 'How fast do you want to improve?'
	String get paceTitle => 'How fast do you want to improve?';

	/// en: 'When you ask questions in your language, how should we explain?'
	String get explanationTitle => 'When you ask questions in your language, how should we explain?';

	/// en: 'You can change this anytime in Profile settings.'
	String get explanationHint => 'You can change this anytime in Profile settings.';

	/// en: 'Explain in my native language'
	String get explanationNative => 'Explain in my native language';

	/// en: 'Explain in English'
	String get explanationEnglish => 'Explain in English';

	/// en: '5 min/day'
	String get paceMin5 => '5 min/day';

	/// en: '10 min/day'
	String get paceMin10 => '10 min/day';

	/// en: '15 min/day'
	String get paceMin15 => '15 min/day';

	/// en: '30 min/day'
	String get paceMin30 => '30 min/day';

	/// en: '60 min/day'
	String get paceMin60 => '60 min/day';
}

// Path: accountCreating
class Translations$accountCreating$en {
	Translations$accountCreating$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Personal Account Is Being Created'
	String get title => 'Your Personal Account Is Being Created';

	/// en: 'Building your'
	String get titleLine1 => 'Building your';

	/// en: 'Account'
	String get titleLine2 => 'Account';

	/// en: 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I'm not stopping now.'
	String get testimonialQuote => 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I\'m not stopping now.';

	/// en: 'Maria, 29 — 3 months in'
	String get testimonialAuthor => 'Maria, 29 — 3 months in';

	/// en: 'Learn 600+ extra phrases about 30× faster with Lingola than studying entirely on your own.'
	String get comparisonPitch => 'Learn 600+ extra phrases about 30× faster with Lingola than studying entirely on your own.';

	/// en: '400'
	String get comparisonAloneCount => '400';

	/// en: '1000'
	String get comparisonLingolaCount => '1000';

	/// en: 'PHRASES'
	String get comparisonUnit => 'PHRASES';

	/// en: 'On your own'
	String get comparisonAloneLabel => 'On your own';

	/// en: 'Lingola'
	String get comparisonLingolaLabel => 'Lingola';

	/// en: 'From today to fluency — your next level is only 30 days away'
	String get fluencyPitch => 'From today to fluency — your next level is only 30 days away';

	/// en: 'Today'
	String get chartToday => 'Today';

	/// en: '15 Sep'
	String get chartMid => '15 Sep';

	/// en: '30 Sep'
	String get chartEnd => '30 Sep';

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

// Path: planReady
class Translations$planReady$en {
	Translations$planReady$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your plan is'
	String get titleLine1 => 'Your plan is';

	/// en: 'Ready!'
	String get titleLine2 => 'Ready!';

	/// en: '95% of users see results within the first 7 days'
	String get statBanner => '95% of users see results within the first 7 days';

	/// en: '$name'S PLAN'
	String planTitle({required Object name}) => '${name}\'S PLAN';

	/// en: 'YOUR'
	String get defaultName => 'YOUR';

	/// en: 'COURSE'
	String get fieldCourse => 'COURSE';

	/// en: 'YOUR LEVEL'
	String get fieldLevel => 'YOUR LEVEL';

	/// en: 'FOCUS AREA'
	String get fieldFocus => 'FOCUS AREA';

	/// en: 'DURATION'
	String get fieldDuration => 'DURATION';

	/// en: 'INTERESTS'
	String get fieldInterests => 'INTERESTS';

	/// en: 'Start my plan →'
	String get startPlan => 'Start my plan →';

	/// en: 'English'
	String get courseEnglish => 'English';

	/// en: 'German'
	String get courseGerman => 'German';

	/// en: 'French'
	String get courseFrench => 'French';

	/// en: 'Italian'
	String get courseItalian => 'Italian';

	/// en: 'Spanish'
	String get courseSpanish => 'Spanish';

	/// en: 'Japanese'
	String get courseJapanese => 'Japanese';

	/// en: 'Russian'
	String get courseRussian => 'Russian';

	/// en: 'Turkish'
	String get courseTurkish => 'Turkish';

	/// en: 'Career & business'
	String get goalCareer => 'Career & business';

	/// en: 'Travel'
	String get goalTravel => 'Travel';

	/// en: 'Living abroad'
	String get goalLiving => 'Living abroad';

	/// en: 'Studying abroad'
	String get goalStudying => 'Studying abroad';

	/// en: 'Other'
	String get goalOther => 'Other';

	/// en: 'A1'
	String get levelA1 => 'A1';

	/// en: 'A2'
	String get levelA2 => 'A2';

	/// en: 'B1'
	String get levelB1 => 'B1';

	/// en: 'B2'
	String get levelB2 => 'B2';

	/// en: 'C1'
	String get levelC1 => 'C1';

	/// en: 'C2'
	String get levelC2 => 'C2';

	/// en: '5 min/day'
	String get paceMin5 => '5 min/day';

	/// en: '10 min/day'
	String get paceMin10 => '10 min/day';

	/// en: '15 min/day'
	String get paceMin15 => '15 min/day';

	/// en: '30 min/day'
	String get paceMin30 => '30 min/day';

	/// en: '60 min/day'
	String get paceMin60 => '60 min/day';
}

// Path: demoChat
class Translations$demoChat$en {
	Translations$demoChat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get brand => 'Lingola';

	/// en: 'Getting to know you'
	String get lessonBadge => 'Getting to know you';

	/// en: '1x'
	String get speed => '1x';

	/// en: 'Type a message...'
	String get typeMessage => 'Type a message...';

	/// en: 'Hi! I'm your AI tutor. Before we start — if you'd rather not continue in English, or if you don't understand something, just tell me and I'll switch to your language. Hope you're doing well! Let's learn a bit about you — are you working right now, or are you a student?'
	String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
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

	/// en: 'Hi! Welcome to Lingola — I'm your AI tutor. Whatever your level, don't worry — you'll feel safe here while you learn English. To say hello in English, you say 'Hi' or 'Hello' — try it: type 'Hi!' to me!'
	String get incoming1 => 'Hi! Welcome to Lingola — I\'m your AI tutor. Whatever your level, don\'t worry — you\'ll feel safe here while you learn English. To say hello in English, you say \'Hi\' or \'Hello\' — try it: type \'Hi!\' to me!';

	/// en: 'Hi! I'm ready to practice.'
	String get outgoing1 => 'Hi! I\'m ready to practice.';

	/// en: 'Günaydın'
	String get incoming2Highlight => 'Günaydın';

	/// en: ', Emrah! I'm glad you're feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?'
	String get incoming2Rest => ', Emrah! I\'m glad you\'re feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?';

	/// en: 'Hold to speak'
	String get holdToSpeak => 'Hold to speak';

	/// en: 'Recording… release to send'
	String get recording => 'Recording… release to send';

	/// en: 'Slide up to lock'
	String get slideUpToLock => 'Slide up to lock';

	/// en: 'Slide left to cancel'
	String get slideLeftToCancel => 'Slide left to cancel';

	/// en: 'Tap send when finished'
	String get recordingLockedHint => 'Tap send when finished';
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

	/// en: 'or'
	String get or => 'or';

	/// en: 'Already have an account?'
	String get alreadyHaveAccount => 'Already have an account?';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

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

	/// en: 'Continue with $name, or choose another tutor?'
	String continueWithTutor({required Object name}) => 'Continue with ${name}, or choose another tutor?';

	/// en: 'Continue with $name'
	String continueSameTutor({required Object name}) => 'Continue with ${name}';

	/// en: 'Choose another tutor'
	String get chooseOtherTutor => 'Choose another tutor';

	/// en: '$value min left'
	String minutesLeft({required Object value}) => '${value} min left';

	/// en: 'Lesson 2 — Greetings'
	String get lessonProgress => 'Lesson 2 — Greetings';

	/// en: '0min'
	String get timeCurrent => '0min';

	/// en: '/ 15min'
	String get timeTotal => '/ 15min';

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

// Path: libraryPage
class Translations$libraryPage$en {
	Translations$libraryPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Library'
	String get title => 'Library';

	/// en: 'Search Word'
	String get searchWord => 'Search Word';

	/// en: '$count Saved Word'
	String savedWordCount({required Object count}) => '${count} Saved Word';

	/// en: 'Saved Word'
	String get savedWordTab => 'Saved Word';

	/// en: 'Dictionary'
	String get dictionaryTab => 'Dictionary';

	/// en: 'Dictionary'
	String get dictionaryLabel => 'Dictionary';
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

	/// en: 'Saved'
	String get saved => 'Saved';

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

	/// en: 'Chat'
	String get startChat => 'Chat';

	/// en: 'Chat with $name'
	String chatWithTutor({required Object name}) => 'Chat with ${name}';

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

	/// en: 'Clear filters'
	String get clearFilter => 'Clear filters';

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
	late final Translations$tutorPage$calling$en calling = Translations$tutorPage$calling$en._(_root);
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

	/// en: 'Choose your tutor'
	String get pickTutorTitle => 'Choose your tutor';

	/// en: 'Start lesson'
	String get startTalk => 'Start lesson';

	/// en: 'Chat'
	String get chatInstead => 'Chat';

	/// en: 'Finish the previous lesson to unlock this one.'
	String get lockedHint => 'Finish the previous lesson to unlock this one.';

	/// en: 'Level locked'
	String get levelLockedTitle => 'Level locked';

	/// en: 'Your English level is $userLevel, so you can't open $lessonLevel lessons without completing the earlier path.'
	String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Your English level is ${userLevel}, so you can\'t open ${lessonLevel} lessons without completing the earlier path.';

	/// en: 'Got it'
	String get levelLockedOk => 'Got it';

	/// en: 'Lesson notes'
	String get notesTitle => 'Lesson notes';

	/// en: 'What we learned today'
	String get whatWeLearned => 'What we learned today';

	/// en: 'Delete my lesson notes'
	String get deleteNotes => 'Delete my lesson notes';

	/// en: 'Delete these notes? This cannot be undone.'
	String get deleteNotesConfirm => 'Delete these notes? This cannot be undone.';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'If this felt too hard, you can practice the same topic again.'
	String get practiceCta => 'If this felt too hard, you can practice the same topic again.';

	/// en: 'Practice this topic'
	String get practiceNow => 'Practice this topic';

	/// en: 'Open chat with tutor'
	String get openChat => 'Open chat with tutor';

	/// en: 'Your score'
	String get yourScore => 'Your score';

	/// en: 'Best $score/100'
	String bestScore({required Object score}) => 'Best ${score}/100';

	/// en: '$prev → $now'
	String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';

	/// en: 'Passive participant'
	String get participationSilent => 'Passive participant';

	/// en: 'You stayed quiet this time. I think you should retake this lesson.'
	String get participationSilentBody => 'You stayed quiet this time. I think you should retake this lesson.';

	/// en: 'Low participation'
	String get participationPassive => 'Low participation';

	/// en: 'You barely spoke. Try the lesson again and say more.'
	String get participationPassiveBody => 'You barely spoke. Try the lesson again and say more.';

	/// en: 'Good participation'
	String get participationActive => 'Good participation';

	/// en: 'You joined the conversation. Keep it up!'
	String get participationActiveBody => 'You joined the conversation. Keep it up!';

	/// en: 'Strong participation'
	String get participationStrong => 'Strong participation';

	/// en: 'You spoke a lot. Great work!'
	String get participationStrongBody => 'You spoke a lot. Great work!';

	/// en: 'Retake this lesson'
	String get retakeLesson => 'Retake this lesson';

	/// en: 'Finish lesson'
	String get finishLesson => 'Finish lesson';

	/// en: 'Your tutor is writing today’s notes…'
	String get savingNotes => 'Your tutor is writing today’s notes…';

	/// en: 'Finish this lesson to get notes from your tutor.'
	String get noNotes => 'Finish this lesson to get notes from your tutor.';

	/// en: 'Lesson notes deleted'
	String get notesDeleted => 'Lesson notes deleted';

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

	/// en: 'Intermediate'
	String get intermediate => 'Intermediate';

	/// en: 'Beginner–Intermediate'
	String get beginnerIntermediate => 'Beginner–Intermediate';

	/// en: 'SCREENPLAY'
	String get screenplay => 'SCREENPLAY';

	/// en: 'Daily Interactions'
	String get dailyInteractions => 'Daily Interactions';

	/// en: 'Business'
	String get business => 'Business';

	/// en: 'Your scenarios'
	String get customScenarios => 'Your scenarios';

	/// en: 'Create your own scenario!'
	String get createOwnScenario => 'Create your\nown scenario!';

	/// en: 'Create your scenario'
	String get createOwnScenarioTitle => 'Create your scenario';

	/// en: 'Scenario'
	String get createFieldScenario => 'Scenario';

	/// en: 'e.g. business meeting'
	String get createFieldScenarioHint => 'e.g. business meeting';

	/// en: 'Tutor role'
	String get createFieldTutorRole => 'Tutor role';

	/// en: 'e.g. interviewer'
	String get createFieldTutorRoleHint => 'e.g. interviewer';

	/// en: 'Your role'
	String get createFieldYourRole => 'Your role';

	/// en: 'e.g. candidate'
	String get createFieldYourRoleHint => 'e.g. candidate';

	/// en: 'Extra details (optional)'
	String get createFieldExtraInfo => 'Extra details (optional)';

	/// en: 'e.g. senior software developer interview at a tech company'
	String get createFieldExtraInfoHint => 'e.g. senior software developer interview at a tech company';

	/// en: 'Continue'
	String get createOwnScenarioContinue => 'Continue';

	/// en: 'Please fill in scenario and both roles.'
	String get createFieldsRequired => 'Please fill in scenario and both roles.';

	/// en: 'Creating your role play'
	String get creatingScenario => 'Creating your role play';

	/// en: 'Lingola is writing your scene and illustration...'
	String get creatingScenarioSubtitle => 'Lingola is writing your scene and illustration...';

	/// en: 'Could not create scenario. Please try again.'
	String get createFailed => 'Could not create scenario. Please try again.';

	late final Translations$rolePlayPage$coffee$en coffee = Translations$rolePlayPage$coffee$en._(_root);
	late final Translations$rolePlayPage$directions$en directions = Translations$rolePlayPage$directions$en._(_root);
	late final Translations$rolePlayPage$interview$en interview = Translations$rolePlayPage$interview$en._(_root);
	late final Translations$rolePlayPage$missedTrain$en missedTrain = Translations$rolePlayPage$missedTrain$en._(_root);
	late final Translations$rolePlayPage$flightAttendant$en flightAttendant = Translations$rolePlayPage$flightAttendant$en._(_root);
	late final Translations$rolePlayPage$trainTicket$en trainTicket = Translations$rolePlayPage$trainTicket$en._(_root);
	late final Translations$rolePlayPage$restaurantReservation$en restaurantReservation = Translations$rolePlayPage$restaurantReservation$en._(_root);
	late final Translations$rolePlayPage$doctorAppointment$en doctorAppointment = Translations$rolePlayPage$doctorAppointment$en._(_root);
	late final Translations$rolePlayPage$shoppingClothes$en shoppingClothes = Translations$rolePlayPage$shoppingClothes$en._(_root);
	late final Translations$rolePlayPage$takingTaxi$en takingTaxi = Translations$rolePlayPage$takingTaxi$en._(_root);
	late final Translations$rolePlayPage$rentingApartment$en rentingApartment = Translations$rolePlayPage$rentingApartment$en._(_root);
	late final Translations$rolePlayPage$birthdayParty$en birthdayParty = Translations$rolePlayPage$birthdayParty$en._(_root);

	/// en: 'Could not delete scenario. Please try again.'
	String get deleteFailed => 'Could not delete scenario. Please try again.';
}

// Path: pushNotifications
class Translations$pushNotifications$en {
	Translations$pushNotifications$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get title => 'Lingola';

	List<String> get h2 => [
		'Looks like you took a short break.',
		'Got a moment for one word?',
		'We\'re here — no rush.',
		'Your learning rhythm paused for a bit.',
		'A mini review might feel good.',
	];
	List<String> get h4 => [
		'A new word might be waiting for you today 👀',
		'You might be missing a quick practice.',
		'You might have skipped a useful phrase.',
		'Today\'s progress is still open.',
		'One word, one sentence… maybe both.',
	];
	List<String> get h8 => [
		'You don\'t have to progress every day.',
		'Even a little review counts.',
		'You didn\'t lose anything by not studying today.',
		'We\'re ready when you are.',
		'Language learning is a marathon, not a sprint.',
	];
	List<String> get h24 => [
		'A day passed. Your words are still here.',
		'Taking a break is normal.',
		'Your place is right where you left it.',
		'Continue whenever you want.',
		'Language won\'t run away — neither will we.',
	];

	/// en: 'Today's lesson is waiting'
	String get lessonReminderTitle => 'Today\'s lesson is waiting';

	List<String> get lessonReminder => [
		'You haven\'t opened today\'s lesson yet — even 5 minutes counts.',
		'Your tutor is ready. Pick up where you left off.',
		'A short lesson today keeps your rhythm going.',
		'Today\'s lesson is still open — want to jump in?',
	];

	/// en: 'Ready for a quick quiz?'
	String get quizReminderTitle => 'Ready for a quick quiz?';

	/// en: 'You learned $count words recently — want a quiz? $savedCount saved words are waiting.'
	String quizReminderWords({required Object count, required Object savedCount}) => 'You learned ${count} words recently — want a quiz? ${savedCount} saved words are waiting.';

	/// en: '$savedCount saved words are waiting for review.'
	String quizReminderSaved({required Object savedCount}) => '${savedCount} saved words are waiting for review.';

	List<String> get quizReminder => [
		'It\'s been a while since your last quiz — a 3-minute review could help.',
		'Your saved words miss you. A quick quiz?',
		'Test what you remember — it only takes a few minutes.',
		'A short quiz now makes tomorrow easier.',
	];

	/// en: 'Don't miss today's practice'
	String get eveningLessonTitle => 'Don\'t miss today\'s practice';

	List<String> get eveningLesson => [
		'You haven\'t studied today yet. One short lesson keeps the habit alive.',
		'Before the day ends — a quick lesson with your tutor?',
		'There\'s still time for a 5-minute English session today.',
		'Your daily lesson is waiting. Shall we start?',
	];

	/// en: 'Keep your streak'
	String get streakReminderTitle => 'Keep your streak';

	/// en: 'You're on a $streak-day streak — a short lesson today keeps it alive.'
	String streakReminder({required Object streak}) => 'You\'re on a ${streak}-day streak — a short lesson today keeps it alive.';
}

// Path: notificationsPage
class Translations$notificationsPage$en {
	Translations$notificationsPage$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'Are you sure?'
	String get deleteConfirmTitle => 'Are you sure?';

	/// en: 'This notification will be deleted.'
	String get deleteConfirmBody => 'This notification will be deleted.';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	late final Translations$notificationsPage$translation$en translation = Translations$notificationsPage$translation$en._(_root);
	late final Translations$notificationsPage$offer$en offer = Translations$notificationsPage$offer$en._(_root);
	late final Translations$notificationsPage$stories$en stories = Translations$notificationsPage$stories$en._(_root);
	late final Translations$notificationsPage$practice$en practice = Translations$notificationsPage$practice$en._(_root);
	late final Translations$notificationsPage$streak$en streak = Translations$notificationsPage$streak$en._(_root);
	late final Translations$notificationsPage$premium$en premium = Translations$notificationsPage$premium$en._(_root);

	/// en: 'No notifications yet'
	String get emptyTitle => 'No notifications yet';

	/// en: 'Don't forget to check again when you receive the notification.'
	String get emptySubtitle => 'Don\'t forget to check again when you receive the notification.';
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

	/// en: 'Share'
	String get settingsShare => 'Share';

	/// en: 'Support'
	String get settingsSupport => 'Support';

	/// en: 'About'
	String get settingsAbout => 'About';

	/// en: 'Account'
	String get settingsAccount => 'Account';

	/// en: 'Follow on Instagram'
	String get followInstagram => 'Follow on Instagram';

	/// en: 'Follow on TikTok'
	String get followTikTok => 'Follow on TikTok';

	/// en: 'Settings'
	String get settings => 'Settings';

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

	/// en: 'Profile saved'
	String get profileSaved => 'Profile saved';

	/// en: 'Profile photo updated'
	String get profilePhotoUpdated => 'Profile photo updated';

	/// en: 'Name cannot be empty'
	String get nameCannotBeEmpty => 'Name cannot be empty';

	/// en: 'Could not save profile'
	String get profileSaveFailed => 'Could not save profile';

	/// en: 'Photo upload failed'
	String get photoUploadFailed => 'Photo upload failed';

	/// en: 'Could not update notifications'
	String get notificationsUpdateFailed => 'Could not update notifications';

	/// en: 'Allow notifications in your device settings to get study reminders.'
	String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';

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

	/// en: 'Explanation Language'
	String get explanationLanguage => 'Explanation Language';

	/// en: 'Native language'
	String get explanationNative => 'Native language';

	/// en: 'English'
	String get explanationEnglish => 'English';

	/// en: 'Could not update explanation language'
	String get explanationUpdateFailed => 'Could not update explanation language';

	/// en: 'Learn in your native language'
	String get learnInNativeLanguage => 'Learn in your native language';

	/// en: 'Target language'
	String get targetLanguageLabel => 'Target language';

	/// en: 'Language level'
	String get languageLevel => 'Language level';

	/// en: 'Native language'
	String get nativeLanguage => 'Native language';

	/// en: 'Interests'
	String get interests => 'Interests';

	/// en: 'Career'
	String get goalChipCareer => 'Career';

	/// en: 'Travel'
	String get goalChipTravel => 'Travel';

	/// en: 'Living'
	String get goalChipLiving => 'Living';

	/// en: 'Study'
	String get goalChipStudying => 'Study';

	/// en: 'Other'
	String get goalChipOther => 'Other';

	/// en: 'Daily goal'
	String get dailyGoal => 'Daily goal';

	/// en: '5-10 min/day'
	String get dailyGoalValueLight => '5-10 min/day';

	/// en: '15-20 min/day'
	String get dailyGoalValueRecommended => '15-20 min/day';

	/// en: '30+ min/day'
	String get dailyGoalValueFast => '30+ min/day';

	/// en: 'Daily reminder'
	String get dailyReminder => 'Daily reminder';

	/// en: 'Select your native language'
	String get selectNativeLanguageTitle => 'Select your native language';

	/// en: 'On'
	String get reminderOn => 'On';

	/// en: 'Off'
	String get reminderOff => 'Off';

	/// en: 'Remind me'
	String get remindMe => 'Remind me';

	/// en: 'Save'
	String get reminderSave => 'Save';

	/// en: 'Reminder saved'
	String get reminderSaved => 'Reminder saved';

	/// en: 'Select Language'
	String get selectLanguageTitle => 'Select Language';

	/// en: 'Premium'
	String get premium => 'Premium';

	/// en: 'Passive'
	String get passive => 'Passive';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Premium'
	String get premiumVersion => 'Premium';

	/// en: 'Share Friend'
	String get shareFriend => 'Share Friend';

	/// en: 'Share with Friend'
	String get shareWithFriendTitle => 'Share with Friend';

	/// en: 'Invite your friends and enjoy translate together'
	String get shareInviteBody => 'Invite your friends and enjoy translate together';

	/// en: 'Rate Us'
	String get rateUs => 'Rate Us';

	/// en: 'Lingola FAQ'
	String get faq => 'Lingola FAQ';

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

	/// en: 'Your Certificate'
	String get certificateTitle => 'Your Certificate';

	/// en: '$level Certificate'
	String certificateLevelTitle({required Object level}) => '${level} Certificate';

	/// en: 'Certificate of Achievement'
	String get certificateOf => 'Certificate of Achievement';

	/// en: 'This certificate is proudly presented to'
	String get certificatePresentedTo => 'This certificate is proudly presented to';

	/// en: 'This achievement recognizes the successful completion of all $level-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.'
	String certificateAchievementBody({required Object level}) => 'This achievement recognizes the successful completion of all ${level}-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.';

	/// en: 'Level Completed: $levelName'
	String certificateLevelCompleted({required Object levelName}) => 'Level Completed: ${levelName}';

	/// en: 'Date of Completion: $date'
	String certificateDateCompleted({required Object date}) => 'Date of Completion: ${date}';

	/// en: 'Certificate ID: $id'
	String certificateIdDisplay({required Object id}) => 'Certificate ID: ${id}';

	/// en: 'Learn. Speak. Connect.'
	String get certificateBrandTagline => 'Learn. Speak. Connect.';

	/// en: 'This certifies that'
	String get certificateCertifiesThat => 'This certifies that';

	/// en: 'Lingola English Pathway'
	String get certificatePathway => 'Lingola English Pathway';

	/// en: 'Awarded to'
	String get certificateAwardedTo => 'Awarded to';

	/// en: 'has successfully completed'
	String get certificateCompleted => 'has successfully completed';

	/// en: 'has successfully completed the Lingola English Proficiency Pathway and was awarded a certificate in'
	String get certificateCompletedDetail => 'has successfully completed the Lingola English Proficiency Pathway and was awarded a certificate in';

	/// en: 'English Level — CEFR $level'
	String certificateLevelLine({required Object level}) => 'English Level — CEFR ${level}';

	/// en: 'Issued on $date'
	String certificateIssued({required Object date}) => 'Issued on ${date}';

	/// en: 'Date of Completion'
	String get certificateDateOfCompletion => 'Date of Completion';

	/// en: 'Certificate ID'
	String get certificateIdLabel => 'Certificate ID';

	/// en: 'Scan to verify this certificate'
	String get certificateVerify => 'Scan to verify this certificate';

	/// en: 'VERIFY AUTHENTICITY'
	String get certificateVerifyAuthenticity => 'VERIFY AUTHENTICITY';

	/// en: 'Scan the QR code or visit the link to verify authenticity.'
	String get certificateScanOrVisit => 'Scan the QR code or visit the link to verify authenticity.';

	/// en: 'Anyone can scan the QR code to verify your achievement.'
	String get certificateVerifyHint => 'Anyone can scan the QR code to verify your achievement.';

	/// en: 'Share Certificate'
	String get certificateShare => 'Share Certificate';

	/// en: 'Download'
	String get certificateDownload => 'Download';

	/// en: 'Certificate saved to your gallery'
	String get certificateDownloadSaved => 'Certificate saved to your gallery';

	/// en: 'Could not save certificate. Please try again.'
	String get certificateDownloadFailed => 'Could not save certificate. Please try again.';

	/// en: 'Create QR'
	String get certificateCreateQr => 'Create QR';

	/// en: 'Certificate locked'
	String get certificateNotAvailableTitle => 'Certificate locked';

	/// en: 'You cannot use this certificate yet because you have not completed your $level lessons.'
	String certificateNotAvailable({required Object level}) => 'You cannot use this certificate yet because you have not completed your ${level} lessons.';

	/// en: 'Got it'
	String get certificateNotAvailableOk => 'Got it';

	/// en: 'Share QR Code'
	String get certificateShareQr => 'Share QR Code';

	/// en: 'I earned my Lingola $level certificate!'
	String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';

	/// en: 'Lingola $level Certificate'
	String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';

	/// en: 'Certificate provided by'
	String get certificateProvidedBy => 'Certificate provided by';

	/// en: 'When you complete a CEFR level on Lingola, your certificate will appear here with your name, level, and completion details.'
	String get certificatePreviewBody => 'When you complete a CEFR level on Lingola, your certificate will appear here with your name, level, and completion details.';

	/// en: 'Complete a level path to unlock your certificate'
	String get certificatePreviewHint => 'Complete a level path to unlock your certificate';

	/// en: 'Tap to view and share your certificate'
	String get certificateTapToView => 'Tap to view and share your certificate';
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

	/// en: 'Get Started'
	String get cta => 'Get Started';
}

// Path: tutorPage.tutors
class Translations$tutorPage$tutors$en {
	Translations$tutorPage$tutors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lingola'
	String get lingola => 'Lingola';

	/// en: 'Zephyrion'
	String get zephyrion => 'Zephyrion';

	/// en: 'Vaelen'
	String get vaelen => 'Vaelen';

	/// en: 'Elrion'
	String get elrion => 'Elrion';

	/// en: 'Ukrath'
	String get ukrath => 'Ukrath';

	/// en: 'Elena'
	String get elena => 'Elena';

	/// en: 'Kenji'
	String get kenji => 'Kenji';

	/// en: 'Freya'
	String get freya => 'Freya';

	/// en: 'Camila'
	String get camila => 'Camila';

	/// en: 'Marco'
	String get marco => 'Marco';

	/// en: 'Julian'
	String get julian => 'Julian';

	/// en: 'Ines'
	String get ines => 'Ines';

	/// en: 'Felix'
	String get felix => 'Felix';

	/// en: 'Diego'
	String get diego => 'Diego';

	/// en: 'Amara'
	String get amara => 'Amara';

	/// en: 'Erik'
	String get erik => 'Erik';

	/// en: 'Katie'
	String get katie => 'Katie';

	/// en: 'Morgan'
	String get morgan => 'Morgan';

	/// en: 'Santa Claus'
	String get santa => 'Santa Claus';
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

	/// en: 'Curious'
	String get curious => 'Curious';

	/// en: 'Observer'
	String get observer => 'Observer';

	/// en: 'Ancient Knowledge'
	String get ancientKnowledge => 'Ancient Knowledge';

	/// en: 'Wise'
	String get wise => 'Wise';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Decisive'
	String get decisive => 'Decisive';

	/// en: 'Disciplined'
	String get disciplined => 'Disciplined';

	/// en: 'Smart'
	String get smart => 'Smart';

	/// en: 'Analytic'
	String get analytic => 'Analytic';

	/// en: 'Cheerful'
	String get cheerful => 'Cheerful';

	/// en: 'Generous'
	String get generous => 'Generous';
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

// Path: tutorPage.calling
class Translations$tutorPage$calling$en {
	Translations$tutorPage$calling$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lesson 1 : Greetings'
	String get lessonBadge => 'Lesson 1 : Greetings';

	/// en: 'Lesson $number : $title'
	String lessonBadgeFormat({required Object number, required Object title}) => 'Lesson ${number} : ${title}';

	/// en: 'Sıkıldın mı?'
	String get nativeLine => 'Sıkıldın mı?';

	/// en: 'Bored? I deleted that word from my vocabulary. Get up, the plan's already set: we're hitting that new arcade bar in Kadıköy.'
	String get englishLine => 'Bored? I deleted that word from my vocabulary. Get up, the plan\'s already set: we\'re hitting that new arcade bar in Kadıköy.';

	/// en: 'Bored?'
	String get highlight => 'Bored?';

	/// en: 'End call'
	String get close => 'End call';

	/// en: 'Toggle captions'
	String get toggleCaptions => 'Toggle captions';

	/// en: 'Toggle hints'
	String get toggleHints => 'Toggle hints';

	/// en: 'Toggle microphone'
	String get toggleMic => 'Toggle microphone';

	/// en: 'Tap to speak, tap again to finish'
	String get tapToSpeakHint => 'Tap to speak, tap again to finish';
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

	late final Translations$rolePlayPage$coffee$chat$en chat = Translations$rolePlayPage$coffee$chat$en._(_root);
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

	late final Translations$rolePlayPage$directions$chat$en chat = Translations$rolePlayPage$directions$chat$en._(_root);
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

	late final Translations$rolePlayPage$interview$chat$en chat = Translations$rolePlayPage$interview$chat$en._(_root);
}

// Path: rolePlayPage.missedTrain
class Translations$rolePlayPage$missedTrain$en {
	Translations$rolePlayPage$missedTrain$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You Missed Your Train'
	String get title => 'You Missed Your Train';

	/// en: 'You missed your train and ask a station staff member for help — explain where you're going, find the next train, and get directions to the platform.'
	String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';

	late final Translations$rolePlayPage$missedTrain$chat$en chat = Translations$rolePlayPage$missedTrain$chat$en._(_root);
}

// Path: rolePlayPage.flightAttendant
class Translations$rolePlayPage$flightAttendant$en {
	Translations$rolePlayPage$flightAttendant$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Talking to a Flight Attendant'
	String get title => 'Talking to a Flight Attendant';

	/// en: 'You're a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.'
	String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';

	late final Translations$rolePlayPage$flightAttendant$chat$en chat = Translations$rolePlayPage$flightAttendant$chat$en._(_root);
}

// Path: rolePlayPage.trainTicket
class Translations$rolePlayPage$trainTicket$en {
	Translations$rolePlayPage$trainTicket$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Buying a Train Ticket'
	String get title => 'Buying a Train Ticket';

	/// en: 'At a train station, tell the clerk where you're going, pick a departure time, choose ticket type and seat, and pay for your ticket.'
	String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';

	late final Translations$rolePlayPage$trainTicket$chat$en chat = Translations$rolePlayPage$trainTicket$chat$en._(_root);
}

// Path: rolePlayPage.restaurantReservation
class Translations$rolePlayPage$restaurantReservation$en {
	Translations$rolePlayPage$restaurantReservation$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Making a Restaurant Reservation'
	String get title => 'Making a Restaurant Reservation';

	/// en: 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.'
	String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';

	late final Translations$rolePlayPage$restaurantReservation$chat$en chat = Translations$rolePlayPage$restaurantReservation$chat$en._(_root);
}

// Path: rolePlayPage.doctorAppointment
class Translations$rolePlayPage$doctorAppointment$en {
	Translations$rolePlayPage$doctorAppointment$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Making a Doctor's Appointment'
	String get title => 'Making a Doctor\'s Appointment';

	/// en: 'Call a clinic to book a doctor's appointment — explain why you need to visit, choose a day and time, and confirm your details.'
	String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';

	late final Translations$rolePlayPage$doctorAppointment$chat$en chat = Translations$rolePlayPage$doctorAppointment$chat$en._(_root);
}

// Path: rolePlayPage.shoppingClothes
class Translations$rolePlayPage$shoppingClothes$en {
	Translations$rolePlayPage$shoppingClothes$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shopping for Clothes'
	String get title => 'Shopping for Clothes';

	/// en: 'In a clothing store, tell the assistant what you're looking for, try items on, compare sizes and colors, and decide whether to buy.'
	String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';

	late final Translations$rolePlayPage$shoppingClothes$chat$en chat = Translations$rolePlayPage$shoppingClothes$chat$en._(_root);
}

// Path: rolePlayPage.takingTaxi
class Translations$rolePlayPage$takingTaxi$en {
	Translations$rolePlayPage$takingTaxi$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Taking a Taxi'
	String get title => 'Taking a Taxi';

	/// en: 'Get in a taxi in a new city, tell the driver where you're going, talk about the route, and pay at the end of the ride.'
	String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';

	late final Translations$rolePlayPage$takingTaxi$chat$en chat = Translations$rolePlayPage$takingTaxi$chat$en._(_root);
}

// Path: rolePlayPage.rentingApartment
class Translations$rolePlayPage$rentingApartment$en {
	Translations$rolePlayPage$rentingApartment$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Renting an Apartment'
	String get title => 'Renting an Apartment';

	/// en: 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.'
	String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';

	late final Translations$rolePlayPage$rentingApartment$chat$en chat = Translations$rolePlayPage$rentingApartment$chat$en._(_root);
}

// Path: rolePlayPage.birthdayParty
class Translations$rolePlayPage$birthdayParty$en {
	Translations$rolePlayPage$birthdayParty$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Planning a Birthday Party'
	String get title => 'Planning a Birthday Party';

	/// en: 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.'
	String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';

	late final Translations$rolePlayPage$birthdayParty$chat$en chat = Translations$rolePlayPage$birthdayParty$chat$en._(_root);
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

// Path: notificationsPage.practice
class Translations$notificationsPage$practice$en {
	Translations$notificationsPage$practice$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your daily practice is waiting'
	String get title => 'Your daily practice is waiting';

	/// en: 'Spend 5 minutes on a quick word, reading, or speaking exercise.'
	String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class Translations$notificationsPage$streak$en {
	Translations$notificationsPage$streak$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Keep your streak alive'
	String get title => 'Keep your streak alive';

	/// en: 'A short session today protects your day streak and builds the habit.'
	String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class Translations$notificationsPage$premium$en {
	Translations$notificationsPage$premium$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlock all tutors & lessons'
	String get title => 'Unlock all tutors & lessons';

	/// en: 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.'
	String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
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
	late final Translations$profilePage$faqItems$supportedLanguages$en supportedLanguages = Translations$profilePage$faqItems$supportedLanguages$en._(_root);
	late final Translations$profilePage$faqItems$howAiWorks$en howAiWorks = Translations$profilePage$faqItems$howAiWorks$en._(_root);
	late final Translations$profilePage$faqItems$offlineUse$en offlineUse = Translations$profilePage$faqItems$offlineUse$en._(_root);
	late final Translations$profilePage$faqItems$isFree$en isFree = Translations$profilePage$faqItems$isFree$en._(_root);
	late final Translations$profilePage$faqItems$pronunciationEval$en pronunciationEval = Translations$profilePage$faqItems$pronunciationEval$en._(_root);
	late final Translations$profilePage$faqItems$dailyPractice$en dailyPractice = Translations$profilePage$faqItems$dailyPractice$en._(_root);
	late final Translations$profilePage$faqItems$levelDetermination$en levelDetermination = Translations$profilePage$faqItems$levelDetermination$en._(_root);
	late final Translations$profilePage$faqItems$realPeopleChat$en realPeopleChat = Translations$profilePage$faqItems$realPeopleChat$en._(_root);
	late final Translations$profilePage$faqItems$dataSecurity$en dataSecurity = Translations$profilePage$faqItems$dataSecurity$en._(_root);
	late final Translations$profilePage$faqItems$disableReminders$en disableReminders = Translations$profilePage$faqItems$disableReminders$en._(_root);
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
		'Greetings',
		'Introductions I',
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
		'Cultural traditions',
		'Celebrities',
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
		'Personalities',
		'Great leads',
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

// Path: rolePlayPage.coffee.chat
class Translations$rolePlayPage$coffee$chat$en {
	Translations$rolePlayPage$coffee$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice ordering at a coffee shop — hello, sizes, extras. I'll explain a little first, then we'll act it out. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice ordering at a coffee shop — hello, sizes, extras. I\'ll explain a little first, then we\'ll act it out. Sound good?';

	/// en: 'Welcome! What can I get started for you today?'
	String get incoming1 => 'Welcome! What can I get started for you today?';

	/// en: 'Hi! I'd like a medium latte, please.'
	String get outgoing1 => 'Hi! I\'d like a medium latte, please.';

	/// en: 'Sure'
	String get incoming2Highlight => 'Sure';

	/// en: '! Would you like that hot or iced, and any extras?'
	String get incoming2Rest => '! Would you like that hot or iced, and any extras?';

	/// en: 'Great choice. Anything else with your order?'
	String get botReply => 'Great choice. Anything else with your order?';
}

// Path: rolePlayPage.directions.chat
class Translations$rolePlayPage$directions$chat$en {
	Translations$rolePlayPage$directions$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice asking for directions on the street. I'll explain a little first, then we'll act it out. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice asking for directions on the street. I\'ll explain a little first, then we\'ll act it out. Sound good?';

	/// en: 'Hi there! You look a bit lost — need help finding something?'
	String get incoming1 => 'Hi there! You look a bit lost — need help finding something?';

	/// en: 'Yes, I'm looking for the nearest subway station.'
	String get outgoing1 => 'Yes, I\'m looking for the nearest subway station.';

	/// en: 'Of course'
	String get incoming2Highlight => 'Of course';

	/// en: '! Walk two blocks that way, then turn left. You'll see the entrance.'
	String get incoming2Rest => '! Walk two blocks that way, then turn left. You\'ll see the entrance.';

	/// en: 'You're welcome! Want a restaurant tip near the station too?'
	String get botReply => 'You\'re welcome! Want a restaurant tip near the station too?';
}

// Path: rolePlayPage.interview.chat
class Translations$rolePlayPage$interview$chat$en {
	Translations$rolePlayPage$interview$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice a job interview. I'll explain a little first, then we'll act it out — I'll interview you, then we switch. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice a job interview. I\'ll explain a little first, then we\'ll act it out — I\'ll interview you, then we switch. Sound good?';

	/// en: 'Thanks for coming in today. Could you briefly introduce yourself?'
	String get incoming1 => 'Thanks for coming in today. Could you briefly introduce yourself?';

	/// en: 'Of course. I'm excited to be here and share my experience.'
	String get outgoing1 => 'Of course. I\'m excited to be here and share my experience.';

	/// en: 'Wonderful'
	String get incoming2Highlight => 'Wonderful';

	/// en: '. Tell me about a recent project you're proud of.'
	String get incoming2Rest => '. Tell me about a recent project you\'re proud of.';

	/// en: 'That's impressive. What questions do you have about the role?'
	String get botReply => 'That\'s impressive. What questions do you have about the role?';
}

// Path: rolePlayPage.missedTrain.chat
class Translations$rolePlayPage$missedTrain$chat$en {
	Translations$rolePlayPage$missedTrain$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice what to say when you miss your train at a station. I'll teach a few phrases first, then we'll role-play. Ready?'
	String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';

	/// en: 'Hello, where are you trying to go?'
	String get incoming1 => 'Hello, where are you trying to go?';

	/// en: 'I need to get to Manchester. I think I missed my 10:15 train.'
	String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';

	/// en: 'No problem'
	String get incoming2Highlight => 'No problem';

	/// en: '. Let me check the next available train for you.'
	String get incoming2Rest => '. Let me check the next available train for you.';

	/// en: 'Would you prefer the fastest option or the cheapest one?'
	String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class Translations$rolePlayPage$flightAttendant$chat$en {
	Translations$rolePlayPage$flightAttendant$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice talking to a flight attendant on a plane — seats, luggage, meals. I'll explain first, then we'll act it out. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';

	/// en: 'Hello! May I see your boarding pass, please?'
	String get incoming1 => 'Hello! May I see your boarding pass, please?';

	/// en: 'Sure, here you go. I'm in seat 14B.'
	String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';

	/// en: 'Thank you'
	String get incoming2Highlight => 'Thank you';

	/// en: '. Would you like some help finding your seat?'
	String get incoming2Rest => '. Would you like some help finding your seat?';

	/// en: 'Would you like something to drink — water, juice, coffee, or tea?'
	String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class Translations$rolePlayPage$trainTicket$chat$en {
	Translations$rolePlayPage$trainTicket$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice buying a train ticket at the counter. I'll teach useful phrases first, then we'll role-play. Ready?'
	String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';

	/// en: 'Hello! Where would you like to go?'
	String get incoming1 => 'Hello! Where would you like to go?';

	/// en: 'I'd like to go to Edinburgh, please.'
	String get outgoing1 => 'I\'d like to go to Edinburgh, please.';

	/// en: 'Great'
	String get incoming2Highlight => 'Great';

	/// en: '. When would you like to travel?'
	String get incoming2Rest => '. When would you like to travel?';

	/// en: 'Would you like a one-way or return ticket?'
	String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class Translations$rolePlayPage$restaurantReservation$chat$en {
	Translations$rolePlayPage$restaurantReservation$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice making a restaurant reservation. I'll explain a few phrases first, then we'll act it out. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';

	/// en: 'Hello! How can I help you?'
	String get incoming1 => 'Hello! How can I help you?';

	/// en: 'Hi, I'd like to make a reservation for dinner, please.'
	String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';

	/// en: 'Of course'
	String get incoming2Highlight => 'Of course';

	/// en: '. What day would you like to come?'
	String get incoming2Rest => '. What day would you like to come?';

	/// en: 'How many people will be joining you?'
	String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class Translations$rolePlayPage$doctorAppointment$chat$en {
	Translations$rolePlayPage$doctorAppointment$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice making a doctor's appointment by phone. I'll teach key phrases first, then we'll role-play. Ready?'
	String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';

	/// en: 'Hello! How can I help you today?'
	String get incoming1 => 'Hello! How can I help you today?';

	/// en: 'Hi, I'd like to book an appointment with a doctor, please.'
	String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';

	/// en: 'Sure'
	String get incoming2Highlight => 'Sure';

	/// en: '. Have you visited our clinic before?'
	String get incoming2Rest => '. Have you visited our clinic before?';

	/// en: 'What would you like to see the doctor about?'
	String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class Translations$rolePlayPage$shoppingClothes$chat$en {
	Translations$rolePlayPage$shoppingClothes$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice shopping for clothes in a store. I'll explain useful phrases first, then we'll role-play. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';

	/// en: 'Hello! Can I help you find something?'
	String get incoming1 => 'Hello! Can I help you find something?';

	/// en: 'Yes, I'm looking for a casual shirt for everyday wear.'
	String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';

	/// en: 'Sure'
	String get incoming2Highlight => 'Sure';

	/// en: '. What size do you usually wear?'
	String get incoming2Rest => '. What size do you usually wear?';

	/// en: 'Would you prefer something casual or more formal?'
	String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class Translations$rolePlayPage$takingTaxi$chat$en {
	Translations$rolePlayPage$takingTaxi$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice taking a taxi — giving your destination, chatting with the driver, and paying. I'll teach first, then we'll act it out. Ready?'
	String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';

	/// en: 'Hello! Where would you like to go?'
	String get incoming1 => 'Hello! Where would you like to go?';

	/// en: 'The Grand Hotel on Park Street, please.'
	String get outgoing1 => 'The Grand Hotel on Park Street, please.';

	/// en: 'Got it'
	String get incoming2Highlight => 'Got it';

	/// en: '. Do you have the exact address?'
	String get incoming2Rest => '. Do you have the exact address?';

	/// en: 'Would you prefer the fastest route?'
	String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class Translations$rolePlayPage$rentingApartment$chat$en {
	Translations$rolePlayPage$rentingApartment$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice talking to a landlord about renting an apartment. I'll explain key phrases first, then we'll role-play. Sound good?'
	String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';

	/// en: 'Hello! Are you interested in renting the apartment?'
	String get incoming1 => 'Hello! Are you interested in renting the apartment?';

	/// en: 'Yes, I'd like to know more about it, please.'
	String get outgoing1 => 'Yes, I\'d like to know more about it, please.';

	/// en: 'Great'
	String get incoming2Highlight => 'Great';

	/// en: '. When are you looking to move in?'
	String get incoming2Rest => '. When are you looking to move in?';

	/// en: 'Do you need a furnished or unfurnished apartment?'
	String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class Translations$rolePlayPage$birthdayParty$chat$en {
	Translations$rolePlayPage$birthdayParty$chat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi! Today we'll practice planning a birthday party with a friend. I'll teach useful phrases first, then we'll role-play. Ready?'
	String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';

	/// en: 'So, whose birthday are we planning?'
	String get incoming1 => 'So, whose birthday are we planning?';

	/// en: 'It's for my friend Emma — her birthday is next month.'
	String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';

	/// en: 'Nice'
	String get incoming2Highlight => 'Nice';

	/// en: '! When should we have the party?'
	String get incoming2Rest => '! When should we have the party?';

	/// en: 'Would you rather have the party at home or at a restaurant?'
	String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: profilePage.faqItems.supportedLanguages
class Translations$profilePage$faqItems$supportedLanguages$en {
	Translations$profilePage$faqItems$supportedLanguages$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Which languages does the app support?'
	String get question => 'Which languages does the app support?';

	/// en: 'Lingola's interface is available in English, German, Italian, French, Turkish, Japanese, Spanish, Russian, Hindi, Portuguese, and Simplified Chinese.'
	String get answer => 'Lingola\'s interface is available in English, German, Italian, French, Turkish, Japanese, Spanish, Russian, Hindi, Portuguese, and Simplified Chinese.';
}

// Path: profilePage.faqItems.howAiWorks
class Translations$profilePage$faqItems$howAiWorks$en {
	Translations$profilePage$faqItems$howAiWorks$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How does the AI work?'
	String get question => 'How does the AI work?';

	/// en: 'The AI interacts with you like a real tutor. It analyzes your conversations, detects mistakes, and offers personalized feedback based on your progress.'
	String get answer => 'The AI interacts with you like a real tutor. It analyzes your conversations, detects mistakes, and offers personalized feedback based on your progress.';
}

// Path: profilePage.faqItems.offlineUse
class Translations$profilePage$faqItems$offlineUse$en {
	Translations$profilePage$faqItems$offlineUse$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Can I use the app offline?'
	String get question => 'Can I use the app offline?';

	/// en: 'Yes. You can download certain lessons and conversation scenarios in advance and use them offline. However, live chat requires an internet connection.'
	String get answer => 'Yes. You can download certain lessons and conversation scenarios in advance and use them offline. However, live chat requires an internet connection.';
}

// Path: profilePage.faqItems.isFree
class Translations$profilePage$faqItems$isFree$en {
	Translations$profilePage$faqItems$isFree$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Is the app free?'
	String get question => 'Is the app free?';

	/// en: 'The basic version is free. With Premium, you get advanced chat scenarios, pronunciation analysis, and personal tutor mode.'
	String get answer => 'The basic version is free. With Premium, you get advanced chat scenarios, pronunciation analysis, and personal tutor mode.';
}

// Path: profilePage.faqItems.pronunciationEval
class Translations$profilePage$faqItems$pronunciationEval$en {
	Translations$profilePage$faqItems$pronunciationEval$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How is my pronunciation evaluated?'
	String get question => 'How is my pronunciation evaluated?';

	/// en: 'The app analyzes your voice and uses AI-powered speech recognition to score your accent and pronunciation. Words you need to improve are highlighted.'
	String get answer => 'The app analyzes your voice and uses AI-powered speech recognition to score your accent and pronunciation. Words you need to improve are highlighted.';
}

// Path: profilePage.faqItems.dailyPractice
class Translations$profilePage$faqItems$dailyPractice$en {
	Translations$profilePage$faqItems$dailyPractice$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Do I need to practice daily?'
	String get question => 'Do I need to practice daily?';

	/// en: 'Yes. The system tracks your progress every day. Just 10–15 minutes of speaking practice per day can noticeably speed up your language learning.'
	String get answer => 'Yes. The system tracks your progress every day. Just 10–15 minutes of speaking practice per day can noticeably speed up your language learning.';
}

// Path: profilePage.faqItems.levelDetermination
class Translations$profilePage$faqItems$levelDetermination$en {
	Translations$profilePage$faqItems$levelDetermination$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How is my learning level determined?'
	String get question => 'How is my learning level determined?';

	/// en: 'A short level check when you first sign in analyzes your current knowledge. After that, the AI automatically recommends lessons suited to your level.'
	String get answer => 'A short level check when you first sign in analyzes your current knowledge. After that, the AI automatically recommends lessons suited to your level.';
}

// Path: profilePage.faqItems.realPeopleChat
class Translations$profilePage$faqItems$realPeopleChat$en {
	Translations$profilePage$faqItems$realPeopleChat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Can I talk with real people?'
	String get question => 'Can I talk with real people?';

	/// en: 'Yes. Premium users can schedule short practice sessions with real tutors.'
	String get answer => 'Yes. Premium users can schedule short practice sessions with real tutors.';
}

// Path: profilePage.faqItems.dataSecurity
class Translations$profilePage$faqItems$dataSecurity$en {
	Translations$profilePage$faqItems$dataSecurity$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Is my data safe?'
	String get question => 'Is my data safe?';

	/// en: 'Absolutely. All conversations and user data are stored encrypted. Your personal information is never shared with third parties.'
	String get answer => 'Absolutely. All conversations and user data are stored encrypted. Your personal information is never shared with third parties.';
}

// Path: profilePage.faqItems.disableReminders
class Translations$profilePage$faqItems$disableReminders$en {
	Translations$profilePage$faqItems$disableReminders$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How do I turn off daily reminders?'
	String get question => 'How do I turn off daily reminders?';

	/// en: 'Go to Profile settings, open Notifications, and change the reminder frequency or turn notifications off completely.'
	String get answer => 'Go to Profile settings, open Notifications, and change the reminder frequency or turn notifications off completely.';
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
			'common.connectionError' => 'No connection. Check your internet and try again.',
			'common.genericError' => 'Something went wrong. Please try again.',
			'common.tryAgain' => 'Try again',
			'apiErrors.unauthorized' => 'Please sign in again.',
			'apiErrors.notFound' => 'We couldn\'t find what you were looking for.',
			'apiErrors.validationFailed' => 'Please check your input and try again.',
			'apiErrors.nameRequired' => 'Name cannot be empty.',
			'apiErrors.imageRequired' => 'Please choose a photo to upload.',
			'apiErrors.avatarInvalidType' => 'Only JPEG, PNG, or WebP photos are allowed.',
			'apiErrors.avatarEmpty' => 'The selected photo is empty.',
			'apiErrors.avatarTooLarge' => 'Photo is too large (max 5 MB).',
			'apiErrors.notificationsRequired' => 'Notification preference is required.',
			'apiErrors.premiumRequired' => 'Premium is required for this lesson.',
			'apiErrors.levelRequired' => 'Complete earlier lessons to unlock this level.',
			'apiErrors.internalError' => 'Something went wrong. Please try again.',
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
			'language.title' => 'Which language do you want to learn?',
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
			'setup.levelA1' => 'A1 — I know a few words',
			'setup.levelA2' => 'A2 — I can use simple phrases',
			'setup.levelB1' => 'B1 — I can hold everyday conversations',
			'setup.levelB2' => 'B2 — I communicate fluently on familiar topics',
			'setup.levelC1' => 'C1 — Advanced, I want to refine my skills',
			'setup.levelC2' => 'C2 — Near-native mastery',
			'setup.paceTitle' => 'How fast do you want to improve?',
			'setup.explanationTitle' => 'When you ask questions in your language, how should we explain?',
			'setup.explanationHint' => 'You can change this anytime in Profile settings.',
			'setup.explanationNative' => 'Explain in my native language',
			'setup.explanationEnglish' => 'Explain in English',
			'setup.paceMin5' => '5 min/day',
			'setup.paceMin10' => '10 min/day',
			'setup.paceMin15' => '15 min/day',
			'setup.paceMin30' => '30 min/day',
			'setup.paceMin60' => '60 min/day',
			'accountCreating.title' => 'Your Personal Account Is Being Created',
			'accountCreating.titleLine1' => 'Building your',
			'accountCreating.titleLine2' => 'Account',
			'accountCreating.testimonialQuote' => 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I\'m not stopping now.',
			'accountCreating.testimonialAuthor' => 'Maria, 29 — 3 months in',
			'accountCreating.comparisonPitch' => 'Learn 600+ extra phrases about 30× faster with Lingola than studying entirely on your own.',
			'accountCreating.comparisonAloneCount' => '400',
			'accountCreating.comparisonLingolaCount' => '1000',
			'accountCreating.comparisonUnit' => 'PHRASES',
			'accountCreating.comparisonAloneLabel' => 'On your own',
			'accountCreating.comparisonLingolaLabel' => 'Lingola',
			'accountCreating.fluencyPitch' => 'From today to fluency — your next level is only 30 days away',
			'accountCreating.chartToday' => 'Today',
			'accountCreating.chartMid' => '15 Sep',
			'accountCreating.chartEnd' => '30 Sep',
			'accountCreating.stepContent' => 'Content is being created',
			'accountCreating.stepDialogues' => 'Dialogues are being prepared',
			'accountCreating.stepLessons' => 'Lessons are being optimised',
			'accountCreating.stepPlan' => 'Your plan is being finalised',
			'accountCreating.optimization' => 'Optimization',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'planReady.titleLine1' => 'Your plan is',
			'planReady.titleLine2' => 'Ready!',
			'planReady.statBanner' => '95% of users see results within the first 7 days',
			'planReady.planTitle' => ({required Object name}) => '${name}\'S PLAN',
			'planReady.defaultName' => 'YOUR',
			'planReady.fieldCourse' => 'COURSE',
			'planReady.fieldLevel' => 'YOUR LEVEL',
			'planReady.fieldFocus' => 'FOCUS AREA',
			'planReady.fieldDuration' => 'DURATION',
			'planReady.fieldInterests' => 'INTERESTS',
			'planReady.startPlan' => 'Start my plan →',
			'planReady.courseEnglish' => 'English',
			'planReady.courseGerman' => 'German',
			'planReady.courseFrench' => 'French',
			'planReady.courseItalian' => 'Italian',
			'planReady.courseSpanish' => 'Spanish',
			'planReady.courseJapanese' => 'Japanese',
			'planReady.courseRussian' => 'Russian',
			'planReady.courseTurkish' => 'Turkish',
			'planReady.goalCareer' => 'Career & business',
			'planReady.goalTravel' => 'Travel',
			'planReady.goalLiving' => 'Living abroad',
			'planReady.goalStudying' => 'Studying abroad',
			'planReady.goalOther' => 'Other',
			'planReady.levelA1' => 'A1',
			'planReady.levelA2' => 'A2',
			'planReady.levelB1' => 'B1',
			'planReady.levelB2' => 'B2',
			'planReady.levelC1' => 'C1',
			'planReady.levelC2' => 'C2',
			'planReady.paceMin5' => '5 min/day',
			'planReady.paceMin10' => '10 min/day',
			'planReady.paceMin15' => '15 min/day',
			'planReady.paceMin30' => '30 min/day',
			'planReady.paceMin60' => '60 min/day',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lesson 1: Greetings',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Type a message...',
			'previewChat.incoming1' => 'Hi! Welcome to Lingola — I\'m your AI tutor. Whatever your level, don\'t worry — you\'ll feel safe here while you learn English. To say hello in English, you say \'Hi\' or \'Hello\' — try it: type \'Hi!\' to me!',
			'previewChat.outgoing1' => 'Hi! I\'m ready to practice.',
			'previewChat.incoming2Highlight' => 'Günaydın',
			'previewChat.incoming2Rest' => ', Emrah! I\'m glad you\'re feeling ready. A morning coffee is always a great start to building a connection. What would you like to talk about?',
			'previewChat.holdToSpeak' => 'Hold to speak',
			'previewChat.recording' => 'Recording… release to send',
			'previewChat.slideUpToLock' => 'Slide up to lock',
			'previewChat.slideLeftToCancel' => 'Slide left to cancel',
			'previewChat.recordingLockedHint' => 'Tap send when finished',
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
			'auth.or' => 'or',
			'auth.alreadyHaveAccount' => 'Already have an account?',
			'auth.signIn' => 'Sign in',
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
			'home.continueWithTutor' => ({required Object name}) => 'Continue with ${name}, or choose another tutor?',
			'home.continueSameTutor' => ({required Object name}) => 'Continue with ${name}',
			'home.chooseOtherTutor' => 'Choose another tutor',
			'home.minutesLeft' => ({required Object value}) => '${value} min left',
			'home.lessonProgress' => 'Lesson 2 — Greetings',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
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
			'home.premium.cta' => 'Get Started',
			'libraryPage.title' => 'Library',
			'libraryPage.searchWord' => 'Search Word',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Saved Word',
			'libraryPage.savedWordTab' => 'Saved Word',
			'libraryPage.dictionaryTab' => 'Dictionary',
			'libraryPage.dictionaryLabel' => 'Dictionary',
			'wordPracticePage.title' => 'Word Practice',
			'wordPracticePage.turkish' => 'TURKISH',
			'wordPracticePage.save' => 'Save',
			'wordPracticePage.saved' => 'Saved',
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
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Chat with ${name}',
			'tutorPage.chatHistory' => 'Chat History',
			'tutorPage.history' => 'History',
			'tutorPage.filter' => 'Filter',
			'tutorPage.country' => 'Country',
			'tutorPage.focus' => 'Focus',
			'tutorPage.moreCountries' => '8+ more',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'SAVE',
			'tutorPage.clearFilter' => 'Clear filters',
			'tutorPage.startTalkNow' => 'Start Talk Now',
			'tutorPage.typeMessage' => 'Type a message...',
			'tutorPage.speaker' => 'Speaker',
			'tutorPage.messagesCount' => '12',
			'tutorPage.tutors.lingola' => 'Lingola',
			'tutorPage.tutors.zephyrion' => 'Zephyrion',
			'tutorPage.tutors.vaelen' => 'Vaelen',
			'tutorPage.tutors.elrion' => 'Elrion',
			'tutorPage.tutors.ukrath' => 'Ukrath',
			'tutorPage.tutors.elena' => 'Elena',
			'tutorPage.tutors.kenji' => 'Kenji',
			'tutorPage.tutors.freya' => 'Freya',
			'tutorPage.tutors.camila' => 'Camila',
			'tutorPage.tutors.marco' => 'Marco',
			'tutorPage.tutors.julian' => 'Julian',
			'tutorPage.tutors.ines' => 'Ines',
			'tutorPage.tutors.felix' => 'Felix',
			'tutorPage.tutors.diego' => 'Diego',
			'tutorPage.tutors.amara' => 'Amara',
			'tutorPage.tutors.erik' => 'Erik',
			'tutorPage.tutors.katie' => 'Katie',
			'tutorPage.tutors.morgan' => 'Morgan',
			'tutorPage.tutors.santa' => 'Santa Claus',
			'tutorPage.tags.adaptive' => 'Adaptive',
			'tutorPage.tags.calm' => 'Calm',
			'tutorPage.tags.patient' => 'Patient',
			'tutorPage.tags.organized' => 'Organized',
			'tutorPage.tags.relaxed' => 'Relaxed',
			'tutorPage.tags.methodical' => 'Methodical',
			'tutorPage.tags.attentive' => 'Attentive',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Curious',
			'tutorPage.tags.observer' => 'Observer',
			'tutorPage.tags.ancientKnowledge' => 'Ancient Knowledge',
			'tutorPage.tags.wise' => 'Wise',
			'tutorPage.tags.clear' => 'Clear',
			'tutorPage.tags.decisive' => 'Decisive',
			'tutorPage.tags.disciplined' => 'Disciplined',
			'tutorPage.tags.smart' => 'Smart',
			'tutorPage.tags.analytic' => 'Analytic',
			'tutorPage.tags.cheerful' => 'Cheerful',
			'tutorPage.tags.generous' => 'Generous',
			'tutorPage.historyPreview1' => 'Hey! I was about to explode with boredom...',
			'tutorPage.historyPreview2' => 'Shall we practice ordering food today?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'Yesterday',
			'tutorPage.chat.incoming1' => 'Good morning! I\'m glad you\'re feeling ready to practice today.',
			'tutorPage.chat.outgoing1' => 'Yes, let\'s start with greetings.',
			'tutorPage.chat.incoming2' => 'Perfect. How would you say hello to a colleague?',
			'tutorPage.chat.typing' => 'Typing',
			'tutorPage.calling.lessonBadge' => 'Lesson 1 : Greetings',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Lesson ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Bored? I deleted that word from my vocabulary. Get up, the plan\'s already set: we\'re hitting that new arcade bar in Kadıköy.',
			'tutorPage.calling.highlight' => 'Bored?',
			'tutorPage.calling.close' => 'End call',
			'tutorPage.calling.toggleCaptions' => 'Toggle captions',
			'tutorPage.calling.toggleHints' => 'Toggle hints',
			'tutorPage.calling.toggleMic' => 'Toggle microphone',
			'tutorPage.calling.tapToSpeakHint' => 'Tap to speak, tap again to finish',
			'lessonPage.title' => 'Continue to Learn',
			'lessonPage.profile' => 'Profile',
			'lessonPage.language' => 'Target language',
			'lessonPage.completed' => 'Completed',
			'lessonPage.locked' => 'Locked',
			'lessonPage.pickTutorTitle' => 'Choose your tutor',
			'lessonPage.startTalk' => 'Start lesson',
			'lessonPage.chatInstead' => 'Chat',
			'lessonPage.lockedHint' => 'Finish the previous lesson to unlock this one.',
			'lessonPage.levelLockedTitle' => 'Level locked',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Your English level is ${userLevel}, so you can\'t open ${lessonLevel} lessons without completing the earlier path.',
			'lessonPage.levelLockedOk' => 'Got it',
			'lessonPage.notesTitle' => 'Lesson notes',
			'lessonPage.whatWeLearned' => 'What we learned today',
			'lessonPage.deleteNotes' => 'Delete my lesson notes',
			'lessonPage.deleteNotesConfirm' => 'Delete these notes? This cannot be undone.',
			'lessonPage.delete' => 'Delete',
			'lessonPage.cancel' => 'Cancel',
			'lessonPage.practiceCta' => 'If this felt too hard, you can practice the same topic again.',
			'lessonPage.practiceNow' => 'Practice this topic',
			'lessonPage.openChat' => 'Open chat with tutor',
			'lessonPage.yourScore' => 'Your score',
			'lessonPage.bestScore' => ({required Object score}) => 'Best ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Passive participant',
			'lessonPage.participationSilentBody' => 'You stayed quiet this time. I think you should retake this lesson.',
			'lessonPage.participationPassive' => 'Low participation',
			'lessonPage.participationPassiveBody' => 'You barely spoke. Try the lesson again and say more.',
			'lessonPage.participationActive' => 'Good participation',
			'lessonPage.participationActiveBody' => 'You joined the conversation. Keep it up!',
			'lessonPage.participationStrong' => 'Strong participation',
			'lessonPage.participationStrongBody' => 'You spoke a lot. Great work!',
			'lessonPage.retakeLesson' => 'Retake this lesson',
			'lessonPage.finishLesson' => 'Finish lesson',
			'lessonPage.savingNotes' => 'Your tutor is writing today’s notes…',
			'lessonPage.noNotes' => 'Finish this lesson to get notes from your tutor.',
			'lessonPage.notesDeleted' => 'Lesson notes deleted',
			'lessonPage.levels.a1.title' => 'A1 - Starter',
			'lessonPage.levels.a1.lessons.0' => 'Greetings',
			'lessonPage.levels.a1.lessons.1' => 'Introductions I',
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
			'lessonPage.levels.b1.lessons.0' => 'Cultural traditions',
			'lessonPage.levels.b1.lessons.1' => 'Celebrities',
			'lessonPage.levels.b1.lessons.2' => 'Art and creativity',
			'lessonPage.levels.b1.lessons.3' => 'Future plans',
			'lessonPage.levels.b1.lessons.4' => 'Planning events',
			'lessonPage.levels.b1.lessons.5' => 'Goals and plans',
			_ => null,
		} ?? switch (path) {
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
			'lessonPage.levels.b2.lessons.0' => 'Personalities',
			'lessonPage.levels.b2.lessons.1' => 'Great leads',
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
			'rolePlayPage.intermediate' => 'Intermediate',
			'rolePlayPage.beginnerIntermediate' => 'Beginner–Intermediate',
			'rolePlayPage.screenplay' => 'SCREENPLAY',
			'rolePlayPage.dailyInteractions' => 'Daily Interactions',
			'rolePlayPage.business' => 'Business',
			'rolePlayPage.customScenarios' => 'Your scenarios',
			'rolePlayPage.createOwnScenario' => 'Create your\nown scenario!',
			'rolePlayPage.createOwnScenarioTitle' => 'Create your scenario',
			'rolePlayPage.createFieldScenario' => 'Scenario',
			'rolePlayPage.createFieldScenarioHint' => 'e.g. business meeting',
			'rolePlayPage.createFieldTutorRole' => 'Tutor role',
			'rolePlayPage.createFieldTutorRoleHint' => 'e.g. interviewer',
			'rolePlayPage.createFieldYourRole' => 'Your role',
			'rolePlayPage.createFieldYourRoleHint' => 'e.g. candidate',
			'rolePlayPage.createFieldExtraInfo' => 'Extra details (optional)',
			'rolePlayPage.createFieldExtraInfoHint' => 'e.g. senior software developer interview at a tech company',
			'rolePlayPage.createOwnScenarioContinue' => 'Continue',
			'rolePlayPage.createFieldsRequired' => 'Please fill in scenario and both roles.',
			'rolePlayPage.creatingScenario' => 'Creating your role play',
			'rolePlayPage.creatingScenarioSubtitle' => 'Lingola is writing your scene and illustration...',
			'rolePlayPage.createFailed' => 'Could not create scenario. Please try again.',
			'rolePlayPage.coffee.title' => 'Ordering at the Coffee Shop',
			'rolePlayPage.coffee.screenplay' => 'Order your favorite drink, ask about sizes and extras, confirm your total, and pick up your coffee at the counter.',
			'rolePlayPage.coffee.chat.briefing' => 'Hi! Today we\'ll practice ordering at a coffee shop — hello, sizes, extras. I\'ll explain a little first, then we\'ll act it out. Sound good?',
			'rolePlayPage.coffee.chat.incoming1' => 'Welcome! What can I get started for you today?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Hi! I\'d like a medium latte, please.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Would you like that hot or iced, and any extras?',
			'rolePlayPage.coffee.chat.botReply' => 'Great choice. Anything else with your order?',
			'rolePlayPage.directions.title' => 'Asking for Directions on the Street',
			'rolePlayPage.directions.screenplay' => 'Ask for directions to a place, find out how to get to the subway or bus, get information about tickets, and listen to restaurant recommendations.',
			'rolePlayPage.directions.chat.briefing' => 'Hi! Today we\'ll practice asking for directions on the street. I\'ll explain a little first, then we\'ll act it out. Sound good?',
			'rolePlayPage.directions.chat.incoming1' => 'Hi there! You look a bit lost — need help finding something?',
			'rolePlayPage.directions.chat.outgoing1' => 'Yes, I\'m looking for the nearest subway station.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Of course',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Walk two blocks that way, then turn left. You\'ll see the entrance.',
			'rolePlayPage.directions.chat.botReply' => 'You\'re welcome! Want a restaurant tip near the station too?',
			'rolePlayPage.interview.title' => 'Job Interview',
			'rolePlayPage.interview.screenplay' => 'Introduce yourself, answer common interview questions, talk about your experience, and ask about the role and next steps.',
			'rolePlayPage.interview.chat.briefing' => 'Hi! Today we\'ll practice a job interview. I\'ll explain a little first, then we\'ll act it out — I\'ll interview you, then we switch. Sound good?',
			'rolePlayPage.interview.chat.incoming1' => 'Thanks for coming in today. Could you briefly introduce yourself?',
			'rolePlayPage.interview.chat.outgoing1' => 'Of course. I\'m excited to be here and share my experience.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Wonderful',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Tell me about a recent project you\'re proud of.',
			'rolePlayPage.interview.chat.botReply' => 'That\'s impressive. What questions do you have about the role?',
			'rolePlayPage.missedTrain.title' => 'You Missed Your Train',
			'rolePlayPage.missedTrain.screenplay' => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.',
			'rolePlayPage.missedTrain.chat.briefing' => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.missedTrain.chat.incoming1' => 'Hello, where are you trying to go?',
			'rolePlayPage.missedTrain.chat.outgoing1' => 'I need to get to Manchester. I think I missed my 10:15 train.',
			'rolePlayPage.missedTrain.chat.incoming2Highlight' => 'No problem',
			'rolePlayPage.missedTrain.chat.incoming2Rest' => '. Let me check the next available train for you.',
			'rolePlayPage.missedTrain.chat.botReply' => 'Would you prefer the fastest option or the cheapest one?',
			'rolePlayPage.flightAttendant.title' => 'Talking to a Flight Attendant',
			'rolePlayPage.flightAttendant.screenplay' => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.',
			'rolePlayPage.flightAttendant.chat.briefing' => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.flightAttendant.chat.incoming1' => 'Hello! May I see your boarding pass, please?',
			'rolePlayPage.flightAttendant.chat.outgoing1' => 'Sure, here you go. I\'m in seat 14B.',
			'rolePlayPage.flightAttendant.chat.incoming2Highlight' => 'Thank you',
			'rolePlayPage.flightAttendant.chat.incoming2Rest' => '. Would you like some help finding your seat?',
			'rolePlayPage.flightAttendant.chat.botReply' => 'Would you like something to drink — water, juice, coffee, or tea?',
			'rolePlayPage.trainTicket.title' => 'Buying a Train Ticket',
			'rolePlayPage.trainTicket.screenplay' => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.',
			'rolePlayPage.trainTicket.chat.briefing' => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.trainTicket.chat.incoming1' => 'Hello! Where would you like to go?',
			'rolePlayPage.trainTicket.chat.outgoing1' => 'I\'d like to go to Edinburgh, please.',
			'rolePlayPage.trainTicket.chat.incoming2Highlight' => 'Great',
			'rolePlayPage.trainTicket.chat.incoming2Rest' => '. When would you like to travel?',
			'rolePlayPage.trainTicket.chat.botReply' => 'Would you like a one-way or return ticket?',
			'rolePlayPage.restaurantReservation.title' => 'Making a Restaurant Reservation',
			'rolePlayPage.restaurantReservation.screenplay' => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.',
			'rolePlayPage.restaurantReservation.chat.briefing' => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?',
			'rolePlayPage.restaurantReservation.chat.incoming1' => 'Hello! How can I help you?',
			'rolePlayPage.restaurantReservation.chat.outgoing1' => 'Hi, I\'d like to make a reservation for dinner, please.',
			'rolePlayPage.restaurantReservation.chat.incoming2Highlight' => 'Of course',
			'rolePlayPage.restaurantReservation.chat.incoming2Rest' => '. What day would you like to come?',
			'rolePlayPage.restaurantReservation.chat.botReply' => 'How many people will be joining you?',
			'rolePlayPage.doctorAppointment.title' => 'Making a Doctor\'s Appointment',
			'rolePlayPage.doctorAppointment.screenplay' => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.',
			'rolePlayPage.doctorAppointment.chat.briefing' => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.doctorAppointment.chat.incoming1' => 'Hello! How can I help you today?',
			'rolePlayPage.doctorAppointment.chat.outgoing1' => 'Hi, I\'d like to book an appointment with a doctor, please.',
			'rolePlayPage.doctorAppointment.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.doctorAppointment.chat.incoming2Rest' => '. Have you visited our clinic before?',
			'rolePlayPage.doctorAppointment.chat.botReply' => 'What would you like to see the doctor about?',
			'rolePlayPage.shoppingClothes.title' => 'Shopping for Clothes',
			'rolePlayPage.shoppingClothes.screenplay' => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.',
			'rolePlayPage.shoppingClothes.chat.briefing' => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?',
			'rolePlayPage.shoppingClothes.chat.incoming1' => 'Hello! Can I help you find something?',
			'rolePlayPage.shoppingClothes.chat.outgoing1' => 'Yes, I\'m looking for a casual shirt for everyday wear.',
			'rolePlayPage.shoppingClothes.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.shoppingClothes.chat.incoming2Rest' => '. What size do you usually wear?',
			'rolePlayPage.shoppingClothes.chat.botReply' => 'Would you prefer something casual or more formal?',
			'rolePlayPage.takingTaxi.title' => 'Taking a Taxi',
			'rolePlayPage.takingTaxi.screenplay' => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.',
			'rolePlayPage.takingTaxi.chat.briefing' => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?',
			'rolePlayPage.takingTaxi.chat.incoming1' => 'Hello! Where would you like to go?',
			'rolePlayPage.takingTaxi.chat.outgoing1' => 'The Grand Hotel on Park Street, please.',
			'rolePlayPage.takingTaxi.chat.incoming2Highlight' => 'Got it',
			'rolePlayPage.takingTaxi.chat.incoming2Rest' => '. Do you have the exact address?',
			'rolePlayPage.takingTaxi.chat.botReply' => 'Would you prefer the fastest route?',
			'rolePlayPage.rentingApartment.title' => 'Renting an Apartment',
			'rolePlayPage.rentingApartment.screenplay' => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.',
			'rolePlayPage.rentingApartment.chat.briefing' => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?',
			'rolePlayPage.rentingApartment.chat.incoming1' => 'Hello! Are you interested in renting the apartment?',
			'rolePlayPage.rentingApartment.chat.outgoing1' => 'Yes, I\'d like to know more about it, please.',
			'rolePlayPage.rentingApartment.chat.incoming2Highlight' => 'Great',
			'rolePlayPage.rentingApartment.chat.incoming2Rest' => '. When are you looking to move in?',
			'rolePlayPage.rentingApartment.chat.botReply' => 'Do you need a furnished or unfurnished apartment?',
			'rolePlayPage.birthdayParty.title' => 'Planning a Birthday Party',
			'rolePlayPage.birthdayParty.screenplay' => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.',
			'rolePlayPage.birthdayParty.chat.briefing' => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.birthdayParty.chat.incoming1' => 'So, whose birthday are we planning?',
			'rolePlayPage.birthdayParty.chat.outgoing1' => 'It\'s for my friend Emma — her birthday is next month.',
			'rolePlayPage.birthdayParty.chat.incoming2Highlight' => 'Nice',
			'rolePlayPage.birthdayParty.chat.incoming2Rest' => '! When should we have the party?',
			'rolePlayPage.birthdayParty.chat.botReply' => 'Would you rather have the party at home or at a restaurant?',
			'rolePlayPage.deleteFailed' => 'Could not delete scenario. Please try again.',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Looks like you took a short break.',
			'pushNotifications.h2.1' => 'Got a moment for one word?',
			'pushNotifications.h2.2' => 'We\'re here — no rush.',
			'pushNotifications.h2.3' => 'Your learning rhythm paused for a bit.',
			'pushNotifications.h2.4' => 'A mini review might feel good.',
			'pushNotifications.h4.0' => 'A new word might be waiting for you today 👀',
			'pushNotifications.h4.1' => 'You might be missing a quick practice.',
			'pushNotifications.h4.2' => 'You might have skipped a useful phrase.',
			'pushNotifications.h4.3' => 'Today\'s progress is still open.',
			'pushNotifications.h4.4' => 'One word, one sentence… maybe both.',
			'pushNotifications.h8.0' => 'You don\'t have to progress every day.',
			'pushNotifications.h8.1' => 'Even a little review counts.',
			'pushNotifications.h8.2' => 'You didn\'t lose anything by not studying today.',
			'pushNotifications.h8.3' => 'We\'re ready when you are.',
			'pushNotifications.h8.4' => 'Language learning is a marathon, not a sprint.',
			'pushNotifications.h24.0' => 'A day passed. Your words are still here.',
			'pushNotifications.h24.1' => 'Taking a break is normal.',
			'pushNotifications.h24.2' => 'Your place is right where you left it.',
			'pushNotifications.h24.3' => 'Continue whenever you want.',
			'pushNotifications.h24.4' => 'Language won\'t run away — neither will we.',
			'pushNotifications.lessonReminderTitle' => 'Today\'s lesson is waiting',
			'pushNotifications.lessonReminder.0' => 'You haven\'t opened today\'s lesson yet — even 5 minutes counts.',
			'pushNotifications.lessonReminder.1' => 'Your tutor is ready. Pick up where you left off.',
			'pushNotifications.lessonReminder.2' => 'A short lesson today keeps your rhythm going.',
			'pushNotifications.lessonReminder.3' => 'Today\'s lesson is still open — want to jump in?',
			'pushNotifications.quizReminderTitle' => 'Ready for a quick quiz?',
			'pushNotifications.quizReminderWords' => ({required Object count, required Object savedCount}) => 'You learned ${count} words recently — want a quiz? ${savedCount} saved words are waiting.',
			'pushNotifications.quizReminderSaved' => ({required Object savedCount}) => '${savedCount} saved words are waiting for review.',
			'pushNotifications.quizReminder.0' => 'It\'s been a while since your last quiz — a 3-minute review could help.',
			'pushNotifications.quizReminder.1' => 'Your saved words miss you. A quick quiz?',
			'pushNotifications.quizReminder.2' => 'Test what you remember — it only takes a few minutes.',
			'pushNotifications.quizReminder.3' => 'A short quiz now makes tomorrow easier.',
			'pushNotifications.eveningLessonTitle' => 'Don\'t miss today\'s practice',
			'pushNotifications.eveningLesson.0' => 'You haven\'t studied today yet. One short lesson keeps the habit alive.',
			'pushNotifications.eveningLesson.1' => 'Before the day ends — a quick lesson with your tutor?',
			'pushNotifications.eveningLesson.2' => 'There\'s still time for a 5-minute English session today.',
			'pushNotifications.eveningLesson.3' => 'Your daily lesson is waiting. Shall we start?',
			'pushNotifications.streakReminderTitle' => 'Keep your streak',
			'pushNotifications.streakReminder' => ({required Object streak}) => 'You\'re on a ${streak}-day streak — a short lesson today keeps it alive.',
			'notificationsPage.title' => 'Notifications',
			'notificationsPage.deleteConfirmTitle' => 'Are you sure?',
			'notificationsPage.deleteConfirmBody' => 'This notification will be deleted.',
			'notificationsPage.delete' => 'Delete',
			'notificationsPage.cancel' => 'Cancel',
			'notificationsPage.translation.title' => 'New Translation Ready',
			'notificationsPage.translation.body' => 'Your audio translation file has been successfully converted to text and translated.',
			'notificationsPage.offer.title' => 'A Special Offer Awaits You',
			'notificationsPage.offer.body' => 'Upgrade to Premium for unlimited photo translations at 50% off.',
			'notificationsPage.stories.title' => 'Discover New Stories',
			'notificationsPage.stories.body' => 'Learn new words through stories',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'No notifications yet',
			'notificationsPage.emptySubtitle' => 'Don\'t forget to check again when you receive the notification.',
			'profilePage.title' => 'Profile',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Free Version',
			'profilePage.dayStreak' => 'Day Streak!',
			'profilePage.accountSettings' => 'Account Settings',
			'profilePage.general' => 'General',
			'profilePage.settingsShare' => 'Share',
			'profilePage.settingsSupport' => 'Support',
			'profilePage.settingsAbout' => 'About',
			'profilePage.settingsAccount' => 'Account',
			'profilePage.followInstagram' => 'Follow on Instagram',
			'profilePage.followTikTok' => 'Follow on TikTok',
			'profilePage.settings' => 'Settings',
			'profilePage.profileSettings' => 'Profile Settings',
			'profilePage.fullName' => 'Full Name',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Delete Account',
			'profilePage.save' => 'SAVE',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.deleteTitle' => 'Gitmeni istemiyoruz ama seni anlıyoruz.',
			'profilePage.deleteBody' => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?',
			'profilePage.deleteReasons.aiCharacters' => 'Yapay zeka karakterlerini gerçekçi bulmadım.',
			'profilePage.deleteReasons.videoIssues' => 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.',
			'profilePage.deleteReasons.pricing' => 'Abonelik fiyatları beklentimin üzerinde.',
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
			'profilePage.explanationLanguage' => 'Explanation Language',
			'profilePage.explanationNative' => 'Native language',
			'profilePage.explanationEnglish' => 'English',
			'profilePage.explanationUpdateFailed' => 'Could not update explanation language',
			'profilePage.learnInNativeLanguage' => 'Learn in your native language',
			'profilePage.targetLanguageLabel' => 'Target language',
			'profilePage.languageLevel' => 'Language level',
			'profilePage.nativeLanguage' => 'Native language',
			'profilePage.interests' => 'Interests',
			'profilePage.goalChipCareer' => 'Career',
			'profilePage.goalChipTravel' => 'Travel',
			'profilePage.goalChipLiving' => 'Living',
			'profilePage.goalChipStudying' => 'Study',
			'profilePage.goalChipOther' => 'Other',
			'profilePage.dailyGoal' => 'Daily goal',
			'profilePage.dailyGoalValueLight' => '5-10 min/day',
			'profilePage.dailyGoalValueRecommended' => '15-20 min/day',
			'profilePage.dailyGoalValueFast' => '30+ min/day',
			'profilePage.dailyReminder' => 'Daily reminder',
			'profilePage.selectNativeLanguageTitle' => 'Select your native language',
			'profilePage.reminderOn' => 'On',
			'profilePage.reminderOff' => 'Off',
			'profilePage.remindMe' => 'Remind me',
			'profilePage.reminderSave' => 'Save',
			'profilePage.reminderSaved' => 'Reminder saved',
			'profilePage.selectLanguageTitle' => 'Select Language',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passive',
			'profilePage.active' => 'Active',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Share Friend',
			'profilePage.shareWithFriendTitle' => 'Share with Friend',
			'profilePage.shareInviteBody' => 'Invite your friends and enjoy translate together',
			'profilePage.rateUs' => 'Rate Us',
			'profilePage.faq' => 'Lingola FAQ',
			'profilePage.faqItems.supportedLanguages.question' => 'Which languages does the app support?',
			'profilePage.faqItems.supportedLanguages.answer' => 'Lingola\'s interface is available in English, German, Italian, French, Turkish, Japanese, Spanish, Russian, Hindi, Portuguese, and Simplified Chinese.',
			'profilePage.faqItems.howAiWorks.question' => 'How does the AI work?',
			'profilePage.faqItems.howAiWorks.answer' => 'The AI interacts with you like a real tutor. It analyzes your conversations, detects mistakes, and offers personalized feedback based on your progress.',
			'profilePage.faqItems.offlineUse.question' => 'Can I use the app offline?',
			'profilePage.faqItems.offlineUse.answer' => 'Yes. You can download certain lessons and conversation scenarios in advance and use them offline. However, live chat requires an internet connection.',
			'profilePage.faqItems.isFree.question' => 'Is the app free?',
			'profilePage.faqItems.isFree.answer' => 'The basic version is free. With Premium, you get advanced chat scenarios, pronunciation analysis, and personal tutor mode.',
			'profilePage.faqItems.pronunciationEval.question' => 'How is my pronunciation evaluated?',
			'profilePage.faqItems.pronunciationEval.answer' => 'The app analyzes your voice and uses AI-powered speech recognition to score your accent and pronunciation. Words you need to improve are highlighted.',
			'profilePage.faqItems.dailyPractice.question' => 'Do I need to practice daily?',
			'profilePage.faqItems.dailyPractice.answer' => 'Yes. The system tracks your progress every day. Just 10–15 minutes of speaking practice per day can noticeably speed up your language learning.',
			'profilePage.faqItems.levelDetermination.question' => 'How is my learning level determined?',
			'profilePage.faqItems.levelDetermination.answer' => 'A short level check when you first sign in analyzes your current knowledge. After that, the AI automatically recommends lessons suited to your level.',
			'profilePage.faqItems.realPeopleChat.question' => 'Can I talk with real people?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Yes. Premium users can schedule short practice sessions with real tutors.',
			'profilePage.faqItems.dataSecurity.question' => 'Is my data safe?',
			'profilePage.faqItems.dataSecurity.answer' => 'Absolutely. All conversations and user data are stored encrypted. Your personal information is never shared with third parties.',
			'profilePage.faqItems.disableReminders.question' => 'How do I turn off daily reminders?',
			'profilePage.faqItems.disableReminders.answer' => 'Go to Profile settings, open Notifications, and change the reminder frequency or turn notifications off completely.',
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
			'profilePage.certificateTitle' => 'Your Certificate',
			'profilePage.certificateLevelTitle' => ({required Object level}) => '${level} Certificate',
			'profilePage.certificateOf' => 'Certificate of Achievement',
			'profilePage.certificatePresentedTo' => 'This certificate is proudly presented to',
			'profilePage.certificateAchievementBody' => ({required Object level}) => 'This achievement recognizes the successful completion of all ${level}-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.',
			'profilePage.certificateLevelCompleted' => ({required Object levelName}) => 'Level Completed: ${levelName}',
			'profilePage.certificateDateCompleted' => ({required Object date}) => 'Date of Completion: ${date}',
			'profilePage.certificateIdDisplay' => ({required Object id}) => 'Certificate ID: ${id}',
			'profilePage.certificateBrandTagline' => 'Learn. Speak. Connect.',
			'profilePage.certificateCertifiesThat' => 'This certifies that',
			'profilePage.certificatePathway' => 'Lingola English Pathway',
			'profilePage.certificateAwardedTo' => 'Awarded to',
			'profilePage.certificateCompleted' => 'has successfully completed',
			'profilePage.certificateCompletedDetail' => 'has successfully completed the Lingola English Proficiency Pathway and was awarded a certificate in',
			'profilePage.certificateLevelLine' => ({required Object level}) => 'English Level — CEFR ${level}',
			'profilePage.certificateIssued' => ({required Object date}) => 'Issued on ${date}',
			'profilePage.certificateDateOfCompletion' => 'Date of Completion',
			'profilePage.certificateIdLabel' => 'Certificate ID',
			'profilePage.certificateVerify' => 'Scan to verify this certificate',
			'profilePage.certificateVerifyAuthenticity' => 'VERIFY AUTHENTICITY',
			'profilePage.certificateScanOrVisit' => 'Scan the QR code or visit the link to verify authenticity.',
			'profilePage.certificateVerifyHint' => 'Anyone can scan the QR code to verify your achievement.',
			'profilePage.certificateShare' => 'Share Certificate',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'Certificate locked',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'You cannot use this certificate yet because you have not completed your ${level} lessons.',
			'profilePage.certificateNotAvailableOk' => 'Got it',
			'profilePage.certificateShareQr' => 'Share QR Code',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'When you complete a CEFR level on Lingola, your certificate will appear here with your name, level, and completion details.',
			'profilePage.certificatePreviewHint' => 'Complete a level path to unlock your certificate',
			'profilePage.certificateTapToView' => 'Tap to view and share your certificate',
			_ => null,
		};
	}
}
