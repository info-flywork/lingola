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
class TranslationsDe with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$de app = _Translations$app$de._(_root);
	@override late final _Translations$common$de common = _Translations$common$de._(_root);
	@override late final _Translations$onboarding$de onboarding = _Translations$onboarding$de._(_root);
	@override late final _Translations$targetLanguage$de targetLanguage = _Translations$targetLanguage$de._(_root);
	@override late final _Translations$language$de language = _Translations$language$de._(_root);
	@override late final _Translations$setup$de setup = _Translations$setup$de._(_root);
	@override late final _Translations$accountCreating$de accountCreating = _Translations$accountCreating$de._(_root);
	@override late final _Translations$previewChat$de previewChat = _Translations$previewChat$de._(_root);
	@override late final _Translations$paywall$de paywall = _Translations$paywall$de._(_root);
	@override late final _Translations$auth$de auth = _Translations$auth$de._(_root);
	@override late final _Translations$nav$de nav = _Translations$nav$de._(_root);
	@override late final _Translations$home$de home = _Translations$home$de._(_root);
	@override late final _Translations$libraryPage$de libraryPage = _Translations$libraryPage$de._(_root);
	@override late final _Translations$wordPracticePage$de wordPracticePage = _Translations$wordPracticePage$de._(_root);
	@override late final _Translations$quizPage$de quizPage = _Translations$quizPage$de._(_root);
	@override late final _Translations$placeholder$de placeholder = _Translations$placeholder$de._(_root);
	@override late final _Translations$tutorPage$de tutorPage = _Translations$tutorPage$de._(_root);
	@override late final _Translations$lessonPage$de lessonPage = _Translations$lessonPage$de._(_root);
	@override late final _Translations$rolePlayPage$de rolePlayPage = _Translations$rolePlayPage$de._(_root);
	@override late final _Translations$notificationsPage$de notificationsPage = _Translations$notificationsPage$de._(_root);
	@override late final _Translations$profilePage$de profilePage = _Translations$profilePage$de._(_root);
	@override late final _Translations$pushNotifications$de pushNotifications = _Translations$pushNotifications$de._(_root);
	@override late final _Translations$apiErrors$de apiErrors = _Translations$apiErrors$de._(_root);
}

// Path: app
class _Translations$app$de implements Translations$app$en {
	_Translations$app$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Benachrichtigungen';
	@override String get streak => 'Lernserie';
	@override String get profile => 'Profil';
}

// Path: common
class _Translations$common$de implements Translations$common$en {
	_Translations$common$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'FORTSETZEN';
	@override String get back => 'ZURÜCK';
	@override String get locked => 'Gesperrt';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get close => 'Schließen';
	@override String get getStarted => 'LOSLEGEN';
	@override String get connectionError => 'Keine Verbindung. Überprüfe dein Internet und versuche es erneut.';
	@override String get genericError => 'Etwas ist schiefgelaufen. Bitte versuche es erneut.';
	@override String get tryAgain => 'Erneut versuchen';
}

