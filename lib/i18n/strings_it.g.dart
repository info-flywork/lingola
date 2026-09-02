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
class TranslationsIt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$it app = _Translations$app$it._(_root);
	@override late final _Translations$common$it common = _Translations$common$it._(_root);
	@override late final _Translations$onboarding$it onboarding = _Translations$onboarding$it._(_root);
	@override late final _Translations$targetLanguage$it targetLanguage = _Translations$targetLanguage$it._(_root);
	@override late final _Translations$language$it language = _Translations$language$it._(_root);
	@override late final _Translations$setup$it setup = _Translations$setup$it._(_root);
	@override late final _Translations$accountCreating$it accountCreating = _Translations$accountCreating$it._(_root);
	@override late final _Translations$planReady$it planReady = _Translations$planReady$it._(_root);
	@override late final _Translations$demoChat$it demoChat = _Translations$demoChat$it._(_root);
	@override late final _Translations$previewChat$it previewChat = _Translations$previewChat$it._(_root);
	@override late final _Translations$paywall$it paywall = _Translations$paywall$it._(_root);
	@override late final _Translations$auth$it auth = _Translations$auth$it._(_root);
	@override late final _Translations$nav$it nav = _Translations$nav$it._(_root);
	@override late final _Translations$home$it home = _Translations$home$it._(_root);
	@override late final _Translations$libraryPage$it libraryPage = _Translations$libraryPage$it._(_root);
	@override late final _Translations$wordPracticePage$it wordPracticePage = _Translations$wordPracticePage$it._(_root);
	@override late final _Translations$quizPage$it quizPage = _Translations$quizPage$it._(_root);
	@override late final _Translations$placeholder$it placeholder = _Translations$placeholder$it._(_root);
	@override late final _Translations$tutorPage$it tutorPage = _Translations$tutorPage$it._(_root);
	@override late final _Translations$lessonPage$it lessonPage = _Translations$lessonPage$it._(_root);
	@override late final _Translations$rolePlayPage$it rolePlayPage = _Translations$rolePlayPage$it._(_root);
	@override late final _Translations$notificationsPage$it notificationsPage = _Translations$notificationsPage$it._(_root);
	@override late final _Translations$profilePage$it profilePage = _Translations$profilePage$it._(_root);
	@override late final _Translations$pushNotifications$it pushNotifications = _Translations$pushNotifications$it._(_root);
	@override late final _Translations$apiErrors$it apiErrors = _Translations$apiErrors$it._(_root);
}

// Path: app
class _Translations$app$it implements Translations$app$en {
	_Translations$app$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Notifiche';
	@override String get streak => 'Serie di apprendimento';
	@override String get profile => 'Profilo';
}

// Path: common
class _Translations$common$it implements Translations$common$en {
	_Translations$common$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'CONTINUA';
	@override String get back => 'INDIETRO';
	@override String get locked => 'Bloccato';
	@override String minutes({required Object value}) => '${value} min';
	@override String get close => 'Chiudi';
	@override String get getStarted => 'INIZIA';
	@override String get connectionError => 'Nessuna connessione. Controlla la tua connessione internet e riprova.';
	@override String get genericError => 'Qualcosa è andato storto. Per favore riprova.';
	@override String get tryAgain => 'Riprova';
}

