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
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$fr app = _Translations$app$fr._(_root);
	@override late final _Translations$common$fr common = _Translations$common$fr._(_root);
	@override late final _Translations$onboarding$fr onboarding = _Translations$onboarding$fr._(_root);
	@override late final _Translations$targetLanguage$fr targetLanguage = _Translations$targetLanguage$fr._(_root);
	@override late final _Translations$language$fr language = _Translations$language$fr._(_root);
	@override late final _Translations$setup$fr setup = _Translations$setup$fr._(_root);
	@override late final _Translations$accountCreating$fr accountCreating = _Translations$accountCreating$fr._(_root);
	@override late final _Translations$planReady$fr planReady = _Translations$planReady$fr._(_root);
	@override late final _Translations$demoChat$fr demoChat = _Translations$demoChat$fr._(_root);
	@override late final _Translations$previewChat$fr previewChat = _Translations$previewChat$fr._(_root);
	@override late final _Translations$paywall$fr paywall = _Translations$paywall$fr._(_root);
	@override late final _Translations$auth$fr auth = _Translations$auth$fr._(_root);
	@override late final _Translations$nav$fr nav = _Translations$nav$fr._(_root);
	@override late final _Translations$home$fr home = _Translations$home$fr._(_root);
	@override late final _Translations$libraryPage$fr libraryPage = _Translations$libraryPage$fr._(_root);
	@override late final _Translations$wordPracticePage$fr wordPracticePage = _Translations$wordPracticePage$fr._(_root);
	@override late final _Translations$quizPage$fr quizPage = _Translations$quizPage$fr._(_root);
	@override late final _Translations$placeholder$fr placeholder = _Translations$placeholder$fr._(_root);
	@override late final _Translations$tutorPage$fr tutorPage = _Translations$tutorPage$fr._(_root);
	@override late final _Translations$lessonPage$fr lessonPage = _Translations$lessonPage$fr._(_root);
	@override late final _Translations$rolePlayPage$fr rolePlayPage = _Translations$rolePlayPage$fr._(_root);
	@override late final _Translations$notificationsPage$fr notificationsPage = _Translations$notificationsPage$fr._(_root);
	@override late final _Translations$profilePage$fr profilePage = _Translations$profilePage$fr._(_root);
	@override late final _Translations$pushNotifications$fr pushNotifications = _Translations$pushNotifications$fr._(_root);
	@override late final _Translations$apiErrors$fr apiErrors = _Translations$apiErrors$fr._(_root);
}

// Path: app
class _Translations$app$fr implements Translations$app$en {
	_Translations$app$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Notifications';
	@override String get streak => 'Série d\'apprentissage';
	@override String get profile => 'Profil';
}

// Path: common
class _Translations$common$fr implements Translations$common$en {
	_Translations$common$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'CONTINUER';
	@override String get back => 'RETOUR';
	@override String get locked => 'Verrouillé';
	@override String minutes({required Object value}) => '${value} min';
	@override String get close => 'Fermer';
	@override String get getStarted => 'COMMENCER';
	@override String get connectionError => 'Pas de connexion. Vérifiez votre internet et réessayez.';
	@override String get genericError => 'Quelque chose a mal tourné. Veuillez réessayer.';
	@override String get tryAgain => 'Réessayer';
}