// Path: onboarding
class _Translations$onboarding$de implements Translations$onboarding$en {
	_Translations$onboarding$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Onboarding-Seite ${current} von ${total}';
	@override late final _Translations$onboarding$slide1$de slide1 = _Translations$onboarding$slide1$de._(_root);
	@override late final _Translations$onboarding$slide2$de slide2 = _Translations$onboarding$slide2$de._(_root);
	@override late final _Translations$onboarding$slide3$de slide3 = _Translations$onboarding$slide3$de._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$de implements Translations$targetLanguage$en {
	_Translations$targetLanguage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wähle die Sprache, die du lernen möchtest';
	@override String get comingSoon => 'Weitere Sprachen kommen bald';
	@override String get korean => 'Koreanisch';
	@override String get portuguese => 'Portugiesisch';
	@override String get portugueseBrazil => 'Portugiesisch (Brasilien)';
	@override String get german => 'Deutsch';
	@override String get italian => 'Italienisch';
	@override String get simplifiedChinese => 'Vereinfachtes Chinesisch';
	@override String get arabic => 'Arabisch';
	@override String get turkish => 'Türkisch';
	@override String get hindi => 'Hindi';
}

// Path: language
class _Translations$language$de implements Translations$language$en {
	_Translations$language$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Schritt ${current} von ${total}';
	@override String get title => 'Was möchtest du sprechen?';
	@override String get nativeSection => 'Ich spreche';
	@override String get nativeField => 'Muttersprache';
	@override String get nativeName => 'Türkisch';
	@override String get targetSection => 'Ich möchte lernen';
	@override String get targetField => 'Zielsprache';
	@override String get targetName => 'Englisch';
	@override String get direction => 'Sprachrichtung';
	@override String get selectLanguage => 'Sprache auswählen';
	@override String get comingSoonBadge => 'Demnächst...';
	@override String get english => 'Englisch';
	@override String get french => 'Französisch';
	@override String get japanese => 'Japanisch';
	@override String get spanish => 'Spanisch';
	@override String get russian => 'Russisch';
}

// Path: setup
class _Translations$setup$de implements Translations$setup$en {
	_Translations$setup$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Was ist dein Ziel?';
	@override String get goalCareer => 'Karriereentwicklung';
	@override String get goalTravel => 'Reisen';
	@override String get goalLiving => 'Im Ausland leben';
	@override String get goalStudying => 'Im Ausland studieren';
	@override String get goalOther => 'Sonstiges';
	@override String get levelTitle => 'Was ist dein aktuelles Sprachniveau?';
	@override String get levelBeginner => 'Anfänger — Ich kenne ein paar Wörter';
	@override String get levelIntermediate => 'Fortgeschritten — Ich kann einfache Gespräche führen';
	@override String get levelAdvanced => 'Fortgeschritten — Ich spreche, möchte aber besser werden';
	@override String get paceTitle => 'Wie schnell möchtest du Fortschritte machen?';
	@override String get paceLight => '5-10 min/Tag (leicht)';
	@override String get paceRecommended => '15-20 min/Tag (empfohlen)';
	@override String get paceFast => '30+ min/Tag (schnelle Ergebnisse)';
}

// Path: accountCreating
class _Translations$accountCreating$de implements Translations$accountCreating$en {
	_Translations$accountCreating$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dein persönliches Konto wird erstellt';
	@override String get stepContent => 'Inhalte werden erstellt';
	@override String get stepDialogues => 'Dialoge werden vorbereitet';
	@override String get stepLessons => 'Lektionen werden optimiert';
	@override String get stepPlan => 'Dein Plan wird finalisiert';
	@override String get optimization => 'Optimierung';
	@override String progress({required Object value}) => '${value}%';
}

// Path: previewChat
class _Translations$previewChat$de implements Translations$previewChat$en {
	_Translations$previewChat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Lektion 1: Begrüßungen';
	@override String get speed => '1x';
	@override String get typeMessage => 'Nachricht eingeben...';
	@override String get incoming1 => 'Hallo! Willkommen bei Lingola — Ich bin dein KI-Tutor. Bereit, ein schnelles Hallo auf Englisch zu versuchen?';
	@override String get outgoing1 => 'Hallo! Ich bin bereit zu üben.';
	@override String get incoming2Highlight => 'Günaydın';
	@override String get incoming2Rest => ', Emrah! Ich freue mich, dass du dich bereit fühlst. Ein Morgenkaffee ist immer ein toller Start, um eine Verbindung aufzubauen. Worüber möchtest du sprechen?';
	@override String get holdToSpeak => 'Halten, um zu sprechen';
	@override String get recording => 'Aufnahme… loslassen, um zu senden';
	@override String get slideUpToLock => 'Nach oben wischen zum Sperren';
	@override String get slideLeftToCancel => 'Nach links wischen zum Abbrechen';
	@override String get recordingLockedHint => 'Tippe auf Senden, wenn fertig';
}

// Path: paywall
class _Translations$paywall$de implements Translations$paywall$en {
	_Translations$paywall$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Heute Sprechen Lernen — Kostenlos';
	@override String get subtitle => 'Unbegrenzte Lernmöglichkeiten';
	@override String get noCommitment => 'Keine Verpflichtung';
	@override String get cancelAnytime => 'Jederzeit kündbar';
	@override String get noPaymentToday => 'Heute keine Zahlung';
	@override String get daysFree => '3 Tage Kostenlos';
	@override String get thenPrice => 'Dann \$1.99/Monat';
	@override String get trialActive => 'Kostenlose Testphase Aktiv';
	@override String get payableToday => 'Heute zu zahlen';
	@override String get payableValue => '3 Tage Kostenlos 0.00\$';
	@override String get paymentDate => 'Zahlungsdatum: 13. März 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$de implements Translations$auth$en {
	_Translations$auth$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Unsere vielfältigen KI-Trainer';
	@override String get title => 'Beginne heute, eine neue Sprache zu sprechen';
	@override String get body => 'Übe echte Gespräche mit KI.\nKein Druck. Kein Urteil.';
	@override String get continueGoogle => 'Mit Google fortfahren';
	@override String get continueApple => 'Mit Apple fortfahren';
	@override String get continueGuest => 'Als Gast fortfahren';
	@override String get legal => 'Mit der Anmeldung bei Lingola stimmst du unseren Nutzungsbedingungen zu. Erfahre, wie wir deine Daten in unserer Datenschutzrichtlinie und Cookie-Richtlinie verarbeiten.';
	@override String get terms => 'Nutzungsbedingungen';
	@override String get privacy => 'Datenschutzrichtlinie';
	@override String get cookies => 'Cookie-Richtlinie';
}

// Path: nav
class _Translations$nav$de implements Translations$nav$en {
	_Translations$nav$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Startseite';
	@override String get tutor => 'Tutor';
	@override String get lesson => 'Lektion';
	@override String get rolePlay => 'Rollenspiel';
	@override String get profile => 'Profil';
}

// Path: home
class _Translations$home$de implements Translations$home$en {
	_Translations$home$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Guten Morgen, Jhon';
	@override String get todayPractice => 'Heutige Übung';
	@override String get continueConversation => 'Gespräch fortsetzen';
	@override String continueWithTutor({required Object name}) => 'Mit ${name} weitermachen oder anderen Tutor wählen?';
	@override String continueSameTutor({required Object name}) => 'Mit ${name} fortsetzen';
	@override String get chooseOtherTutor => 'Anderen Tutor wählen';
	@override String minutesLeft({required Object value}) => 'Noch ${value} Min.';
	@override String get lessonProgress => 'Lektion 2 — Begrüßungen';
	@override String get timeCurrent => '0min';
	@override String get timeTotal => '/ 15min';
	@override String get kContinue => 'Fortsetzen';
	@override String get learningPath => 'A1 - Starter';
	@override String get allLessons => 'Alle Lektionen';
	@override String get introductions => 'Vorstellungen I';
	@override String get greetings => 'Begrüßungen';
	@override String get jobs => 'Berufe';
	@override String get favoriteRoom => 'Ein Lieblingsraum';
	@override String get dailyRoutine => 'Tägliche Routine';
	@override String get scroll => 'Scrollen';
	@override String get liveLesson => 'Live-Unterricht';
	@override String get liveLessonSubtitle => 'Mach einen Videoanruf mit unserem Tutor';
	@override String get moreTutor => 'Mehr Tutor';
	@override String get startTalkNow => 'Jetzt Gespräch starten';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Adaptiv';
	@override String get tagCalm => 'Ruhig';
	@override String get tagPatient => 'Geduldig';
	@override String get tagMethodical => 'Methodisch';
	@override String get tagEncouraging => 'Ermutigend';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Weitere Funktionen';
	@override String get practiceLabel => 'ÜBEN';
	@override String get wordPractice => 'Wortübung';
	@override String get wordPracticeBody => 'Baue täglich deinen Wortschatz in deiner gewählten Sprache auf';
	@override String get immersiveLabel => 'EINTAUCHEND';
	@override String get quiz => 'Quiz';
	@override String get quizBodyLine1 => 'Lerne durch echte';
	@override String get quizBodyLine2 => 'Beispiele im Kontext';
	@override String get getStarted => 'Loslegen';
	@override String get library => 'Bibliothek';
	@override String get libraryTitle => 'Lernen und Sparen';
	@override String get learnMore => 'Mehr erfahren';
	@override late final _Translations$home$premium$de premium = _Translations$home$premium$de._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$de implements Translations$libraryPage$en {
	_Translations$libraryPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bibliothek';
	@override String get searchWord => 'Suchwort';
	@override String savedWordCount({required Object count}) => '${count} Gespeichertes Wort';
	@override String get savedWordTab => 'Gespeichertes Wort';
	@override String get dictionaryTab => 'Wörterbuch';
	@override String get dictionaryLabel => 'Wörterbuch';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$de implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wortübung';
	@override String get turkish => 'TÜRKISCH';
	@override String get save => 'Speichern';
	@override String get saved => 'Gespeichert';
	@override String get listen => 'Zuhören';
	@override String get hint => 'Hinweis';
	@override String get previous => 'VORHERIG';
	@override String get next => 'NÄCHSTES';
}

// Path: quizPage
class _Translations$quizPage$de implements Translations$quizPage$en {
	_Translations$quizPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quiz';
	@override String get headline => 'Was möchtest du heute verbessern?';
	@override String get subtitle => 'Wähle dein Training — dauert weniger als 3 Minuten 🚀';
	@override String get readingTitle => 'Lesen';
	@override String get readingBody => 'Verständnis durch Artikel & Geschichten';
	@override String get writingTitle => 'Schreiben';
	@override String get writingBody => 'Grammatik- & Wortschatzübungen';
	@override String get speakingTitle => 'Sprechen';
	@override String get speakingBody => 'Aussprache über KI-Sprachengine';
	@override String get readingTestTitle => 'Lese-Test';
	@override String get read => 'Lesen';
	@override String get listeningHint => 'Sprich das englische Wort deutlich...';
	@override String get micPermissionDenied => 'Mikrofon oder Spracherkennung ist nicht verfügbar.';
	@override String get matchSuccess => 'Super! Das passt zum Wort.';
	@override String matchFail({required Object heard}) => 'Gehört "${heard}". Versuch es nochmal.';
	@override String get successfulTitle => 'Erfolgreich!';
	@override String get successfulBody => 'Aussprache wie ein Muttersprachler!';
	@override String get failedTitle => 'Nicht bestanden';
	@override String get failedBody => 'Es war fast soweit, gib es noch eine Chance';
	@override String get tryAgain => 'NOCHMAL PROBIEREN';
	@override String get writingTestTitle => 'Schreib-Test';
	@override String get sourceLanguage => 'QUELLSPRACHE';
	@override String get answer => 'ANTWORT';
	@override String get writeAnswerHint => 'Schreibe deine Antwort hier...';
	@override String get submit => 'Einreichen';
	@override String get speakingTestTitle => 'Sprech-Test';
	@override String get speakingProficiency => 'Sprechfertigkeit';
	@override String get speakClearlyHint => 'Sprich deutlich in dein Mikrofon:';
	@override String get speakUp => 'Laut sprechen';
	@override String get recording => 'Aufnahme...';
	@override String questionOf({required Object current, required Object total}) => 'FRAGE ${current} VON ${total}';
}

// Path: placeholder
class _Translations$placeholder$de implements Translations$placeholder$en {
	_Translations$placeholder$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} ist unterwegs';
	@override String body({required Object tab}) => 'Wir bereiten eine fokussierte ${tab}-Erfahrung für dich vor.';
}

// Path: tutorPage
class _Translations$tutorPage$de implements Translations$tutorPage$en {
	_Translations$tutorPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tutor';
	@override String get chatWithLingola => 'Chatte mit Lingola';
	@override String chatWithTutor({required Object name}) => 'Chatte mit ${name}';
	@override String get chatHistory => 'Chatverlauf';
	@override String get history => 'Verlauf';
	@override String get filter => 'Filter';
	@override String get country => 'Land';
	@override String get focus => 'Fokus';
	@override String get moreCountries => '8+ weitere';
	@override String get moreFocus => '+8';
	@override String get save => 'SPEICHERN';
	@override String get clearFilter => 'Filter zurücksetzen';
	@override String get startTalkNow => 'Jetzt sprechen starten';
	@override String get typeMessage => 'Nachricht eingeben...';
	@override String get speaker => 'Sprecher';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$de tutors = _Translations$tutorPage$tutors$de._(_root);
	@override late final _Translations$tutorPage$tags$de tags = _Translations$tutorPage$tags$de._(_root);
	@override String get historyPreview1 => 'Hey! Ich war kurz davor, vor Langeweile zu platzen...';
	@override String get historyPreview2 => 'Sollen wir heute das Bestellen von Essen üben?';
	@override String get time1 => '11:00 Uhr';
	@override String get time2 => 'Gestern';
	@override late final _Translations$tutorPage$chat$de chat = _Translations$tutorPage$chat$de._(_root);
	@override late final _Translations$tutorPage$calling$de calling = _Translations$tutorPage$calling$de._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$de implements Translations$lessonPage$en {
	_Translations$lessonPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Weiterlernen';
	@override String get profile => 'Profil';
	@override String get language => 'Zielsprache';
	@override String get completed => 'Abgeschlossen';
	@override String get locked => 'Gesperrt';
	@override String get pickTutorTitle => 'Wähle deinen Tutor';
	@override String get startTalk => 'Lektion starten';
	@override String get chatInstead => 'Stattdessen chatten';
	@override String get lockedHint => 'Beende die vorherige Lektion, um diese freizuschalten.';
	@override String get levelLockedTitle => 'Stufe gesperrt';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Dein Englischniveau ist ${userLevel} — ${lessonLevel}-Lektionen kannst du ohne den früheren Pfad nicht öffnen.';
	@override String get levelLockedOk => 'Verstanden';
	@override String get notesTitle => 'Lektionsnotizen';
	@override String get whatWeLearned => 'Was wir heute gelernt haben';
	@override String get deleteNotes => 'Meine Lektionsnotizen löschen';
	@override String get deleteNotesConfirm => 'Diese Notizen löschen? Dies kann nicht rückgängig gemacht werden.';
	@override String get delete => 'Löschen';
	@override String get cancel => 'Abbrechen';
	@override String get practiceCta => 'Wenn das zu schwer war, kannst du dasselbe Thema nochmal üben.';
	@override String get practiceNow => 'Dieses Thema üben';
	@override String get openChat => 'Chat mit Tutor öffnen';
	@override String get yourScore => 'Dein Punktestand';
	@override String bestScore({required Object score}) => 'Bester ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Passiver Teilnehmer';
	@override String get participationSilentBody => 'Du warst diesmal still. Ich denke, du solltest diese Lektion wiederholen.';
	@override String get participationPassive => 'Geringe Teilnahme';
	@override String get participationPassiveBody => 'Du hast kaum gesprochen. Versuch die Lektion nochmal und sag mehr.';
	@override String get participationActive => 'Gute Teilnahme';
	@override String get participationActiveBody => 'Du hast am Gespräch teilgenommen. Mach weiter so!';
	@override String get participationStrong => 'Starke Teilnahme';
	@override String get participationStrongBody => 'Du hast viel gesprochen. Tolle Arbeit!';
	@override String get retakeLesson => 'Diese Lektion wiederholen';
	@override String get finishLesson => 'Lektion beenden';
	@override String get savingNotes => 'Dein Tutor schreibt die heutigen Notizen…';
	@override String get noNotes => 'Beende diese Lektion, um Notizen von deinem Tutor zu erhalten.';
	@override String get notesDeleted => 'Lektionsnotizen gelöscht';
	@override late final _Translations$lessonPage$levels$de levels = _Translations$lessonPage$levels$de._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$de implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rollenspiel';
	@override String get subtitle => 'Wähle deine Rolle — erlebe ein echtes Szenario 🎭';
	@override String progressCompleted({required Object value}) => '%${value} abgeschlossen';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get beginner => 'Anfänger';
	@override String get screenplay => 'DREHBUCH';
	@override String get dailyInteractions => 'Tägliche Interaktionen';
	@override String get business => 'Geschäft';
	@override late final _Translations$rolePlayPage$coffee$de coffee = _Translations$rolePlayPage$coffee$de._(_root);
	@override late final _Translations$rolePlayPage$directions$de directions = _Translations$rolePlayPage$directions$de._(_root);
	@override late final _Translations$rolePlayPage$interview$de interview = _Translations$rolePlayPage$interview$de._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$de implements Translations$notificationsPage$en {
	_Translations$notificationsPage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Benachrichtigungen';
	@override String get deleteConfirmTitle => 'Sind Sie sicher?';
	@override String get deleteConfirmBody => 'Diese Benachrichtigung wird gelöscht.';
	@override String get delete => 'Löschen';
	@override String get cancel => 'Abbrechen';
	@override late final _Translations$notificationsPage$translation$de translation = _Translations$notificationsPage$translation$de._(_root);
	@override late final _Translations$notificationsPage$offer$de offer = _Translations$notificationsPage$offer$de._(_root);
	@override late final _Translations$notificationsPage$stories$de stories = _Translations$notificationsPage$stories$de._(_root);
	@override late final _Translations$notificationsPage$practice$de practice = _Translations$notificationsPage$practice$de._(_root);
	@override late final _Translations$notificationsPage$streak$de streak = _Translations$notificationsPage$streak$de._(_root);
	@override late final _Translations$notificationsPage$premium$de premium = _Translations$notificationsPage$premium$de._(_root);
	@override String get emptyTitle => 'Noch keine Benachrichtigungen';
	@override String get emptySubtitle => 'Vergiss nicht, wieder vorbeizuschauen, wenn du eine Benachrichtigung erhältst.';
}

// Path: profilePage
class _Translations$profilePage$de implements Translations$profilePage$en {
	_Translations$profilePage$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Kostenlose Version';
	@override String get dayStreak => 'Tagesstreak!';
	@override String get accountSettings => 'Kontoeinstellungen';
	@override String get general => 'Allgemein';
	@override String get profileSettings => 'Profileinstellungen';
	@override String get fullName => 'Vollständiger Name';
	@override String get email => 'E-Mail';
	@override String get deleteAccount => 'Konto löschen';
	@override String get save => 'SPEICHERN';
	@override String get deleteTitle => 'Wir möchten dich nicht verlieren, aber wir verstehen dich.';
	@override String get deleteBody => 'Kannst du uns sagen, warum du Lingola verlassen möchtest, damit wir dein Erlebnis verbessern können?';
	@override late final _Translations$profilePage$deleteReasons$de deleteReasons = _Translations$profilePage$deleteReasons$de._(_root);
	@override String get messageOptional => 'Nachricht (optional)';
	@override String get messageHint => 'Bitte schreibe deine Nachricht, falls du eine hast.';
	@override String get next => 'WEITER';
	@override String get specialOfferTitle => 'Sonderangebot';
	@override String get specialOfferBody => 'Schau dir das Angebot an, das wir für dich vorbereitet haben, bevor du gehst.';
	@override String get monthlyPlanTitle => 'Wechsel zum 1-Monats-Plan';
	@override String get monthlyPlanPrice => '\$79/Monat, jederzeit kündbar';
	@override String get monthlyPlanDesc => 'Keine langfristige Verpflichtung. Bleib mit unserer Community auf monatlicher Basis verbunden.';
	@override String get whatYoullKeep => 'Was du behalten wirst:';
	@override String get keepCharacters => 'Zugriff auf alle Charaktere';
	@override String get keepVideo => 'Unbegrenzte Videoanrufe';
	@override String get keepCourses => 'Zugriff auf alle Kurse';
	@override String get switchMonthlyCta => 'Wechsel zum Monatsplan';
	@override String get confirmTitle => 'Bist du sicher?';
	@override String get confirmBody => 'Wir möchten dich wirklich nicht gehen sehen. Hier ist, was du verlieren wirst:';
	@override String get loseCharacters => 'Unbegrenzter Zugriff auf Charaktere';
	@override String get loseVideo => 'Unbegrenzter Zugriff auf Videoanrufe';
	@override String get loseCourses => 'Zugriff auf alle Kurse';
	@override String get discountTitle => 'Bleib und erhalte 60% Rabatt für 1 Monat';
	@override String get discountSubtitle => 'Unser bestes Angebot aller Zeiten. Nur \$27.60/Monat';
	@override String get acceptDiscountCta => '60% Rabatt annehmen & bleiben';
	@override String get farewellTitle => 'Es tut uns leid, dich gehen zu sehen';
	@override String farewellBody({required Object date}) => 'Deine Mitgliedschaft wurde gekündigt. Du hast bis zum Ende deines aktuellen Abrechnungszeitraums am ${date} Zugriff.';
	@override String get changeMindTitle => '✨ Meinung ändern?';
	@override String changeMindBody({required Object date}) => 'Du kannst deine Mitgliedschaft jederzeit vor ${date} reaktivieren, um deine Vorteile zu behalten.';
	@override String get reactivateCta => 'Warte, ich möchte reaktivieren';
	@override String get done => 'FERTIG';
	@override String get notifications => 'Benachrichtigungen';
	@override String get appLanguage => 'App-Sprache';
	@override String get selectLanguageTitle => 'Sprache auswählen';
	@override String get premium => 'Premium';
	@override String get passive => 'Passiv';
	@override String get active => 'Aktiv';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Freund teilen';
	@override String get shareWithFriendTitle => 'Mit Freund teilen';
	@override String get shareInviteBody => 'Lade deine Freunde ein und genießt das Übersetzen zusammen';
	@override String get rateUs => 'Bewerte uns';
	@override String get faq => 'Lingola FAQ';
	@override late final _Translations$profilePage$faqItems$de faqItems = _Translations$profilePage$faqItems$de._(_root);
	@override String get support => 'Support';
	@override String get feedback => 'Feedback';
	@override String get progression => 'Fortschritt';
	@override String get progressTitle => 'Fortschritt';
	@override String get goodMorning => 'Guten Morgen,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'Englisch';
	@override String get past7Days => 'Letzte 7 Tage';
	@override String get past7DaysBody => 'Lerne jeden Tag, um deinen Streak aufzubauen und eine starke Lerngewohnheit zu entwickeln.';
	@override String get currentLevel => 'Aktuelles Niveau';
	@override String xpLeft({required Object xp, required Object level}) => 'Nur noch ${xp} XP bis zu ${level}!';
	@override String get toNextLevel => 'ZUM NÄCHSTEN NIVEAU';
	@override String get dayStreakLabel => 'Tagesstreak';
	@override String get totalPoints => 'Gesamtpunkte';
	@override String get savedWords => 'Gespeicherte Wörter';
	@override String itemsToReview({required Object count}) => '${count} Elemente zur Überprüfung';
	@override String get logout => 'Abmelden';
	@override String get logoutTitle => 'Du bist dabei, dich abzumelden';
	@override String get logoutBody => 'Bis bald! Wir werden deine Atemübungen vermissen.';
	@override String get logoutConfirm => 'ABMELDEN';
	@override String get logoutCancel => 'ABBRECHEN';
	@override late final _Translations$profilePage$days$de days = _Translations$profilePage$days$de._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Ihr Zertifikat';
	@override String certificateLevelTitle({required Object level}) => '${level} Certificate';
	@override String get certificateOf => 'Certificate of Achievement';
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
	@override String get certificateVerifyHint => 'Jeder kann den QR-Code scannen, um Ihre Leistung zu bestätigen.';
	@override String get certificateShare => 'Zertifikat teilen';
	@override String get certificateShareQr => 'QR-Code teilen';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Wenn Sie ein CEFR-Niveau bei Lingola abschließen, erscheint Ihr Zertifikat hier — mit Ihrem Namen, Niveau und einem QR-Code zur Überprüfung.';
	@override String get certificatePreviewHint => 'Schließen Sie einen Level-Pfad ab, um Ihr Zertifikat freizuschalten';
	@override String get certificateTapToView => 'Tippen Sie, um Ihr Zertifikat anzuzeigen und zu teilen';
}

// Path: pushNotifications
class _Translations$pushNotifications$de implements Translations$pushNotifications$en {
	_Translations$pushNotifications$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Es sieht so aus, als hättest du eine kurze Pause gemacht.',
		'Hast du einen Moment für ein Wort?',
		'Wir sind hier – kein Stress.',
		'Dein Lernrhythmus hat kurz pausiert.',
		'Eine kleine Wiederholung könnte gut tun.',
	];
	@override List<String> get h4 => [
		'Ein neues Wort könnte heute auf dich warten 👀',
		'Vielleicht hast du eine schnelle Übung verpasst.',
		'Vielleicht hast du einen nützlichen Satz übersprungen.',
		'Der Fortschritt von heute ist noch offen.',
		'Ein Wort, ein Satz… vielleicht beides.',
	];
	@override List<String> get h8 => [
		'Du musst nicht jeden Tag Fortschritte machen.',
		'Auch eine kleine Wiederholung zählt.',
		'Du hast heute nichts verloren, indem du nicht gelernt hast.',
		'Wir sind bereit, wenn du es bist.',
		'Sprachenlernen ist ein Marathon, kein Sprint.',
	];
	@override List<String> get h24 => [
		'Ein Tag ist vergangen. Deine Wörter sind immer noch hier.',
		'Eine Pause zu machen ist normal.',
		'Dein Platz ist genau da, wo du ihn gelassen hast.',
		'Mach weiter, wann immer du möchtest.',
		'Die Sprache wird nicht weglaufen – wir auch nicht.',
	];
	@override String get lessonReminderTitle => 'Die heutige Lektion wartet';
	@override List<String> get lessonReminder => [
		'Du warst heute noch nicht in der Lektion — 5 Minuten reichen.',
		'Dein Tutor ist bereit. Mach weiter, wo du aufgehört hast.',
		'Eine kurze Lektion hält deinen Rhythmus.',
		'Die heutige Lektion ist noch offen — starten?',
	];
	@override String get quizReminderTitle => 'Lust auf ein kurzes Quiz?';
	@override String quizReminderWords({required Object count, required Object savedCount}) => 'Du hast kürzlich ${count} Wörter gelernt — Quiz? ${savedCount} gespeicherte Wörter warten.';
	@override String quizReminderSaved({required Object savedCount}) => '${savedCount} gespeicherte Wörter warten auf Wiederholung.';
	@override List<String> get quizReminder => [
		'Lange kein Quiz — 3 Minuten Wiederholung helfen.',
		'Deine gespeicherten Wörter vermissen dich.',
		'Teste dein Wissen — nur ein paar Minuten.',
		'Ein kurzes Quiz jetzt erleichtert morgen.',
	];
	@override String get eveningLessonTitle => 'Verpasse das heutige Training nicht';
	@override List<String> get eveningLesson => [
		'Heute noch nicht gelernt. Eine kurze Lektion hält die Gewohnheit.',
		'Bevor der Tag endet — schnelle Lektion?',
		'Noch Zeit für 5 Minuten Englisch heute.',
		'Deine tägliche Lektion wartet.',
	];
	@override String get streakReminderTitle => 'Halte deine Serie';
	@override String streakReminder({required Object streak}) => '${streak} Tage Serie — eine kurze Lektion heute hält sie am Leben.';
}

// Path: apiErrors
class _Translations$apiErrors$de implements Translations$apiErrors$en {
	_Translations$apiErrors$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$de implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sprich Selbstbewusst in Wochen — Nicht Monaten';
	@override String get body => 'Übe echte Gespräche mit KI. Verbessere deinen Akzent, dein Selbstbewusstsein und deine Flüssigkeit, täglich.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Ich konnte vorher kein Englisch sprechen. Jetzt spreche ich täglich bei der Arbeit.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$de implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ein Privater Tutor Ohne den Preis';
	@override String get body => 'Echte Gespräche. Sofortiges Feedback.\nKeine Planung. Kein Druck.';
	@override String get realTutor => 'Echter Tutor';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / Std';
	@override String get priceLingola => '\$9.99 / Jahr';
	@override String get versus => 'VS';
	@override String get scheduled => 'Geplant';
	@override String get anytime => 'Jederzeit';
	@override String get stressful => 'Stressig';
	@override String get noPressure => 'Kein Druck';
	@override String get price => 'Preis';
	@override String get availability => 'Verfügbarkeit';
	@override String get feeling => 'Gefühl';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$de implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ein Lernplan, Der Um Dich Herum Gebaut Ist';
	@override String get body => 'Deine Ziele, dein Tempo, dein Niveau.\nVom Anfänger bis zum Fließend — Schritt für Schritt.';
	@override String get goal => 'Ziel';
	@override String get practice => 'Übung';
	@override String get progress => 'Fortschritt';
}

// Path: home.premium
class _Translations$home$premium$de implements Translations$home$premium$en {
	_Translations$home$premium$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Der Weg zu ';
	@override String get titleHighlight => 'fließendem Sprechen';
	@override String get titleAfter => ' ohne Angst, Fehler zu machen.';
	@override String get descriptionBefore => 'Schließe dich Millionen von Schülern weltweit an. Beginne noch heute, die Sprachbarriere zu überwinden — ';
	@override String get descriptionHighlight => 'die ersten 3 Tage komplett kostenlos.';
	@override String get feature1 => '24/7 zugänglicher KI-Tutor';
	@override String get feature2 => 'Unbegrenzter Zugang zu Privat-Tutoren';
	@override String get feature3 => 'Täglicher Lehrplan, der auf dich zugeschnitten ist';
	@override String get priceAmount => '1,99\$';
	@override String get pricePeriod => '/mo';
	@override String get discount => '40% Rabatt bei jährlichem Kauf';
	@override String get cta => 'Starten';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$de implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

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
	@override String get santa => 'Weihnachtsmann';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$de implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Adaptiv';
	@override String get calm => 'Ruhig';
	@override String get patient => 'Geduldig';
	@override String get organized => 'Organisiert';
	@override String get relaxed => 'Entspannt';
	@override String get methodical => 'Methodisch';
	@override String get attentive => 'Aufmerksam';
	@override String get more => '+5';
	@override String get curious => 'Neugierig';
	@override String get observer => 'Beobachter';
	@override String get ancientKnowledge => 'Altes Wissen';
	@override String get wise => 'Weise';
	@override String get clear => 'Klar';
	@override String get decisive => 'Entschlossen';
	@override String get disciplined => 'Diszipliniert';
	@override String get smart => 'Intelligent';
	@override String get analytic => 'Analytisch';
	@override String get cheerful => 'Fröhlich';
	@override String get generous => 'Großzügig';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$de implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Guten Morgen! Ich freue mich, dass du heute bereit bist, zu üben.';
	@override String get outgoing1 => 'Ja, lass uns mit den Begrüßungen anfangen.';
	@override String get incoming2 => 'Perfekt. Wie würdest du einem Kollegen Hallo sagen?';
	@override String get typing => 'Tippen';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$de implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Lektion 1 : Begrüßungen';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Lektion ${number} : ${title}';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Langweilig? Ich habe dieses Wort aus meinem Wortschatz gestrichen. Steh auf, der Plan steht schon fest: Wir gehen in die neue Spielhalle in Kadıköy.';
	@override String get highlight => 'Langweilig?';
	@override String get close => 'Anruf beenden';
	@override String get toggleCaptions => 'Untertitel umschalten';
	@override String get toggleHints => 'Hinweise umschalten';
	@override String get toggleMic => 'Mikrofon umschalten';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$de implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$de a1 = _Translations$lessonPage$levels$a1$de._(_root);
	@override late final _Translations$lessonPage$levels$a2$de a2 = _Translations$lessonPage$levels$a2$de._(_root);
	@override late final _Translations$lessonPage$levels$b1$de b1 = _Translations$lessonPage$levels$b1$de._(_root);
	@override late final _Translations$lessonPage$levels$b2$de b2 = _Translations$lessonPage$levels$b2$de._(_root);
	@override late final _Translations$lessonPage$levels$c1$de c1 = _Translations$lessonPage$levels$c1$de._(_root);
	@override late final _Translations$lessonPage$levels$c2$de c2 = _Translations$lessonPage$levels$c2$de._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$de implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bestellung im Café';
	@override String get screenplay => 'Bestelle dein Lieblingsgetränk, frage nach Größen und Extras, bestätige deinen Gesamtbetrag und hole deinen Kaffee an der Theke ab.';
	@override late final _Translations$rolePlayPage$coffee$chat$de chat = _Translations$rolePlayPage$coffee$chat$de._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$de implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nach dem Weg fragen auf der Straße';
	@override String get screenplay => 'Frage nach dem Weg zu einem Ort, finde heraus, wie du zur U-Bahn oder zum Bus kommst, erhalte Informationen zu Tickets und höre Restaurantempfehlungen.';
	@override late final _Translations$rolePlayPage$directions$chat$de chat = _Translations$rolePlayPage$directions$chat$de._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$de implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vorstellungsgespräch';
	@override String get screenplay => 'Stelle dich vor, beantworte häufige Interviewfragen, sprich über deine Erfahrungen und frage nach der Rolle und den nächsten Schritten.';
	@override late final _Translations$rolePlayPage$interview$chat$de chat = _Translations$rolePlayPage$interview$chat$de._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$de implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Neue Übersetzung Bereit';
	@override String get body => 'Ihre Audio-Übersetzungsdatei wurde erfolgreich in Text umgewandelt und übersetzt.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$de implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ein Sonderangebot Erwartet Dich';
	@override String get body => 'Upgrade auf Premium für unbegrenzte Fotoübersetzungen mit 50% Rabatt.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$de implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entdecke Neue Geschichten';
	@override String get body => 'Lerne neue Wörter durch Geschichten';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$de implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$de implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$de implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$de implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Ich fand die KI-Charaktere nicht realistisch.';
	@override String get videoIssues => 'Ich habe technische Probleme bei Videoanrufen.';
	@override String get pricing => 'Die Abonnementpreise sind höher als erwartet.';
	@override String get noMatch => 'Ich habe nicht die Charaktere gefunden, die ich gesucht habe.';
	@override String get shortTrial => 'Ich wollte nur für eine kurze Zeit testen.';
	@override String get other => 'Sonstiges';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$de implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$de supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$de._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$de howAiWorks = _Translations$profilePage$faqItems$howAiWorks$de._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$de offlineUse = _Translations$profilePage$faqItems$offlineUse$de._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$de isFree = _Translations$profilePage$faqItems$isFree$de._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$de pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$de._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$de dailyPractice = _Translations$profilePage$faqItems$dailyPractice$de._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$de levelDetermination = _Translations$profilePage$faqItems$levelDetermination$de._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$de realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$de._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$de dataSecurity = _Translations$profilePage$faqItems$dataSecurity$de._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$de disableReminders = _Translations$profilePage$faqItems$disableReminders$de._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$de implements Translations$profilePage$days$en {
	_Translations$profilePage$days$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get mon => 'MO';
	@override String get tue => 'DI';
	@override String get wed => 'MI';
	@override String get thu => 'DO';
	@override String get fri => 'FR';
	@override String get sat => 'SA';
	@override String get sun => 'SO';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$de implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Starter';
	@override List<String> get lessons => [
		'Begrüßungen',
		'Vorstellungen I',
		'Berufe',
		'Ein Lieblingszimmer',
		'Tägliche Routine',
		'Obst',
		'Ratschläge 1',
		'Familie 1',
		'Alltagsgegenstände',
		'Heimatstadt',
		'Haus',
		'Essensvorlieben',
		'Hobbys 1',
		'Erfolgreiche Menschen',
		'Essen und Trinken',
		'Bestellen im Restaurant',
		'Haustiere',
		'Gesundheit und Fitness',
		'Wetter',
		'Neuer Lebensstil',
		'Besser werden',
		'Hobbys 2',
		'Fragen zu Orten',
		'Besitz',
		'Einkaufen 1',
		'Die Uhrzeit sagen',
		'Wegbeschreibungen 1',
		'Einkaufen 2',
		'Dich kennenlernen',
		'Orte von Gegenständen',
		'Erscheinungen',
		'Wegbeschreibungen 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$de implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Grundkenntnisse';
	@override List<String> get lessons => [
		'Familie 2',
		'Menschen und Orte',
		'Familie 3',
		'Gegenstände beschreiben',
		'Stadt',
		'Das Bauprojekt',
		'Zuhause ist es am schönsten',
		'Wie spät ist es?',
		'Tägliche Routine 2',
		'Freizeit',
		'Essen und Ernährung',
		'Einkaufen und Konsum',
		'Urlaub',
		'Wochenendpläne',
		'Formell oder lässig',
		'Mode',
		'Einkaufen 3',
		'Ratschläge 2',
		'Du schaffst das',
		'Einkaufen 4',
		'Small Talk',
		'Einen Latte bitte',
		'Essen',
		'Sich fortbewegen',
		'Bereit für eine Reise',
		'Reisen 1',
		'Städtische Ausflüge',
		'Reisen 2',
		'Ein Platz zum Übernachten',
		'So aufregend',
		'Die richtige Person',
		'Schule',
		'Musikvorlieben',
		'Sport',
		'Regeln des Rennens',
		'Hinterlasse eine Nachricht',
		'Anfragen',
		'Einladungen',
		'Reiseerfahrungen',
		'Vergangenheit 1',
		'Vergangenheit 2',
		'Vergangenheit 3',
		'Fragen zur Vergangenheit',
		'Du bist nie zu alt',
		'Kindheitserinnerungen',
		'Komplimente',
		'Ausreden',
		'Es ist so nervig!',
		'Eine digitale Welt',
		'Arbeitsleben',
		'Ich habe das nicht verstanden',
		'Sparen oder ausgeben?',
		'Entschuldigung sagen',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$de implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Mittelstufe';
	@override List<String> get lessons => [
		'Kulturelle Traditionen',
		'Prominente',
		'Kunst und Kreativität',
		'Zukunftspläne',
		'Veranstaltungen planen',
		'Ziele und Pläne',
		'Historische Ereignisse',
		'Technologie',
		'Nie im Leben',
		'Was läuft gerade',
		'Traumurlaub',
		'Soziale Medien',
		'Buchempfehlungen',
		'Einer dieser Tage',
		'Besondere Fotos',
		'Persönliche Erfolge',
		'Lieblingsfilme',
		'Nachricht des Tages',
		'Glück',
		'Eine hektische Woche',
		'Wo ich aufgewachsen bin',
		'Schultage',
		'Profile',
		'Lebenskarten',
		'Alltag',
		'Was kommt als Nächstes',
		'Vorschläge machen',
		'Was ist passiert',
		'Erinnerungen',
		'Kulturshock',
		'Interessenphrasen',
		'Vorstellungsgespräche',
		'Bucket Lists',
		'Meine Art von Stadt',
		'Die Internetgeneration',
		'Beliebte Marken',
		'Meinungsphrasen',
		'Wie sieht es aus',
		'Wohnraum',
		'Gut essen',
		'Ungewöhnliche Hobbys',
		'Eine schwierige Entscheidung',
		'Handeln',
		'Neue Fähigkeiten',
		'Eine Beschwerde einreichen',
		'Bildung',
		'Grüne Städte',
		'Was ist in einem Job',
		'Persönliche Herausforderungen',
		'Interviewphrasen',
		'Höfliche Abschlüsse',
		'Schlagzeilen',
		'Kleine Veränderungen',
		'Entschuldigungen',
		'Telefonetikette',
		'Entschuldigung, dass ich unterbreche…',
		'Antworten auf Beschwerden',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$de implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Obere Mittelstufe';
	@override List<String> get lessons => [
		'Persönlichkeiten',
		'Großartige Anführer',
		'Gesunder Lebensstil',
		'Was ist die Wahrheit?',
		'Persönliches Wachstum',
		'Sich äußern',
		'Schauspielern?',
		'Ich erinnere mich...',
		'Soziale Rückmeldungen',
		'Tatort',
		'Höfliche Probleme',
		'Konfliktlösung',
		'Lieben oder hassen?',
		'Umweltprobleme',
		'Wir können es lösen',
		'Geheimnisse und Verbrechen',
		'Mögliche Zukünfte',
		'Geschäftspläne',
		'Entscheidungen im Meeting',
		'Es ist so vorhersehbar...',
		'Am Arbeitsplatz',
		'Wissenschaft und Technologie',
		'Zeitmanagement',
		'Menschenrechte',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$de implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Fortgeschritten';
	@override List<String> get lessons => [
		'Kulturelle Normen',
		'Einfluss der sozialen Medien',
		'Karriereentscheidungen',
		'Leistung steigern',
		'Erfindungen',
		'Zeitreise',
		'Besitz',
		'Berufliche Fähigkeiten',
		'Historische Veränderungen',
		'Überblick schreiben',
		'Geheimnisse',
		'Seltsame Theorien',
		'Promis',
		'Globale Politik',
		'Produktboom',
		'Wird glücklich sein?',
		'Vielleicht später...',
		'Neue Lösungen',
		'Kontextueller Einfluss',
		'Ein verlorenes Logo',
		'Freundliche Taten',
		'Was für ein Film',
		'Wie nervig',
		'In den Nachrichten',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$de implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Experte';
	@override List<String> get lessons => [
		'Globalisierung',
		'Naturkatastrophen',
		'Auf Informationen reagieren',
		'Work-Life-Balance',
		'Remote-Arbeit',
		'Familienprobleme',
		'Grundlagen der menschlichen Anatomie',
		'Gesundheitsprognosen',
		'Zugang zur Gesundheitsversorgung',
		'Globale Reiseerfahrung',
		'Superkräfte',
		'Teambildung',
		'Biofluoreszenz',
		'Dilemmata',
		'Soziale Begeisterung',
		'Veränderungen',
		'Arbeit, Arbeit, Arbeit',
		'Lokale Probleme',
		'Probleme, Probleme',
		'Fakt oder Fiktion?',
		'Sehenswürdigkeiten',
		'Freiwilligenarbeit',
		'Das geistige Auge',
		'Medienkonsum',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$de implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hallo! Heute üben wir das Bestellen in einem Café — Hallo, Größen, Extras. Ich erkläre zuerst ein wenig, dann spielen wir es nach. Klingt gut?';
	@override String get incoming1 => 'Willkommen! Was kann ich dir heute bringen?';
	@override String get outgoing1 => 'Hallo! Ich hätte gerne einen mittleren Latte, bitte.';
	@override String get incoming2Highlight => 'Klar';
	@override String get incoming2Rest => '! Möchtest du ihn heiß oder kalt, und irgendwelche Extras?';
	@override String get botReply => 'Tolle Wahl. Noch etwas zu deiner Bestellung?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$de implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hallo! Heute üben wir das Nach dem Weg fragen auf der Straße. Ich erkläre zuerst ein wenig, dann spielen wir es nach. Klingt gut?';
	@override String get incoming1 => 'Hallo! Du siehst ein bisschen verloren aus — brauchst du Hilfe beim Finden von etwas?';
	@override String get outgoing1 => 'Ja, ich suche die nächste U-Bahn-Station.';
	@override String get incoming2Highlight => 'Natürlich';
	@override String get incoming2Rest => '! Geh zwei Blocks in diese Richtung, dann bieg links ab. Du wirst den Eingang sehen.';
	@override String get botReply => 'Gern geschehen! Möchtest du auch einen Restauranttipp in der Nähe der Station?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$de implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hallo! Heute üben wir ein Vorstellungsgespräch. Ich erkläre zuerst ein wenig, dann spielen wir es nach — ich interviewe dich, dann wechseln wir. Klingt gut?';
	@override String get incoming1 => 'Danke, dass du heute gekommen bist. Könntest du dich kurz vorstellen?';
	@override String get outgoing1 => 'Natürlich. Ich freue mich, hier zu sein und meine Erfahrungen zu teilen.';
	@override String get incoming2Highlight => 'Wunderbar';
	@override String get incoming2Rest => '. Erzähl mir von einem aktuellen Projekt, auf das du stolz bist.';
	@override String get botReply => 'Das ist beeindruckend. Welche Fragen hast du zur Rolle?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$de implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Welche Sprachen unterstützt die App?';
	@override String get answer => 'Die App unterstützt derzeit Englisch, Türkisch und Deutsch. Neue Sprachen werden regelmäßig hinzugefügt.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$de implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Wie funktioniert die KI?';
	@override String get answer => 'Die KI interagiert mit dir wie ein echter Tutor. Sie analysiert deine Gespräche, erkennt Fehler und bietet personalisiertes Feedback basierend auf deinem Fortschritt.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$de implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Kann ich die App offline nutzen?';
	@override String get answer => 'Ja. Du kannst bestimmte Lektionen und Gesprächsszenarien im Voraus herunterladen und offline nutzen. Live-Chat erfordert jedoch eine Internetverbindung.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$de implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Ist die App kostenlos?';
	@override String get answer => 'Die Basisversion ist kostenlos. Mit Premium erhältst du erweiterte Chatszenarien, Ausspracheanalysen und den persönlichen Tutor-Modus.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$de implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Wie wird meine Aussprache bewertet?';
	@override String get answer => 'Die App analysiert deine Stimme und verwendet KI-gestützte Spracherkennung, um deinen Akzent und deine Aussprache zu bewerten. Wörter, die du verbessern musst, werden hervorgehoben.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$de implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Muss ich täglich üben?';
	@override String get answer => 'Ja. Das System verfolgt deinen Fortschritt jeden Tag. Nur 10–15 Minuten Sprechpraxis pro Tag können dein Sprachenlernen merklich beschleunigen.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$de implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Wie wird mein Lernniveau bestimmt?';
	@override String get answer => 'Ein kurzer Niveau-Check bei deiner ersten Anmeldung analysiert dein aktuelles Wissen. Danach empfiehlt die KI automatisch Lektionen, die zu deinem Niveau passen.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$de implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Kann ich mit echten Menschen sprechen?';
	@override String get answer => 'Ja. Premium-Nutzer können kurze Übungssitzungen mit echten Tutoren planen.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$de implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Sind meine Daten sicher?';
	@override String get answer => 'Absolut. Alle Gespräche und Benutzerdaten werden verschlüsselt gespeichert. Deine persönlichen Informationen werden niemals an Dritte weitergegeben.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$de implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$de._(this._root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Wie schalte ich tägliche Erinnerungen aus?';
	@override String get answer => 'Gehe zu den Profileinstellungen, öffne Benachrichtigungen und ändere die Erinnerungsfrequenz oder schalte die Benachrichtigungen komplett aus.';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Benachrichtigungen',
			'app.streak' => 'Lernserie',
			'app.profile' => 'Profil',
			'common.continueLabel' => 'FORTSETZEN',
			'common.back' => 'ZURÜCK',
			'common.locked' => 'Gesperrt',
			'common.minutes' => ({required Object value}) => '${value} Min',
			'common.close' => 'Schließen',
			'common.getStarted' => 'LOSLEGEN',
			'common.connectionError' => 'Keine Verbindung. Überprüfe dein Internet und versuche es erneut.',
			'common.genericError' => 'Etwas ist schiefgelaufen. Bitte versuche es erneut.',
			'common.tryAgain' => 'Erneut versuchen',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Onboarding-Seite ${current} von ${total}',
			'onboarding.slide1.title' => 'Sprich Selbstbewusst in Wochen — Nicht Monaten',
			'onboarding.slide1.body' => 'Übe echte Gespräche mit KI. Verbessere deinen Akzent, dein Selbstbewusstsein und deine Flüssigkeit, täglich.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Ich konnte vorher kein Englisch sprechen. Jetzt spreche ich täglich bei der Arbeit.',
			'onboarding.slide2.title' => 'Ein Privater Tutor Ohne den Preis',
			'onboarding.slide2.body' => 'Echte Gespräche. Sofortiges Feedback.\nKeine Planung. Kein Druck.',
			'onboarding.slide2.realTutor' => 'Echter Tutor',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / Std',
			'onboarding.slide2.priceLingola' => '\$9.99 / Jahr',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Geplant',
			'onboarding.slide2.anytime' => 'Jederzeit',
			'onboarding.slide2.stressful' => 'Stressig',
			'onboarding.slide2.noPressure' => 'Kein Druck',
			'onboarding.slide2.price' => 'Preis',
			'onboarding.slide2.availability' => 'Verfügbarkeit',
			'onboarding.slide2.feeling' => 'Gefühl',
			'onboarding.slide3.title' => 'Ein Lernplan, Der Um Dich Herum Gebaut Ist',
			'onboarding.slide3.body' => 'Deine Ziele, dein Tempo, dein Niveau.\nVom Anfänger bis zum Fließend — Schritt für Schritt.',
			'onboarding.slide3.goal' => 'Ziel',
			'onboarding.slide3.practice' => 'Übung',
			'onboarding.slide3.progress' => 'Fortschritt',
			'targetLanguage.title' => 'Wähle die Sprache, die du lernen möchtest',
			'targetLanguage.comingSoon' => 'Weitere Sprachen kommen bald',
			'targetLanguage.korean' => 'Koreanisch',
			'targetLanguage.portuguese' => 'Portugiesisch',
			'targetLanguage.portugueseBrazil' => 'Portugiesisch (Brasilien)',
			'targetLanguage.german' => 'Deutsch',
			'targetLanguage.italian' => 'Italienisch',
			'targetLanguage.simplifiedChinese' => 'Vereinfachtes Chinesisch',
			'targetLanguage.arabic' => 'Arabisch',
			'targetLanguage.turkish' => 'Türkisch',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Schritt ${current} von ${total}',
			'language.title' => 'Was möchtest du sprechen?',
			'language.nativeSection' => 'Ich spreche',
			'language.nativeField' => 'Muttersprache',
			'language.nativeName' => 'Türkisch',
			'language.targetSection' => 'Ich möchte lernen',
			'language.targetField' => 'Zielsprache',
			'language.targetName' => 'Englisch',
			'language.direction' => 'Sprachrichtung',
			'language.selectLanguage' => 'Sprache auswählen',
			'language.comingSoonBadge' => 'Demnächst...',
			'language.english' => 'Englisch',
			'language.french' => 'Französisch',
			'language.japanese' => 'Japanisch',
			'language.spanish' => 'Spanisch',
			'language.russian' => 'Russisch',
			'setup.goalTitle' => 'Was ist dein Ziel?',
			'setup.goalCareer' => 'Karriereentwicklung',
			'setup.goalTravel' => 'Reisen',
			'setup.goalLiving' => 'Im Ausland leben',
			'setup.goalStudying' => 'Im Ausland studieren',
			'setup.goalOther' => 'Sonstiges',
			'setup.levelTitle' => 'Was ist dein aktuelles Sprachniveau?',
			'setup.levelBeginner' => 'Anfänger — Ich kenne ein paar Wörter',
			'setup.levelIntermediate' => 'Fortgeschritten — Ich kann einfache Gespräche führen',
			'setup.levelAdvanced' => 'Fortgeschritten — Ich spreche, möchte aber besser werden',
			'setup.paceTitle' => 'Wie schnell möchtest du Fortschritte machen?',
			'setup.paceLight' => '5-10 min/Tag (leicht)',
			'setup.paceRecommended' => '15-20 min/Tag (empfohlen)',
			'setup.paceFast' => '30+ min/Tag (schnelle Ergebnisse)',
			'accountCreating.title' => 'Dein persönliches Konto wird erstellt',
			'accountCreating.stepContent' => 'Inhalte werden erstellt',
			'accountCreating.stepDialogues' => 'Dialoge werden vorbereitet',
			'accountCreating.stepLessons' => 'Lektionen werden optimiert',
			'accountCreating.stepPlan' => 'Dein Plan wird finalisiert',
			'accountCreating.optimization' => 'Optimierung',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lektion 1: Begrüßungen',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Nachricht eingeben...',
			'previewChat.incoming1' => 'Hallo! Willkommen bei Lingola — Ich bin dein KI-Tutor. Bereit, ein schnelles Hallo auf Englisch zu versuchen?',
			'previewChat.outgoing1' => 'Hallo! Ich bin bereit zu üben.',
			'previewChat.incoming2Highlight' => 'Günaydın',
			'previewChat.incoming2Rest' => ', Emrah! Ich freue mich, dass du dich bereit fühlst. Ein Morgenkaffee ist immer ein toller Start, um eine Verbindung aufzubauen. Worüber möchtest du sprechen?',
			'previewChat.holdToSpeak' => 'Halten, um zu sprechen',
			'previewChat.recording' => 'Aufnahme… loslassen, um zu senden',
			'previewChat.slideUpToLock' => 'Nach oben wischen zum Sperren',
			'previewChat.slideLeftToCancel' => 'Nach links wischen zum Abbrechen',
			'previewChat.recordingLockedHint' => 'Tippe auf Senden, wenn fertig',
			'paywall.title' => 'Heute Sprechen Lernen — Kostenlos',
			'paywall.subtitle' => 'Unbegrenzte Lernmöglichkeiten',
			'paywall.noCommitment' => 'Keine Verpflichtung',
			'paywall.cancelAnytime' => 'Jederzeit kündbar',
			'paywall.noPaymentToday' => 'Heute keine Zahlung',
			'paywall.daysFree' => '3 Tage Kostenlos',
			'paywall.thenPrice' => 'Dann \$1.99/Monat',
			'paywall.trialActive' => 'Kostenlose Testphase Aktiv',
			'paywall.payableToday' => 'Heute zu zahlen',
			'paywall.payableValue' => '3 Tage Kostenlos 0.00\$',
			'paywall.paymentDate' => 'Zahlungsdatum: 13. März 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Unsere vielfältigen KI-Trainer',
			'auth.title' => 'Beginne heute, eine neue Sprache zu sprechen',
			'auth.body' => 'Übe echte Gespräche mit KI.\nKein Druck. Kein Urteil.',
			'auth.continueGoogle' => 'Mit Google fortfahren',
			'auth.continueApple' => 'Mit Apple fortfahren',
			'auth.continueGuest' => 'Als Gast fortfahren',
			'auth.legal' => 'Mit der Anmeldung bei Lingola stimmst du unseren Nutzungsbedingungen zu. Erfahre, wie wir deine Daten in unserer Datenschutzrichtlinie und Cookie-Richtlinie verarbeiten.',
			'auth.terms' => 'Nutzungsbedingungen',
			'auth.privacy' => 'Datenschutzrichtlinie',
			'auth.cookies' => 'Cookie-Richtlinie',
			'nav.home' => 'Startseite',
			'nav.tutor' => 'Tutor',
			'nav.lesson' => 'Lektion',
			'nav.rolePlay' => 'Rollenspiel',
			'nav.profile' => 'Profil',
			'home.streakCount' => '2',
			'home.greeting' => 'Guten Morgen, Jhon',
			'home.todayPractice' => 'Heutige Übung',
			'home.continueConversation' => 'Gespräch fortsetzen',
			'home.continueWithTutor' => ({required Object name}) => 'Mit ${name} weitermachen oder anderen Tutor wählen?',
			'home.continueSameTutor' => ({required Object name}) => 'Mit ${name} fortsetzen',
			'home.chooseOtherTutor' => 'Anderen Tutor wählen',
			'home.minutesLeft' => ({required Object value}) => 'Noch ${value} Min.',
			'home.lessonProgress' => 'Lektion 2 — Begrüßungen',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
			'home.kContinue' => 'Fortsetzen',
			'home.learningPath' => 'A1 - Starter',
			'home.allLessons' => 'Alle Lektionen',
			'home.introductions' => 'Vorstellungen I',
			'home.greetings' => 'Begrüßungen',
			'home.jobs' => 'Berufe',
			'home.favoriteRoom' => 'Ein Lieblingsraum',
			'home.dailyRoutine' => 'Tägliche Routine',
			'home.scroll' => 'Scrollen',
			'home.liveLesson' => 'Live-Unterricht',
			'home.liveLessonSubtitle' => 'Mach einen Videoanruf mit unserem Tutor',
			'home.moreTutor' => 'Mehr Tutor',
			'home.startTalkNow' => 'Jetzt Gespräch starten',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adaptiv',
			'home.tagCalm' => 'Ruhig',
			'home.tagPatient' => 'Geduldig',
			'home.tagMethodical' => 'Methodisch',
			'home.tagEncouraging' => 'Ermutigend',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Weitere Funktionen',
			'home.practiceLabel' => 'ÜBEN',
			'home.wordPractice' => 'Wortübung',
			'home.wordPracticeBody' => 'Baue täglich deinen Wortschatz in deiner gewählten Sprache auf',
			'home.immersiveLabel' => 'EINTAUCHEND',
			'home.quiz' => 'Quiz',
			'home.quizBodyLine1' => 'Lerne durch echte',
			'home.quizBodyLine2' => 'Beispiele im Kontext',
			'home.getStarted' => 'Loslegen',
			'home.library' => 'Bibliothek',
			'home.libraryTitle' => 'Lernen und Sparen',
			'home.learnMore' => 'Mehr erfahren',
			'home.premium.titleBefore' => 'Der Weg zu ',
			'home.premium.titleHighlight' => 'fließendem Sprechen',
			'home.premium.titleAfter' => ' ohne Angst, Fehler zu machen.',
			'home.premium.descriptionBefore' => 'Schließe dich Millionen von Schülern weltweit an. Beginne noch heute, die Sprachbarriere zu überwinden — ',
			'home.premium.descriptionHighlight' => 'die ersten 3 Tage komplett kostenlos.',
			'home.premium.feature1' => '24/7 zugänglicher KI-Tutor',
			'home.premium.feature2' => 'Unbegrenzter Zugang zu Privat-Tutoren',
			'home.premium.feature3' => 'Täglicher Lehrplan, der auf dich zugeschnitten ist',
			'home.premium.priceAmount' => '1,99\$',
			'home.premium.pricePeriod' => '/mo',
			'home.premium.discount' => '40% Rabatt bei jährlichem Kauf',
			'home.premium.cta' => 'Starten',
			'libraryPage.title' => 'Bibliothek',
			'libraryPage.searchWord' => 'Suchwort',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Gespeichertes Wort',
			'libraryPage.savedWordTab' => 'Gespeichertes Wort',
			'libraryPage.dictionaryTab' => 'Wörterbuch',
			'libraryPage.dictionaryLabel' => 'Wörterbuch',
			'wordPracticePage.title' => 'Wortübung',
			'wordPracticePage.turkish' => 'TÜRKISCH',
			'wordPracticePage.save' => 'Speichern',
			'wordPracticePage.saved' => 'Gespeichert',
			'wordPracticePage.listen' => 'Zuhören',
			'wordPracticePage.hint' => 'Hinweis',
			'wordPracticePage.previous' => 'VORHERIG',
			'wordPracticePage.next' => 'NÄCHSTES',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'Was möchtest du heute verbessern?',
			'quizPage.subtitle' => 'Wähle dein Training — dauert weniger als 3 Minuten 🚀',
			'quizPage.readingTitle' => 'Lesen',
			'quizPage.readingBody' => 'Verständnis durch Artikel & Geschichten',
			'quizPage.writingTitle' => 'Schreiben',
			'quizPage.writingBody' => 'Grammatik- & Wortschatzübungen',
			'quizPage.speakingTitle' => 'Sprechen',
			'quizPage.speakingBody' => 'Aussprache über KI-Sprachengine',
			'quizPage.readingTestTitle' => 'Lese-Test',
			'quizPage.read' => 'Lesen',
			'quizPage.listeningHint' => 'Sprich das englische Wort deutlich...',
			'quizPage.micPermissionDenied' => 'Mikrofon oder Spracherkennung ist nicht verfügbar.',
			'quizPage.matchSuccess' => 'Super! Das passt zum Wort.',
			'quizPage.matchFail' => ({required Object heard}) => 'Gehört "${heard}". Versuch es nochmal.',
			'quizPage.successfulTitle' => 'Erfolgreich!',
			'quizPage.successfulBody' => 'Aussprache wie ein Muttersprachler!',
			'quizPage.failedTitle' => 'Nicht bestanden',
			'quizPage.failedBody' => 'Es war fast soweit, gib es noch eine Chance',
			'quizPage.tryAgain' => 'NOCHMAL PROBIEREN',
			'quizPage.writingTestTitle' => 'Schreib-Test',
			'quizPage.sourceLanguage' => 'QUELLSPRACHE',
			'quizPage.answer' => 'ANTWORT',
			'quizPage.writeAnswerHint' => 'Schreibe deine Antwort hier...',
			'quizPage.submit' => 'Einreichen',
			'quizPage.speakingTestTitle' => 'Sprech-Test',
			'quizPage.speakingProficiency' => 'Sprechfertigkeit',
			'quizPage.speakClearlyHint' => 'Sprich deutlich in dein Mikrofon:',
			'quizPage.speakUp' => 'Laut sprechen',
			'quizPage.recording' => 'Aufnahme...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'FRAGE ${current} VON ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} ist unterwegs',
			'placeholder.body' => ({required Object tab}) => 'Wir bereiten eine fokussierte ${tab}-Erfahrung für dich vor.',
			'tutorPage.title' => 'Tutor',
			'tutorPage.chatWithLingola' => 'Chatte mit Lingola',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Chatte mit ${name}',
			'tutorPage.chatHistory' => 'Chatverlauf',
			'tutorPage.history' => 'Verlauf',
			'tutorPage.filter' => 'Filter',
			'tutorPage.country' => 'Land',
			'tutorPage.focus' => 'Fokus',
			'tutorPage.moreCountries' => '8+ weitere',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'SPEICHERN',
			'tutorPage.clearFilter' => 'Filter zurücksetzen',
			'tutorPage.startTalkNow' => 'Jetzt sprechen starten',
			'tutorPage.typeMessage' => 'Nachricht eingeben...',
			'tutorPage.speaker' => 'Sprecher',
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
			'tutorPage.tutors.santa' => 'Weihnachtsmann',
			'tutorPage.tags.adaptive' => 'Adaptiv',
			'tutorPage.tags.calm' => 'Ruhig',
			'tutorPage.tags.patient' => 'Geduldig',
			'tutorPage.tags.organized' => 'Organisiert',
			'tutorPage.tags.relaxed' => 'Entspannt',
			'tutorPage.tags.methodical' => 'Methodisch',
			'tutorPage.tags.attentive' => 'Aufmerksam',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Neugierig',
			'tutorPage.tags.observer' => 'Beobachter',
			'tutorPage.tags.ancientKnowledge' => 'Altes Wissen',
			'tutorPage.tags.wise' => 'Weise',
			'tutorPage.tags.clear' => 'Klar',
			'tutorPage.tags.decisive' => 'Entschlossen',
			'tutorPage.tags.disciplined' => 'Diszipliniert',
			'tutorPage.tags.smart' => 'Intelligent',
			'tutorPage.tags.analytic' => 'Analytisch',
			'tutorPage.tags.cheerful' => 'Fröhlich',
			'tutorPage.tags.generous' => 'Großzügig',
			'tutorPage.historyPreview1' => 'Hey! Ich war kurz davor, vor Langeweile zu platzen...',
			'tutorPage.historyPreview2' => 'Sollen wir heute das Bestellen von Essen üben?',
			'tutorPage.time1' => '11:00 Uhr',
			'tutorPage.time2' => 'Gestern',
			'tutorPage.chat.incoming1' => 'Guten Morgen! Ich freue mich, dass du heute bereit bist, zu üben.',
			'tutorPage.chat.outgoing1' => 'Ja, lass uns mit den Begrüßungen anfangen.',
			'tutorPage.chat.incoming2' => 'Perfekt. Wie würdest du einem Kollegen Hallo sagen?',
			'tutorPage.chat.typing' => 'Tippen',
			'tutorPage.calling.lessonBadge' => 'Lektion 1 : Begrüßungen',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Lektion ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Langweilig? Ich habe dieses Wort aus meinem Wortschatz gestrichen. Steh auf, der Plan steht schon fest: Wir gehen in die neue Spielhalle in Kadıköy.',
			'tutorPage.calling.highlight' => 'Langweilig?',
			'tutorPage.calling.close' => 'Anruf beenden',
			'tutorPage.calling.toggleCaptions' => 'Untertitel umschalten',
			'tutorPage.calling.toggleHints' => 'Hinweise umschalten',
			'tutorPage.calling.toggleMic' => 'Mikrofon umschalten',
			'lessonPage.title' => 'Weiterlernen',
			'lessonPage.profile' => 'Profil',
			'lessonPage.language' => 'Zielsprache',
			'lessonPage.completed' => 'Abgeschlossen',
			'lessonPage.locked' => 'Gesperrt',
			'lessonPage.pickTutorTitle' => 'Wähle deinen Tutor',
			'lessonPage.startTalk' => 'Lektion starten',
			'lessonPage.chatInstead' => 'Stattdessen chatten',
			'lessonPage.lockedHint' => 'Beende die vorherige Lektion, um diese freizuschalten.',
			'lessonPage.levelLockedTitle' => 'Stufe gesperrt',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Dein Englischniveau ist ${userLevel} — ${lessonLevel}-Lektionen kannst du ohne den früheren Pfad nicht öffnen.',
			'lessonPage.levelLockedOk' => 'Verstanden',
			'lessonPage.notesTitle' => 'Lektionsnotizen',
			'lessonPage.whatWeLearned' => 'Was wir heute gelernt haben',
			'lessonPage.deleteNotes' => 'Meine Lektionsnotizen löschen',
			'lessonPage.deleteNotesConfirm' => 'Diese Notizen löschen? Dies kann nicht rückgängig gemacht werden.',
			'lessonPage.delete' => 'Löschen',
			'lessonPage.cancel' => 'Abbrechen',
			'lessonPage.practiceCta' => 'Wenn das zu schwer war, kannst du dasselbe Thema nochmal üben.',
			'lessonPage.practiceNow' => 'Dieses Thema üben',
			'lessonPage.openChat' => 'Chat mit Tutor öffnen',
			'lessonPage.yourScore' => 'Dein Punktestand',
			'lessonPage.bestScore' => ({required Object score}) => 'Bester ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Passiver Teilnehmer',
			'lessonPage.participationSilentBody' => 'Du warst diesmal still. Ich denke, du solltest diese Lektion wiederholen.',
			'lessonPage.participationPassive' => 'Geringe Teilnahme',
			'lessonPage.participationPassiveBody' => 'Du hast kaum gesprochen. Versuch die Lektion nochmal und sag mehr.',
			'lessonPage.participationActive' => 'Gute Teilnahme',
			'lessonPage.participationActiveBody' => 'Du hast am Gespräch teilgenommen. Mach weiter so!',
			'lessonPage.participationStrong' => 'Starke Teilnahme',
			'lessonPage.participationStrongBody' => 'Du hast viel gesprochen. Tolle Arbeit!',
			'lessonPage.retakeLesson' => 'Diese Lektion wiederholen',
			'lessonPage.finishLesson' => 'Lektion beenden',
			'lessonPage.savingNotes' => 'Dein Tutor schreibt die heutigen Notizen…',
			'lessonPage.noNotes' => 'Beende diese Lektion, um Notizen von deinem Tutor zu erhalten.',
			'lessonPage.notesDeleted' => 'Lektionsnotizen gelöscht',
			'lessonPage.levels.a1.title' => 'A1 - Starter',
			'lessonPage.levels.a1.lessons.0' => 'Begrüßungen',
			'lessonPage.levels.a1.lessons.1' => 'Vorstellungen I',
			'lessonPage.levels.a1.lessons.2' => 'Berufe',
			'lessonPage.levels.a1.lessons.3' => 'Ein Lieblingszimmer',
			'lessonPage.levels.a1.lessons.4' => 'Tägliche Routine',
			'lessonPage.levels.a1.lessons.5' => 'Obst',
			'lessonPage.levels.a1.lessons.6' => 'Ratschläge 1',
			'lessonPage.levels.a1.lessons.7' => 'Familie 1',
			'lessonPage.levels.a1.lessons.8' => 'Alltagsgegenstände',
			'lessonPage.levels.a1.lessons.9' => 'Heimatstadt',
			'lessonPage.levels.a1.lessons.10' => 'Haus',
			'lessonPage.levels.a1.lessons.11' => 'Essensvorlieben',
			'lessonPage.levels.a1.lessons.12' => 'Hobbys 1',
			'lessonPage.levels.a1.lessons.13' => 'Erfolgreiche Menschen',
			'lessonPage.levels.a1.lessons.14' => 'Essen und Trinken',
			'lessonPage.levels.a1.lessons.15' => 'Bestellen im Restaurant',
			'lessonPage.levels.a1.lessons.16' => 'Haustiere',
			'lessonPage.levels.a1.lessons.17' => 'Gesundheit und Fitness',
			'lessonPage.levels.a1.lessons.18' => 'Wetter',
			'lessonPage.levels.a1.lessons.19' => 'Neuer Lebensstil',
			'lessonPage.levels.a1.lessons.20' => 'Besser werden',
			'lessonPage.levels.a1.lessons.21' => 'Hobbys 2',
			'lessonPage.levels.a1.lessons.22' => 'Fragen zu Orten',
			'lessonPage.levels.a1.lessons.23' => 'Besitz',
			'lessonPage.levels.a1.lessons.24' => 'Einkaufen 1',
			'lessonPage.levels.a1.lessons.25' => 'Die Uhrzeit sagen',
			'lessonPage.levels.a1.lessons.26' => 'Wegbeschreibungen 1',
			'lessonPage.levels.a1.lessons.27' => 'Einkaufen 2',
			'lessonPage.levels.a1.lessons.28' => 'Dich kennenlernen',
			'lessonPage.levels.a1.lessons.29' => 'Orte von Gegenständen',
			'lessonPage.levels.a1.lessons.30' => 'Erscheinungen',
			'lessonPage.levels.a1.lessons.31' => 'Wegbeschreibungen 2',
			'lessonPage.levels.a2.title' => 'A2 - Grundkenntnisse',
			'lessonPage.levels.a2.lessons.0' => 'Familie 2',
			'lessonPage.levels.a2.lessons.1' => 'Menschen und Orte',
			'lessonPage.levels.a2.lessons.2' => 'Familie 3',
			'lessonPage.levels.a2.lessons.3' => 'Gegenstände beschreiben',
			'lessonPage.levels.a2.lessons.4' => 'Stadt',
			'lessonPage.levels.a2.lessons.5' => 'Das Bauprojekt',
			'lessonPage.levels.a2.lessons.6' => 'Zuhause ist es am schönsten',
			'lessonPage.levels.a2.lessons.7' => 'Wie spät ist es?',
			'lessonPage.levels.a2.lessons.8' => 'Tägliche Routine 2',
			'lessonPage.levels.a2.lessons.9' => 'Freizeit',
			'lessonPage.levels.a2.lessons.10' => 'Essen und Ernährung',
			'lessonPage.levels.a2.lessons.11' => 'Einkaufen und Konsum',
			'lessonPage.levels.a2.lessons.12' => 'Urlaub',
			'lessonPage.levels.a2.lessons.13' => 'Wochenendpläne',
			'lessonPage.levels.a2.lessons.14' => 'Formell oder lässig',
			'lessonPage.levels.a2.lessons.15' => 'Mode',
			'lessonPage.levels.a2.lessons.16' => 'Einkaufen 3',
			'lessonPage.levels.a2.lessons.17' => 'Ratschläge 2',
			'lessonPage.levels.a2.lessons.18' => 'Du schaffst das',
			'lessonPage.levels.a2.lessons.19' => 'Einkaufen 4',
			'lessonPage.levels.a2.lessons.20' => 'Small Talk',
			'lessonPage.levels.a2.lessons.21' => 'Einen Latte bitte',
			'lessonPage.levels.a2.lessons.22' => 'Essen',
			'lessonPage.levels.a2.lessons.23' => 'Sich fortbewegen',
			'lessonPage.levels.a2.lessons.24' => 'Bereit für eine Reise',
			'lessonPage.levels.a2.lessons.25' => 'Reisen 1',
			'lessonPage.levels.a2.lessons.26' => 'Städtische Ausflüge',
			'lessonPage.levels.a2.lessons.27' => 'Reisen 2',
			'lessonPage.levels.a2.lessons.28' => 'Ein Platz zum Übernachten',
			'lessonPage.levels.a2.lessons.29' => 'So aufregend',
			'lessonPage.levels.a2.lessons.30' => 'Die richtige Person',
			'lessonPage.levels.a2.lessons.31' => 'Schule',
			'lessonPage.levels.a2.lessons.32' => 'Musikvorlieben',
			'lessonPage.levels.a2.lessons.33' => 'Sport',
			'lessonPage.levels.a2.lessons.34' => 'Regeln des Rennens',
			'lessonPage.levels.a2.lessons.35' => 'Hinterlasse eine Nachricht',
			'lessonPage.levels.a2.lessons.36' => 'Anfragen',
			'lessonPage.levels.a2.lessons.37' => 'Einladungen',
			'lessonPage.levels.a2.lessons.38' => 'Reiseerfahrungen',
			'lessonPage.levels.a2.lessons.39' => 'Vergangenheit 1',
			'lessonPage.levels.a2.lessons.40' => 'Vergangenheit 2',
			'lessonPage.levels.a2.lessons.41' => 'Vergangenheit 3',
			'lessonPage.levels.a2.lessons.42' => 'Fragen zur Vergangenheit',
			'lessonPage.levels.a2.lessons.43' => 'Du bist nie zu alt',
			'lessonPage.levels.a2.lessons.44' => 'Kindheitserinnerungen',
			'lessonPage.levels.a2.lessons.45' => 'Komplimente',
			'lessonPage.levels.a2.lessons.46' => 'Ausreden',
			'lessonPage.levels.a2.lessons.47' => 'Es ist so nervig!',
			'lessonPage.levels.a2.lessons.48' => 'Eine digitale Welt',
			'lessonPage.levels.a2.lessons.49' => 'Arbeitsleben',
			'lessonPage.levels.a2.lessons.50' => 'Ich habe das nicht verstanden',
			'lessonPage.levels.a2.lessons.51' => 'Sparen oder ausgeben?',
			'lessonPage.levels.a2.lessons.52' => 'Entschuldigung sagen',
			'lessonPage.levels.b1.title' => 'B1 - Mittelstufe',
			'lessonPage.levels.b1.lessons.0' => 'Kulturelle Traditionen',
			'lessonPage.levels.b1.lessons.1' => 'Prominente',
			'lessonPage.levels.b1.lessons.2' => 'Kunst und Kreativität',
			'lessonPage.levels.b1.lessons.3' => 'Zukunftspläne',
			'lessonPage.levels.b1.lessons.4' => 'Veranstaltungen planen',
			'lessonPage.levels.b1.lessons.5' => 'Ziele und Pläne',
			'lessonPage.levels.b1.lessons.6' => 'Historische Ereignisse',
			'lessonPage.levels.b1.lessons.7' => 'Technologie',
			'lessonPage.levels.b1.lessons.8' => 'Nie im Leben',
			'lessonPage.levels.b1.lessons.9' => 'Was läuft gerade',
			'lessonPage.levels.b1.lessons.10' => 'Traumurlaub',
			'lessonPage.levels.b1.lessons.11' => 'Soziale Medien',
			'lessonPage.levels.b1.lessons.12' => 'Buchempfehlungen',
			'lessonPage.levels.b1.lessons.13' => 'Einer dieser Tage',
			'lessonPage.levels.b1.lessons.14' => 'Besondere Fotos',
			'lessonPage.levels.b1.lessons.15' => 'Persönliche Erfolge',
			'lessonPage.levels.b1.lessons.16' => 'Lieblingsfilme',
			'lessonPage.levels.b1.lessons.17' => 'Nachricht des Tages',
			'lessonPage.levels.b1.lessons.18' => 'Glück',
			'lessonPage.levels.b1.lessons.19' => 'Eine hektische Woche',
			'lessonPage.levels.b1.lessons.20' => 'Wo ich aufgewachsen bin',
			'lessonPage.levels.b1.lessons.21' => 'Schultage',
			'lessonPage.levels.b1.lessons.22' => 'Profile',
			'lessonPage.levels.b1.lessons.23' => 'Lebenskarten',
			'lessonPage.levels.b1.lessons.24' => 'Alltag',
			'lessonPage.levels.b1.lessons.25' => 'Was kommt als Nächstes',
			'lessonPage.levels.b1.lessons.26' => 'Vorschläge machen',
			'lessonPage.levels.b1.lessons.27' => 'Was ist passiert',
			'lessonPage.levels.b1.lessons.28' => 'Erinnerungen',
			'lessonPage.levels.b1.lessons.29' => 'Kulturshock',
			'lessonPage.levels.b1.lessons.30' => 'Interessenphrasen',
			'lessonPage.levels.b1.lessons.31' => 'Vorstellungsgespräche',
			'lessonPage.levels.b1.lessons.32' => 'Bucket Lists',
			'lessonPage.levels.b1.lessons.33' => 'Meine Art von Stadt',
			'lessonPage.levels.b1.lessons.34' => 'Die Internetgeneration',
			'lessonPage.levels.b1.lessons.35' => 'Beliebte Marken',
			'lessonPage.levels.b1.lessons.36' => 'Meinungsphrasen',
			'lessonPage.levels.b1.lessons.37' => 'Wie sieht es aus',
			'lessonPage.levels.b1.lessons.38' => 'Wohnraum',
			'lessonPage.levels.b1.lessons.39' => 'Gut essen',
			'lessonPage.levels.b1.lessons.40' => 'Ungewöhnliche Hobbys',
			'lessonPage.levels.b1.lessons.41' => 'Eine schwierige Entscheidung',
			'lessonPage.levels.b1.lessons.42' => 'Handeln',
			'lessonPage.levels.b1.lessons.43' => 'Neue Fähigkeiten',
			'lessonPage.levels.b1.lessons.44' => 'Eine Beschwerde einreichen',
			'lessonPage.levels.b1.lessons.45' => 'Bildung',
			'lessonPage.levels.b1.lessons.46' => 'Grüne Städte',
			'lessonPage.levels.b1.lessons.47' => 'Was ist in einem Job',
			'lessonPage.levels.b1.lessons.48' => 'Persönliche Herausforderungen',
			'lessonPage.levels.b1.lessons.49' => 'Interviewphrasen',
			'lessonPage.levels.b1.lessons.50' => 'Höfliche Abschlüsse',
			'lessonPage.levels.b1.lessons.51' => 'Schlagzeilen',
			'lessonPage.levels.b1.lessons.52' => 'Kleine Veränderungen',
			'lessonPage.levels.b1.lessons.53' => 'Entschuldigungen',
			'lessonPage.levels.b1.lessons.54' => 'Telefonetikette',
			'lessonPage.levels.b1.lessons.55' => 'Entschuldigung, dass ich unterbreche…',
			'lessonPage.levels.b1.lessons.56' => 'Antworten auf Beschwerden',
			'lessonPage.levels.b2.title' => 'B2 - Obere Mittelstufe',
			'lessonPage.levels.b2.lessons.0' => 'Persönlichkeiten',
			'lessonPage.levels.b2.lessons.1' => 'Großartige Anführer',
			'lessonPage.levels.b2.lessons.2' => 'Gesunder Lebensstil',
			'lessonPage.levels.b2.lessons.3' => 'Was ist die Wahrheit?',
			'lessonPage.levels.b2.lessons.4' => 'Persönliches Wachstum',
			'lessonPage.levels.b2.lessons.5' => 'Sich äußern',
			'lessonPage.levels.b2.lessons.6' => 'Schauspielern?',
			'lessonPage.levels.b2.lessons.7' => 'Ich erinnere mich...',
			'lessonPage.levels.b2.lessons.8' => 'Soziale Rückmeldungen',
			'lessonPage.levels.b2.lessons.9' => 'Tatort',
			'lessonPage.levels.b2.lessons.10' => 'Höfliche Probleme',
			'lessonPage.levels.b2.lessons.11' => 'Konfliktlösung',
			'lessonPage.levels.b2.lessons.12' => 'Lieben oder hassen?',
			'lessonPage.levels.b2.lessons.13' => 'Umweltprobleme',
			'lessonPage.levels.b2.lessons.14' => 'Wir können es lösen',
			'lessonPage.levels.b2.lessons.15' => 'Geheimnisse und Verbrechen',
			'lessonPage.levels.b2.lessons.16' => 'Mögliche Zukünfte',
			'lessonPage.levels.b2.lessons.17' => 'Geschäftspläne',
			'lessonPage.levels.b2.lessons.18' => 'Entscheidungen im Meeting',
			'lessonPage.levels.b2.lessons.19' => 'Es ist so vorhersehbar...',
			'lessonPage.levels.b2.lessons.20' => 'Am Arbeitsplatz',
			'lessonPage.levels.b2.lessons.21' => 'Wissenschaft und Technologie',
			'lessonPage.levels.b2.lessons.22' => 'Zeitmanagement',
			'lessonPage.levels.b2.lessons.23' => 'Menschenrechte',
			'lessonPage.levels.c1.title' => 'C1 - Fortgeschritten',
			'lessonPage.levels.c1.lessons.0' => 'Kulturelle Normen',
			'lessonPage.levels.c1.lessons.1' => 'Einfluss der sozialen Medien',
			'lessonPage.levels.c1.lessons.2' => 'Karriereentscheidungen',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.c1.lessons.3' => 'Leistung steigern',
			'lessonPage.levels.c1.lessons.4' => 'Erfindungen',
			'lessonPage.levels.c1.lessons.5' => 'Zeitreise',
			'lessonPage.levels.c1.lessons.6' => 'Besitz',
			'lessonPage.levels.c1.lessons.7' => 'Berufliche Fähigkeiten',
			'lessonPage.levels.c1.lessons.8' => 'Historische Veränderungen',
			'lessonPage.levels.c1.lessons.9' => 'Überblick schreiben',
			'lessonPage.levels.c1.lessons.10' => 'Geheimnisse',
			'lessonPage.levels.c1.lessons.11' => 'Seltsame Theorien',
			'lessonPage.levels.c1.lessons.12' => 'Promis',
			'lessonPage.levels.c1.lessons.13' => 'Globale Politik',
			'lessonPage.levels.c1.lessons.14' => 'Produktboom',
			'lessonPage.levels.c1.lessons.15' => 'Wird glücklich sein?',
			'lessonPage.levels.c1.lessons.16' => 'Vielleicht später...',
			'lessonPage.levels.c1.lessons.17' => 'Neue Lösungen',
			'lessonPage.levels.c1.lessons.18' => 'Kontextueller Einfluss',
			'lessonPage.levels.c1.lessons.19' => 'Ein verlorenes Logo',
			'lessonPage.levels.c1.lessons.20' => 'Freundliche Taten',
			'lessonPage.levels.c1.lessons.21' => 'Was für ein Film',
			'lessonPage.levels.c1.lessons.22' => 'Wie nervig',
			'lessonPage.levels.c1.lessons.23' => 'In den Nachrichten',
			'lessonPage.levels.c2.title' => 'C2 - Experte',
			'lessonPage.levels.c2.lessons.0' => 'Globalisierung',
			'lessonPage.levels.c2.lessons.1' => 'Naturkatastrophen',
			'lessonPage.levels.c2.lessons.2' => 'Auf Informationen reagieren',
			'lessonPage.levels.c2.lessons.3' => 'Work-Life-Balance',
			'lessonPage.levels.c2.lessons.4' => 'Remote-Arbeit',
			'lessonPage.levels.c2.lessons.5' => 'Familienprobleme',
			'lessonPage.levels.c2.lessons.6' => 'Grundlagen der menschlichen Anatomie',
			'lessonPage.levels.c2.lessons.7' => 'Gesundheitsprognosen',
			'lessonPage.levels.c2.lessons.8' => 'Zugang zur Gesundheitsversorgung',
			'lessonPage.levels.c2.lessons.9' => 'Globale Reiseerfahrung',
			'lessonPage.levels.c2.lessons.10' => 'Superkräfte',
			'lessonPage.levels.c2.lessons.11' => 'Teambildung',
			'lessonPage.levels.c2.lessons.12' => 'Biofluoreszenz',
			'lessonPage.levels.c2.lessons.13' => 'Dilemmata',
			'lessonPage.levels.c2.lessons.14' => 'Soziale Begeisterung',
			'lessonPage.levels.c2.lessons.15' => 'Veränderungen',
			'lessonPage.levels.c2.lessons.16' => 'Arbeit, Arbeit, Arbeit',
			'lessonPage.levels.c2.lessons.17' => 'Lokale Probleme',
			'lessonPage.levels.c2.lessons.18' => 'Probleme, Probleme',
			'lessonPage.levels.c2.lessons.19' => 'Fakt oder Fiktion?',
			'lessonPage.levels.c2.lessons.20' => 'Sehenswürdigkeiten',
			'lessonPage.levels.c2.lessons.21' => 'Freiwilligenarbeit',
			'lessonPage.levels.c2.lessons.22' => 'Das geistige Auge',
			'lessonPage.levels.c2.lessons.23' => 'Medienkonsum',
			'rolePlayPage.title' => 'Rollenspiel',
			'rolePlayPage.subtitle' => 'Wähle deine Rolle — erlebe ein echtes Szenario 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} abgeschlossen',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Anfänger',
			'rolePlayPage.screenplay' => 'DREHBUCH',
			'rolePlayPage.dailyInteractions' => 'Tägliche Interaktionen',
			'rolePlayPage.business' => 'Geschäft',
			'rolePlayPage.coffee.title' => 'Bestellung im Café',
			'rolePlayPage.coffee.screenplay' => 'Bestelle dein Lieblingsgetränk, frage nach Größen und Extras, bestätige deinen Gesamtbetrag und hole deinen Kaffee an der Theke ab.',
			'rolePlayPage.coffee.chat.briefing' => 'Hallo! Heute üben wir das Bestellen in einem Café — Hallo, Größen, Extras. Ich erkläre zuerst ein wenig, dann spielen wir es nach. Klingt gut?',
			'rolePlayPage.coffee.chat.incoming1' => 'Willkommen! Was kann ich dir heute bringen?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Hallo! Ich hätte gerne einen mittleren Latte, bitte.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Klar',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Möchtest du ihn heiß oder kalt, und irgendwelche Extras?',
			'rolePlayPage.coffee.chat.botReply' => 'Tolle Wahl. Noch etwas zu deiner Bestellung?',
			'rolePlayPage.directions.title' => 'Nach dem Weg fragen auf der Straße',
			'rolePlayPage.directions.screenplay' => 'Frage nach dem Weg zu einem Ort, finde heraus, wie du zur U-Bahn oder zum Bus kommst, erhalte Informationen zu Tickets und höre Restaurantempfehlungen.',
			'rolePlayPage.directions.chat.briefing' => 'Hallo! Heute üben wir das Nach dem Weg fragen auf der Straße. Ich erkläre zuerst ein wenig, dann spielen wir es nach. Klingt gut?',
			'rolePlayPage.directions.chat.incoming1' => 'Hallo! Du siehst ein bisschen verloren aus — brauchst du Hilfe beim Finden von etwas?',
			'rolePlayPage.directions.chat.outgoing1' => 'Ja, ich suche die nächste U-Bahn-Station.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Natürlich',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Geh zwei Blocks in diese Richtung, dann bieg links ab. Du wirst den Eingang sehen.',
			'rolePlayPage.directions.chat.botReply' => 'Gern geschehen! Möchtest du auch einen Restauranttipp in der Nähe der Station?',
			'rolePlayPage.interview.title' => 'Vorstellungsgespräch',
			'rolePlayPage.interview.screenplay' => 'Stelle dich vor, beantworte häufige Interviewfragen, sprich über deine Erfahrungen und frage nach der Rolle und den nächsten Schritten.',
			'rolePlayPage.interview.chat.briefing' => 'Hallo! Heute üben wir ein Vorstellungsgespräch. Ich erkläre zuerst ein wenig, dann spielen wir es nach — ich interviewe dich, dann wechseln wir. Klingt gut?',
			'rolePlayPage.interview.chat.incoming1' => 'Danke, dass du heute gekommen bist. Könntest du dich kurz vorstellen?',
			'rolePlayPage.interview.chat.outgoing1' => 'Natürlich. Ich freue mich, hier zu sein und meine Erfahrungen zu teilen.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Wunderbar',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Erzähl mir von einem aktuellen Projekt, auf das du stolz bist.',
			'rolePlayPage.interview.chat.botReply' => 'Das ist beeindruckend. Welche Fragen hast du zur Rolle?',
			'notificationsPage.title' => 'Benachrichtigungen',
			'notificationsPage.deleteConfirmTitle' => 'Sind Sie sicher?',
			'notificationsPage.deleteConfirmBody' => 'Diese Benachrichtigung wird gelöscht.',
			'notificationsPage.delete' => 'Löschen',
			'notificationsPage.cancel' => 'Abbrechen',
			'notificationsPage.translation.title' => 'Neue Übersetzung Bereit',
			'notificationsPage.translation.body' => 'Ihre Audio-Übersetzungsdatei wurde erfolgreich in Text umgewandelt und übersetzt.',
			'notificationsPage.offer.title' => 'Ein Sonderangebot Erwartet Dich',
			'notificationsPage.offer.body' => 'Upgrade auf Premium für unbegrenzte Fotoübersetzungen mit 50% Rabatt.',
			'notificationsPage.stories.title' => 'Entdecke Neue Geschichten',
			'notificationsPage.stories.body' => 'Lerne neue Wörter durch Geschichten',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Noch keine Benachrichtigungen',
			'notificationsPage.emptySubtitle' => 'Vergiss nicht, wieder vorbeizuschauen, wenn du eine Benachrichtigung erhältst.',
			'profilePage.title' => 'Profil',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Kostenlose Version',
			'profilePage.dayStreak' => 'Tagesstreak!',
			'profilePage.accountSettings' => 'Kontoeinstellungen',
			'profilePage.general' => 'Allgemein',
			'profilePage.profileSettings' => 'Profileinstellungen',
			'profilePage.fullName' => 'Vollständiger Name',
			'profilePage.email' => 'E-Mail',
			'profilePage.deleteAccount' => 'Konto löschen',
			'profilePage.save' => 'SPEICHERN',
			'profilePage.deleteTitle' => 'Wir möchten dich nicht verlieren, aber wir verstehen dich.',
			'profilePage.deleteBody' => 'Kannst du uns sagen, warum du Lingola verlassen möchtest, damit wir dein Erlebnis verbessern können?',
			'profilePage.deleteReasons.aiCharacters' => 'Ich fand die KI-Charaktere nicht realistisch.',
			'profilePage.deleteReasons.videoIssues' => 'Ich habe technische Probleme bei Videoanrufen.',
			'profilePage.deleteReasons.pricing' => 'Die Abonnementpreise sind höher als erwartet.',
			'profilePage.deleteReasons.noMatch' => 'Ich habe nicht die Charaktere gefunden, die ich gesucht habe.',
			'profilePage.deleteReasons.shortTrial' => 'Ich wollte nur für eine kurze Zeit testen.',
			'profilePage.deleteReasons.other' => 'Sonstiges',
			'profilePage.messageOptional' => 'Nachricht (optional)',
			'profilePage.messageHint' => 'Bitte schreibe deine Nachricht, falls du eine hast.',
			'profilePage.next' => 'WEITER',
			'profilePage.specialOfferTitle' => 'Sonderangebot',
			'profilePage.specialOfferBody' => 'Schau dir das Angebot an, das wir für dich vorbereitet haben, bevor du gehst.',
			'profilePage.monthlyPlanTitle' => 'Wechsel zum 1-Monats-Plan',
			'profilePage.monthlyPlanPrice' => '\$79/Monat, jederzeit kündbar',
			'profilePage.monthlyPlanDesc' => 'Keine langfristige Verpflichtung. Bleib mit unserer Community auf monatlicher Basis verbunden.',
			'profilePage.whatYoullKeep' => 'Was du behalten wirst:',
			'profilePage.keepCharacters' => 'Zugriff auf alle Charaktere',
			'profilePage.keepVideo' => 'Unbegrenzte Videoanrufe',
			'profilePage.keepCourses' => 'Zugriff auf alle Kurse',
			'profilePage.switchMonthlyCta' => 'Wechsel zum Monatsplan',
			'profilePage.confirmTitle' => 'Bist du sicher?',
			'profilePage.confirmBody' => 'Wir möchten dich wirklich nicht gehen sehen. Hier ist, was du verlieren wirst:',
			'profilePage.loseCharacters' => 'Unbegrenzter Zugriff auf Charaktere',
			'profilePage.loseVideo' => 'Unbegrenzter Zugriff auf Videoanrufe',
			'profilePage.loseCourses' => 'Zugriff auf alle Kurse',
			'profilePage.discountTitle' => 'Bleib und erhalte 60% Rabatt für 1 Monat',
			'profilePage.discountSubtitle' => 'Unser bestes Angebot aller Zeiten. Nur \$27.60/Monat',
			'profilePage.acceptDiscountCta' => '60% Rabatt annehmen & bleiben',
			'profilePage.farewellTitle' => 'Es tut uns leid, dich gehen zu sehen',
			'profilePage.farewellBody' => ({required Object date}) => 'Deine Mitgliedschaft wurde gekündigt. Du hast bis zum Ende deines aktuellen Abrechnungszeitraums am ${date} Zugriff.',
			'profilePage.changeMindTitle' => '✨ Meinung ändern?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Du kannst deine Mitgliedschaft jederzeit vor ${date} reaktivieren, um deine Vorteile zu behalten.',
			'profilePage.reactivateCta' => 'Warte, ich möchte reaktivieren',
			'profilePage.done' => 'FERTIG',
			'profilePage.notifications' => 'Benachrichtigungen',
			'profilePage.appLanguage' => 'App-Sprache',
			'profilePage.selectLanguageTitle' => 'Sprache auswählen',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passiv',
			'profilePage.active' => 'Aktiv',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Freund teilen',
			'profilePage.shareWithFriendTitle' => 'Mit Freund teilen',
			'profilePage.shareInviteBody' => 'Lade deine Freunde ein und genießt das Übersetzen zusammen',
			'profilePage.rateUs' => 'Bewerte uns',
			'profilePage.faq' => 'Lingola FAQ',
			'profilePage.faqItems.supportedLanguages.question' => 'Welche Sprachen unterstützt die App?',
			'profilePage.faqItems.supportedLanguages.answer' => 'Die App unterstützt derzeit Englisch, Türkisch und Deutsch. Neue Sprachen werden regelmäßig hinzugefügt.',
			'profilePage.faqItems.howAiWorks.question' => 'Wie funktioniert die KI?',
			'profilePage.faqItems.howAiWorks.answer' => 'Die KI interagiert mit dir wie ein echter Tutor. Sie analysiert deine Gespräche, erkennt Fehler und bietet personalisiertes Feedback basierend auf deinem Fortschritt.',
			'profilePage.faqItems.offlineUse.question' => 'Kann ich die App offline nutzen?',
			'profilePage.faqItems.offlineUse.answer' => 'Ja. Du kannst bestimmte Lektionen und Gesprächsszenarien im Voraus herunterladen und offline nutzen. Live-Chat erfordert jedoch eine Internetverbindung.',
			'profilePage.faqItems.isFree.question' => 'Ist die App kostenlos?',
			'profilePage.faqItems.isFree.answer' => 'Die Basisversion ist kostenlos. Mit Premium erhältst du erweiterte Chatszenarien, Ausspracheanalysen und den persönlichen Tutor-Modus.',
			'profilePage.faqItems.pronunciationEval.question' => 'Wie wird meine Aussprache bewertet?',
			'profilePage.faqItems.pronunciationEval.answer' => 'Die App analysiert deine Stimme und verwendet KI-gestützte Spracherkennung, um deinen Akzent und deine Aussprache zu bewerten. Wörter, die du verbessern musst, werden hervorgehoben.',
			'profilePage.faqItems.dailyPractice.question' => 'Muss ich täglich üben?',
			'profilePage.faqItems.dailyPractice.answer' => 'Ja. Das System verfolgt deinen Fortschritt jeden Tag. Nur 10–15 Minuten Sprechpraxis pro Tag können dein Sprachenlernen merklich beschleunigen.',
			'profilePage.faqItems.levelDetermination.question' => 'Wie wird mein Lernniveau bestimmt?',
			'profilePage.faqItems.levelDetermination.answer' => 'Ein kurzer Niveau-Check bei deiner ersten Anmeldung analysiert dein aktuelles Wissen. Danach empfiehlt die KI automatisch Lektionen, die zu deinem Niveau passen.',
			'profilePage.faqItems.realPeopleChat.question' => 'Kann ich mit echten Menschen sprechen?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Ja. Premium-Nutzer können kurze Übungssitzungen mit echten Tutoren planen.',
			'profilePage.faqItems.dataSecurity.question' => 'Sind meine Daten sicher?',
			'profilePage.faqItems.dataSecurity.answer' => 'Absolut. Alle Gespräche und Benutzerdaten werden verschlüsselt gespeichert. Deine persönlichen Informationen werden niemals an Dritte weitergegeben.',
			'profilePage.faqItems.disableReminders.question' => 'Wie schalte ich tägliche Erinnerungen aus?',
			'profilePage.faqItems.disableReminders.answer' => 'Gehe zu den Profileinstellungen, öffne Benachrichtigungen und ändere die Erinnerungsfrequenz oder schalte die Benachrichtigungen komplett aus.',
			'profilePage.support' => 'Support',
			'profilePage.feedback' => 'Feedback',
			'profilePage.progression' => 'Fortschritt',
			'profilePage.progressTitle' => 'Fortschritt',
			'profilePage.goodMorning' => 'Guten Morgen,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'Englisch',
			'profilePage.past7Days' => 'Letzte 7 Tage',
			'profilePage.past7DaysBody' => 'Lerne jeden Tag, um deinen Streak aufzubauen und eine starke Lerngewohnheit zu entwickeln.',
			'profilePage.currentLevel' => 'Aktuelles Niveau',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Nur noch ${xp} XP bis zu ${level}!',
			'profilePage.toNextLevel' => 'ZUM NÄCHSTEN NIVEAU',
			'profilePage.dayStreakLabel' => 'Tagesstreak',
			'profilePage.totalPoints' => 'Gesamtpunkte',
			'profilePage.savedWords' => 'Gespeicherte Wörter',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} Elemente zur Überprüfung',
			'profilePage.logout' => 'Abmelden',
			'profilePage.logoutTitle' => 'Du bist dabei, dich abzumelden',
			'profilePage.logoutBody' => 'Bis bald! Wir werden deine Atemübungen vermissen.',
			'profilePage.logoutConfirm' => 'ABMELDEN',
			'profilePage.logoutCancel' => 'ABBRECHEN',
			'profilePage.days.mon' => 'MO',
			'profilePage.days.tue' => 'DI',
			'profilePage.days.wed' => 'MI',
			'profilePage.days.thu' => 'DO',
			'profilePage.days.fri' => 'FR',
			'profilePage.days.sat' => 'SA',
			'profilePage.days.sun' => 'SO',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Ihr Zertifikat',
			'profilePage.certificateLevelTitle' => ({required Object level}) => '${level} Certificate',
			'profilePage.certificateOf' => 'Certificate of Achievement',
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
			'profilePage.certificateVerifyHint' => 'Jeder kann den QR-Code scannen, um Ihre Leistung zu bestätigen.',
			'profilePage.certificateShare' => 'Zertifikat teilen',
			'profilePage.certificateShareQr' => 'QR-Code teilen',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Wenn Sie ein CEFR-Niveau bei Lingola abschließen, erscheint Ihr Zertifikat hier — mit Ihrem Namen, Niveau und einem QR-Code zur Überprüfung.',
			'profilePage.certificatePreviewHint' => 'Schließen Sie einen Level-Pfad ab, um Ihr Zertifikat freizuschalten',
			'profilePage.certificateTapToView' => 'Tippen Sie, um Ihr Zertifikat anzuzeigen und zu teilen',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Es sieht so aus, als hättest du eine kurze Pause gemacht.',
			'pushNotifications.h2.1' => 'Hast du einen Moment für ein Wort?',
			'pushNotifications.h2.2' => 'Wir sind hier – kein Stress.',
			'pushNotifications.h2.3' => 'Dein Lernrhythmus hat kurz pausiert.',
			'pushNotifications.h2.4' => 'Eine kleine Wiederholung könnte gut tun.',
			'pushNotifications.h4.0' => 'Ein neues Wort könnte heute auf dich warten 👀',
			'pushNotifications.h4.1' => 'Vielleicht hast du eine schnelle Übung verpasst.',
			'pushNotifications.h4.2' => 'Vielleicht hast du einen nützlichen Satz übersprungen.',
			'pushNotifications.h4.3' => 'Der Fortschritt von heute ist noch offen.',
			'pushNotifications.h4.4' => 'Ein Wort, ein Satz… vielleicht beides.',
			'pushNotifications.h8.0' => 'Du musst nicht jeden Tag Fortschritte machen.',
			'pushNotifications.h8.1' => 'Auch eine kleine Wiederholung zählt.',
			'pushNotifications.h8.2' => 'Du hast heute nichts verloren, indem du nicht gelernt hast.',
			'pushNotifications.h8.3' => 'Wir sind bereit, wenn du es bist.',
			'pushNotifications.h8.4' => 'Sprachenlernen ist ein Marathon, kein Sprint.',
			'pushNotifications.h24.0' => 'Ein Tag ist vergangen. Deine Wörter sind immer noch hier.',
			'pushNotifications.h24.1' => 'Eine Pause zu machen ist normal.',
			'pushNotifications.h24.2' => 'Dein Platz ist genau da, wo du ihn gelassen hast.',
			'pushNotifications.h24.3' => 'Mach weiter, wann immer du möchtest.',
			'pushNotifications.h24.4' => 'Die Sprache wird nicht weglaufen – wir auch nicht.',
			'pushNotifications.lessonReminderTitle' => 'Die heutige Lektion wartet',
			'pushNotifications.lessonReminder.0' => 'Du warst heute noch nicht in der Lektion — 5 Minuten reichen.',
			'pushNotifications.lessonReminder.1' => 'Dein Tutor ist bereit. Mach weiter, wo du aufgehört hast.',
			'pushNotifications.lessonReminder.2' => 'Eine kurze Lektion hält deinen Rhythmus.',
			'pushNotifications.lessonReminder.3' => 'Die heutige Lektion ist noch offen — starten?',
			'pushNotifications.quizReminderTitle' => 'Lust auf ein kurzes Quiz?',
			'pushNotifications.quizReminderWords' => ({required Object count, required Object savedCount}) => 'Du hast kürzlich ${count} Wörter gelernt — Quiz? ${savedCount} gespeicherte Wörter warten.',
			'pushNotifications.quizReminderSaved' => ({required Object savedCount}) => '${savedCount} gespeicherte Wörter warten auf Wiederholung.',
			'pushNotifications.quizReminder.0' => 'Lange kein Quiz — 3 Minuten Wiederholung helfen.',
			'pushNotifications.quizReminder.1' => 'Deine gespeicherten Wörter vermissen dich.',
			'pushNotifications.quizReminder.2' => 'Teste dein Wissen — nur ein paar Minuten.',
			'pushNotifications.quizReminder.3' => 'Ein kurzes Quiz jetzt erleichtert morgen.',
			'pushNotifications.eveningLessonTitle' => 'Verpasse das heutige Training nicht',
			'pushNotifications.eveningLesson.0' => 'Heute noch nicht gelernt. Eine kurze Lektion hält die Gewohnheit.',
			'pushNotifications.eveningLesson.1' => 'Bevor der Tag endet — schnelle Lektion?',
			'pushNotifications.eveningLesson.2' => 'Noch Zeit für 5 Minuten Englisch heute.',
			'pushNotifications.eveningLesson.3' => 'Deine tägliche Lektion wartet.',
			'pushNotifications.streakReminderTitle' => 'Halte deine Serie',
			'pushNotifications.streakReminder' => ({required Object streak}) => '${streak} Tage Serie — eine kurze Lektion heute hält sie am Leben.',
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