// Path: onboarding
class _Translations$onboarding$it implements Translations$onboarding$en {
	_Translations$onboarding$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Pagina di onboarding ${current} di ${total}';
	@override late final _Translations$onboarding$slide1$it slide1 = _Translations$onboarding$slide1$it._(_root);
	@override late final _Translations$onboarding$slide2$it slide2 = _Translations$onboarding$slide2$it._(_root);
	@override late final _Translations$onboarding$slide3$it slide3 = _Translations$onboarding$slide3$it._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$it implements Translations$targetLanguage$en {
	_Translations$targetLanguage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seleziona la lingua che vuoi imparare';
	@override String get comingSoon => 'Altre lingue in arrivo';
	@override String get korean => 'Coreano';
	@override String get portuguese => 'Portoghese';
	@override String get portugueseBrazil => 'Portoghese (Brasile)';
	@override String get german => 'Tedesco';
	@override String get italian => 'Italiano';
	@override String get simplifiedChinese => 'Cinese semplificato';
	@override String get arabic => 'Arabo';
	@override String get turkish => 'Turco';
	@override String get hindi => 'Hindi';
}

// Path: language
class _Translations$language$it implements Translations$language$en {
	_Translations$language$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Passo ${current} di ${total}';
	@override String get title => 'Cosa vuoi parlare?';
	@override String get nativeSection => 'Parlo';
	@override String get nativeField => 'Lingua madre';
	@override String get nativeName => 'Turco';
	@override String get targetSection => 'Voglio imparare';
	@override String get targetField => 'Lingua target';
	@override String get targetName => 'Inglese';
	@override String get direction => 'Direzione linguistica';
	@override String get selectLanguage => 'Seleziona lingua';
	@override String get comingSoonBadge => 'In arrivo...';
	@override String get english => 'Inglese';
	@override String get french => 'Francese';
	@override String get japanese => 'Giapponese';
	@override String get spanish => 'Spagnolo';
	@override String get russian => 'Russo';
}

// Path: setup
class _Translations$setup$it implements Translations$setup$en {
	_Translations$setup$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Qual è il tuo obiettivo?';
	@override String get goalCareer => 'Sviluppo Professionale';
	@override String get goalTravel => 'Viaggiare';
	@override String get goalLiving => 'Vivere all\'Estero';
	@override String get goalStudying => 'Studiare all\'Estero';
	@override String get goalOther => 'Altro';
	@override String get levelTitle => 'Qual è il tuo attuale livello di lingua?';
	@override String get paceTitle => 'Quanto velocemente vuoi migliorare?';
	@override String get explanationTitle => 'Quando fai domande nella tua lingua, come spieghiamo?';
	@override String get explanationHint => 'Puoi cambiarlo in qualsiasi momento nelle impostazioni del profilo.';
	@override String get explanationNative => 'Spiega nella mia lingua madre';
	@override String get explanationEnglish => 'Spiega in inglese';
	@override String get levelA1 => 'A1 — Conosco alcune parole';
	@override String get levelA2 => 'A2 — Posso usare frasi semplici';
	@override String get levelB1 => 'B1 — Sostengo conversazioni quotidiane';
	@override String get levelB2 => 'B2 — Comunico fluentemente su argomenti familiari';
	@override String get levelC1 => 'C1 — Avanzato, voglio perfezionarmi';
	@override String get levelC2 => 'C2 — Padronanza quasi nativa';
	@override String get paceMin5 => '5 min/giorno';
	@override String get paceMin10 => '10 min/giorno';
	@override String get paceMin15 => '15 min/giorno';
	@override String get paceMin30 => '30 min/giorno';
	@override String get paceMin60 => '60 min/giorno';
}

// Path: accountCreating
class _Translations$accountCreating$it implements Translations$accountCreating$en {
	_Translations$accountCreating$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il tuo account personale è in fase di creazione';
	@override String get stepContent => 'Il contenuto è in fase di creazione';
	@override String get stepDialogues => 'I dialoghi sono in fase di preparazione';
	@override String get stepLessons => 'Le lezioni sono in fase di ottimizzazione';
	@override String get stepPlan => 'Il tuo piano è in fase di finalizzazione';
	@override String get optimization => 'Ottimizzazione';
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
class _Translations$planReady$it implements Translations$planReady$en {
	_Translations$planReady$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

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
	@override String get paceMin5 => '5 min/giorno';
	@override String get paceMin10 => '10 min/giorno';
	@override String get paceMin15 => '15 min/giorno';
	@override String get paceMin30 => '30 min/giorno';
	@override String get paceMin60 => '60 min/giorno';
}

// Path: demoChat
class _Translations$demoChat$it implements Translations$demoChat$en {
	_Translations$demoChat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$it implements Translations$previewChat$en {
	_Translations$previewChat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Lezione 1: Saluti';
	@override String get speed => '1x';
	@override String get typeMessage => 'Scrivi un messaggio...';
	@override String get incoming1 => 'Ciao! Benvenuto su Lingola — sono il tuo tutor AI. Qualunque sia il tuo livello, qui ti sentirai al sicuro mentre impari l\'inglese. In inglese si dice \'Hi\' o \'Hello\' — prova: scrivimi \'Hi!\' in inglese!';
	@override String get outgoing1 => 'Ciao! Sono pronto a praticare.';
	@override String get incoming2Highlight => 'Buongiorno';
	@override String get incoming2Rest => ', Emrah! Sono felice che ti senti pronto. Un caffè mattutino è sempre un ottimo inizio per costruire una connessione. Di cosa ti piacerebbe parlare?';
	@override String get holdToSpeak => 'Tieni premuto per parlare';
	@override String get recording => 'Registrazione… rilascia per inviare';
	@override String get slideUpToLock => 'Scorri verso l\'alto per bloccare';
	@override String get slideLeftToCancel => 'Scorri a sinistra per annullare';
	@override String get recordingLockedHint => 'Tocca invia quando hai finito';
}

// Path: paywall
class _Translations$paywall$it implements Translations$paywall$en {
	_Translations$paywall$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inizia a Parlare Oggi — Gratuito';
	@override String get subtitle => 'Opportunità di apprendimento illimitate';
	@override String get noCommitment => 'Nessun impegno';
	@override String get cancelAnytime => 'Annulla in qualsiasi momento';
	@override String get noPaymentToday => 'Nessun pagamento oggi';
	@override String get daysFree => '3 Giorni Gratuiti';
	@override String get thenPrice => 'Poi \$1.99/mese';
	@override String get trialActive => 'Prova Gratuita Attiva';
	@override String get payableToday => 'Da pagare Oggi';
	@override String get payableValue => '3 Giorni Gratuiti 0.00\$';
	@override String get paymentDate => 'Data di pagamento: 13 Marzo 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$it implements Translations$auth$en {
	_Translations$auth$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'I nostri diversi allenatori AI';
	@override String get title => 'Inizia a Parlare una Nuova Lingua, Oggi';
	@override String get body => 'Pratica conversazioni reali con l\'AI.\nNessuna pressione. Nessun giudizio.';
	@override String get continueGoogle => 'Continua con Google';
	@override String get continueApple => 'Continua con Apple';
	@override String get continueGuest => 'Continua come Ospite';
	@override String get or => 'oppure';
	@override String get alreadyHaveAccount => 'Hai già un account?';
	@override String get signIn => 'Accedi';
	@override String get legal => 'Iscrivendoti a Lingola, accetti i nostri Termini di Servizio. Scopri come trattiamo i tuoi dati nella nostra Informativa sulla Privacy e nella nostra Informativa sui Cookie';
	@override String get terms => 'Termini di Servizio';
	@override String get privacy => 'Informativa sulla Privacy';
	@override String get cookies => 'Informativa sui Cookie';
}

// Path: nav
class _Translations$nav$it implements Translations$nav$en {
	_Translations$nav$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get tutor => 'Tutor';
	@override String get lesson => 'Lezione';
	@override String get rolePlay => 'Gioco di Ruolo';
	@override String get profile => 'Profilo';
}

// Path: home
class _Translations$home$it implements Translations$home$en {
	_Translations$home$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Buongiorno, Jhon';
	@override String get todayPractice => 'Pratica di Oggi';
	@override String get continueConversation => 'Continua la Conversazione';
	@override String continueWithTutor({required Object name}) => 'Continuare con ${name} o scegliere un altro tutor?';
	@override String continueSameTutor({required Object name}) => 'Continua con ${name}';
	@override String get chooseOtherTutor => 'Scegli un altro tutor';
	@override String minutesLeft({required Object value}) => '${value} min rimasti';
	@override String get lessonProgress => 'Lezione 2 — Saluti';
	@override String get timeCurrent => '0min';
	@override String get timeTotal => '/ 15min';
	@override String get kContinue => 'Continua';
	@override String get learningPath => 'A1 - Inizio';
	@override String get allLessons => 'Tutte le Lezioni';
	@override String get introductions => 'Introduzioni I';
	@override String get greetings => 'Saluti';
	@override String get jobs => 'Lavori';
	@override String get favoriteRoom => 'Una Stanza Preferita';
	@override String get dailyRoutine => 'Routine Quotidiana';
	@override String get scroll => 'Scorri';
	@override String get liveLesson => 'Lezione dal Vivo';
	@override String get liveLessonSubtitle => 'Fai una videochiamata con il nostro tutor';
	@override String get moreTutor => 'Altri Tutor';
	@override String get startTalkNow => 'Inizia a Parlare Ora';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Adattivo';
	@override String get tagCalm => 'Calmo';
	@override String get tagPatient => 'Paziente';
	@override String get tagMethodical => 'Metodico';
	@override String get tagEncouraging => 'Incoraggiante';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Altre Funzionalità';
	@override String get practiceLabel => 'PRATICA';
	@override String get wordPractice => 'Pratica di Parole';
	@override String get wordPracticeBody => 'Costruisci il tuo vocabolario nella lingua scelta ogni giorno';
	@override String get immersiveLabel => 'IMMERSIVO';
	@override String get quiz => 'Quiz';
	@override String get quizBodyLine1 => 'Impara attraverso esempi reali';
	@override String get quizBodyLine2 => 'in contesto';
	@override String get getStarted => 'Inizia';
	@override String get library => 'Biblioteca';
	@override String get libraryTitle => 'Impara e Risparmia';
	@override String get learnMore => 'Scopri di Più';
	@override late final _Translations$home$premium$it premium = _Translations$home$premium$it._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$it implements Translations$libraryPage$en {
	_Translations$libraryPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Biblioteca';
	@override String get searchWord => 'Cerca Parola';
	@override String savedWordCount({required Object count}) => '${count} Parola Salvata';
	@override String get savedWordTab => 'Parola Salvata';
	@override String get dictionaryTab => 'Dizionario';
	@override String get dictionaryLabel => 'Dizionario';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$it implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pratica di parole';
	@override String get turkish => 'Turchese';
	@override String get save => 'Salva';
	@override String get saved => 'Salvato';
	@override String get listen => 'Ascolta';
	@override String get hint => 'Suggerimento';
	@override String get previous => 'PRECEDENTE';
	@override String get next => 'SUCCESSIVO';
}

// Path: quizPage
class _Translations$quizPage$it implements Translations$quizPage$en {
	_Translations$quizPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quiz';
	@override String get headline => 'Cosa vuoi migliorare oggi?';
	@override String get subtitle => 'Scegli il tuo allenamento — ci vogliono meno di 3 minuti 🚀';
	@override String get readingTitle => 'Lettura';
	@override String get readingBody => 'Comprensione tramite articoli e storie';
	@override String get writingTitle => 'Scrittura';
	@override String get writingBody => 'Esercizi di grammatica e vocabolario';
	@override String get speakingTitle => 'Conversazione';
	@override String get speakingBody => 'Pronuncia tramite motore di sintesi vocale AI';
	@override String get readingTestTitle => 'Test di Lettura';
	@override String get read => 'Leggi';
	@override String get listeningHint => 'Pronuncia chiaramente la parola in inglese…';
	@override String get micPermissionDenied => 'Microfono o riconoscimento vocale non disponibili.';
	@override String get matchSuccess => 'Ottimo! Questo corrisponde alla parola.';
	@override String matchFail({required Object heard}) => 'Sentito "${heard}". Riprova.';
	@override String get successfulTitle => 'Riuscito!';
	@override String get successfulBody => 'Pronuncia come un madrelingua!';
	@override String get failedTitle => 'Fallito';
	@override String get failedBody => 'Era quasi fatto, dagli un\'altra possibilità';
	@override String get tryAgain => 'RIPROVA';
	@override String get writingTestTitle => 'Test di Scrittura';
	@override String get sourceLanguage => 'LINGUA DI PARTENZA';
	@override String get answer => 'RISPOSTA';
	@override String get writeAnswerHint => 'Scrivi la tua risposta qui...';
	@override String get submit => 'Invia';
	@override String get speakingTestTitle => 'Test di Conversazione';
	@override String get speakingProficiency => 'Competenza nella Conversazione';
	@override String get speakClearlyHint => 'Parla chiaramente nel tuo microfono:';
	@override String get speakUp => 'Parla Forte';
	@override String get recording => 'Registrazione...';
	@override String questionOf({required Object current, required Object total}) => 'DOMANDA ${current} DI ${total}';
}

// Path: placeholder
class _Translations$placeholder$it implements Translations$placeholder$en {
	_Translations$placeholder$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} è in arrivo';
	@override String body({required Object tab}) => 'Stiamo preparando un\'esperienza focalizzata su ${tab} per te.';
}

// Path: tutorPage
class _Translations$tutorPage$it implements Translations$tutorPage$en {
	_Translations$tutorPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tutor';
	@override String get chatWithLingola => 'Chatta con Lingola';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => 'Chatta con ${name}';
	@override String get chatHistory => 'Cronologia chat';
	@override String get history => 'Storia';
	@override String get filter => 'Filtra';
	@override String get country => 'Paese';
	@override String get focus => 'Focus';
	@override String get moreCountries => '8+ in più';
	@override String get moreFocus => '+8';
	@override String get save => 'SALVA';
	@override String get clearFilter => 'Rimuovi filtri';
	@override String get startTalkNow => 'Inizia a parlare ora';
	@override String get typeMessage => 'Scrivi un messaggio...';
	@override String get speaker => 'Parlante';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$it tutors = _Translations$tutorPage$tutors$it._(_root);
	@override late final _Translations$tutorPage$tags$it tags = _Translations$tutorPage$tags$it._(_root);
	@override String get historyPreview1 => 'Ehi! Stavo per esplodere dalla noia...';
	@override String get historyPreview2 => 'Pratichiamo a ordinare cibo oggi?';
	@override String get time1 => '11:00';
	@override String get time2 => 'Ieri';
	@override late final _Translations$tutorPage$chat$it chat = _Translations$tutorPage$chat$it._(_root);
	@override late final _Translations$tutorPage$calling$it calling = _Translations$tutorPage$calling$it._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$it implements Translations$lessonPage$en {
	_Translations$lessonPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Continua a imparare';
	@override String get profile => 'Profilo';
	@override String get language => 'Lingua target';
	@override String get completed => 'Completato';
	@override String get locked => 'Bloccato';
	@override String get pickTutorTitle => 'Scegli il tuo tutor';
	@override String get startTalk => 'Inizia lezione';
	@override String get chatInstead => 'Chatta invece';
	@override String get lockedHint => 'Completa la lezione precedente per sbloccare questa.';
	@override String get levelLockedTitle => 'Livello bloccato';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Il tuo livello di inglese è ${userLevel}: non puoi aprire lezioni ${lessonLevel} senza completare il percorso precedente.';
	@override String get levelLockedOk => 'Capito';
	@override String get notesTitle => 'Note della lezione';
	@override String get whatWeLearned => 'Cosa abbiamo imparato oggi';
	@override String get deleteNotes => 'Elimina le mie note di lezione';
	@override String get deleteNotesConfirm => 'Eliminare queste note? Questa azione non può essere annullata.';
	@override String get delete => 'Elimina';
	@override String get cancel => 'Annulla';
	@override String get practiceCta => 'Se questo ti è sembrato troppo difficile, puoi praticare lo stesso argomento di nuovo.';
	@override String get practiceNow => 'Pratica questo argomento';
	@override String get openChat => 'Apri chat con il tutor';
	@override String get yourScore => 'Il tuo punteggio';
	@override String bestScore({required Object score}) => 'Miglior ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Partecipante passivo';
	@override String get participationSilentBody => 'Sei rimasto in silenzio questa volta. Penso che dovresti ripetere questa lezione.';
	@override String get participationPassive => 'Bassa partecipazione';
	@override String get participationPassiveBody => 'Hai parlato poco. Prova di nuovo la lezione e parla di più.';
	@override String get participationActive => 'Buona partecipazione';
	@override String get participationActiveBody => 'Hai partecipato alla conversazione. Continua così!';
	@override String get participationStrong => 'Partecipazione forte';
	@override String get participationStrongBody => 'Hai parlato molto. Ottimo lavoro!';
	@override String get retakeLesson => 'Ripeti questa lezione';
	@override String get finishLesson => 'Completa la lezione';
	@override String get savingNotes => 'Il tuo tutor sta scrivendo le note di oggi...';
	@override String get noNotes => 'Completa questa lezione per ricevere le note dal tuo tutor.';
	@override String get notesDeleted => 'Note della lezione eliminate';
	@override late final _Translations$lessonPage$levels$it levels = _Translations$lessonPage$levels$it._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$it implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gioco di Ruolo';
	@override String get subtitle => 'Scegli il tuo ruolo — vivi uno scenario reale 🎭';
	@override String progressCompleted({required Object value}) => '%${value} completato';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get beginner => 'Principiante';
	@override String get screenplay => 'COPIONE';
	@override String get dailyInteractions => 'Interazioni Quotidiane';
	@override String get business => 'Affari';
	@override late final _Translations$rolePlayPage$coffee$it coffee = _Translations$rolePlayPage$coffee$it._(_root);
	@override late final _Translations$rolePlayPage$directions$it directions = _Translations$rolePlayPage$directions$it._(_root);
	@override late final _Translations$rolePlayPage$interview$it interview = _Translations$rolePlayPage$interview$it._(_root);
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
	@override late final _Translations$rolePlayPage$missedTrain$it missedTrain = _Translations$rolePlayPage$missedTrain$it._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$it flightAttendant = _Translations$rolePlayPage$flightAttendant$it._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$it trainTicket = _Translations$rolePlayPage$trainTicket$it._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$it restaurantReservation = _Translations$rolePlayPage$restaurantReservation$it._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$it doctorAppointment = _Translations$rolePlayPage$doctorAppointment$it._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$it shoppingClothes = _Translations$rolePlayPage$shoppingClothes$it._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$it takingTaxi = _Translations$rolePlayPage$takingTaxi$it._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$it rentingApartment = _Translations$rolePlayPage$rentingApartment$it._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$it birthdayParty = _Translations$rolePlayPage$birthdayParty$it._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$it implements Translations$notificationsPage$en {
	_Translations$notificationsPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifiche';
	@override String get deleteConfirmTitle => 'Sei sicuro?';
	@override String get deleteConfirmBody => 'Questa notifica verrà eliminata.';
	@override String get delete => 'Elimina';
	@override String get cancel => 'Annulla';
	@override late final _Translations$notificationsPage$translation$it translation = _Translations$notificationsPage$translation$it._(_root);
	@override late final _Translations$notificationsPage$offer$it offer = _Translations$notificationsPage$offer$it._(_root);
	@override late final _Translations$notificationsPage$stories$it stories = _Translations$notificationsPage$stories$it._(_root);
	@override late final _Translations$notificationsPage$practice$it practice = _Translations$notificationsPage$practice$it._(_root);
	@override late final _Translations$notificationsPage$streak$it streak = _Translations$notificationsPage$streak$it._(_root);
	@override late final _Translations$notificationsPage$premium$it premium = _Translations$notificationsPage$premium$it._(_root);
	@override String get emptyTitle => 'Nessuna notifica ancora';
	@override String get emptySubtitle => 'Non dimenticare di controllare di nuovo quando ricevi una notifica.';
}

// Path: profilePage
class _Translations$profilePage$it implements Translations$profilePage$en {
	_Translations$profilePage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profilo';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Versione Gratuita';
	@override String get dayStreak => 'Serie di Giorni!';
	@override String get accountSettings => 'Impostazioni Account';
	@override String get general => 'Generale';
	@override String get profileSettings => 'Impostazioni Profilo';
	@override String get fullName => 'Nome Completo';
	@override String get email => 'E-mail';
	@override String get deleteAccount => 'Elimina Account';
	@override String get save => 'SALVA';
	@override String get deleteTitle => 'Non vogliamo che tu vada, ma ti capiamo.';
	@override String get deleteBody => 'Puoi dirci perché vuoi lasciare per migliorare la tua esperienza con Lingola?';
	@override late final _Translations$profilePage$deleteReasons$it deleteReasons = _Translations$profilePage$deleteReasons$it._(_root);
	@override String get messageOptional => 'Messaggio (opzionale)';
	@override String get messageHint => 'Se hai un messaggio, per favore scrivilo.';
	@override String get next => 'PROSSIMO';
	@override String get specialOfferTitle => 'Offerta Speciale';
	@override String get specialOfferBody => 'Dai un\'occhiata all\'offerta che abbiamo preparato per te prima di andare.';
	@override String get monthlyPlanTitle => 'Passa al Piano Mensile';
	@override String get monthlyPlanPrice => '\$79/mese, annulla in qualsiasi momento';
	@override String get monthlyPlanDesc => 'Nessun impegno a lungo termine. Rimani connesso con la nostra comunità mese per mese.';
	@override String get whatYoullKeep => 'Cosa manterrai:';
	@override String get keepCharacters => 'Accesso a tutti i personaggi';
	@override String get keepVideo => 'Videochiamate illimitate';
	@override String get keepCourses => 'Accesso a tutti i corsi';
	@override String get switchMonthlyCta => 'Passa al Piano Mensile';
	@override String get confirmTitle => 'Sei sicuro?';
	@override String get confirmBody => 'Non vogliamo davvero vederti andare. Ecco cosa perderai:';
	@override String get loseCharacters => 'Accesso illimitato ai personaggi';
	@override String get loseVideo => 'Accesso illimitato alle videochiamate';
	@override String get loseCourses => 'Accesso a tutti i corsi';
	@override String get discountTitle => 'Rimani e ottieni il 60% di sconto per 1 mese';
	@override String get discountSubtitle => 'La nostra migliore offerta di sempre. Solo \$27.60/mese';
	@override String get acceptDiscountCta => 'Accetta il 60% di Sconto & Rimani';
	@override String get farewellTitle => 'Siamo tristi di vederti andare';
	@override String farewellBody({required Object date}) => 'La tua iscrizione è stata annullata. Avrai accesso fino alla fine del tuo attuale periodo di fatturazione il ${date}.';
	@override String get changeMindTitle => '✨ Cambia idea?';
	@override String changeMindBody({required Object date}) => 'Puoi riattivare la tua iscrizione in qualsiasi momento prima del ${date} per mantenere i tuoi benefici.';
	@override String get reactivateCta => 'Aspetta, voglio riattivare';
	@override String get done => 'FATTO';
	@override String get notifications => 'Notifiche';
	@override String get appLanguage => 'Lingua dell\'App';
	@override String get explanationLanguage => 'Lingua delle spiegazioni';
	@override String get explanationNative => 'Lingua madre';
	@override String get explanationEnglish => 'Inglese';
	@override String get explanationUpdateFailed => 'Impossibile aggiornare la lingua delle spiegazioni';
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
	@override String get remindMe => 'Ricordami';
	@override String get reminderSave => 'Salva';
	@override String get reminderSaved => 'Promemoria salvato';
	@override String get selectLanguageTitle => 'Seleziona Lingua';
	@override String get premium => 'Premium';
	@override String get passive => 'Passivo';
	@override String get active => 'Attivo';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Condividi con un Amico';
	@override String get shareWithFriendTitle => 'Condividi con un Amico';
	@override String get shareInviteBody => 'Invita i tuoi amici e goditi la traduzione insieme';
	@override String get rateUs => 'Valutaci';
	@override String get faq => 'FAQ di Lingola';
	@override late final _Translations$profilePage$faqItems$it faqItems = _Translations$profilePage$faqItems$it._(_root);
	@override String get support => 'Supporto';
	@override String get feedback => 'Feedback';
	@override String get progression => 'Progressione';
	@override String get progressTitle => 'Progresso';
	@override String get goodMorning => 'Buongiorno,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'Inglese';
	@override String get past7Days => 'Ultimi 7 Giorni';
	@override String get past7DaysBody => 'Studia ogni giorno per costruire la tua serie e creare un\'abitudine di apprendimento potente.';
	@override String get currentLevel => 'Livello Attuale';
	@override String xpLeft({required Object xp, required Object level}) => 'Solo ${xp} XP rimasti per raggiungere ${level}!';
	@override String get toNextLevel => 'AL PROSSIMO LIVELLO';
	@override String get dayStreakLabel => 'Serie di Giorni';
	@override String get totalPoints => 'Punti Totali';
	@override String get savedWords => 'Parole Salvate';
	@override String itemsToReview({required Object count}) => '${count} articoli da rivedere';
	@override String get logout => 'Disconnetti';
	@override String get logoutTitle => 'Stai per disconnetterti';
	@override String get logoutBody => 'A presto! Ci mancheranno i tuoi esercizi di respirazione.';
	@override String get logoutConfirm => 'DISCONNETTI';
	@override String get logoutCancel => 'ANNULLA';
	@override late final _Translations$profilePage$days$it days = _Translations$profilePage$days$it._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Il tuo certificato';
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
	@override String get certificateVerifyHint => 'Chiunque può scansionare il codice QR per verificare il tuo risultato.';
	@override String get certificateShare => 'Condividi certificato';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => 'Certificato bloccato';
	@override String certificateNotAvailable({required Object level}) => 'Non puoi ancora usare questo certificato perché non hai completato le lezioni ${level}.';
	@override String get certificateNotAvailableOk => 'Capito';
	@override String get certificateShareQr => 'Condividi codice QR';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Quando completi un livello CEFR su Lingola, il tuo certificato apparirà qui — con il tuo nome, livello e un codice QR da scansionare per la verifica.';
	@override String get certificatePreviewHint => 'Completa un percorso di livello per sbloccare il certificato';
	@override String get certificateTapToView => 'Tocca per visualizzare e condividere il certificato';
	@override String get settings => 'Impostazioni';
	@override String get dailyGoalValueLight => '5-10 min/giorno';
	@override String get dailyGoalValueRecommended => '15-20 min/giorno';
	@override String get dailyGoalValueFast => '30+ min/giorno';
	@override String get settingsShare => 'Share';
	@override String get settingsSupport => 'Support';
	@override String get settingsAbout => 'About';
	@override String get settingsAccount => 'Account';
	@override String get followInstagram => 'Follow on Instagram';
	@override String get followTikTok => 'Follow on TikTok';
}

// Path: pushNotifications
class _Translations$pushNotifications$it implements Translations$pushNotifications$en {
	_Translations$pushNotifications$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Sembra che tu abbia fatto una breve pausa.',
		'Hai un momento per una parola?',
		'Siamo qui — senza fretta.',
		'Il tuo ritmo di apprendimento si è fermato un attimo.',
		'Una mini revisione potrebbe farti bene.',
	];
	@override List<String> get h4 => [
		'Una nuova parola potrebbe aspettarti oggi 👀',
		'Potresti avere un\'opportunità per una pratica veloce.',
		'Potresti aver saltato una frase utile.',
		'I progressi di oggi sono ancora aperti.',
		'Una parola, una frase… magari entrambe.',
	];
	@override List<String> get h8 => [
		'Non è necessario progredire ogni giorno.',
		'Anche una piccola revisione conta.',
		'Non hai perso nulla non studiando oggi.',
		'Siamo pronti quando lo sei tu.',
		'Imparare una lingua è una maratona, non uno sprint.',
	];
	@override List<String> get h24 => [
		'È passato un giorno. Le tue parole sono ancora qui.',
		'Prendersi una pausa è normale.',
		'Il tuo posto è proprio dove lo hai lasciato.',
		'Continua quando vuoi.',
		'La lingua non scapperà — né noi.',
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
class _Translations$apiErrors$it implements Translations$apiErrors$en {
	_Translations$apiErrors$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$it implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parla con Sicurezza in Settimane — Non Mesi';
	@override String get body => 'Pratica conversazioni reali con l\'IA. Migliora il tuo accento, la tua sicurezza e la tua fluidità, ogni giorno.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Non sapevo parlare inglese prima. Ora parlo ogni giorno al lavoro.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$it implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un Tutor Privato Senza il Prezzo';
	@override String get body => 'Conversazioni reali. Feedback immediato.\nNessuna pianificazione. Nessuna pressione.';
	@override String get realTutor => 'Tutor Reale';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / hr';
	@override String get priceLingola => '\$9.99 / yr';
	@override String get versus => 'VS';
	@override String get scheduled => 'Pianificato';
	@override String get anytime => 'In qualsiasi momento';
	@override String get stressful => 'Stressante';
	@override String get noPressure => 'Nessuna pressione';
	@override String get price => 'Prezzo';
	@override String get availability => 'Disponibilità';
	@override String get feeling => 'Sensazione';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$it implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un Piano di Apprendimento Costruito Intorno a Te';
	@override String get body => 'I tuoi obiettivi, il tuo ritmo, il tuo livello.\nDa principiante a fluente — passo dopo passo.';
	@override String get goal => 'Obiettivo';
	@override String get practice => 'Pratica';
	@override String get progress => 'Progresso';
}

// Path: home.premium
class _Translations$home$premium$it implements Translations$home$premium$en {
	_Translations$home$premium$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Il percorso per ';
	@override String get titleHighlight => 'parlare fluentemente';
	@override String get titleAfter => ' senza paura di fare errori.';
	@override String get descriptionBefore => 'Unisciti a milioni di studenti in tutto il mondo. Inizia a superare la barriera linguistica oggi — ';
	@override String get descriptionHighlight => 'i primi 3 giorni completamente gratuiti.';
	@override String get feature1 => 'Tutor AI accessibile 24/7';
	@override String get feature2 => 'Accesso illimitato a Tutor Privati';
	@override String get feature3 => 'Piano di lezione giornaliero su misura per te';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/mo';
	@override String get discount => '40% di sconto con acquisto annuale';
	@override String get cta => 'Inizia';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$it implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

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
	@override String get santa => 'Babbo Natale';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$it implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Adattivo';
	@override String get calm => 'Calmo';
	@override String get patient => 'Paziente';
	@override String get organized => 'Organizzato';
	@override String get relaxed => 'Rilassato';
	@override String get methodical => 'Metodico';
	@override String get attentive => 'Attento';
	@override String get more => '+5';
	@override String get curious => 'Curioso';
	@override String get observer => 'Osservatore';
	@override String get ancientKnowledge => 'Conoscenza Antica';
	@override String get wise => 'Saggio';
	@override String get clear => 'Chiaro';
	@override String get decisive => 'Decisivo';
	@override String get disciplined => 'Disciplinato';
	@override String get smart => 'Intelligente';
	@override String get analytic => 'Analitico';
	@override String get cheerful => 'Allegro';
	@override String get generous => 'Generoso';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$it implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Buongiorno! Sono felice che ti senti pronto a praticare oggi.';
	@override String get outgoing1 => 'Sì, iniziamo con i saluti.';
	@override String get incoming2 => 'Perfetto. Come diresti ciao a un collega?';
	@override String get typing => 'Scrivendo';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$it implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Lezione 1 : Saluti';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Lezione ${number} : ${title}';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Noioso? Ho cancellato quella parola dal mio vocabolario. Alzati, il piano è già fatto: andiamo in quel nuovo bar arcade a Kadıköy.';
	@override String get highlight => 'Noioso?';
	@override String get close => 'Termina chiamata';
	@override String get toggleCaptions => 'Attiva/disattiva sottotitoli';
	@override String get toggleHints => 'Attiva/disattiva suggerimenti';
	@override String get toggleMic => 'Attiva/disattiva microfono';
	@override String get tapToSpeakHint => 'Tocca per parlare, tocca di nuovo per finire';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$it implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$it a1 = _Translations$lessonPage$levels$a1$it._(_root);
	@override late final _Translations$lessonPage$levels$a2$it a2 = _Translations$lessonPage$levels$a2$it._(_root);
	@override late final _Translations$lessonPage$levels$b1$it b1 = _Translations$lessonPage$levels$b1$it._(_root);
	@override late final _Translations$lessonPage$levels$b2$it b2 = _Translations$lessonPage$levels$b2$it._(_root);
	@override late final _Translations$lessonPage$levels$c1$it c1 = _Translations$lessonPage$levels$c1$it._(_root);
	@override late final _Translations$lessonPage$levels$c2$it c2 = _Translations$lessonPage$levels$c2$it._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$it implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ordinare al Bar';
	@override String get screenplay => 'Ordina la tua bevanda preferita, chiedi informazioni su taglie e extra, conferma il tuo totale e ritira il tuo caffè al bancone.';
	@override late final _Translations$rolePlayPage$coffee$chat$it chat = _Translations$rolePlayPage$coffee$chat$it._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$it implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiedere Indicazioni per Strada';
	@override String get screenplay => 'Chiedi indicazioni per un luogo, scopri come arrivare alla metropolitana o all\'autobus, ottieni informazioni sui biglietti e ascolta raccomandazioni sui ristoranti.';
	@override late final _Translations$rolePlayPage$directions$chat$it chat = _Translations$rolePlayPage$directions$chat$it._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$it implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Colloquio di Lavoro';
	@override String get screenplay => 'Presentati, rispondi a domande comuni del colloquio, parla della tua esperienza e chiedi informazioni sul ruolo e sui prossimi passi.';
	@override late final _Translations$rolePlayPage$interview$chat$it chat = _Translations$rolePlayPage$interview$chat$it._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$it implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$it chat = _Translations$rolePlayPage$missedTrain$chat$it._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$it implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$it chat = _Translations$rolePlayPage$flightAttendant$chat$it._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$it implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$it chat = _Translations$rolePlayPage$trainTicket$chat$it._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$it implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$it chat = _Translations$rolePlayPage$restaurantReservation$chat$it._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$it implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$it chat = _Translations$rolePlayPage$doctorAppointment$chat$it._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$it implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$it chat = _Translations$rolePlayPage$shoppingClothes$chat$it._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$it implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$it chat = _Translations$rolePlayPage$takingTaxi$chat$it._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$it implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$it chat = _Translations$rolePlayPage$rentingApartment$chat$it._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$it implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$it chat = _Translations$rolePlayPage$birthdayParty$chat$it._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$it implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nuova Traduzione Pronta';
	@override String get body => 'Il tuo file di traduzione audio è stato convertito con successo in testo e tradotto.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$it implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un\'Offerta Speciale Ti Aspetta';
	@override String get body => 'Passa a Premium per traduzioni fotografiche illimitate con il 50% di sconto.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$it implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scopri Nuove Storie';
	@override String get body => 'Impara nuove parole attraverso le storie';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$it implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$it implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$it implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$it implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Non trovavo realistici i personaggi dell\'intelligenza artificiale.';
	@override String get videoIssues => 'Ho problemi tecnici durante le videochiamate.';
	@override String get pricing => 'I prezzi degli abbonamenti sono superiori alle mie aspettative.';
	@override String get noMatch => 'Non ho trovato personaggi nel mio stile.';
	@override String get shortTrial => 'Volevo solo provare per un breve periodo.';
	@override String get other => 'Altro';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$it implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$it supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$it._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$it howAiWorks = _Translations$profilePage$faqItems$howAiWorks$it._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$it offlineUse = _Translations$profilePage$faqItems$offlineUse$it._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$it isFree = _Translations$profilePage$faqItems$isFree$it._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$it pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$it._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$it dailyPractice = _Translations$profilePage$faqItems$dailyPractice$it._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$it levelDetermination = _Translations$profilePage$faqItems$levelDetermination$it._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$it realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$it._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$it dataSecurity = _Translations$profilePage$faqItems$dataSecurity$it._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$it disableReminders = _Translations$profilePage$faqItems$disableReminders$it._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$it implements Translations$profilePage$days$en {
	_Translations$profilePage$days$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get mon => 'LUN';
	@override String get tue => 'MAR';
	@override String get wed => 'MER';
	@override String get thu => 'GIO';
	@override String get fri => 'VEN';
	@override String get sat => 'SAB';
	@override String get sun => 'DOM';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$it implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Inizio';
	@override List<String> get lessons => [
		'Saluti',
		'Introduzioni I',
		'Lavori',
		'Una stanza preferita',
		'Routine quotidiana',
		'Frutta',
		'Consigli 1',
		'Famiglia 1',
		'Cose quotidiane',
		'Città natale',
		'Casa',
		'Preferenze alimentari',
		'Hobby 1',
		'Persone di successo',
		'Cibo e bevande',
		'Ordinare al ristorante',
		'Animali domestici',
		'Salute e fitness',
		'Meteo',
		'Nuovo stile di vita',
		'Migliorarsi',
		'Hobby 2',
		'Domande sui luoghi',
		'Possesso',
		'Shopping 1',
		'Dire l\'ora',
		'Indicazioni 1',
		'Shopping 2',
		'Conoscersi meglio',
		'Luoghi di oggetti',
		'Aspetto',
		'Indicazioni 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$it implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Base';
	@override List<String> get lessons => [
		'Famiglia 2',
		'Persone e luoghi',
		'Famiglia 3',
		'Descrivere oggetti',
		'Città',
		'Il progetto edilizio',
		'Casa dolce casa',
		'Che ore sono?',
		'Routine quotidiana 2',
		'Tempo libero',
		'Cibo e nutrizione',
		'Shopping e consumatori',
		'Vacanze',
		'Piani per il weekend',
		'Formale o informale',
		'Moda',
		'Shopping 3',
		'Consigli 2',
		'Puoi farcela',
		'Shopping 4',
		'Conversazione leggera',
		'Un latte per favore',
		'Cibo',
		'Muoversi',
		'Pronto per un viaggio',
		'Viaggio 1',
		'Fughe urbane',
		'Viaggio 2',
		'Un posto dove stare',
		'Così emozionante',
		'La persona giusta',
		'Scuola',
		'Preferenze musicali',
		'Sport',
		'Regole della corsa',
		'Lascia un messaggio',
		'Richieste',
		'Inviti',
		'Esperienze di viaggio',
		'Passato 1',
		'Passato 2',
		'Passato 3',
		'Domande sul passato',
		'Non sei mai troppo vecchio',
		'Ricordi d\'infanzia',
		'Complimenti',
		'Scuse',
		'È così fastidioso!',
		'Un mondo digitale',
		'Vita lavorativa',
		'Non ho capito',
		'Risparmiare o spendere?',
		'Chiedere scusa',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$it implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Intermedio';
	@override List<String> get lessons => [
		'Tradizioni culturali',
		'Celebrità',
		'Arte e creatività',
		'Piani futuri',
		'Pianificazione di eventi',
		'Obiettivi e piani',
		'Eventi storici',
		'Tecnologia',
		'Mai e poi mai',
		'Cosa c\'è in programma',
		'Vacanza da sogno',
		'Social media',
		'Consigli di lettura',
		'Uno di quei giorni',
		'Foto speciali',
		'Risultati personali',
		'Film preferiti',
		'Notizie flash',
		'Felicità',
		'Una settimana intensa',
		'Dove sono cresciuto',
		'Giorni di scuola',
		'Profili',
		'Mappe della vita',
		'Ogni giorno',
		'Cosa c\'è dopo',
		'Fare suggerimenti',
		'Cosa è successo',
		'Ricordi',
		'Shock culturale',
		'Frasi di interesse',
		'Colloqui di lavoro',
		'Liste dei desideri',
		'Il mio tipo di città',
		'La generazione internet',
		'Marche popolari',
		'Frasi di opinione',
		'Com\'è',
		'Spazio abitativo',
		'Mangiare bene',
		'Hobby insoliti',
		'Una scelta difficile',
		'Agire',
		'Nuove abilità',
		'Fare un reclamo',
		'Istruzione',
		'Città verdi',
		'Cosa c\'è in un lavoro',
		'Sfide personali',
		'Frasi per colloqui',
		'Conclusioni educate',
		'Notizie in primo piano',
		'Piccole modifiche',
		'Scuse per le scuse',
		'Etichetta telefonica',
		'Scusa per l\'interruzione…',
		'Risposte ai reclami',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$it implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Intermedio Avanzato';
	@override List<String> get lessons => [
		'Personalità',
		'Grandi leader',
		'Stile di vita sano',
		'Qual è la verità?',
		'Crescita personale',
		'Esporsi',
		'Recitare?',
		'Ricordo...',
		'Feedback sociale',
		'Scena del crimine',
		'Problemi educati',
		'Risoluzione dei conflitti',
		'Amalo o odiarlo?',
		'Problemi ambientali',
		'Possiamo risolverlo',
		'Misteri e crimini',
		'Futuri possibili',
		'Piani aziendali',
		'Decisioni in riunione',
		'È così prevedibile...',
		'Sul lavoro',
		'Scienza e tecnologia',
		'Gestione del tempo',
		'Diritti umani',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$it implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Avanzato';
	@override List<String> get lessons => [
		'Norme culturali',
		'Influenza dei social media',
		'Scelte di carriera',
		'Accelerare le prestazioni',
		'Invenzioni',
		'Viaggio nel tempo',
		'Possessi',
		'Competenze lavorative',
		'Cambiamenti storici',
		'Scrittura di recensioni',
		'Misteri',
		'Teorie strane',
		'Celebrità',
		'Politica globale',
		'Boom dei prodotti',
		'Sarai felice?',
		'Forse più tardi...',
		'Nuove soluzioni',
		'Influenza contestuale',
		'Un logo perduto',
		'Atti gentili',
		'Che film',
		'Che fastidio',
		'Nelle notizie',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$it implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Esperto';
	@override List<String> get lessons => [
		'Globalizzazione',
		'Disastri naturali',
		'Reagire alle informazioni',
		'Equilibrio tra vita lavorativa e vita privata',
		'Lavoro da remoto',
		'Problemi familiari',
		'Anatomia umana di base',
		'Previsioni sulla salute',
		'Accesso alla sanità',
		'Esperienza di viaggio globale',
		'Superpoteri',
		'Team building',
		'Biofluorescenza',
		'Dilemmi',
		'Entusiasmo sociale',
		'Cambiamenti',
		'Lavoro, lavoro, lavoro',
		'Problemi locali',
		'Problemi, problemi',
		'Fatto o finzione?',
		'Turismo',
		'Volontariato',
		'L\'occhio della mente',
		'Consumo dei media',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$it implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Ciao! Oggi praticheremo l\'ordinazione al bar — saluti, taglie, extra. Spiegherò un po\' prima, poi reciteremo. Va bene?';
	@override String get incoming1 => 'Benvenuto! Cosa posso prepararti oggi?';
	@override String get outgoing1 => 'Ciao! Vorrei un latte medio, per favore.';
	@override String get incoming2Highlight => 'Certo';
	@override String get incoming2Rest => '! Vuoi che sia caldo o freddo, e qualche extra?';
	@override String get botReply => 'Ottima scelta. Vuoi aggiungere qualcos\'altro al tuo ordine?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$it implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Ciao! Oggi praticheremo a chiedere indicazioni per strada. Spiegherò un po\' prima, poi reciteremo. Va bene?';
	@override String get incoming1 => 'Ciao! Sembri un po\' perso — hai bisogno di aiuto per trovare qualcosa?';
	@override String get outgoing1 => 'Sì, sto cercando la stazione della metropolitana più vicina.';
	@override String get incoming2Highlight => 'Certo';
	@override String get incoming2Rest => '! Cammina due isolati in quella direzione, poi gira a sinistra. Vedrai l\'ingresso.';
	@override String get botReply => 'Prego! Vuoi anche un consiglio su un ristorante vicino alla stazione?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$it implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Ciao! Oggi praticheremo un colloquio di lavoro. Spiegherò un po\' prima, poi reciteremo — io ti intervisto, poi ci scambiamo. Va bene?';
	@override String get incoming1 => 'Grazie per essere venuto oggi. Potresti presentarti brevemente?';
	@override String get outgoing1 => 'Certo. Sono entusiasta di essere qui e condividere la mia esperienza.';
	@override String get incoming2Highlight => 'Meraviglioso';
	@override String get incoming2Rest => '. Parlami di un progetto recente di cui sei orgoglioso.';
	@override String get botReply => 'È impressionante. Quali domande hai sul ruolo?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$it implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$it implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$it implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$it implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$it implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$it implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$it implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$it implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$it implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$it implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Quali lingue supporta l\'app?';
	@override String get answer => 'L\'interfaccia di Lingola è disponibile in inglese, tedesco, italiano, francese, turco, giapponese, spagnolo, russo, hindi, portoghese e cinese semplificato.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$it implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Come funziona l\'IA?';
	@override String get answer => 'L\'IA interagisce con te come un vero tutor. Analizza le tue conversazioni, rileva errori e offre feedback personalizzato in base ai tuoi progressi.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$it implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Posso usare l\'app offline?';
	@override String get answer => 'Sì. Puoi scaricare in anticipo alcune lezioni e scenari di conversazione e usarli offline. Tuttavia, la chat dal vivo richiede una connessione a Internet.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$it implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'L\'app è gratuita?';
	@override String get answer => 'La versione base è gratuita. Con Premium, ottieni scenari di chat avanzati, analisi della pronuncia e modalità tutor personale.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$it implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Come viene valutata la mia pronuncia?';
	@override String get answer => 'L\'app analizza la tua voce e utilizza il riconoscimento vocale basato su IA per valutare il tuo accento e la tua pronuncia. Le parole che devi migliorare sono evidenziate.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$it implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Devo praticare ogni giorno?';
	@override String get answer => 'Sì. Il sistema tiene traccia dei tuoi progressi ogni giorno. Solo 10–15 minuti di pratica orale al giorno possono accelerare notevolmente il tuo apprendimento linguistico.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$it implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Come viene determinato il mio livello di apprendimento?';
	@override String get answer => 'Un breve controllo del livello quando accedi per la prima volta analizza le tue conoscenze attuali. Dopo di che, l\'IA raccomanda automaticamente lezioni adatte al tuo livello.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$it implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Posso parlare con persone reali?';
	@override String get answer => 'Sì. Gli utenti Premium possono pianificare brevi sessioni di pratica con veri tutor.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$it implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'I miei dati sono al sicuro?';
	@override String get answer => 'Assolutamente. Tutte le conversazioni e i dati degli utenti sono memorizzati in modo crittografato. Le tue informazioni personali non vengono mai condivise con terze parti.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$it implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Come disattivo i promemoria giornalieri?';
	@override String get answer => 'Vai nelle Impostazioni Profilo, apri Notifiche e cambia la frequenza dei promemoria o disattiva completamente le notifiche.';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Notifiche',
			'app.streak' => 'Serie di apprendimento',
			'app.profile' => 'Profilo',
			'common.continueLabel' => 'CONTINUA',
			'common.back' => 'INDIETRO',
			'common.locked' => 'Bloccato',
			'common.minutes' => ({required Object value}) => '${value} min',
			'common.close' => 'Chiudi',
			'common.getStarted' => 'INIZIA',
			'common.connectionError' => 'Nessuna connessione. Controlla la tua connessione internet e riprova.',
			'common.genericError' => 'Qualcosa è andato storto. Per favore riprova.',
			'common.tryAgain' => 'Riprova',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Pagina di onboarding ${current} di ${total}',
			'onboarding.slide1.title' => 'Parla con Sicurezza in Settimane — Non Mesi',
			'onboarding.slide1.body' => 'Pratica conversazioni reali con l\'IA. Migliora il tuo accento, la tua sicurezza e la tua fluidità, ogni giorno.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Non sapevo parlare inglese prima. Ora parlo ogni giorno al lavoro.',
			'onboarding.slide2.title' => 'Un Tutor Privato Senza il Prezzo',
			'onboarding.slide2.body' => 'Conversazioni reali. Feedback immediato.\nNessuna pianificazione. Nessuna pressione.',
			'onboarding.slide2.realTutor' => 'Tutor Reale',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / hr',
			'onboarding.slide2.priceLingola' => '\$9.99 / yr',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Pianificato',
			'onboarding.slide2.anytime' => 'In qualsiasi momento',
			'onboarding.slide2.stressful' => 'Stressante',
			'onboarding.slide2.noPressure' => 'Nessuna pressione',
			'onboarding.slide2.price' => 'Prezzo',
			'onboarding.slide2.availability' => 'Disponibilità',
			'onboarding.slide2.feeling' => 'Sensazione',
			'onboarding.slide3.title' => 'Un Piano di Apprendimento Costruito Intorno a Te',
			'onboarding.slide3.body' => 'I tuoi obiettivi, il tuo ritmo, il tuo livello.\nDa principiante a fluente — passo dopo passo.',
			'onboarding.slide3.goal' => 'Obiettivo',
			'onboarding.slide3.practice' => 'Pratica',
			'onboarding.slide3.progress' => 'Progresso',
			'targetLanguage.title' => 'Seleziona la lingua che vuoi imparare',
			'targetLanguage.comingSoon' => 'Altre lingue in arrivo',
			'targetLanguage.korean' => 'Coreano',
			'targetLanguage.portuguese' => 'Portoghese',
			'targetLanguage.portugueseBrazil' => 'Portoghese (Brasile)',
			'targetLanguage.german' => 'Tedesco',
			'targetLanguage.italian' => 'Italiano',
			'targetLanguage.simplifiedChinese' => 'Cinese semplificato',
			'targetLanguage.arabic' => 'Arabo',
			'targetLanguage.turkish' => 'Turco',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Passo ${current} di ${total}',
			'language.title' => 'Cosa vuoi parlare?',
			'language.nativeSection' => 'Parlo',
			'language.nativeField' => 'Lingua madre',
			'language.nativeName' => 'Turco',
			'language.targetSection' => 'Voglio imparare',
			'language.targetField' => 'Lingua target',
			'language.targetName' => 'Inglese',
			'language.direction' => 'Direzione linguistica',
			'language.selectLanguage' => 'Seleziona lingua',
			'language.comingSoonBadge' => 'In arrivo...',
			'language.english' => 'Inglese',
			'language.french' => 'Francese',
			'language.japanese' => 'Giapponese',
			'language.spanish' => 'Spagnolo',
			'language.russian' => 'Russo',
			'setup.goalTitle' => 'Qual è il tuo obiettivo?',
			'setup.goalCareer' => 'Sviluppo Professionale',
			'setup.goalTravel' => 'Viaggiare',
			'setup.goalLiving' => 'Vivere all\'Estero',
			'setup.goalStudying' => 'Studiare all\'Estero',
			'setup.goalOther' => 'Altro',
			'setup.levelTitle' => 'Qual è il tuo attuale livello di lingua?',
			'setup.paceTitle' => 'Quanto velocemente vuoi migliorare?',
			'setup.explanationTitle' => 'Quando fai domande nella tua lingua, come spieghiamo?',
			'setup.explanationHint' => 'Puoi cambiarlo in qualsiasi momento nelle impostazioni del profilo.',
			'setup.explanationNative' => 'Spiega nella mia lingua madre',
			'setup.explanationEnglish' => 'Spiega in inglese',
			'setup.levelA1' => 'A1 — Conosco alcune parole',
			'setup.levelA2' => 'A2 — Posso usare frasi semplici',
			'setup.levelB1' => 'B1 — Sostengo conversazioni quotidiane',
			'setup.levelB2' => 'B2 — Comunico fluentemente su argomenti familiari',
			'setup.levelC1' => 'C1 — Avanzato, voglio perfezionarmi',
			'setup.levelC2' => 'C2 — Padronanza quasi nativa',
			'setup.paceMin5' => '5 min/giorno',
			'setup.paceMin10' => '10 min/giorno',
			'setup.paceMin15' => '15 min/giorno',
			'setup.paceMin30' => '30 min/giorno',
			'setup.paceMin60' => '60 min/giorno',
			'accountCreating.title' => 'Il tuo account personale è in fase di creazione',
			'accountCreating.stepContent' => 'Il contenuto è in fase di creazione',
			'accountCreating.stepDialogues' => 'I dialoghi sono in fase di preparazione',
			'accountCreating.stepLessons' => 'Le lezioni sono in fase di ottimizzazione',
			'accountCreating.stepPlan' => 'Il tuo piano è in fase di finalizzazione',
			'accountCreating.optimization' => 'Ottimizzazione',
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
			'planReady.paceMin5' => '5 min/giorno',
			'planReady.paceMin10' => '10 min/giorno',
			'planReady.paceMin15' => '15 min/giorno',
			'planReady.paceMin30' => '30 min/giorno',
			'planReady.paceMin60' => '60 min/giorno',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lezione 1: Saluti',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Scrivi un messaggio...',
			'previewChat.incoming1' => 'Ciao! Benvenuto su Lingola — sono il tuo tutor AI. Qualunque sia il tuo livello, qui ti sentirai al sicuro mentre impari l\'inglese. In inglese si dice \'Hi\' o \'Hello\' — prova: scrivimi \'Hi!\' in inglese!',
			'previewChat.outgoing1' => 'Ciao! Sono pronto a praticare.',
			'previewChat.incoming2Highlight' => 'Buongiorno',
			'previewChat.incoming2Rest' => ', Emrah! Sono felice che ti senti pronto. Un caffè mattutino è sempre un ottimo inizio per costruire una connessione. Di cosa ti piacerebbe parlare?',
			'previewChat.holdToSpeak' => 'Tieni premuto per parlare',
			'previewChat.recording' => 'Registrazione… rilascia per inviare',
			'previewChat.slideUpToLock' => 'Scorri verso l\'alto per bloccare',
			'previewChat.slideLeftToCancel' => 'Scorri a sinistra per annullare',
			'previewChat.recordingLockedHint' => 'Tocca invia quando hai finito',
			'paywall.title' => 'Inizia a Parlare Oggi — Gratuito',
			'paywall.subtitle' => 'Opportunità di apprendimento illimitate',
			'paywall.noCommitment' => 'Nessun impegno',
			'paywall.cancelAnytime' => 'Annulla in qualsiasi momento',
			'paywall.noPaymentToday' => 'Nessun pagamento oggi',
			'paywall.daysFree' => '3 Giorni Gratuiti',
			'paywall.thenPrice' => 'Poi \$1.99/mese',
			'paywall.trialActive' => 'Prova Gratuita Attiva',
			'paywall.payableToday' => 'Da pagare Oggi',
			'paywall.payableValue' => '3 Giorni Gratuiti 0.00\$',
			'paywall.paymentDate' => 'Data di pagamento: 13 Marzo 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'I nostri diversi allenatori AI',
			'auth.title' => 'Inizia a Parlare una Nuova Lingua, Oggi',
			'auth.body' => 'Pratica conversazioni reali con l\'AI.\nNessuna pressione. Nessun giudizio.',
			'auth.continueGoogle' => 'Continua con Google',
			'auth.continueApple' => 'Continua con Apple',
			'auth.continueGuest' => 'Continua come Ospite',
			'auth.or' => 'oppure',
			'auth.alreadyHaveAccount' => 'Hai già un account?',
			'auth.signIn' => 'Accedi',
			'auth.legal' => 'Iscrivendoti a Lingola, accetti i nostri Termini di Servizio. Scopri come trattiamo i tuoi dati nella nostra Informativa sulla Privacy e nella nostra Informativa sui Cookie',
			'auth.terms' => 'Termini di Servizio',
			'auth.privacy' => 'Informativa sulla Privacy',
			'auth.cookies' => 'Informativa sui Cookie',
			'nav.home' => 'Home',
			'nav.tutor' => 'Tutor',
			'nav.lesson' => 'Lezione',
			'nav.rolePlay' => 'Gioco di Ruolo',
			'nav.profile' => 'Profilo',
			'home.streakCount' => '2',
			'home.greeting' => 'Buongiorno, Jhon',
			'home.todayPractice' => 'Pratica di Oggi',
			'home.continueConversation' => 'Continua la Conversazione',
			'home.continueWithTutor' => ({required Object name}) => 'Continuare con ${name} o scegliere un altro tutor?',
			'home.continueSameTutor' => ({required Object name}) => 'Continua con ${name}',
			'home.chooseOtherTutor' => 'Scegli un altro tutor',
			'home.minutesLeft' => ({required Object value}) => '${value} min rimasti',
			'home.lessonProgress' => 'Lezione 2 — Saluti',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
			'home.kContinue' => 'Continua',
			'home.learningPath' => 'A1 - Inizio',
			'home.allLessons' => 'Tutte le Lezioni',
			'home.introductions' => 'Introduzioni I',
			'home.greetings' => 'Saluti',
			'home.jobs' => 'Lavori',
			'home.favoriteRoom' => 'Una Stanza Preferita',
			'home.dailyRoutine' => 'Routine Quotidiana',
			'home.scroll' => 'Scorri',
			'home.liveLesson' => 'Lezione dal Vivo',
			'home.liveLessonSubtitle' => 'Fai una videochiamata con il nostro tutor',
			'home.moreTutor' => 'Altri Tutor',
			'home.startTalkNow' => 'Inizia a Parlare Ora',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adattivo',
			'home.tagCalm' => 'Calmo',
			'home.tagPatient' => 'Paziente',
			'home.tagMethodical' => 'Metodico',
			'home.tagEncouraging' => 'Incoraggiante',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Altre Funzionalità',
			'home.practiceLabel' => 'PRATICA',
			'home.wordPractice' => 'Pratica di Parole',
			'home.wordPracticeBody' => 'Costruisci il tuo vocabolario nella lingua scelta ogni giorno',
			'home.immersiveLabel' => 'IMMERSIVO',
			'home.quiz' => 'Quiz',
			'home.quizBodyLine1' => 'Impara attraverso esempi reali',
			'home.quizBodyLine2' => 'in contesto',
			'home.getStarted' => 'Inizia',
			'home.library' => 'Biblioteca',
			'home.libraryTitle' => 'Impara e Risparmia',
			'home.learnMore' => 'Scopri di Più',
			'home.premium.titleBefore' => 'Il percorso per ',
			'home.premium.titleHighlight' => 'parlare fluentemente',
			'home.premium.titleAfter' => ' senza paura di fare errori.',
			'home.premium.descriptionBefore' => 'Unisciti a milioni di studenti in tutto il mondo. Inizia a superare la barriera linguistica oggi — ',
			'home.premium.descriptionHighlight' => 'i primi 3 giorni completamente gratuiti.',
			'home.premium.feature1' => 'Tutor AI accessibile 24/7',
			'home.premium.feature2' => 'Accesso illimitato a Tutor Privati',
			'home.premium.feature3' => 'Piano di lezione giornaliero su misura per te',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/mo',
			'home.premium.discount' => '40% di sconto con acquisto annuale',
			'home.premium.cta' => 'Inizia',
			'libraryPage.title' => 'Biblioteca',
			'libraryPage.searchWord' => 'Cerca Parola',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Parola Salvata',
			'libraryPage.savedWordTab' => 'Parola Salvata',
			'libraryPage.dictionaryTab' => 'Dizionario',
			'libraryPage.dictionaryLabel' => 'Dizionario',
			'wordPracticePage.title' => 'Pratica di parole',
			'wordPracticePage.turkish' => 'Turchese',
			'wordPracticePage.save' => 'Salva',
			'wordPracticePage.saved' => 'Salvato',
			'wordPracticePage.listen' => 'Ascolta',
			'wordPracticePage.hint' => 'Suggerimento',
			'wordPracticePage.previous' => 'PRECEDENTE',
			'wordPracticePage.next' => 'SUCCESSIVO',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'Cosa vuoi migliorare oggi?',
			'quizPage.subtitle' => 'Scegli il tuo allenamento — ci vogliono meno di 3 minuti 🚀',
			'quizPage.readingTitle' => 'Lettura',
			'quizPage.readingBody' => 'Comprensione tramite articoli e storie',
			'quizPage.writingTitle' => 'Scrittura',
			'quizPage.writingBody' => 'Esercizi di grammatica e vocabolario',
			'quizPage.speakingTitle' => 'Conversazione',
			'quizPage.speakingBody' => 'Pronuncia tramite motore di sintesi vocale AI',
			'quizPage.readingTestTitle' => 'Test di Lettura',
			'quizPage.read' => 'Leggi',
			'quizPage.listeningHint' => 'Pronuncia chiaramente la parola in inglese…',
			'quizPage.micPermissionDenied' => 'Microfono o riconoscimento vocale non disponibili.',
			'quizPage.matchSuccess' => 'Ottimo! Questo corrisponde alla parola.',
			'quizPage.matchFail' => ({required Object heard}) => 'Sentito "${heard}". Riprova.',
			'quizPage.successfulTitle' => 'Riuscito!',
			'quizPage.successfulBody' => 'Pronuncia come un madrelingua!',
			'quizPage.failedTitle' => 'Fallito',
			'quizPage.failedBody' => 'Era quasi fatto, dagli un\'altra possibilità',
			'quizPage.tryAgain' => 'RIPROVA',
			'quizPage.writingTestTitle' => 'Test di Scrittura',
			'quizPage.sourceLanguage' => 'LINGUA DI PARTENZA',
			'quizPage.answer' => 'RISPOSTA',
			'quizPage.writeAnswerHint' => 'Scrivi la tua risposta qui...',
			'quizPage.submit' => 'Invia',
			'quizPage.speakingTestTitle' => 'Test di Conversazione',
			'quizPage.speakingProficiency' => 'Competenza nella Conversazione',
			'quizPage.speakClearlyHint' => 'Parla chiaramente nel tuo microfono:',
			'quizPage.speakUp' => 'Parla Forte',
			'quizPage.recording' => 'Registrazione...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'DOMANDA ${current} DI ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} è in arrivo',
			'placeholder.body' => ({required Object tab}) => 'Stiamo preparando un\'esperienza focalizzata su ${tab} per te.',
			'tutorPage.title' => 'Tutor',
			'tutorPage.chatWithLingola' => 'Chatta con Lingola',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Chatta con ${name}',
			'tutorPage.chatHistory' => 'Cronologia chat',
			'tutorPage.history' => 'Storia',
			'tutorPage.filter' => 'Filtra',
			'tutorPage.country' => 'Paese',
			'tutorPage.focus' => 'Focus',
			'tutorPage.moreCountries' => '8+ in più',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'SALVA',
			'tutorPage.clearFilter' => 'Rimuovi filtri',
			'tutorPage.startTalkNow' => 'Inizia a parlare ora',
			'tutorPage.typeMessage' => 'Scrivi un messaggio...',
			'tutorPage.speaker' => 'Parlante',
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
			'tutorPage.tutors.santa' => 'Babbo Natale',
			'tutorPage.tags.adaptive' => 'Adattivo',
			'tutorPage.tags.calm' => 'Calmo',
			'tutorPage.tags.patient' => 'Paziente',
			'tutorPage.tags.organized' => 'Organizzato',
			'tutorPage.tags.relaxed' => 'Rilassato',
			'tutorPage.tags.methodical' => 'Metodico',
			'tutorPage.tags.attentive' => 'Attento',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Curioso',
			'tutorPage.tags.observer' => 'Osservatore',
			'tutorPage.tags.ancientKnowledge' => 'Conoscenza Antica',
			'tutorPage.tags.wise' => 'Saggio',
			'tutorPage.tags.clear' => 'Chiaro',
			'tutorPage.tags.decisive' => 'Decisivo',
			'tutorPage.tags.disciplined' => 'Disciplinato',
			'tutorPage.tags.smart' => 'Intelligente',
			'tutorPage.tags.analytic' => 'Analitico',
			'tutorPage.tags.cheerful' => 'Allegro',
			'tutorPage.tags.generous' => 'Generoso',
			'tutorPage.historyPreview1' => 'Ehi! Stavo per esplodere dalla noia...',
			'tutorPage.historyPreview2' => 'Pratichiamo a ordinare cibo oggi?',
			'tutorPage.time1' => '11:00',
			'tutorPage.time2' => 'Ieri',
			'tutorPage.chat.incoming1' => 'Buongiorno! Sono felice che ti senti pronto a praticare oggi.',
			'tutorPage.chat.outgoing1' => 'Sì, iniziamo con i saluti.',
			'tutorPage.chat.incoming2' => 'Perfetto. Come diresti ciao a un collega?',
			'tutorPage.chat.typing' => 'Scrivendo',
			'tutorPage.calling.lessonBadge' => 'Lezione 1 : Saluti',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Lezione ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Noioso? Ho cancellato quella parola dal mio vocabolario. Alzati, il piano è già fatto: andiamo in quel nuovo bar arcade a Kadıköy.',
			'tutorPage.calling.highlight' => 'Noioso?',
			'tutorPage.calling.close' => 'Termina chiamata',
			'tutorPage.calling.toggleCaptions' => 'Attiva/disattiva sottotitoli',
			'tutorPage.calling.toggleHints' => 'Attiva/disattiva suggerimenti',
			'tutorPage.calling.toggleMic' => 'Attiva/disattiva microfono',
			'tutorPage.calling.tapToSpeakHint' => 'Tocca per parlare, tocca di nuovo per finire',
			'lessonPage.title' => 'Continua a imparare',
			'lessonPage.profile' => 'Profilo',
			'lessonPage.language' => 'Lingua target',
			'lessonPage.completed' => 'Completato',
			'lessonPage.locked' => 'Bloccato',
			'lessonPage.pickTutorTitle' => 'Scegli il tuo tutor',
			'lessonPage.startTalk' => 'Inizia lezione',
			'lessonPage.chatInstead' => 'Chatta invece',
			'lessonPage.lockedHint' => 'Completa la lezione precedente per sbloccare questa.',
			'lessonPage.levelLockedTitle' => 'Livello bloccato',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Il tuo livello di inglese è ${userLevel}: non puoi aprire lezioni ${lessonLevel} senza completare il percorso precedente.',
			'lessonPage.levelLockedOk' => 'Capito',
			'lessonPage.notesTitle' => 'Note della lezione',
			'lessonPage.whatWeLearned' => 'Cosa abbiamo imparato oggi',
			'lessonPage.deleteNotes' => 'Elimina le mie note di lezione',
			'lessonPage.deleteNotesConfirm' => 'Eliminare queste note? Questa azione non può essere annullata.',
			'lessonPage.delete' => 'Elimina',
			'lessonPage.cancel' => 'Annulla',
			'lessonPage.practiceCta' => 'Se questo ti è sembrato troppo difficile, puoi praticare lo stesso argomento di nuovo.',
			'lessonPage.practiceNow' => 'Pratica questo argomento',
			'lessonPage.openChat' => 'Apri chat con il tutor',
			'lessonPage.yourScore' => 'Il tuo punteggio',
			'lessonPage.bestScore' => ({required Object score}) => 'Miglior ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Partecipante passivo',
			'lessonPage.participationSilentBody' => 'Sei rimasto in silenzio questa volta. Penso che dovresti ripetere questa lezione.',
			'lessonPage.participationPassive' => 'Bassa partecipazione',
			'lessonPage.participationPassiveBody' => 'Hai parlato poco. Prova di nuovo la lezione e parla di più.',
			'lessonPage.participationActive' => 'Buona partecipazione',
			'lessonPage.participationActiveBody' => 'Hai partecipato alla conversazione. Continua così!',
			'lessonPage.participationStrong' => 'Partecipazione forte',
			'lessonPage.participationStrongBody' => 'Hai parlato molto. Ottimo lavoro!',
			'lessonPage.retakeLesson' => 'Ripeti questa lezione',
			'lessonPage.finishLesson' => 'Completa la lezione',
			'lessonPage.savingNotes' => 'Il tuo tutor sta scrivendo le note di oggi...',
			'lessonPage.noNotes' => 'Completa questa lezione per ricevere le note dal tuo tutor.',
			'lessonPage.notesDeleted' => 'Note della lezione eliminate',
			'lessonPage.levels.a1.title' => 'A1 - Inizio',
			'lessonPage.levels.a1.lessons.0' => 'Saluti',
			'lessonPage.levels.a1.lessons.1' => 'Introduzioni I',
			'lessonPage.levels.a1.lessons.2' => 'Lavori',
			'lessonPage.levels.a1.lessons.3' => 'Una stanza preferita',
			'lessonPage.levels.a1.lessons.4' => 'Routine quotidiana',
			'lessonPage.levels.a1.lessons.5' => 'Frutta',
			'lessonPage.levels.a1.lessons.6' => 'Consigli 1',
			'lessonPage.levels.a1.lessons.7' => 'Famiglia 1',
			'lessonPage.levels.a1.lessons.8' => 'Cose quotidiane',
			'lessonPage.levels.a1.lessons.9' => 'Città natale',
			'lessonPage.levels.a1.lessons.10' => 'Casa',
			'lessonPage.levels.a1.lessons.11' => 'Preferenze alimentari',
			'lessonPage.levels.a1.lessons.12' => 'Hobby 1',
			'lessonPage.levels.a1.lessons.13' => 'Persone di successo',
			'lessonPage.levels.a1.lessons.14' => 'Cibo e bevande',
			'lessonPage.levels.a1.lessons.15' => 'Ordinare al ristorante',
			'lessonPage.levels.a1.lessons.16' => 'Animali domestici',
			'lessonPage.levels.a1.lessons.17' => 'Salute e fitness',
			'lessonPage.levels.a1.lessons.18' => 'Meteo',
			'lessonPage.levels.a1.lessons.19' => 'Nuovo stile di vita',
			'lessonPage.levels.a1.lessons.20' => 'Migliorarsi',
			'lessonPage.levels.a1.lessons.21' => 'Hobby 2',
			'lessonPage.levels.a1.lessons.22' => 'Domande sui luoghi',
			'lessonPage.levels.a1.lessons.23' => 'Possesso',
			'lessonPage.levels.a1.lessons.24' => 'Shopping 1',
			'lessonPage.levels.a1.lessons.25' => 'Dire l\'ora',
			'lessonPage.levels.a1.lessons.26' => 'Indicazioni 1',
			'lessonPage.levels.a1.lessons.27' => 'Shopping 2',
			'lessonPage.levels.a1.lessons.28' => 'Conoscersi meglio',
			'lessonPage.levels.a1.lessons.29' => 'Luoghi di oggetti',
			'lessonPage.levels.a1.lessons.30' => 'Aspetto',
			'lessonPage.levels.a1.lessons.31' => 'Indicazioni 2',
			'lessonPage.levels.a2.title' => 'A2 - Base',
			'lessonPage.levels.a2.lessons.0' => 'Famiglia 2',
			'lessonPage.levels.a2.lessons.1' => 'Persone e luoghi',
			'lessonPage.levels.a2.lessons.2' => 'Famiglia 3',
			'lessonPage.levels.a2.lessons.3' => 'Descrivere oggetti',
			'lessonPage.levels.a2.lessons.4' => 'Città',
			'lessonPage.levels.a2.lessons.5' => 'Il progetto edilizio',
			'lessonPage.levels.a2.lessons.6' => 'Casa dolce casa',
			'lessonPage.levels.a2.lessons.7' => 'Che ore sono?',
			'lessonPage.levels.a2.lessons.8' => 'Routine quotidiana 2',
			'lessonPage.levels.a2.lessons.9' => 'Tempo libero',
			'lessonPage.levels.a2.lessons.10' => 'Cibo e nutrizione',
			'lessonPage.levels.a2.lessons.11' => 'Shopping e consumatori',
			'lessonPage.levels.a2.lessons.12' => 'Vacanze',
			'lessonPage.levels.a2.lessons.13' => 'Piani per il weekend',
			'lessonPage.levels.a2.lessons.14' => 'Formale o informale',
			'lessonPage.levels.a2.lessons.15' => 'Moda',
			'lessonPage.levels.a2.lessons.16' => 'Shopping 3',
			'lessonPage.levels.a2.lessons.17' => 'Consigli 2',
			'lessonPage.levels.a2.lessons.18' => 'Puoi farcela',
			'lessonPage.levels.a2.lessons.19' => 'Shopping 4',
			'lessonPage.levels.a2.lessons.20' => 'Conversazione leggera',
			'lessonPage.levels.a2.lessons.21' => 'Un latte per favore',
			'lessonPage.levels.a2.lessons.22' => 'Cibo',
			'lessonPage.levels.a2.lessons.23' => 'Muoversi',
			'lessonPage.levels.a2.lessons.24' => 'Pronto per un viaggio',
			'lessonPage.levels.a2.lessons.25' => 'Viaggio 1',
			'lessonPage.levels.a2.lessons.26' => 'Fughe urbane',
			'lessonPage.levels.a2.lessons.27' => 'Viaggio 2',
			'lessonPage.levels.a2.lessons.28' => 'Un posto dove stare',
			'lessonPage.levels.a2.lessons.29' => 'Così emozionante',
			'lessonPage.levels.a2.lessons.30' => 'La persona giusta',
			'lessonPage.levels.a2.lessons.31' => 'Scuola',
			'lessonPage.levels.a2.lessons.32' => 'Preferenze musicali',
			'lessonPage.levels.a2.lessons.33' => 'Sport',
			'lessonPage.levels.a2.lessons.34' => 'Regole della corsa',
			'lessonPage.levels.a2.lessons.35' => 'Lascia un messaggio',
			'lessonPage.levels.a2.lessons.36' => 'Richieste',
			'lessonPage.levels.a2.lessons.37' => 'Inviti',
			'lessonPage.levels.a2.lessons.38' => 'Esperienze di viaggio',
			'lessonPage.levels.a2.lessons.39' => 'Passato 1',
			'lessonPage.levels.a2.lessons.40' => 'Passato 2',
			'lessonPage.levels.a2.lessons.41' => 'Passato 3',
			'lessonPage.levels.a2.lessons.42' => 'Domande sul passato',
			'lessonPage.levels.a2.lessons.43' => 'Non sei mai troppo vecchio',
			'lessonPage.levels.a2.lessons.44' => 'Ricordi d\'infanzia',
			'lessonPage.levels.a2.lessons.45' => 'Complimenti',
			'lessonPage.levels.a2.lessons.46' => 'Scuse',
			'lessonPage.levels.a2.lessons.47' => 'È così fastidioso!',
			'lessonPage.levels.a2.lessons.48' => 'Un mondo digitale',
			'lessonPage.levels.a2.lessons.49' => 'Vita lavorativa',
			'lessonPage.levels.a2.lessons.50' => 'Non ho capito',
			'lessonPage.levels.a2.lessons.51' => 'Risparmiare o spendere?',
			'lessonPage.levels.a2.lessons.52' => 'Chiedere scusa',
			'lessonPage.levels.b1.title' => 'B1 - Intermedio',
			'lessonPage.levels.b1.lessons.0' => 'Tradizioni culturali',
			'lessonPage.levels.b1.lessons.1' => 'Celebrità',
			'lessonPage.levels.b1.lessons.2' => 'Arte e creatività',
			'lessonPage.levels.b1.lessons.3' => 'Piani futuri',
			'lessonPage.levels.b1.lessons.4' => 'Pianificazione di eventi',
			'lessonPage.levels.b1.lessons.5' => 'Obiettivi e piani',
			'lessonPage.levels.b1.lessons.6' => 'Eventi storici',
			'lessonPage.levels.b1.lessons.7' => 'Tecnologia',
			'lessonPage.levels.b1.lessons.8' => 'Mai e poi mai',
			'lessonPage.levels.b1.lessons.9' => 'Cosa c\'è in programma',
			'lessonPage.levels.b1.lessons.10' => 'Vacanza da sogno',
			'lessonPage.levels.b1.lessons.11' => 'Social media',
			'lessonPage.levels.b1.lessons.12' => 'Consigli di lettura',
			'lessonPage.levels.b1.lessons.13' => 'Uno di quei giorni',
			'lessonPage.levels.b1.lessons.14' => 'Foto speciali',
			'lessonPage.levels.b1.lessons.15' => 'Risultati personali',
			'lessonPage.levels.b1.lessons.16' => 'Film preferiti',
			'lessonPage.levels.b1.lessons.17' => 'Notizie flash',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.b1.lessons.18' => 'Felicità',
			'lessonPage.levels.b1.lessons.19' => 'Una settimana intensa',
			'lessonPage.levels.b1.lessons.20' => 'Dove sono cresciuto',
			'lessonPage.levels.b1.lessons.21' => 'Giorni di scuola',
			'lessonPage.levels.b1.lessons.22' => 'Profili',
			'lessonPage.levels.b1.lessons.23' => 'Mappe della vita',
			'lessonPage.levels.b1.lessons.24' => 'Ogni giorno',
			'lessonPage.levels.b1.lessons.25' => 'Cosa c\'è dopo',
			'lessonPage.levels.b1.lessons.26' => 'Fare suggerimenti',
			'lessonPage.levels.b1.lessons.27' => 'Cosa è successo',
			'lessonPage.levels.b1.lessons.28' => 'Ricordi',
			'lessonPage.levels.b1.lessons.29' => 'Shock culturale',
			'lessonPage.levels.b1.lessons.30' => 'Frasi di interesse',
			'lessonPage.levels.b1.lessons.31' => 'Colloqui di lavoro',
			'lessonPage.levels.b1.lessons.32' => 'Liste dei desideri',
			'lessonPage.levels.b1.lessons.33' => 'Il mio tipo di città',
			'lessonPage.levels.b1.lessons.34' => 'La generazione internet',
			'lessonPage.levels.b1.lessons.35' => 'Marche popolari',
			'lessonPage.levels.b1.lessons.36' => 'Frasi di opinione',
			'lessonPage.levels.b1.lessons.37' => 'Com\'è',
			'lessonPage.levels.b1.lessons.38' => 'Spazio abitativo',
			'lessonPage.levels.b1.lessons.39' => 'Mangiare bene',
			'lessonPage.levels.b1.lessons.40' => 'Hobby insoliti',
			'lessonPage.levels.b1.lessons.41' => 'Una scelta difficile',
			'lessonPage.levels.b1.lessons.42' => 'Agire',
			'lessonPage.levels.b1.lessons.43' => 'Nuove abilità',
			'lessonPage.levels.b1.lessons.44' => 'Fare un reclamo',
			'lessonPage.levels.b1.lessons.45' => 'Istruzione',
			'lessonPage.levels.b1.lessons.46' => 'Città verdi',
			'lessonPage.levels.b1.lessons.47' => 'Cosa c\'è in un lavoro',
			'lessonPage.levels.b1.lessons.48' => 'Sfide personali',
			'lessonPage.levels.b1.lessons.49' => 'Frasi per colloqui',
			'lessonPage.levels.b1.lessons.50' => 'Conclusioni educate',
			'lessonPage.levels.b1.lessons.51' => 'Notizie in primo piano',
			'lessonPage.levels.b1.lessons.52' => 'Piccole modifiche',
			'lessonPage.levels.b1.lessons.53' => 'Scuse per le scuse',
			'lessonPage.levels.b1.lessons.54' => 'Etichetta telefonica',
			'lessonPage.levels.b1.lessons.55' => 'Scusa per l\'interruzione…',
			'lessonPage.levels.b1.lessons.56' => 'Risposte ai reclami',
			'lessonPage.levels.b2.title' => 'B2 - Intermedio Avanzato',
			'lessonPage.levels.b2.lessons.0' => 'Personalità',
			'lessonPage.levels.b2.lessons.1' => 'Grandi leader',
			'lessonPage.levels.b2.lessons.2' => 'Stile di vita sano',
			'lessonPage.levels.b2.lessons.3' => 'Qual è la verità?',
			'lessonPage.levels.b2.lessons.4' => 'Crescita personale',
			'lessonPage.levels.b2.lessons.5' => 'Esporsi',
			'lessonPage.levels.b2.lessons.6' => 'Recitare?',
			'lessonPage.levels.b2.lessons.7' => 'Ricordo...',
			'lessonPage.levels.b2.lessons.8' => 'Feedback sociale',
			'lessonPage.levels.b2.lessons.9' => 'Scena del crimine',
			'lessonPage.levels.b2.lessons.10' => 'Problemi educati',
			'lessonPage.levels.b2.lessons.11' => 'Risoluzione dei conflitti',
			'lessonPage.levels.b2.lessons.12' => 'Amalo o odiarlo?',
			'lessonPage.levels.b2.lessons.13' => 'Problemi ambientali',
			'lessonPage.levels.b2.lessons.14' => 'Possiamo risolverlo',
			'lessonPage.levels.b2.lessons.15' => 'Misteri e crimini',
			'lessonPage.levels.b2.lessons.16' => 'Futuri possibili',
			'lessonPage.levels.b2.lessons.17' => 'Piani aziendali',
			'lessonPage.levels.b2.lessons.18' => 'Decisioni in riunione',
			'lessonPage.levels.b2.lessons.19' => 'È così prevedibile...',
			'lessonPage.levels.b2.lessons.20' => 'Sul lavoro',
			'lessonPage.levels.b2.lessons.21' => 'Scienza e tecnologia',
			'lessonPage.levels.b2.lessons.22' => 'Gestione del tempo',
			'lessonPage.levels.b2.lessons.23' => 'Diritti umani',
			'lessonPage.levels.c1.title' => 'C1 - Avanzato',
			'lessonPage.levels.c1.lessons.0' => 'Norme culturali',
			'lessonPage.levels.c1.lessons.1' => 'Influenza dei social media',
			'lessonPage.levels.c1.lessons.2' => 'Scelte di carriera',
			'lessonPage.levels.c1.lessons.3' => 'Accelerare le prestazioni',
			'lessonPage.levels.c1.lessons.4' => 'Invenzioni',
			'lessonPage.levels.c1.lessons.5' => 'Viaggio nel tempo',
			'lessonPage.levels.c1.lessons.6' => 'Possessi',
			'lessonPage.levels.c1.lessons.7' => 'Competenze lavorative',
			'lessonPage.levels.c1.lessons.8' => 'Cambiamenti storici',
			'lessonPage.levels.c1.lessons.9' => 'Scrittura di recensioni',
			'lessonPage.levels.c1.lessons.10' => 'Misteri',
			'lessonPage.levels.c1.lessons.11' => 'Teorie strane',
			'lessonPage.levels.c1.lessons.12' => 'Celebrità',
			'lessonPage.levels.c1.lessons.13' => 'Politica globale',
			'lessonPage.levels.c1.lessons.14' => 'Boom dei prodotti',
			'lessonPage.levels.c1.lessons.15' => 'Sarai felice?',
			'lessonPage.levels.c1.lessons.16' => 'Forse più tardi...',
			'lessonPage.levels.c1.lessons.17' => 'Nuove soluzioni',
			'lessonPage.levels.c1.lessons.18' => 'Influenza contestuale',
			'lessonPage.levels.c1.lessons.19' => 'Un logo perduto',
			'lessonPage.levels.c1.lessons.20' => 'Atti gentili',
			'lessonPage.levels.c1.lessons.21' => 'Che film',
			'lessonPage.levels.c1.lessons.22' => 'Che fastidio',
			'lessonPage.levels.c1.lessons.23' => 'Nelle notizie',
			'lessonPage.levels.c2.title' => 'C2 - Esperto',
			'lessonPage.levels.c2.lessons.0' => 'Globalizzazione',
			'lessonPage.levels.c2.lessons.1' => 'Disastri naturali',
			'lessonPage.levels.c2.lessons.2' => 'Reagire alle informazioni',
			'lessonPage.levels.c2.lessons.3' => 'Equilibrio tra vita lavorativa e vita privata',
			'lessonPage.levels.c2.lessons.4' => 'Lavoro da remoto',
			'lessonPage.levels.c2.lessons.5' => 'Problemi familiari',
			'lessonPage.levels.c2.lessons.6' => 'Anatomia umana di base',
			'lessonPage.levels.c2.lessons.7' => 'Previsioni sulla salute',
			'lessonPage.levels.c2.lessons.8' => 'Accesso alla sanità',
			'lessonPage.levels.c2.lessons.9' => 'Esperienza di viaggio globale',
			'lessonPage.levels.c2.lessons.10' => 'Superpoteri',
			'lessonPage.levels.c2.lessons.11' => 'Team building',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescenza',
			'lessonPage.levels.c2.lessons.13' => 'Dilemmi',
			'lessonPage.levels.c2.lessons.14' => 'Entusiasmo sociale',
			'lessonPage.levels.c2.lessons.15' => 'Cambiamenti',
			'lessonPage.levels.c2.lessons.16' => 'Lavoro, lavoro, lavoro',
			'lessonPage.levels.c2.lessons.17' => 'Problemi locali',
			'lessonPage.levels.c2.lessons.18' => 'Problemi, problemi',
			'lessonPage.levels.c2.lessons.19' => 'Fatto o finzione?',
			'lessonPage.levels.c2.lessons.20' => 'Turismo',
			'lessonPage.levels.c2.lessons.21' => 'Volontariato',
			'lessonPage.levels.c2.lessons.22' => 'L\'occhio della mente',
			'lessonPage.levels.c2.lessons.23' => 'Consumo dei media',
			'rolePlayPage.title' => 'Gioco di Ruolo',
			'rolePlayPage.subtitle' => 'Scegli il tuo ruolo — vivi uno scenario reale 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} completato',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Principiante',
			'rolePlayPage.screenplay' => 'COPIONE',
			'rolePlayPage.dailyInteractions' => 'Interazioni Quotidiane',
			'rolePlayPage.business' => 'Affari',
			'rolePlayPage.coffee.title' => 'Ordinare al Bar',
			'rolePlayPage.coffee.screenplay' => 'Ordina la tua bevanda preferita, chiedi informazioni su taglie e extra, conferma il tuo totale e ritira il tuo caffè al bancone.',
			'rolePlayPage.coffee.chat.briefing' => 'Ciao! Oggi praticheremo l\'ordinazione al bar — saluti, taglie, extra. Spiegherò un po\' prima, poi reciteremo. Va bene?',
			'rolePlayPage.coffee.chat.incoming1' => 'Benvenuto! Cosa posso prepararti oggi?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Ciao! Vorrei un latte medio, per favore.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Certo',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Vuoi che sia caldo o freddo, e qualche extra?',
			'rolePlayPage.coffee.chat.botReply' => 'Ottima scelta. Vuoi aggiungere qualcos\'altro al tuo ordine?',
			'rolePlayPage.directions.title' => 'Chiedere Indicazioni per Strada',
			'rolePlayPage.directions.screenplay' => 'Chiedi indicazioni per un luogo, scopri come arrivare alla metropolitana o all\'autobus, ottieni informazioni sui biglietti e ascolta raccomandazioni sui ristoranti.',
			'rolePlayPage.directions.chat.briefing' => 'Ciao! Oggi praticheremo a chiedere indicazioni per strada. Spiegherò un po\' prima, poi reciteremo. Va bene?',
			'rolePlayPage.directions.chat.incoming1' => 'Ciao! Sembri un po\' perso — hai bisogno di aiuto per trovare qualcosa?',
			'rolePlayPage.directions.chat.outgoing1' => 'Sì, sto cercando la stazione della metropolitana più vicina.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Certo',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Cammina due isolati in quella direzione, poi gira a sinistra. Vedrai l\'ingresso.',
			'rolePlayPage.directions.chat.botReply' => 'Prego! Vuoi anche un consiglio su un ristorante vicino alla stazione?',
			'rolePlayPage.interview.title' => 'Colloquio di Lavoro',
			'rolePlayPage.interview.screenplay' => 'Presentati, rispondi a domande comuni del colloquio, parla della tua esperienza e chiedi informazioni sul ruolo e sui prossimi passi.',
			'rolePlayPage.interview.chat.briefing' => 'Ciao! Oggi praticheremo un colloquio di lavoro. Spiegherò un po\' prima, poi reciteremo — io ti intervisto, poi ci scambiamo. Va bene?',
			'rolePlayPage.interview.chat.incoming1' => 'Grazie per essere venuto oggi. Potresti presentarti brevemente?',
			'rolePlayPage.interview.chat.outgoing1' => 'Certo. Sono entusiasta di essere qui e condividere la mia esperienza.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Meraviglioso',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Parlami di un progetto recente di cui sei orgoglioso.',
			'rolePlayPage.interview.chat.botReply' => 'È impressionante. Quali domande hai sul ruolo?',
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
			'notificationsPage.title' => 'Notifiche',
			'notificationsPage.deleteConfirmTitle' => 'Sei sicuro?',
			'notificationsPage.deleteConfirmBody' => 'Questa notifica verrà eliminata.',
			'notificationsPage.delete' => 'Elimina',
			'notificationsPage.cancel' => 'Annulla',
			'notificationsPage.translation.title' => 'Nuova Traduzione Pronta',
			'notificationsPage.translation.body' => 'Il tuo file di traduzione audio è stato convertito con successo in testo e tradotto.',
			'notificationsPage.offer.title' => 'Un\'Offerta Speciale Ti Aspetta',
			'notificationsPage.offer.body' => 'Passa a Premium per traduzioni fotografiche illimitate con il 50% di sconto.',
			'notificationsPage.stories.title' => 'Scopri Nuove Storie',
			'notificationsPage.stories.body' => 'Impara nuove parole attraverso le storie',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Nessuna notifica ancora',
			'notificationsPage.emptySubtitle' => 'Non dimenticare di controllare di nuovo quando ricevi una notifica.',
			'profilePage.title' => 'Profilo',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Versione Gratuita',
			'profilePage.dayStreak' => 'Serie di Giorni!',
			'profilePage.accountSettings' => 'Impostazioni Account',
			'profilePage.general' => 'Generale',
			'profilePage.profileSettings' => 'Impostazioni Profilo',
			'profilePage.fullName' => 'Nome Completo',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Elimina Account',
			'profilePage.save' => 'SALVA',
			'profilePage.deleteTitle' => 'Non vogliamo che tu vada, ma ti capiamo.',
			'profilePage.deleteBody' => 'Puoi dirci perché vuoi lasciare per migliorare la tua esperienza con Lingola?',
			'profilePage.deleteReasons.aiCharacters' => 'Non trovavo realistici i personaggi dell\'intelligenza artificiale.',
			'profilePage.deleteReasons.videoIssues' => 'Ho problemi tecnici durante le videochiamate.',
			'profilePage.deleteReasons.pricing' => 'I prezzi degli abbonamenti sono superiori alle mie aspettative.',
			'profilePage.deleteReasons.noMatch' => 'Non ho trovato personaggi nel mio stile.',
			'profilePage.deleteReasons.shortTrial' => 'Volevo solo provare per un breve periodo.',
			'profilePage.deleteReasons.other' => 'Altro',
			'profilePage.messageOptional' => 'Messaggio (opzionale)',
			'profilePage.messageHint' => 'Se hai un messaggio, per favore scrivilo.',
			'profilePage.next' => 'PROSSIMO',
			'profilePage.specialOfferTitle' => 'Offerta Speciale',
			'profilePage.specialOfferBody' => 'Dai un\'occhiata all\'offerta che abbiamo preparato per te prima di andare.',
			'profilePage.monthlyPlanTitle' => 'Passa al Piano Mensile',
			'profilePage.monthlyPlanPrice' => '\$79/mese, annulla in qualsiasi momento',
			'profilePage.monthlyPlanDesc' => 'Nessun impegno a lungo termine. Rimani connesso con la nostra comunità mese per mese.',
			'profilePage.whatYoullKeep' => 'Cosa manterrai:',
			'profilePage.keepCharacters' => 'Accesso a tutti i personaggi',
			'profilePage.keepVideo' => 'Videochiamate illimitate',
			'profilePage.keepCourses' => 'Accesso a tutti i corsi',
			'profilePage.switchMonthlyCta' => 'Passa al Piano Mensile',
			'profilePage.confirmTitle' => 'Sei sicuro?',
			'profilePage.confirmBody' => 'Non vogliamo davvero vederti andare. Ecco cosa perderai:',
			'profilePage.loseCharacters' => 'Accesso illimitato ai personaggi',
			'profilePage.loseVideo' => 'Accesso illimitato alle videochiamate',
			'profilePage.loseCourses' => 'Accesso a tutti i corsi',
			'profilePage.discountTitle' => 'Rimani e ottieni il 60% di sconto per 1 mese',
			'profilePage.discountSubtitle' => 'La nostra migliore offerta di sempre. Solo \$27.60/mese',
			'profilePage.acceptDiscountCta' => 'Accetta il 60% di Sconto & Rimani',
			'profilePage.farewellTitle' => 'Siamo tristi di vederti andare',
			'profilePage.farewellBody' => ({required Object date}) => 'La tua iscrizione è stata annullata. Avrai accesso fino alla fine del tuo attuale periodo di fatturazione il ${date}.',
			'profilePage.changeMindTitle' => '✨ Cambia idea?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Puoi riattivare la tua iscrizione in qualsiasi momento prima del ${date} per mantenere i tuoi benefici.',
			'profilePage.reactivateCta' => 'Aspetta, voglio riattivare',
			'profilePage.done' => 'FATTO',
			'profilePage.notifications' => 'Notifiche',
			'profilePage.appLanguage' => 'Lingua dell\'App',
			'profilePage.explanationLanguage' => 'Lingua delle spiegazioni',
			'profilePage.explanationNative' => 'Lingua madre',
			'profilePage.explanationEnglish' => 'Inglese',
			'profilePage.explanationUpdateFailed' => 'Impossibile aggiornare la lingua delle spiegazioni',
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
			'profilePage.remindMe' => 'Ricordami',
			'profilePage.reminderSave' => 'Salva',
			'profilePage.reminderSaved' => 'Promemoria salvato',
			'profilePage.selectLanguageTitle' => 'Seleziona Lingua',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passivo',
			'profilePage.active' => 'Attivo',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Condividi con un Amico',
			'profilePage.shareWithFriendTitle' => 'Condividi con un Amico',
			'profilePage.shareInviteBody' => 'Invita i tuoi amici e goditi la traduzione insieme',
			'profilePage.rateUs' => 'Valutaci',
			'profilePage.faq' => 'FAQ di Lingola',
			'profilePage.faqItems.supportedLanguages.question' => 'Quali lingue supporta l\'app?',
			'profilePage.faqItems.supportedLanguages.answer' => 'L\'interfaccia di Lingola è disponibile in inglese, tedesco, italiano, francese, turco, giapponese, spagnolo, russo, hindi, portoghese e cinese semplificato.',
			'profilePage.faqItems.howAiWorks.question' => 'Come funziona l\'IA?',
			'profilePage.faqItems.howAiWorks.answer' => 'L\'IA interagisce con te come un vero tutor. Analizza le tue conversazioni, rileva errori e offre feedback personalizzato in base ai tuoi progressi.',
			'profilePage.faqItems.offlineUse.question' => 'Posso usare l\'app offline?',
			'profilePage.faqItems.offlineUse.answer' => 'Sì. Puoi scaricare in anticipo alcune lezioni e scenari di conversazione e usarli offline. Tuttavia, la chat dal vivo richiede una connessione a Internet.',
			'profilePage.faqItems.isFree.question' => 'L\'app è gratuita?',
			'profilePage.faqItems.isFree.answer' => 'La versione base è gratuita. Con Premium, ottieni scenari di chat avanzati, analisi della pronuncia e modalità tutor personale.',
			'profilePage.faqItems.pronunciationEval.question' => 'Come viene valutata la mia pronuncia?',
			'profilePage.faqItems.pronunciationEval.answer' => 'L\'app analizza la tua voce e utilizza il riconoscimento vocale basato su IA per valutare il tuo accento e la tua pronuncia. Le parole che devi migliorare sono evidenziate.',
			'profilePage.faqItems.dailyPractice.question' => 'Devo praticare ogni giorno?',
			'profilePage.faqItems.dailyPractice.answer' => 'Sì. Il sistema tiene traccia dei tuoi progressi ogni giorno. Solo 10–15 minuti di pratica orale al giorno possono accelerare notevolmente il tuo apprendimento linguistico.',
			'profilePage.faqItems.levelDetermination.question' => 'Come viene determinato il mio livello di apprendimento?',
			'profilePage.faqItems.levelDetermination.answer' => 'Un breve controllo del livello quando accedi per la prima volta analizza le tue conoscenze attuali. Dopo di che, l\'IA raccomanda automaticamente lezioni adatte al tuo livello.',
			'profilePage.faqItems.realPeopleChat.question' => 'Posso parlare con persone reali?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Sì. Gli utenti Premium possono pianificare brevi sessioni di pratica con veri tutor.',
			'profilePage.faqItems.dataSecurity.question' => 'I miei dati sono al sicuro?',
			'profilePage.faqItems.dataSecurity.answer' => 'Assolutamente. Tutte le conversazioni e i dati degli utenti sono memorizzati in modo crittografato. Le tue informazioni personali non vengono mai condivise con terze parti.',
			'profilePage.faqItems.disableReminders.question' => 'Come disattivo i promemoria giornalieri?',
			'profilePage.faqItems.disableReminders.answer' => 'Vai nelle Impostazioni Profilo, apri Notifiche e cambia la frequenza dei promemoria o disattiva completamente le notifiche.',
			'profilePage.support' => 'Supporto',
			'profilePage.feedback' => 'Feedback',
			'profilePage.progression' => 'Progressione',
			'profilePage.progressTitle' => 'Progresso',
			'profilePage.goodMorning' => 'Buongiorno,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'Inglese',
			'profilePage.past7Days' => 'Ultimi 7 Giorni',
			'profilePage.past7DaysBody' => 'Studia ogni giorno per costruire la tua serie e creare un\'abitudine di apprendimento potente.',
			'profilePage.currentLevel' => 'Livello Attuale',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Solo ${xp} XP rimasti per raggiungere ${level}!',
			'profilePage.toNextLevel' => 'AL PROSSIMO LIVELLO',
			'profilePage.dayStreakLabel' => 'Serie di Giorni',
			'profilePage.totalPoints' => 'Punti Totali',
			'profilePage.savedWords' => 'Parole Salvate',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} articoli da rivedere',
			'profilePage.logout' => 'Disconnetti',
			'profilePage.logoutTitle' => 'Stai per disconnetterti',
			'profilePage.logoutBody' => 'A presto! Ci mancheranno i tuoi esercizi di respirazione.',
			'profilePage.logoutConfirm' => 'DISCONNETTI',
			'profilePage.logoutCancel' => 'ANNULLA',
			'profilePage.days.mon' => 'LUN',
			'profilePage.days.tue' => 'MAR',
			'profilePage.days.wed' => 'MER',
			'profilePage.days.thu' => 'GIO',
			'profilePage.days.fri' => 'VEN',
			'profilePage.days.sat' => 'SAB',
			'profilePage.days.sun' => 'DOM',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Il tuo certificato',
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
			'profilePage.certificateVerifyHint' => 'Chiunque può scansionare il codice QR per verificare il tuo risultato.',
			'profilePage.certificateShare' => 'Condividi certificato',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'Certificato bloccato',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'Non puoi ancora usare questo certificato perché non hai completato le lezioni ${level}.',
			'profilePage.certificateNotAvailableOk' => 'Capito',
			'profilePage.certificateShareQr' => 'Condividi codice QR',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Quando completi un livello CEFR su Lingola, il tuo certificato apparirà qui — con il tuo nome, livello e un codice QR da scansionare per la verifica.',
			'profilePage.certificatePreviewHint' => 'Completa un percorso di livello per sbloccare il certificato',
			'profilePage.certificateTapToView' => 'Tocca per visualizzare e condividere il certificato',
			'profilePage.settings' => 'Impostazioni',
			'profilePage.dailyGoalValueLight' => '5-10 min/giorno',
			'profilePage.dailyGoalValueRecommended' => '15-20 min/giorno',
			'profilePage.dailyGoalValueFast' => '30+ min/giorno',
			'profilePage.settingsShare' => 'Share',
			'profilePage.settingsSupport' => 'Support',
			'profilePage.settingsAbout' => 'About',
			'profilePage.settingsAccount' => 'Account',
			'profilePage.followInstagram' => 'Follow on Instagram',
			'profilePage.followTikTok' => 'Follow on TikTok',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Sembra che tu abbia fatto una breve pausa.',
			'pushNotifications.h2.1' => 'Hai un momento per una parola?',
			'pushNotifications.h2.2' => 'Siamo qui — senza fretta.',
			'pushNotifications.h2.3' => 'Il tuo ritmo di apprendimento si è fermato un attimo.',
			'pushNotifications.h2.4' => 'Una mini revisione potrebbe farti bene.',
			'pushNotifications.h4.0' => 'Una nuova parola potrebbe aspettarti oggi 👀',
			'pushNotifications.h4.1' => 'Potresti avere un\'opportunità per una pratica veloce.',
			'pushNotifications.h4.2' => 'Potresti aver saltato una frase utile.',
			'pushNotifications.h4.3' => 'I progressi di oggi sono ancora aperti.',
			'pushNotifications.h4.4' => 'Una parola, una frase… magari entrambe.',
			'pushNotifications.h8.0' => 'Non è necessario progredire ogni giorno.',
			'pushNotifications.h8.1' => 'Anche una piccola revisione conta.',
			'pushNotifications.h8.2' => 'Non hai perso nulla non studiando oggi.',
			'pushNotifications.h8.3' => 'Siamo pronti quando lo sei tu.',
			'pushNotifications.h8.4' => 'Imparare una lingua è una maratona, non uno sprint.',
			'pushNotifications.h24.0' => 'È passato un giorno. Le tue parole sono ancora qui.',
			'pushNotifications.h24.1' => 'Prendersi una pausa è normale.',
			'pushNotifications.h24.2' => 'Il tuo posto è proprio dove lo hai lasciato.',
			'pushNotifications.h24.3' => 'Continua quando vuoi.',
			'pushNotifications.h24.4' => 'La lingua non scapperà — né noi.',
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
