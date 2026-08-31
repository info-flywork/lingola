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
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$es app = _Translations$app$es._(_root);
	@override late final _Translations$common$es common = _Translations$common$es._(_root);
	@override late final _Translations$onboarding$es onboarding = _Translations$onboarding$es._(_root);
	@override late final _Translations$targetLanguage$es targetLanguage = _Translations$targetLanguage$es._(_root);
	@override late final _Translations$language$es language = _Translations$language$es._(_root);
	@override late final _Translations$setup$es setup = _Translations$setup$es._(_root);
	@override late final _Translations$accountCreating$es accountCreating = _Translations$accountCreating$es._(_root);
	@override late final _Translations$previewChat$es previewChat = _Translations$previewChat$es._(_root);
	@override late final _Translations$paywall$es paywall = _Translations$paywall$es._(_root);
	@override late final _Translations$auth$es auth = _Translations$auth$es._(_root);
	@override late final _Translations$nav$es nav = _Translations$nav$es._(_root);
	@override late final _Translations$home$es home = _Translations$home$es._(_root);
	@override late final _Translations$libraryPage$es libraryPage = _Translations$libraryPage$es._(_root);
	@override late final _Translations$wordPracticePage$es wordPracticePage = _Translations$wordPracticePage$es._(_root);
	@override late final _Translations$quizPage$es quizPage = _Translations$quizPage$es._(_root);
	@override late final _Translations$placeholder$es placeholder = _Translations$placeholder$es._(_root);
	@override late final _Translations$tutorPage$es tutorPage = _Translations$tutorPage$es._(_root);
	@override late final _Translations$lessonPage$es lessonPage = _Translations$lessonPage$es._(_root);
	@override late final _Translations$rolePlayPage$es rolePlayPage = _Translations$rolePlayPage$es._(_root);
	@override late final _Translations$notificationsPage$es notificationsPage = _Translations$notificationsPage$es._(_root);
	@override late final _Translations$profilePage$es profilePage = _Translations$profilePage$es._(_root);
	@override late final _Translations$pushNotifications$es pushNotifications = _Translations$pushNotifications$es._(_root);
	@override late final _Translations$apiErrors$es apiErrors = _Translations$apiErrors$es._(_root);
}

// Path: app
class _Translations$app$es implements Translations$app$en {
	_Translations$app$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Notificaciones';
	@override String get streak => 'Racha de aprendizaje';
	@override String get profile => 'Perfil';
}

// Path: common
class _Translations$common$es implements Translations$common$en {
	_Translations$common$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'CONTINUAR';
	@override String get back => 'VOLVER';
	@override String get locked => 'Bloqueado';
	@override String minutes({required Object value}) => '${value} min';
	@override String get close => 'Cerrar';
	@override String get getStarted => 'EMPEZAR';
	@override String get connectionError => 'Sin conexión. Revisa tu internet y vuelve a intentarlo.';
	@override String get genericError => 'Algo salió mal. Por favor, inténtalo de nuevo.';
	@override String get tryAgain => 'Inténtalo de nuevo';
}