// Path: onboarding
class _Translations$onboarding$fr implements Translations$onboarding$en {
	_Translations$onboarding$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Page d\'accueil ${current} sur ${total}';
	@override late final _Translations$onboarding$slide1$fr slide1 = _Translations$onboarding$slide1$fr._(_root);
	@override late final _Translations$onboarding$slide2$fr slide2 = _Translations$onboarding$slide2$fr._(_root);
	@override late final _Translations$onboarding$slide3$fr slide3 = _Translations$onboarding$slide3$fr._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$fr implements Translations$targetLanguage$en {
	_Translations$targetLanguage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sélectionnez la langue que vous souhaitez apprendre';
	@override String get comingSoon => 'D\'autres langues arrivent bientôt';
	@override String get korean => 'Coréen';
	@override String get portuguese => 'Portugais';
	@override String get portugueseBrazil => 'Portugais (Brésil)';
	@override String get german => 'Allemand';
	@override String get italian => 'Italien';
	@override String get simplifiedChinese => 'Chinois simplifié';
	@override String get arabic => 'Arabe';
	@override String get turkish => 'Turc';
	@override String get hindi => 'Hindi';
}

// Path: language
class _Translations$language$fr implements Translations$language$en {
	_Translations$language$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Étape ${current} sur ${total}';
	@override String get title => 'De quoi veux-tu parler ?';
	@override String get nativeSection => 'Je parle';
	@override String get nativeField => 'Langue maternelle';
	@override String get nativeName => 'Turc';
	@override String get targetSection => 'Je veux apprendre';
	@override String get targetField => 'Langue cible';
	@override String get targetName => 'Anglais';
	@override String get direction => 'Direction de la langue';
	@override String get selectLanguage => 'Sélectionner la langue';
	@override String get comingSoonBadge => 'Bientôt disponible...';
	@override String get english => 'Anglais';
	@override String get french => 'Français';
	@override String get japanese => 'Japonais';
	@override String get spanish => 'Espagnol';
	@override String get russian => 'Russe';
}

// Path: setup
class _Translations$setup$fr implements Translations$setup$en {
	_Translations$setup$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Quel est votre objectif ?';
	@override String get goalCareer => 'Développement de carrière';
	@override String get goalTravel => 'Voyager';
	@override String get goalLiving => 'Vivre à l\'étranger';
	@override String get goalStudying => 'Étudier à l\'étranger';
	@override String get goalOther => 'Autre';
	@override String get levelTitle => 'Quel est votre niveau de langue actuel ?';
	@override String get paceTitle => 'À quelle vitesse voulez-vous progresser ?';
	@override String get explanationTitle => 'Quand tu poses des questions dans ta langue, comment expliquer ?';
	@override String get explanationHint => 'Tu peux changer cela à tout moment dans les paramètres du profil.';
	@override String get explanationNative => 'Expliquer dans ma langue maternelle';
	@override String get explanationEnglish => 'Expliquer en anglais';
	@override String get levelA1 => 'A1 — Je connais quelques mots';
	@override String get levelA2 => 'A2 — Je peux utiliser des phrases simples';
	@override String get levelB1 => 'B1 — Je tiens des conversations quotidiennes';
	@override String get levelB2 => 'B2 — Je communique couramment sur des sujets familiers';
	@override String get levelC1 => 'C1 — Avancé, je veux me perfectionner';
	@override String get levelC2 => 'C2 — Maîtrise quasi native';
	@override String get paceMin5 => '5 min/jour';
	@override String get paceMin10 => '10 min/jour';
	@override String get paceMin15 => '15 min/jour';
	@override String get paceMin30 => '30 min/jour';
	@override String get paceMin60 => '60 min/jour';
}

// Path: accountCreating
class _Translations$accountCreating$fr implements Translations$accountCreating$en {
	_Translations$accountCreating$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Votre compte personnel est en cours de création';
	@override String get stepContent => 'Le contenu est en cours de création';
	@override String get stepDialogues => 'Les dialogues sont en cours de préparation';
	@override String get stepLessons => 'Les leçons sont en cours d\'optimisation';
	@override String get stepPlan => 'Votre plan est en cours de finalisation';
	@override String get optimization => 'Optimisation';
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
class _Translations$planReady$fr implements Translations$planReady$en {
	_Translations$planReady$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
	@override String get paceMin5 => '5 min/jour';
	@override String get paceMin10 => '10 min/jour';
	@override String get paceMin15 => '15 min/jour';
	@override String get paceMin30 => '30 min/jour';
	@override String get paceMin60 => '60 min/jour';
}

// Path: demoChat
class _Translations$demoChat$fr implements Translations$demoChat$en {
	_Translations$demoChat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$fr implements Translations$previewChat$en {
	_Translations$previewChat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Leçon 1 : Salutations';
	@override String get speed => '1x';
	@override String get typeMessage => 'Tape un message...';
	@override String get incoming1 => 'Salut ! Bienvenue sur Lingola — je suis ton tuteur IA. Peu importe ton niveau : ici tu es en sécurité pour apprendre l\'anglais. En anglais on dit \'Hi\' ou \'Hello\' — essaie : écris-moi \'Hi !\' en anglais !';
	@override String get outgoing1 => 'Salut ! Je suis prêt à pratiquer.';
	@override String get incoming2Highlight => 'Bonjour';
	@override String get incoming2Rest => ', Emrah ! Je suis content que tu te sentes prêt. Un café du matin est toujours un excellent moyen de commencer à créer une connexion. De quoi aimerais-tu parler ?';
	@override String get holdToSpeak => 'Maintiens pour parler';
	@override String get recording => 'Enregistrement… relâche pour envoyer';
	@override String get slideUpToLock => 'Glisse vers le haut pour verrouiller';
	@override String get slideLeftToCancel => 'Glisse à gauche pour annuler';
	@override String get recordingLockedHint => 'Appuie sur envoyer quand tu as fini';
}

// Path: paywall
class _Translations$paywall$fr implements Translations$paywall$en {
	_Translations$paywall$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Commencez à Parler Aujourd\'hui — Gratuit';
	@override String get subtitle => 'Opportunités d\'apprentissage illimitées';
	@override String get noCommitment => 'Sans engagement';
	@override String get cancelAnytime => 'Annulez à tout moment';
	@override String get noPaymentToday => 'Pas de paiement aujourd\'hui';
	@override String get daysFree => '3 Jours Gratuits';
	@override String get thenPrice => 'Puis \$1.99/mois';
	@override String get trialActive => 'Essai Gratuit Actif';
	@override String get payableToday => 'À Payer Aujourd\'hui';
	@override String get payableValue => '3 Jours Gratuits 0.00\$';
	@override String get paymentDate => 'Date de paiement : 13 Mars 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$fr implements Translations$auth$en {
	_Translations$auth$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Nos formateurs IA diversifiés';
	@override String get title => 'Commence à parler une nouvelle langue, aujourd\'hui';
	@override String get body => 'Pratique des conversations réelles avec l\'IA.\nPas de pression. Pas de jugement.';
	@override String get continueGoogle => 'Continuer avec Google';
	@override String get continueApple => 'Continuer avec Apple';
	@override String get continueGuest => 'Continuer en tant qu\'invité';
	@override String get or => 'ou';
	@override String get alreadyHaveAccount => 'Vous avez déjà un compte ?';
	@override String get signIn => 'Se connecter';
	@override String get legal => 'En vous inscrivant à Lingola, vous acceptez nos Conditions d\'utilisation. Découvrez comment nous traitons vos données dans notre Politique de confidentialité et notre Politique sur les cookies';
	@override String get terms => 'Conditions d\'utilisation';
	@override String get privacy => 'Politique de confidentialité';
	@override String get cookies => 'Politique sur les cookies';
}

// Path: nav
class _Translations$nav$fr implements Translations$nav$en {
	_Translations$nav$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get tutor => 'Tuteur';
	@override String get lesson => 'Leçon';
	@override String get rolePlay => 'Jeu de rôle';
	@override String get profile => 'Profil';
}

// Path: home
class _Translations$home$fr implements Translations$home$en {
	_Translations$home$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Bonjour, Jhon';
	@override String get todayPractice => 'Pratique d\'aujourd\'hui';
	@override String get continueConversation => 'Continuer la conversation';
	@override String continueWithTutor({required Object name}) => 'Continuer avec ${name} ou choisir un autre tuteur ?';
	@override String continueSameTutor({required Object name}) => 'Continuer avec ${name}';
	@override String get chooseOtherTutor => 'Choisir un autre tuteur';
	@override String minutesLeft({required Object value}) => '${value} min restantes';
	@override String get lessonProgress => 'Leçon 2 — Salutations';
	@override String get timeCurrent => '0min';
	@override String get timeTotal => '/ 15min';
	@override String get kContinue => 'Continuer';
	@override String get learningPath => 'A1 - Débutant';
	@override String get allLessons => 'Toutes les leçons';
	@override String get introductions => 'Introductions I';
	@override String get greetings => 'Salutations';
	@override String get jobs => 'Métiers';
	@override String get favoriteRoom => 'Une salle préférée';
	@override String get dailyRoutine => 'Routine quotidienne';
	@override String get scroll => 'Faire défiler';
	@override String get liveLesson => 'Leçon en direct';
	@override String get liveLessonSubtitle => 'Ayez un appel vidéo avec notre tuteur';
	@override String get moreTutor => 'Plus de tuteurs';
	@override String get startTalkNow => 'Commencer à parler maintenant';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Adaptatif';
	@override String get tagCalm => 'Calme';
	@override String get tagPatient => 'Patient';
	@override String get tagMethodical => 'Méthodique';
	@override String get tagEncouraging => 'Encourageant';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Plus de fonctionnalités';
	@override String get practiceLabel => 'PRATIQUE';
	@override String get wordPractice => 'Pratique des mots';
	@override String get wordPracticeBody => 'Développez votre vocabulaire dans la langue choisie chaque jour';
	@override String get immersiveLabel => 'IMMERSIF';
	@override String get quiz => 'Quiz';
	@override String get quizBodyLine1 => 'Apprenez à travers de vrais';
	@override String get quizBodyLine2 => 'exemples en contexte';
	@override String get getStarted => 'Commencer';
	@override String get library => 'Bibliothèque';
	@override String get libraryTitle => 'Apprendre et Économiser';
	@override String get learnMore => 'En savoir plus';
	@override late final _Translations$home$premium$fr premium = _Translations$home$premium$fr._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$fr implements Translations$libraryPage$en {
	_Translations$libraryPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bibliothèque';
	@override String get searchWord => 'Chercher un mot';
	@override String savedWordCount({required Object count}) => '${count} Mot enregistré';
	@override String get savedWordTab => 'Mots enregistrés';
	@override String get dictionaryTab => 'Dictionnaire';
	@override String get dictionaryLabel => 'Dictionnaire';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$fr implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pratique des mots';
	@override String get turkish => 'Turc';
	@override String get save => 'Sauvegarder';
	@override String get saved => 'Enregistré';
	@override String get listen => 'Écouter';
	@override String get hint => 'Indice';
	@override String get previous => 'PRÉCÉDENT';
	@override String get next => 'SUIVANT';
}

// Path: quizPage
class _Translations$quizPage$fr implements Translations$quizPage$en {
	_Translations$quizPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quiz';
	@override String get headline => 'Qu\'est-ce que tu veux améliorer aujourd\'hui ?';
	@override String get subtitle => 'Choisis ton entraînement — ça prend moins de 3 minutes 🚀';
	@override String get readingTitle => 'Lecture';
	@override String get readingBody => 'Compréhension via des articles & des histoires';
	@override String get writingTitle => 'Écriture';
	@override String get writingBody => 'Exercices de grammaire & de vocabulaire';
	@override String get speakingTitle => 'Parole';
	@override String get speakingBody => 'Prononciation via un moteur de parole IA';
	@override String get readingTestTitle => 'Test de Lecture';
	@override String get read => 'Lire';
	@override String get listeningHint => 'Prononce le mot anglais clairement...';
	@override String get micPermissionDenied => 'Le microphone ou la reconnaissance vocale est indisponible.';
	@override String get matchSuccess => 'Super ! Ça correspond au mot.';
	@override String matchFail({required Object heard}) => 'Entendu "${heard}". Essaie encore.';
	@override String get successfulTitle => 'Réussi !';
	@override String get successfulBody => 'Prononciation comme un locuteur natif !';
	@override String get failedTitle => 'Échoué';
	@override String get failedBody => 'C\'était presque ça, donne-lui une autre chance';
	@override String get tryAgain => 'ESSAYE ENCORE';
	@override String get writingTestTitle => 'Test d\'Écriture';
	@override String get sourceLanguage => 'LANGUE SOURCE';
	@override String get answer => 'RÉPONSE';
	@override String get writeAnswerHint => 'Écris ta réponse ici...';
	@override String get submit => 'Soumettre';
	@override String get speakingTestTitle => 'Test de Parole';
	@override String get speakingProficiency => 'Niveau de Parole';
	@override String get speakClearlyHint => 'Parle clairement dans ton microphone :';
	@override String get speakUp => 'Parle Plus Fort';
	@override String get recording => 'Enregistrement...';
	@override String questionOf({required Object current, required Object total}) => 'QUESTION ${current} DE ${total}';
}

// Path: placeholder
class _Translations$placeholder$fr implements Translations$placeholder$en {
	_Translations$placeholder$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} est en route';
	@override String body({required Object tab}) => 'Nous préparons une expérience ${tab} ciblée pour vous.';
}

// Path: tutorPage
class _Translations$tutorPage$fr implements Translations$tutorPage$en {
	_Translations$tutorPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tuteur';
	@override String get chatWithLingola => 'Discuter avec Lingola';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => 'Discuter avec ${name}';
	@override String get chatHistory => 'Historique des discussions';
	@override String get history => 'Historique';
	@override String get filter => 'Filtrer';
	@override String get country => 'Pays';
	@override String get focus => 'Focus';
	@override String get moreCountries => '8+ de plus';
	@override String get moreFocus => '+8';
	@override String get save => 'ENREGISTRER';
	@override String get clearFilter => 'Supprimer les filtres';
	@override String get startTalkNow => 'Commencer à discuter maintenant';
	@override String get typeMessage => 'Tape un message...';
	@override String get speaker => 'Intervenant';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$fr tutors = _Translations$tutorPage$tutors$fr._(_root);
	@override late final _Translations$tutorPage$tags$fr tags = _Translations$tutorPage$tags$fr._(_root);
	@override String get historyPreview1 => 'Salut ! J\'étais sur le point d\'exploser d\'ennui...';
	@override String get historyPreview2 => 'On pratique la commande de nourriture aujourd\'hui ?';
	@override String get time1 => '11:00 AM';
	@override String get time2 => 'Hier';
	@override late final _Translations$tutorPage$chat$fr chat = _Translations$tutorPage$chat$fr._(_root);
	@override late final _Translations$tutorPage$calling$fr calling = _Translations$tutorPage$calling$fr._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$fr implements Translations$lessonPage$en {
	_Translations$lessonPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Continue à apprendre';
	@override String get profile => 'Profil';
	@override String get language => 'Langue cible';
	@override String get completed => 'Terminé';
	@override String get locked => 'Verrouillé';
	@override String get pickTutorTitle => 'Choisissez votre tuteur';
	@override String get startTalk => 'Commencer la leçon';
	@override String get chatInstead => 'Discuter à la place';
	@override String get lockedHint => 'Terminez la leçon précédente pour débloquer celle-ci.';
	@override String get levelLockedTitle => 'Niveau verrouillé';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Votre niveau d\'anglais est ${userLevel} ; vous ne pouvez pas ouvrir les leçons ${lessonLevel} sans terminer le parcours précédent.';
	@override String get levelLockedOk => 'Compris';
	@override String get notesTitle => 'Notes de la leçon';
	@override String get whatWeLearned => 'Ce que nous avons appris aujourd\'hui';
	@override String get deleteNotes => 'Supprimer mes notes de leçon';
	@override String get deleteNotesConfirm => 'Supprimer ces notes ? Cela ne peut pas être annulé.';
	@override String get delete => 'Supprimer';
	@override String get cancel => 'Annuler';
	@override String get practiceCta => 'Si cela vous a semblé trop difficile, vous pouvez pratiquer le même sujet à nouveau.';
	@override String get practiceNow => 'Pratiquer ce sujet';
	@override String get openChat => 'Ouvrir le chat avec le tuteur';
	@override String get yourScore => 'Votre score';
	@override String bestScore({required Object score}) => 'Meilleur ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Participant passif';
	@override String get participationSilentBody => 'Vous êtes resté silencieux cette fois. Je pense que vous devriez reprendre cette leçon.';
	@override String get participationPassive => 'Participation faible';
	@override String get participationPassiveBody => 'Vous avez à peine parlé. Essayez la leçon à nouveau et dites-en plus.';
	@override String get participationActive => 'Bonne participation';
	@override String get participationActiveBody => 'Vous avez rejoint la conversation. Continuez comme ça !';
	@override String get participationStrong => 'Participation forte';
	@override String get participationStrongBody => 'Vous avez beaucoup parlé. Excellent travail !';
	@override String get retakeLesson => 'Reprendre cette leçon';
	@override String get finishLesson => 'Terminer la leçon';
	@override String get savingNotes => 'Votre tuteur est en train d\'écrire les notes d\'aujourd\'hui...';
	@override String get noNotes => 'Terminez cette leçon pour obtenir des notes de votre tuteur.';
	@override String get notesDeleted => 'Notes de la leçon supprimées';
	@override late final _Translations$lessonPage$levels$fr levels = _Translations$lessonPage$levels$fr._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$fr implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Jeu de Rôle';
	@override String get subtitle => 'Choisissez votre rôle — vivez un scénario réel 🎭';
	@override String progressCompleted({required Object value}) => '%${value} complété';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get beginner => 'Débutant';
	@override String get screenplay => 'SCÉNARIO';
	@override String get dailyInteractions => 'Interactions Quotidiennes';
	@override String get business => 'Affaires';
	@override late final _Translations$rolePlayPage$coffee$fr coffee = _Translations$rolePlayPage$coffee$fr._(_root);
	@override late final _Translations$rolePlayPage$directions$fr directions = _Translations$rolePlayPage$directions$fr._(_root);
	@override late final _Translations$rolePlayPage$interview$fr interview = _Translations$rolePlayPage$interview$fr._(_root);
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
	@override late final _Translations$rolePlayPage$missedTrain$fr missedTrain = _Translations$rolePlayPage$missedTrain$fr._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$fr flightAttendant = _Translations$rolePlayPage$flightAttendant$fr._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$fr trainTicket = _Translations$rolePlayPage$trainTicket$fr._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$fr restaurantReservation = _Translations$rolePlayPage$restaurantReservation$fr._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$fr doctorAppointment = _Translations$rolePlayPage$doctorAppointment$fr._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$fr shoppingClothes = _Translations$rolePlayPage$shoppingClothes$fr._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$fr takingTaxi = _Translations$rolePlayPage$takingTaxi$fr._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$fr rentingApartment = _Translations$rolePlayPage$rentingApartment$fr._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$fr birthdayParty = _Translations$rolePlayPage$birthdayParty$fr._(_root);
	@override String get deleteFailed => 'Impossible de supprimer le scénario. Réessaie.';
}

// Path: notificationsPage
class _Translations$notificationsPage$fr implements Translations$notificationsPage$en {
	_Translations$notificationsPage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifications';
	@override String get deleteConfirmTitle => 'Êtes-vous sûr ?';
	@override String get deleteConfirmBody => 'Cette notification sera supprimée.';
	@override String get delete => 'Supprimer';
	@override String get cancel => 'Annuler';
	@override late final _Translations$notificationsPage$translation$fr translation = _Translations$notificationsPage$translation$fr._(_root);
	@override late final _Translations$notificationsPage$offer$fr offer = _Translations$notificationsPage$offer$fr._(_root);
	@override late final _Translations$notificationsPage$stories$fr stories = _Translations$notificationsPage$stories$fr._(_root);
	@override late final _Translations$notificationsPage$practice$fr practice = _Translations$notificationsPage$practice$fr._(_root);
	@override late final _Translations$notificationsPage$streak$fr streak = _Translations$notificationsPage$streak$fr._(_root);
	@override late final _Translations$notificationsPage$premium$fr premium = _Translations$notificationsPage$premium$fr._(_root);
	@override String get emptyTitle => 'Pas encore de notifications';
	@override String get emptySubtitle => 'N\'oubliez pas de revenir vérifier lorsque vous recevrez une notification.';
}

// Path: profilePage
class _Translations$profilePage$fr implements Translations$profilePage$en {
	_Translations$profilePage$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Version Gratuite';
	@override String get dayStreak => 'Série de Jours !';
	@override String get accountSettings => 'Paramètres du Compte';
	@override String get general => 'Général';
	@override String get profileSettings => 'Paramètres du Profil';
	@override String get fullName => 'Nom Complet';
	@override String get email => 'E-mail';
	@override String get deleteAccount => 'Supprimer le Compte';
	@override String get save => 'ENREGISTRER';
	@override String get deleteTitle => 'Nous ne voulons pas que tu partes, mais nous comprenons.';
	@override String get deleteBody => 'Peux-tu nous dire pourquoi tu souhaites nous quitter pour améliorer l\'expérience Lingola ?';
	@override late final _Translations$profilePage$deleteReasons$fr deleteReasons = _Translations$profilePage$deleteReasons$fr._(_root);
	@override String get messageOptional => 'Message (optionnel)';
	@override String get messageHint => 'Si tu as un message, n\'hésite pas à l\'écrire.';
	@override String get next => 'SUIVANT';
	@override String get specialOfferTitle => 'Offre Spéciale';
	@override String get specialOfferBody => 'Avant de partir, jette un œil à l\'offre que nous avons préparée pour toi.';
	@override String get monthlyPlanTitle => 'Passer au Plan de 1 Mois';
	@override String get monthlyPlanPrice => '\$79/mois, annule à tout moment';
	@override String get monthlyPlanDesc => 'Pas d\'engagement à long terme. Reste connecté avec notre communauté sur une base mensuelle.';
	@override String get whatYoullKeep => 'Ce que tu vas garder :';
	@override String get keepCharacters => 'Accès à tous les personnages';
	@override String get keepVideo => 'Appels vidéo illimités';
	@override String get keepCourses => 'Accès à tous les cours';
	@override String get switchMonthlyCta => 'Passer au Plan Mensuel';
	@override String get confirmTitle => 'Es-tu sûr ?';
	@override String get confirmBody => 'Nous ne voulons vraiment pas te voir partir. Voici ce que tu vas perdre :';
	@override String get loseCharacters => 'Accès illimité aux personnages';
	@override String get loseVideo => 'Accès illimité aux appels vidéo';
	@override String get loseCourses => 'Accès à tous les cours';
	@override String get discountTitle => 'Reste et obtient 60% de réduction pendant 1 mois';
	@override String get discountSubtitle => 'Notre meilleure offre jamais. Juste \$27.60/mois';
	@override String get acceptDiscountCta => 'Accepter 60% de Réduction & Rester';
	@override String get farewellTitle => 'Nous sommes tristes de te voir partir';
	@override String farewellBody({required Object date}) => 'Ton abonnement a été annulé. Tu auras accès jusqu\'à la fin de ta période de facturation actuelle le ${date}.';
	@override String get changeMindTitle => '✨ Tu changes d\'avis ?';
	@override String changeMindBody({required Object date}) => 'Tu peux réactiver ton abonnement à tout moment avant le ${date} pour garder tes avantages.';
	@override String get reactivateCta => 'Attends, je veux réactiver';
	@override String get done => 'FAIT';
	@override String get notifications => 'Notifications';
	@override String get appLanguage => 'Langue de l\'App';
	@override String get explanationLanguage => 'Langue d\'explication';
	@override String get explanationNative => 'Langue maternelle';
	@override String get explanationEnglish => 'Anglais';
	@override String get explanationUpdateFailed => 'Impossible de mettre à jour la langue d\'explication';
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
	@override String get remindMe => 'Me rappeler';
	@override String get reminderSave => 'Enregistrer';
	@override String get reminderSaved => 'Rappel enregistré';
	@override String get selectLanguageTitle => 'Sélectionner la Langue';
	@override String get premium => 'Premium';
	@override String get passive => 'Passif';
	@override String get active => 'Actif';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Partager avec un Ami';
	@override String get shareWithFriendTitle => 'Partager avec un Ami';
	@override String get shareInviteBody => 'Invite tes amis et profitez de la traduction ensemble';
	@override String get rateUs => 'Évalue-nous';
	@override String get faq => 'FAQ Lingola';
	@override late final _Translations$profilePage$faqItems$fr faqItems = _Translations$profilePage$faqItems$fr._(_root);
	@override String get support => 'Support';
	@override String get feedback => 'Retour d\'Information';
	@override String get progression => 'Progression';
	@override String get progressTitle => 'Progrès';
	@override String get goodMorning => 'Bonjour,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'Anglais';
	@override String get past7Days => '7 Derniers Jours';
	@override String get past7DaysBody => 'Étudie chaque jour pour construire ta série et créer une habitude d\'apprentissage puissante.';
	@override String get currentLevel => 'Niveau Actuel';
	@override String xpLeft({required Object xp, required Object level}) => 'Il te reste juste ${xp} XP pour atteindre le niveau ${level} !';
	@override String get toNextLevel => 'VERS LE NIVEAU SUIVANT';
	@override String get dayStreakLabel => 'Série de Jours';
	@override String get totalPoints => 'Points Totaux';
	@override String get savedWords => 'Mots Enregistrés';
	@override String itemsToReview({required Object count}) => '${count} éléments à réviser';
	@override String get logout => 'Se Déconnecter';
	@override String get logoutTitle => 'Tu es sur le point de te déconnecter';
	@override String get logoutBody => 'À bientôt ! Tes exercices de respiration vont nous manquer.';
	@override String get logoutConfirm => 'DÉCONNEXION';
	@override String get logoutCancel => 'ANNULER';
	@override late final _Translations$profilePage$days$fr days = _Translations$profilePage$days$fr._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Votre certificat';
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
	@override String get certificateVerifyHint => 'Tout le monde peut scanner le code QR pour vérifier votre réussite.';
	@override String get certificateShare => 'Partager le certificat';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => 'Certificat verrouillé';
	@override String certificateNotAvailable({required Object level}) => 'Vous ne pouvez pas encore utiliser ce certificat car vous n\'avez pas terminé vos leçons ${level}.';
	@override String get certificateNotAvailableOk => 'Compris';
	@override String get certificateShareQr => 'Partager le code QR';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Lorsque vous terminerez un niveau CEFR sur Lingola, votre certificat apparaîtra ici — avec votre nom, votre niveau et un code QR à scanner pour vérifier.';
	@override String get certificatePreviewHint => 'Terminez un parcours de niveau pour débloquer votre certificat';
	@override String get certificateTapToView => 'Appuyez pour voir et partager votre certificat';
	@override String get settings => 'Paramètres';
	@override String get dailyGoalValueLight => '5-10 min/jour';
	@override String get dailyGoalValueRecommended => '15-20 min/jour';
	@override String get dailyGoalValueFast => '30+ min/jour';
	@override String get settingsShare => 'Share';
	@override String get settingsSupport => 'Support';
	@override String get settingsAbout => 'About';
	@override String get settingsAccount => 'Account';
	@override String get followInstagram => 'Follow on Instagram';
	@override String get followTikTok => 'Follow on TikTok';
}

// Path: pushNotifications
class _Translations$pushNotifications$fr implements Translations$pushNotifications$en {
	_Translations$pushNotifications$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'On dirait que vous avez pris une petite pause.',
		'Avez-vous un moment pour un mot ?',
		'Nous sommes là — pas de précipitation.',
		'Votre rythme d\'apprentissage a fait une pause.',
		'Une petite révision pourrait être agréable.',
	];
	@override List<String> get h4 => [
		'Un nouveau mot pourrait vous attendre aujourd\'hui 👀',
		'Vous pourriez apprécier une pratique rapide.',
		'Vous avez peut-être manqué une phrase utile.',
		'Les progrès d\'aujourd\'hui sont toujours ouverts.',
		'Un mot, une phrase… peut-être les deux.',
	];
	@override List<String> get h8 => [
		'Pas besoin de progresser chaque jour.',
		'Même une petite révision compte.',
		'Vous n\'avez rien perdu en ne révisant pas aujourd\'hui.',
		'Nous sommes prêts quand vous l\'êtes.',
		'Apprendre une langue est un marathon, pas un sprint.',
	];
	@override List<String> get h24 => [
		'Une journée est passée. Vos mots sont toujours là.',
		'Prendre une pause est normal.',
		'Votre place est exactement là où vous l\'avez laissée.',
		'Continuez quand vous le souhaitez.',
		'La langue ne s\'enfuira pas — nous non plus.',
	];
	@override String get lessonReminderTitle => 'La leçon du jour t\'attend';
	@override List<String> get lessonReminder => [
		'Tu n\'as pas encore fait la leçon — 5 minutes suffisent.',
		'Ton tuteur est prêt. Reprends où tu t\'es arrêté.',
		'Une courte leçon garde le rythme.',
		'La leçon du jour est encore ouverte — on commence ?',
	];
	@override String get quizReminderTitle => 'Prêt pour un quiz rapide ?';
	@override String quizReminderWords({required Object count, required Object savedCount}) => 'Tu as appris ${count} mots récemment — un quiz ? ${savedCount} mots sauvegardés t\'attendent.';
	@override String quizReminderSaved({required Object savedCount}) => '${savedCount} mots sauvegardés attendent une révision.';
	@override List<String> get quizReminder => [
		'Pas de quiz depuis un moment — 3 minutes de révision.',
		'Tes mots sauvegardés t\'attendent.',
		'Teste ce que tu retiens — quelques minutes.',
		'Un court quiz maintenant aide demain.',
	];
	@override String get eveningLessonTitle => 'Ne manque pas la pratique du jour';
	@override List<String> get eveningLesson => [
		'Tu n\'as pas encore étudié aujourd\'hui.',
		'Avant la fin de la journée — une leçon rapide ?',
		'Il reste du temps pour 5 minutes d\'anglais.',
		'Ta leçon quotidienne t\'attend.',
	];
	@override String get streakReminderTitle => 'Garde ta série';
	@override String streakReminder({required Object streak}) => 'Série de ${streak} jours — une courte leçon aujourd\'hui la maintient.';
}

// Path: apiErrors
class _Translations$apiErrors$fr implements Translations$apiErrors$en {
	_Translations$apiErrors$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$fr implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parlez avec confiance en semaines — pas en mois';
	@override String get body => 'Pratiquez de vraies conversations avec l\'IA. Améliorez votre accent, votre confiance et votre fluidité, chaque jour.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Je ne pouvais pas parler anglais avant. Maintenant, je parle tous les jours au travail.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$fr implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un tuteur privé sans le prix';
	@override String get body => 'De vraies conversations. Retour instantané.\nPas de planification. Pas de pression.';
	@override String get realTutor => 'Vrai Tuteur';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / hr';
	@override String get priceLingola => '\$9.99 / an';
	@override String get versus => 'VS';
	@override String get scheduled => 'Programmé';
	@override String get anytime => 'À tout moment';
	@override String get stressful => 'Stressant';
	@override String get noPressure => 'Pas de pression';
	@override String get price => 'Prix';
	@override String get availability => 'Disponibilité';
	@override String get feeling => 'Ressenti';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$fr implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un plan d\'apprentissage construit autour de vous';
	@override String get body => 'Vos objectifs, votre rythme, votre niveau.\nDu débutant au courant — étape par étape.';
	@override String get goal => 'Objectif';
	@override String get practice => 'Pratique';
	@override String get progress => 'Progrès';
}

// Path: home.premium
class _Translations$home$premium$fr implements Translations$home$premium$en {
	_Translations$home$premium$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Le chemin vers ';
	@override String get titleHighlight => 'parler couramment';
	@override String get titleAfter => ' sans peur de faire des erreurs.';
	@override String get descriptionBefore => 'Rejoignez des millions d\'étudiants dans le monde entier. Commencez à briser la barrière de la langue aujourd\'hui — ';
	@override String get descriptionHighlight => 'les 3 premiers jours complètement gratuits.';
	@override String get feature1 => 'Tuteur IA accessible 24/7';
	@override String get feature2 => 'Accès illimité aux tuteurs privés';
	@override String get feature3 => 'Plan de leçon quotidien adapté pour vous';
	@override String get priceAmount => '1,99\$';
	@override String get pricePeriod => '/mo';
	@override String get discount => '40% de réduction avec un achat annuel';
	@override String get cta => 'Commencer';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$fr implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
	@override String get santa => 'Père Noël';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$fr implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Adaptatif';
	@override String get calm => 'Calme';
	@override String get patient => 'Patient';
	@override String get organized => 'Organisé';
	@override String get relaxed => 'Détendu';
	@override String get methodical => 'Méthodique';
	@override String get attentive => 'Attentif';
	@override String get more => '+5';
	@override String get curious => 'Curieux';
	@override String get observer => 'Observateur';
	@override String get ancientKnowledge => 'Connaissance Ancienne';
	@override String get wise => 'Sage';
	@override String get clear => 'Clair';
	@override String get decisive => 'Décisif';
	@override String get disciplined => 'Discipliné';
	@override String get smart => 'Intelligent';
	@override String get analytic => 'Analytique';
	@override String get cheerful => 'Joyeux';
	@override String get generous => 'Généreux';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$fr implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Bonjour ! Je suis content que tu sois prêt à pratiquer aujourd\'hui.';
	@override String get outgoing1 => 'Oui, commençons par les salutations.';
	@override String get incoming2 => 'Parfait. Comment dirais-tu bonjour à un collègue ?';
	@override String get typing => 'En train d\'écrire';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$fr implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Leçon 1 : Salutations';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Leçon ${number} : ${title}';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Ennuyé ? J\'ai supprimé ce mot de mon vocabulaire. Lève-toi, le plan est déjà établi : on va ce nouveau bar d\'arcade à Kadıköy.';
	@override String get highlight => 'Ennuyé ?';
	@override String get close => 'Mettre fin à l\'appel';
	@override String get toggleCaptions => 'Basculer les sous-titres';
	@override String get toggleHints => 'Basculer les indices';
	@override String get toggleMic => 'Basculer le microphone';
	@override String get tapToSpeakHint => 'Appuie pour parler, appuie encore pour terminer';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$fr implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$fr a1 = _Translations$lessonPage$levels$a1$fr._(_root);
	@override late final _Translations$lessonPage$levels$a2$fr a2 = _Translations$lessonPage$levels$a2$fr._(_root);
	@override late final _Translations$lessonPage$levels$b1$fr b1 = _Translations$lessonPage$levels$b1$fr._(_root);
	@override late final _Translations$lessonPage$levels$b2$fr b2 = _Translations$lessonPage$levels$b2$fr._(_root);
	@override late final _Translations$lessonPage$levels$c1$fr c1 = _Translations$lessonPage$levels$c1$fr._(_root);
	@override late final _Translations$lessonPage$levels$c2$fr c2 = _Translations$lessonPage$levels$c2$fr._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$fr implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Commander au Café';
	@override String get screenplay => 'Commandez votre boisson préférée, demandez des tailles et des extras, confirmez votre total et récupérez votre café au comptoir.';
	@override late final _Translations$rolePlayPage$coffee$chat$fr chat = _Translations$rolePlayPage$coffee$chat$fr._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$fr implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Demander des Directions dans la Rue';
	@override String get screenplay => 'Demandez des directions pour un endroit, découvrez comment aller au métro ou au bus, obtenez des informations sur les billets et écoutez des recommandations de restaurants.';
	@override late final _Translations$rolePlayPage$directions$chat$fr chat = _Translations$rolePlayPage$directions$chat$fr._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$fr implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entretien d\'Embauche';
	@override String get screenplay => 'Présentez-vous, répondez aux questions courantes d\'entretien, parlez de votre expérience et posez des questions sur le poste et les prochaines étapes.';
	@override late final _Translations$rolePlayPage$interview$chat$fr chat = _Translations$rolePlayPage$interview$chat$fr._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$fr implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$fr chat = _Translations$rolePlayPage$missedTrain$chat$fr._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$fr implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$fr chat = _Translations$rolePlayPage$flightAttendant$chat$fr._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$fr implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$fr chat = _Translations$rolePlayPage$trainTicket$chat$fr._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$fr implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$fr chat = _Translations$rolePlayPage$restaurantReservation$chat$fr._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$fr implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$fr chat = _Translations$rolePlayPage$doctorAppointment$chat$fr._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$fr implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$fr chat = _Translations$rolePlayPage$shoppingClothes$chat$fr._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$fr implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$fr chat = _Translations$rolePlayPage$takingTaxi$chat$fr._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$fr implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$fr chat = _Translations$rolePlayPage$rentingApartment$chat$fr._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$fr implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$fr chat = _Translations$rolePlayPage$birthdayParty$chat$fr._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$fr implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nouvelle traduction prête';
	@override String get body => 'Votre fichier de traduction audio a été converti avec succès en texte et traduit.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$fr implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Une offre spéciale vous attend';
	@override String get body => 'Passez à Premium pour des traductions de photos illimitées avec 50 % de réduction.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$fr implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Découvrez de nouvelles histoires';
	@override String get body => 'Apprenez de nouveaux mots à travers des histoires';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$fr implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$fr implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$fr implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$fr implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Je n\'ai pas trouvé les personnages d\'IA réalistes.';
	@override String get videoIssues => 'J\'ai des problèmes techniques lors des appels vidéo.';
	@override String get pricing => 'Les prix d\'abonnement dépassent mes attentes.';
	@override String get noMatch => 'Je n\'ai pas trouvé de personnages dans le style que je recherche.';
	@override String get shortTrial => 'Je voulais juste essayer pour une courte période.';
	@override String get other => 'Autre';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$fr implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$fr supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$fr._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$fr howAiWorks = _Translations$profilePage$faqItems$howAiWorks$fr._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$fr offlineUse = _Translations$profilePage$faqItems$offlineUse$fr._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$fr isFree = _Translations$profilePage$faqItems$isFree$fr._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$fr pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$fr._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$fr dailyPractice = _Translations$profilePage$faqItems$dailyPractice$fr._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$fr levelDetermination = _Translations$profilePage$faqItems$levelDetermination$fr._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$fr realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$fr._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$fr dataSecurity = _Translations$profilePage$faqItems$dataSecurity$fr._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$fr disableReminders = _Translations$profilePage$faqItems$disableReminders$fr._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$fr implements Translations$profilePage$days$en {
	_Translations$profilePage$days$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get mon => 'LUN';
	@override String get tue => 'MAR';
	@override String get wed => 'MER';
	@override String get thu => 'JEU';
	@override String get fri => 'VEN';
	@override String get sat => 'SAM';
	@override String get sun => 'DIM';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$fr implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Débutant';
	@override List<String> get lessons => [
		'Salutations',
		'Introductions I',
		'Métiers',
		'Une pièce préférée',
		'Routine quotidienne',
		'Fruits',
		'Conseils 1',
		'Famille 1',
		'Choses du quotidien',
		'Ville natale',
		'Maison',
		'Préférences alimentaires',
		'Loisirs 1',
		'Personnes réussies',
		'Nourriture et boissons',
		'Commander au restaurant',
		'Animaux de compagnie',
		'Santé et fitness',
		'Météo',
		'Nouveau mode de vie',
		'S\'améliorer',
		'Loisirs 2',
		'Questions sur les lieux',
		'Possession',
		'Shopping 1',
		'Dire l\'heure',
		'Directions 1',
		'Shopping 2',
		'Faire connaissance',
		'Lieux d\'objets',
		'Apparences',
		'Directions 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$fr implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Basique';
	@override List<String> get lessons => [
		'Famille 2',
		'Personnes et lieux',
		'Famille 3',
		'Décrire des objets',
		'Ville',
		'Le projet de construction',
		'Chez soi',
		'Quelle heure est-il',
		'Routine quotidienne 2',
		'Temps libre',
		'Nourriture et nutrition',
		'Shopping et consommation',
		'Vacances',
		'Plans du week-end',
		'Formel ou décontracté',
		'Mode',
		'Shopping 3',
		'Conseils 2',
		'Tu peux le faire',
		'Shopping 4',
		'Petits bavardages',
		'Un latte s\'il vous plaît',
		'Nourriture',
		'Se déplacer',
		'Prêt pour un voyage',
		'Voyage 1',
		'Évasions urbaines',
		'Voyage 2',
		'Un endroit où séjourner',
		'Tellement excitant',
		'La bonne personne',
		'École',
		'Préférences musicales',
		'Sports',
		'Règles de la course',
		'Laisser un message',
		'Demandes',
		'Invitations',
		'Expériences de voyage',
		'Passé 1',
		'Passé 2',
		'Passé 3',
		'Questions sur le passé',
		'On n\'est jamais trop vieux',
		'Souvenirs d\'enfance',
		'Compliments',
		'Excuses',
		'C\'est tellement ennuyeux !',
		'Un monde numérique',
		'Vie professionnelle',
		'Je n\'ai pas compris ça',
		'Économiser ou dépenser ?',
		'Dire désolé',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$fr implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Intermédiaire';
	@override List<String> get lessons => [
		'Traditions culturelles',
		'Célébrités',
		'Art et créativité',
		'Plans futurs',
		'Planification d\'événements',
		'Objectifs et projets',
		'Événements historiques',
		'Technologie',
		'Jamais de la vie',
		'Qu\'est-ce qui se passe',
		'Vacances de rêve',
		'Médias sociaux',
		'Recommandations de livres',
		'Un de ces jours',
		'Photos spéciales',
		'Réalisations personnelles',
		'Films préférés',
		'Flash info',
		'Bonheur',
		'Une semaine chargée',
		'Là où j\'ai grandi',
		'Jours d\'école',
		'Profils',
		'Cartes de vie',
		'Quotidien',
		'Qu\'est-ce qui vient ensuite',
		'Faire des suggestions',
		'Que s\'est-il passé',
		'Souvenirs',
		'Choc culturel',
		'Phrases d\'intérêt',
		'Entretiens d\'embauche',
		'Listes de souhaits',
		'Ma ville idéale',
		'La génération Internet',
		'Marques populaires',
		'Phrases d\'opinion',
		'À quoi ça ressemble',
		'Espace de vie',
		'Bien manger',
		'Hobbies inhabituels',
		'Un choix difficile',
		'Passer à l\'action',
		'Nouvelles compétences',
		'Faire une réclamation',
		'Éducation',
		'Villes vertes',
		'Qu\'est-ce qu\'il y a dans un emploi',
		'Défis personnels',
		'Phrases d\'entretien',
		'Fin polie',
		'Actualités de dernière minute',
		'Petits changements',
		'Excuses d\'excuses',
		'Étiquette téléphonique',
		'Désolé d\'interrompre…',
		'Réponses aux plaintes',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$fr implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Intermédiaire Supérieur';
	@override List<String> get lessons => [
		'Personnalités',
		'Grands leaders',
		'Mode de vie sain',
		'Quelle est la vérité ?',
		'Croissance personnelle',
		'S\'exprimer',
		'Jouer un rôle ?',
		'Je me souviens...',
		'Retour social',
		'Scène de crime',
		'Problèmes polis',
		'Résolution de conflits',
		'Aimez-le ou détestez-le ?',
		'Problèmes environnementaux',
		'Nous pouvons le résoudre',
		'Mystères et crimes',
		'Futurs possibles',
		'Plans d\'affaires',
		'Décisions de réunion',
		'C\'est tellement prévisible...',
		'Au travail',
		'Science et technologie',
		'Gestion du temps',
		'Droits de l\'homme',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$fr implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Avancé';
	@override List<String> get lessons => [
		'Normes culturelles',
		'Influence des réseaux sociaux',
		'Choix de carrière',
		'Accélérer la performance',
		'Inventions',
		'Voyage dans le temps',
		'Possessions',
		'Compétences professionnelles',
		'Changements historiques',
		'Rédaction de critiques',
		'Mystères',
		'Théories étranges',
		'Célébrité',
		'Politique mondiale',
		'Essor des produits',
		'Sera-t-il heureux ?',
		'Peut-être plus tard...',
		'Nouvelles solutions',
		'Influence contextuelle',
		'Un logo perdu',
		'Actes de gentillesse',
		'Quel film',
		'Comme c\'est ennuyeux',
		'Dans les nouvelles',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$fr implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Expert';
	@override List<String> get lessons => [
		'Mondialisation',
		'Catastrophes naturelles',
		'Réagir à l\'information',
		'Équilibre travail-vie personnelle',
		'Télétravail',
		'Problèmes familiaux',
		'Anatomie humaine de base',
		'Prédictions de santé',
		'Accès aux soins de santé',
		'Expérience de voyage à l\'étranger',
		'Super pouvoirs',
		'Cohésion d\'équipe',
		'Biofluorescence',
		'Dilemmes',
		'Enthousiasme social',
		'Changements',
		'Travail, travail, travail',
		'Problèmes locaux',
		'Problèmes, problèmes',
		'Fait ou fiction ?',
		'Visites touristiques',
		'Bénévolat',
		'L\'œil de l\'esprit',
		'Consommation des médias',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$fr implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Salut ! Aujourd\'hui, nous allons pratiquer la commande dans un café — salutations, tailles, extras. Je vais d\'abord expliquer un peu, puis nous allons jouer. Ça te va ?';
	@override String get incoming1 => 'Bienvenue ! Que puis-je vous servir aujourd\'hui ?';
	@override String get outgoing1 => 'Salut ! Je voudrais un latte moyen, s\'il vous plaît.';
	@override String get incoming2Highlight => 'Bien sûr';
	@override String get incoming2Rest => '! Voulez-vous cela chaud ou glacé, et des extras ?';
	@override String get botReply => 'Excellente choix. Autre chose avec votre commande ?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$fr implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Salut ! Aujourd\'hui, nous allons pratiquer la demande de directions dans la rue. Je vais d\'abord expliquer un peu, puis nous allons jouer. Ça te va ?';
	@override String get incoming1 => 'Salut ! Tu as l\'air un peu perdu — besoin d\'aide pour trouver quelque chose ?';
	@override String get outgoing1 => 'Oui, je cherche la station de métro la plus proche.';
	@override String get incoming2Highlight => 'Bien sûr';
	@override String get incoming2Rest => '! Marchez deux pâtés de maisons dans cette direction, puis tournez à gauche. Vous verrez l\'entrée.';
	@override String get botReply => 'De rien ! Voulez-vous aussi un conseil de restaurant près de la station ?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$fr implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Salut ! Aujourd\'hui, nous allons pratiquer un entretien d\'embauche. Je vais d\'abord expliquer un peu, puis nous allons jouer — je vais vous interviewer, puis nous échangeons. Ça te va ?';
	@override String get incoming1 => 'Merci d\'être venu aujourd\'hui. Pourriez-vous vous présenter brièvement ?';
	@override String get outgoing1 => 'Bien sûr. Je suis ravi d\'être ici et de partager mon expérience.';
	@override String get incoming2Highlight => 'Merveilleux';
	@override String get incoming2Rest => '. Parlez-moi d\'un projet récent dont vous êtes fier.';
	@override String get botReply => 'C\'est impressionnant. Quelles questions avez-vous sur le poste ?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$fr implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$fr implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$fr implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$fr implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$fr implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$fr implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$fr implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$fr implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$fr implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$fr implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Quelles langues l\'application prend-elle en charge ?';
	@override String get answer => 'L\'interface Lingola est disponible en anglais, allemand, italien, français, turc, japonais, espagnol, russe, hindi, portugais et chinois simplifié.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$fr implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Comment fonctionne l\'IA ?';
	@override String get answer => 'L\'IA interagit avec toi comme un vrai tuteur. Elle analyse tes conversations, détecte les erreurs et offre des retours personnalisés en fonction de tes progrès.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$fr implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Puis-je utiliser l\'application hors ligne ?';
	@override String get answer => 'Oui. Tu peux télécharger certaines leçons et scénarios de conversation à l\'avance et les utiliser hors ligne. Cependant, le chat en direct nécessite une connexion Internet.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$fr implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'L\'application est-elle gratuite ?';
	@override String get answer => 'La version de base est gratuite. Avec Premium, tu obtiens des scénarios de chat avancés, une analyse de prononciation et un mode tuteur personnel.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$fr implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Comment ma prononciation est-elle évaluée ?';
	@override String get answer => 'L\'application analyse ta voix et utilise la reconnaissance vocale alimentée par l\'IA pour évaluer ton accent et ta prononciation. Les mots que tu dois améliorer sont mis en évidence.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$fr implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Dois-je pratiquer tous les jours ?';
	@override String get answer => 'Oui. Le système suit tes progrès chaque jour. Juste 10 à 15 minutes de pratique orale par jour peuvent accélérer considérablement ton apprentissage des langues.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$fr implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Comment mon niveau d\'apprentissage est-il déterminé ?';
	@override String get answer => 'Un court contrôle de niveau lors de ta première connexion analyse tes connaissances actuelles. Après cela, l\'IA recommande automatiquement des leçons adaptées à ton niveau.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$fr implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Puis-je parler avec de vraies personnes ?';
	@override String get answer => 'Oui. Les utilisateurs Premium peuvent planifier de courtes sessions de pratique avec de vrais tuteurs.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$fr implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Mes données sont-elles en sécurité ?';
	@override String get answer => 'Absolument. Toutes les conversations et les données des utilisateurs sont stockées de manière cryptée. Tes informations personnelles ne sont jamais partagées avec des tiers.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$fr implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$fr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Comment désactiver les rappels quotidiens ?';
	@override String get answer => 'Va dans les paramètres du profil, ouvre Notifications, et change la fréquence des rappels ou désactive complètement les notifications.';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Notifications',
			'app.streak' => 'Série d\'apprentissage',
			'app.profile' => 'Profil',
			'common.continueLabel' => 'CONTINUER',
			'common.back' => 'RETOUR',
			'common.locked' => 'Verrouillé',
			'common.minutes' => ({required Object value}) => '${value} min',
			'common.close' => 'Fermer',
			'common.getStarted' => 'COMMENCER',
			'common.connectionError' => 'Pas de connexion. Vérifiez votre internet et réessayez.',
			'common.genericError' => 'Quelque chose a mal tourné. Veuillez réessayer.',
			'common.tryAgain' => 'Réessayer',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Page d\'accueil ${current} sur ${total}',
			'onboarding.slide1.title' => 'Parlez avec confiance en semaines — pas en mois',
			'onboarding.slide1.body' => 'Pratiquez de vraies conversations avec l\'IA. Améliorez votre accent, votre confiance et votre fluidité, chaque jour.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Je ne pouvais pas parler anglais avant. Maintenant, je parle tous les jours au travail.',
			'onboarding.slide2.title' => 'Un tuteur privé sans le prix',
			'onboarding.slide2.body' => 'De vraies conversations. Retour instantané.\nPas de planification. Pas de pression.',
			'onboarding.slide2.realTutor' => 'Vrai Tuteur',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / hr',
			'onboarding.slide2.priceLingola' => '\$9.99 / an',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Programmé',
			'onboarding.slide2.anytime' => 'À tout moment',
			'onboarding.slide2.stressful' => 'Stressant',
			'onboarding.slide2.noPressure' => 'Pas de pression',
			'onboarding.slide2.price' => 'Prix',
			'onboarding.slide2.availability' => 'Disponibilité',
			'onboarding.slide2.feeling' => 'Ressenti',
			'onboarding.slide3.title' => 'Un plan d\'apprentissage construit autour de vous',
			'onboarding.slide3.body' => 'Vos objectifs, votre rythme, votre niveau.\nDu débutant au courant — étape par étape.',
			'onboarding.slide3.goal' => 'Objectif',
			'onboarding.slide3.practice' => 'Pratique',
			'onboarding.slide3.progress' => 'Progrès',
			'targetLanguage.title' => 'Sélectionnez la langue que vous souhaitez apprendre',
			'targetLanguage.comingSoon' => 'D\'autres langues arrivent bientôt',
			'targetLanguage.korean' => 'Coréen',
			'targetLanguage.portuguese' => 'Portugais',
			'targetLanguage.portugueseBrazil' => 'Portugais (Brésil)',
			'targetLanguage.german' => 'Allemand',
			'targetLanguage.italian' => 'Italien',
			'targetLanguage.simplifiedChinese' => 'Chinois simplifié',
			'targetLanguage.arabic' => 'Arabe',
			'targetLanguage.turkish' => 'Turc',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Étape ${current} sur ${total}',
			'language.title' => 'De quoi veux-tu parler ?',
			'language.nativeSection' => 'Je parle',
			'language.nativeField' => 'Langue maternelle',
			'language.nativeName' => 'Turc',
			'language.targetSection' => 'Je veux apprendre',
			'language.targetField' => 'Langue cible',
			'language.targetName' => 'Anglais',
			'language.direction' => 'Direction de la langue',
			'language.selectLanguage' => 'Sélectionner la langue',
			'language.comingSoonBadge' => 'Bientôt disponible...',
			'language.english' => 'Anglais',
			'language.french' => 'Français',
			'language.japanese' => 'Japonais',
			'language.spanish' => 'Espagnol',
			'language.russian' => 'Russe',
			'setup.goalTitle' => 'Quel est votre objectif ?',
			'setup.goalCareer' => 'Développement de carrière',
			'setup.goalTravel' => 'Voyager',
			'setup.goalLiving' => 'Vivre à l\'étranger',
			'setup.goalStudying' => 'Étudier à l\'étranger',
			'setup.goalOther' => 'Autre',
			'setup.levelTitle' => 'Quel est votre niveau de langue actuel ?',
			'setup.paceTitle' => 'À quelle vitesse voulez-vous progresser ?',
			'setup.explanationTitle' => 'Quand tu poses des questions dans ta langue, comment expliquer ?',
			'setup.explanationHint' => 'Tu peux changer cela à tout moment dans les paramètres du profil.',
			'setup.explanationNative' => 'Expliquer dans ma langue maternelle',
			'setup.explanationEnglish' => 'Expliquer en anglais',
			'setup.levelA1' => 'A1 — Je connais quelques mots',
			'setup.levelA2' => 'A2 — Je peux utiliser des phrases simples',
			'setup.levelB1' => 'B1 — Je tiens des conversations quotidiennes',
			'setup.levelB2' => 'B2 — Je communique couramment sur des sujets familiers',
			'setup.levelC1' => 'C1 — Avancé, je veux me perfectionner',
			'setup.levelC2' => 'C2 — Maîtrise quasi native',
			'setup.paceMin5' => '5 min/jour',
			'setup.paceMin10' => '10 min/jour',
			'setup.paceMin15' => '15 min/jour',
			'setup.paceMin30' => '30 min/jour',
			'setup.paceMin60' => '60 min/jour',
			'accountCreating.title' => 'Votre compte personnel est en cours de création',
			'accountCreating.stepContent' => 'Le contenu est en cours de création',
			'accountCreating.stepDialogues' => 'Les dialogues sont en cours de préparation',
			'accountCreating.stepLessons' => 'Les leçons sont en cours d\'optimisation',
			'accountCreating.stepPlan' => 'Votre plan est en cours de finalisation',
			'accountCreating.optimization' => 'Optimisation',
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
			'planReady.paceMin5' => '5 min/jour',
			'planReady.paceMin10' => '10 min/jour',
			'planReady.paceMin15' => '15 min/jour',
			'planReady.paceMin30' => '30 min/jour',
			'planReady.paceMin60' => '60 min/jour',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Leçon 1 : Salutations',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Tape un message...',
			'previewChat.incoming1' => 'Salut ! Bienvenue sur Lingola — je suis ton tuteur IA. Peu importe ton niveau : ici tu es en sécurité pour apprendre l\'anglais. En anglais on dit \'Hi\' ou \'Hello\' — essaie : écris-moi \'Hi !\' en anglais !',
			'previewChat.outgoing1' => 'Salut ! Je suis prêt à pratiquer.',
			'previewChat.incoming2Highlight' => 'Bonjour',
			'previewChat.incoming2Rest' => ', Emrah ! Je suis content que tu te sentes prêt. Un café du matin est toujours un excellent moyen de commencer à créer une connexion. De quoi aimerais-tu parler ?',
			'previewChat.holdToSpeak' => 'Maintiens pour parler',
			'previewChat.recording' => 'Enregistrement… relâche pour envoyer',
			'previewChat.slideUpToLock' => 'Glisse vers le haut pour verrouiller',
			'previewChat.slideLeftToCancel' => 'Glisse à gauche pour annuler',
			'previewChat.recordingLockedHint' => 'Appuie sur envoyer quand tu as fini',
			'paywall.title' => 'Commencez à Parler Aujourd\'hui — Gratuit',
			'paywall.subtitle' => 'Opportunités d\'apprentissage illimitées',
			'paywall.noCommitment' => 'Sans engagement',
			'paywall.cancelAnytime' => 'Annulez à tout moment',
			'paywall.noPaymentToday' => 'Pas de paiement aujourd\'hui',
			'paywall.daysFree' => '3 Jours Gratuits',
			'paywall.thenPrice' => 'Puis \$1.99/mois',
			'paywall.trialActive' => 'Essai Gratuit Actif',
			'paywall.payableToday' => 'À Payer Aujourd\'hui',
			'paywall.payableValue' => '3 Jours Gratuits 0.00\$',
			'paywall.paymentDate' => 'Date de paiement : 13 Mars 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Nos formateurs IA diversifiés',
			'auth.title' => 'Commence à parler une nouvelle langue, aujourd\'hui',
			'auth.body' => 'Pratique des conversations réelles avec l\'IA.\nPas de pression. Pas de jugement.',
			'auth.continueGoogle' => 'Continuer avec Google',
			'auth.continueApple' => 'Continuer avec Apple',
			'auth.continueGuest' => 'Continuer en tant qu\'invité',
			'auth.or' => 'ou',
			'auth.alreadyHaveAccount' => 'Vous avez déjà un compte ?',
			'auth.signIn' => 'Se connecter',
			'auth.legal' => 'En vous inscrivant à Lingola, vous acceptez nos Conditions d\'utilisation. Découvrez comment nous traitons vos données dans notre Politique de confidentialité et notre Politique sur les cookies',
			'auth.terms' => 'Conditions d\'utilisation',
			'auth.privacy' => 'Politique de confidentialité',
			'auth.cookies' => 'Politique sur les cookies',
			'nav.home' => 'Accueil',
			'nav.tutor' => 'Tuteur',
			'nav.lesson' => 'Leçon',
			'nav.rolePlay' => 'Jeu de rôle',
			'nav.profile' => 'Profil',
			'home.streakCount' => '2',
			'home.greeting' => 'Bonjour, Jhon',
			'home.todayPractice' => 'Pratique d\'aujourd\'hui',
			'home.continueConversation' => 'Continuer la conversation',
			'home.continueWithTutor' => ({required Object name}) => 'Continuer avec ${name} ou choisir un autre tuteur ?',
			'home.continueSameTutor' => ({required Object name}) => 'Continuer avec ${name}',
			'home.chooseOtherTutor' => 'Choisir un autre tuteur',
			'home.minutesLeft' => ({required Object value}) => '${value} min restantes',
			'home.lessonProgress' => 'Leçon 2 — Salutations',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
			'home.kContinue' => 'Continuer',
			'home.learningPath' => 'A1 - Débutant',
			'home.allLessons' => 'Toutes les leçons',
			'home.introductions' => 'Introductions I',
			'home.greetings' => 'Salutations',
			'home.jobs' => 'Métiers',
			'home.favoriteRoom' => 'Une salle préférée',
			'home.dailyRoutine' => 'Routine quotidienne',
			'home.scroll' => 'Faire défiler',
			'home.liveLesson' => 'Leçon en direct',
			'home.liveLessonSubtitle' => 'Ayez un appel vidéo avec notre tuteur',
			'home.moreTutor' => 'Plus de tuteurs',
			'home.startTalkNow' => 'Commencer à parler maintenant',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adaptatif',
			'home.tagCalm' => 'Calme',
			'home.tagPatient' => 'Patient',
			'home.tagMethodical' => 'Méthodique',
			'home.tagEncouraging' => 'Encourageant',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Plus de fonctionnalités',
			'home.practiceLabel' => 'PRATIQUE',
			'home.wordPractice' => 'Pratique des mots',
			'home.wordPracticeBody' => 'Développez votre vocabulaire dans la langue choisie chaque jour',
			'home.immersiveLabel' => 'IMMERSIF',
			'home.quiz' => 'Quiz',
			'home.quizBodyLine1' => 'Apprenez à travers de vrais',
			'home.quizBodyLine2' => 'exemples en contexte',
			'home.getStarted' => 'Commencer',
			'home.library' => 'Bibliothèque',
			'home.libraryTitle' => 'Apprendre et Économiser',
			'home.learnMore' => 'En savoir plus',
			'home.premium.titleBefore' => 'Le chemin vers ',
			'home.premium.titleHighlight' => 'parler couramment',
			'home.premium.titleAfter' => ' sans peur de faire des erreurs.',
			'home.premium.descriptionBefore' => 'Rejoignez des millions d\'étudiants dans le monde entier. Commencez à briser la barrière de la langue aujourd\'hui — ',
			'home.premium.descriptionHighlight' => 'les 3 premiers jours complètement gratuits.',
			'home.premium.feature1' => 'Tuteur IA accessible 24/7',
			'home.premium.feature2' => 'Accès illimité aux tuteurs privés',
			'home.premium.feature3' => 'Plan de leçon quotidien adapté pour vous',
			'home.premium.priceAmount' => '1,99\$',
			'home.premium.pricePeriod' => '/mo',
			'home.premium.discount' => '40% de réduction avec un achat annuel',
			'home.premium.cta' => 'Commencer',
			'libraryPage.title' => 'Bibliothèque',
			'libraryPage.searchWord' => 'Chercher un mot',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Mot enregistré',
			'libraryPage.savedWordTab' => 'Mots enregistrés',
			'libraryPage.dictionaryTab' => 'Dictionnaire',
			'libraryPage.dictionaryLabel' => 'Dictionnaire',
			'wordPracticePage.title' => 'Pratique des mots',
			'wordPracticePage.turkish' => 'Turc',
			'wordPracticePage.save' => 'Sauvegarder',
			'wordPracticePage.saved' => 'Enregistré',
			'wordPracticePage.listen' => 'Écouter',
			'wordPracticePage.hint' => 'Indice',
			'wordPracticePage.previous' => 'PRÉCÉDENT',
			'wordPracticePage.next' => 'SUIVANT',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'Qu\'est-ce que tu veux améliorer aujourd\'hui ?',
			'quizPage.subtitle' => 'Choisis ton entraînement — ça prend moins de 3 minutes 🚀',
			'quizPage.readingTitle' => 'Lecture',
			'quizPage.readingBody' => 'Compréhension via des articles & des histoires',
			'quizPage.writingTitle' => 'Écriture',
			'quizPage.writingBody' => 'Exercices de grammaire & de vocabulaire',
			'quizPage.speakingTitle' => 'Parole',
			'quizPage.speakingBody' => 'Prononciation via un moteur de parole IA',
			'quizPage.readingTestTitle' => 'Test de Lecture',
			'quizPage.read' => 'Lire',
			'quizPage.listeningHint' => 'Prononce le mot anglais clairement...',
			'quizPage.micPermissionDenied' => 'Le microphone ou la reconnaissance vocale est indisponible.',
			'quizPage.matchSuccess' => 'Super ! Ça correspond au mot.',
			'quizPage.matchFail' => ({required Object heard}) => 'Entendu "${heard}". Essaie encore.',
			'quizPage.successfulTitle' => 'Réussi !',
			'quizPage.successfulBody' => 'Prononciation comme un locuteur natif !',
			'quizPage.failedTitle' => 'Échoué',
			'quizPage.failedBody' => 'C\'était presque ça, donne-lui une autre chance',
			'quizPage.tryAgain' => 'ESSAYE ENCORE',
			'quizPage.writingTestTitle' => 'Test d\'Écriture',
			'quizPage.sourceLanguage' => 'LANGUE SOURCE',
			'quizPage.answer' => 'RÉPONSE',
			'quizPage.writeAnswerHint' => 'Écris ta réponse ici...',
			'quizPage.submit' => 'Soumettre',
			'quizPage.speakingTestTitle' => 'Test de Parole',
			'quizPage.speakingProficiency' => 'Niveau de Parole',
			'quizPage.speakClearlyHint' => 'Parle clairement dans ton microphone :',
			'quizPage.speakUp' => 'Parle Plus Fort',
			'quizPage.recording' => 'Enregistrement...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'QUESTION ${current} DE ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} est en route',
			'placeholder.body' => ({required Object tab}) => 'Nous préparons une expérience ${tab} ciblée pour vous.',
			'tutorPage.title' => 'Tuteur',
			'tutorPage.chatWithLingola' => 'Discuter avec Lingola',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Discuter avec ${name}',
			'tutorPage.chatHistory' => 'Historique des discussions',
			'tutorPage.history' => 'Historique',
			'tutorPage.filter' => 'Filtrer',
			'tutorPage.country' => 'Pays',
			'tutorPage.focus' => 'Focus',
			'tutorPage.moreCountries' => '8+ de plus',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'ENREGISTRER',
			'tutorPage.clearFilter' => 'Supprimer les filtres',
			'tutorPage.startTalkNow' => 'Commencer à discuter maintenant',
			'tutorPage.typeMessage' => 'Tape un message...',
			'tutorPage.speaker' => 'Intervenant',
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
			'tutorPage.tutors.santa' => 'Père Noël',
			'tutorPage.tags.adaptive' => 'Adaptatif',
			'tutorPage.tags.calm' => 'Calme',
			'tutorPage.tags.patient' => 'Patient',
			'tutorPage.tags.organized' => 'Organisé',
			'tutorPage.tags.relaxed' => 'Détendu',
			'tutorPage.tags.methodical' => 'Méthodique',
			'tutorPage.tags.attentive' => 'Attentif',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Curieux',
			'tutorPage.tags.observer' => 'Observateur',
			'tutorPage.tags.ancientKnowledge' => 'Connaissance Ancienne',
			'tutorPage.tags.wise' => 'Sage',
			'tutorPage.tags.clear' => 'Clair',
			'tutorPage.tags.decisive' => 'Décisif',
			'tutorPage.tags.disciplined' => 'Discipliné',
			'tutorPage.tags.smart' => 'Intelligent',
			'tutorPage.tags.analytic' => 'Analytique',
			'tutorPage.tags.cheerful' => 'Joyeux',
			'tutorPage.tags.generous' => 'Généreux',
			'tutorPage.historyPreview1' => 'Salut ! J\'étais sur le point d\'exploser d\'ennui...',
			'tutorPage.historyPreview2' => 'On pratique la commande de nourriture aujourd\'hui ?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'Hier',
			'tutorPage.chat.incoming1' => 'Bonjour ! Je suis content que tu sois prêt à pratiquer aujourd\'hui.',
			'tutorPage.chat.outgoing1' => 'Oui, commençons par les salutations.',
			'tutorPage.chat.incoming2' => 'Parfait. Comment dirais-tu bonjour à un collègue ?',
			'tutorPage.chat.typing' => 'En train d\'écrire',
			'tutorPage.calling.lessonBadge' => 'Leçon 1 : Salutations',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Leçon ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Ennuyé ? J\'ai supprimé ce mot de mon vocabulaire. Lève-toi, le plan est déjà établi : on va ce nouveau bar d\'arcade à Kadıköy.',
			'tutorPage.calling.highlight' => 'Ennuyé ?',
			'tutorPage.calling.close' => 'Mettre fin à l\'appel',
			'tutorPage.calling.toggleCaptions' => 'Basculer les sous-titres',
			'tutorPage.calling.toggleHints' => 'Basculer les indices',
			'tutorPage.calling.toggleMic' => 'Basculer le microphone',
			'tutorPage.calling.tapToSpeakHint' => 'Appuie pour parler, appuie encore pour terminer',
			'lessonPage.title' => 'Continue à apprendre',
			'lessonPage.profile' => 'Profil',
			'lessonPage.language' => 'Langue cible',
			'lessonPage.completed' => 'Terminé',
			'lessonPage.locked' => 'Verrouillé',
			'lessonPage.pickTutorTitle' => 'Choisissez votre tuteur',
			'lessonPage.startTalk' => 'Commencer la leçon',
			'lessonPage.chatInstead' => 'Discuter à la place',
			'lessonPage.lockedHint' => 'Terminez la leçon précédente pour débloquer celle-ci.',
			'lessonPage.levelLockedTitle' => 'Niveau verrouillé',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Votre niveau d\'anglais est ${userLevel} ; vous ne pouvez pas ouvrir les leçons ${lessonLevel} sans terminer le parcours précédent.',
			'lessonPage.levelLockedOk' => 'Compris',
			'lessonPage.notesTitle' => 'Notes de la leçon',
			'lessonPage.whatWeLearned' => 'Ce que nous avons appris aujourd\'hui',
			'lessonPage.deleteNotes' => 'Supprimer mes notes de leçon',
			'lessonPage.deleteNotesConfirm' => 'Supprimer ces notes ? Cela ne peut pas être annulé.',
			'lessonPage.delete' => 'Supprimer',
			'lessonPage.cancel' => 'Annuler',
			'lessonPage.practiceCta' => 'Si cela vous a semblé trop difficile, vous pouvez pratiquer le même sujet à nouveau.',
			'lessonPage.practiceNow' => 'Pratiquer ce sujet',
			'lessonPage.openChat' => 'Ouvrir le chat avec le tuteur',
			'lessonPage.yourScore' => 'Votre score',
			'lessonPage.bestScore' => ({required Object score}) => 'Meilleur ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Participant passif',
			'lessonPage.participationSilentBody' => 'Vous êtes resté silencieux cette fois. Je pense que vous devriez reprendre cette leçon.',
			'lessonPage.participationPassive' => 'Participation faible',
			'lessonPage.participationPassiveBody' => 'Vous avez à peine parlé. Essayez la leçon à nouveau et dites-en plus.',
			'lessonPage.participationActive' => 'Bonne participation',
			'lessonPage.participationActiveBody' => 'Vous avez rejoint la conversation. Continuez comme ça !',
			'lessonPage.participationStrong' => 'Participation forte',
			'lessonPage.participationStrongBody' => 'Vous avez beaucoup parlé. Excellent travail !',
			'lessonPage.retakeLesson' => 'Reprendre cette leçon',
			'lessonPage.finishLesson' => 'Terminer la leçon',
			'lessonPage.savingNotes' => 'Votre tuteur est en train d\'écrire les notes d\'aujourd\'hui...',
			'lessonPage.noNotes' => 'Terminez cette leçon pour obtenir des notes de votre tuteur.',
			'lessonPage.notesDeleted' => 'Notes de la leçon supprimées',
			'lessonPage.levels.a1.title' => 'A1 - Débutant',
			'lessonPage.levels.a1.lessons.0' => 'Salutations',
			'lessonPage.levels.a1.lessons.1' => 'Introductions I',
			'lessonPage.levels.a1.lessons.2' => 'Métiers',
			'lessonPage.levels.a1.lessons.3' => 'Une pièce préférée',
			'lessonPage.levels.a1.lessons.4' => 'Routine quotidienne',
			'lessonPage.levels.a1.lessons.5' => 'Fruits',
			'lessonPage.levels.a1.lessons.6' => 'Conseils 1',
			'lessonPage.levels.a1.lessons.7' => 'Famille 1',
			'lessonPage.levels.a1.lessons.8' => 'Choses du quotidien',
			'lessonPage.levels.a1.lessons.9' => 'Ville natale',
			'lessonPage.levels.a1.lessons.10' => 'Maison',
			'lessonPage.levels.a1.lessons.11' => 'Préférences alimentaires',
			'lessonPage.levels.a1.lessons.12' => 'Loisirs 1',
			'lessonPage.levels.a1.lessons.13' => 'Personnes réussies',
			'lessonPage.levels.a1.lessons.14' => 'Nourriture et boissons',
			'lessonPage.levels.a1.lessons.15' => 'Commander au restaurant',
			'lessonPage.levels.a1.lessons.16' => 'Animaux de compagnie',
			'lessonPage.levels.a1.lessons.17' => 'Santé et fitness',
			'lessonPage.levels.a1.lessons.18' => 'Météo',
			'lessonPage.levels.a1.lessons.19' => 'Nouveau mode de vie',
			'lessonPage.levels.a1.lessons.20' => 'S\'améliorer',
			'lessonPage.levels.a1.lessons.21' => 'Loisirs 2',
			'lessonPage.levels.a1.lessons.22' => 'Questions sur les lieux',
			'lessonPage.levels.a1.lessons.23' => 'Possession',
			'lessonPage.levels.a1.lessons.24' => 'Shopping 1',
			'lessonPage.levels.a1.lessons.25' => 'Dire l\'heure',
			'lessonPage.levels.a1.lessons.26' => 'Directions 1',
			'lessonPage.levels.a1.lessons.27' => 'Shopping 2',
			'lessonPage.levels.a1.lessons.28' => 'Faire connaissance',
			'lessonPage.levels.a1.lessons.29' => 'Lieux d\'objets',
			'lessonPage.levels.a1.lessons.30' => 'Apparences',
			'lessonPage.levels.a1.lessons.31' => 'Directions 2',
			'lessonPage.levels.a2.title' => 'A2 - Basique',
			'lessonPage.levels.a2.lessons.0' => 'Famille 2',
			'lessonPage.levels.a2.lessons.1' => 'Personnes et lieux',
			'lessonPage.levels.a2.lessons.2' => 'Famille 3',
			'lessonPage.levels.a2.lessons.3' => 'Décrire des objets',
			'lessonPage.levels.a2.lessons.4' => 'Ville',
			'lessonPage.levels.a2.lessons.5' => 'Le projet de construction',
			'lessonPage.levels.a2.lessons.6' => 'Chez soi',
			'lessonPage.levels.a2.lessons.7' => 'Quelle heure est-il',
			'lessonPage.levels.a2.lessons.8' => 'Routine quotidienne 2',
			'lessonPage.levels.a2.lessons.9' => 'Temps libre',
			'lessonPage.levels.a2.lessons.10' => 'Nourriture et nutrition',
			'lessonPage.levels.a2.lessons.11' => 'Shopping et consommation',
			'lessonPage.levels.a2.lessons.12' => 'Vacances',
			'lessonPage.levels.a2.lessons.13' => 'Plans du week-end',
			'lessonPage.levels.a2.lessons.14' => 'Formel ou décontracté',
			'lessonPage.levels.a2.lessons.15' => 'Mode',
			'lessonPage.levels.a2.lessons.16' => 'Shopping 3',
			'lessonPage.levels.a2.lessons.17' => 'Conseils 2',
			'lessonPage.levels.a2.lessons.18' => 'Tu peux le faire',
			'lessonPage.levels.a2.lessons.19' => 'Shopping 4',
			'lessonPage.levels.a2.lessons.20' => 'Petits bavardages',
			'lessonPage.levels.a2.lessons.21' => 'Un latte s\'il vous plaît',
			'lessonPage.levels.a2.lessons.22' => 'Nourriture',
			'lessonPage.levels.a2.lessons.23' => 'Se déplacer',
			'lessonPage.levels.a2.lessons.24' => 'Prêt pour un voyage',
			'lessonPage.levels.a2.lessons.25' => 'Voyage 1',
			'lessonPage.levels.a2.lessons.26' => 'Évasions urbaines',
			'lessonPage.levels.a2.lessons.27' => 'Voyage 2',
			'lessonPage.levels.a2.lessons.28' => 'Un endroit où séjourner',
			'lessonPage.levels.a2.lessons.29' => 'Tellement excitant',
			'lessonPage.levels.a2.lessons.30' => 'La bonne personne',
			'lessonPage.levels.a2.lessons.31' => 'École',
			'lessonPage.levels.a2.lessons.32' => 'Préférences musicales',
			'lessonPage.levels.a2.lessons.33' => 'Sports',
			'lessonPage.levels.a2.lessons.34' => 'Règles de la course',
			'lessonPage.levels.a2.lessons.35' => 'Laisser un message',
			'lessonPage.levels.a2.lessons.36' => 'Demandes',
			'lessonPage.levels.a2.lessons.37' => 'Invitations',
			'lessonPage.levels.a2.lessons.38' => 'Expériences de voyage',
			'lessonPage.levels.a2.lessons.39' => 'Passé 1',
			'lessonPage.levels.a2.lessons.40' => 'Passé 2',
			'lessonPage.levels.a2.lessons.41' => 'Passé 3',
			'lessonPage.levels.a2.lessons.42' => 'Questions sur le passé',
			'lessonPage.levels.a2.lessons.43' => 'On n\'est jamais trop vieux',
			'lessonPage.levels.a2.lessons.44' => 'Souvenirs d\'enfance',
			'lessonPage.levels.a2.lessons.45' => 'Compliments',
			'lessonPage.levels.a2.lessons.46' => 'Excuses',
			'lessonPage.levels.a2.lessons.47' => 'C\'est tellement ennuyeux !',
			'lessonPage.levels.a2.lessons.48' => 'Un monde numérique',
			'lessonPage.levels.a2.lessons.49' => 'Vie professionnelle',
			'lessonPage.levels.a2.lessons.50' => 'Je n\'ai pas compris ça',
			'lessonPage.levels.a2.lessons.51' => 'Économiser ou dépenser ?',
			'lessonPage.levels.a2.lessons.52' => 'Dire désolé',
			'lessonPage.levels.b1.title' => 'B1 - Intermédiaire',
			'lessonPage.levels.b1.lessons.0' => 'Traditions culturelles',
			'lessonPage.levels.b1.lessons.1' => 'Célébrités',
			'lessonPage.levels.b1.lessons.2' => 'Art et créativité',
			'lessonPage.levels.b1.lessons.3' => 'Plans futurs',
			'lessonPage.levels.b1.lessons.4' => 'Planification d\'événements',
			'lessonPage.levels.b1.lessons.5' => 'Objectifs et projets',
			'lessonPage.levels.b1.lessons.6' => 'Événements historiques',
			'lessonPage.levels.b1.lessons.7' => 'Technologie',
			'lessonPage.levels.b1.lessons.8' => 'Jamais de la vie',
			'lessonPage.levels.b1.lessons.9' => 'Qu\'est-ce qui se passe',
			'lessonPage.levels.b1.lessons.10' => 'Vacances de rêve',
			'lessonPage.levels.b1.lessons.11' => 'Médias sociaux',
			'lessonPage.levels.b1.lessons.12' => 'Recommandations de livres',
			'lessonPage.levels.b1.lessons.13' => 'Un de ces jours',
			'lessonPage.levels.b1.lessons.14' => 'Photos spéciales',
			'lessonPage.levels.b1.lessons.15' => 'Réalisations personnelles',
			'lessonPage.levels.b1.lessons.16' => 'Films préférés',
			'lessonPage.levels.b1.lessons.17' => 'Flash info',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.b1.lessons.18' => 'Bonheur',
			'lessonPage.levels.b1.lessons.19' => 'Une semaine chargée',
			'lessonPage.levels.b1.lessons.20' => 'Là où j\'ai grandi',
			'lessonPage.levels.b1.lessons.21' => 'Jours d\'école',
			'lessonPage.levels.b1.lessons.22' => 'Profils',
			'lessonPage.levels.b1.lessons.23' => 'Cartes de vie',
			'lessonPage.levels.b1.lessons.24' => 'Quotidien',
			'lessonPage.levels.b1.lessons.25' => 'Qu\'est-ce qui vient ensuite',
			'lessonPage.levels.b1.lessons.26' => 'Faire des suggestions',
			'lessonPage.levels.b1.lessons.27' => 'Que s\'est-il passé',
			'lessonPage.levels.b1.lessons.28' => 'Souvenirs',
			'lessonPage.levels.b1.lessons.29' => 'Choc culturel',
			'lessonPage.levels.b1.lessons.30' => 'Phrases d\'intérêt',
			'lessonPage.levels.b1.lessons.31' => 'Entretiens d\'embauche',
			'lessonPage.levels.b1.lessons.32' => 'Listes de souhaits',
			'lessonPage.levels.b1.lessons.33' => 'Ma ville idéale',
			'lessonPage.levels.b1.lessons.34' => 'La génération Internet',
			'lessonPage.levels.b1.lessons.35' => 'Marques populaires',
			'lessonPage.levels.b1.lessons.36' => 'Phrases d\'opinion',
			'lessonPage.levels.b1.lessons.37' => 'À quoi ça ressemble',
			'lessonPage.levels.b1.lessons.38' => 'Espace de vie',
			'lessonPage.levels.b1.lessons.39' => 'Bien manger',
			'lessonPage.levels.b1.lessons.40' => 'Hobbies inhabituels',
			'lessonPage.levels.b1.lessons.41' => 'Un choix difficile',
			'lessonPage.levels.b1.lessons.42' => 'Passer à l\'action',
			'lessonPage.levels.b1.lessons.43' => 'Nouvelles compétences',
			'lessonPage.levels.b1.lessons.44' => 'Faire une réclamation',
			'lessonPage.levels.b1.lessons.45' => 'Éducation',
			'lessonPage.levels.b1.lessons.46' => 'Villes vertes',
			'lessonPage.levels.b1.lessons.47' => 'Qu\'est-ce qu\'il y a dans un emploi',
			'lessonPage.levels.b1.lessons.48' => 'Défis personnels',
			'lessonPage.levels.b1.lessons.49' => 'Phrases d\'entretien',
			'lessonPage.levels.b1.lessons.50' => 'Fin polie',
			'lessonPage.levels.b1.lessons.51' => 'Actualités de dernière minute',
			'lessonPage.levels.b1.lessons.52' => 'Petits changements',
			'lessonPage.levels.b1.lessons.53' => 'Excuses d\'excuses',
			'lessonPage.levels.b1.lessons.54' => 'Étiquette téléphonique',
			'lessonPage.levels.b1.lessons.55' => 'Désolé d\'interrompre…',
			'lessonPage.levels.b1.lessons.56' => 'Réponses aux plaintes',
			'lessonPage.levels.b2.title' => 'B2 - Intermédiaire Supérieur',
			'lessonPage.levels.b2.lessons.0' => 'Personnalités',
			'lessonPage.levels.b2.lessons.1' => 'Grands leaders',
			'lessonPage.levels.b2.lessons.2' => 'Mode de vie sain',
			'lessonPage.levels.b2.lessons.3' => 'Quelle est la vérité ?',
			'lessonPage.levels.b2.lessons.4' => 'Croissance personnelle',
			'lessonPage.levels.b2.lessons.5' => 'S\'exprimer',
			'lessonPage.levels.b2.lessons.6' => 'Jouer un rôle ?',
			'lessonPage.levels.b2.lessons.7' => 'Je me souviens...',
			'lessonPage.levels.b2.lessons.8' => 'Retour social',
			'lessonPage.levels.b2.lessons.9' => 'Scène de crime',
			'lessonPage.levels.b2.lessons.10' => 'Problèmes polis',
			'lessonPage.levels.b2.lessons.11' => 'Résolution de conflits',
			'lessonPage.levels.b2.lessons.12' => 'Aimez-le ou détestez-le ?',
			'lessonPage.levels.b2.lessons.13' => 'Problèmes environnementaux',
			'lessonPage.levels.b2.lessons.14' => 'Nous pouvons le résoudre',
			'lessonPage.levels.b2.lessons.15' => 'Mystères et crimes',
			'lessonPage.levels.b2.lessons.16' => 'Futurs possibles',
			'lessonPage.levels.b2.lessons.17' => 'Plans d\'affaires',
			'lessonPage.levels.b2.lessons.18' => 'Décisions de réunion',
			'lessonPage.levels.b2.lessons.19' => 'C\'est tellement prévisible...',
			'lessonPage.levels.b2.lessons.20' => 'Au travail',
			'lessonPage.levels.b2.lessons.21' => 'Science et technologie',
			'lessonPage.levels.b2.lessons.22' => 'Gestion du temps',
			'lessonPage.levels.b2.lessons.23' => 'Droits de l\'homme',
			'lessonPage.levels.c1.title' => 'C1 - Avancé',
			'lessonPage.levels.c1.lessons.0' => 'Normes culturelles',
			'lessonPage.levels.c1.lessons.1' => 'Influence des réseaux sociaux',
			'lessonPage.levels.c1.lessons.2' => 'Choix de carrière',
			'lessonPage.levels.c1.lessons.3' => 'Accélérer la performance',
			'lessonPage.levels.c1.lessons.4' => 'Inventions',
			'lessonPage.levels.c1.lessons.5' => 'Voyage dans le temps',
			'lessonPage.levels.c1.lessons.6' => 'Possessions',
			'lessonPage.levels.c1.lessons.7' => 'Compétences professionnelles',
			'lessonPage.levels.c1.lessons.8' => 'Changements historiques',
			'lessonPage.levels.c1.lessons.9' => 'Rédaction de critiques',
			'lessonPage.levels.c1.lessons.10' => 'Mystères',
			'lessonPage.levels.c1.lessons.11' => 'Théories étranges',
			'lessonPage.levels.c1.lessons.12' => 'Célébrité',
			'lessonPage.levels.c1.lessons.13' => 'Politique mondiale',
			'lessonPage.levels.c1.lessons.14' => 'Essor des produits',
			'lessonPage.levels.c1.lessons.15' => 'Sera-t-il heureux ?',
			'lessonPage.levels.c1.lessons.16' => 'Peut-être plus tard...',
			'lessonPage.levels.c1.lessons.17' => 'Nouvelles solutions',
			'lessonPage.levels.c1.lessons.18' => 'Influence contextuelle',
			'lessonPage.levels.c1.lessons.19' => 'Un logo perdu',
			'lessonPage.levels.c1.lessons.20' => 'Actes de gentillesse',
			'lessonPage.levels.c1.lessons.21' => 'Quel film',
			'lessonPage.levels.c1.lessons.22' => 'Comme c\'est ennuyeux',
			'lessonPage.levels.c1.lessons.23' => 'Dans les nouvelles',
			'lessonPage.levels.c2.title' => 'C2 - Expert',
			'lessonPage.levels.c2.lessons.0' => 'Mondialisation',
			'lessonPage.levels.c2.lessons.1' => 'Catastrophes naturelles',
			'lessonPage.levels.c2.lessons.2' => 'Réagir à l\'information',
			'lessonPage.levels.c2.lessons.3' => 'Équilibre travail-vie personnelle',
			'lessonPage.levels.c2.lessons.4' => 'Télétravail',
			'lessonPage.levels.c2.lessons.5' => 'Problèmes familiaux',
			'lessonPage.levels.c2.lessons.6' => 'Anatomie humaine de base',
			'lessonPage.levels.c2.lessons.7' => 'Prédictions de santé',
			'lessonPage.levels.c2.lessons.8' => 'Accès aux soins de santé',
			'lessonPage.levels.c2.lessons.9' => 'Expérience de voyage à l\'étranger',
			'lessonPage.levels.c2.lessons.10' => 'Super pouvoirs',
			'lessonPage.levels.c2.lessons.11' => 'Cohésion d\'équipe',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescence',
			'lessonPage.levels.c2.lessons.13' => 'Dilemmes',
			'lessonPage.levels.c2.lessons.14' => 'Enthousiasme social',
			'lessonPage.levels.c2.lessons.15' => 'Changements',
			'lessonPage.levels.c2.lessons.16' => 'Travail, travail, travail',
			'lessonPage.levels.c2.lessons.17' => 'Problèmes locaux',
			'lessonPage.levels.c2.lessons.18' => 'Problèmes, problèmes',
			'lessonPage.levels.c2.lessons.19' => 'Fait ou fiction ?',
			'lessonPage.levels.c2.lessons.20' => 'Visites touristiques',
			'lessonPage.levels.c2.lessons.21' => 'Bénévolat',
			'lessonPage.levels.c2.lessons.22' => 'L\'œil de l\'esprit',
			'lessonPage.levels.c2.lessons.23' => 'Consommation des médias',
			'rolePlayPage.title' => 'Jeu de Rôle',
			'rolePlayPage.subtitle' => 'Choisissez votre rôle — vivez un scénario réel 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} complété',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Débutant',
			'rolePlayPage.screenplay' => 'SCÉNARIO',
			'rolePlayPage.dailyInteractions' => 'Interactions Quotidiennes',
			'rolePlayPage.business' => 'Affaires',
			'rolePlayPage.coffee.title' => 'Commander au Café',
			'rolePlayPage.coffee.screenplay' => 'Commandez votre boisson préférée, demandez des tailles et des extras, confirmez votre total et récupérez votre café au comptoir.',
			'rolePlayPage.coffee.chat.briefing' => 'Salut ! Aujourd\'hui, nous allons pratiquer la commande dans un café — salutations, tailles, extras. Je vais d\'abord expliquer un peu, puis nous allons jouer. Ça te va ?',
			'rolePlayPage.coffee.chat.incoming1' => 'Bienvenue ! Que puis-je vous servir aujourd\'hui ?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Salut ! Je voudrais un latte moyen, s\'il vous plaît.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Bien sûr',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Voulez-vous cela chaud ou glacé, et des extras ?',
			'rolePlayPage.coffee.chat.botReply' => 'Excellente choix. Autre chose avec votre commande ?',
			'rolePlayPage.directions.title' => 'Demander des Directions dans la Rue',
			'rolePlayPage.directions.screenplay' => 'Demandez des directions pour un endroit, découvrez comment aller au métro ou au bus, obtenez des informations sur les billets et écoutez des recommandations de restaurants.',
			'rolePlayPage.directions.chat.briefing' => 'Salut ! Aujourd\'hui, nous allons pratiquer la demande de directions dans la rue. Je vais d\'abord expliquer un peu, puis nous allons jouer. Ça te va ?',
			'rolePlayPage.directions.chat.incoming1' => 'Salut ! Tu as l\'air un peu perdu — besoin d\'aide pour trouver quelque chose ?',
			'rolePlayPage.directions.chat.outgoing1' => 'Oui, je cherche la station de métro la plus proche.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Bien sûr',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Marchez deux pâtés de maisons dans cette direction, puis tournez à gauche. Vous verrez l\'entrée.',
			'rolePlayPage.directions.chat.botReply' => 'De rien ! Voulez-vous aussi un conseil de restaurant près de la station ?',
			'rolePlayPage.interview.title' => 'Entretien d\'Embauche',
			'rolePlayPage.interview.screenplay' => 'Présentez-vous, répondez aux questions courantes d\'entretien, parlez de votre expérience et posez des questions sur le poste et les prochaines étapes.',
			'rolePlayPage.interview.chat.briefing' => 'Salut ! Aujourd\'hui, nous allons pratiquer un entretien d\'embauche. Je vais d\'abord expliquer un peu, puis nous allons jouer — je vais vous interviewer, puis nous échangeons. Ça te va ?',
			'rolePlayPage.interview.chat.incoming1' => 'Merci d\'être venu aujourd\'hui. Pourriez-vous vous présenter brièvement ?',
			'rolePlayPage.interview.chat.outgoing1' => 'Bien sûr. Je suis ravi d\'être ici et de partager mon expérience.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Merveilleux',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Parlez-moi d\'un projet récent dont vous êtes fier.',
			'rolePlayPage.interview.chat.botReply' => 'C\'est impressionnant. Quelles questions avez-vous sur le poste ?',
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
			'rolePlayPage.deleteFailed' => 'Impossible de supprimer le scénario. Réessaie.',
			'notificationsPage.title' => 'Notifications',
			'notificationsPage.deleteConfirmTitle' => 'Êtes-vous sûr ?',
			'notificationsPage.deleteConfirmBody' => 'Cette notification sera supprimée.',
			'notificationsPage.delete' => 'Supprimer',
			'notificationsPage.cancel' => 'Annuler',
			'notificationsPage.translation.title' => 'Nouvelle traduction prête',
			'notificationsPage.translation.body' => 'Votre fichier de traduction audio a été converti avec succès en texte et traduit.',
			'notificationsPage.offer.title' => 'Une offre spéciale vous attend',
			'notificationsPage.offer.body' => 'Passez à Premium pour des traductions de photos illimitées avec 50 % de réduction.',
			'notificationsPage.stories.title' => 'Découvrez de nouvelles histoires',
			'notificationsPage.stories.body' => 'Apprenez de nouveaux mots à travers des histoires',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Pas encore de notifications',
			'notificationsPage.emptySubtitle' => 'N\'oubliez pas de revenir vérifier lorsque vous recevrez une notification.',
			'profilePage.title' => 'Profil',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Version Gratuite',
			'profilePage.dayStreak' => 'Série de Jours !',
			'profilePage.accountSettings' => 'Paramètres du Compte',
			'profilePage.general' => 'Général',
			'profilePage.profileSettings' => 'Paramètres du Profil',
			'profilePage.fullName' => 'Nom Complet',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Supprimer le Compte',
			'profilePage.save' => 'ENREGISTRER',
			'profilePage.deleteTitle' => 'Nous ne voulons pas que tu partes, mais nous comprenons.',
			'profilePage.deleteBody' => 'Peux-tu nous dire pourquoi tu souhaites nous quitter pour améliorer l\'expérience Lingola ?',
			'profilePage.deleteReasons.aiCharacters' => 'Je n\'ai pas trouvé les personnages d\'IA réalistes.',
			'profilePage.deleteReasons.videoIssues' => 'J\'ai des problèmes techniques lors des appels vidéo.',
			'profilePage.deleteReasons.pricing' => 'Les prix d\'abonnement dépassent mes attentes.',
			'profilePage.deleteReasons.noMatch' => 'Je n\'ai pas trouvé de personnages dans le style que je recherche.',
			'profilePage.deleteReasons.shortTrial' => 'Je voulais juste essayer pour une courte période.',
			'profilePage.deleteReasons.other' => 'Autre',
			'profilePage.messageOptional' => 'Message (optionnel)',
			'profilePage.messageHint' => 'Si tu as un message, n\'hésite pas à l\'écrire.',
			'profilePage.next' => 'SUIVANT',
			'profilePage.specialOfferTitle' => 'Offre Spéciale',
			'profilePage.specialOfferBody' => 'Avant de partir, jette un œil à l\'offre que nous avons préparée pour toi.',
			'profilePage.monthlyPlanTitle' => 'Passer au Plan de 1 Mois',
			'profilePage.monthlyPlanPrice' => '\$79/mois, annule à tout moment',
			'profilePage.monthlyPlanDesc' => 'Pas d\'engagement à long terme. Reste connecté avec notre communauté sur une base mensuelle.',
			'profilePage.whatYoullKeep' => 'Ce que tu vas garder :',
			'profilePage.keepCharacters' => 'Accès à tous les personnages',
			'profilePage.keepVideo' => 'Appels vidéo illimités',
			'profilePage.keepCourses' => 'Accès à tous les cours',
			'profilePage.switchMonthlyCta' => 'Passer au Plan Mensuel',
			'profilePage.confirmTitle' => 'Es-tu sûr ?',
			'profilePage.confirmBody' => 'Nous ne voulons vraiment pas te voir partir. Voici ce que tu vas perdre :',
			'profilePage.loseCharacters' => 'Accès illimité aux personnages',
			'profilePage.loseVideo' => 'Accès illimité aux appels vidéo',
			'profilePage.loseCourses' => 'Accès à tous les cours',
			'profilePage.discountTitle' => 'Reste et obtient 60% de réduction pendant 1 mois',
			'profilePage.discountSubtitle' => 'Notre meilleure offre jamais. Juste \$27.60/mois',
			'profilePage.acceptDiscountCta' => 'Accepter 60% de Réduction & Rester',
			'profilePage.farewellTitle' => 'Nous sommes tristes de te voir partir',
			'profilePage.farewellBody' => ({required Object date}) => 'Ton abonnement a été annulé. Tu auras accès jusqu\'à la fin de ta période de facturation actuelle le ${date}.',
			'profilePage.changeMindTitle' => '✨ Tu changes d\'avis ?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Tu peux réactiver ton abonnement à tout moment avant le ${date} pour garder tes avantages.',
			'profilePage.reactivateCta' => 'Attends, je veux réactiver',
			'profilePage.done' => 'FAIT',
			'profilePage.notifications' => 'Notifications',
			'profilePage.appLanguage' => 'Langue de l\'App',
			'profilePage.explanationLanguage' => 'Langue d\'explication',
			'profilePage.explanationNative' => 'Langue maternelle',
			'profilePage.explanationEnglish' => 'Anglais',
			'profilePage.explanationUpdateFailed' => 'Impossible de mettre à jour la langue d\'explication',
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
			'profilePage.remindMe' => 'Me rappeler',
			'profilePage.reminderSave' => 'Enregistrer',
			'profilePage.reminderSaved' => 'Rappel enregistré',
			'profilePage.selectLanguageTitle' => 'Sélectionner la Langue',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passif',
			'profilePage.active' => 'Actif',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Partager avec un Ami',
			'profilePage.shareWithFriendTitle' => 'Partager avec un Ami',
			'profilePage.shareInviteBody' => 'Invite tes amis et profitez de la traduction ensemble',
			'profilePage.rateUs' => 'Évalue-nous',
			'profilePage.faq' => 'FAQ Lingola',
			'profilePage.faqItems.supportedLanguages.question' => 'Quelles langues l\'application prend-elle en charge ?',
			'profilePage.faqItems.supportedLanguages.answer' => 'L\'interface Lingola est disponible en anglais, allemand, italien, français, turc, japonais, espagnol, russe, hindi, portugais et chinois simplifié.',
			'profilePage.faqItems.howAiWorks.question' => 'Comment fonctionne l\'IA ?',
			'profilePage.faqItems.howAiWorks.answer' => 'L\'IA interagit avec toi comme un vrai tuteur. Elle analyse tes conversations, détecte les erreurs et offre des retours personnalisés en fonction de tes progrès.',
			'profilePage.faqItems.offlineUse.question' => 'Puis-je utiliser l\'application hors ligne ?',
			'profilePage.faqItems.offlineUse.answer' => 'Oui. Tu peux télécharger certaines leçons et scénarios de conversation à l\'avance et les utiliser hors ligne. Cependant, le chat en direct nécessite une connexion Internet.',
			'profilePage.faqItems.isFree.question' => 'L\'application est-elle gratuite ?',
			'profilePage.faqItems.isFree.answer' => 'La version de base est gratuite. Avec Premium, tu obtiens des scénarios de chat avancés, une analyse de prononciation et un mode tuteur personnel.',
			'profilePage.faqItems.pronunciationEval.question' => 'Comment ma prononciation est-elle évaluée ?',
			'profilePage.faqItems.pronunciationEval.answer' => 'L\'application analyse ta voix et utilise la reconnaissance vocale alimentée par l\'IA pour évaluer ton accent et ta prononciation. Les mots que tu dois améliorer sont mis en évidence.',
			'profilePage.faqItems.dailyPractice.question' => 'Dois-je pratiquer tous les jours ?',
			'profilePage.faqItems.dailyPractice.answer' => 'Oui. Le système suit tes progrès chaque jour. Juste 10 à 15 minutes de pratique orale par jour peuvent accélérer considérablement ton apprentissage des langues.',
			'profilePage.faqItems.levelDetermination.question' => 'Comment mon niveau d\'apprentissage est-il déterminé ?',
			'profilePage.faqItems.levelDetermination.answer' => 'Un court contrôle de niveau lors de ta première connexion analyse tes connaissances actuelles. Après cela, l\'IA recommande automatiquement des leçons adaptées à ton niveau.',
			'profilePage.faqItems.realPeopleChat.question' => 'Puis-je parler avec de vraies personnes ?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Oui. Les utilisateurs Premium peuvent planifier de courtes sessions de pratique avec de vrais tuteurs.',
			'profilePage.faqItems.dataSecurity.question' => 'Mes données sont-elles en sécurité ?',
			'profilePage.faqItems.dataSecurity.answer' => 'Absolument. Toutes les conversations et les données des utilisateurs sont stockées de manière cryptée. Tes informations personnelles ne sont jamais partagées avec des tiers.',
			'profilePage.faqItems.disableReminders.question' => 'Comment désactiver les rappels quotidiens ?',
			'profilePage.faqItems.disableReminders.answer' => 'Va dans les paramètres du profil, ouvre Notifications, et change la fréquence des rappels ou désactive complètement les notifications.',
			'profilePage.support' => 'Support',
			'profilePage.feedback' => 'Retour d\'Information',
			'profilePage.progression' => 'Progression',
			'profilePage.progressTitle' => 'Progrès',
			'profilePage.goodMorning' => 'Bonjour,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'Anglais',
			'profilePage.past7Days' => '7 Derniers Jours',
			'profilePage.past7DaysBody' => 'Étudie chaque jour pour construire ta série et créer une habitude d\'apprentissage puissante.',
			'profilePage.currentLevel' => 'Niveau Actuel',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Il te reste juste ${xp} XP pour atteindre le niveau ${level} !',
			'profilePage.toNextLevel' => 'VERS LE NIVEAU SUIVANT',
			'profilePage.dayStreakLabel' => 'Série de Jours',
			'profilePage.totalPoints' => 'Points Totaux',
			'profilePage.savedWords' => 'Mots Enregistrés',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} éléments à réviser',
			'profilePage.logout' => 'Se Déconnecter',
			'profilePage.logoutTitle' => 'Tu es sur le point de te déconnecter',
			'profilePage.logoutBody' => 'À bientôt ! Tes exercices de respiration vont nous manquer.',
			'profilePage.logoutConfirm' => 'DÉCONNEXION',
			'profilePage.logoutCancel' => 'ANNULER',
			'profilePage.days.mon' => 'LUN',
			'profilePage.days.tue' => 'MAR',
			'profilePage.days.wed' => 'MER',
			'profilePage.days.thu' => 'JEU',
			'profilePage.days.fri' => 'VEN',
			'profilePage.days.sat' => 'SAM',
			'profilePage.days.sun' => 'DIM',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Votre certificat',
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
			'profilePage.certificateVerifyHint' => 'Tout le monde peut scanner le code QR pour vérifier votre réussite.',
			'profilePage.certificateShare' => 'Partager le certificat',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'Certificat verrouillé',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'Vous ne pouvez pas encore utiliser ce certificat car vous n\'avez pas terminé vos leçons ${level}.',
			'profilePage.certificateNotAvailableOk' => 'Compris',
			'profilePage.certificateShareQr' => 'Partager le code QR',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Lorsque vous terminerez un niveau CEFR sur Lingola, votre certificat apparaîtra ici — avec votre nom, votre niveau et un code QR à scanner pour vérifier.',
			'profilePage.certificatePreviewHint' => 'Terminez un parcours de niveau pour débloquer votre certificat',
			'profilePage.certificateTapToView' => 'Appuyez pour voir et partager votre certificat',
			'profilePage.settings' => 'Paramètres',
			'profilePage.dailyGoalValueLight' => '5-10 min/jour',
			'profilePage.dailyGoalValueRecommended' => '15-20 min/jour',
			'profilePage.dailyGoalValueFast' => '30+ min/jour',
			'profilePage.settingsShare' => 'Share',
			'profilePage.settingsSupport' => 'Support',
			'profilePage.settingsAbout' => 'About',
			'profilePage.settingsAccount' => 'Account',
			'profilePage.followInstagram' => 'Follow on Instagram',
			'profilePage.followTikTok' => 'Follow on TikTok',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'On dirait que vous avez pris une petite pause.',
			'pushNotifications.h2.1' => 'Avez-vous un moment pour un mot ?',
			'pushNotifications.h2.2' => 'Nous sommes là — pas de précipitation.',
			'pushNotifications.h2.3' => 'Votre rythme d\'apprentissage a fait une pause.',
			'pushNotifications.h2.4' => 'Une petite révision pourrait être agréable.',
			'pushNotifications.h4.0' => 'Un nouveau mot pourrait vous attendre aujourd\'hui 👀',
			'pushNotifications.h4.1' => 'Vous pourriez apprécier une pratique rapide.',
			'pushNotifications.h4.2' => 'Vous avez peut-être manqué une phrase utile.',
			'pushNotifications.h4.3' => 'Les progrès d\'aujourd\'hui sont toujours ouverts.',
			'pushNotifications.h4.4' => 'Un mot, une phrase… peut-être les deux.',
			'pushNotifications.h8.0' => 'Pas besoin de progresser chaque jour.',
			'pushNotifications.h8.1' => 'Même une petite révision compte.',
			'pushNotifications.h8.2' => 'Vous n\'avez rien perdu en ne révisant pas aujourd\'hui.',
			'pushNotifications.h8.3' => 'Nous sommes prêts quand vous l\'êtes.',
			'pushNotifications.h8.4' => 'Apprendre une langue est un marathon, pas un sprint.',
			'pushNotifications.h24.0' => 'Une journée est passée. Vos mots sont toujours là.',
			'pushNotifications.h24.1' => 'Prendre une pause est normal.',
			'pushNotifications.h24.2' => 'Votre place est exactement là où vous l\'avez laissée.',
			'pushNotifications.h24.3' => 'Continuez quand vous le souhaitez.',
			'pushNotifications.h24.4' => 'La langue ne s\'enfuira pas — nous non plus.',
			'pushNotifications.lessonReminderTitle' => 'La leçon du jour t\'attend',
			'pushNotifications.lessonReminder.0' => 'Tu n\'as pas encore fait la leçon — 5 minutes suffisent.',
			'pushNotifications.lessonReminder.1' => 'Ton tuteur est prêt. Reprends où tu t\'es arrêté.',
			'pushNotifications.lessonReminder.2' => 'Une courte leçon garde le rythme.',
			'pushNotifications.lessonReminder.3' => 'La leçon du jour est encore ouverte — on commence ?',
			'pushNotifications.quizReminderTitle' => 'Prêt pour un quiz rapide ?',
			'pushNotifications.quizReminderWords' => ({required Object count, required Object savedCount}) => 'Tu as appris ${count} mots récemment — un quiz ? ${savedCount} mots sauvegardés t\'attendent.',
			'pushNotifications.quizReminderSaved' => ({required Object savedCount}) => '${savedCount} mots sauvegardés attendent une révision.',
			'pushNotifications.quizReminder.0' => 'Pas de quiz depuis un moment — 3 minutes de révision.',
			'pushNotifications.quizReminder.1' => 'Tes mots sauvegardés t\'attendent.',
			'pushNotifications.quizReminder.2' => 'Teste ce que tu retiens — quelques minutes.',
			'pushNotifications.quizReminder.3' => 'Un court quiz maintenant aide demain.',
			'pushNotifications.eveningLessonTitle' => 'Ne manque pas la pratique du jour',
			'pushNotifications.eveningLesson.0' => 'Tu n\'as pas encore étudié aujourd\'hui.',
			'pushNotifications.eveningLesson.1' => 'Avant la fin de la journée — une leçon rapide ?',
			'pushNotifications.eveningLesson.2' => 'Il reste du temps pour 5 minutes d\'anglais.',
			'pushNotifications.eveningLesson.3' => 'Ta leçon quotidienne t\'attend.',
			'pushNotifications.streakReminderTitle' => 'Garde ta série',
			'pushNotifications.streakReminder' => ({required Object streak}) => 'Série de ${streak} jours — une courte leçon aujourd\'hui la maintient.',
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
