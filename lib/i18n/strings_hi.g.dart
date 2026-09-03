///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsHi with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsHi _root = this; // ignore: unused_field

	@override 
	TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$hi app = _Translations$app$hi._(_root);
	@override late final _Translations$common$hi common = _Translations$common$hi._(_root);
	@override late final _Translations$onboarding$hi onboarding = _Translations$onboarding$hi._(_root);
	@override late final _Translations$targetLanguage$hi targetLanguage = _Translations$targetLanguage$hi._(_root);
	@override late final _Translations$language$hi language = _Translations$language$hi._(_root);
	@override late final _Translations$setup$hi setup = _Translations$setup$hi._(_root);
	@override late final _Translations$accountCreating$hi accountCreating = _Translations$accountCreating$hi._(_root);
	@override late final _Translations$planReady$hi planReady = _Translations$planReady$hi._(_root);
	@override late final _Translations$demoChat$hi demoChat = _Translations$demoChat$hi._(_root);
	@override late final _Translations$previewChat$hi previewChat = _Translations$previewChat$hi._(_root);
	@override late final _Translations$paywall$hi paywall = _Translations$paywall$hi._(_root);
	@override late final _Translations$auth$hi auth = _Translations$auth$hi._(_root);
	@override late final _Translations$nav$hi nav = _Translations$nav$hi._(_root);
	@override late final _Translations$home$hi home = _Translations$home$hi._(_root);
	@override late final _Translations$libraryPage$hi libraryPage = _Translations$libraryPage$hi._(_root);
	@override late final _Translations$wordPracticePage$hi wordPracticePage = _Translations$wordPracticePage$hi._(_root);
	@override late final _Translations$quizPage$hi quizPage = _Translations$quizPage$hi._(_root);
	@override late final _Translations$placeholder$hi placeholder = _Translations$placeholder$hi._(_root);
	@override late final _Translations$tutorPage$hi tutorPage = _Translations$tutorPage$hi._(_root);
	@override late final _Translations$lessonPage$hi lessonPage = _Translations$lessonPage$hi._(_root);
	@override late final _Translations$rolePlayPage$hi rolePlayPage = _Translations$rolePlayPage$hi._(_root);
	@override late final _Translations$notificationsPage$hi notificationsPage = _Translations$notificationsPage$hi._(_root);
	@override late final _Translations$profilePage$hi profilePage = _Translations$profilePage$hi._(_root);
	@override late final _Translations$pushNotifications$hi pushNotifications = _Translations$pushNotifications$hi._(_root);
	@override late final _Translations$apiErrors$hi apiErrors = _Translations$apiErrors$hi._(_root);
}

// Path: app
class _Translations$app$hi implements Translations$app$en {
	_Translations$app$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'सूचनाएँ';
	@override String get streak => 'सीखने की श्रृंखला';
	@override String get profile => 'प्रोफ़ाइल';
}

// Path: common
class _Translations$common$hi implements Translations$common$en {
	_Translations$common$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'जारी रखें';
	@override String get back => 'वापस';
	@override String get locked => 'लॉक किया गया';
	@override String minutes({required Object value}) => '${value} मिनट';
	@override String get close => 'बंद करें';
	@override String get getStarted => 'शुरू करें';
	@override String get connectionError => 'कोई कनेक्शन नहीं। अपने इंटरनेट की जांच करें और फिर से प्रयास करें।';
	@override String get genericError => 'कुछ गलत हुआ। कृपया फिर से प्रयास करें।';
	@override String get tryAgain => 'फिर से प्रयास करें';
}