// Path: onboarding
class _Translations$onboarding$es implements Translations$onboarding$en {
	_Translations$onboarding$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Página de incorporación ${current} de ${total}';
	@override late final _Translations$onboarding$slide1$es slide1 = _Translations$onboarding$slide1$es._(_root);
	@override late final _Translations$onboarding$slide2$es slide2 = _Translations$onboarding$slide2$es._(_root);
	@override late final _Translations$onboarding$slide3$es slide3 = _Translations$onboarding$slide3$es._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$es implements Translations$targetLanguage$en {
	_Translations$targetLanguage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selecciona el idioma que quieres aprender';
	@override String get comingSoon => 'Pronto llegarán más idiomas';
	@override String get korean => 'Coreano';
	@override String get portuguese => 'Portugués';
	@override String get portugueseBrazil => 'Portugués (Brasil)';
	@override String get german => 'Alemán';
	@override String get italian => 'Italiano';
	@override String get simplifiedChinese => 'Chino simplificado';
	@override String get arabic => 'Árabe';
	@override String get turkish => 'Turco';
	@override String get hindi => 'Hindi';
}

// Path: language
class _Translations$language$es implements Translations$language$en {
	_Translations$language$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Paso ${current} de ${total}';
	@override String get title => '¿Qué quieres hablar?';
	@override String get nativeSection => 'Hablo';
	@override String get nativeField => 'Idioma nativo';
	@override String get nativeName => 'Turco';
	@override String get targetSection => 'Quiero aprender';
	@override String get targetField => 'Idioma objetivo';
	@override String get targetName => 'Inglés';
	@override String get direction => 'Dirección del idioma';
	@override String get selectLanguage => 'Selecciona idioma';
	@override String get comingSoonBadge => 'Próximamente...';
	@override String get english => 'Inglés';
	@override String get french => 'Francés';
	@override String get japanese => 'Japonés';
	@override String get spanish => 'Español';
	@override String get russian => 'Ruso';
}

// Path: setup
class _Translations$setup$es implements Translations$setup$en {
	_Translations$setup$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => '¿Cuál es tu objetivo?';
	@override String get goalCareer => 'Desarrollo Profesional';
	@override String get goalTravel => 'Viajar';
	@override String get goalLiving => 'Vivir en el Extranjero';
	@override String get goalStudying => 'Estudiar en el Extranjero';
	@override String get goalOther => 'Otro';
	@override String get levelTitle => '¿Cuál es tu nivel de idioma actual?';
	@override String get levelBeginner => 'Principiante — Conozco algunas palabras';
	@override String get levelIntermediate => 'Intermedio — Puedo mantener conversaciones simples';
	@override String get levelAdvanced => 'Avanzado — Hablo pero quiero mejorar';
	@override String get paceTitle => '¿Qué tan rápido quieres mejorar?';
	@override String get paceLight => '5-10 min/día (ligero)';
	@override String get paceRecommended => '15-20 min/día (recomendado)';
	@override String get paceFast => '30+ min/día (resultados rápidos)';
}

// Path: accountCreating
class _Translations$accountCreating$es implements Translations$accountCreating$en {
	_Translations$accountCreating$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tu Cuenta Personal Está Siendo Creada';
	@override String get stepContent => 'Se está creando el contenido';
	@override String get stepDialogues => 'Se están preparando los diálogos';
	@override String get stepLessons => 'Se están optimizando las lecciones';
	@override String get stepPlan => 'Tu plan está siendo finalizado';
	@override String get optimization => 'Optimización';
	@override String progress({required Object value}) => '${value}%';
}

// Path: previewChat
class _Translations$previewChat$es implements Translations$previewChat$en {
	_Translations$previewChat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Lección 1: Saludos';
	@override String get speed => '1x';
	@override String get typeMessage => 'Escribe un mensaje...';
	@override String get incoming1 => '¡Hola! Bienvenido a Lingola — Soy tu tutor de IA. ¿Listo para intentar un rápido saludo en inglés?';
	@override String get outgoing1 => '¡Hola! Estoy listo para practicar.';
	@override String get incoming2Highlight => 'Buenos días';
	@override String get incoming2Rest => ', Emrah! Me alegra que te sientas listo. Un café por la mañana siempre es un gran comienzo para construir una conexión. ¿De qué te gustaría hablar?';
	@override String get holdToSpeak => 'Mantén para hablar';
	@override String get recording => 'Grabando… suelta para enviar';
	@override String get slideUpToLock => 'Desliza hacia arriba para bloquear';
	@override String get slideLeftToCancel => 'Desliza a la izquierda para cancelar';
	@override String get recordingLockedHint => 'Toca enviar cuando termines';
}

// Path: paywall
class _Translations$paywall$es implements Translations$paywall$en {
	_Translations$paywall$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Empieza a Hablar Hoy — Gratis';
	@override String get subtitle => 'Oportunidades de aprendizaje ilimitadas';
	@override String get noCommitment => 'Sin compromiso';
	@override String get cancelAnytime => 'Cancela en cualquier momento';
	@override String get noPaymentToday => 'Sin pago hoy';
	@override String get daysFree => '3 Días Gratis';
	@override String get thenPrice => 'Luego \$1.99/mes';
	@override String get trialActive => 'Prueba Gratuita Activa';
	@override String get payableToday => 'Pagadero Hoy';
	@override String get payableValue => '3 Días Gratis 0.00\$';
	@override String get paymentDate => 'Fecha de pago: 13 de marzo de 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$es implements Translations$auth$en {
	_Translations$auth$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Nuestros diversos entrenadores de IA';
	@override String get title => 'Empieza a Hablar un Nuevo Idioma, Hoy';
	@override String get body => 'Practica conversaciones reales con IA.\nSin presión. Sin juicios.';
	@override String get continueGoogle => 'Continuar con Google';
	@override String get continueApple => 'Continuar con Apple';
	@override String get continueGuest => 'Continuar como Invitado';
	@override String get legal => 'Al registrarte en Lingola, aceptas nuestros Términos de Servicio. Aprende cómo procesamos tus datos en nuestra Política de Privacidad y Política de Cookies';
	@override String get terms => 'Términos de Servicio';
	@override String get privacy => 'Política de Privacidad';
	@override String get cookies => 'Política de Cookies';
}

// Path: nav
class _Translations$nav$es implements Translations$nav$en {
	_Translations$nav$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get tutor => 'Tutor';
	@override String get lesson => 'Lección';
	@override String get rolePlay => 'Juego de Roles';
	@override String get profile => 'Perfil';
}

// Path: home
class _Translations$home$es implements Translations$home$en {
	_Translations$home$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Buenos Días, Jhon';
	@override String get todayPractice => 'Práctica de Hoy';
	@override String get continueConversation => 'Continuar Conversación';
	@override String continueWithTutor({required Object name}) => '¿Seguir con ${name} u otro tutor?';
	@override String continueSameTutor({required Object name}) => 'Continuar con ${name}';
	@override String get chooseOtherTutor => 'Elegir otro tutor';
	@override String minutesLeft({required Object value}) => '${value} min restantes';
	@override String get lessonProgress => 'Lección 2 — Saludos';
	@override String get timeCurrent => '0min';
	@override String get timeTotal => '/ 15min';
	@override String get kContinue => 'Continuar';
	@override String get learningPath => 'A1 - Principiante';
	@override String get allLessons => 'Todas las Lecciones';
	@override String get introductions => 'Introducciones I';
	@override String get greetings => 'Saludos';
	@override String get jobs => 'Trabajos';
	@override String get favoriteRoom => 'Una Habitación Favorita';
	@override String get dailyRoutine => 'Rutina Diaria';
	@override String get scroll => 'Desplazar';
	@override String get liveLesson => 'Lección en Vivo';
	@override String get liveLessonSubtitle => 'Haz una videollamada con nuestro tutor';
	@override String get moreTutor => 'Más Tutor';
	@override String get startTalkNow => 'Comienza a Hablar Ahora';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Adaptativo';
	@override String get tagCalm => 'Calmado';
	@override String get tagPatient => 'Paciente';
	@override String get tagMethodical => 'Metódico';
	@override String get tagEncouraging => 'Alentador';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Más Funciones';
	@override String get practiceLabel => 'PRÁCTICA';
	@override String get wordPractice => 'Práctica de Palabras';
	@override String get wordPracticeBody => 'Construye tu vocabulario en el idioma que elijas a diario';
	@override String get immersiveLabel => 'INMERSIVO';
	@override String get quiz => 'Cuestionario';
	@override String get quizBodyLine1 => 'Aprende a través de ejemplos reales';
	@override String get quizBodyLine2 => 'en contexto';
	@override String get getStarted => 'Comenzar';
	@override String get library => 'Biblioteca';
	@override String get libraryTitle => 'Aprende y Ahorra';
	@override String get learnMore => 'Aprender Más';
	@override late final _Translations$home$premium$es premium = _Translations$home$premium$es._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$es implements Translations$libraryPage$en {
	_Translations$libraryPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Biblioteca';
	@override String get searchWord => 'Buscar Palabra';
	@override String savedWordCount({required Object count}) => '${count} Palabra Guardada';
	@override String get savedWordTab => 'Palabra Guardada';
	@override String get dictionaryTab => 'Diccionario';
	@override String get dictionaryLabel => 'Diccionario';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$es implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Práctica de Palabras';
	@override String get turkish => 'TURCO';
	@override String get save => 'Guardar';
	@override String get saved => 'Guardado';
	@override String get listen => 'Escuchar';
	@override String get hint => 'Pista';
	@override String get previous => 'ANTERIOR';
	@override String get next => 'SIGUIENTE';
}

// Path: quizPage
class _Translations$quizPage$es implements Translations$quizPage$en {
	_Translations$quizPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cuestionario';
	@override String get headline => '¿Qué quieres mejorar hoy?';
	@override String get subtitle => 'Elige tu entrenamiento — toma menos de 3 minutos 🚀';
	@override String get readingTitle => 'Lectura';
	@override String get readingBody => 'Comprensión a través de artículos e historias';
	@override String get writingTitle => 'Escritura';
	@override String get writingBody => 'Ejercicios de gramática y vocabulario';
	@override String get speakingTitle => 'Habla';
	@override String get speakingBody => 'Pronunciación a través del motor de voz AI';
	@override String get readingTestTitle => 'Prueba de Lectura';
	@override String get read => 'Leer';
	@override String get listeningHint => 'Di la palabra en inglés claramente...';
	@override String get micPermissionDenied => 'El micrófono o el reconocimiento de voz no están disponibles.';
	@override String get matchSuccess => '¡Genial! Eso coincide con la palabra.';
	@override String matchFail({required Object heard}) => 'Escuché "${heard}". Intenta de nuevo.';
	@override String get successfulTitle => '¡Éxito!';
	@override String get successfulBody => '¡Pronunciación como un hablante nativo!';
	@override String get failedTitle => 'Fallido';
	@override String get failedBody => 'Casi lo lograste, dale una oportunidad más';
	@override String get tryAgain => 'INTENTA DE NUEVO';
	@override String get writingTestTitle => 'Prueba de Escritura';
	@override String get sourceLanguage => 'IDIOMA DE ORIGEN';
	@override String get answer => 'RESPUESTA';
	@override String get writeAnswerHint => 'Escribe tu respuesta aquí...';
	@override String get submit => 'Enviar';
	@override String get speakingTestTitle => 'Prueba de Habla';
	@override String get speakingProficiency => 'Dominio del Habla';
	@override String get speakClearlyHint => 'Habla claramente en tu micrófono:';
	@override String get speakUp => 'Habla Más Alto';
	@override String get recording => 'Grabando...';
	@override String questionOf({required Object current, required Object total}) => 'PREGUNTA ${current} DE ${total}';
}

// Path: placeholder
class _Translations$placeholder$es implements Translations$placeholder$en {
	_Translations$placeholder$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} está en camino';
	@override String body({required Object tab}) => 'Estamos preparando una experiencia enfocada en ${tab} para ti.';
}

// Path: tutorPage
class _Translations$tutorPage$es implements Translations$tutorPage$en {
	_Translations$tutorPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tutor';
	@override String get chatWithLingola => 'Chatea con Lingola';
	@override String chatWithTutor({required Object name}) => 'Chatea con ${name}';
	@override String get chatHistory => 'Historial de Chat';
	@override String get history => 'Historia';
	@override String get filter => 'Filtrar';
	@override String get country => 'País';
	@override String get focus => 'Enfoque';
	@override String get moreCountries => '8+ más';
	@override String get moreFocus => '+8';
	@override String get save => 'GUARDAR';
	@override String get clearFilter => 'Quitar filtros';
	@override String get startTalkNow => 'Comienza a hablar ahora';
	@override String get typeMessage => 'Escribe un mensaje...';
	@override String get speaker => 'Hablante';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$es tutors = _Translations$tutorPage$tutors$es._(_root);
	@override late final _Translations$tutorPage$tags$es tags = _Translations$tutorPage$tags$es._(_root);
	@override String get historyPreview1 => '¡Hola! Estaba a punto de explotar de aburrimiento...';
	@override String get historyPreview2 => '¿Practicamos pedir comida hoy?';
	@override String get time1 => '11:00 AM';
	@override String get time2 => 'Ayer';
	@override late final _Translations$tutorPage$chat$es chat = _Translations$tutorPage$chat$es._(_root);
	@override late final _Translations$tutorPage$calling$es calling = _Translations$tutorPage$calling$es._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$es implements Translations$lessonPage$en {
	_Translations$lessonPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Continúa aprendiendo';
	@override String get profile => 'Perfil';
	@override String get language => 'Idioma objetivo';
	@override String get completed => 'Completado';
	@override String get locked => 'Bloqueado';
	@override String get pickTutorTitle => 'Elige tu tutor';
	@override String get startTalk => 'Iniciar lección';
	@override String get chatInstead => 'Chatear en su lugar';
	@override String get lockedHint => 'Termina la lección anterior para desbloquear esta.';
	@override String get levelLockedTitle => 'Nivel bloqueado';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Tu nivel de inglés es ${userLevel}, por eso no puedes abrir lecciones de ${lessonLevel} sin completar el camino anterior.';
	@override String get levelLockedOk => 'Entendido';
	@override String get notesTitle => 'Notas de la lección';
	@override String get whatWeLearned => 'Lo que aprendimos hoy';
	@override String get deleteNotes => 'Eliminar mis notas de la lección';
	@override String get deleteNotesConfirm => '¿Eliminar estas notas? Esto no se puede deshacer.';
	@override String get delete => 'Eliminar';
	@override String get cancel => 'Cancelar';
	@override String get practiceCta => 'Si esto te pareció muy difícil, puedes practicar el mismo tema de nuevo.';
	@override String get practiceNow => 'Practica este tema';
	@override String get openChat => 'Abrir chat con el tutor';
	@override String get yourScore => 'Tu puntuación';
	@override String bestScore({required Object score}) => 'Mejor ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Participante pasivo';
	@override String get participationSilentBody => 'Te quedaste callado esta vez. Creo que deberías volver a tomar esta lección.';
	@override String get participationPassive => 'Baja participación';
	@override String get participationPassiveBody => 'Apenas hablaste. Intenta la lección de nuevo y di más.';
	@override String get participationActive => 'Buena participación';
	@override String get participationActiveBody => 'Te uniste a la conversación. ¡Sigue así!';
	@override String get participationStrong => 'Fuerte participación';
	@override String get participationStrongBody => 'Hablaste mucho. ¡Gran trabajo!';
	@override String get retakeLesson => 'Repetir esta lección';
	@override String get finishLesson => 'Terminar lección';
	@override String get savingNotes => 'Tu tutor está escribiendo las notas de hoy...';
	@override String get noNotes => 'Termina esta lección para obtener notas de tu tutor.';
	@override String get notesDeleted => 'Notas de la lección eliminadas';
	@override late final _Translations$lessonPage$levels$es levels = _Translations$lessonPage$levels$es._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$es implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Juego de Roles';
	@override String get subtitle => 'Elige tu rol — vive un escenario de la vida real 🎭';
	@override String progressCompleted({required Object value}) => '%${value} completado';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get beginner => 'Principiante';
	@override String get screenplay => 'GUION';
	@override String get dailyInteractions => 'Interacciones Diarias';
	@override String get business => 'Negocios';
	@override late final _Translations$rolePlayPage$coffee$es coffee = _Translations$rolePlayPage$coffee$es._(_root);
	@override late final _Translations$rolePlayPage$directions$es directions = _Translations$rolePlayPage$directions$es._(_root);
	@override late final _Translations$rolePlayPage$interview$es interview = _Translations$rolePlayPage$interview$es._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$es implements Translations$notificationsPage$en {
	_Translations$notificationsPage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notificaciones';
	@override String get deleteConfirmTitle => '¿Estás seguro?';
	@override String get deleteConfirmBody => 'Esta notificación se eliminará.';
	@override String get delete => 'Eliminar';
	@override String get cancel => 'Cancelar';
	@override late final _Translations$notificationsPage$translation$es translation = _Translations$notificationsPage$translation$es._(_root);
	@override late final _Translations$notificationsPage$offer$es offer = _Translations$notificationsPage$offer$es._(_root);
	@override late final _Translations$notificationsPage$stories$es stories = _Translations$notificationsPage$stories$es._(_root);
	@override late final _Translations$notificationsPage$practice$es practice = _Translations$notificationsPage$practice$es._(_root);
	@override late final _Translations$notificationsPage$streak$es streak = _Translations$notificationsPage$streak$es._(_root);
	@override late final _Translations$notificationsPage$premium$es premium = _Translations$notificationsPage$premium$es._(_root);
	@override String get emptyTitle => 'Aún no hay notificaciones';
	@override String get emptySubtitle => 'No olvides volver a revisar cuando recibas una notificación.';
}

// Path: profilePage
class _Translations$profilePage$es implements Translations$profilePage$en {
	_Translations$profilePage$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Versión Gratuita';
	@override String get dayStreak => '¡Racha de Días!';
	@override String get accountSettings => 'Configuración de la Cuenta';
	@override String get general => 'General';
	@override String get profileSettings => 'Configuración del Perfil';
	@override String get fullName => 'Nombre Completo';
	@override String get email => 'Correo Electrónico';
	@override String get deleteAccount => 'Eliminar Cuenta';
	@override String get save => 'GUARDAR';
	@override String get deleteTitle => 'No queremos que te vayas, pero te entendemos.';
	@override String get deleteBody => '¿Podrías decirnos por qué quieres irte para mejorar la experiencia de Lingola?';
	@override late final _Translations$profilePage$deleteReasons$es deleteReasons = _Translations$profilePage$deleteReasons$es._(_root);
	@override String get messageOptional => 'Mensaje (opcional)';
	@override String get messageHint => 'Si tienes un mensaje, por favor escríbelo.';
	@override String get next => 'SIGUIENTE';
	@override String get specialOfferTitle => 'Oferta Especial';
	@override String get specialOfferBody => 'Echa un vistazo a la oferta que hemos preparado para ti antes de irte.';
	@override String get monthlyPlanTitle => 'Cambia al Plan de 1 Mes';
	@override String get monthlyPlanPrice => '\$79/mes, cancela en cualquier momento';
	@override String get monthlyPlanDesc => 'Sin compromiso a largo plazo. Mantente conectado con nuestra comunidad mes a mes.';
	@override String get whatYoullKeep => 'Lo que conservarás:';
	@override String get keepCharacters => 'Acceso a todos los personajes';
	@override String get keepVideo => 'Videollamadas ilimitadas';
	@override String get keepCourses => 'Acceso a todos los cursos';
	@override String get switchMonthlyCta => 'Cambiar a Plan Mensual';
	@override String get confirmTitle => '¿Estás seguro?';
	@override String get confirmBody => 'Realmente no queremos que te vayas. Aquí está lo que perderás:';
	@override String get loseCharacters => 'Acceso ilimitado a personajes';
	@override String get loseVideo => 'Acceso ilimitado a videollamadas';
	@override String get loseCourses => 'Acceso a todos los cursos';
	@override String get discountTitle => 'Quédate y obtén un 60% de descuento por 1 mes';
	@override String get discountSubtitle => 'Nuestra mejor oferta de todas. Solo \$27.60/mes';
	@override String get acceptDiscountCta => 'Aceptar 60% de Descuento y Quedarse';
	@override String get farewellTitle => 'Nos entristece verte ir';
	@override String farewellBody({required Object date}) => 'Tu membresía ha sido cancelada. Tendrás acceso hasta el final de tu período de facturación actual el ${date}.';
	@override String get changeMindTitle => '✨ ¿Cambias de opinión?';
	@override String changeMindBody({required Object date}) => 'Puedes reactivar tu membresía en cualquier momento antes del ${date} para mantener tus beneficios.';
	@override String get reactivateCta => 'Espera, quiero reactivar';
	@override String get done => 'HECHO';
	@override String get notifications => 'Notificaciones';
	@override String get appLanguage => 'Idioma de la App';
	@override String get selectLanguageTitle => 'Seleccionar Idioma';
	@override String get premium => 'Premium';
	@override String get passive => 'Pasivo';
	@override String get active => 'Activo';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Compartir con un Amigo';
	@override String get shareWithFriendTitle => 'Compartir con un Amigo';
	@override String get shareInviteBody => 'Invita a tus amigos y disfruta traduciendo juntos';
	@override String get rateUs => 'Evalúanos';
	@override String get faq => 'Preguntas Frecuentes de Lingola';
	@override late final _Translations$profilePage$faqItems$es faqItems = _Translations$profilePage$faqItems$es._(_root);
	@override String get support => 'Soporte';
	@override String get feedback => 'Comentarios';
	@override String get progression => 'Progreso';
	@override String get progressTitle => 'Progreso';
	@override String get goodMorning => 'Buenos Días,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'Inglés';
	@override String get past7Days => 'Últimos 7 Días';
	@override String get past7DaysBody => 'Estudia todos los días para construir tu racha y crear un poderoso hábito de aprendizaje.';
	@override String get currentLevel => 'Nivel Actual';
	@override String xpLeft({required Object xp, required Object level}) => '¡Solo te quedan ${xp} XP para alcanzar el nivel ${level}!';
	@override String get toNextLevel => 'AL SIGUIENTE NIVEL';
	@override String get dayStreakLabel => 'Racha de Días';
	@override String get totalPoints => 'Puntos Totales';
	@override String get savedWords => 'Palabras Guardadas';
	@override String itemsToReview({required Object count}) => '${count} elementos para revisar';
	@override String get logout => 'Cerrar Sesión';
	@override String get logoutTitle => 'Estás a punto de cerrar sesión';
	@override String get logoutBody => '¡Hasta pronto! Vamos a extrañar tus ejercicios de respiración.';
	@override String get logoutConfirm => 'CERRAR SESIÓN';
	@override String get logoutCancel => 'CANCELAR';
	@override late final _Translations$profilePage$days$es days = _Translations$profilePage$days$es._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Tu certificado';
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
	@override String get certificateVerifyHint => 'Cualquiera puede escanear el código QR para verificar tu logro.';
	@override String get certificateShare => 'Compartir certificado';
	@override String get certificateShareQr => 'Compartir código QR';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Cuando completes un nivel CEFR en Lingola, tu certificado aparecerá aquí — con tu nombre, nivel y un código QR para verificar.';
	@override String get certificatePreviewHint => 'Completa una ruta de nivel para desbloquear tu certificado';
	@override String get certificateTapToView => 'Toca para ver y compartir tu certificado';
}

// Path: pushNotifications
class _Translations$pushNotifications$es implements Translations$pushNotifications$en {
	_Translations$pushNotifications$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Parece que tomaste un pequeño descanso.',
		'¿Tienes un momento para una palabra?',
		'Estamos aquí — sin prisa.',
		'Tu ritmo de aprendizaje se detuvo un poco.',
		'Una mini revisión podría sentirse bien.',
	];
	@override List<String> get h4 => [
		'Una nueva palabra podría estar esperándote hoy 👀',
		'Podrías disfrutar de una práctica rápida.',
		'Quizás te perdiste una frase útil.',
		'El progreso de hoy sigue abierto.',
		'Una palabra, una frase… tal vez ambas.',
	];
	@override List<String> get h8 => [
		'No es necesario progresar todos los días.',
		'Incluso una pequeña revisión cuenta.',
		'No perdiste nada por no estudiar hoy.',
		'Estamos listos cuando tú lo estés.',
		'Aprender un idioma es un maratón, no una carrera.',
	];
	@override List<String> get h24 => [
		'Pasó un día. Tus palabras siguen aquí.',
		'Tomar un descanso es normal.',
		'Tu lugar está justo donde lo dejaste.',
		'Continúa cuando quieras.',
		'El idioma no se irá — nosotros tampoco.',
	];
	@override String get lessonReminderTitle => 'La lección de hoy te espera';
	@override List<String> get lessonReminder => [
		'Aún no entraste a la lección de hoy — 5 minutos cuentan.',
		'Tu tutor está listo. Continúa donde lo dejaste.',
		'Una lección corta mantiene tu ritmo.',
		'La lección de hoy sigue abierta — ¿empezamos?',
	];
	@override String get quizReminderTitle => '¿Listo para un quiz rápido?';
	@override String quizReminderWords({required Object count, required Object savedCount}) => 'Aprendiste ${count} palabras recientemente — ¿un quiz? ${savedCount} palabras guardadas te esperan.';
	@override String quizReminderSaved({required Object savedCount}) => '${savedCount} palabras guardadas esperan repaso.';
	@override List<String> get quizReminder => [
		'Hace tiempo sin quiz — 3 minutos de repaso ayudan.',
		'Tus palabras guardadas te extrañan.',
		'Pon a prueba lo que recuerdas.',
		'Un quiz corto ahora facilita mañana.',
	];
	@override String get eveningLessonTitle => 'No pierdas la práctica de hoy';
	@override List<String> get eveningLesson => [
		'Aún no estudiaste hoy. Una lección corta mantiene el hábito.',
		'Antes de que termine el día — ¿una lección rápida?',
		'Aún hay tiempo para 5 minutos de inglés.',
		'Tu lección diaria te espera.',
	];
	@override String get streakReminderTitle => 'Mantén tu racha';
	@override String streakReminder({required Object streak}) => 'Llevas ${streak} días de racha — una lección corta hoy la mantiene viva.';
}

// Path: apiErrors
class _Translations$apiErrors$es implements Translations$apiErrors$en {
	_Translations$apiErrors$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$es implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Habla con confianza en semanas — No en meses';
	@override String get body => 'Practica conversaciones reales con IA. Mejora tu acento, confianza y fluidez, a diario.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'No podía hablar inglés antes. Ahora hablo a diario en el trabajo.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$es implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un tutor privado sin el precio';
	@override String get body => 'Conversaciones reales. Retroalimentación instantánea.\nSin programación. Sin presión.';
	@override String get realTutor => 'Tutor Real';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / hr';
	@override String get priceLingola => '\$9.99 / yr';
	@override String get versus => 'VS';
	@override String get scheduled => 'Programado';
	@override String get anytime => 'En cualquier momento';
	@override String get stressful => 'Estresante';
	@override String get noPressure => 'Sin presión';
	@override String get price => 'Precio';
	@override String get availability => 'Disponibilidad';
	@override String get feeling => 'Sentimiento';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$es implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Un plan de aprendizaje construido para ti';
	@override String get body => 'Tus metas, tu ritmo, tu nivel.\nDesde principiante hasta fluido — paso a paso.';
	@override String get goal => 'Meta';
	@override String get practice => 'Práctica';
	@override String get progress => 'Progreso';
}

// Path: home.premium
class _Translations$home$premium$es implements Translations$home$premium$en {
	_Translations$home$premium$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'El camino hacia ';
	@override String get titleHighlight => 'hablar con fluidez';
	@override String get titleAfter => ' sin miedo a cometer errores.';
	@override String get descriptionBefore => 'Únete a millones de estudiantes en todo el mundo. Comienza a romper la barrera del idioma hoy — ';
	@override String get descriptionHighlight => 'los primeros 3 días completamente gratis.';
	@override String get feature1 => 'Tutor de IA accesible 24/7';
	@override String get feature2 => 'Acceso ilimitado a Tutores Privados';
	@override String get feature3 => 'Plan de lecciones diario adaptado para ti';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/mes';
	@override String get discount => '40% de descuento con compra anual';
	@override String get cta => 'Comenzar';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$es implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
	@override String get santa => 'Santa Claus';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$es implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Adaptativo';
	@override String get calm => 'Calmo';
	@override String get patient => 'Paciente';
	@override String get organized => 'Organizado';
	@override String get relaxed => 'Relajado';
	@override String get methodical => 'Metódico';
	@override String get attentive => 'Atento';
	@override String get more => '+5';
	@override String get curious => 'Curioso';
	@override String get observer => 'Observador';
	@override String get ancientKnowledge => 'Conocimiento Antiguo';
	@override String get wise => 'Sabio';
	@override String get clear => 'Claro';
	@override String get decisive => 'Decisivo';
	@override String get disciplined => 'Disciplinado';
	@override String get smart => 'Inteligente';
	@override String get analytic => 'Analítico';
	@override String get cheerful => 'Alegre';
	@override String get generous => 'Generoso';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$es implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => '¡Buenos días! Me alegra que te sientas listo para practicar hoy.';
	@override String get outgoing1 => 'Sí, empecemos con los saludos.';
	@override String get incoming2 => 'Perfecto. ¿Cómo saludarías a un colega?';
	@override String get typing => 'Escribiendo';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$es implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Lección 1 : Saludos';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Lección ${number} : ${title}';
	@override String get nativeLine => '¿Sıkıldın mı?';
	@override String get englishLine => '¿Aburrido? Eliminé esa palabra de mi vocabulario. Levántate, el plan ya está hecho: vamos a ese nuevo bar de arcade en Kadıköy.';
	@override String get highlight => '¿Aburrido?';
	@override String get close => 'Finalizar llamada';
	@override String get toggleCaptions => 'Alternar subtítulos';
	@override String get toggleHints => 'Alternar pistas';
	@override String get toggleMic => 'Alternar micrófono';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$es implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$es a1 = _Translations$lessonPage$levels$a1$es._(_root);
	@override late final _Translations$lessonPage$levels$a2$es a2 = _Translations$lessonPage$levels$a2$es._(_root);
	@override late final _Translations$lessonPage$levels$b1$es b1 = _Translations$lessonPage$levels$b1$es._(_root);
	@override late final _Translations$lessonPage$levels$b2$es b2 = _Translations$lessonPage$levels$b2$es._(_root);
	@override late final _Translations$lessonPage$levels$c1$es c1 = _Translations$lessonPage$levels$c1$es._(_root);
	@override late final _Translations$lessonPage$levels$c2$es c2 = _Translations$lessonPage$levels$c2$es._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$es implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pidiendo en la Cafetería';
	@override String get screenplay => 'Pide tu bebida favorita, pregunta sobre tamaños y extras, confirma tu total y recoge tu café en el mostrador.';
	@override late final _Translations$rolePlayPage$coffee$chat$es chat = _Translations$rolePlayPage$coffee$chat$es._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$es implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pidiendo Direcciones en la Calle';
	@override String get screenplay => 'Pregunta por direcciones a un lugar, averigua cómo llegar al metro o autobús, obtén información sobre boletos y escucha recomendaciones de restaurantes.';
	@override late final _Translations$rolePlayPage$directions$chat$es chat = _Translations$rolePlayPage$directions$chat$es._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$es implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrevista de Trabajo';
	@override String get screenplay => 'Preséntate, responde preguntas comunes de entrevistas, habla sobre tu experiencia y pregunta sobre el rol y los siguientes pasos.';
	@override late final _Translations$rolePlayPage$interview$chat$es chat = _Translations$rolePlayPage$interview$chat$es._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$es implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nueva Traducción Listo';
	@override String get body => 'Tu archivo de traducción de audio ha sido convertido a texto y traducido con éxito.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$es implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Te Espera una Oferta Especial';
	@override String get body => 'Actualiza a Premium para traducciones de fotos ilimitadas con un 50% de descuento.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$es implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Descubre Nuevas Historias';
	@override String get body => 'Aprende nuevas palabras a través de historias';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$es implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$es implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$es implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$es implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'No encontré los personajes de inteligencia artificial realistas.';
	@override String get videoIssues => 'Tengo problemas técnicos en las videollamadas.';
	@override String get pricing => 'Los precios de suscripción están por encima de mis expectativas.';
	@override String get noMatch => 'No encontré personajes en el estilo que buscaba.';
	@override String get shortTrial => 'Solo quería probarlo por un corto período.';
	@override String get other => 'Otro';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$es implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$es supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$es._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$es howAiWorks = _Translations$profilePage$faqItems$howAiWorks$es._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$es offlineUse = _Translations$profilePage$faqItems$offlineUse$es._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$es isFree = _Translations$profilePage$faqItems$isFree$es._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$es pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$es._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$es dailyPractice = _Translations$profilePage$faqItems$dailyPractice$es._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$es levelDetermination = _Translations$profilePage$faqItems$levelDetermination$es._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$es realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$es._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$es dataSecurity = _Translations$profilePage$faqItems$dataSecurity$es._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$es disableReminders = _Translations$profilePage$faqItems$disableReminders$es._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$es implements Translations$profilePage$days$en {
	_Translations$profilePage$days$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get mon => 'LUN';
	@override String get tue => 'MAR';
	@override String get wed => 'MIÉ';
	@override String get thu => 'JUE';
	@override String get fri => 'VIE';
	@override String get sat => 'SÁB';
	@override String get sun => 'DOM';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$es implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Principiante';
	@override List<String> get lessons => [
		'Saludos',
		'Presentaciones I',
		'Trabajos',
		'Una habitación favorita',
		'Rutina diaria',
		'Frutas',
		'Consejos 1',
		'Familia 1',
		'Cosas cotidianas',
		'Ciudad natal',
		'Casa',
		'Preferencias alimenticias',
		'Pasatiempos 1',
		'Personas exitosas',
		'Comida y bebidas',
		'Pidiendo en un restaurante',
		'Mascotas',
		'Salud y bienestar',
		'Clima',
		'Nuevo estilo de vida',
		'Mejorando',
		'Pasatiempos 2',
		'Preguntas sobre lugares',
		'Posesión',
		'Compras 1',
		'Diciendo la hora',
		'Direcciones 1',
		'Compras 2',
		'Conociéndote',
		'Lugares de objetos',
		'Apariencias',
		'Direcciones 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$es implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Básico';
	@override List<String> get lessons => [
		'Familia 2',
		'Personas y lugares',
		'Familia 3',
		'Describiendo objetos',
		'Ciudad',
		'El proyecto de construcción',
		'Hogar dulce hogar',
		'¿Qué hora es?',
		'Rutina diaria 2',
		'Tiempo libre',
		'Comida y nutrición',
		'Compras y consumo',
		'Vacaciones',
		'Planes de fin de semana',
		'Formal o informal',
		'Moda',
		'Compras 3',
		'Consejos 2',
		'Tú puedes hacerlo',
		'Compras 4',
		'Charlas triviales',
		'Un latte, por favor',
		'Comida',
		'Desplazándose',
		'Listo para un viaje',
		'Viaje 1',
		'Escapadas urbanas',
		'Viaje 2',
		'Un lugar para quedarse',
		'Tan emocionante',
		'La persona adecuada',
		'Escuela',
		'Preferencias musicales',
		'Deportes',
		'Reglas de la carrera',
		'Deja un mensaje',
		'Solicitudes',
		'Invitaciones',
		'Experiencias de viaje',
		'Pasado 1',
		'Pasado 2',
		'Pasado 3',
		'Preguntas sobre el pasado',
		'Nunca eres demasiado viejo',
		'Recuerdos de la infancia',
		'Cumplidos',
		'Excusas',
		'¡Es tan molesto!',
		'Un mundo digital',
		'Vida laboral',
		'No entendí eso',
		'¿Ahorrar o gastar?',
		'Decir perdón',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$es implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Intermedio';
	@override List<String> get lessons => [
		'Tradiciones culturales',
		'Celebridades',
		'Arte y creatividad',
		'Planes futuros',
		'Planificación de eventos',
		'Metas y planes',
		'Eventos históricos',
		'Tecnología',
		'Nunca jamás',
		'Qué hay en',
		'Vacaciones soñadas',
		'Redes sociales',
		'Recomendaciones de libros',
		'Uno de esos días',
		'Fotos especiales',
		'Logros personales',
		'Películas favoritas',
		'Últimas noticias',
		'Felicidad',
		'Una semana ocupada',
		'Donde crecí',
		'Días de escuela',
		'Perfiles',
		'Mapas de vida',
		'Cotidiano',
		'Qué sigue',
		'Haciendo sugerencias',
		'Qué pasó',
		'Recuerdos',
		'Choque cultural',
		'Frases de interés',
		'Entrevistas de trabajo',
		'Listas de deseos',
		'Mi tipo de ciudad',
		'La generación de internet',
		'Marcas populares',
		'Frases de opinión',
		'Cómo se ve',
		'Espacio vital',
		'Comer bien',
		'Hobbies inusuales',
		'Una elección difícil',
		'Tomar acción',
		'Nuevas habilidades',
		'Haciendo una queja',
		'Educación',
		'Ciudades verdes',
		'Qué hay en un trabajo',
		'Desafíos personales',
		'Frases de entrevista',
		'Finales educados',
		'Noticias de última hora',
		'Pequeños cambios',
		'Disculpas y excusas',
		'Etiqueta telefónica',
		'Perdón por interrumpir…',
		'Respuestas a quejas',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$es implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Intermedio Alto';
	@override List<String> get lessons => [
		'Personalidades',
		'Grandes líderes',
		'Estilo de vida saludable',
		'¿Cuál es la verdad?',
		'Crecimiento personal',
		'Expresarse',
		'¿Actuando?',
		'Recuerdo...',
		'Retroalimentación social',
		'Escena del crimen',
		'Problemas educados',
		'Resolución de conflictos',
		'¿Te encanta o lo odias?',
		'Problemas ambientales',
		'Podemos resolverlo',
		'Misterios y crímenes',
		'Futuros posibles',
		'Planes de negocio',
		'Decisiones en reuniones',
		'Es tan predecible...',
		'En el trabajo',
		'Ciencia y tecnología',
		'Gestión del tiempo',
		'Derechos humanos',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$es implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Avanzado';
	@override List<String> get lessons => [
		'Normas culturales',
		'Influencia de las redes sociales',
		'Elecciones profesionales',
		'Acelerar el rendimiento',
		'Invenciones',
		'Viaje en el tiempo',
		'Pertenencias',
		'Habilidades laborales',
		'Cambios históricos',
		'Escritura de reseñas',
		'Misterios',
		'Teorías extrañas',
		'Celebridades',
		'Política global',
		'Boom de productos',
		'¿Seré feliz?',
		'Quizás más tarde...',
		'Nuevas soluciones',
		'Influencia contextual',
		'Un logo perdido',
		'Actos amables',
		'Qué película',
		'Qué molesto',
		'En las noticias',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$es implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Experto';
	@override List<String> get lessons => [
		'Globalización',
		'Desastres naturales',
		'Reaccionando a la información',
		'Equilibrio entre trabajo y vida',
		'Trabajo remoto',
		'Problemas familiares',
		'Anatomía humana básica',
		'Predicciones de salud',
		'Acceso a la atención médica',
		'Experiencia de viaje global',
		'Superpoderes',
		'Construcción de equipos',
		'Biofluorescencia',
		'Dilemas',
		'Entusiasmo social',
		'Cambios',
		'Trabajo, trabajo, trabajo',
		'Problemas locales',
		'Problemas, problemas',
		'¿Hecho o ficción?',
		'Turismo',
		'Voluntariado',
		'El ojo de la mente',
		'Consumo de medios',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$es implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get briefing => '¡Hola! Hoy practicaremos pedir en una cafetería — saludos, tamaños, extras. Primero explicaré un poco, luego lo representaremos. ¿Te parece bien?';
	@override String get incoming1 => '¡Bienvenido! ¿Qué puedo empezar a preparar para ti hoy?';
	@override String get outgoing1 => '¡Hola! Quisiera un latte mediano, por favor.';
	@override String get incoming2Highlight => 'Claro';
	@override String get incoming2Rest => '! ¿Te gustaría caliente o helado, y algún extra?';
	@override String get botReply => 'Buena elección. ¿Algo más con tu pedido?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$es implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get briefing => '¡Hola! Hoy practicaremos pedir direcciones en la calle. Primero explicaré un poco, luego lo representaremos. ¿Te parece bien?';
	@override String get incoming1 => '¡Hola! Te ves un poco perdido — ¿necesitas ayuda para encontrar algo?';
	@override String get outgoing1 => 'Sí, estoy buscando la estación de metro más cercana.';
	@override String get incoming2Highlight => 'Por supuesto';
	@override String get incoming2Rest => '! Camina dos cuadras en esa dirección, luego gira a la izquierda. Verás la entrada.';
	@override String get botReply => '¡De nada! ¿Quieres un consejo de restaurante cerca de la estación también?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$es implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get briefing => '¡Hola! Hoy practicaremos una entrevista de trabajo. Primero explicaré un poco, luego lo representaremos — yo te entrevistaré, luego cambiamos. ¿Te parece bien?';
	@override String get incoming1 => 'Gracias por venir hoy. ¿Podrías presentarte brevemente?';
	@override String get outgoing1 => 'Por supuesto. Estoy emocionado de estar aquí y compartir mi experiencia.';
	@override String get incoming2Highlight => 'Maravilloso';
	@override String get incoming2Rest => '. Cuéntame sobre un proyecto reciente del que estés orgulloso.';
	@override String get botReply => 'Eso es impresionante. ¿Qué preguntas tienes sobre el rol?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$es implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Qué idiomas soporta la app?';
	@override String get answer => 'La interfaz de Lingola está disponible en inglés, alemán, italiano, francés, turco, japonés, español, ruso, hindi, portugués y chino simplificado.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$es implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Cómo funciona la IA?';
	@override String get answer => 'La IA interactúa contigo como un tutor real. Analiza tus conversaciones, detecta errores y ofrece retroalimentación personalizada basada en tu progreso.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$es implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Puedo usar la app sin conexión?';
	@override String get answer => 'Sí. Puedes descargar ciertas lecciones y escenarios de conversación por adelantado y usarlos sin conexión. Sin embargo, el chat en vivo requiere conexión a internet.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$es implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Es la app gratuita?';
	@override String get answer => 'La versión básica es gratuita. Con Premium, obtienes escenarios de chat avanzados, análisis de pronunciación y modo de tutor personal.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$es implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Cómo se evalúa mi pronunciación?';
	@override String get answer => 'La app analiza tu voz y utiliza reconocimiento de voz impulsado por IA para puntuar tu acento y pronunciación. Las palabras que necesitas mejorar están resaltadas.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$es implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Necesito practicar a diario?';
	@override String get answer => 'Sí. El sistema rastrea tu progreso cada día. Solo 10-15 minutos de práctica de conversación al día pueden acelerar notablemente tu aprendizaje de idiomas.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$es implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Cómo se determina mi nivel de aprendizaje?';
	@override String get answer => 'Una breve evaluación de nivel cuando inicias sesión analiza tu conocimiento actual. Después de eso, la IA recomienda automáticamente lecciones adecuadas a tu nivel.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$es implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Puedo hablar con personas reales?';
	@override String get answer => 'Sí. Los usuarios Premium pueden programar sesiones cortas de práctica con tutores reales.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$es implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Está segura mi información?';
	@override String get answer => 'Absolutamente. Todas las conversaciones y datos de usuario se almacenan encriptados. Tu información personal nunca se comparte con terceros.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$es implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question => '¿Cómo desactivo los recordatorios diarios?';
	@override String get answer => 'Ve a la configuración del perfil, abre Notificaciones y cambia la frecuencia de los recordatorios o desactiva las notificaciones por completo.';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Notificaciones',
			'app.streak' => 'Racha de aprendizaje',
			'app.profile' => 'Perfil',
			'common.continueLabel' => 'CONTINUAR',
			'common.back' => 'VOLVER',
			'common.locked' => 'Bloqueado',
			'common.minutes' => ({required Object value}) => '${value} min',
			'common.close' => 'Cerrar',
			'common.getStarted' => 'EMPEZAR',
			'common.connectionError' => 'Sin conexión. Revisa tu internet y vuelve a intentarlo.',
			'common.genericError' => 'Algo salió mal. Por favor, inténtalo de nuevo.',
			'common.tryAgain' => 'Inténtalo de nuevo',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Página de incorporación ${current} de ${total}',
			'onboarding.slide1.title' => 'Habla con confianza en semanas — No en meses',
			'onboarding.slide1.body' => 'Practica conversaciones reales con IA. Mejora tu acento, confianza y fluidez, a diario.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'No podía hablar inglés antes. Ahora hablo a diario en el trabajo.',
			'onboarding.slide2.title' => 'Un tutor privado sin el precio',
			'onboarding.slide2.body' => 'Conversaciones reales. Retroalimentación instantánea.\nSin programación. Sin presión.',
			'onboarding.slide2.realTutor' => 'Tutor Real',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / hr',
			'onboarding.slide2.priceLingola' => '\$9.99 / yr',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Programado',
			'onboarding.slide2.anytime' => 'En cualquier momento',
			'onboarding.slide2.stressful' => 'Estresante',
			'onboarding.slide2.noPressure' => 'Sin presión',
			'onboarding.slide2.price' => 'Precio',
			'onboarding.slide2.availability' => 'Disponibilidad',
			'onboarding.slide2.feeling' => 'Sentimiento',
			'onboarding.slide3.title' => 'Un plan de aprendizaje construido para ti',
			'onboarding.slide3.body' => 'Tus metas, tu ritmo, tu nivel.\nDesde principiante hasta fluido — paso a paso.',
			'onboarding.slide3.goal' => 'Meta',
			'onboarding.slide3.practice' => 'Práctica',
			'onboarding.slide3.progress' => 'Progreso',
			'targetLanguage.title' => 'Selecciona el idioma que quieres aprender',
			'targetLanguage.comingSoon' => 'Pronto llegarán más idiomas',
			'targetLanguage.korean' => 'Coreano',
			'targetLanguage.portuguese' => 'Portugués',
			'targetLanguage.portugueseBrazil' => 'Portugués (Brasil)',
			'targetLanguage.german' => 'Alemán',
			'targetLanguage.italian' => 'Italiano',
			'targetLanguage.simplifiedChinese' => 'Chino simplificado',
			'targetLanguage.arabic' => 'Árabe',
			'targetLanguage.turkish' => 'Turco',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Paso ${current} de ${total}',
			'language.title' => '¿Qué quieres hablar?',
			'language.nativeSection' => 'Hablo',
			'language.nativeField' => 'Idioma nativo',
			'language.nativeName' => 'Turco',
			'language.targetSection' => 'Quiero aprender',
			'language.targetField' => 'Idioma objetivo',
			'language.targetName' => 'Inglés',
			'language.direction' => 'Dirección del idioma',
			'language.selectLanguage' => 'Selecciona idioma',
			'language.comingSoonBadge' => 'Próximamente...',
			'language.english' => 'Inglés',
			'language.french' => 'Francés',
			'language.japanese' => 'Japonés',
			'language.spanish' => 'Español',
			'language.russian' => 'Ruso',
			'setup.goalTitle' => '¿Cuál es tu objetivo?',
			'setup.goalCareer' => 'Desarrollo Profesional',
			'setup.goalTravel' => 'Viajar',
			'setup.goalLiving' => 'Vivir en el Extranjero',
			'setup.goalStudying' => 'Estudiar en el Extranjero',
			'setup.goalOther' => 'Otro',
			'setup.levelTitle' => '¿Cuál es tu nivel de idioma actual?',
			'setup.levelBeginner' => 'Principiante — Conozco algunas palabras',
			'setup.levelIntermediate' => 'Intermedio — Puedo mantener conversaciones simples',
			'setup.levelAdvanced' => 'Avanzado — Hablo pero quiero mejorar',
			'setup.paceTitle' => '¿Qué tan rápido quieres mejorar?',
			'setup.paceLight' => '5-10 min/día (ligero)',
			'setup.paceRecommended' => '15-20 min/día (recomendado)',
			'setup.paceFast' => '30+ min/día (resultados rápidos)',
			'accountCreating.title' => 'Tu Cuenta Personal Está Siendo Creada',
			'accountCreating.stepContent' => 'Se está creando el contenido',
			'accountCreating.stepDialogues' => 'Se están preparando los diálogos',
			'accountCreating.stepLessons' => 'Se están optimizando las lecciones',
			'accountCreating.stepPlan' => 'Tu plan está siendo finalizado',
			'accountCreating.optimization' => 'Optimización',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lección 1: Saludos',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Escribe un mensaje...',
			'previewChat.incoming1' => '¡Hola! Bienvenido a Lingola — Soy tu tutor de IA. ¿Listo para intentar un rápido saludo en inglés?',
			'previewChat.outgoing1' => '¡Hola! Estoy listo para practicar.',
			'previewChat.incoming2Highlight' => 'Buenos días',
			'previewChat.incoming2Rest' => ', Emrah! Me alegra que te sientas listo. Un café por la mañana siempre es un gran comienzo para construir una conexión. ¿De qué te gustaría hablar?',
			'previewChat.holdToSpeak' => 'Mantén para hablar',
			'previewChat.recording' => 'Grabando… suelta para enviar',
			'previewChat.slideUpToLock' => 'Desliza hacia arriba para bloquear',
			'previewChat.slideLeftToCancel' => 'Desliza a la izquierda para cancelar',
			'previewChat.recordingLockedHint' => 'Toca enviar cuando termines',
			'paywall.title' => 'Empieza a Hablar Hoy — Gratis',
			'paywall.subtitle' => 'Oportunidades de aprendizaje ilimitadas',
			'paywall.noCommitment' => 'Sin compromiso',
			'paywall.cancelAnytime' => 'Cancela en cualquier momento',
			'paywall.noPaymentToday' => 'Sin pago hoy',
			'paywall.daysFree' => '3 Días Gratis',
			'paywall.thenPrice' => 'Luego \$1.99/mes',
			'paywall.trialActive' => 'Prueba Gratuita Activa',
			'paywall.payableToday' => 'Pagadero Hoy',
			'paywall.payableValue' => '3 Días Gratis 0.00\$',
			'paywall.paymentDate' => 'Fecha de pago: 13 de marzo de 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Nuestros diversos entrenadores de IA',
			'auth.title' => 'Empieza a Hablar un Nuevo Idioma, Hoy',
			'auth.body' => 'Practica conversaciones reales con IA.\nSin presión. Sin juicios.',
			'auth.continueGoogle' => 'Continuar con Google',
			'auth.continueApple' => 'Continuar con Apple',
			'auth.continueGuest' => 'Continuar como Invitado',
			'auth.legal' => 'Al registrarte en Lingola, aceptas nuestros Términos de Servicio. Aprende cómo procesamos tus datos en nuestra Política de Privacidad y Política de Cookies',
			'auth.terms' => 'Términos de Servicio',
			'auth.privacy' => 'Política de Privacidad',
			'auth.cookies' => 'Política de Cookies',
			'nav.home' => 'Inicio',
			'nav.tutor' => 'Tutor',
			'nav.lesson' => 'Lección',
			'nav.rolePlay' => 'Juego de Roles',
			'nav.profile' => 'Perfil',
			'home.streakCount' => '2',
			'home.greeting' => 'Buenos Días, Jhon',
			'home.todayPractice' => 'Práctica de Hoy',
			'home.continueConversation' => 'Continuar Conversación',
			'home.continueWithTutor' => ({required Object name}) => '¿Seguir con ${name} u otro tutor?',
			'home.continueSameTutor' => ({required Object name}) => 'Continuar con ${name}',
			'home.chooseOtherTutor' => 'Elegir otro tutor',
			'home.minutesLeft' => ({required Object value}) => '${value} min restantes',
			'home.lessonProgress' => 'Lección 2 — Saludos',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
			'home.kContinue' => 'Continuar',
			'home.learningPath' => 'A1 - Principiante',
			'home.allLessons' => 'Todas las Lecciones',
			'home.introductions' => 'Introducciones I',
			'home.greetings' => 'Saludos',
			'home.jobs' => 'Trabajos',
			'home.favoriteRoom' => 'Una Habitación Favorita',
			'home.dailyRoutine' => 'Rutina Diaria',
			'home.scroll' => 'Desplazar',
			'home.liveLesson' => 'Lección en Vivo',
			'home.liveLessonSubtitle' => 'Haz una videollamada con nuestro tutor',
			'home.moreTutor' => 'Más Tutor',
			'home.startTalkNow' => 'Comienza a Hablar Ahora',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adaptativo',
			'home.tagCalm' => 'Calmado',
			'home.tagPatient' => 'Paciente',
			'home.tagMethodical' => 'Metódico',
			'home.tagEncouraging' => 'Alentador',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Más Funciones',
			'home.practiceLabel' => 'PRÁCTICA',
			'home.wordPractice' => 'Práctica de Palabras',
			'home.wordPracticeBody' => 'Construye tu vocabulario en el idioma que elijas a diario',
			'home.immersiveLabel' => 'INMERSIVO',
			'home.quiz' => 'Cuestionario',
			'home.quizBodyLine1' => 'Aprende a través de ejemplos reales',
			'home.quizBodyLine2' => 'en contexto',
			'home.getStarted' => 'Comenzar',
			'home.library' => 'Biblioteca',
			'home.libraryTitle' => 'Aprende y Ahorra',
			'home.learnMore' => 'Aprender Más',
			'home.premium.titleBefore' => 'El camino hacia ',
			'home.premium.titleHighlight' => 'hablar con fluidez',
			'home.premium.titleAfter' => ' sin miedo a cometer errores.',
			'home.premium.descriptionBefore' => 'Únete a millones de estudiantes en todo el mundo. Comienza a romper la barrera del idioma hoy — ',
			'home.premium.descriptionHighlight' => 'los primeros 3 días completamente gratis.',
			'home.premium.feature1' => 'Tutor de IA accesible 24/7',
			'home.premium.feature2' => 'Acceso ilimitado a Tutores Privados',
			'home.premium.feature3' => 'Plan de lecciones diario adaptado para ti',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/mes',
			'home.premium.discount' => '40% de descuento con compra anual',
			'home.premium.cta' => 'Comenzar',
			'libraryPage.title' => 'Biblioteca',
			'libraryPage.searchWord' => 'Buscar Palabra',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Palabra Guardada',
			'libraryPage.savedWordTab' => 'Palabra Guardada',
			'libraryPage.dictionaryTab' => 'Diccionario',
			'libraryPage.dictionaryLabel' => 'Diccionario',
			'wordPracticePage.title' => 'Práctica de Palabras',
			'wordPracticePage.turkish' => 'TURCO',
			'wordPracticePage.save' => 'Guardar',
			'wordPracticePage.saved' => 'Guardado',
			'wordPracticePage.listen' => 'Escuchar',
			'wordPracticePage.hint' => 'Pista',
			'wordPracticePage.previous' => 'ANTERIOR',
			'wordPracticePage.next' => 'SIGUIENTE',
			'quizPage.title' => 'Cuestionario',
			'quizPage.headline' => '¿Qué quieres mejorar hoy?',
			'quizPage.subtitle' => 'Elige tu entrenamiento — toma menos de 3 minutos 🚀',
			'quizPage.readingTitle' => 'Lectura',
			'quizPage.readingBody' => 'Comprensión a través de artículos e historias',
			'quizPage.writingTitle' => 'Escritura',
			'quizPage.writingBody' => 'Ejercicios de gramática y vocabulario',
			'quizPage.speakingTitle' => 'Habla',
			'quizPage.speakingBody' => 'Pronunciación a través del motor de voz AI',
			'quizPage.readingTestTitle' => 'Prueba de Lectura',
			'quizPage.read' => 'Leer',
			'quizPage.listeningHint' => 'Di la palabra en inglés claramente...',
			'quizPage.micPermissionDenied' => 'El micrófono o el reconocimiento de voz no están disponibles.',
			'quizPage.matchSuccess' => '¡Genial! Eso coincide con la palabra.',
			'quizPage.matchFail' => ({required Object heard}) => 'Escuché "${heard}". Intenta de nuevo.',
			'quizPage.successfulTitle' => '¡Éxito!',
			'quizPage.successfulBody' => '¡Pronunciación como un hablante nativo!',
			'quizPage.failedTitle' => 'Fallido',
			'quizPage.failedBody' => 'Casi lo lograste, dale una oportunidad más',
			'quizPage.tryAgain' => 'INTENTA DE NUEVO',
			'quizPage.writingTestTitle' => 'Prueba de Escritura',
			'quizPage.sourceLanguage' => 'IDIOMA DE ORIGEN',
			'quizPage.answer' => 'RESPUESTA',
			'quizPage.writeAnswerHint' => 'Escribe tu respuesta aquí...',
			'quizPage.submit' => 'Enviar',
			'quizPage.speakingTestTitle' => 'Prueba de Habla',
			'quizPage.speakingProficiency' => 'Dominio del Habla',
			'quizPage.speakClearlyHint' => 'Habla claramente en tu micrófono:',
			'quizPage.speakUp' => 'Habla Más Alto',
			'quizPage.recording' => 'Grabando...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'PREGUNTA ${current} DE ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} está en camino',
			'placeholder.body' => ({required Object tab}) => 'Estamos preparando una experiencia enfocada en ${tab} para ti.',
			'tutorPage.title' => 'Tutor',
			'tutorPage.chatWithLingola' => 'Chatea con Lingola',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Chatea con ${name}',
			'tutorPage.chatHistory' => 'Historial de Chat',
			'tutorPage.history' => 'Historia',
			'tutorPage.filter' => 'Filtrar',
			'tutorPage.country' => 'País',
			'tutorPage.focus' => 'Enfoque',
			'tutorPage.moreCountries' => '8+ más',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'GUARDAR',
			'tutorPage.clearFilter' => 'Quitar filtros',
			'tutorPage.startTalkNow' => 'Comienza a hablar ahora',
			'tutorPage.typeMessage' => 'Escribe un mensaje...',
			'tutorPage.speaker' => 'Hablante',
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
			'tutorPage.tags.adaptive' => 'Adaptativo',
			'tutorPage.tags.calm' => 'Calmo',
			'tutorPage.tags.patient' => 'Paciente',
			'tutorPage.tags.organized' => 'Organizado',
			'tutorPage.tags.relaxed' => 'Relajado',
			'tutorPage.tags.methodical' => 'Metódico',
			'tutorPage.tags.attentive' => 'Atento',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Curioso',
			'tutorPage.tags.observer' => 'Observador',
			'tutorPage.tags.ancientKnowledge' => 'Conocimiento Antiguo',
			'tutorPage.tags.wise' => 'Sabio',
			'tutorPage.tags.clear' => 'Claro',
			'tutorPage.tags.decisive' => 'Decisivo',
			'tutorPage.tags.disciplined' => 'Disciplinado',
			'tutorPage.tags.smart' => 'Inteligente',
			'tutorPage.tags.analytic' => 'Analítico',
			'tutorPage.tags.cheerful' => 'Alegre',
			'tutorPage.tags.generous' => 'Generoso',
			'tutorPage.historyPreview1' => '¡Hola! Estaba a punto de explotar de aburrimiento...',
			'tutorPage.historyPreview2' => '¿Practicamos pedir comida hoy?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'Ayer',
			'tutorPage.chat.incoming1' => '¡Buenos días! Me alegra que te sientas listo para practicar hoy.',
			'tutorPage.chat.outgoing1' => 'Sí, empecemos con los saludos.',
			'tutorPage.chat.incoming2' => 'Perfecto. ¿Cómo saludarías a un colega?',
			'tutorPage.chat.typing' => 'Escribiendo',
			'tutorPage.calling.lessonBadge' => 'Lección 1 : Saludos',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Lección ${number} : ${title}',
			'tutorPage.calling.nativeLine' => '¿Sıkıldın mı?',
			'tutorPage.calling.englishLine' => '¿Aburrido? Eliminé esa palabra de mi vocabulario. Levántate, el plan ya está hecho: vamos a ese nuevo bar de arcade en Kadıköy.',
			'tutorPage.calling.highlight' => '¿Aburrido?',
			'tutorPage.calling.close' => 'Finalizar llamada',
			'tutorPage.calling.toggleCaptions' => 'Alternar subtítulos',
			'tutorPage.calling.toggleHints' => 'Alternar pistas',
			'tutorPage.calling.toggleMic' => 'Alternar micrófono',
			'lessonPage.title' => 'Continúa aprendiendo',
			'lessonPage.profile' => 'Perfil',
			'lessonPage.language' => 'Idioma objetivo',
			'lessonPage.completed' => 'Completado',
			'lessonPage.locked' => 'Bloqueado',
			'lessonPage.pickTutorTitle' => 'Elige tu tutor',
			'lessonPage.startTalk' => 'Iniciar lección',
			'lessonPage.chatInstead' => 'Chatear en su lugar',
			'lessonPage.lockedHint' => 'Termina la lección anterior para desbloquear esta.',
			'lessonPage.levelLockedTitle' => 'Nivel bloqueado',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Tu nivel de inglés es ${userLevel}, por eso no puedes abrir lecciones de ${lessonLevel} sin completar el camino anterior.',
			'lessonPage.levelLockedOk' => 'Entendido',
			'lessonPage.notesTitle' => 'Notas de la lección',
			'lessonPage.whatWeLearned' => 'Lo que aprendimos hoy',
			'lessonPage.deleteNotes' => 'Eliminar mis notas de la lección',
			'lessonPage.deleteNotesConfirm' => '¿Eliminar estas notas? Esto no se puede deshacer.',
			'lessonPage.delete' => 'Eliminar',
			'lessonPage.cancel' => 'Cancelar',
			'lessonPage.practiceCta' => 'Si esto te pareció muy difícil, puedes practicar el mismo tema de nuevo.',
			'lessonPage.practiceNow' => 'Practica este tema',
			'lessonPage.openChat' => 'Abrir chat con el tutor',
			'lessonPage.yourScore' => 'Tu puntuación',
			'lessonPage.bestScore' => ({required Object score}) => 'Mejor ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Participante pasivo',
			'lessonPage.participationSilentBody' => 'Te quedaste callado esta vez. Creo que deberías volver a tomar esta lección.',
			'lessonPage.participationPassive' => 'Baja participación',
			'lessonPage.participationPassiveBody' => 'Apenas hablaste. Intenta la lección de nuevo y di más.',
			'lessonPage.participationActive' => 'Buena participación',
			'lessonPage.participationActiveBody' => 'Te uniste a la conversación. ¡Sigue así!',
			'lessonPage.participationStrong' => 'Fuerte participación',
			'lessonPage.participationStrongBody' => 'Hablaste mucho. ¡Gran trabajo!',
			'lessonPage.retakeLesson' => 'Repetir esta lección',
			'lessonPage.finishLesson' => 'Terminar lección',
			'lessonPage.savingNotes' => 'Tu tutor está escribiendo las notas de hoy...',
			'lessonPage.noNotes' => 'Termina esta lección para obtener notas de tu tutor.',
			'lessonPage.notesDeleted' => 'Notas de la lección eliminadas',
			'lessonPage.levels.a1.title' => 'A1 - Principiante',
			'lessonPage.levels.a1.lessons.0' => 'Saludos',
			'lessonPage.levels.a1.lessons.1' => 'Presentaciones I',
			'lessonPage.levels.a1.lessons.2' => 'Trabajos',
			'lessonPage.levels.a1.lessons.3' => 'Una habitación favorita',
			'lessonPage.levels.a1.lessons.4' => 'Rutina diaria',
			'lessonPage.levels.a1.lessons.5' => 'Frutas',
			'lessonPage.levels.a1.lessons.6' => 'Consejos 1',
			'lessonPage.levels.a1.lessons.7' => 'Familia 1',
			'lessonPage.levels.a1.lessons.8' => 'Cosas cotidianas',
			'lessonPage.levels.a1.lessons.9' => 'Ciudad natal',
			'lessonPage.levels.a1.lessons.10' => 'Casa',
			'lessonPage.levels.a1.lessons.11' => 'Preferencias alimenticias',
			'lessonPage.levels.a1.lessons.12' => 'Pasatiempos 1',
			'lessonPage.levels.a1.lessons.13' => 'Personas exitosas',
			'lessonPage.levels.a1.lessons.14' => 'Comida y bebidas',
			'lessonPage.levels.a1.lessons.15' => 'Pidiendo en un restaurante',
			'lessonPage.levels.a1.lessons.16' => 'Mascotas',
			'lessonPage.levels.a1.lessons.17' => 'Salud y bienestar',
			'lessonPage.levels.a1.lessons.18' => 'Clima',
			'lessonPage.levels.a1.lessons.19' => 'Nuevo estilo de vida',
			'lessonPage.levels.a1.lessons.20' => 'Mejorando',
			'lessonPage.levels.a1.lessons.21' => 'Pasatiempos 2',
			'lessonPage.levels.a1.lessons.22' => 'Preguntas sobre lugares',
			'lessonPage.levels.a1.lessons.23' => 'Posesión',
			'lessonPage.levels.a1.lessons.24' => 'Compras 1',
			'lessonPage.levels.a1.lessons.25' => 'Diciendo la hora',
			'lessonPage.levels.a1.lessons.26' => 'Direcciones 1',
			'lessonPage.levels.a1.lessons.27' => 'Compras 2',
			'lessonPage.levels.a1.lessons.28' => 'Conociéndote',
			'lessonPage.levels.a1.lessons.29' => 'Lugares de objetos',
			'lessonPage.levels.a1.lessons.30' => 'Apariencias',
			'lessonPage.levels.a1.lessons.31' => 'Direcciones 2',
			'lessonPage.levels.a2.title' => 'A2 - Básico',
			'lessonPage.levels.a2.lessons.0' => 'Familia 2',
			'lessonPage.levels.a2.lessons.1' => 'Personas y lugares',
			'lessonPage.levels.a2.lessons.2' => 'Familia 3',
			'lessonPage.levels.a2.lessons.3' => 'Describiendo objetos',
			'lessonPage.levels.a2.lessons.4' => 'Ciudad',
			'lessonPage.levels.a2.lessons.5' => 'El proyecto de construcción',
			'lessonPage.levels.a2.lessons.6' => 'Hogar dulce hogar',
			'lessonPage.levels.a2.lessons.7' => '¿Qué hora es?',
			'lessonPage.levels.a2.lessons.8' => 'Rutina diaria 2',
			'lessonPage.levels.a2.lessons.9' => 'Tiempo libre',
			'lessonPage.levels.a2.lessons.10' => 'Comida y nutrición',
			'lessonPage.levels.a2.lessons.11' => 'Compras y consumo',
			'lessonPage.levels.a2.lessons.12' => 'Vacaciones',
			'lessonPage.levels.a2.lessons.13' => 'Planes de fin de semana',
			'lessonPage.levels.a2.lessons.14' => 'Formal o informal',
			'lessonPage.levels.a2.lessons.15' => 'Moda',
			'lessonPage.levels.a2.lessons.16' => 'Compras 3',
			'lessonPage.levels.a2.lessons.17' => 'Consejos 2',
			'lessonPage.levels.a2.lessons.18' => 'Tú puedes hacerlo',
			'lessonPage.levels.a2.lessons.19' => 'Compras 4',
			'lessonPage.levels.a2.lessons.20' => 'Charlas triviales',
			'lessonPage.levels.a2.lessons.21' => 'Un latte, por favor',
			'lessonPage.levels.a2.lessons.22' => 'Comida',
			'lessonPage.levels.a2.lessons.23' => 'Desplazándose',
			'lessonPage.levels.a2.lessons.24' => 'Listo para un viaje',
			'lessonPage.levels.a2.lessons.25' => 'Viaje 1',
			'lessonPage.levels.a2.lessons.26' => 'Escapadas urbanas',
			'lessonPage.levels.a2.lessons.27' => 'Viaje 2',
			'lessonPage.levels.a2.lessons.28' => 'Un lugar para quedarse',
			'lessonPage.levels.a2.lessons.29' => 'Tan emocionante',
			'lessonPage.levels.a2.lessons.30' => 'La persona adecuada',
			'lessonPage.levels.a2.lessons.31' => 'Escuela',
			'lessonPage.levels.a2.lessons.32' => 'Preferencias musicales',
			'lessonPage.levels.a2.lessons.33' => 'Deportes',
			'lessonPage.levels.a2.lessons.34' => 'Reglas de la carrera',
			'lessonPage.levels.a2.lessons.35' => 'Deja un mensaje',
			'lessonPage.levels.a2.lessons.36' => 'Solicitudes',
			'lessonPage.levels.a2.lessons.37' => 'Invitaciones',
			'lessonPage.levels.a2.lessons.38' => 'Experiencias de viaje',
			'lessonPage.levels.a2.lessons.39' => 'Pasado 1',
			'lessonPage.levels.a2.lessons.40' => 'Pasado 2',
			'lessonPage.levels.a2.lessons.41' => 'Pasado 3',
			'lessonPage.levels.a2.lessons.42' => 'Preguntas sobre el pasado',
			'lessonPage.levels.a2.lessons.43' => 'Nunca eres demasiado viejo',
			'lessonPage.levels.a2.lessons.44' => 'Recuerdos de la infancia',
			'lessonPage.levels.a2.lessons.45' => 'Cumplidos',
			'lessonPage.levels.a2.lessons.46' => 'Excusas',
			'lessonPage.levels.a2.lessons.47' => '¡Es tan molesto!',
			'lessonPage.levels.a2.lessons.48' => 'Un mundo digital',
			'lessonPage.levels.a2.lessons.49' => 'Vida laboral',
			'lessonPage.levels.a2.lessons.50' => 'No entendí eso',
			'lessonPage.levels.a2.lessons.51' => '¿Ahorrar o gastar?',
			'lessonPage.levels.a2.lessons.52' => 'Decir perdón',
			'lessonPage.levels.b1.title' => 'B1 - Intermedio',
			'lessonPage.levels.b1.lessons.0' => 'Tradiciones culturales',
			'lessonPage.levels.b1.lessons.1' => 'Celebridades',
			'lessonPage.levels.b1.lessons.2' => 'Arte y creatividad',
			'lessonPage.levels.b1.lessons.3' => 'Planes futuros',
			'lessonPage.levels.b1.lessons.4' => 'Planificación de eventos',
			'lessonPage.levels.b1.lessons.5' => 'Metas y planes',
			'lessonPage.levels.b1.lessons.6' => 'Eventos históricos',
			'lessonPage.levels.b1.lessons.7' => 'Tecnología',
			'lessonPage.levels.b1.lessons.8' => 'Nunca jamás',
			'lessonPage.levels.b1.lessons.9' => 'Qué hay en',
			'lessonPage.levels.b1.lessons.10' => 'Vacaciones soñadas',
			'lessonPage.levels.b1.lessons.11' => 'Redes sociales',
			'lessonPage.levels.b1.lessons.12' => 'Recomendaciones de libros',
			'lessonPage.levels.b1.lessons.13' => 'Uno de esos días',
			'lessonPage.levels.b1.lessons.14' => 'Fotos especiales',
			'lessonPage.levels.b1.lessons.15' => 'Logros personales',
			'lessonPage.levels.b1.lessons.16' => 'Películas favoritas',
			'lessonPage.levels.b1.lessons.17' => 'Últimas noticias',
			'lessonPage.levels.b1.lessons.18' => 'Felicidad',
			'lessonPage.levels.b1.lessons.19' => 'Una semana ocupada',
			'lessonPage.levels.b1.lessons.20' => 'Donde crecí',
			'lessonPage.levels.b1.lessons.21' => 'Días de escuela',
			'lessonPage.levels.b1.lessons.22' => 'Perfiles',
			'lessonPage.levels.b1.lessons.23' => 'Mapas de vida',
			'lessonPage.levels.b1.lessons.24' => 'Cotidiano',
			'lessonPage.levels.b1.lessons.25' => 'Qué sigue',
			'lessonPage.levels.b1.lessons.26' => 'Haciendo sugerencias',
			'lessonPage.levels.b1.lessons.27' => 'Qué pasó',
			'lessonPage.levels.b1.lessons.28' => 'Recuerdos',
			'lessonPage.levels.b1.lessons.29' => 'Choque cultural',
			'lessonPage.levels.b1.lessons.30' => 'Frases de interés',
			'lessonPage.levels.b1.lessons.31' => 'Entrevistas de trabajo',
			'lessonPage.levels.b1.lessons.32' => 'Listas de deseos',
			'lessonPage.levels.b1.lessons.33' => 'Mi tipo de ciudad',
			'lessonPage.levels.b1.lessons.34' => 'La generación de internet',
			'lessonPage.levels.b1.lessons.35' => 'Marcas populares',
			'lessonPage.levels.b1.lessons.36' => 'Frases de opinión',
			'lessonPage.levels.b1.lessons.37' => 'Cómo se ve',
			'lessonPage.levels.b1.lessons.38' => 'Espacio vital',
			'lessonPage.levels.b1.lessons.39' => 'Comer bien',
			'lessonPage.levels.b1.lessons.40' => 'Hobbies inusuales',
			'lessonPage.levels.b1.lessons.41' => 'Una elección difícil',
			'lessonPage.levels.b1.lessons.42' => 'Tomar acción',
			'lessonPage.levels.b1.lessons.43' => 'Nuevas habilidades',
			'lessonPage.levels.b1.lessons.44' => 'Haciendo una queja',
			'lessonPage.levels.b1.lessons.45' => 'Educación',
			'lessonPage.levels.b1.lessons.46' => 'Ciudades verdes',
			'lessonPage.levels.b1.lessons.47' => 'Qué hay en un trabajo',
			'lessonPage.levels.b1.lessons.48' => 'Desafíos personales',
			'lessonPage.levels.b1.lessons.49' => 'Frases de entrevista',
			'lessonPage.levels.b1.lessons.50' => 'Finales educados',
			'lessonPage.levels.b1.lessons.51' => 'Noticias de última hora',
			'lessonPage.levels.b1.lessons.52' => 'Pequeños cambios',
			'lessonPage.levels.b1.lessons.53' => 'Disculpas y excusas',
			'lessonPage.levels.b1.lessons.54' => 'Etiqueta telefónica',
			'lessonPage.levels.b1.lessons.55' => 'Perdón por interrumpir…',
			'lessonPage.levels.b1.lessons.56' => 'Respuestas a quejas',
			'lessonPage.levels.b2.title' => 'B2 - Intermedio Alto',
			'lessonPage.levels.b2.lessons.0' => 'Personalidades',
			'lessonPage.levels.b2.lessons.1' => 'Grandes líderes',
			'lessonPage.levels.b2.lessons.2' => 'Estilo de vida saludable',
			'lessonPage.levels.b2.lessons.3' => '¿Cuál es la verdad?',
			'lessonPage.levels.b2.lessons.4' => 'Crecimiento personal',
			'lessonPage.levels.b2.lessons.5' => 'Expresarse',
			'lessonPage.levels.b2.lessons.6' => '¿Actuando?',
			'lessonPage.levels.b2.lessons.7' => 'Recuerdo...',
			'lessonPage.levels.b2.lessons.8' => 'Retroalimentación social',
			'lessonPage.levels.b2.lessons.9' => 'Escena del crimen',
			'lessonPage.levels.b2.lessons.10' => 'Problemas educados',
			'lessonPage.levels.b2.lessons.11' => 'Resolución de conflictos',
			'lessonPage.levels.b2.lessons.12' => '¿Te encanta o lo odias?',
			'lessonPage.levels.b2.lessons.13' => 'Problemas ambientales',
			'lessonPage.levels.b2.lessons.14' => 'Podemos resolverlo',
			'lessonPage.levels.b2.lessons.15' => 'Misterios y crímenes',
			'lessonPage.levels.b2.lessons.16' => 'Futuros posibles',
			'lessonPage.levels.b2.lessons.17' => 'Planes de negocio',
			'lessonPage.levels.b2.lessons.18' => 'Decisiones en reuniones',
			'lessonPage.levels.b2.lessons.19' => 'Es tan predecible...',
			'lessonPage.levels.b2.lessons.20' => 'En el trabajo',
			'lessonPage.levels.b2.lessons.21' => 'Ciencia y tecnología',
			'lessonPage.levels.b2.lessons.22' => 'Gestión del tiempo',
			'lessonPage.levels.b2.lessons.23' => 'Derechos humanos',
			'lessonPage.levels.c1.title' => 'C1 - Avanzado',
			'lessonPage.levels.c1.lessons.0' => 'Normas culturales',
			'lessonPage.levels.c1.lessons.1' => 'Influencia de las redes sociales',
			'lessonPage.levels.c1.lessons.2' => 'Elecciones profesionales',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.c1.lessons.3' => 'Acelerar el rendimiento',
			'lessonPage.levels.c1.lessons.4' => 'Invenciones',
			'lessonPage.levels.c1.lessons.5' => 'Viaje en el tiempo',
			'lessonPage.levels.c1.lessons.6' => 'Pertenencias',
			'lessonPage.levels.c1.lessons.7' => 'Habilidades laborales',
			'lessonPage.levels.c1.lessons.8' => 'Cambios históricos',
			'lessonPage.levels.c1.lessons.9' => 'Escritura de reseñas',
			'lessonPage.levels.c1.lessons.10' => 'Misterios',
			'lessonPage.levels.c1.lessons.11' => 'Teorías extrañas',
			'lessonPage.levels.c1.lessons.12' => 'Celebridades',
			'lessonPage.levels.c1.lessons.13' => 'Política global',
			'lessonPage.levels.c1.lessons.14' => 'Boom de productos',
			'lessonPage.levels.c1.lessons.15' => '¿Seré feliz?',
			'lessonPage.levels.c1.lessons.16' => 'Quizás más tarde...',
			'lessonPage.levels.c1.lessons.17' => 'Nuevas soluciones',
			'lessonPage.levels.c1.lessons.18' => 'Influencia contextual',
			'lessonPage.levels.c1.lessons.19' => 'Un logo perdido',
			'lessonPage.levels.c1.lessons.20' => 'Actos amables',
			'lessonPage.levels.c1.lessons.21' => 'Qué película',
			'lessonPage.levels.c1.lessons.22' => 'Qué molesto',
			'lessonPage.levels.c1.lessons.23' => 'En las noticias',
			'lessonPage.levels.c2.title' => 'C2 - Experto',
			'lessonPage.levels.c2.lessons.0' => 'Globalización',
			'lessonPage.levels.c2.lessons.1' => 'Desastres naturales',
			'lessonPage.levels.c2.lessons.2' => 'Reaccionando a la información',
			'lessonPage.levels.c2.lessons.3' => 'Equilibrio entre trabajo y vida',
			'lessonPage.levels.c2.lessons.4' => 'Trabajo remoto',
			'lessonPage.levels.c2.lessons.5' => 'Problemas familiares',
			'lessonPage.levels.c2.lessons.6' => 'Anatomía humana básica',
			'lessonPage.levels.c2.lessons.7' => 'Predicciones de salud',
			'lessonPage.levels.c2.lessons.8' => 'Acceso a la atención médica',
			'lessonPage.levels.c2.lessons.9' => 'Experiencia de viaje global',
			'lessonPage.levels.c2.lessons.10' => 'Superpoderes',
			'lessonPage.levels.c2.lessons.11' => 'Construcción de equipos',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescencia',
			'lessonPage.levels.c2.lessons.13' => 'Dilemas',
			'lessonPage.levels.c2.lessons.14' => 'Entusiasmo social',
			'lessonPage.levels.c2.lessons.15' => 'Cambios',
			'lessonPage.levels.c2.lessons.16' => 'Trabajo, trabajo, trabajo',
			'lessonPage.levels.c2.lessons.17' => 'Problemas locales',
			'lessonPage.levels.c2.lessons.18' => 'Problemas, problemas',
			'lessonPage.levels.c2.lessons.19' => '¿Hecho o ficción?',
			'lessonPage.levels.c2.lessons.20' => 'Turismo',
			'lessonPage.levels.c2.lessons.21' => 'Voluntariado',
			'lessonPage.levels.c2.lessons.22' => 'El ojo de la mente',
			'lessonPage.levels.c2.lessons.23' => 'Consumo de medios',
			'rolePlayPage.title' => 'Juego de Roles',
			'rolePlayPage.subtitle' => 'Elige tu rol — vive un escenario de la vida real 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} completado',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Principiante',
			'rolePlayPage.screenplay' => 'GUION',
			'rolePlayPage.dailyInteractions' => 'Interacciones Diarias',
			'rolePlayPage.business' => 'Negocios',
			'rolePlayPage.coffee.title' => 'Pidiendo en la Cafetería',
			'rolePlayPage.coffee.screenplay' => 'Pide tu bebida favorita, pregunta sobre tamaños y extras, confirma tu total y recoge tu café en el mostrador.',
			'rolePlayPage.coffee.chat.briefing' => '¡Hola! Hoy practicaremos pedir en una cafetería — saludos, tamaños, extras. Primero explicaré un poco, luego lo representaremos. ¿Te parece bien?',
			'rolePlayPage.coffee.chat.incoming1' => '¡Bienvenido! ¿Qué puedo empezar a preparar para ti hoy?',
			'rolePlayPage.coffee.chat.outgoing1' => '¡Hola! Quisiera un latte mediano, por favor.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Claro',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! ¿Te gustaría caliente o helado, y algún extra?',
			'rolePlayPage.coffee.chat.botReply' => 'Buena elección. ¿Algo más con tu pedido?',
			'rolePlayPage.directions.title' => 'Pidiendo Direcciones en la Calle',
			'rolePlayPage.directions.screenplay' => 'Pregunta por direcciones a un lugar, averigua cómo llegar al metro o autobús, obtén información sobre boletos y escucha recomendaciones de restaurantes.',
			'rolePlayPage.directions.chat.briefing' => '¡Hola! Hoy practicaremos pedir direcciones en la calle. Primero explicaré un poco, luego lo representaremos. ¿Te parece bien?',
			'rolePlayPage.directions.chat.incoming1' => '¡Hola! Te ves un poco perdido — ¿necesitas ayuda para encontrar algo?',
			'rolePlayPage.directions.chat.outgoing1' => 'Sí, estoy buscando la estación de metro más cercana.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Por supuesto',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Camina dos cuadras en esa dirección, luego gira a la izquierda. Verás la entrada.',
			'rolePlayPage.directions.chat.botReply' => '¡De nada! ¿Quieres un consejo de restaurante cerca de la estación también?',
			'rolePlayPage.interview.title' => 'Entrevista de Trabajo',
			'rolePlayPage.interview.screenplay' => 'Preséntate, responde preguntas comunes de entrevistas, habla sobre tu experiencia y pregunta sobre el rol y los siguientes pasos.',
			'rolePlayPage.interview.chat.briefing' => '¡Hola! Hoy practicaremos una entrevista de trabajo. Primero explicaré un poco, luego lo representaremos — yo te entrevistaré, luego cambiamos. ¿Te parece bien?',
			'rolePlayPage.interview.chat.incoming1' => 'Gracias por venir hoy. ¿Podrías presentarte brevemente?',
			'rolePlayPage.interview.chat.outgoing1' => 'Por supuesto. Estoy emocionado de estar aquí y compartir mi experiencia.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Maravilloso',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Cuéntame sobre un proyecto reciente del que estés orgulloso.',
			'rolePlayPage.interview.chat.botReply' => 'Eso es impresionante. ¿Qué preguntas tienes sobre el rol?',
			'notificationsPage.title' => 'Notificaciones',
			'notificationsPage.deleteConfirmTitle' => '¿Estás seguro?',
			'notificationsPage.deleteConfirmBody' => 'Esta notificación se eliminará.',
			'notificationsPage.delete' => 'Eliminar',
			'notificationsPage.cancel' => 'Cancelar',
			'notificationsPage.translation.title' => 'Nueva Traducción Listo',
			'notificationsPage.translation.body' => 'Tu archivo de traducción de audio ha sido convertido a texto y traducido con éxito.',
			'notificationsPage.offer.title' => 'Te Espera una Oferta Especial',
			'notificationsPage.offer.body' => 'Actualiza a Premium para traducciones de fotos ilimitadas con un 50% de descuento.',
			'notificationsPage.stories.title' => 'Descubre Nuevas Historias',
			'notificationsPage.stories.body' => 'Aprende nuevas palabras a través de historias',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Aún no hay notificaciones',
			'notificationsPage.emptySubtitle' => 'No olvides volver a revisar cuando recibas una notificación.',
			'profilePage.title' => 'Perfil',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Versión Gratuita',
			'profilePage.dayStreak' => '¡Racha de Días!',
			'profilePage.accountSettings' => 'Configuración de la Cuenta',
			'profilePage.general' => 'General',
			'profilePage.profileSettings' => 'Configuración del Perfil',
			'profilePage.fullName' => 'Nombre Completo',
			'profilePage.email' => 'Correo Electrónico',
			'profilePage.deleteAccount' => 'Eliminar Cuenta',
			'profilePage.save' => 'GUARDAR',
			'profilePage.deleteTitle' => 'No queremos que te vayas, pero te entendemos.',
			'profilePage.deleteBody' => '¿Podrías decirnos por qué quieres irte para mejorar la experiencia de Lingola?',
			'profilePage.deleteReasons.aiCharacters' => 'No encontré los personajes de inteligencia artificial realistas.',
			'profilePage.deleteReasons.videoIssues' => 'Tengo problemas técnicos en las videollamadas.',
			'profilePage.deleteReasons.pricing' => 'Los precios de suscripción están por encima de mis expectativas.',
			'profilePage.deleteReasons.noMatch' => 'No encontré personajes en el estilo que buscaba.',
			'profilePage.deleteReasons.shortTrial' => 'Solo quería probarlo por un corto período.',
			'profilePage.deleteReasons.other' => 'Otro',
			'profilePage.messageOptional' => 'Mensaje (opcional)',
			'profilePage.messageHint' => 'Si tienes un mensaje, por favor escríbelo.',
			'profilePage.next' => 'SIGUIENTE',
			'profilePage.specialOfferTitle' => 'Oferta Especial',
			'profilePage.specialOfferBody' => 'Echa un vistazo a la oferta que hemos preparado para ti antes de irte.',
			'profilePage.monthlyPlanTitle' => 'Cambia al Plan de 1 Mes',
			'profilePage.monthlyPlanPrice' => '\$79/mes, cancela en cualquier momento',
			'profilePage.monthlyPlanDesc' => 'Sin compromiso a largo plazo. Mantente conectado con nuestra comunidad mes a mes.',
			'profilePage.whatYoullKeep' => 'Lo que conservarás:',
			'profilePage.keepCharacters' => 'Acceso a todos los personajes',
			'profilePage.keepVideo' => 'Videollamadas ilimitadas',
			'profilePage.keepCourses' => 'Acceso a todos los cursos',
			'profilePage.switchMonthlyCta' => 'Cambiar a Plan Mensual',
			'profilePage.confirmTitle' => '¿Estás seguro?',
			'profilePage.confirmBody' => 'Realmente no queremos que te vayas. Aquí está lo que perderás:',
			'profilePage.loseCharacters' => 'Acceso ilimitado a personajes',
			'profilePage.loseVideo' => 'Acceso ilimitado a videollamadas',
			'profilePage.loseCourses' => 'Acceso a todos los cursos',
			'profilePage.discountTitle' => 'Quédate y obtén un 60% de descuento por 1 mes',
			'profilePage.discountSubtitle' => 'Nuestra mejor oferta de todas. Solo \$27.60/mes',
			'profilePage.acceptDiscountCta' => 'Aceptar 60% de Descuento y Quedarse',
			'profilePage.farewellTitle' => 'Nos entristece verte ir',
			'profilePage.farewellBody' => ({required Object date}) => 'Tu membresía ha sido cancelada. Tendrás acceso hasta el final de tu período de facturación actual el ${date}.',
			'profilePage.changeMindTitle' => '✨ ¿Cambias de opinión?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Puedes reactivar tu membresía en cualquier momento antes del ${date} para mantener tus beneficios.',
			'profilePage.reactivateCta' => 'Espera, quiero reactivar',
			'profilePage.done' => 'HECHO',
			'profilePage.notifications' => 'Notificaciones',
			'profilePage.appLanguage' => 'Idioma de la App',
			'profilePage.selectLanguageTitle' => 'Seleccionar Idioma',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Pasivo',
			'profilePage.active' => 'Activo',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Compartir con un Amigo',
			'profilePage.shareWithFriendTitle' => 'Compartir con un Amigo',
			'profilePage.shareInviteBody' => 'Invita a tus amigos y disfruta traduciendo juntos',
			'profilePage.rateUs' => 'Evalúanos',
			'profilePage.faq' => 'Preguntas Frecuentes de Lingola',
			'profilePage.faqItems.supportedLanguages.question' => '¿Qué idiomas soporta la app?',
			'profilePage.faqItems.supportedLanguages.answer' => 'La interfaz de Lingola está disponible en inglés, alemán, italiano, francés, turco, japonés, español, ruso, hindi, portugués y chino simplificado.',
			'profilePage.faqItems.howAiWorks.question' => '¿Cómo funciona la IA?',
			'profilePage.faqItems.howAiWorks.answer' => 'La IA interactúa contigo como un tutor real. Analiza tus conversaciones, detecta errores y ofrece retroalimentación personalizada basada en tu progreso.',
			'profilePage.faqItems.offlineUse.question' => '¿Puedo usar la app sin conexión?',
			'profilePage.faqItems.offlineUse.answer' => 'Sí. Puedes descargar ciertas lecciones y escenarios de conversación por adelantado y usarlos sin conexión. Sin embargo, el chat en vivo requiere conexión a internet.',
			'profilePage.faqItems.isFree.question' => '¿Es la app gratuita?',
			'profilePage.faqItems.isFree.answer' => 'La versión básica es gratuita. Con Premium, obtienes escenarios de chat avanzados, análisis de pronunciación y modo de tutor personal.',
			'profilePage.faqItems.pronunciationEval.question' => '¿Cómo se evalúa mi pronunciación?',
			'profilePage.faqItems.pronunciationEval.answer' => 'La app analiza tu voz y utiliza reconocimiento de voz impulsado por IA para puntuar tu acento y pronunciación. Las palabras que necesitas mejorar están resaltadas.',
			'profilePage.faqItems.dailyPractice.question' => '¿Necesito practicar a diario?',
			'profilePage.faqItems.dailyPractice.answer' => 'Sí. El sistema rastrea tu progreso cada día. Solo 10-15 minutos de práctica de conversación al día pueden acelerar notablemente tu aprendizaje de idiomas.',
			'profilePage.faqItems.levelDetermination.question' => '¿Cómo se determina mi nivel de aprendizaje?',
			'profilePage.faqItems.levelDetermination.answer' => 'Una breve evaluación de nivel cuando inicias sesión analiza tu conocimiento actual. Después de eso, la IA recomienda automáticamente lecciones adecuadas a tu nivel.',
			'profilePage.faqItems.realPeopleChat.question' => '¿Puedo hablar con personas reales?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Sí. Los usuarios Premium pueden programar sesiones cortas de práctica con tutores reales.',
			'profilePage.faqItems.dataSecurity.question' => '¿Está segura mi información?',
			'profilePage.faqItems.dataSecurity.answer' => 'Absolutamente. Todas las conversaciones y datos de usuario se almacenan encriptados. Tu información personal nunca se comparte con terceros.',
			'profilePage.faqItems.disableReminders.question' => '¿Cómo desactivo los recordatorios diarios?',
			'profilePage.faqItems.disableReminders.answer' => 'Ve a la configuración del perfil, abre Notificaciones y cambia la frecuencia de los recordatorios o desactiva las notificaciones por completo.',
			'profilePage.support' => 'Soporte',
			'profilePage.feedback' => 'Comentarios',
			'profilePage.progression' => 'Progreso',
			'profilePage.progressTitle' => 'Progreso',
			'profilePage.goodMorning' => 'Buenos Días,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'Inglés',
			'profilePage.past7Days' => 'Últimos 7 Días',
			'profilePage.past7DaysBody' => 'Estudia todos los días para construir tu racha y crear un poderoso hábito de aprendizaje.',
			'profilePage.currentLevel' => 'Nivel Actual',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => '¡Solo te quedan ${xp} XP para alcanzar el nivel ${level}!',
			'profilePage.toNextLevel' => 'AL SIGUIENTE NIVEL',
			'profilePage.dayStreakLabel' => 'Racha de Días',
			'profilePage.totalPoints' => 'Puntos Totales',
			'profilePage.savedWords' => 'Palabras Guardadas',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} elementos para revisar',
			'profilePage.logout' => 'Cerrar Sesión',
			'profilePage.logoutTitle' => 'Estás a punto de cerrar sesión',
			'profilePage.logoutBody' => '¡Hasta pronto! Vamos a extrañar tus ejercicios de respiración.',
			'profilePage.logoutConfirm' => 'CERRAR SESIÓN',
			'profilePage.logoutCancel' => 'CANCELAR',
			'profilePage.days.mon' => 'LUN',
			'profilePage.days.tue' => 'MAR',
			'profilePage.days.wed' => 'MIÉ',
			'profilePage.days.thu' => 'JUE',
			'profilePage.days.fri' => 'VIE',
			'profilePage.days.sat' => 'SÁB',
			'profilePage.days.sun' => 'DOM',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Tu certificado',
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
			'profilePage.certificateVerifyHint' => 'Cualquiera puede escanear el código QR para verificar tu logro.',
			'profilePage.certificateShare' => 'Compartir certificado',
			'profilePage.certificateShareQr' => 'Compartir código QR',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Cuando completes un nivel CEFR en Lingola, tu certificado aparecerá aquí — con tu nombre, nivel y un código QR para verificar.',
			'profilePage.certificatePreviewHint' => 'Completa una ruta de nivel para desbloquear tu certificado',
			'profilePage.certificateTapToView' => 'Toca para ver y compartir tu certificado',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Parece que tomaste un pequeño descanso.',
			'pushNotifications.h2.1' => '¿Tienes un momento para una palabra?',
			'pushNotifications.h2.2' => 'Estamos aquí — sin prisa.',
			'pushNotifications.h2.3' => 'Tu ritmo de aprendizaje se detuvo un poco.',
			'pushNotifications.h2.4' => 'Una mini revisión podría sentirse bien.',
			'pushNotifications.h4.0' => 'Una nueva palabra podría estar esperándote hoy 👀',
			'pushNotifications.h4.1' => 'Podrías disfrutar de una práctica rápida.',
			'pushNotifications.h4.2' => 'Quizás te perdiste una frase útil.',
			'pushNotifications.h4.3' => 'El progreso de hoy sigue abierto.',
			'pushNotifications.h4.4' => 'Una palabra, una frase… tal vez ambas.',
			'pushNotifications.h8.0' => 'No es necesario progresar todos los días.',
			'pushNotifications.h8.1' => 'Incluso una pequeña revisión cuenta.',
			'pushNotifications.h8.2' => 'No perdiste nada por no estudiar hoy.',
			'pushNotifications.h8.3' => 'Estamos listos cuando tú lo estés.',
			'pushNotifications.h8.4' => 'Aprender un idioma es un maratón, no una carrera.',
			'pushNotifications.h24.0' => 'Pasó un día. Tus palabras siguen aquí.',
			'pushNotifications.h24.1' => 'Tomar un descanso es normal.',
			'pushNotifications.h24.2' => 'Tu lugar está justo donde lo dejaste.',
			'pushNotifications.h24.3' => 'Continúa cuando quieras.',
			'pushNotifications.h24.4' => 'El idioma no se irá — nosotros tampoco.',
			'pushNotifications.lessonReminderTitle' => 'La lección de hoy te espera',
			'pushNotifications.lessonReminder.0' => 'Aún no entraste a la lección de hoy — 5 minutos cuentan.',
			'pushNotifications.lessonReminder.1' => 'Tu tutor está listo. Continúa donde lo dejaste.',
			'pushNotifications.lessonReminder.2' => 'Una lección corta mantiene tu ritmo.',
			'pushNotifications.lessonReminder.3' => 'La lección de hoy sigue abierta — ¿empezamos?',
			'pushNotifications.quizReminderTitle' => '¿Listo para un quiz rápido?',
			'pushNotifications.quizReminderWords' => ({required Object count, required Object savedCount}) => 'Aprendiste ${count} palabras recientemente — ¿un quiz? ${savedCount} palabras guardadas te esperan.',
			'pushNotifications.quizReminderSaved' => ({required Object savedCount}) => '${savedCount} palabras guardadas esperan repaso.',
			'pushNotifications.quizReminder.0' => 'Hace tiempo sin quiz — 3 minutos de repaso ayudan.',
			'pushNotifications.quizReminder.1' => 'Tus palabras guardadas te extrañan.',
			'pushNotifications.quizReminder.2' => 'Pon a prueba lo que recuerdas.',
			'pushNotifications.quizReminder.3' => 'Un quiz corto ahora facilita mañana.',
			'pushNotifications.eveningLessonTitle' => 'No pierdas la práctica de hoy',
			'pushNotifications.eveningLesson.0' => 'Aún no estudiaste hoy. Una lección corta mantiene el hábito.',
			'pushNotifications.eveningLesson.1' => 'Antes de que termine el día — ¿una lección rápida?',
			'pushNotifications.eveningLesson.2' => 'Aún hay tiempo para 5 minutos de inglés.',
			'pushNotifications.eveningLesson.3' => 'Tu lección diaria te espera.',
			'pushNotifications.streakReminderTitle' => 'Mantén tu racha',
			'pushNotifications.streakReminder' => ({required Object streak}) => 'Llevas ${streak} días de racha — una lección corta hoy la mantiene viva.',
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