// Path: onboarding
class _Translations$onboarding$hi implements Translations$onboarding$en {
	_Translations$onboarding$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'ऑनबोर्डिंग पेज ${current} में से ${total}';
	@override late final _Translations$onboarding$slide1$hi slide1 = _Translations$onboarding$slide1$hi._(_root);
	@override late final _Translations$onboarding$slide2$hi slide2 = _Translations$onboarding$slide2$hi._(_root);
	@override late final _Translations$onboarding$slide3$hi slide3 = _Translations$onboarding$slide3$hi._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$hi implements Translations$targetLanguage$en {
	_Translations$targetLanguage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'जिस भाषा को आप सीखना चाहते हैं उसे चुनें';
	@override String get comingSoon => 'और भाषाएँ जल्द ही आ रही हैं';
	@override String get korean => 'कोरियाई';
	@override String get portuguese => 'पुर्तगाली';
	@override String get portugueseBrazil => 'पुर्तगाली (ब्राज़ील)';
	@override String get german => 'जर्मन';
	@override String get italian => 'इतालवी';
	@override String get simplifiedChinese => 'सरल चीनी';
	@override String get arabic => 'अरबी';
	@override String get turkish => 'तुर्की';
	@override String get hindi => 'हिंदी';
}

// Path: language
class _Translations$language$hi implements Translations$language$en {
	_Translations$language$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'चरण ${current} का ${total}';
	@override String get title => 'आप क्या बोलना चाहते हैं?';
	@override String get nativeSection => 'मैं बोलता हूँ';
	@override String get nativeField => 'मूल भाषा';
	@override String get nativeName => 'तुर्की';
	@override String get targetSection => 'मैं सीखना चाहता हूँ';
	@override String get targetField => 'लक्षित भाषा';
	@override String get targetName => 'अंग्रेजी';
	@override String get direction => 'भाषा दिशा';
	@override String get selectLanguage => 'भाषा चुनें';
	@override String get comingSoonBadge => 'जल्द आ रहा है...';
	@override String get english => 'अंग्रेजी';
	@override String get french => 'फ्रेंच';
	@override String get japanese => 'जापानी';
	@override String get spanish => 'स्पेनिश';
	@override String get russian => 'रूसी';
}

// Path: setup
class _Translations$setup$hi implements Translations$setup$en {
	_Translations$setup$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'आपका लक्ष्य क्या है?';
	@override String get goalCareer => 'करियर विकास';
	@override String get goalTravel => 'यात्रा';
	@override String get goalLiving => 'विदेश में रहना';
	@override String get goalStudying => 'विदेश में अध्ययन';
	@override String get goalOther => 'अन्य';
	@override String get levelTitle => 'आपका वर्तमान भाषा स्तर क्या है?';
	@override String get paceTitle => 'आप कितनी तेजी से सुधारना चाहते हैं?';
	@override String get explanationTitle => 'जब आप अपनी भाषा में सवाल पूछें, तो हम कैसे समझाएँ?';
	@override String get explanationHint => 'आप इसे कभी भी प्रोफ़ाइल सेटिंग्स में बदल सकते हैं।';
	@override String get explanationNative => 'मेरी मातृभाषा में समझाएँ';
	@override String get explanationEnglish => 'अंग्रेजी में समझाएँ';
	@override String get levelA1 => 'A1 — मैं कुछ शब्द जानता हूँ';
	@override String get levelA2 => 'A2 — मैं सरल वाक्यांश उपयोग कर सकता हूँ';
	@override String get levelB1 => 'B1 — मैं रोज़मर्रा की बातचीत कर सकता हूँ';
	@override String get levelB2 => 'B2 — परिचित विषयों पर धाराप्रवाह बात कर सकता हूँ';
	@override String get levelC1 => 'C1 — उन्नत, सुधार चाहता हूँ';
	@override String get levelC2 => 'C2 — लगभग मातृभाषा स्तर';
	@override String get paceMin5 => '5 मिनट/दिन';
	@override String get paceMin10 => '10 मिनट/दिन';
	@override String get paceMin15 => '15 मिनट/दिन';
	@override String get paceMin30 => '30 मिनट/दिन';
	@override String get paceMin60 => '60 मिनट/दिन';
}

// Path: accountCreating
class _Translations$accountCreating$hi implements Translations$accountCreating$en {
	_Translations$accountCreating$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपका व्यक्तिगत खाता बनाया जा रहा है';
	@override String get stepContent => 'सामग्री बनाई जा रही है';
	@override String get stepDialogues => 'संवाद तैयार किए जा रहे हैं';
	@override String get stepLessons => 'पाठों का अनुकूलन किया जा रहा है';
	@override String get stepPlan => 'आपकी योजना अंतिम रूप दी जा रही है';
	@override String get optimization => 'अनुकूलन';
	@override String progress({required Object value}) => '${value}%';
	@override String get titleLine1 => 'Building your';
	@override String get titleLine2 => 'Account';
	@override String get testimonialQuote => 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I\'m not stopping now.';
	@override String get testimonialAuthor => 'Maria, 29 — 3 months in';
	@override String get comparisonPitch => 'Learn 600+ extra phrases about 30× faster with Lingola than studying entirely on your own.';
	@override String get comparisonAloneCount => '400';
	@override String get comparisonLingolaCount => '1000';
	@override String get comparisonUnit => 'PHRASES';
	@override String get comparisonAloneLabel => 'On your own';
	@override String get comparisonLingolaLabel => 'Lingola';
	@override String get fluencyPitch => 'From today to fluency — your next level is only 30 days away';
	@override String get chartToday => 'Today';
	@override String get chartMid => '15 Sep';
	@override String get chartEnd => '30 Sep';
}

// Path: planReady
class _Translations$planReady$hi implements Translations$planReady$en {
	_Translations$planReady$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get titleLine1 => 'Your plan is';
	@override String get titleLine2 => 'Ready!';
	@override String get statBanner => '95% of users see results within the first 7 days';
	@override String planTitle({required Object name}) => '${name}\'S PLAN';
	@override String get defaultName => 'YOUR';
	@override String get fieldCourse => 'COURSE';
	@override String get fieldLevel => 'YOUR LEVEL';
	@override String get fieldFocus => 'FOCUS AREA';
	@override String get fieldDuration => 'DURATION';
	@override String get fieldInterests => 'INTERESTS';
	@override String get startPlan => 'Start my plan →';
	@override String get courseEnglish => 'English';
	@override String get courseGerman => 'German';
	@override String get courseFrench => 'French';
	@override String get courseItalian => 'Italian';
	@override String get courseSpanish => 'Spanish';
	@override String get courseJapanese => 'Japanese';
	@override String get courseRussian => 'Russian';
	@override String get courseTurkish => 'Turkish';
	@override String get goalCareer => 'Career & business';
	@override String get goalTravel => 'Travel';
	@override String get goalLiving => 'Living abroad';
	@override String get goalStudying => 'Studying abroad';
	@override String get goalOther => 'Other';
	@override String get levelA1 => 'A1';
	@override String get levelA2 => 'A2';
	@override String get levelB1 => 'B1';
	@override String get levelB2 => 'B2';
	@override String get levelC1 => 'C1';
	@override String get levelC2 => 'C2';
	@override String get paceMin5 => '5 मिनट/दिन';
	@override String get paceMin10 => '10 मिनट/दिन';
	@override String get paceMin15 => '15 मिनट/दिन';
	@override String get paceMin30 => '30 मिनट/दिन';
	@override String get paceMin60 => '60 मिनट/दिन';
}

// Path: demoChat
class _Translations$demoChat$hi implements Translations$demoChat$en {
	_Translations$demoChat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$hi implements Translations$previewChat$en {
	_Translations$previewChat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'पाठ 1: अभिवादन';
	@override String get speed => '1x';
	@override String get typeMessage => 'एक संदेश टाइप करें...';
	@override String get incoming1 => 'नमस्ते! Lingola में आपका स्वागत है — मैं आपका AI ट्यूटर हूँ। आपका स्तर जो भी हो, यहाँ आप सुरक्षित महसूस करेंगे और अंग्रेजी सीखेंगे। अंग्रेजी में नमस्ते के लिए \'Hi\' या \'Hello\' कहते हैं — कोशिश करें: मुझे अंग्रेजी में \'Hi!\' लिखें!';
	@override String get outgoing1 => 'नमस्ते! मैं अभ्यास करने के लिए तैयार हूँ।';
	@override String get incoming2Highlight => 'गुड़ मॉर्निंग';
	@override String get incoming2Rest => ', Emrah! मुझे खुशी है कि आप तैयार महसूस कर रहे हैं। सुबह की कॉफी हमेशा एक संबंध बनाने की शानदार शुरुआत होती है। आप किस बारे में बात करना चाहेंगे?';
	@override String get holdToSpeak => 'बोलने के लिए दबाए रखें';
	@override String get recording => 'रिकॉर्डिंग… भेजने के लिए छोड़ें';
	@override String get slideUpToLock => 'लॉक करने के लिए ऊपर स्वाइप करें';
	@override String get slideLeftToCancel => 'रद्द करने के लिए बाएँ स्वाइप करें';
	@override String get recordingLockedHint => 'हो जाने पर भेजें टैप करें';
}

// Path: paywall
class _Translations$paywall$hi implements Translations$paywall$en {
	_Translations$paywall$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आज बोलना शुरू करें — मुफ्त';
	@override String get subtitle => 'असीमित सीखने के अवसर';
	@override String get noCommitment => 'कोई प्रतिबद्धता नहीं';
	@override String get cancelAnytime => 'कभी भी रद्द करें';
	@override String get noPaymentToday => 'आज कोई भुगतान नहीं';
	@override String get daysFree => '3 दिन मुफ्त';
	@override String get thenPrice => 'फिर \$1.99/महीना';
	@override String get trialActive => 'मुफ्त परीक्षण सक्रिय';
	@override String get payableToday => 'आज भुगतान करने योग्य';
	@override String get payableValue => '3 दिन मुफ्त 0.00\$';
	@override String get paymentDate => 'भुगतान की तारीख: 13 मार्च 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$hi implements Translations$auth$en {
	_Translations$auth$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'हमारे विविध AI प्रशिक्षक';
	@override String get title => 'आज एक नई भाषा बोलना शुरू करें';
	@override String get body => 'AI के साथ असली बातचीत का अभ्यास करें।\nकोई दबाव नहीं। कोई न्याय नहीं।';
	@override String get continueGoogle => 'Google के साथ जारी रखें';
	@override String get continueApple => 'Apple के साथ जारी रखें';
	@override String get continueGuest => 'अतिथि के रूप में जारी रखें';
	@override String get or => 'या';
	@override String get alreadyHaveAccount => 'क्या आपके पास पहले से खाता है?';
	@override String get signIn => 'साइन इन करें';
	@override String get legal => 'Lingola के लिए साइन अप करके, आप हमारी सेवा की शर्तें स्वीकार करते हैं। जानें कि हम आपके डेटा को गोपनीयता नीति और कुकी नीति में कैसे प्रोसेस करते हैं';
	@override String get terms => 'सेवा की शर्तें';
	@override String get privacy => 'गोपनीयता नीति';
	@override String get cookies => 'कुकी नीति';
}

// Path: nav
class _Translations$nav$hi implements Translations$nav$en {
	_Translations$nav$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get home => 'होम';
	@override String get tutor => 'ट्यूटर';
	@override String get lesson => 'पाठ';
	@override String get rolePlay => 'भूमिका निभाना';
	@override String get profile => 'प्रोफ़ाइल';
}

// Path: home
class _Translations$home$hi implements Translations$home$en {
	_Translations$home$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'सुप्रभात, Jhon';
	@override String get todayPractice => 'आज की प्रैक्टिस';
	@override String get continueConversation => 'बातचीत जारी रखें';
	@override String continueWithTutor({required Object name}) => '${name} के साथ जारी रखें या दूसरा ट्यूटर चुनें?';
	@override String continueSameTutor({required Object name}) => '${name} के साथ जारी रखें';
	@override String get chooseOtherTutor => 'दूसरा ट्यूटर चुनें';
	@override String minutesLeft({required Object value}) => '${value} मिनट बाकी';
	@override String get lessonProgress => 'पाठ 2 — अभिवादन';
	@override String get timeCurrent => '0मिनट';
	@override String get timeTotal => '/ 15मिनट';
	@override String get kContinue => 'जारी रखें';
	@override String get learningPath => 'A1 - प्रारंभिक';
	@override String get allLessons => 'सभी पाठ';
	@override String get introductions => 'परिचय I';
	@override String get greetings => 'अभिवादन';
	@override String get jobs => 'नौकरियाँ';
	@override String get favoriteRoom => 'एक पसंदीदा कमरा';
	@override String get dailyRoutine => 'दैनिक दिनचर्या';
	@override String get scroll => 'स्क्रॉल करें';
	@override String get liveLesson => 'लाइव पाठ';
	@override String get liveLessonSubtitle => 'हमारे ट्यूटर के साथ वीडियो कॉल करें';
	@override String get moreTutor => 'और ट्यूटर';
	@override String get startTalkNow => 'अब बात करना शुरू करें';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'अनुकूलनशील';
	@override String get tagCalm => 'शांत';
	@override String get tagPatient => 'धैर्यवान';
	@override String get tagMethodical => 'पद्धतिगत';
	@override String get tagEncouraging => 'प्रोत्साहक';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'और सुविधाएँ';
	@override String get practiceLabel => 'प्रैक्टिस';
	@override String get wordPractice => 'शब्द प्रैक्टिस';
	@override String get wordPracticeBody => 'अपनी चुनी हुई भाषा में रोज़ाना अपने शब्दावली का निर्माण करें';
	@override String get immersiveLabel => 'इमर्सिव';
	@override String get quiz => 'क्विज़';
	@override String get quizBodyLine1 => 'वास्तविक के माध्यम से सीखें';
	@override String get quizBodyLine2 => 'संदर्भ में उदाहरण';
	@override String get getStarted => 'शुरू करें';
	@override String get library => 'पुस्तकालय';
	@override String get libraryTitle => 'सीखें और बचाएं';
	@override String get learnMore => 'और जानें';
	@override late final _Translations$home$premium$hi premium = _Translations$home$premium$hi._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$hi implements Translations$libraryPage$en {
	_Translations$libraryPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'पुस्तकालय';
	@override String get searchWord => 'शब्द खोजें';
	@override String savedWordCount({required Object count}) => '${count} सहेजे गए शब्द';
	@override String get savedWordTab => 'सहेजे गए शब्द';
	@override String get dictionaryTab => 'शब्दकोश';
	@override String get dictionaryLabel => 'शब्दकोश';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$hi implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'शब्द अभ्यास';
	@override String get turkish => 'तुर्की';
	@override String get save => 'सहेजें';
	@override String get saved => 'सहेजा गया';
	@override String get listen => 'सुनें';
	@override String get hint => 'संकेत';
	@override String get previous => 'पिछला';
	@override String get next => 'अगला';
}

// Path: quizPage
class _Translations$quizPage$hi implements Translations$quizPage$en {
	_Translations$quizPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'क्विज़';
	@override String get headline => 'आप आज क्या सुधारना चाहते हैं?';
	@override String get subtitle => 'अपनी ट्रेनिंग चुनें — 3 मिनट से कम समय लगेगा 🚀';
	@override String get readingTitle => 'पढ़ाई';
	@override String get readingBody => 'लेखों और कहानियों के माध्यम से समझ';
	@override String get writingTitle => 'लेखन';
	@override String get writingBody => 'व्याकरण और शब्दावली के अभ्यास';
	@override String get speakingTitle => 'बोलना';
	@override String get speakingBody => 'AI स्पीच इंजन के माध्यम से उच्चारण';
	@override String get readingTestTitle => 'पढ़ाई परीक्षण';
	@override String get read => 'पढ़ें';
	@override String get listeningHint => 'अंग्रेज़ी शब्द को स्पष्ट रूप से बोलें...';
	@override String get micPermissionDenied => 'माइक्रोफ़ोन या स्पीच रिकग्निशन उपलब्ध नहीं है।';
	@override String get matchSuccess => 'शानदार! यह शब्द से मेल खाता है।';
	@override String matchFail({required Object heard}) => 'सुना "${heard}"। फिर से कोशिश करें।';
	@override String get successfulTitle => 'सफल!';
	@override String get successfulBody => 'एक मूल वक्ता की तरह उच्चारण!';
	@override String get failedTitle => 'असफल';
	@override String get failedBody => 'यह लगभग हो रहा था, एक और मौका दें';
	@override String get tryAgain => 'फिर से कोशिश करें';
	@override String get writingTestTitle => 'लेखन परीक्षण';
	@override String get sourceLanguage => 'स्रोत भाषा';
	@override String get answer => 'उत्तर';
	@override String get writeAnswerHint => 'यहाँ अपना उत्तर लिखें...';
	@override String get submit => 'जमा करें';
	@override String get speakingTestTitle => 'बोलने का परीक्षण';
	@override String get speakingProficiency => 'बोलने की दक्षता';
	@override String get speakClearlyHint => 'अपने माइक्रोफ़ोन में स्पष्ट रूप से बोलें:';
	@override String get speakUp => 'जोर से बोलें';
	@override String get recording => 'रिकॉर्डिंग...';
	@override String questionOf({required Object current, required Object total}) => 'प्रश्न ${current}/${total}';
}

// Path: placeholder
class _Translations$placeholder$hi implements Translations$placeholder$en {
	_Translations$placeholder$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} आ रहा है';
	@override String body({required Object tab}) => 'हम आपके लिए एक केंद्रित ${tab} अनुभव तैयार कर रहे हैं।';
}

// Path: tutorPage
class _Translations$tutorPage$hi implements Translations$tutorPage$en {
	_Translations$tutorPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'ट्यूटर';
	@override String get chatWithLingola => 'Lingola के साथ चैट करें';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => '${name} के साथ चैट करें';
	@override String get chatHistory => 'चैट इतिहास';
	@override String get history => 'इतिहास';
	@override String get filter => 'फिल्टर';
	@override String get country => 'देश';
	@override String get focus => 'फोकस';
	@override String get moreCountries => '8+ और';
	@override String get moreFocus => '+8';
	@override String get save => 'सहेजें';
	@override String get clearFilter => 'फ़िल्टर हटाएँ';
	@override String get startTalkNow => 'अब बात शुरू करें';
	@override String get typeMessage => 'एक संदेश टाइप करें...';
	@override String get speaker => 'स्पीकर';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$hi tutors = _Translations$tutorPage$tutors$hi._(_root);
	@override late final _Translations$tutorPage$tags$hi tags = _Translations$tutorPage$tags$hi._(_root);
	@override String get historyPreview1 => 'हे! मैं बोरियत से फटने ही वाला था...';
	@override String get historyPreview2 => 'क्या हम आज खाना ऑर्डर करने का अभ्यास करें?';
	@override String get time1 => '11:00 AM';
	@override String get time2 => 'कल';
	@override late final _Translations$tutorPage$chat$hi chat = _Translations$tutorPage$chat$hi._(_root);
	@override late final _Translations$tutorPage$calling$hi calling = _Translations$tutorPage$calling$hi._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$hi implements Translations$lessonPage$en {
	_Translations$lessonPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सीखना जारी रखें';
	@override String get profile => 'प्रोफ़ाइल';
	@override String get language => 'लक्षित भाषा';
	@override String get completed => 'पूर्ण';
	@override String get locked => 'लॉक किया गया';
	@override String get pickTutorTitle => 'अपने ट्यूटर का चयन करें';
	@override String get startTalk => 'पाठ शुरू करें';
	@override String get chatInstead => 'इसके बजाय चैट करें';
	@override String get lockedHint => 'इस पाठ को अनलॉक करने के लिए पिछले पाठ को पूरा करें।';
	@override String get levelLockedTitle => 'लेवल लॉक';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'आपका अंग्रेज़ी स्तर ${userLevel} है, इसलिए पहले का पथ पूरा किए बिना ${lessonLevel} पाठ नहीं खोल सकते।';
	@override String get levelLockedOk => 'समझ गया';
	@override String get notesTitle => 'पाठ नोट्स';
	@override String get whatWeLearned => 'आज हमने क्या सीखा';
	@override String get deleteNotes => 'मेरे पाठ नोट्स हटाएं';
	@override String get deleteNotesConfirm => 'क्या आप इन नोट्स को हटाना चाहते हैं? इसे पूर्ववत नहीं किया जा सकता।';
	@override String get delete => 'हटाएं';
	@override String get cancel => 'रद्द करें';
	@override String get practiceCta => 'अगर यह बहुत कठिन लगा, तो आप उसी विषय का अभ्यास फिर से कर सकते हैं।';
	@override String get practiceNow => 'इस विषय का अभ्यास करें';
	@override String get openChat => 'ट्यूटर के साथ चैट खोलें';
	@override String get yourScore => 'आपका स्कोर';
	@override String bestScore({required Object score}) => 'सर्वश्रेष्ठ ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'निष्क्रिय प्रतिभागी';
	@override String get participationSilentBody => 'आप इस बार चुप रहे। मुझे लगता है कि आपको यह पाठ फिर से लेना चाहिए।';
	@override String get participationPassive => 'कम भागीदारी';
	@override String get participationPassiveBody => 'आपने मुश्किल से बात की। पाठ को फिर से आजमाएं और अधिक कहें।';
	@override String get participationActive => 'अच्छी भागीदारी';
	@override String get participationActiveBody => 'आपने बातचीत में भाग लिया। ऐसे ही जारी रखें!';
	@override String get participationStrong => 'मजबूत भागीदारी';
	@override String get participationStrongBody => 'आपने बहुत बात की। शानदार काम!';
	@override String get retakeLesson => 'इस पाठ को फिर से लें';
	@override String get finishLesson => 'पाठ पूरा करें';
	@override String get savingNotes => 'आपका ट्यूटर आज के नोट्स लिख रहा है...';
	@override String get noNotes => 'अपने ट्यूटर से नोट्स प्राप्त करने के लिए इस पाठ को पूरा करें।';
	@override String get notesDeleted => 'पाठ नोट्स हटा दिए गए';
	@override late final _Translations$lessonPage$levels$hi levels = _Translations$lessonPage$levels$hi._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$hi implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'भूमिका निभाना';
	@override String get subtitle => 'अपनी भूमिका चुनें — एक वास्तविक जीवन परिदृश्य का अनुभव करें 🎭';
	@override String progressCompleted({required Object value}) => '%${value} पूरा हुआ';
	@override String minutes({required Object value}) => '${value} मिनट';
	@override String get beginner => 'शुरुआती';
	@override String get screenplay => 'स्क्रीनप्ले';
	@override String get dailyInteractions => 'दैनिक इंटरैक्शन';
	@override String get business => 'व्यापार';
	@override late final _Translations$rolePlayPage$coffee$hi coffee = _Translations$rolePlayPage$coffee$hi._(_root);
	@override late final _Translations$rolePlayPage$directions$hi directions = _Translations$rolePlayPage$directions$hi._(_root);
	@override late final _Translations$rolePlayPage$interview$hi interview = _Translations$rolePlayPage$interview$hi._(_root);
	@override String get customScenarios => 'Your scenarios';
	@override String get createOwnScenario => 'Create your\nown scenario!';
	@override String get createOwnScenarioTitle => 'Create your scenario';
	@override String get creatingScenario => 'Creating your role play';
	@override String get creatingScenarioSubtitle => 'Lingola is writing your scene and illustration...';
	@override String get createFailed => 'Could not create scenario. Please try again.';
	@override String get createFieldScenario => 'Scenario';
	@override String get createFieldScenarioHint => 'e.g. business meeting';
	@override String get createFieldTutorRole => 'Tutor role';
	@override String get createFieldTutorRoleHint => 'e.g. interviewer';
	@override String get createFieldYourRole => 'Your role';
	@override String get createFieldYourRoleHint => 'e.g. candidate';
	@override String get createFieldExtraInfo => 'Extra details (optional)';
	@override String get createFieldExtraInfoHint => 'e.g. senior software developer interview at a tech company';
	@override String get createOwnScenarioContinue => 'Continue';
	@override String get createFieldsRequired => 'Please fill in scenario and both roles.';
	@override String get intermediate => 'Intermediate';
	@override String get beginnerIntermediate => 'Beginner–Intermediate';
	@override late final _Translations$rolePlayPage$missedTrain$hi missedTrain = _Translations$rolePlayPage$missedTrain$hi._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$hi flightAttendant = _Translations$rolePlayPage$flightAttendant$hi._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$hi trainTicket = _Translations$rolePlayPage$trainTicket$hi._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$hi restaurantReservation = _Translations$rolePlayPage$restaurantReservation$hi._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$hi doctorAppointment = _Translations$rolePlayPage$doctorAppointment$hi._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$hi shoppingClothes = _Translations$rolePlayPage$shoppingClothes$hi._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$hi takingTaxi = _Translations$rolePlayPage$takingTaxi$hi._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$hi rentingApartment = _Translations$rolePlayPage$rentingApartment$hi._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$hi birthdayParty = _Translations$rolePlayPage$birthdayParty$hi._(_root);
	@override String get deleteFailed => 'सीन नहीं हटाया जा सका। कृपया फिर से कोशिश करें।';
}

// Path: notificationsPage
class _Translations$notificationsPage$hi implements Translations$notificationsPage$en {
	_Translations$notificationsPage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सूचनाएँ';
	@override String get deleteConfirmTitle => 'क्या आप सुनिश्चित हैं?';
	@override String get deleteConfirmBody => 'यह सूचना हटा दी जाएगी।';
	@override String get delete => 'हटाएँ';
	@override String get cancel => 'रद्द करें';
	@override late final _Translations$notificationsPage$translation$hi translation = _Translations$notificationsPage$translation$hi._(_root);
	@override late final _Translations$notificationsPage$offer$hi offer = _Translations$notificationsPage$offer$hi._(_root);
	@override late final _Translations$notificationsPage$stories$hi stories = _Translations$notificationsPage$stories$hi._(_root);
	@override late final _Translations$notificationsPage$practice$hi practice = _Translations$notificationsPage$practice$hi._(_root);
	@override late final _Translations$notificationsPage$streak$hi streak = _Translations$notificationsPage$streak$hi._(_root);
	@override late final _Translations$notificationsPage$premium$hi premium = _Translations$notificationsPage$premium$hi._(_root);
	@override String get emptyTitle => 'अभी तक कोई सूचना नहीं';
	@override String get emptySubtitle => 'जब आपको सूचना मिले तो दोबारा जाँचना न भूलें।';
}

// Path: profilePage
class _Translations$profilePage$hi implements Translations$profilePage$en {
	_Translations$profilePage$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'प्रोफ़ाइल';
	@override String get userName => 'जॉन डो';
	@override String get freeVersion => 'फ्री वर्ज़न';
	@override String get dayStreak => 'डे स्ट्रीक!';
	@override String get accountSettings => 'खाता सेटिंग्स';
	@override String get general => 'सामान्य';
	@override String get profileSettings => 'प्रोफ़ाइल सेटिंग्स';
	@override String get fullName => 'पूरा नाम';
	@override String get email => 'ई-मेल';
	@override String get deleteAccount => 'खाता हटाएँ';
	@override String get save => 'सहेजें';
	@override String get deleteTitle => 'हम आपको नहीं जाना चाहते लेकिन हम आपको समझते हैं।';
	@override String get deleteBody => 'क्या आप हमें बता सकते हैं कि आप Lingola का अनुभव क्यों छोड़ना चाहते हैं?';
	@override late final _Translations$profilePage$deleteReasons$hi deleteReasons = _Translations$profilePage$deleteReasons$hi._(_root);
	@override String get messageOptional => 'संदेश (वैकल्पिक)';
	@override String get messageHint => 'यदि आपके पास कोई संदेश है, तो कृपया लिखें।';
	@override String get next => 'अगला';
	@override String get specialOfferTitle => 'विशेष प्रस्ताव';
	@override String get specialOfferBody => 'जाने से पहले आपके लिए तैयार किए गए प्रस्ताव पर एक नज़र डालें।';
	@override String get monthlyPlanTitle => '1-महीने की योजना पर स्विच करें';
	@override String get monthlyPlanPrice => '\$79/महीना, कभी भी रद्द करें';
	@override String get monthlyPlanDesc => 'कोई दीर्घकालिक प्रतिबद्धता नहीं। महीने-दर-महीने हमारे समुदाय से जुड़े रहें।';
	@override String get whatYoullKeep => 'आप क्या रखेंगे:';
	@override String get keepCharacters => 'सभी पात्रों तक पहुँच';
	@override String get keepVideo => 'असीमित वीडियो कॉल';
	@override String get keepCourses => 'सभी पाठ्यक्रमों तक पहुँच';
	@override String get switchMonthlyCta => 'मासिक योजना पर स्विच करें';
	@override String get confirmTitle => 'क्या आप सुनिश्चित हैं?';
	@override String get confirmBody => 'हम वास्तव में आपको जाते हुए नहीं देखना चाहते। यहाँ है जो आप खो देंगे:';
	@override String get loseCharacters => 'असीमित पात्रों की पहुँच';
	@override String get loseVideo => 'असीमित वीडियो कॉल की पहुँच';
	@override String get loseCourses => 'सभी पाठ्यक्रमों की पहुँच';
	@override String get discountTitle => 'रुकें और 1 महीने के लिए 60% छूट पाएं';
	@override String get discountSubtitle => 'हमारा अब तक का सबसे अच्छा प्रस्ताव। केवल \$27.60/महीना';
	@override String get acceptDiscountCta => '60% छूट स्वीकार करें और रुकें';
	@override String get farewellTitle => 'हमें आपको जाते हुए देखकर दुख हो रहा है';
	@override String farewellBody({required Object date}) => 'आपकी सदस्यता रद्द कर दी गई है। आप ${date} तक अपनी वर्तमान बिलिंग अवधि के अंत तक पहुँच बनाए रखेंगे।';
	@override String get changeMindTitle => '✨ क्या आप अपना मन बदलना चाहते हैं?';
	@override String changeMindBody({required Object date}) => 'आप ${date} से पहले कभी भी अपनी सदस्यता को फिर से सक्रिय कर सकते हैं ताकि आप अपने लाभ बनाए रख सकें।';
	@override String get reactivateCta => 'रुकें, मैं फिर से सक्रिय करना चाहता हूँ';
	@override String get done => 'पूरा';
	@override String get notifications => 'सूचनाएँ';
	@override String get appLanguage => 'ऐप भाषा';
	@override String get explanationLanguage => 'व्याख्या भाषा';
	@override String get explanationNative => 'मातृभाषा';
	@override String get explanationEnglish => 'अंग्रेजी';
	@override String get explanationUpdateFailed => 'व्याख्या भाषा अपडेट नहीं हो सकी';
	@override String get learnInNativeLanguage => 'Learn in your native language';
	@override String get targetLanguageLabel => 'Target language';
	@override String get languageLevel => 'Language level';
	@override String get nativeLanguage => 'Native language';
	@override String get interests => 'Interests';
	@override String get goalChipCareer => 'Career';
	@override String get goalChipTravel => 'Travel';
	@override String get goalChipLiving => 'Living';
	@override String get goalChipStudying => 'Study';
	@override String get goalChipOther => 'Other';
	@override String get dailyGoal => 'Daily goal';
	@override String get dailyReminder => 'Daily reminder';
	@override String get selectNativeLanguageTitle => 'Select your native language';
	@override String get reminderOn => 'On';
	@override String get reminderOff => 'Off';
	@override String get remindMe => 'मुझे याद दिलाएं';
	@override String get reminderSave => 'सहेजें';
	@override String get reminderSaved => 'अनुस्मारक सहेजा गया';
	@override String get selectLanguageTitle => 'भाषा चुनें';
	@override String get premium => 'प्रीमियम';
	@override String get passive => 'निष्क्रिय';
	@override String get active => 'सक्रिय';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'मित्र को साझा करें';
	@override String get shareWithFriendTitle => 'मित्र के साथ साझा करें';
	@override String get shareInviteBody => 'अपने दोस्तों को आमंत्रित करें और एक साथ अनुवाद का आनंद लें';
	@override String get rateUs => 'हमें रेट करें';
	@override String get faq => 'अक्सर पूछे जाने वाले प्रश्न';
	@override late final _Translations$profilePage$faqItems$hi faqItems = _Translations$profilePage$faqItems$hi._(_root);
	@override String get support => 'सहायता';
	@override String get feedback => 'फीडबैक';
	@override String get progression => 'प्रगति';
	@override String get progressTitle => 'प्रगति';
	@override String get goodMorning => 'शुभ प्रभात,';
	@override String get progressUserName => 'जॉन';
	@override String get progressLanguage => 'अंग्रेज़ी';
	@override String get past7Days => 'पिछले 7 दिन';
	@override String get past7DaysBody => 'अपनी स्ट्रीक बनाने और एक शक्तिशाली सीखने की आदत बनाने के लिए हर दिन अध्ययन करें।';
	@override String get currentLevel => 'वर्तमान स्तर';
	@override String xpLeft({required Object level, required Object xp}) => 'आपको ${level} तक पहुँचने के लिए केवल ${xp} XP बाकी है!';
	@override String get toNextLevel => 'अगले स्तर के लिए';
	@override String get dayStreakLabel => 'डे स्ट्रीक';
	@override String get totalPoints => 'कुल अंक';
	@override String get savedWords => 'सहेजे गए शब्द';
	@override String itemsToReview({required Object count}) => '${count} आइटम की समीक्षा करने के लिए';
	@override String get logout => 'लॉग आउट';
	@override String get logoutTitle => 'आप लॉग आउट करने वाले हैं';
	@override String get logoutBody => 'जल्द ही फिर से मिलेंगे! हम आपकी श्वसन व्यायामों को याद करेंगे।';
	@override String get logoutConfirm => 'लॉगआउट';
	@override String get logoutCancel => 'रद्द करें';
	@override late final _Translations$profilePage$days$hi days = _Translations$profilePage$days$hi._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'आपका प्रमाणपत्र';
	@override String certificateLevelTitle({required Object level}) => '${level} Certificate';
	@override String get certificateOf => 'Certificate of Achievement';
	@override String get certificatePresentedTo => 'This certificate is proudly presented to';
	@override String certificateAchievementBody({required Object level}) => 'This achievement recognizes the successful completion of all ${level}-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.';
	@override String certificateLevelCompleted({required Object levelName}) => 'Level Completed: ${levelName}';
	@override String certificateDateCompleted({required Object date}) => 'Date of Completion: ${date}';
	@override String certificateIdDisplay({required Object id}) => 'Certificate ID: ${id}';
	@override String get certificateBrandTagline => 'Learn. Speak. Connect.';
	@override String get certificateCertifiesThat => 'This certifies that';
	@override String get certificatePathway => 'Lingola English Pathway';
	@override String get certificateAwardedTo => 'Awarded to';
	@override String get certificateCompleted => 'has successfully completed';
	@override String get certificateCompletedDetail => 'has successfully completed the Lingola English Proficiency Pathway and was awarded a certificate in';
	@override String certificateLevelLine({required Object level}) => 'English Level — CEFR ${level}';
	@override String certificateIssued({required Object date}) => 'Issued on ${date}';
	@override String get certificateDateOfCompletion => 'Date of Completion';
	@override String get certificateIdLabel => 'Certificate ID';
	@override String get certificateVerify => 'Scan to verify this certificate';
	@override String get certificateVerifyAuthenticity => 'VERIFY AUTHENTICITY';
	@override String get certificateScanOrVisit => 'Scan the QR code or visit the link to verify authenticity.';
	@override String get certificateVerifyHint => 'कोई भी QR कोड स्कैन करके आपकी उपलब्धि की पुष्टि कर सकता है।';
	@override String get certificateShare => 'प्रमाणपत्र साझा करें';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => 'प्रमाणपत्र लॉक है';
	@override String certificateNotAvailable({required Object level}) => 'आपने अभी तक अपने ${level} पाठ पूरे नहीं किए हैं, इसलिए यह प्रमाणपत्र अभी उपलब्ध नहीं है।';
	@override String get certificateNotAvailableOk => 'समझ गया';
	@override String get certificateShareQr => 'QR कोड साझा करें';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'जब आप Lingola पर CEFR स्तर पूरा करेंगे, तो आपका प्रमाणपत्र यहाँ दिखेगा — आपके नाम, स्तर और सत्यापन के लिए QR कोड के साथ।';
	@override String get certificatePreviewHint => 'अपना प्रमाणपत्र अनलॉक करने के लिए एक स्तर पथ पूरा करें';
	@override String get certificateTapToView => 'प्रमाणपत्र देखने और साझा करने के लिए टैप करें';
	@override String get settings => 'सेटिंग्स';
	@override String get dailyGoalValueLight => '5-10 मिनट/दिन';
	@override String get dailyGoalValueRecommended => '15-20 मिनट/दिन';
	@override String get dailyGoalValueFast => '30+ मिनट/दिन';
	@override String get settingsShare => 'Share';
	@override String get settingsSupport => 'Support';
	@override String get settingsAbout => 'About';
	@override String get settingsAccount => 'Account';
	@override String get followInstagram => 'Follow on Instagram';
	@override String get followTikTok => 'Follow on TikTok';
}

// Path: pushNotifications
class _Translations$pushNotifications$hi implements Translations$pushNotifications$en {
	_Translations$pushNotifications$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'लगता है आपने थोड़ी देर का ब्रेक लिया।',
		'क्या आपके पास एक शब्द के लिए एक पल है?',
		'हम यहाँ हैं — कोई जल्दी नहीं।',
		'आपकी सीखने की लय थोड़ी देर के लिए रुकी है।',
		'एक छोटा सा रिव्यू अच्छा लग सकता है।',
	];
	@override List<String> get h4 => [
		'आज आपके लिए एक नया शब्द इंतज़ार कर रहा हो सकता है 👀',
		'आप एक त्वरित अभ्यास से चूक सकते हैं।',
		'आपने एक उपयोगी वाक्यांश छोड़ दिया हो सकता है।',
		'आज की प्रगति अभी भी खुली है।',
		'एक शब्द, एक वाक्य… शायद दोनों।',
	];
	@override List<String> get h8 => [
		'आपको हर दिन प्रगति करने की ज़रूरत नहीं है।',
		'यहाँ तक कि थोड़ा सा रिव्यू भी मायने रखता है।',
		'आज अध्ययन न करने से आपने कुछ नहीं खोया।',
		'हम तब तक तैयार हैं जब तक आप हैं।',
		'भाषा सीखना एक मैराथन है, स्प्रिंट नहीं।',
	];
	@override List<String> get h24 => [
		'एक दिन बीत गया। आपके शब्द अभी भी यहाँ हैं।',
		'ब्रेक लेना सामान्य है।',
		'आपका स्थान ठीक वहीं है जहाँ आपने छोड़ा था।',
		'जब चाहें जारी रखें।',
		'भाषा भाग नहीं जाएगी — न ही हम।',
	];
	@override String get lessonReminderTitle => 'Today\'s lesson is waiting';
	@override List<String> get lessonReminder => [
		'You haven\'t opened today\'s lesson yet — even 5 minutes counts.',
		'Your tutor is ready. Pick up where you left off.',
		'A short lesson today keeps your rhythm going.',
		'Today\'s lesson is still open — want to jump in?',
	];
	@override String get quizReminderTitle => 'Ready for a quick quiz?';
	@override String quizReminderWords({required Object count, required Object savedCount}) => 'You learned ${count} words recently — want a quiz? ${savedCount} saved words are waiting.';
	@override String quizReminderSaved({required Object savedCount}) => '${savedCount} saved words are waiting for review.';
	@override List<String> get quizReminder => [
		'It\'s been a while since your last quiz — a 3-minute review could help.',
		'Your saved words miss you. A quick quiz?',
		'Test what you remember — it only takes a few minutes.',
		'A short quiz now makes tomorrow easier.',
	];
	@override String get eveningLessonTitle => 'Don\'t miss today\'s practice';
	@override List<String> get eveningLesson => [
		'You haven\'t studied today yet. One short lesson keeps the habit alive.',
		'Before the day ends — a quick lesson with your tutor?',
		'There\'s still time for a 5-minute English session today.',
		'Your daily lesson is waiting. Shall we start?',
	];
	@override String get streakReminderTitle => 'Keep your streak';
	@override String streakReminder({required Object streak}) => 'You\'re on a ${streak}-day streak — a short lesson today keeps it alive.';
}

// Path: apiErrors
class _Translations$apiErrors$hi implements Translations$apiErrors$en {
	_Translations$apiErrors$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get unauthorized => 'Please sign in again.';
	@override String get notFound => 'We couldn\'t find what you were looking for.';
	@override String get validationFailed => 'Please check your input and try again.';
	@override String get nameRequired => 'Name cannot be empty.';
	@override String get imageRequired => 'Please choose a photo to upload.';
	@override String get avatarInvalidType => 'Only JPEG, PNG, or WebP photos are allowed.';
	@override String get avatarEmpty => 'The selected photo is empty.';
	@override String get avatarTooLarge => 'Photo is too large (max 5 MB).';
	@override String get notificationsRequired => 'Notification preference is required.';
	@override String get premiumRequired => 'Premium is required for this lesson.';
	@override String get levelRequired => 'Complete earlier lessons to unlock this level.';
	@override String get internalError => 'Something went wrong. Please try again.';
}

// Path: onboarding.slide1
class _Translations$onboarding$slide1$hi implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'कुछ ही हफ्तों में आत्मविश्वास से बोलें — महीनों में नहीं';
	@override String get body => 'AI के साथ असली बातचीत का अभ्यास करें। अपने उच्चारण, आत्मविश्वास, और धाराप्रवाहता में सुधार करें, रोज़ाना।';
	@override String get testimonialName => 'सारा विलियम्स, 24';
	@override String get testimonialBody => 'मैं पहले अंग्रेजी नहीं बोल पाती थी। अब मैं काम पर रोज़ बात करती हूँ।';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$hi implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'बिना कीमत के एक निजी ट्यूटर';
	@override String get body => 'असली बातचीत। तात्कालिक फीडबैक।\nकोई शेड्यूलिंग नहीं। कोई दबाव नहीं।';
	@override String get realTutor => 'असली ट्यूटर';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / घंटा';
	@override String get priceLingola => '\$9.99 / वर्ष';
	@override String get versus => 'VS';
	@override String get scheduled => 'शेड्यूल किया गया';
	@override String get anytime => 'कभी भी';
	@override String get stressful => 'तनावपूर्ण';
	@override String get noPressure => 'कोई दबाव नहीं';
	@override String get price => 'कीमत';
	@override String get availability => 'उपलब्धता';
	@override String get feeling => 'महसूस';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$hi implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपके चारों ओर बना एक लर्निंग प्लान';
	@override String get body => 'आपके लक्ष्य, आपकी गति, आपका स्तर।\nशुरुआती से धाराप्रवाह तक — कदम दर कदम।';
	@override String get goal => 'लक्ष्य';
	@override String get practice => 'अभ्यास';
	@override String get progress => 'प्रगति';
}

// Path: home.premium
class _Translations$home$premium$hi implements Translations$home$premium$en {
	_Translations$home$premium$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'बोलने के लिए ';
	@override String get titleHighlight => 'धाराप्रवाह';
	@override String get titleAfter => ' बिना गलतियाँ करने के डर के।';
	@override String get descriptionBefore => 'दुनिया भर के लाखों छात्रों में शामिल हों। आज ही भाषा की बाधा तोड़ना शुरू करें — ';
	@override String get descriptionHighlight => 'पहले 3 दिन पूरी तरह से मुफ्त।';
	@override String get feature1 => '24/7 उपलब्ध AI ट्यूटर';
	@override String get feature2 => 'निजी ट्यूटर्स तक असीमित पहुँच';
	@override String get feature3 => 'आपके लिए तैयार किया गया दैनिक पाठ योजना';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/माह';
	@override String get discount => 'वार्षिक खरीद पर 40% छूट';
	@override String get cta => 'शुरू करें';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$hi implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get lingola => 'Lingola';
	@override String get zephyrion => 'Zephyrion';
	@override String get vaelen => 'Vaelen';
	@override String get elrion => 'Elrion';
	@override String get ukrath => 'Ukrath';
	@override String get elena => 'Elena';
	@override String get kenji => 'Kenji';
	@override String get freya => 'Freya';
	@override String get camila => 'Camila';
	@override String get marco => 'Marco';
	@override String get julian => 'Julian';
	@override String get ines => 'Ines';
	@override String get felix => 'Felix';
	@override String get diego => 'Diego';
	@override String get amara => 'Amara';
	@override String get erik => 'Erik';
	@override String get katie => 'Katie';
	@override String get morgan => 'Morgan';
	@override String get santa => 'सांता क्लॉज';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$hi implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'अनुकूलनशील';
	@override String get calm => 'शांत';
	@override String get patient => 'धैर्यवान';
	@override String get organized => 'व्यवस्थित';
	@override String get relaxed => 'आरामदायक';
	@override String get methodical => 'पद्धतिगत';
	@override String get attentive => 'ध्यान देने वाला';
	@override String get more => '+5';
	@override String get curious => 'जिज्ञासु';
	@override String get observer => 'पर्यवेक्षक';
	@override String get ancientKnowledge => 'प्राचीन ज्ञान';
	@override String get wise => 'बुद्धिमान';
	@override String get clear => 'स्पष्ट';
	@override String get decisive => 'निर्णायक';
	@override String get disciplined => 'अनुशासित';
	@override String get smart => 'स्मार्ट';
	@override String get analytic => 'विश्लेषणात्मक';
	@override String get cheerful => 'खुशमिजाज';
	@override String get generous => 'उदार';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$hi implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'गुड मॉर्निंग! मुझे खुशी है कि आप आज अभ्यास के लिए तैयार महसूस कर रहे हैं।';
	@override String get outgoing1 => 'हाँ, चलो अभिवादन से शुरू करते हैं।';
	@override String get incoming2 => 'परफेक्ट। आप एक सहयोगी को कैसे नमस्ते कहेंगे?';
	@override String get typing => 'टाइप कर रहे हैं';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$hi implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'पाठ 1 : अभिवादन';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'पाठ ${number} : ${title}';
	@override String get nativeLine => 'क्या तुम बोर हो गए?';
	@override String get englishLine => 'बोर? मैंने अपने शब्दकोश से वह शब्द हटा दिया। उठो, योजना पहले से तय है: हम कादिकॉय में उस नए आर्केड बार में जा रहे हैं।';
	@override String get highlight => 'बोर?';
	@override String get close => 'कॉल समाप्त करें';
	@override String get toggleCaptions => 'कैप्शन टॉगल करें';
	@override String get toggleHints => 'संकेत टॉगल करें';
	@override String get toggleMic => 'माइक्रोफोन टॉगल करें';
	@override String get tapToSpeakHint => 'बोलने के लिए टैप करें, समाप्त करने के लिए फिर टैप करें';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$hi implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$hi a1 = _Translations$lessonPage$levels$a1$hi._(_root);
	@override late final _Translations$lessonPage$levels$a2$hi a2 = _Translations$lessonPage$levels$a2$hi._(_root);
	@override late final _Translations$lessonPage$levels$b1$hi b1 = _Translations$lessonPage$levels$b1$hi._(_root);
	@override late final _Translations$lessonPage$levels$b2$hi b2 = _Translations$lessonPage$levels$b2$hi._(_root);
	@override late final _Translations$lessonPage$levels$c1$hi c1 = _Translations$lessonPage$levels$c1$hi._(_root);
	@override late final _Translations$lessonPage$levels$c2$hi c2 = _Translations$lessonPage$levels$c2$hi._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$hi implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'कॉफी शॉप में ऑर्डर करना';
	@override String get screenplay => 'अपने पसंदीदा पेय का ऑर्डर दें, आकार और अतिरिक्त के बारे में पूछें, अपने कुल की पुष्टि करें, और काउंटर पर अपना कॉफी लें।';
	@override late final _Translations$rolePlayPage$coffee$chat$hi chat = _Translations$rolePlayPage$coffee$chat$hi._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$hi implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सड़क पर दिशा पूछना';
	@override String get screenplay => 'किसी स्थान के लिए दिशा पूछें, मेट्रो या बस तक कैसे पहुंचें, टिकटों के बारे में जानकारी प्राप्त करें, और रेस्तरां की सिफारिशें सुनें।';
	@override late final _Translations$rolePlayPage$directions$chat$hi chat = _Translations$rolePlayPage$directions$chat$hi._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$hi implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'नौकरी का साक्षात्कार';
	@override String get screenplay => 'अपने आप का परिचय दें, सामान्य साक्षात्कार प्रश्नों के उत्तर दें, अपने अनुभव के बारे में बात करें, और भूमिका और अगले कदमों के बारे में पूछें।';
	@override late final _Translations$rolePlayPage$interview$chat$hi chat = _Translations$rolePlayPage$interview$chat$hi._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$hi implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$hi chat = _Translations$rolePlayPage$missedTrain$chat$hi._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$hi implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$hi chat = _Translations$rolePlayPage$flightAttendant$chat$hi._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$hi implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$hi chat = _Translations$rolePlayPage$trainTicket$chat$hi._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$hi implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$hi chat = _Translations$rolePlayPage$restaurantReservation$chat$hi._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$hi implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$hi chat = _Translations$rolePlayPage$doctorAppointment$chat$hi._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$hi implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$hi chat = _Translations$rolePlayPage$shoppingClothes$chat$hi._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$hi implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$hi chat = _Translations$rolePlayPage$takingTaxi$chat$hi._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$hi implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$hi chat = _Translations$rolePlayPage$rentingApartment$chat$hi._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$hi implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$hi chat = _Translations$rolePlayPage$birthdayParty$chat$hi._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$hi implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'नई अनुवाद तैयार है';
	@override String get body => 'आपकी ऑडियो अनुवाद फ़ाइल को सफलतापूर्वक टेक्स्ट में परिवर्तित किया गया है और अनुवादित किया गया है।';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$hi implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'आपके लिए एक विशेष प्रस्ताव है';
	@override String get body => '50% छूट पर अनलिमिटेड फोटो अनुवाद के लिए Premium में अपग्रेड करें।';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$hi implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'नई कहानियाँ खोजें';
	@override String get body => 'कहानियों के माध्यम से नए शब्द सीखें';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$hi implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$hi implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$hi implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$hi implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'मुझे एआई पात्र वास्तविकता में नहीं लगे।';
	@override String get videoIssues => 'वीडियो कॉल में तकनीकी समस्याएँ आ रही हैं।';
	@override String get pricing => 'सदस्यता की कीमतें मेरी अपेक्षाओं से अधिक हैं।';
	@override String get noMatch => 'मुझे मेरी पसंद के पात्र नहीं मिले।';
	@override String get shortTrial => 'मैंने केवल थोड़े समय के लिए कोशिश करना चाहा था।';
	@override String get other => 'अन्य';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$hi implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$hi supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$hi._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$hi howAiWorks = _Translations$profilePage$faqItems$howAiWorks$hi._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$hi offlineUse = _Translations$profilePage$faqItems$offlineUse$hi._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$hi isFree = _Translations$profilePage$faqItems$isFree$hi._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$hi pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$hi._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$hi dailyPractice = _Translations$profilePage$faqItems$dailyPractice$hi._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$hi levelDetermination = _Translations$profilePage$faqItems$levelDetermination$hi._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$hi realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$hi._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$hi dataSecurity = _Translations$profilePage$faqItems$dataSecurity$hi._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$hi disableReminders = _Translations$profilePage$faqItems$disableReminders$hi._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$hi implements Translations$profilePage$days$en {
	_Translations$profilePage$days$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get mon => 'सोम';
	@override String get tue => 'मंगल';
	@override String get wed => 'बुध';
	@override String get thu => 'गुरु';
	@override String get fri => 'शुक्र';
	@override String get sat => 'शनिवार';
	@override String get sun => 'रविवार';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$hi implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - शुरुआत';
	@override List<String> get lessons => [
		'नमस्ते',
		'परिचय I',
		'नौकरियां',
		'एक पसंदीदा कमरा',
		'दैनिक दिनचर्या',
		'फल',
		'सलाह 1',
		'परिवार 1',
		'रोज़मर्रा की चीज़ें',
		'गृहनगर',
		'घर',
		'खाने की पसंद',
		'शौक 1',
		'सफल लोग',
		'खाना और पेय',
		'रेस्टोरेंट में ऑर्डर करना',
		'पालतू जानवर',
		'स्वास्थ्य और फिटनेस',
		'मौसम',
		'नई जीवनशैली',
		'बेहतर होना',
		'शौक 2',
		'जगहों के बारे में सवाल',
		'स्वामित्व',
		'खरीदारी 1',
		'समय बताना',
		'दिशाएं 1',
		'खरीदारी 2',
		'आपको जानना',
		'वस्तुओं के स्थान',
		'दिखावट',
		'दिशाएं 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$hi implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - बुनियादी';
	@override List<String> get lessons => [
		'परिवार 2',
		'लोग और स्थान',
		'परिवार 3',
		'वस्तुओं का वर्णन',
		'शहर',
		'निर्माण परियोजना',
		'घर sweet घर',
		'कितने बजे हैं',
		'दैनिक दिनचर्या 2',
		'फुर्सत का समय',
		'खाना और पोषण',
		'खरीदारी और उपभोक्ता',
		'छुट्टियाँ',
		'वीकेंड की योजनाएँ',
		'औपचारिक या अनौपचारिक',
		'फैशन',
		'खरीदारी 3',
		'सलाह 2',
		'आप कर सकते हैं',
		'खरीदारी 4',
		'छोटी बातें',
		'एक लट्टे, कृपया',
		'खाना',
		'घूमना',
		'यात्रा के लिए तैयार',
		'यात्रा 1',
		'शहरी पलायन',
		'यात्रा 2',
		'रुकने के लिए जगह',
		'बहुत रोमांचक',
		'सही व्यक्ति',
		'स्कूल',
		'संगीत प्राथमिकताएँ',
		'खेल',
		'दौड़ के नियम',
		'संदेश छोड़ें',
		'अनुरोध',
		'निमंत्रण',
		'यात्रा के अनुभव',
		'भूतकाल 1',
		'भूतकाल 2',
		'भूतकाल 3',
		'भूतकाल के बारे में प्रश्न',
		'आप कभी भी बहुत बड़े नहीं होते',
		'बचपन की यादें',
		'सराहना',
		'बहाने',
		'यह बहुत परेशान करने वाला है!',
		'एक डिजिटल दुनिया',
		'काम का जीवन',
		'मुझे समझ नहीं आया',
		'बचाना या खर्च करना?',
		'माफ करना कहें',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$hi implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - मध्यवर्ती';
	@override List<String> get lessons => [
		'संस्कृतिक परंपराएँ',
		'सेलिब्रिटीज',
		'कला और रचनात्मकता',
		'भविष्य की योजनाएँ',
		'इवेंट की योजना बनाना',
		'लक्ष्य और योजनाएँ',
		'ऐतिहासिक घटनाएँ',
		'प्रौद्योगिकी',
		'कभी नहीं',
		'क्या चल रहा है',
		'सपनों की छुट्टी',
		'सोशल मीडिया',
		'पुस्तक अनुशंसाएँ',
		'ऐसे ही एक दिन',
		'विशेष तस्वीरें',
		'व्यक्तिगत उपलब्धियाँ',
		'पसंदीदा फिल्में',
		'समाचार फ्लैश',
		'खुशी',
		'एक व्यस्त सप्ताह',
		'जहाँ मैं बड़ा हुआ',
		'स्कूल के दिन',
		'प्रोफाइल',
		'जीवन मानचित्र',
		'हर दिन',
		'अगला क्या है',
		'सुझाव बनाना',
		'क्या हुआ',
		'यादें',
		'संस्कृति का झटका',
		'रुचि वाक्यांश',
		'नौकरी के साक्षात्कार',
		'बकेट लिस्ट',
		'मेरे तरह का शहर',
		'इंटरनेट पीढ़ी',
		'लोकप्रिय ब्रांड',
		'राय वाक्यांश',
		'यह कैसा दिखता है',
		'जीवन स्थान',
		'अच्छा खाना',
		'असामान्य शौक',
		'एक कठिन चुनाव',
		'कार्रवाई करें',
		'नई क्षमताएँ',
		'शिकायत करना',
		'शिक्षा',
		'हरित शहर',
		'नौकरी में क्या है',
		'व्यक्तिगत चुनौतियाँ',
		'साक्षात्कार वाक्यांश',
		'शिष्टता के अंत',
		'हेडलाइन समाचार',
		'छोटे बदलाव',
		'माफी के बहाने',
		'फोन शिष्टाचार',
		'बात काटने के लिए माफ करें...',
		'शिकायत के जवाब',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$hi implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - ऊपरी मध्यवर्ती';
	@override List<String> get lessons => [
		'व्यक्तित्व',
		'महान लीड',
		'स्वस्थ जीवनशैली',
		'सच्चाई क्या है?',
		'व्यक्तिगत विकास',
		'बोलकर बताना',
		'अभिनय करना?',
		'मुझे याद है...',
		'सामाजिक फीडबैक',
		'अपराध स्थल',
		'शिष्टता की परेशानी',
		'संघर्ष समाधान',
		'इसे पसंद करें या नफरत करें?',
		'पर्यावरणीय मुद्दे',
		'हम इसे सुलझा सकते हैं',
		'रहस्य और अपराध',
		'संभावित भविष्य',
		'व्यापार योजनाएँ',
		'बैठक के निर्णय',
		'यह इतना पूर्वानुमानित है...',
		'काम पर',
		'विज्ञान और प्रौद्योगिकी',
		'समय प्रबंधन',
		'मानव अधिकार',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$hi implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - उन्नत';
	@override List<String> get lessons => [
		'संस्कृतिक मानदंड',
		'सोशल मीडिया का प्रभाव',
		'करियर के विकल्प',
		'प्रदर्शन को तेज करें',
		'आविष्कार',
		'समय यात्रा',
		'संपत्ति',
		'नौकरी के कौशल',
		'ऐतिहासिक परिवर्तन',
		'समीक्षा लेखन',
		'रहस्य',
		'अजीब सिद्धांत',
		'सेलिब्रिटी',
		'वैश्विक राजनीति',
		'उत्पाद बूम',
		'क्या खुश होंगे?',
		'शायद बाद में...',
		'नए समाधान',
		'संदर्भात्मक प्रभाव',
		'एक खोया हुआ लोगो',
		'दयालु कार्य',
		'क्या फिल्म है',
		'कितना परेशान करने वाला',
		'समाचार में',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$hi implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - विशेषज्ञ';
	@override List<String> get lessons => [
		'वैश्वीकरण',
		'प्राकृतिक आपदाएँ',
		'जानकारी पर प्रतिक्रिया',
		'काम-जीवन संतुलन',
		'दूरस्थ कार्य',
		'परिवार के मुद्दे',
		'बुनियादी मानव शारीरिक रचना',
		'स्वास्थ्य पूर्वानुमान',
		'स्वास्थ्य सेवा की पहुंच',
		'वैश्विक यात्रा अनुभव',
		'सुपरपावर',
		'टीम निर्माण',
		'जैवफ्लोरेसेंस',
		'दुविधाएँ',
		'सामाजिक उत्साह',
		'परिवर्तन',
		'काम, काम, काम',
		'स्थानीय मुद्दे',
		'समस्याएँ, समस्याएँ',
		'सत्य या कल्पना?',
		'पर्यटन',
		'स्वयंसेवा',
		'मन की आंख',
		'मीडिया खपत',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$hi implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'नमस्ते! आज हम कॉफी शॉप में ऑर्डर करने का अभ्यास करेंगे — नमस्ते, आकार, अतिरिक्त। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे। ठीक है?';
	@override String get incoming1 => 'स्वागत है! आज मैं आपके लिए क्या शुरू कर सकता हूँ?';
	@override String get outgoing1 => 'नमस्ते! मुझे एक मीडियम लाटे चाहिए, कृपया।';
	@override String get incoming2Highlight => 'बिल्कुल';
	@override String get incoming2Rest => '! क्या आप इसे गर्म या बर्फीला चाहेंगे, और कोई अतिरिक्त?';
	@override String get botReply => 'शानदार चयन। क्या आपके ऑर्डर के साथ कुछ और चाहिए?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$hi implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'नमस्ते! आज हम सड़क पर दिशा पूछने का अभ्यास करेंगे। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे। ठीक है?';
	@override String get incoming1 => 'नमस्ते! आप थोड़े खोए हुए लग रहे हैं — क्या आपको कुछ खोजने में मदद चाहिए?';
	@override String get outgoing1 => 'हाँ, मैं निकटतम मेट्रो स्टेशन की तलाश कर रहा हूँ।';
	@override String get incoming2Highlight => 'बिल्कुल';
	@override String get incoming2Rest => '! उस दिशा में दो ब्लॉक चलें, फिर बाएं मुड़ें। आपको प्रवेश द्वार दिखाई देगा।';
	@override String get botReply => 'आपका स्वागत है! क्या आप स्टेशन के पास एक रेस्तरां की टिप भी चाहते हैं?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$hi implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'नमस्ते! आज हम नौकरी के साक्षात्कार का अभ्यास करेंगे। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे — मैं आपको साक्षात्कार दूंगा, फिर हम बदलेंगे। ठीक है?';
	@override String get incoming1 => 'आज आने के लिए धन्यवाद। क्या आप संक्षेप में अपने बारे में बता सकते हैं?';
	@override String get outgoing1 => 'बिल्कुल। मैं यहाँ होने और अपने अनुभव को साझा करने के लिए उत्साहित हूँ।';
	@override String get incoming2Highlight => 'शानदार';
	@override String get incoming2Rest => '. मुझे एक हालिया परियोजना के बारे में बताएं जिस पर आपको गर्व है।';
	@override String get botReply => 'यह प्रभावशाली है। आपके पास भूमिका के बारे में क्या प्रश्न हैं?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$hi implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$hi implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$hi implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$hi implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$hi implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$hi implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$hi implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$hi implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$hi implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$hi implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'ऐप कौन सी भाषाओं का समर्थन करता है?';
	@override String get answer => 'Lingola इंटरफ़ेस अंग्रेज़ी, जर्मन, इतालवी, फ़्रेंच, तुर्की, जापानी, स्पेनिश, रूसी, हिंदी, पुर्तगाली और सरलीकृत चीनी में उपलब्ध है।';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$hi implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'एआई कैसे काम करता है?';
	@override String get answer => 'एआई आपके साथ एक असली ट्यूटर की तरह बातचीत करता है। यह आपकी बातचीत का विश्लेषण करता है, गलतियों का पता लगाता है, और आपकी प्रगति के आधार पर व्यक्तिगत फीडबैक प्रदान करता है।';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$hi implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'क्या मैं ऐप का ऑफ़लाइन उपयोग कर सकता हूँ?';
	@override String get answer => 'हाँ। आप कुछ पाठ और बातचीत के परिदृश्यों को पहले से डाउनलोड कर सकते हैं और उन्हें ऑफ़लाइन उपयोग कर सकते हैं। हालाँकि, लाइव चैट के लिए इंटरनेट कनेक्शन की आवश्यकता होती है।';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$hi implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'क्या ऐप मुफ्त है?';
	@override String get answer => 'बुनियादी संस्करण मुफ्त है। प्रीमियम के साथ, आपको उन्नत चैट परिदृश्य, उच्चारण विश्लेषण, और व्यक्तिगत ट्यूटर मोड मिलता है।';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$hi implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'मेरे उच्चारण का मूल्यांकन कैसे किया जाता है?';
	@override String get answer => 'ऐप आपकी आवाज़ का विश्लेषण करता है और आपके उच्चारण और उच्चारण को स्कोर करने के लिए एआई-संचालित स्पीच रिकग्निशन का उपयोग करता है। जिन शब्दों में आपको सुधार की आवश्यकता है, उन्हें हाइलाइट किया जाता है।';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$hi implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'क्या मुझे रोज़ अभ्यास करना चाहिए?';
	@override String get answer => 'हाँ। सिस्टम आपकी प्रगति को हर दिन ट्रैक करता है। केवल 10-15 मिनट का बोलने का अभ्यास आपके भाषा सीखने की गति को स्पष्ट रूप से बढ़ा सकता है।';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$hi implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'मेरे सीखने के स्तर का निर्धारण कैसे किया जाता है?';
	@override String get answer => 'जब आप पहली बार साइन इन करते हैं, तो एक छोटा स्तर जांच आपके वर्तमान ज्ञान का विश्लेषण करता है। उसके बाद, एआई स्वचालित रूप से आपके स्तर के अनुसार पाठों की सिफारिश करता है।';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$hi implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'क्या मैं असली लोगों से बात कर सकता हूँ?';
	@override String get answer => 'हाँ। प्रीमियम उपयोगकर्ता असली ट्यूटर्स के साथ छोटे अभ्यास सत्र निर्धारित कर सकते हैं।';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$hi implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'क्या मेरा डेटा सुरक्षित है?';
	@override String get answer => 'बिल्कुल। सभी बातचीत और उपयोगकर्ता डेटा एन्क्रिप्टेड रूप में संग्रहीत होते हैं। आपकी व्यक्तिगत जानकारी कभी भी तीसरे पक्ष के साथ साझा नहीं की जाती है।';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$hi implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$hi._(this._root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get question => 'मैं दैनिक अनुस्मारक कैसे बंद करूँ?';
	@override String get answer => 'प्रोफ़ाइल सेटिंग्स पर जाएँ, सूचनाएँ खोलें, और अनुस्मारक की आवृत्ति बदलें या सूचनाएँ पूरी तरह से बंद करें।';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'सूचनाएँ',
			'app.streak' => 'सीखने की श्रृंखला',
			'app.profile' => 'प्रोफ़ाइल',
			'common.continueLabel' => 'जारी रखें',
			'common.back' => 'वापस',
			'common.locked' => 'लॉक किया गया',
			'common.minutes' => ({required Object value}) => '${value} मिनट',
			'common.close' => 'बंद करें',
			'common.getStarted' => 'शुरू करें',
			'common.connectionError' => 'कोई कनेक्शन नहीं। अपने इंटरनेट की जांच करें और फिर से प्रयास करें।',
			'common.genericError' => 'कुछ गलत हुआ। कृपया फिर से प्रयास करें।',
			'common.tryAgain' => 'फिर से प्रयास करें',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'ऑनबोर्डिंग पेज ${current} में से ${total}',
			'onboarding.slide1.title' => 'कुछ ही हफ्तों में आत्मविश्वास से बोलें — महीनों में नहीं',
			'onboarding.slide1.body' => 'AI के साथ असली बातचीत का अभ्यास करें। अपने उच्चारण, आत्मविश्वास, और धाराप्रवाहता में सुधार करें, रोज़ाना।',
			'onboarding.slide1.testimonialName' => 'सारा विलियम्स, 24',
			'onboarding.slide1.testimonialBody' => 'मैं पहले अंग्रेजी नहीं बोल पाती थी। अब मैं काम पर रोज़ बात करती हूँ।',
			'onboarding.slide2.title' => 'बिना कीमत के एक निजी ट्यूटर',
			'onboarding.slide2.body' => 'असली बातचीत। तात्कालिक फीडबैक।\nकोई शेड्यूलिंग नहीं। कोई दबाव नहीं।',
			'onboarding.slide2.realTutor' => 'असली ट्यूटर',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / घंटा',
			'onboarding.slide2.priceLingola' => '\$9.99 / वर्ष',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'शेड्यूल किया गया',
			'onboarding.slide2.anytime' => 'कभी भी',
			'onboarding.slide2.stressful' => 'तनावपूर्ण',
			'onboarding.slide2.noPressure' => 'कोई दबाव नहीं',
			'onboarding.slide2.price' => 'कीमत',
			'onboarding.slide2.availability' => 'उपलब्धता',
			'onboarding.slide2.feeling' => 'महसूस',
			'onboarding.slide3.title' => 'आपके चारों ओर बना एक लर्निंग प्लान',
			'onboarding.slide3.body' => 'आपके लक्ष्य, आपकी गति, आपका स्तर।\nशुरुआती से धाराप्रवाह तक — कदम दर कदम।',
			'onboarding.slide3.goal' => 'लक्ष्य',
			'onboarding.slide3.practice' => 'अभ्यास',
			'onboarding.slide3.progress' => 'प्रगति',
			'targetLanguage.title' => 'जिस भाषा को आप सीखना चाहते हैं उसे चुनें',
			'targetLanguage.comingSoon' => 'और भाषाएँ जल्द ही आ रही हैं',
			'targetLanguage.korean' => 'कोरियाई',
			'targetLanguage.portuguese' => 'पुर्तगाली',
			'targetLanguage.portugueseBrazil' => 'पुर्तगाली (ब्राज़ील)',
			'targetLanguage.german' => 'जर्मन',
			'targetLanguage.italian' => 'इतालवी',
			'targetLanguage.simplifiedChinese' => 'सरल चीनी',
			'targetLanguage.arabic' => 'अरबी',
			'targetLanguage.turkish' => 'तुर्की',
			'targetLanguage.hindi' => 'हिंदी',
			'language.step' => ({required Object current, required Object total}) => 'चरण ${current} का ${total}',
			'language.title' => 'आप क्या बोलना चाहते हैं?',
			'language.nativeSection' => 'मैं बोलता हूँ',
			'language.nativeField' => 'मूल भाषा',
			'language.nativeName' => 'तुर्की',
			'language.targetSection' => 'मैं सीखना चाहता हूँ',
			'language.targetField' => 'लक्षित भाषा',
			'language.targetName' => 'अंग्रेजी',
			'language.direction' => 'भाषा दिशा',
			'language.selectLanguage' => 'भाषा चुनें',
			'language.comingSoonBadge' => 'जल्द आ रहा है...',
			'language.english' => 'अंग्रेजी',
			'language.french' => 'फ्रेंच',
			'language.japanese' => 'जापानी',
			'language.spanish' => 'स्पेनिश',
			'language.russian' => 'रूसी',
			'setup.goalTitle' => 'आपका लक्ष्य क्या है?',
			'setup.goalCareer' => 'करियर विकास',
			'setup.goalTravel' => 'यात्रा',
			'setup.goalLiving' => 'विदेश में रहना',
			'setup.goalStudying' => 'विदेश में अध्ययन',
			'setup.goalOther' => 'अन्य',
			'setup.levelTitle' => 'आपका वर्तमान भाषा स्तर क्या है?',
			'setup.paceTitle' => 'आप कितनी तेजी से सुधारना चाहते हैं?',
			'setup.explanationTitle' => 'जब आप अपनी भाषा में सवाल पूछें, तो हम कैसे समझाएँ?',
			'setup.explanationHint' => 'आप इसे कभी भी प्रोफ़ाइल सेटिंग्स में बदल सकते हैं।',
			'setup.explanationNative' => 'मेरी मातृभाषा में समझाएँ',
			'setup.explanationEnglish' => 'अंग्रेजी में समझाएँ',
			'setup.levelA1' => 'A1 — मैं कुछ शब्द जानता हूँ',
			'setup.levelA2' => 'A2 — मैं सरल वाक्यांश उपयोग कर सकता हूँ',
			'setup.levelB1' => 'B1 — मैं रोज़मर्रा की बातचीत कर सकता हूँ',
			'setup.levelB2' => 'B2 — परिचित विषयों पर धाराप्रवाह बात कर सकता हूँ',
			'setup.levelC1' => 'C1 — उन्नत, सुधार चाहता हूँ',
			'setup.levelC2' => 'C2 — लगभग मातृभाषा स्तर',
			'setup.paceMin5' => '5 मिनट/दिन',
			'setup.paceMin10' => '10 मिनट/दिन',
			'setup.paceMin15' => '15 मिनट/दिन',
			'setup.paceMin30' => '30 मिनट/दिन',
			'setup.paceMin60' => '60 मिनट/दिन',
			'accountCreating.title' => 'आपका व्यक्तिगत खाता बनाया जा रहा है',
			'accountCreating.stepContent' => 'सामग्री बनाई जा रही है',
			'accountCreating.stepDialogues' => 'संवाद तैयार किए जा रहे हैं',
			'accountCreating.stepLessons' => 'पाठों का अनुकूलन किया जा रहा है',
			'accountCreating.stepPlan' => 'आपकी योजना अंतिम रूप दी जा रही है',
			'accountCreating.optimization' => 'अनुकूलन',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
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
			'planReady.paceMin5' => '5 मिनट/दिन',
			'planReady.paceMin10' => '10 मिनट/दिन',
			'planReady.paceMin15' => '15 मिनट/दिन',
			'planReady.paceMin30' => '30 मिनट/दिन',
			'planReady.paceMin60' => '60 मिनट/दिन',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'पाठ 1: अभिवादन',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'एक संदेश टाइप करें...',
			'previewChat.incoming1' => 'नमस्ते! Lingola में आपका स्वागत है — मैं आपका AI ट्यूटर हूँ। आपका स्तर जो भी हो, यहाँ आप सुरक्षित महसूस करेंगे और अंग्रेजी सीखेंगे। अंग्रेजी में नमस्ते के लिए \'Hi\' या \'Hello\' कहते हैं — कोशिश करें: मुझे अंग्रेजी में \'Hi!\' लिखें!',
			'previewChat.outgoing1' => 'नमस्ते! मैं अभ्यास करने के लिए तैयार हूँ।',
			'previewChat.incoming2Highlight' => 'गुड़ मॉर्निंग',
			'previewChat.incoming2Rest' => ', Emrah! मुझे खुशी है कि आप तैयार महसूस कर रहे हैं। सुबह की कॉफी हमेशा एक संबंध बनाने की शानदार शुरुआत होती है। आप किस बारे में बात करना चाहेंगे?',
			'previewChat.holdToSpeak' => 'बोलने के लिए दबाए रखें',
			'previewChat.recording' => 'रिकॉर्डिंग… भेजने के लिए छोड़ें',
			'previewChat.slideUpToLock' => 'लॉक करने के लिए ऊपर स्वाइप करें',
			'previewChat.slideLeftToCancel' => 'रद्द करने के लिए बाएँ स्वाइप करें',
			'previewChat.recordingLockedHint' => 'हो जाने पर भेजें टैप करें',
			'paywall.title' => 'आज बोलना शुरू करें — मुफ्त',
			'paywall.subtitle' => 'असीमित सीखने के अवसर',
			'paywall.noCommitment' => 'कोई प्रतिबद्धता नहीं',
			'paywall.cancelAnytime' => 'कभी भी रद्द करें',
			'paywall.noPaymentToday' => 'आज कोई भुगतान नहीं',
			'paywall.daysFree' => '3 दिन मुफ्त',
			'paywall.thenPrice' => 'फिर \$1.99/महीना',
			'paywall.trialActive' => 'मुफ्त परीक्षण सक्रिय',
			'paywall.payableToday' => 'आज भुगतान करने योग्य',
			'paywall.payableValue' => '3 दिन मुफ्त 0.00\$',
			'paywall.paymentDate' => 'भुगतान की तारीख: 13 मार्च 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'हमारे विविध AI प्रशिक्षक',
			'auth.title' => 'आज एक नई भाषा बोलना शुरू करें',
			'auth.body' => 'AI के साथ असली बातचीत का अभ्यास करें।\nकोई दबाव नहीं। कोई न्याय नहीं।',
			'auth.continueGoogle' => 'Google के साथ जारी रखें',
			'auth.continueApple' => 'Apple के साथ जारी रखें',
			'auth.continueGuest' => 'अतिथि के रूप में जारी रखें',
			'auth.or' => 'या',
			'auth.alreadyHaveAccount' => 'क्या आपके पास पहले से खाता है?',
			'auth.signIn' => 'साइन इन करें',
			'auth.legal' => 'Lingola के लिए साइन अप करके, आप हमारी सेवा की शर्तें स्वीकार करते हैं। जानें कि हम आपके डेटा को गोपनीयता नीति और कुकी नीति में कैसे प्रोसेस करते हैं',
			'auth.terms' => 'सेवा की शर्तें',
			'auth.privacy' => 'गोपनीयता नीति',
			'auth.cookies' => 'कुकी नीति',
			'nav.home' => 'होम',
			'nav.tutor' => 'ट्यूटर',
			'nav.lesson' => 'पाठ',
			'nav.rolePlay' => 'भूमिका निभाना',
			'nav.profile' => 'प्रोफ़ाइल',
			'home.streakCount' => '2',
			'home.greeting' => 'सुप्रभात, Jhon',
			'home.todayPractice' => 'आज की प्रैक्टिस',
			'home.continueConversation' => 'बातचीत जारी रखें',
			'home.continueWithTutor' => ({required Object name}) => '${name} के साथ जारी रखें या दूसरा ट्यूटर चुनें?',
			'home.continueSameTutor' => ({required Object name}) => '${name} के साथ जारी रखें',
			'home.chooseOtherTutor' => 'दूसरा ट्यूटर चुनें',
			'home.minutesLeft' => ({required Object value}) => '${value} मिनट बाकी',
			'home.lessonProgress' => 'पाठ 2 — अभिवादन',
			'home.timeCurrent' => '0मिनट',
			'home.timeTotal' => '/ 15मिनट',
			'home.kContinue' => 'जारी रखें',
			'home.learningPath' => 'A1 - प्रारंभिक',
			'home.allLessons' => 'सभी पाठ',
			'home.introductions' => 'परिचय I',
			'home.greetings' => 'अभिवादन',
			'home.jobs' => 'नौकरियाँ',
			'home.favoriteRoom' => 'एक पसंदीदा कमरा',
			'home.dailyRoutine' => 'दैनिक दिनचर्या',
			'home.scroll' => 'स्क्रॉल करें',
			'home.liveLesson' => 'लाइव पाठ',
			'home.liveLessonSubtitle' => 'हमारे ट्यूटर के साथ वीडियो कॉल करें',
			'home.moreTutor' => 'और ट्यूटर',
			'home.startTalkNow' => 'अब बात करना शुरू करें',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'अनुकूलनशील',
			'home.tagCalm' => 'शांत',
			'home.tagPatient' => 'धैर्यवान',
			'home.tagMethodical' => 'पद्धतिगत',
			'home.tagEncouraging' => 'प्रोत्साहक',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'और सुविधाएँ',
			'home.practiceLabel' => 'प्रैक्टिस',
			'home.wordPractice' => 'शब्द प्रैक्टिस',
			'home.wordPracticeBody' => 'अपनी चुनी हुई भाषा में रोज़ाना अपने शब्दावली का निर्माण करें',
			'home.immersiveLabel' => 'इमर्सिव',
			'home.quiz' => 'क्विज़',
			'home.quizBodyLine1' => 'वास्तविक के माध्यम से सीखें',
			'home.quizBodyLine2' => 'संदर्भ में उदाहरण',
			'home.getStarted' => 'शुरू करें',
			'home.library' => 'पुस्तकालय',
			'home.libraryTitle' => 'सीखें और बचाएं',
			'home.learnMore' => 'और जानें',
			'home.premium.titleBefore' => 'बोलने के लिए ',
			'home.premium.titleHighlight' => 'धाराप्रवाह',
			'home.premium.titleAfter' => ' बिना गलतियाँ करने के डर के।',
			'home.premium.descriptionBefore' => 'दुनिया भर के लाखों छात्रों में शामिल हों। आज ही भाषा की बाधा तोड़ना शुरू करें — ',
			'home.premium.descriptionHighlight' => 'पहले 3 दिन पूरी तरह से मुफ्त।',
			'home.premium.feature1' => '24/7 उपलब्ध AI ट्यूटर',
			'home.premium.feature2' => 'निजी ट्यूटर्स तक असीमित पहुँच',
			'home.premium.feature3' => 'आपके लिए तैयार किया गया दैनिक पाठ योजना',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/माह',
			'home.premium.discount' => 'वार्षिक खरीद पर 40% छूट',
			'home.premium.cta' => 'शुरू करें',
			'libraryPage.title' => 'पुस्तकालय',
			'libraryPage.searchWord' => 'शब्द खोजें',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} सहेजे गए शब्द',
			'libraryPage.savedWordTab' => 'सहेजे गए शब्द',
			'libraryPage.dictionaryTab' => 'शब्दकोश',
			'libraryPage.dictionaryLabel' => 'शब्दकोश',
			'wordPracticePage.title' => 'शब्द अभ्यास',
			'wordPracticePage.turkish' => 'तुर्की',
			'wordPracticePage.save' => 'सहेजें',
			'wordPracticePage.saved' => 'सहेजा गया',
			'wordPracticePage.listen' => 'सुनें',
			'wordPracticePage.hint' => 'संकेत',
			'wordPracticePage.previous' => 'पिछला',
			'wordPracticePage.next' => 'अगला',
			'quizPage.title' => 'क्विज़',
			'quizPage.headline' => 'आप आज क्या सुधारना चाहते हैं?',
			'quizPage.subtitle' => 'अपनी ट्रेनिंग चुनें — 3 मिनट से कम समय लगेगा 🚀',
			'quizPage.readingTitle' => 'पढ़ाई',
			'quizPage.readingBody' => 'लेखों और कहानियों के माध्यम से समझ',
			'quizPage.writingTitle' => 'लेखन',
			'quizPage.writingBody' => 'व्याकरण और शब्दावली के अभ्यास',
			'quizPage.speakingTitle' => 'बोलना',
			'quizPage.speakingBody' => 'AI स्पीच इंजन के माध्यम से उच्चारण',
			'quizPage.readingTestTitle' => 'पढ़ाई परीक्षण',
			'quizPage.read' => 'पढ़ें',
			'quizPage.listeningHint' => 'अंग्रेज़ी शब्द को स्पष्ट रूप से बोलें...',
			'quizPage.micPermissionDenied' => 'माइक्रोफ़ोन या स्पीच रिकग्निशन उपलब्ध नहीं है।',
			'quizPage.matchSuccess' => 'शानदार! यह शब्द से मेल खाता है।',
			'quizPage.matchFail' => ({required Object heard}) => 'सुना "${heard}"। फिर से कोशिश करें।',
			'quizPage.successfulTitle' => 'सफल!',
			'quizPage.successfulBody' => 'एक मूल वक्ता की तरह उच्चारण!',
			'quizPage.failedTitle' => 'असफल',
			'quizPage.failedBody' => 'यह लगभग हो रहा था, एक और मौका दें',
			'quizPage.tryAgain' => 'फिर से कोशिश करें',
			'quizPage.writingTestTitle' => 'लेखन परीक्षण',
			'quizPage.sourceLanguage' => 'स्रोत भाषा',
			'quizPage.answer' => 'उत्तर',
			'quizPage.writeAnswerHint' => 'यहाँ अपना उत्तर लिखें...',
			'quizPage.submit' => 'जमा करें',
			'quizPage.speakingTestTitle' => 'बोलने का परीक्षण',
			'quizPage.speakingProficiency' => 'बोलने की दक्षता',
			'quizPage.speakClearlyHint' => 'अपने माइक्रोफ़ोन में स्पष्ट रूप से बोलें:',
			'quizPage.speakUp' => 'जोर से बोलें',
			'quizPage.recording' => 'रिकॉर्डिंग...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'प्रश्न ${current}/${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} आ रहा है',
			'placeholder.body' => ({required Object tab}) => 'हम आपके लिए एक केंद्रित ${tab} अनुभव तैयार कर रहे हैं।',
			'tutorPage.title' => 'ट्यूटर',
			'tutorPage.chatWithLingola' => 'Lingola के साथ चैट करें',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => '${name} के साथ चैट करें',
			'tutorPage.chatHistory' => 'चैट इतिहास',
			'tutorPage.history' => 'इतिहास',
			'tutorPage.filter' => 'फिल्टर',
			'tutorPage.country' => 'देश',
			'tutorPage.focus' => 'फोकस',
			'tutorPage.moreCountries' => '8+ और',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'सहेजें',
			'tutorPage.clearFilter' => 'फ़िल्टर हटाएँ',
			'tutorPage.startTalkNow' => 'अब बात शुरू करें',
			'tutorPage.typeMessage' => 'एक संदेश टाइप करें...',
			'tutorPage.speaker' => 'स्पीकर',
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
			'tutorPage.tutors.santa' => 'सांता क्लॉज',
			'tutorPage.tags.adaptive' => 'अनुकूलनशील',
			'tutorPage.tags.calm' => 'शांत',
			'tutorPage.tags.patient' => 'धैर्यवान',
			'tutorPage.tags.organized' => 'व्यवस्थित',
			'tutorPage.tags.relaxed' => 'आरामदायक',
			'tutorPage.tags.methodical' => 'पद्धतिगत',
			'tutorPage.tags.attentive' => 'ध्यान देने वाला',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'जिज्ञासु',
			'tutorPage.tags.observer' => 'पर्यवेक्षक',
			'tutorPage.tags.ancientKnowledge' => 'प्राचीन ज्ञान',
			'tutorPage.tags.wise' => 'बुद्धिमान',
			'tutorPage.tags.clear' => 'स्पष्ट',
			'tutorPage.tags.decisive' => 'निर्णायक',
			'tutorPage.tags.disciplined' => 'अनुशासित',
			'tutorPage.tags.smart' => 'स्मार्ट',
			'tutorPage.tags.analytic' => 'विश्लेषणात्मक',
			'tutorPage.tags.cheerful' => 'खुशमिजाज',
			'tutorPage.tags.generous' => 'उदार',
			'tutorPage.historyPreview1' => 'हे! मैं बोरियत से फटने ही वाला था...',
			'tutorPage.historyPreview2' => 'क्या हम आज खाना ऑर्डर करने का अभ्यास करें?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'कल',
			'tutorPage.chat.incoming1' => 'गुड मॉर्निंग! मुझे खुशी है कि आप आज अभ्यास के लिए तैयार महसूस कर रहे हैं।',
			'tutorPage.chat.outgoing1' => 'हाँ, चलो अभिवादन से शुरू करते हैं।',
			'tutorPage.chat.incoming2' => 'परफेक्ट। आप एक सहयोगी को कैसे नमस्ते कहेंगे?',
			'tutorPage.chat.typing' => 'टाइप कर रहे हैं',
			'tutorPage.calling.lessonBadge' => 'पाठ 1 : अभिवादन',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'पाठ ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'क्या तुम बोर हो गए?',
			'tutorPage.calling.englishLine' => 'बोर? मैंने अपने शब्दकोश से वह शब्द हटा दिया। उठो, योजना पहले से तय है: हम कादिकॉय में उस नए आर्केड बार में जा रहे हैं।',
			'tutorPage.calling.highlight' => 'बोर?',
			'tutorPage.calling.close' => 'कॉल समाप्त करें',
			'tutorPage.calling.toggleCaptions' => 'कैप्शन टॉगल करें',
			'tutorPage.calling.toggleHints' => 'संकेत टॉगल करें',
			'tutorPage.calling.toggleMic' => 'माइक्रोफोन टॉगल करें',
			'tutorPage.calling.tapToSpeakHint' => 'बोलने के लिए टैप करें, समाप्त करने के लिए फिर टैप करें',
			'lessonPage.title' => 'सीखना जारी रखें',
			'lessonPage.profile' => 'प्रोफ़ाइल',
			'lessonPage.language' => 'लक्षित भाषा',
			'lessonPage.completed' => 'पूर्ण',
			'lessonPage.locked' => 'लॉक किया गया',
			'lessonPage.pickTutorTitle' => 'अपने ट्यूटर का चयन करें',
			'lessonPage.startTalk' => 'पाठ शुरू करें',
			'lessonPage.chatInstead' => 'इसके बजाय चैट करें',
			'lessonPage.lockedHint' => 'इस पाठ को अनलॉक करने के लिए पिछले पाठ को पूरा करें।',
			'lessonPage.levelLockedTitle' => 'लेवल लॉक',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'आपका अंग्रेज़ी स्तर ${userLevel} है, इसलिए पहले का पथ पूरा किए बिना ${lessonLevel} पाठ नहीं खोल सकते।',
			'lessonPage.levelLockedOk' => 'समझ गया',
			'lessonPage.notesTitle' => 'पाठ नोट्स',
			'lessonPage.whatWeLearned' => 'आज हमने क्या सीखा',
			'lessonPage.deleteNotes' => 'मेरे पाठ नोट्स हटाएं',
			'lessonPage.deleteNotesConfirm' => 'क्या आप इन नोट्स को हटाना चाहते हैं? इसे पूर्ववत नहीं किया जा सकता।',
			'lessonPage.delete' => 'हटाएं',
			'lessonPage.cancel' => 'रद्द करें',
			'lessonPage.practiceCta' => 'अगर यह बहुत कठिन लगा, तो आप उसी विषय का अभ्यास फिर से कर सकते हैं।',
			'lessonPage.practiceNow' => 'इस विषय का अभ्यास करें',
			'lessonPage.openChat' => 'ट्यूटर के साथ चैट खोलें',
			'lessonPage.yourScore' => 'आपका स्कोर',
			'lessonPage.bestScore' => ({required Object score}) => 'सर्वश्रेष्ठ ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'निष्क्रिय प्रतिभागी',
			'lessonPage.participationSilentBody' => 'आप इस बार चुप रहे। मुझे लगता है कि आपको यह पाठ फिर से लेना चाहिए।',
			'lessonPage.participationPassive' => 'कम भागीदारी',
			'lessonPage.participationPassiveBody' => 'आपने मुश्किल से बात की। पाठ को फिर से आजमाएं और अधिक कहें।',
			'lessonPage.participationActive' => 'अच्छी भागीदारी',
			'lessonPage.participationActiveBody' => 'आपने बातचीत में भाग लिया। ऐसे ही जारी रखें!',
			'lessonPage.participationStrong' => 'मजबूत भागीदारी',
			'lessonPage.participationStrongBody' => 'आपने बहुत बात की। शानदार काम!',
			'lessonPage.retakeLesson' => 'इस पाठ को फिर से लें',
			'lessonPage.finishLesson' => 'पाठ पूरा करें',
			'lessonPage.savingNotes' => 'आपका ट्यूटर आज के नोट्स लिख रहा है...',
			'lessonPage.noNotes' => 'अपने ट्यूटर से नोट्स प्राप्त करने के लिए इस पाठ को पूरा करें।',
			'lessonPage.notesDeleted' => 'पाठ नोट्स हटा दिए गए',
			'lessonPage.levels.a1.title' => 'A1 - शुरुआत',
			'lessonPage.levels.a1.lessons.0' => 'नमस्ते',
			'lessonPage.levels.a1.lessons.1' => 'परिचय I',
			'lessonPage.levels.a1.lessons.2' => 'नौकरियां',
			'lessonPage.levels.a1.lessons.3' => 'एक पसंदीदा कमरा',
			'lessonPage.levels.a1.lessons.4' => 'दैनिक दिनचर्या',
			'lessonPage.levels.a1.lessons.5' => 'फल',
			'lessonPage.levels.a1.lessons.6' => 'सलाह 1',
			'lessonPage.levels.a1.lessons.7' => 'परिवार 1',
			'lessonPage.levels.a1.lessons.8' => 'रोज़मर्रा की चीज़ें',
			'lessonPage.levels.a1.lessons.9' => 'गृहनगर',
			'lessonPage.levels.a1.lessons.10' => 'घर',
			'lessonPage.levels.a1.lessons.11' => 'खाने की पसंद',
			'lessonPage.levels.a1.lessons.12' => 'शौक 1',
			'lessonPage.levels.a1.lessons.13' => 'सफल लोग',
			'lessonPage.levels.a1.lessons.14' => 'खाना और पेय',
			'lessonPage.levels.a1.lessons.15' => 'रेस्टोरेंट में ऑर्डर करना',
			'lessonPage.levels.a1.lessons.16' => 'पालतू जानवर',
			'lessonPage.levels.a1.lessons.17' => 'स्वास्थ्य और फिटनेस',
			'lessonPage.levels.a1.lessons.18' => 'मौसम',
			'lessonPage.levels.a1.lessons.19' => 'नई जीवनशैली',
			'lessonPage.levels.a1.lessons.20' => 'बेहतर होना',
			'lessonPage.levels.a1.lessons.21' => 'शौक 2',
			'lessonPage.levels.a1.lessons.22' => 'जगहों के बारे में सवाल',
			'lessonPage.levels.a1.lessons.23' => 'स्वामित्व',
			'lessonPage.levels.a1.lessons.24' => 'खरीदारी 1',
			'lessonPage.levels.a1.lessons.25' => 'समय बताना',
			'lessonPage.levels.a1.lessons.26' => 'दिशाएं 1',
			'lessonPage.levels.a1.lessons.27' => 'खरीदारी 2',
			'lessonPage.levels.a1.lessons.28' => 'आपको जानना',
			'lessonPage.levels.a1.lessons.29' => 'वस्तुओं के स्थान',
			'lessonPage.levels.a1.lessons.30' => 'दिखावट',
			'lessonPage.levels.a1.lessons.31' => 'दिशाएं 2',
			'lessonPage.levels.a2.title' => 'A2 - बुनियादी',
			'lessonPage.levels.a2.lessons.0' => 'परिवार 2',
			'lessonPage.levels.a2.lessons.1' => 'लोग और स्थान',
			'lessonPage.levels.a2.lessons.2' => 'परिवार 3',
			'lessonPage.levels.a2.lessons.3' => 'वस्तुओं का वर्णन',
			'lessonPage.levels.a2.lessons.4' => 'शहर',
			'lessonPage.levels.a2.lessons.5' => 'निर्माण परियोजना',
			'lessonPage.levels.a2.lessons.6' => 'घर sweet घर',
			'lessonPage.levels.a2.lessons.7' => 'कितने बजे हैं',
			'lessonPage.levels.a2.lessons.8' => 'दैनिक दिनचर्या 2',
			'lessonPage.levels.a2.lessons.9' => 'फुर्सत का समय',
			'lessonPage.levels.a2.lessons.10' => 'खाना और पोषण',
			'lessonPage.levels.a2.lessons.11' => 'खरीदारी और उपभोक्ता',
			'lessonPage.levels.a2.lessons.12' => 'छुट्टियाँ',
			'lessonPage.levels.a2.lessons.13' => 'वीकेंड की योजनाएँ',
			'lessonPage.levels.a2.lessons.14' => 'औपचारिक या अनौपचारिक',
			'lessonPage.levels.a2.lessons.15' => 'फैशन',
			'lessonPage.levels.a2.lessons.16' => 'खरीदारी 3',
			'lessonPage.levels.a2.lessons.17' => 'सलाह 2',
			'lessonPage.levels.a2.lessons.18' => 'आप कर सकते हैं',
			'lessonPage.levels.a2.lessons.19' => 'खरीदारी 4',
			'lessonPage.levels.a2.lessons.20' => 'छोटी बातें',
			'lessonPage.levels.a2.lessons.21' => 'एक लट्टे, कृपया',
			'lessonPage.levels.a2.lessons.22' => 'खाना',
			'lessonPage.levels.a2.lessons.23' => 'घूमना',
			'lessonPage.levels.a2.lessons.24' => 'यात्रा के लिए तैयार',
			'lessonPage.levels.a2.lessons.25' => 'यात्रा 1',
			'lessonPage.levels.a2.lessons.26' => 'शहरी पलायन',
			'lessonPage.levels.a2.lessons.27' => 'यात्रा 2',
			'lessonPage.levels.a2.lessons.28' => 'रुकने के लिए जगह',
			'lessonPage.levels.a2.lessons.29' => 'बहुत रोमांचक',
			'lessonPage.levels.a2.lessons.30' => 'सही व्यक्ति',
			'lessonPage.levels.a2.lessons.31' => 'स्कूल',
			'lessonPage.levels.a2.lessons.32' => 'संगीत प्राथमिकताएँ',
			'lessonPage.levels.a2.lessons.33' => 'खेल',
			'lessonPage.levels.a2.lessons.34' => 'दौड़ के नियम',
			'lessonPage.levels.a2.lessons.35' => 'संदेश छोड़ें',
			'lessonPage.levels.a2.lessons.36' => 'अनुरोध',
			'lessonPage.levels.a2.lessons.37' => 'निमंत्रण',
			'lessonPage.levels.a2.lessons.38' => 'यात्रा के अनुभव',
			'lessonPage.levels.a2.lessons.39' => 'भूतकाल 1',
			'lessonPage.levels.a2.lessons.40' => 'भूतकाल 2',
			'lessonPage.levels.a2.lessons.41' => 'भूतकाल 3',
			'lessonPage.levels.a2.lessons.42' => 'भूतकाल के बारे में प्रश्न',
			'lessonPage.levels.a2.lessons.43' => 'आप कभी भी बहुत बड़े नहीं होते',
			'lessonPage.levels.a2.lessons.44' => 'बचपन की यादें',
			'lessonPage.levels.a2.lessons.45' => 'सराहना',
			'lessonPage.levels.a2.lessons.46' => 'बहाने',
			'lessonPage.levels.a2.lessons.47' => 'यह बहुत परेशान करने वाला है!',
			'lessonPage.levels.a2.lessons.48' => 'एक डिजिटल दुनिया',
			'lessonPage.levels.a2.lessons.49' => 'काम का जीवन',
			'lessonPage.levels.a2.lessons.50' => 'मुझे समझ नहीं आया',
			'lessonPage.levels.a2.lessons.51' => 'बचाना या खर्च करना?',
			'lessonPage.levels.a2.lessons.52' => 'माफ करना कहें',
			'lessonPage.levels.b1.title' => 'B1 - मध्यवर्ती',
			'lessonPage.levels.b1.lessons.0' => 'संस्कृतिक परंपराएँ',
			'lessonPage.levels.b1.lessons.1' => 'सेलिब्रिटीज',
			'lessonPage.levels.b1.lessons.2' => 'कला और रचनात्मकता',
			'lessonPage.levels.b1.lessons.3' => 'भविष्य की योजनाएँ',
			'lessonPage.levels.b1.lessons.4' => 'इवेंट की योजना बनाना',
			'lessonPage.levels.b1.lessons.5' => 'लक्ष्य और योजनाएँ',
			'lessonPage.levels.b1.lessons.6' => 'ऐतिहासिक घटनाएँ',
			'lessonPage.levels.b1.lessons.7' => 'प्रौद्योगिकी',
			'lessonPage.levels.b1.lessons.8' => 'कभी नहीं',
			'lessonPage.levels.b1.lessons.9' => 'क्या चल रहा है',
			'lessonPage.levels.b1.lessons.10' => 'सपनों की छुट्टी',
			'lessonPage.levels.b1.lessons.11' => 'सोशल मीडिया',
			'lessonPage.levels.b1.lessons.12' => 'पुस्तक अनुशंसाएँ',
			'lessonPage.levels.b1.lessons.13' => 'ऐसे ही एक दिन',
			'lessonPage.levels.b1.lessons.14' => 'विशेष तस्वीरें',
			'lessonPage.levels.b1.lessons.15' => 'व्यक्तिगत उपलब्धियाँ',
			'lessonPage.levels.b1.lessons.16' => 'पसंदीदा फिल्में',
			'lessonPage.levels.b1.lessons.17' => 'समाचार फ्लैश',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.b1.lessons.18' => 'खुशी',
			'lessonPage.levels.b1.lessons.19' => 'एक व्यस्त सप्ताह',
			'lessonPage.levels.b1.lessons.20' => 'जहाँ मैं बड़ा हुआ',
			'lessonPage.levels.b1.lessons.21' => 'स्कूल के दिन',
			'lessonPage.levels.b1.lessons.22' => 'प्रोफाइल',
			'lessonPage.levels.b1.lessons.23' => 'जीवन मानचित्र',
			'lessonPage.levels.b1.lessons.24' => 'हर दिन',
			'lessonPage.levels.b1.lessons.25' => 'अगला क्या है',
			'lessonPage.levels.b1.lessons.26' => 'सुझाव बनाना',
			'lessonPage.levels.b1.lessons.27' => 'क्या हुआ',
			'lessonPage.levels.b1.lessons.28' => 'यादें',
			'lessonPage.levels.b1.lessons.29' => 'संस्कृति का झटका',
			'lessonPage.levels.b1.lessons.30' => 'रुचि वाक्यांश',
			'lessonPage.levels.b1.lessons.31' => 'नौकरी के साक्षात्कार',
			'lessonPage.levels.b1.lessons.32' => 'बकेट लिस्ट',
			'lessonPage.levels.b1.lessons.33' => 'मेरे तरह का शहर',
			'lessonPage.levels.b1.lessons.34' => 'इंटरनेट पीढ़ी',
			'lessonPage.levels.b1.lessons.35' => 'लोकप्रिय ब्रांड',
			'lessonPage.levels.b1.lessons.36' => 'राय वाक्यांश',
			'lessonPage.levels.b1.lessons.37' => 'यह कैसा दिखता है',
			'lessonPage.levels.b1.lessons.38' => 'जीवन स्थान',
			'lessonPage.levels.b1.lessons.39' => 'अच्छा खाना',
			'lessonPage.levels.b1.lessons.40' => 'असामान्य शौक',
			'lessonPage.levels.b1.lessons.41' => 'एक कठिन चुनाव',
			'lessonPage.levels.b1.lessons.42' => 'कार्रवाई करें',
			'lessonPage.levels.b1.lessons.43' => 'नई क्षमताएँ',
			'lessonPage.levels.b1.lessons.44' => 'शिकायत करना',
			'lessonPage.levels.b1.lessons.45' => 'शिक्षा',
			'lessonPage.levels.b1.lessons.46' => 'हरित शहर',
			'lessonPage.levels.b1.lessons.47' => 'नौकरी में क्या है',
			'lessonPage.levels.b1.lessons.48' => 'व्यक्तिगत चुनौतियाँ',
			'lessonPage.levels.b1.lessons.49' => 'साक्षात्कार वाक्यांश',
			'lessonPage.levels.b1.lessons.50' => 'शिष्टता के अंत',
			'lessonPage.levels.b1.lessons.51' => 'हेडलाइन समाचार',
			'lessonPage.levels.b1.lessons.52' => 'छोटे बदलाव',
			'lessonPage.levels.b1.lessons.53' => 'माफी के बहाने',
			'lessonPage.levels.b1.lessons.54' => 'फोन शिष्टाचार',
			'lessonPage.levels.b1.lessons.55' => 'बात काटने के लिए माफ करें...',
			'lessonPage.levels.b1.lessons.56' => 'शिकायत के जवाब',
			'lessonPage.levels.b2.title' => 'B2 - ऊपरी मध्यवर्ती',
			'lessonPage.levels.b2.lessons.0' => 'व्यक्तित्व',
			'lessonPage.levels.b2.lessons.1' => 'महान लीड',
			'lessonPage.levels.b2.lessons.2' => 'स्वस्थ जीवनशैली',
			'lessonPage.levels.b2.lessons.3' => 'सच्चाई क्या है?',
			'lessonPage.levels.b2.lessons.4' => 'व्यक्तिगत विकास',
			'lessonPage.levels.b2.lessons.5' => 'बोलकर बताना',
			'lessonPage.levels.b2.lessons.6' => 'अभिनय करना?',
			'lessonPage.levels.b2.lessons.7' => 'मुझे याद है...',
			'lessonPage.levels.b2.lessons.8' => 'सामाजिक फीडबैक',
			'lessonPage.levels.b2.lessons.9' => 'अपराध स्थल',
			'lessonPage.levels.b2.lessons.10' => 'शिष्टता की परेशानी',
			'lessonPage.levels.b2.lessons.11' => 'संघर्ष समाधान',
			'lessonPage.levels.b2.lessons.12' => 'इसे पसंद करें या नफरत करें?',
			'lessonPage.levels.b2.lessons.13' => 'पर्यावरणीय मुद्दे',
			'lessonPage.levels.b2.lessons.14' => 'हम इसे सुलझा सकते हैं',
			'lessonPage.levels.b2.lessons.15' => 'रहस्य और अपराध',
			'lessonPage.levels.b2.lessons.16' => 'संभावित भविष्य',
			'lessonPage.levels.b2.lessons.17' => 'व्यापार योजनाएँ',
			'lessonPage.levels.b2.lessons.18' => 'बैठक के निर्णय',
			'lessonPage.levels.b2.lessons.19' => 'यह इतना पूर्वानुमानित है...',
			'lessonPage.levels.b2.lessons.20' => 'काम पर',
			'lessonPage.levels.b2.lessons.21' => 'विज्ञान और प्रौद्योगिकी',
			'lessonPage.levels.b2.lessons.22' => 'समय प्रबंधन',
			'lessonPage.levels.b2.lessons.23' => 'मानव अधिकार',
			'lessonPage.levels.c1.title' => 'C1 - उन्नत',
			'lessonPage.levels.c1.lessons.0' => 'संस्कृतिक मानदंड',
			'lessonPage.levels.c1.lessons.1' => 'सोशल मीडिया का प्रभाव',
			'lessonPage.levels.c1.lessons.2' => 'करियर के विकल्प',
			'lessonPage.levels.c1.lessons.3' => 'प्रदर्शन को तेज करें',
			'lessonPage.levels.c1.lessons.4' => 'आविष्कार',
			'lessonPage.levels.c1.lessons.5' => 'समय यात्रा',
			'lessonPage.levels.c1.lessons.6' => 'संपत्ति',
			'lessonPage.levels.c1.lessons.7' => 'नौकरी के कौशल',
			'lessonPage.levels.c1.lessons.8' => 'ऐतिहासिक परिवर्तन',
			'lessonPage.levels.c1.lessons.9' => 'समीक्षा लेखन',
			'lessonPage.levels.c1.lessons.10' => 'रहस्य',
			'lessonPage.levels.c1.lessons.11' => 'अजीब सिद्धांत',
			'lessonPage.levels.c1.lessons.12' => 'सेलिब्रिटी',
			'lessonPage.levels.c1.lessons.13' => 'वैश्विक राजनीति',
			'lessonPage.levels.c1.lessons.14' => 'उत्पाद बूम',
			'lessonPage.levels.c1.lessons.15' => 'क्या खुश होंगे?',
			'lessonPage.levels.c1.lessons.16' => 'शायद बाद में...',
			'lessonPage.levels.c1.lessons.17' => 'नए समाधान',
			'lessonPage.levels.c1.lessons.18' => 'संदर्भात्मक प्रभाव',
			'lessonPage.levels.c1.lessons.19' => 'एक खोया हुआ लोगो',
			'lessonPage.levels.c1.lessons.20' => 'दयालु कार्य',
			'lessonPage.levels.c1.lessons.21' => 'क्या फिल्म है',
			'lessonPage.levels.c1.lessons.22' => 'कितना परेशान करने वाला',
			'lessonPage.levels.c1.lessons.23' => 'समाचार में',
			'lessonPage.levels.c2.title' => 'C2 - विशेषज्ञ',
			'lessonPage.levels.c2.lessons.0' => 'वैश्वीकरण',
			'lessonPage.levels.c2.lessons.1' => 'प्राकृतिक आपदाएँ',
			'lessonPage.levels.c2.lessons.2' => 'जानकारी पर प्रतिक्रिया',
			'lessonPage.levels.c2.lessons.3' => 'काम-जीवन संतुलन',
			'lessonPage.levels.c2.lessons.4' => 'दूरस्थ कार्य',
			'lessonPage.levels.c2.lessons.5' => 'परिवार के मुद्दे',
			'lessonPage.levels.c2.lessons.6' => 'बुनियादी मानव शारीरिक रचना',
			'lessonPage.levels.c2.lessons.7' => 'स्वास्थ्य पूर्वानुमान',
			'lessonPage.levels.c2.lessons.8' => 'स्वास्थ्य सेवा की पहुंच',
			'lessonPage.levels.c2.lessons.9' => 'वैश्विक यात्रा अनुभव',
			'lessonPage.levels.c2.lessons.10' => 'सुपरपावर',
			'lessonPage.levels.c2.lessons.11' => 'टीम निर्माण',
			'lessonPage.levels.c2.lessons.12' => 'जैवफ्लोरेसेंस',
			'lessonPage.levels.c2.lessons.13' => 'दुविधाएँ',
			'lessonPage.levels.c2.lessons.14' => 'सामाजिक उत्साह',
			'lessonPage.levels.c2.lessons.15' => 'परिवर्तन',
			'lessonPage.levels.c2.lessons.16' => 'काम, काम, काम',
			'lessonPage.levels.c2.lessons.17' => 'स्थानीय मुद्दे',
			'lessonPage.levels.c2.lessons.18' => 'समस्याएँ, समस्याएँ',
			'lessonPage.levels.c2.lessons.19' => 'सत्य या कल्पना?',
			'lessonPage.levels.c2.lessons.20' => 'पर्यटन',
			'lessonPage.levels.c2.lessons.21' => 'स्वयंसेवा',
			'lessonPage.levels.c2.lessons.22' => 'मन की आंख',
			'lessonPage.levels.c2.lessons.23' => 'मीडिया खपत',
			'rolePlayPage.title' => 'भूमिका निभाना',
			'rolePlayPage.subtitle' => 'अपनी भूमिका चुनें — एक वास्तविक जीवन परिदृश्य का अनुभव करें 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} पूरा हुआ',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} मिनट',
			'rolePlayPage.beginner' => 'शुरुआती',
			'rolePlayPage.screenplay' => 'स्क्रीनप्ले',
			'rolePlayPage.dailyInteractions' => 'दैनिक इंटरैक्शन',
			'rolePlayPage.business' => 'व्यापार',
			'rolePlayPage.coffee.title' => 'कॉफी शॉप में ऑर्डर करना',
			'rolePlayPage.coffee.screenplay' => 'अपने पसंदीदा पेय का ऑर्डर दें, आकार और अतिरिक्त के बारे में पूछें, अपने कुल की पुष्टि करें, और काउंटर पर अपना कॉफी लें।',
			'rolePlayPage.coffee.chat.briefing' => 'नमस्ते! आज हम कॉफी शॉप में ऑर्डर करने का अभ्यास करेंगे — नमस्ते, आकार, अतिरिक्त। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे। ठीक है?',
			'rolePlayPage.coffee.chat.incoming1' => 'स्वागत है! आज मैं आपके लिए क्या शुरू कर सकता हूँ?',
			'rolePlayPage.coffee.chat.outgoing1' => 'नमस्ते! मुझे एक मीडियम लाटे चाहिए, कृपया।',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'बिल्कुल',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! क्या आप इसे गर्म या बर्फीला चाहेंगे, और कोई अतिरिक्त?',
			'rolePlayPage.coffee.chat.botReply' => 'शानदार चयन। क्या आपके ऑर्डर के साथ कुछ और चाहिए?',
			'rolePlayPage.directions.title' => 'सड़क पर दिशा पूछना',
			'rolePlayPage.directions.screenplay' => 'किसी स्थान के लिए दिशा पूछें, मेट्रो या बस तक कैसे पहुंचें, टिकटों के बारे में जानकारी प्राप्त करें, और रेस्तरां की सिफारिशें सुनें।',
			'rolePlayPage.directions.chat.briefing' => 'नमस्ते! आज हम सड़क पर दिशा पूछने का अभ्यास करेंगे। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे। ठीक है?',
			'rolePlayPage.directions.chat.incoming1' => 'नमस्ते! आप थोड़े खोए हुए लग रहे हैं — क्या आपको कुछ खोजने में मदद चाहिए?',
			'rolePlayPage.directions.chat.outgoing1' => 'हाँ, मैं निकटतम मेट्रो स्टेशन की तलाश कर रहा हूँ।',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'बिल्कुल',
			'rolePlayPage.directions.chat.incoming2Rest' => '! उस दिशा में दो ब्लॉक चलें, फिर बाएं मुड़ें। आपको प्रवेश द्वार दिखाई देगा।',
			'rolePlayPage.directions.chat.botReply' => 'आपका स्वागत है! क्या आप स्टेशन के पास एक रेस्तरां की टिप भी चाहते हैं?',
			'rolePlayPage.interview.title' => 'नौकरी का साक्षात्कार',
			'rolePlayPage.interview.screenplay' => 'अपने आप का परिचय दें, सामान्य साक्षात्कार प्रश्नों के उत्तर दें, अपने अनुभव के बारे में बात करें, और भूमिका और अगले कदमों के बारे में पूछें।',
			'rolePlayPage.interview.chat.briefing' => 'नमस्ते! आज हम नौकरी के साक्षात्कार का अभ्यास करेंगे। मैं पहले थोड़ा समझाऊंगा, फिर हम इसे निभाएंगे — मैं आपको साक्षात्कार दूंगा, फिर हम बदलेंगे। ठीक है?',
			'rolePlayPage.interview.chat.incoming1' => 'आज आने के लिए धन्यवाद। क्या आप संक्षेप में अपने बारे में बता सकते हैं?',
			'rolePlayPage.interview.chat.outgoing1' => 'बिल्कुल। मैं यहाँ होने और अपने अनुभव को साझा करने के लिए उत्साहित हूँ।',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'शानदार',
			'rolePlayPage.interview.chat.incoming2Rest' => '. मुझे एक हालिया परियोजना के बारे में बताएं जिस पर आपको गर्व है।',
			'rolePlayPage.interview.chat.botReply' => 'यह प्रभावशाली है। आपके पास भूमिका के बारे में क्या प्रश्न हैं?',
			'rolePlayPage.customScenarios' => 'Your scenarios',
			'rolePlayPage.createOwnScenario' => 'Create your\nown scenario!',
			'rolePlayPage.createOwnScenarioTitle' => 'Create your scenario',
			'rolePlayPage.creatingScenario' => 'Creating your role play',
			'rolePlayPage.creatingScenarioSubtitle' => 'Lingola is writing your scene and illustration...',
			'rolePlayPage.createFailed' => 'Could not create scenario. Please try again.',
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
			'rolePlayPage.intermediate' => 'Intermediate',
			'rolePlayPage.beginnerIntermediate' => 'Beginner–Intermediate',
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
			'rolePlayPage.deleteFailed' => 'सीन नहीं हटाया जा सका। कृपया फिर से कोशिश करें।',
			'notificationsPage.title' => 'सूचनाएँ',
			'notificationsPage.deleteConfirmTitle' => 'क्या आप सुनिश्चित हैं?',
			'notificationsPage.deleteConfirmBody' => 'यह सूचना हटा दी जाएगी।',
			'notificationsPage.delete' => 'हटाएँ',
			'notificationsPage.cancel' => 'रद्द करें',
			'notificationsPage.translation.title' => 'नई अनुवाद तैयार है',
			'notificationsPage.translation.body' => 'आपकी ऑडियो अनुवाद फ़ाइल को सफलतापूर्वक टेक्स्ट में परिवर्तित किया गया है और अनुवादित किया गया है।',
			'notificationsPage.offer.title' => 'आपके लिए एक विशेष प्रस्ताव है',
			'notificationsPage.offer.body' => '50% छूट पर अनलिमिटेड फोटो अनुवाद के लिए Premium में अपग्रेड करें।',
			'notificationsPage.stories.title' => 'नई कहानियाँ खोजें',
			'notificationsPage.stories.body' => 'कहानियों के माध्यम से नए शब्द सीखें',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'अभी तक कोई सूचना नहीं',
			'notificationsPage.emptySubtitle' => 'जब आपको सूचना मिले तो दोबारा जाँचना न भूलें।',
			'profilePage.title' => 'प्रोफ़ाइल',
			'profilePage.userName' => 'जॉन डो',
			'profilePage.freeVersion' => 'फ्री वर्ज़न',
			'profilePage.dayStreak' => 'डे स्ट्रीक!',
			'profilePage.accountSettings' => 'खाता सेटिंग्स',
			'profilePage.general' => 'सामान्य',
			'profilePage.profileSettings' => 'प्रोफ़ाइल सेटिंग्स',
			'profilePage.fullName' => 'पूरा नाम',
			'profilePage.email' => 'ई-मेल',
			'profilePage.deleteAccount' => 'खाता हटाएँ',
			'profilePage.save' => 'सहेजें',
			'profilePage.deleteTitle' => 'हम आपको नहीं जाना चाहते लेकिन हम आपको समझते हैं।',
			'profilePage.deleteBody' => 'क्या आप हमें बता सकते हैं कि आप Lingola का अनुभव क्यों छोड़ना चाहते हैं?',
			'profilePage.deleteReasons.aiCharacters' => 'मुझे एआई पात्र वास्तविकता में नहीं लगे।',
			'profilePage.deleteReasons.videoIssues' => 'वीडियो कॉल में तकनीकी समस्याएँ आ रही हैं।',
			'profilePage.deleteReasons.pricing' => 'सदस्यता की कीमतें मेरी अपेक्षाओं से अधिक हैं।',
			'profilePage.deleteReasons.noMatch' => 'मुझे मेरी पसंद के पात्र नहीं मिले।',
			'profilePage.deleteReasons.shortTrial' => 'मैंने केवल थोड़े समय के लिए कोशिश करना चाहा था।',
			'profilePage.deleteReasons.other' => 'अन्य',
			'profilePage.messageOptional' => 'संदेश (वैकल्पिक)',
			'profilePage.messageHint' => 'यदि आपके पास कोई संदेश है, तो कृपया लिखें।',
			'profilePage.next' => 'अगला',
			'profilePage.specialOfferTitle' => 'विशेष प्रस्ताव',
			'profilePage.specialOfferBody' => 'जाने से पहले आपके लिए तैयार किए गए प्रस्ताव पर एक नज़र डालें।',
			'profilePage.monthlyPlanTitle' => '1-महीने की योजना पर स्विच करें',
			'profilePage.monthlyPlanPrice' => '\$79/महीना, कभी भी रद्द करें',
			'profilePage.monthlyPlanDesc' => 'कोई दीर्घकालिक प्रतिबद्धता नहीं। महीने-दर-महीने हमारे समुदाय से जुड़े रहें।',
			'profilePage.whatYoullKeep' => 'आप क्या रखेंगे:',
			'profilePage.keepCharacters' => 'सभी पात्रों तक पहुँच',
			'profilePage.keepVideo' => 'असीमित वीडियो कॉल',
			'profilePage.keepCourses' => 'सभी पाठ्यक्रमों तक पहुँच',
			'profilePage.switchMonthlyCta' => 'मासिक योजना पर स्विच करें',
			'profilePage.confirmTitle' => 'क्या आप सुनिश्चित हैं?',
			'profilePage.confirmBody' => 'हम वास्तव में आपको जाते हुए नहीं देखना चाहते। यहाँ है जो आप खो देंगे:',
			'profilePage.loseCharacters' => 'असीमित पात्रों की पहुँच',
			'profilePage.loseVideo' => 'असीमित वीडियो कॉल की पहुँच',
			'profilePage.loseCourses' => 'सभी पाठ्यक्रमों की पहुँच',
			'profilePage.discountTitle' => 'रुकें और 1 महीने के लिए 60% छूट पाएं',
			'profilePage.discountSubtitle' => 'हमारा अब तक का सबसे अच्छा प्रस्ताव। केवल \$27.60/महीना',
			'profilePage.acceptDiscountCta' => '60% छूट स्वीकार करें और रुकें',
			'profilePage.farewellTitle' => 'हमें आपको जाते हुए देखकर दुख हो रहा है',
			'profilePage.farewellBody' => ({required Object date}) => 'आपकी सदस्यता रद्द कर दी गई है। आप ${date} तक अपनी वर्तमान बिलिंग अवधि के अंत तक पहुँच बनाए रखेंगे।',
			'profilePage.changeMindTitle' => '✨ क्या आप अपना मन बदलना चाहते हैं?',
			'profilePage.changeMindBody' => ({required Object date}) => 'आप ${date} से पहले कभी भी अपनी सदस्यता को फिर से सक्रिय कर सकते हैं ताकि आप अपने लाभ बनाए रख सकें।',
			'profilePage.reactivateCta' => 'रुकें, मैं फिर से सक्रिय करना चाहता हूँ',
			'profilePage.done' => 'पूरा',
			'profilePage.notifications' => 'सूचनाएँ',
			'profilePage.appLanguage' => 'ऐप भाषा',
			'profilePage.explanationLanguage' => 'व्याख्या भाषा',
			'profilePage.explanationNative' => 'मातृभाषा',
			'profilePage.explanationEnglish' => 'अंग्रेजी',
			'profilePage.explanationUpdateFailed' => 'व्याख्या भाषा अपडेट नहीं हो सकी',
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
			'profilePage.dailyReminder' => 'Daily reminder',
			'profilePage.selectNativeLanguageTitle' => 'Select your native language',
			'profilePage.reminderOn' => 'On',
			'profilePage.reminderOff' => 'Off',
			'profilePage.remindMe' => 'मुझे याद दिलाएं',
			'profilePage.reminderSave' => 'सहेजें',
			'profilePage.reminderSaved' => 'अनुस्मारक सहेजा गया',
			'profilePage.selectLanguageTitle' => 'भाषा चुनें',
			'profilePage.premium' => 'प्रीमियम',
			'profilePage.passive' => 'निष्क्रिय',
			'profilePage.active' => 'सक्रिय',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'मित्र को साझा करें',
			'profilePage.shareWithFriendTitle' => 'मित्र के साथ साझा करें',
			'profilePage.shareInviteBody' => 'अपने दोस्तों को आमंत्रित करें और एक साथ अनुवाद का आनंद लें',
			'profilePage.rateUs' => 'हमें रेट करें',
			'profilePage.faq' => 'अक्सर पूछे जाने वाले प्रश्न',
			'profilePage.faqItems.supportedLanguages.question' => 'ऐप कौन सी भाषाओं का समर्थन करता है?',
			'profilePage.faqItems.supportedLanguages.answer' => 'Lingola इंटरफ़ेस अंग्रेज़ी, जर्मन, इतालवी, फ़्रेंच, तुर्की, जापानी, स्पेनिश, रूसी, हिंदी, पुर्तगाली और सरलीकृत चीनी में उपलब्ध है।',
			'profilePage.faqItems.howAiWorks.question' => 'एआई कैसे काम करता है?',
			'profilePage.faqItems.howAiWorks.answer' => 'एआई आपके साथ एक असली ट्यूटर की तरह बातचीत करता है। यह आपकी बातचीत का विश्लेषण करता है, गलतियों का पता लगाता है, और आपकी प्रगति के आधार पर व्यक्तिगत फीडबैक प्रदान करता है।',
			'profilePage.faqItems.offlineUse.question' => 'क्या मैं ऐप का ऑफ़लाइन उपयोग कर सकता हूँ?',
			'profilePage.faqItems.offlineUse.answer' => 'हाँ। आप कुछ पाठ और बातचीत के परिदृश्यों को पहले से डाउनलोड कर सकते हैं और उन्हें ऑफ़लाइन उपयोग कर सकते हैं। हालाँकि, लाइव चैट के लिए इंटरनेट कनेक्शन की आवश्यकता होती है।',
			'profilePage.faqItems.isFree.question' => 'क्या ऐप मुफ्त है?',
			'profilePage.faqItems.isFree.answer' => 'बुनियादी संस्करण मुफ्त है। प्रीमियम के साथ, आपको उन्नत चैट परिदृश्य, उच्चारण विश्लेषण, और व्यक्तिगत ट्यूटर मोड मिलता है।',
			'profilePage.faqItems.pronunciationEval.question' => 'मेरे उच्चारण का मूल्यांकन कैसे किया जाता है?',
			'profilePage.faqItems.pronunciationEval.answer' => 'ऐप आपकी आवाज़ का विश्लेषण करता है और आपके उच्चारण और उच्चारण को स्कोर करने के लिए एआई-संचालित स्पीच रिकग्निशन का उपयोग करता है। जिन शब्दों में आपको सुधार की आवश्यकता है, उन्हें हाइलाइट किया जाता है।',
			'profilePage.faqItems.dailyPractice.question' => 'क्या मुझे रोज़ अभ्यास करना चाहिए?',
			'profilePage.faqItems.dailyPractice.answer' => 'हाँ। सिस्टम आपकी प्रगति को हर दिन ट्रैक करता है। केवल 10-15 मिनट का बोलने का अभ्यास आपके भाषा सीखने की गति को स्पष्ट रूप से बढ़ा सकता है।',
			'profilePage.faqItems.levelDetermination.question' => 'मेरे सीखने के स्तर का निर्धारण कैसे किया जाता है?',
			'profilePage.faqItems.levelDetermination.answer' => 'जब आप पहली बार साइन इन करते हैं, तो एक छोटा स्तर जांच आपके वर्तमान ज्ञान का विश्लेषण करता है। उसके बाद, एआई स्वचालित रूप से आपके स्तर के अनुसार पाठों की सिफारिश करता है।',
			'profilePage.faqItems.realPeopleChat.question' => 'क्या मैं असली लोगों से बात कर सकता हूँ?',
			'profilePage.faqItems.realPeopleChat.answer' => 'हाँ। प्रीमियम उपयोगकर्ता असली ट्यूटर्स के साथ छोटे अभ्यास सत्र निर्धारित कर सकते हैं।',
			'profilePage.faqItems.dataSecurity.question' => 'क्या मेरा डेटा सुरक्षित है?',
			'profilePage.faqItems.dataSecurity.answer' => 'बिल्कुल। सभी बातचीत और उपयोगकर्ता डेटा एन्क्रिप्टेड रूप में संग्रहीत होते हैं। आपकी व्यक्तिगत जानकारी कभी भी तीसरे पक्ष के साथ साझा नहीं की जाती है।',
			'profilePage.faqItems.disableReminders.question' => 'मैं दैनिक अनुस्मारक कैसे बंद करूँ?',
			'profilePage.faqItems.disableReminders.answer' => 'प्रोफ़ाइल सेटिंग्स पर जाएँ, सूचनाएँ खोलें, और अनुस्मारक की आवृत्ति बदलें या सूचनाएँ पूरी तरह से बंद करें।',
			'profilePage.support' => 'सहायता',
			'profilePage.feedback' => 'फीडबैक',
			'profilePage.progression' => 'प्रगति',
			'profilePage.progressTitle' => 'प्रगति',
			'profilePage.goodMorning' => 'शुभ प्रभात,',
			'profilePage.progressUserName' => 'जॉन',
			'profilePage.progressLanguage' => 'अंग्रेज़ी',
			'profilePage.past7Days' => 'पिछले 7 दिन',
			'profilePage.past7DaysBody' => 'अपनी स्ट्रीक बनाने और एक शक्तिशाली सीखने की आदत बनाने के लिए हर दिन अध्ययन करें।',
			'profilePage.currentLevel' => 'वर्तमान स्तर',
			'profilePage.xpLeft' => ({required Object level, required Object xp}) => 'आपको ${level} तक पहुँचने के लिए केवल ${xp} XP बाकी है!',
			'profilePage.toNextLevel' => 'अगले स्तर के लिए',
			'profilePage.dayStreakLabel' => 'डे स्ट्रीक',
			'profilePage.totalPoints' => 'कुल अंक',
			'profilePage.savedWords' => 'सहेजे गए शब्द',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} आइटम की समीक्षा करने के लिए',
			'profilePage.logout' => 'लॉग आउट',
			'profilePage.logoutTitle' => 'आप लॉग आउट करने वाले हैं',
			'profilePage.logoutBody' => 'जल्द ही फिर से मिलेंगे! हम आपकी श्वसन व्यायामों को याद करेंगे।',
			'profilePage.logoutConfirm' => 'लॉगआउट',
			'profilePage.logoutCancel' => 'रद्द करें',
			'profilePage.days.mon' => 'सोम',
			'profilePage.days.tue' => 'मंगल',
			'profilePage.days.wed' => 'बुध',
			'profilePage.days.thu' => 'गुरु',
			'profilePage.days.fri' => 'शुक्र',
			'profilePage.days.sat' => 'शनिवार',
			'profilePage.days.sun' => 'रविवार',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'आपका प्रमाणपत्र',
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
			'profilePage.certificateVerifyHint' => 'कोई भी QR कोड स्कैन करके आपकी उपलब्धि की पुष्टि कर सकता है।',
			'profilePage.certificateShare' => 'प्रमाणपत्र साझा करें',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'प्रमाणपत्र लॉक है',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'आपने अभी तक अपने ${level} पाठ पूरे नहीं किए हैं, इसलिए यह प्रमाणपत्र अभी उपलब्ध नहीं है।',
			'profilePage.certificateNotAvailableOk' => 'समझ गया',
			'profilePage.certificateShareQr' => 'QR कोड साझा करें',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'जब आप Lingola पर CEFR स्तर पूरा करेंगे, तो आपका प्रमाणपत्र यहाँ दिखेगा — आपके नाम, स्तर और सत्यापन के लिए QR कोड के साथ।',
			'profilePage.certificatePreviewHint' => 'अपना प्रमाणपत्र अनलॉक करने के लिए एक स्तर पथ पूरा करें',
			'profilePage.certificateTapToView' => 'प्रमाणपत्र देखने और साझा करने के लिए टैप करें',
			'profilePage.settings' => 'सेटिंग्स',
			'profilePage.dailyGoalValueLight' => '5-10 मिनट/दिन',
			'profilePage.dailyGoalValueRecommended' => '15-20 मिनट/दिन',
			'profilePage.dailyGoalValueFast' => '30+ मिनट/दिन',
			'profilePage.settingsShare' => 'Share',
			'profilePage.settingsSupport' => 'Support',
			'profilePage.settingsAbout' => 'About',
			'profilePage.settingsAccount' => 'Account',
			'profilePage.followInstagram' => 'Follow on Instagram',
			'profilePage.followTikTok' => 'Follow on TikTok',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'लगता है आपने थोड़ी देर का ब्रेक लिया।',
			'pushNotifications.h2.1' => 'क्या आपके पास एक शब्द के लिए एक पल है?',
			'pushNotifications.h2.2' => 'हम यहाँ हैं — कोई जल्दी नहीं।',
			'pushNotifications.h2.3' => 'आपकी सीखने की लय थोड़ी देर के लिए रुकी है।',
			'pushNotifications.h2.4' => 'एक छोटा सा रिव्यू अच्छा लग सकता है।',
			'pushNotifications.h4.0' => 'आज आपके लिए एक नया शब्द इंतज़ार कर रहा हो सकता है 👀',
			'pushNotifications.h4.1' => 'आप एक त्वरित अभ्यास से चूक सकते हैं।',
			'pushNotifications.h4.2' => 'आपने एक उपयोगी वाक्यांश छोड़ दिया हो सकता है।',
			'pushNotifications.h4.3' => 'आज की प्रगति अभी भी खुली है।',
			'pushNotifications.h4.4' => 'एक शब्द, एक वाक्य… शायद दोनों।',
			'pushNotifications.h8.0' => 'आपको हर दिन प्रगति करने की ज़रूरत नहीं है।',
			'pushNotifications.h8.1' => 'यहाँ तक कि थोड़ा सा रिव्यू भी मायने रखता है।',
			'pushNotifications.h8.2' => 'आज अध्ययन न करने से आपने कुछ नहीं खोया।',
			'pushNotifications.h8.3' => 'हम तब तक तैयार हैं जब तक आप हैं।',
			'pushNotifications.h8.4' => 'भाषा सीखना एक मैराथन है, स्प्रिंट नहीं।',
			'pushNotifications.h24.0' => 'एक दिन बीत गया। आपके शब्द अभी भी यहाँ हैं।',
			'pushNotifications.h24.1' => 'ब्रेक लेना सामान्य है।',
			'pushNotifications.h24.2' => 'आपका स्थान ठीक वहीं है जहाँ आपने छोड़ा था।',
			'pushNotifications.h24.3' => 'जब चाहें जारी रखें।',
			'pushNotifications.h24.4' => 'भाषा भाग नहीं जाएगी — न ही हम।',
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
			_ => null,
		};
	}
}
