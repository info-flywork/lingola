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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$ru app = _Translations$app$ru._(_root);
	@override late final _Translations$common$ru common = _Translations$common$ru._(_root);
	@override late final _Translations$onboarding$ru onboarding = _Translations$onboarding$ru._(_root);
	@override late final _Translations$targetLanguage$ru targetLanguage = _Translations$targetLanguage$ru._(_root);
	@override late final _Translations$language$ru language = _Translations$language$ru._(_root);
	@override late final _Translations$setup$ru setup = _Translations$setup$ru._(_root);
	@override late final _Translations$accountCreating$ru accountCreating = _Translations$accountCreating$ru._(_root);
	@override late final _Translations$planReady$ru planReady = _Translations$planReady$ru._(_root);
	@override late final _Translations$demoChat$ru demoChat = _Translations$demoChat$ru._(_root);
	@override late final _Translations$previewChat$ru previewChat = _Translations$previewChat$ru._(_root);
	@override late final _Translations$paywall$ru paywall = _Translations$paywall$ru._(_root);
	@override late final _Translations$auth$ru auth = _Translations$auth$ru._(_root);
	@override late final _Translations$nav$ru nav = _Translations$nav$ru._(_root);
	@override late final _Translations$home$ru home = _Translations$home$ru._(_root);
	@override late final _Translations$libraryPage$ru libraryPage = _Translations$libraryPage$ru._(_root);
	@override late final _Translations$wordPracticePage$ru wordPracticePage = _Translations$wordPracticePage$ru._(_root);
	@override late final _Translations$quizPage$ru quizPage = _Translations$quizPage$ru._(_root);
	@override late final _Translations$placeholder$ru placeholder = _Translations$placeholder$ru._(_root);
	@override late final _Translations$tutorPage$ru tutorPage = _Translations$tutorPage$ru._(_root);
	@override late final _Translations$lessonPage$ru lessonPage = _Translations$lessonPage$ru._(_root);
	@override late final _Translations$rolePlayPage$ru rolePlayPage = _Translations$rolePlayPage$ru._(_root);
	@override late final _Translations$notificationsPage$ru notificationsPage = _Translations$notificationsPage$ru._(_root);
	@override late final _Translations$profilePage$ru profilePage = _Translations$profilePage$ru._(_root);
	@override late final _Translations$pushNotifications$ru pushNotifications = _Translations$pushNotifications$ru._(_root);
	@override late final _Translations$apiErrors$ru apiErrors = _Translations$apiErrors$ru._(_root);
}

// Path: app
class _Translations$app$ru implements Translations$app$en {
	_Translations$app$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Уведомления';
	@override String get streak => 'Серия обучения';
	@override String get profile => 'Профиль';
}

// Path: common
class _Translations$common$ru implements Translations$common$en {
	_Translations$common$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'ПРОДОЛЖИТЬ';
	@override String get back => 'НАЗАД';
	@override String get locked => 'Заблокировано';
	@override String minutes({required Object value}) => '${value} мин';
	@override String get close => 'Закрыть';
	@override String get getStarted => 'НАЧАТЬ';
	@override String get connectionError => 'Нет соединения. Проверьте интернет и попробуйте снова.';
	@override String get genericError => 'Что-то пошло не так. Пожалуйста, попробуйте снова.';
	@override String get tryAgain => 'Попробовать снова';
}

// Path: onboarding
class _Translations$onboarding$ru implements Translations$onboarding$en {
	_Translations$onboarding$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Страница ввода ${current} из ${total}';
	@override late final _Translations$onboarding$slide1$ru slide1 = _Translations$onboarding$slide1$ru._(_root);
	@override late final _Translations$onboarding$slide2$ru slide2 = _Translations$onboarding$slide2$ru._(_root);
	@override late final _Translations$onboarding$slide3$ru slide3 = _Translations$onboarding$slide3$ru._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$ru implements Translations$targetLanguage$en {
	_Translations$targetLanguage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выберите язык, который хотите выучить';
	@override String get comingSoon => 'Скоро будут доступны новые языки';
	@override String get korean => 'Корейский';
	@override String get portuguese => 'Португальский';
	@override String get portugueseBrazil => 'Португальский (Бразилия)';
	@override String get german => 'Немецкий';
	@override String get italian => 'Итальянский';
	@override String get simplifiedChinese => 'Упрощенный китайский';
	@override String get arabic => 'Арабский';
	@override String get turkish => 'Турецкий';
	@override String get hindi => 'Хинди';
}

// Path: language
class _Translations$language$ru implements Translations$language$en {
	_Translations$language$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Шаг ${current} из ${total}';
	@override String get title => 'На каком языке ты хочешь говорить?';
	@override String get nativeSection => 'Я говорю';
	@override String get nativeField => 'Родной язык';
	@override String get nativeName => 'Турецкий';
	@override String get targetSection => 'Я хочу учить';
	@override String get targetField => 'Целевой язык';
	@override String get targetName => 'Английский';
	@override String get direction => 'Направление языка';
	@override String get selectLanguage => 'Выбери язык';
	@override String get comingSoonBadge => 'Скоро будет...';
	@override String get english => 'Английский';
	@override String get french => 'Французский';
	@override String get japanese => 'Японский';
	@override String get spanish => 'Испанский';
	@override String get russian => 'Русский';
}

// Path: setup
class _Translations$setup$ru implements Translations$setup$en {
	_Translations$setup$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Какова ваша цель?';
	@override String get goalCareer => 'Развитие карьеры';
	@override String get goalTravel => 'Путешествия';
	@override String get goalLiving => 'Жизнь за границей';
	@override String get goalStudying => 'Учёба за границей';
	@override String get goalOther => 'Другое';
	@override String get levelTitle => 'Какой у вас текущий уровень языка?';
	@override String get paceTitle => 'Как быстро вы хотите улучшаться?';
	@override String get explanationTitle => 'Когда ты задаёшь вопросы на своём языке, как объяснять?';
	@override String get explanationHint => 'Это можно изменить в любой момент в настройках профиля.';
	@override String get explanationNative => 'Объяснять на моём родном языке';
	@override String get explanationEnglish => 'Объяснять на английском';
	@override String get levelA1 => 'A1 — Знаю несколько слов';
	@override String get levelA2 => 'A2 — Могу использовать простые фразы';
	@override String get levelB1 => 'B1 — Веду повседневные разговоры';
	@override String get levelB2 => 'B2 — Свободно общаюсь на знакомые темы';
	@override String get levelC1 => 'C1 — Продвинутый, хочу улучшить';
	@override String get levelC2 => 'C2 — Почти родной уровень';
	@override String get paceMin5 => '5 мин/день';
	@override String get paceMin10 => '10 мин/день';
	@override String get paceMin15 => '15 мин/день';
	@override String get paceMin30 => '30 мин/день';
	@override String get paceMin60 => '60 мин/день';
}

// Path: accountCreating
class _Translations$accountCreating$ru implements Translations$accountCreating$en {
	_Translations$accountCreating$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ваш личный аккаунт создается';
	@override String get stepContent => 'Создается контент';
	@override String get stepDialogues => 'Готовятся диалоги';
	@override String get stepLessons => 'Оптимизируются уроки';
	@override String get stepPlan => 'Ваш план завершается';
	@override String get optimization => 'Оптимизация';
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
class _Translations$planReady$ru implements Translations$planReady$en {
	_Translations$planReady$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

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
	@override String get paceMin5 => '5 мин/день';
	@override String get paceMin10 => '10 мин/день';
	@override String get paceMin15 => '15 мин/день';
	@override String get paceMin30 => '30 мин/день';
	@override String get paceMin60 => '60 мин/день';
}

// Path: demoChat
class _Translations$demoChat$ru implements Translations$demoChat$en {
	_Translations$demoChat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$ru implements Translations$previewChat$en {
	_Translations$previewChat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Урок 1: Приветствия';
	@override String get speed => '1x';
	@override String get typeMessage => 'Напишите сообщение...';
	@override String get incoming1 => 'Привет! Добро пожаловать в Lingola — я твой AI-наставник. Какой бы ни был твой уровень, здесь ты в безопасности и спокойно учишь английский. По-английски «привет» — это \'Hi\' или \'Hello\'. Попробуй: напиши мне \'Hi!\' по-английски!';
	@override String get outgoing1 => 'Привет! Я готов практиковаться.';
	@override String get incoming2Highlight => 'Доброе утро';
	@override String get incoming2Rest => ', Emrah! Рад, что ты готов. Утренний кофе — всегда отличный способ начать общение. О чем бы ты хотел поговорить?';
	@override String get holdToSpeak => 'Удерживайте, чтобы говорить';
	@override String get recording => 'Запись… отпустите, чтобы отправить';
	@override String get slideUpToLock => 'Проведите вверх, чтобы закрепить';
	@override String get slideLeftToCancel => 'Проведите влево, чтобы отменить';
	@override String get recordingLockedHint => 'Нажмите «Отправить», когда закончите';
}

// Path: paywall
class _Translations$paywall$ru implements Translations$paywall$en {
	_Translations$paywall$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Начни говорить сегодня — бесплатно';
	@override String get subtitle => 'Неограниченные возможности для обучения';
	@override String get noCommitment => 'Без обязательств';
	@override String get cancelAnytime => 'Отменить в любое время';
	@override String get noPaymentToday => 'Сегодня без оплаты';
	@override String get daysFree => '3 дня бесплатно';
	@override String get thenPrice => 'Затем \$1.99/месяц';
	@override String get trialActive => 'Бесплатный пробный период активен';
	@override String get payableToday => 'Оплата сегодня';
	@override String get payableValue => '3 дня бесплатно 0.00\$';
	@override String get paymentDate => 'Дата платежа: 13 марта 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$ru implements Translations$auth$en {
	_Translations$auth$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Наши разнообразные AI-тренеры';
	@override String get title => 'Начни говорить на новом языке сегодня';
	@override String get body => 'Практикуй реальные разговоры с AI.\nБез давления. Без осуждения.';
	@override String get continueGoogle => 'Продолжить с Google';
	@override String get continueApple => 'Продолжить с Apple';
	@override String get continueGuest => 'Продолжить как Гость';
	@override String get or => 'или';
	@override String get alreadyHaveAccount => 'Уже есть аккаунт?';
	@override String get signIn => 'Войти';
	@override String get legal => 'Регистрируясь в Lingola, вы принимаете Условия обслуживания. Подробнее о том, как мы обрабатываем данные: Политика конфиденциальности и Политика использования файлов cookie';
	@override String get terms => 'Условия обслуживания';
	@override String get privacy => 'Политика конфиденциальности';
	@override String get cookies => 'Политика использования файлов cookie';
}

// Path: nav
class _Translations$nav$ru implements Translations$nav$en {
	_Translations$nav$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Главная';
	@override String get tutor => 'Наставник';
	@override String get lesson => 'Урок';
	@override String get rolePlay => 'Ролевая игра';
	@override String get profile => 'Профиль';
}

// Path: home
class _Translations$home$ru implements Translations$home$en {
	_Translations$home$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Доброе утро, Jhon';
	@override String get todayPractice => 'Практика на сегодня';
	@override String get continueConversation => 'Продолжить разговор';
	@override String continueWithTutor({required Object name}) => 'Продолжить с ${name} или выбрать другого преподавателя?';
	@override String continueSameTutor({required Object name}) => 'Продолжить с ${name}';
	@override String get chooseOtherTutor => 'Выбрать другого преподавателя';
	@override String minutesLeft({required Object value}) => 'Осталось ${value} мин';
	@override String get lessonProgress => 'Урок 2 — Приветствия';
	@override String get timeCurrent => '0мин';
	@override String get timeTotal => '/ 15мин';
	@override String get kContinue => 'Продолжить';
	@override String get learningPath => 'A1 - Начальный';
	@override String get allLessons => 'Все уроки';
	@override String get introductions => 'Знакомства I';
	@override String get greetings => 'Приветствия';
	@override String get jobs => 'Работы';
	@override String get favoriteRoom => 'Любимая комната';
	@override String get dailyRoutine => 'Ежедневная рутина';
	@override String get scroll => 'Прокрутить';
	@override String get liveLesson => 'Живой урок';
	@override String get liveLessonSubtitle => 'Проведите видеозвонок с нашим репетитором';
	@override String get moreTutor => 'Еще репетиторы';
	@override String get startTalkNow => 'Начать разговор сейчас';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Адаптивный';
	@override String get tagCalm => 'Спокойный';
	@override String get tagPatient => 'Терпеливый';
	@override String get tagMethodical => 'Методичный';
	@override String get tagEncouraging => 'Поддерживающий';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Больше функций';
	@override String get practiceLabel => 'ПРАКТИКА';
	@override String get wordPractice => 'Практика слов';
	@override String get wordPracticeBody => 'Ежедневно пополняйте свой словарный запас на выбранном языке';
	@override String get immersiveLabel => 'Погружающий';
	@override String get quiz => 'Викторина';
	@override String get quizBodyLine1 => 'Учитесь на реальных';
	@override String get quizBodyLine2 => 'примерах в контексте';
	@override String get getStarted => 'Начать';
	@override String get library => 'Библиотека';
	@override String get libraryTitle => 'Учитесь и сохраняйте';
	@override String get learnMore => 'Узнать больше';
	@override late final _Translations$home$premium$ru premium = _Translations$home$premium$ru._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$ru implements Translations$libraryPage$en {
	_Translations$libraryPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Библиотека';
	@override String get searchWord => 'Поиск слова';
	@override String savedWordCount({required Object count}) => '${count} Сохраненное слово';
	@override String get savedWordTab => 'Сохраненные слова';
	@override String get dictionaryTab => 'Словарь';
	@override String get dictionaryLabel => 'Словарь';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$ru implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Практика слов';
	@override String get turkish => 'ТУРЕЦКИЙ';
	@override String get save => 'Сохранить';
	@override String get saved => 'Сохранено';
	@override String get listen => 'Слушать';
	@override String get hint => 'Подсказка';
	@override String get previous => 'ПРЕДЫДУЩИЙ';
	@override String get next => 'СЛЕДУЮЩИЙ';
}

// Path: quizPage
class _Translations$quizPage$ru implements Translations$quizPage$en {
	_Translations$quizPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Викторина';
	@override String get headline => 'Что ты хочешь улучшить сегодня?';
	@override String get subtitle => 'Выбери свою тренировку — займет меньше 3 минут 🚀';
	@override String get readingTitle => 'Чтение';
	@override String get readingBody => 'Понимание через статьи и истории';
	@override String get writingTitle => 'Письмо';
	@override String get writingBody => 'Упражнения по грамматике и словарному запасу';
	@override String get speakingTitle => 'Говорение';
	@override String get speakingBody => 'Произношение с помощью AI-движка речи';
	@override String get readingTestTitle => 'Тест на чтение';
	@override String get read => 'Читать';
	@override String get listeningHint => 'Четко произнеси английское слово...';
	@override String get micPermissionDenied => 'Микрофон или распознавание речи недоступны.';
	@override String get matchSuccess => 'Отлично! Это соответствует слову.';
	@override String matchFail({required Object heard}) => 'Слышал "${heard}". Попробуй еще раз.';
	@override String get successfulTitle => 'Успешно!';
	@override String get successfulBody => 'Произношение как у носителя языка!';
	@override String get failedTitle => 'Неудача';
	@override String get failedBody => 'Почти получилось, дай еще один шанс';
	@override String get tryAgain => 'ПОПРОБУЙ ЕЩЕ РАЗ';
	@override String get writingTestTitle => 'Тест на письмо';
	@override String get sourceLanguage => 'ИСТОЧНИКОВЫЙ ЯЗЫК';
	@override String get answer => 'ОТВЕТ';
	@override String get writeAnswerHint => 'Напиши свой ответ здесь...';
	@override String get submit => 'Отправить';
	@override String get speakingTestTitle => 'Тест на говорение';
	@override String get speakingProficiency => 'Уровень говорения';
	@override String get speakClearlyHint => 'Говори четко в микрофон:';
	@override String get speakUp => 'Говори громче';
	@override String get recording => 'Запись...';
	@override String questionOf({required Object current, required Object total}) => 'ВОПРОС ${current} ИЗ ${total}';
}

// Path: placeholder
class _Translations$placeholder$ru implements Translations$placeholder$en {
	_Translations$placeholder$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} в пути';
	@override String body({required Object tab}) => 'Мы готовим для вас сосредоточенный опыт с ${tab}.';
}

// Path: tutorPage
class _Translations$tutorPage$ru implements Translations$tutorPage$en {
	_Translations$tutorPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Наставник';
	@override String get chatWithLingola => 'Чат с Lingola';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => 'Чат с ${name}';
	@override String get chatHistory => 'История чата';
	@override String get history => 'История';
	@override String get filter => 'Фильтр';
	@override String get country => 'Страна';
	@override String get focus => 'Фокус';
	@override String get moreCountries => '8+ ещё';
	@override String get moreFocus => '+8';
	@override String get save => 'СОХРАНИТЬ';
	@override String get clearFilter => 'Сбросить фильтры';
	@override String get startTalkNow => 'Начать разговор сейчас';
	@override String get typeMessage => 'Введите сообщение...';
	@override String get speaker => 'Спикер';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$ru tutors = _Translations$tutorPage$tutors$ru._(_root);
	@override late final _Translations$tutorPage$tags$ru tags = _Translations$tutorPage$tags$ru._(_root);
	@override String get historyPreview1 => 'Привет! Я уже заскучал...';
	@override String get historyPreview2 => 'Сегодня попрактикуемся заказывать еду?';
	@override String get time1 => '11:00';
	@override String get time2 => 'Вчера';
	@override late final _Translations$tutorPage$chat$ru chat = _Translations$tutorPage$chat$ru._(_root);
	@override late final _Translations$tutorPage$calling$ru calling = _Translations$tutorPage$calling$ru._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$ru implements Translations$lessonPage$en {
	_Translations$lessonPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Продолжай учиться';
	@override String get profile => 'Профиль';
	@override String get language => 'Целевой язык';
	@override String get completed => 'Завершено';
	@override String get locked => 'Заблокировано';
	@override String get pickTutorTitle => 'Выбери своего преподавателя';
	@override String get startTalk => 'Начать урок';
	@override String get chatInstead => 'Чат вместо этого';
	@override String get lockedHint => 'Закончите предыдущий урок, чтобы разблокировать этот.';
	@override String get levelLockedTitle => 'Уровень закрыт';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Ваш уровень английского — ${userLevel}, поэтому уроки ${lessonLevel} недоступны без прохождения предыдущего пути.';
	@override String get levelLockedOk => 'Понятно';
	@override String get notesTitle => 'Заметки к уроку';
	@override String get whatWeLearned => 'Что мы узнали сегодня';
	@override String get deleteNotes => 'Удалить мои заметки к уроку';
	@override String get deleteNotesConfirm => 'Удалить эти заметки? Это действие нельзя отменить.';
	@override String get delete => 'Удалить';
	@override String get cancel => 'Отмена';
	@override String get practiceCta => 'Если это было слишком сложно, вы можете снова попрактиковаться в той же теме.';
	@override String get practiceNow => 'Практиковаться в этой теме';
	@override String get openChat => 'Открыть чат с преподавателем';
	@override String get yourScore => 'Ваш балл';
	@override String bestScore({required Object score}) => 'Лучший ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Пассивный участник';
	@override String get participationSilentBody => 'На этот раз вы молчали. Думаю, вам стоит повторить этот урок.';
	@override String get participationPassive => 'Низкое участие';
	@override String get participationPassiveBody => 'Вы почти не говорили. Попробуйте урок снова и говорите больше.';
	@override String get participationActive => 'Хорошее участие';
	@override String get participationActiveBody => 'Вы присоединились к разговору. Так держать!';
	@override String get participationStrong => 'Сильное участие';
	@override String get participationStrongBody => 'Вы много говорили. Отличная работа!';
	@override String get retakeLesson => 'Повторить этот урок';
	@override String get finishLesson => 'Закончить урок';
	@override String get savingNotes => 'Ваш преподаватель пишет заметки к сегодняшнему уроку...';
	@override String get noNotes => 'Закончите этот урок, чтобы получить заметки от вашего преподавателя.';
	@override String get notesDeleted => 'Заметки к уроку удалены';
	@override late final _Translations$lessonPage$levels$ru levels = _Translations$lessonPage$levels$ru._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$ru implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ролевая Игра';
	@override String get subtitle => 'Выберите свою роль — испытайте сценарий из реальной жизни 🎭';
	@override String progressCompleted({required Object value}) => '%${value} завершено';
	@override String minutes({required Object value}) => '${value} мин';
	@override String get beginner => 'Начинающий';
	@override String get screenplay => 'СЦЕНАРИЙ';
	@override String get dailyInteractions => 'Ежедневные Взаимодействия';
	@override String get business => 'Бизнес';
	@override late final _Translations$rolePlayPage$coffee$ru coffee = _Translations$rolePlayPage$coffee$ru._(_root);
	@override late final _Translations$rolePlayPage$directions$ru directions = _Translations$rolePlayPage$directions$ru._(_root);
	@override late final _Translations$rolePlayPage$interview$ru interview = _Translations$rolePlayPage$interview$ru._(_root);
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
	@override late final _Translations$rolePlayPage$missedTrain$ru missedTrain = _Translations$rolePlayPage$missedTrain$ru._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$ru flightAttendant = _Translations$rolePlayPage$flightAttendant$ru._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$ru trainTicket = _Translations$rolePlayPage$trainTicket$ru._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$ru restaurantReservation = _Translations$rolePlayPage$restaurantReservation$ru._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$ru doctorAppointment = _Translations$rolePlayPage$doctorAppointment$ru._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$ru shoppingClothes = _Translations$rolePlayPage$shoppingClothes$ru._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$ru takingTaxi = _Translations$rolePlayPage$takingTaxi$ru._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$ru rentingApartment = _Translations$rolePlayPage$rentingApartment$ru._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$ru birthdayParty = _Translations$rolePlayPage$birthdayParty$ru._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$ru implements Translations$notificationsPage$en {
	_Translations$notificationsPage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Уведомления';
	@override String get deleteConfirmTitle => 'Вы уверены?';
	@override String get deleteConfirmBody => 'Это уведомление будет удалено.';
	@override String get delete => 'Удалить';
	@override String get cancel => 'Отмена';
	@override late final _Translations$notificationsPage$translation$ru translation = _Translations$notificationsPage$translation$ru._(_root);
	@override late final _Translations$notificationsPage$offer$ru offer = _Translations$notificationsPage$offer$ru._(_root);
	@override late final _Translations$notificationsPage$stories$ru stories = _Translations$notificationsPage$stories$ru._(_root);
	@override late final _Translations$notificationsPage$practice$ru practice = _Translations$notificationsPage$practice$ru._(_root);
	@override late final _Translations$notificationsPage$streak$ru streak = _Translations$notificationsPage$streak$ru._(_root);
	@override late final _Translations$notificationsPage$premium$ru premium = _Translations$notificationsPage$premium$ru._(_root);
	@override String get emptyTitle => 'Уведомлений пока нет';
	@override String get emptySubtitle => 'Не забудьте заглянуть сюда снова, когда получите уведомление.';
}

// Path: profilePage
class _Translations$profilePage$ru implements Translations$profilePage$en {
	_Translations$profilePage$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override String get userName => 'Джон Доу';
	@override String get freeVersion => 'Бесплатная версия';
	@override String get dayStreak => 'День непрерывности!';
	@override String get accountSettings => 'Настройки аккаунта';
	@override String get general => 'Общие';
	@override String get profileSettings => 'Настройки профиля';
	@override String get fullName => 'Полное имя';
	@override String get email => 'Электронная почта';
	@override String get deleteAccount => 'Удалить аккаунт';
	@override String get save => 'СОХРАНИТЬ';
	@override String get deleteTitle => 'Мы не хотим, чтобы ты уходил, но мы понимаем.';
	@override String get deleteBody => 'Скажи нам, почему ты хочешь уйти, чтобы мы могли улучшить опыт использования Lingola?';
	@override late final _Translations$profilePage$deleteReasons$ru deleteReasons = _Translations$profilePage$deleteReasons$ru._(_root);
	@override String get messageOptional => 'Сообщение (по желанию)';
	@override String get messageHint => 'Если у тебя есть сообщение, напиши его.';
	@override String get next => 'ДАЛЕЕ';
	@override String get specialOfferTitle => 'Специальное предложение';
	@override String get specialOfferBody => 'Посмотри на предложение, которое мы подготовили для тебя перед уходом.';
	@override String get monthlyPlanTitle => 'Перейти на месячный план';
	@override String get monthlyPlanPrice => '\$79/месяц, отмена в любое время';
	@override String get monthlyPlanDesc => 'Без долгосрочных обязательств. Оставайся на связи с нашим сообществом на месячной основе.';
	@override String get whatYoullKeep => 'Что ты сохранишь:';
	@override String get keepCharacters => 'Доступ ко всем персонажам';
	@override String get keepVideo => 'Неограниченные видеозвонки';
	@override String get keepCourses => 'Доступ ко всем курсам';
	@override String get switchMonthlyCta => 'Перейти на месячный план';
	@override String get confirmTitle => 'Ты уверен?';
	@override String get confirmBody => 'Мы действительно не хотим, чтобы ты уходил. Вот что ты потеряешь:';
	@override String get loseCharacters => 'Неограниченный доступ к персонажам';
	@override String get loseVideo => 'Неограниченный доступ к видеозвонкам';
	@override String get loseCourses => 'Доступ ко всем курсам';
	@override String get discountTitle => 'Останься и получи 60% скидку на 1 месяц';
	@override String get discountSubtitle => 'Наше лучшее предложение. Всего \$27.60/месяц';
	@override String get acceptDiscountCta => 'Принять 60% скидку и остаться';
	@override String get farewellTitle => 'Нам грустно видеть тебя уходящим';
	@override String farewellBody({required Object date}) => 'Твое членство отменено. Ты будешь иметь доступ до конца текущего расчетного периода ${date}.';
	@override String get changeMindTitle => '✨ Передумал?';
	@override String changeMindBody({required Object date}) => 'Ты можешь восстановить свое членство в любое время до ${date}, чтобы сохранить свои преимущества.';
	@override String get reactivateCta => 'Подожди, я хочу восстановить';
	@override String get done => 'ГОТОВО';
	@override String get notifications => 'Уведомления';
	@override String get appLanguage => 'Язык приложения';
	@override String get explanationLanguage => 'Язык объяснений';
	@override String get explanationNative => 'Родной язык';
	@override String get explanationEnglish => 'Английский';
	@override String get explanationUpdateFailed => 'Не удалось обновить язык объяснений';
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
	@override String get remindMe => 'Напомнить';
	@override String get reminderSave => 'Сохранить';
	@override String get reminderSaved => 'Напоминание сохранено';
	@override String get selectLanguageTitle => 'Выбрать язык';
	@override String get premium => 'Премиум';
	@override String get passive => 'Пассивный';
	@override String get active => 'Активен';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Поделиться с другом';
	@override String get shareWithFriendTitle => 'Поделиться с другом';
	@override String get shareInviteBody => 'Пригласи своих друзей и наслаждайтесь переводом вместе';
	@override String get rateUs => 'Оцените нас';
	@override String get faq => 'Часто задаваемые вопросы Lingola';
	@override late final _Translations$profilePage$faqItems$ru faqItems = _Translations$profilePage$faqItems$ru._(_root);
	@override String get support => 'Поддержка';
	@override String get feedback => 'Обратная связь';
	@override String get progression => 'Прогресс';
	@override String get progressTitle => 'Прогресс';
	@override String get goodMorning => 'Доброе утро,';
	@override String get progressUserName => 'Джон';
	@override String get progressLanguage => 'Английский';
	@override String get past7Days => 'Последние 7 дней';
	@override String get past7DaysBody => 'Учись каждый день, чтобы создать свою непрерывность и выработать мощную привычку обучения.';
	@override String get currentLevel => 'Текущий уровень';
	@override String xpLeft({required Object xp, required Object level}) => 'Осталось всего ${xp} XP до достижения ${level}!';
	@override String get toNextLevel => 'К СЛЕДУЮЩЕМУ УРОВНЮ';
	@override String get dayStreakLabel => 'День непрерывности';
	@override String get totalPoints => 'Всего очков';
	@override String get savedWords => 'Сохраненные слова';
	@override String itemsToReview({required Object count}) => '${count} элементов для проверки';
	@override String get logout => 'Выйти';
	@override String get logoutTitle => 'Вы собираетесь выйти';
	@override String get logoutBody => 'Увидимся снова скоро! Нам будут не хватать твоих дыхательных упражнений.';
	@override String get logoutConfirm => 'ВЫЙТИ';
	@override String get logoutCancel => 'ОТМЕНА';
	@override late final _Translations$profilePage$days$ru days = _Translations$profilePage$days$ru._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Ваш сертификат';
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
	@override String get certificateVerifyHint => 'Любой может отсканировать QR-код, чтобы подтвердить ваше достижение.';
	@override String get certificateShare => 'Поделиться сертификатом';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => 'Сертификат недоступен';
	@override String certificateNotAvailable({required Object level}) => 'Вы пока не можете использовать этот сертификат, так как не завершили уроки уровня ${level}.';
	@override String get certificateNotAvailableOk => 'Понятно';
	@override String get certificateShareQr => 'Поделиться QR-кодом';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Когда вы завершите уровень CEFR в Lingola, ваш сертификат появится здесь — с вашим именем, уровнем и QR-кодом для проверки.';
	@override String get certificatePreviewHint => 'Пройдите путь уровня, чтобы открыть сертификат';
	@override String get certificateTapToView => 'Нажмите, чтобы просмотреть и поделиться сертификатом';
	@override String get settings => 'Настройки';
	@override String get dailyGoalValueLight => '5-10 мин/день';
	@override String get dailyGoalValueRecommended => '15-20 мин/день';
	@override String get dailyGoalValueFast => '30+ мин/день';
	@override String get settingsShare => 'Share';
	@override String get settingsSupport => 'Support';
	@override String get settingsAbout => 'About';
	@override String get settingsAccount => 'Account';
	@override String get followInstagram => 'Follow on Instagram';
	@override String get followTikTok => 'Follow on TikTok';
}

// Path: pushNotifications
class _Translations$pushNotifications$ru implements Translations$pushNotifications$en {
	_Translations$pushNotifications$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Похоже, вы сделали короткий перерыв.',
		'Есть минутка для одного слова?',
		'Мы здесь — не спешите.',
		'Ваш ритм обучения немного приостановился.',
		'Мини-обзор может быть приятным.',
	];
	@override List<String> get h4 => [
		'Сегодня вас может ждать новое слово 👀',
		'Возможно, вам захочется немного попрактиковаться.',
		'Вы могли пропустить полезную фразу.',
		'Прогресс на сегодня все еще открыт.',
		'Одно слово, одно предложение… может быть, оба.',
	];
	@override List<String> get h8 => [
		'Каждый день прогресс не обязателен.',
		'Даже небольшой обзор имеет значение.',
		'Вы ничего не потеряли, не занимаясь сегодня.',
		'Мы готовы, когда вы будете готовы.',
		'Изучение языка — это марафон, а не спринт.',
	];
	@override List<String> get h24 => [
		'Прошел день. Ваши слова все еще здесь.',
		'Перерыв — это нормально.',
		'Ваше место там, где вы его оставили.',
		'Продолжайте, когда захотите.',
		'Язык не убегает — и мы тоже.',
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
class _Translations$apiErrors$ru implements Translations$apiErrors$en {
	_Translations$apiErrors$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$ru implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Говорите уверенно за недели — а не месяцы';
	@override String get body => 'Практикуйте реальные разговоры с ИИ. Улучшайте свой акцент, уверенность и беглость каждый день.';
	@override String get testimonialName => 'Сара Уильямс, 24';
	@override String get testimonialBody => 'Раньше я не могла говорить по-английски. Теперь я говорю каждый день на работе.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$ru implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Личный репетитор без высокой цены';
	@override String get body => 'Реальные разговоры. Мгновенная обратная связь.\nБез расписания. Без давления.';
	@override String get realTutor => 'Настоящий репетитор';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / ч';
	@override String get priceLingola => '\$9.99 / год';
	@override String get versus => 'VS';
	@override String get scheduled => 'Запланировано';
	@override String get anytime => 'В любое время';
	@override String get stressful => 'Стрессово';
	@override String get noPressure => 'Без давления';
	@override String get price => 'Цена';
	@override String get availability => 'Доступность';
	@override String get feeling => 'Чувство';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$ru implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'План обучения, созданный для вас';
	@override String get body => 'Ваши цели, ваш темп, ваш уровень.\nОт новичка до свободного владения — шаг за шагом.';
	@override String get goal => 'Цель';
	@override String get practice => 'Практика';
	@override String get progress => 'Прогресс';
}

// Path: home.premium
class _Translations$home$premium$ru implements Translations$home$premium$en {
	_Translations$home$premium$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Путь к ';
	@override String get titleHighlight => 'свободному разговору';
	@override String get titleAfter => ' без страха делать ошибки.';
	@override String get descriptionBefore => 'Присоединяйтесь к миллионам студентов по всему миру. Начните преодолевать языковой барьер сегодня — ';
	@override String get descriptionHighlight => 'первые 3 дня совершенно бесплатно.';
	@override String get feature1 => 'AI репетитор доступный 24/7';
	@override String get feature2 => 'Неограниченный доступ к частным репетиторам';
	@override String get feature3 => 'Ежедневный план уроков, адаптированный под вас';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/мес';
	@override String get discount => 'Скидка 40% при годовой подписке';
	@override String get cta => 'Начать';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$ru implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get lingola => 'Lingola';
	@override String get zephyrion => 'Zephyrion';
	@override String get vaelen => 'Vaelen';
	@override String get elrion => 'Elrion';
	@override String get ukrath => 'Ukrath';
	@override String get elena => 'Елена';
	@override String get kenji => 'Кенджи';
	@override String get freya => 'Фрея';
	@override String get camila => 'Камила';
	@override String get marco => 'Марко';
	@override String get julian => 'Юлиан';
	@override String get ines => 'Инес';
	@override String get felix => 'Феликс';
	@override String get diego => 'Диего';
	@override String get amara => 'Амара';
	@override String get erik => 'Эрик';
	@override String get katie => 'Кэти';
	@override String get morgan => 'Морган';
	@override String get santa => 'Дед Мороз';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$ru implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Адаптивный';
	@override String get calm => 'Спокойный';
	@override String get patient => 'Терпеливый';
	@override String get organized => 'Организованный';
	@override String get relaxed => 'Расслабленный';
	@override String get methodical => 'Методичный';
	@override String get attentive => 'Внимательный';
	@override String get more => '+5';
	@override String get curious => 'Любопытный';
	@override String get observer => 'Наблюдатель';
	@override String get ancientKnowledge => 'Древние знания';
	@override String get wise => 'Мудрый';
	@override String get clear => 'Ясный';
	@override String get decisive => 'Решительный';
	@override String get disciplined => 'Дисциплинированный';
	@override String get smart => 'Умный';
	@override String get analytic => 'Аналитический';
	@override String get cheerful => 'Весёлый';
	@override String get generous => 'Щедрый';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$ru implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Доброе утро! Рад, что ты готов практиковаться сегодня.';
	@override String get outgoing1 => 'Да, давай начнём с приветствий.';
	@override String get incoming2 => 'Отлично. Как бы ты поздоровался с коллегой?';
	@override String get typing => 'Печатает';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$ru implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Урок 1 : Приветствия';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Урок ${number} : ${title}';
	@override String get nativeLine => 'Скучно?';
	@override String get englishLine => 'Скучно? Я вычеркнул это слово из своего словаря. Вставай, план уже готов: мы идём в новый аркадный бар в Кадыкёе.';
	@override String get highlight => 'Скучно?';
	@override String get close => 'Завершить звонок';
	@override String get toggleCaptions => 'Переключить субтитры';
	@override String get toggleHints => 'Переключить подсказки';
	@override String get toggleMic => 'Переключить микрофон';
	@override String get tapToSpeakHint => 'Нажми, чтобы говорить, нажми снова, чтобы закончить';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$ru implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$ru a1 = _Translations$lessonPage$levels$a1$ru._(_root);
	@override late final _Translations$lessonPage$levels$a2$ru a2 = _Translations$lessonPage$levels$a2$ru._(_root);
	@override late final _Translations$lessonPage$levels$b1$ru b1 = _Translations$lessonPage$levels$b1$ru._(_root);
	@override late final _Translations$lessonPage$levels$b2$ru b2 = _Translations$lessonPage$levels$b2$ru._(_root);
	@override late final _Translations$lessonPage$levels$c1$ru c1 = _Translations$lessonPage$levels$c1$ru._(_root);
	@override late final _Translations$lessonPage$levels$c2$ru c2 = _Translations$lessonPage$levels$c2$ru._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$ru implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Заказ в Кофейне';
	@override String get screenplay => 'Закажите свой любимый напиток, спросите о размерах и добавках, подтвердите общую сумму и заберите кофе на стойке.';
	@override late final _Translations$rolePlayPage$coffee$chat$ru chat = _Translations$rolePlayPage$coffee$chat$ru._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$ru implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Спросить Направление на Улице';
	@override String get screenplay => 'Спросите направление к месту, узнайте, как добраться до метро или автобуса, получите информацию о билетах и послушайте рекомендации по ресторанам.';
	@override late final _Translations$rolePlayPage$directions$chat$ru chat = _Translations$rolePlayPage$directions$chat$ru._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$ru implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Собеседование';
	@override String get screenplay => 'Представьтесь, ответьте на общие вопросы собеседования, расскажите о своем опыте и спросите о роли и следующих шагах.';
	@override late final _Translations$rolePlayPage$interview$chat$ru chat = _Translations$rolePlayPage$interview$chat$ru._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$ru implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$ru chat = _Translations$rolePlayPage$missedTrain$chat$ru._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$ru implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$ru chat = _Translations$rolePlayPage$flightAttendant$chat$ru._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$ru implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$ru chat = _Translations$rolePlayPage$trainTicket$chat$ru._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$ru implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$ru chat = _Translations$rolePlayPage$restaurantReservation$chat$ru._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$ru implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$ru chat = _Translations$rolePlayPage$doctorAppointment$chat$ru._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$ru implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$ru chat = _Translations$rolePlayPage$shoppingClothes$chat$ru._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$ru implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$ru chat = _Translations$rolePlayPage$takingTaxi$chat$ru._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$ru implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$ru chat = _Translations$rolePlayPage$rentingApartment$chat$ru._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$ru implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$ru chat = _Translations$rolePlayPage$birthdayParty$chat$ru._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$ru implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Новая перевод готова';
	@override String get body => 'Ваш аудиофайл перевода успешно преобразован в текст и переведен.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$ru implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вас ждет специальное предложение';
	@override String get body => 'Переходите на Premium для неограниченных переводов фотографий со скидкой 50%.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$ru implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Откройте для себя новые истории';
	@override String get body => 'Учите новые слова через истории';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$ru implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$ru implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$ru implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$ru implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Я не нашел персонажей с искусственным интеллектом реалистичными.';
	@override String get videoIssues => 'У меня возникают технические проблемы с видеозвонками.';
	@override String get pricing => 'Цены на подписку выше моих ожиданий.';
	@override String get noMatch => 'Я не нашел персонажей, которые мне подходят.';
	@override String get shortTrial => 'Я хотел попробовать всего на короткий срок.';
	@override String get other => 'Другое';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$ru implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$ru supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$ru._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$ru howAiWorks = _Translations$profilePage$faqItems$howAiWorks$ru._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$ru offlineUse = _Translations$profilePage$faqItems$offlineUse$ru._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$ru isFree = _Translations$profilePage$faqItems$isFree$ru._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$ru pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$ru._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$ru dailyPractice = _Translations$profilePage$faqItems$dailyPractice$ru._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$ru levelDetermination = _Translations$profilePage$faqItems$levelDetermination$ru._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$ru realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$ru._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$ru dataSecurity = _Translations$profilePage$faqItems$dataSecurity$ru._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$ru disableReminders = _Translations$profilePage$faqItems$disableReminders$ru._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$ru implements Translations$profilePage$days$en {
	_Translations$profilePage$days$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get mon => 'ПН';
	@override String get tue => 'ВТ';
	@override String get wed => 'СР';
	@override String get thu => 'ЧТ';
	@override String get fri => 'ПТ';
	@override String get sat => 'СБ';
	@override String get sun => 'ВС';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$ru implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Начальный';
	@override List<String> get lessons => [
		'Приветствия',
		'Знакомство I',
		'Профессии',
		'Любимая комната',
		'Ежедневная рутина',
		'Фрукты',
		'Советы 1',
		'Семья 1',
		'Повседневные вещи',
		'Родной город',
		'Дом',
		'Предпочтения в еде',
		'Хобби 1',
		'Успешные люди',
		'Еда и напитки',
		'Заказ в ресторане',
		'Домашние животные',
		'Здоровье и фитнес',
		'Погода',
		'Новый образ жизни',
		'Становиться лучше',
		'Хобби 2',
		'Вопросы о местах',
		'Принадлежность',
		'Шоппинг 1',
		'Сколько времени',
		'Направления 1',
		'Шоппинг 2',
		'Познакомимся',
		'Места объектов',
		'Внешность',
		'Направления 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$ru implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Основы';
	@override List<String> get lessons => [
		'Семья 2',
		'Люди и места',
		'Семья 3',
		'Описание объектов',
		'Город',
		'Строительный проект',
		'Дом, милый дом',
		'Который час?',
		'Ежедневная рутина 2',
		'Свободное время',
		'Еда и питание',
		'Покупки и потребление',
		'Праздники',
		'Планы на выходные',
		'Официально или неформально',
		'Мода',
		'Покупки 3',
		'Советы 2',
		'Ты сможешь это сделать',
		'Покупки 4',
		'Небольшой разговор',
		'Один латте, пожалуйста',
		'Еда',
		'Передвижение',
		'Готов к поездке',
		'Путешествие 1',
		'Городские побеги',
		'Путешествие 2',
		'Место для проживания',
		'Так волнительно',
		'Правильный человек',
		'Школа',
		'Музыкальные предпочтения',
		'Спорт',
		'Правила гонки',
		'Оставить сообщение',
		'Запросы',
		'Приглашения',
		'Опыт путешествий',
		'Прошедшее время 1',
		'Прошедшее время 2',
		'Прошедшее время 3',
		'Вопросы о прошлом',
		'Ты никогда не слишком стар',
		'Воспоминания о детстве',
		'Комплименты',
		'Отговорки',
		'Это так раздражает!',
		'Цифровой мир',
		'Рабочая жизнь',
		'Я не понял это',
		'Сохранить или потратить?',
		'Скажи прости',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$ru implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Средний';
	@override List<String> get lessons => [
		'Культурные традиции',
		'Знаменитости',
		'Искусство и креативность',
		'Планы на будущее',
		'Планирование мероприятий',
		'Цели и планы',
		'Исторические события',
		'Технологии',
		'Никогда не говори никогда',
		'Что происходит',
		'Мечтательный отпуск',
		'Социальные сети',
		'Рекомендации книг',
		'Один из тех дней',
		'Особенные фотографии',
		'Личные достижения',
		'Любимые фильмы',
		'Новости',
		'Счастье',
		'Загруженная неделя',
		'Где я вырос',
		'Школьные дни',
		'Профили',
		'Карты жизни',
		'Каждый день',
		'Что дальше',
		'Предложения',
		'Что произошло',
		'Воспоминания',
		'Культурный шок',
		'Фразы об интересах',
		'Собеседования',
		'Список желаний',
		'Мой родной город',
		'Поколение интернета',
		'Популярные бренды',
		'Фразы мнений',
		'Как это выглядит',
		'Жилое пространство',
		'Правильное питание',
		'Необычные хобби',
		'Сложный выбор',
		'Действуй',
		'Новые навыки',
		'Подать жалобу',
		'Образование',
		'Зеленые города',
		'Что важно в работе',
		'Личные вызовы',
		'Фразы для собеседования',
		'Вежливые окончания',
		'Главные новости',
		'Небольшие изменения',
		'Извинения и оправдания',
		'Этикет по телефону',
		'Извини, что прерываю…',
		'Ответы на жалобы',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$ru implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Выше среднего';
	@override List<String> get lessons => [
		'Личности',
		'Отличные лидеры',
		'Здоровый образ жизни',
		'Что есть правда?',
		'Личностный рост',
		'Высказываемся',
		'Играем?',
		'Я помню...',
		'Социальная обратная связь',
		'Место преступления',
		'Вежливые неприятности',
		'Разрешение конфликтов',
		'Любишь или ненавидишь?',
		'Экологические проблемы',
		'Мы можем это решить',
		'Тайны и преступления',
		'Возможные будущие',
		'Бизнес-планы',
		'Решения на встречах',
		'Это так предсказуемо...',
		'На работе',
		'Наука и технологии',
		'Управление временем',
		'Права человека',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$ru implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Продвинутый';
	@override List<String> get lessons => [
		'Культурные нормы',
		'Влияние социальных сетей',
		'Выбор карьеры',
		'Ускорение производительности',
		'Изобретения',
		'Путешествия во времени',
		'Имущество',
		'Навыки работы',
		'Исторические изменения',
		'Написание отзывов',
		'Тайны',
		'Странные теории',
		'Знаменитости',
		'Глобальная политика',
		'Бум продуктов',
		'Будем счастливы?',
		'Может быть позже...',
		'Новые решения',
		'Контекстуальное влияние',
		'Потерянный логотип',
		'Добрые поступки',
		'Какой фильм',
		'Как раздражает',
		'В новостях',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$ru implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Эксперт';
	@override List<String> get lessons => [
		'Глобализация',
		'Природные катастрофы',
		'Реакция на информацию',
		'Баланс работы и личной жизни',
		'Удаленная работа',
		'Семейные проблемы',
		'Основы человеческой анатомии',
		'Прогнозы здоровья',
		'Доступ к медицинскому обслуживанию',
		'Глобальный опыт путешествий',
		'Суперспособности',
		'Командообразование',
		'Биофлуоресценция',
		'Дилеммы',
		'Социальный энтузиазм',
		'Изменения',
		'Работа, работа, работа',
		'Местные проблемы',
		'Проблемы, проблемы',
		'Факт или вымысел?',
		'Достопримечательности',
		'Волонтерство',
		'Глаз разума',
		'Потребление медиа',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$ru implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Привет! Сегодня мы будем практиковаться в заказе в кофейне — приветствие, размеры, добавки. Сначала я немного объясню, а потом мы разыграем. Звучит хорошо?';
	@override String get incoming1 => 'Добро пожаловать! Чем могу помочь вам сегодня?';
	@override String get outgoing1 => 'Привет! Я хотел бы средний латте, пожалуйста.';
	@override String get incoming2Highlight => 'Конечно';
	@override String get incoming2Rest => '! Хотите горячий или холодный, и какие-то добавки?';
	@override String get botReply => 'Отличный выбор. Что-то еще к вашему заказу?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$ru implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Привет! Сегодня мы будем практиковаться в том, как спрашивать направление на улице. Сначала я немного объясню, а потом мы разыграем. Звучит хорошо?';
	@override String get incoming1 => 'Привет! Вы выглядите немного потерянным — нужна помощь с поиском чего-то?';
	@override String get outgoing1 => 'Да, я ищу ближайшую станцию метро.';
	@override String get incoming2Highlight => 'Конечно';
	@override String get incoming2Rest => '! Идите два квартала в ту сторону, затем поверните налево. Вы увидите вход.';
	@override String get botReply => 'Пожалуйста! Хотите совет по ресторану рядом со станцией?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$ru implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Привет! Сегодня мы будем практиковаться в собеседовании. Сначала я немного объясню, а потом мы разыграем — я буду вас интервьюировать, а потом мы поменяемся. Звучит хорошо?';
	@override String get incoming1 => 'Спасибо, что пришли сегодня. Можете кратко представиться?';
	@override String get outgoing1 => 'Конечно. Я рад быть здесь и поделиться своим опытом.';
	@override String get incoming2Highlight => 'Замечательно';
	@override String get incoming2Rest => '. Расскажите о недавнем проекте, которым вы гордитесь.';
	@override String get botReply => 'Это впечатляет. Какие у вас есть вопросы о роли?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$ru implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$ru implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$ru implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$ru implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$ru implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$ru implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$ru implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$ru implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$ru implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$ru implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Какие языки поддерживает приложение?';
	@override String get answer => 'Интерфейс Lingola доступен на английском, немецком, итальянском, французском, турецком, японском, испанском, русском, хинди, португальском и упрощённом китайском языках.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$ru implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Как работает ИИ?';
	@override String get answer => 'ИИ взаимодействует с тобой как настоящий репетитор. Он анализирует твои разговоры, выявляет ошибки и предлагает персонализированную обратную связь на основе твоего прогресса.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$ru implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Могу ли я использовать приложение офлайн?';
	@override String get answer => 'Да. Ты можешь заранее скачать определенные уроки и сценарии разговоров и использовать их офлайн. Однако для живого чата требуется интернет-соединение.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$ru implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Приложение бесплатное?';
	@override String get answer => 'Базовая версия бесплатна. С Премиум ты получаешь расширенные сценарии чата, анализ произношения и режим личного репетитора.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$ru implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Как оценивается мое произношение?';
	@override String get answer => 'Приложение анализирует твой голос и использует распознавание речи на основе ИИ, чтобы оценить твой акцент и произношение. Слова, которые нужно улучшить, выделяются.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$ru implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Мне нужно практиковаться каждый день?';
	@override String get answer => 'Да. Система отслеживает твой прогресс каждый день. Всего 10–15 минут практики разговорной речи в день могут значительно ускорить твое изучение языка.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$ru implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Как определяется мой уровень обучения?';
	@override String get answer => 'Краткая проверка уровня при первом входе анализирует твои текущие знания. После этого ИИ автоматически рекомендует уроки, подходящие твоему уровню.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$ru implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Могу ли я общаться с реальными людьми?';
	@override String get answer => 'Да. Пользователи Премиум могут планировать короткие практические сессии с реальными репетиторами.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$ru implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Безопасны ли мои данные?';
	@override String get answer => 'Абсолютно. Все разговоры и данные пользователей хранятся в зашифрованном виде. Твоя личная информация никогда не передается третьим лицам.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$ru implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Как отключить ежедневные напоминания?';
	@override String get answer => 'Перейди в настройки профиля, открой Уведомления и измени частоту напоминаний или полностью отключи уведомления.';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Уведомления',
			'app.streak' => 'Серия обучения',
			'app.profile' => 'Профиль',
			'common.continueLabel' => 'ПРОДОЛЖИТЬ',
			'common.back' => 'НАЗАД',
			'common.locked' => 'Заблокировано',
			'common.minutes' => ({required Object value}) => '${value} мин',
			'common.close' => 'Закрыть',
			'common.getStarted' => 'НАЧАТЬ',
			'common.connectionError' => 'Нет соединения. Проверьте интернет и попробуйте снова.',
			'common.genericError' => 'Что-то пошло не так. Пожалуйста, попробуйте снова.',
			'common.tryAgain' => 'Попробовать снова',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Страница ввода ${current} из ${total}',
			'onboarding.slide1.title' => 'Говорите уверенно за недели — а не месяцы',
			'onboarding.slide1.body' => 'Практикуйте реальные разговоры с ИИ. Улучшайте свой акцент, уверенность и беглость каждый день.',
			'onboarding.slide1.testimonialName' => 'Сара Уильямс, 24',
			'onboarding.slide1.testimonialBody' => 'Раньше я не могла говорить по-английски. Теперь я говорю каждый день на работе.',
			'onboarding.slide2.title' => 'Личный репетитор без высокой цены',
			'onboarding.slide2.body' => 'Реальные разговоры. Мгновенная обратная связь.\nБез расписания. Без давления.',
			'onboarding.slide2.realTutor' => 'Настоящий репетитор',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / ч',
			'onboarding.slide2.priceLingola' => '\$9.99 / год',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Запланировано',
			'onboarding.slide2.anytime' => 'В любое время',
			'onboarding.slide2.stressful' => 'Стрессово',
			'onboarding.slide2.noPressure' => 'Без давления',
			'onboarding.slide2.price' => 'Цена',
			'onboarding.slide2.availability' => 'Доступность',
			'onboarding.slide2.feeling' => 'Чувство',
			'onboarding.slide3.title' => 'План обучения, созданный для вас',
			'onboarding.slide3.body' => 'Ваши цели, ваш темп, ваш уровень.\nОт новичка до свободного владения — шаг за шагом.',
			'onboarding.slide3.goal' => 'Цель',
			'onboarding.slide3.practice' => 'Практика',
			'onboarding.slide3.progress' => 'Прогресс',
			'targetLanguage.title' => 'Выберите язык, который хотите выучить',
			'targetLanguage.comingSoon' => 'Скоро будут доступны новые языки',
			'targetLanguage.korean' => 'Корейский',
			'targetLanguage.portuguese' => 'Португальский',
			'targetLanguage.portugueseBrazil' => 'Португальский (Бразилия)',
			'targetLanguage.german' => 'Немецкий',
			'targetLanguage.italian' => 'Итальянский',
			'targetLanguage.simplifiedChinese' => 'Упрощенный китайский',
			'targetLanguage.arabic' => 'Арабский',
			'targetLanguage.turkish' => 'Турецкий',
			'targetLanguage.hindi' => 'Хинди',
			'language.step' => ({required Object current, required Object total}) => 'Шаг ${current} из ${total}',
			'language.title' => 'На каком языке ты хочешь говорить?',
			'language.nativeSection' => 'Я говорю',
			'language.nativeField' => 'Родной язык',
			'language.nativeName' => 'Турецкий',
			'language.targetSection' => 'Я хочу учить',
			'language.targetField' => 'Целевой язык',
			'language.targetName' => 'Английский',
			'language.direction' => 'Направление языка',
			'language.selectLanguage' => 'Выбери язык',
			'language.comingSoonBadge' => 'Скоро будет...',
			'language.english' => 'Английский',
			'language.french' => 'Французский',
			'language.japanese' => 'Японский',
			'language.spanish' => 'Испанский',
			'language.russian' => 'Русский',
			'setup.goalTitle' => 'Какова ваша цель?',
			'setup.goalCareer' => 'Развитие карьеры',
			'setup.goalTravel' => 'Путешествия',
			'setup.goalLiving' => 'Жизнь за границей',
			'setup.goalStudying' => 'Учёба за границей',
			'setup.goalOther' => 'Другое',
			'setup.levelTitle' => 'Какой у вас текущий уровень языка?',
			'setup.paceTitle' => 'Как быстро вы хотите улучшаться?',
			'setup.explanationTitle' => 'Когда ты задаёшь вопросы на своём языке, как объяснять?',
			'setup.explanationHint' => 'Это можно изменить в любой момент в настройках профиля.',
			'setup.explanationNative' => 'Объяснять на моём родном языке',
			'setup.explanationEnglish' => 'Объяснять на английском',
			'setup.levelA1' => 'A1 — Знаю несколько слов',
			'setup.levelA2' => 'A2 — Могу использовать простые фразы',
			'setup.levelB1' => 'B1 — Веду повседневные разговоры',
			'setup.levelB2' => 'B2 — Свободно общаюсь на знакомые темы',
			'setup.levelC1' => 'C1 — Продвинутый, хочу улучшить',
			'setup.levelC2' => 'C2 — Почти родной уровень',
			'setup.paceMin5' => '5 мин/день',
			'setup.paceMin10' => '10 мин/день',
			'setup.paceMin15' => '15 мин/день',
			'setup.paceMin30' => '30 мин/день',
			'setup.paceMin60' => '60 мин/день',
			'accountCreating.title' => 'Ваш личный аккаунт создается',
			'accountCreating.stepContent' => 'Создается контент',
			'accountCreating.stepDialogues' => 'Готовятся диалоги',
			'accountCreating.stepLessons' => 'Оптимизируются уроки',
			'accountCreating.stepPlan' => 'Ваш план завершается',
			'accountCreating.optimization' => 'Оптимизация',
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
			'planReady.paceMin5' => '5 мин/день',
			'planReady.paceMin10' => '10 мин/день',
			'planReady.paceMin15' => '15 мин/день',
			'planReady.paceMin30' => '30 мин/день',
			'planReady.paceMin60' => '60 мин/день',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Урок 1: Приветствия',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Напишите сообщение...',
			'previewChat.incoming1' => 'Привет! Добро пожаловать в Lingola — я твой AI-наставник. Какой бы ни был твой уровень, здесь ты в безопасности и спокойно учишь английский. По-английски «привет» — это \'Hi\' или \'Hello\'. Попробуй: напиши мне \'Hi!\' по-английски!',
			'previewChat.outgoing1' => 'Привет! Я готов практиковаться.',
			'previewChat.incoming2Highlight' => 'Доброе утро',
			'previewChat.incoming2Rest' => ', Emrah! Рад, что ты готов. Утренний кофе — всегда отличный способ начать общение. О чем бы ты хотел поговорить?',
			'previewChat.holdToSpeak' => 'Удерживайте, чтобы говорить',
			'previewChat.recording' => 'Запись… отпустите, чтобы отправить',
			'previewChat.slideUpToLock' => 'Проведите вверх, чтобы закрепить',
			'previewChat.slideLeftToCancel' => 'Проведите влево, чтобы отменить',
			'previewChat.recordingLockedHint' => 'Нажмите «Отправить», когда закончите',
			'paywall.title' => 'Начни говорить сегодня — бесплатно',
			'paywall.subtitle' => 'Неограниченные возможности для обучения',
			'paywall.noCommitment' => 'Без обязательств',
			'paywall.cancelAnytime' => 'Отменить в любое время',
			'paywall.noPaymentToday' => 'Сегодня без оплаты',
			'paywall.daysFree' => '3 дня бесплатно',
			'paywall.thenPrice' => 'Затем \$1.99/месяц',
			'paywall.trialActive' => 'Бесплатный пробный период активен',
			'paywall.payableToday' => 'Оплата сегодня',
			'paywall.payableValue' => '3 дня бесплатно 0.00\$',
			'paywall.paymentDate' => 'Дата платежа: 13 марта 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Наши разнообразные AI-тренеры',
			'auth.title' => 'Начни говорить на новом языке сегодня',
			'auth.body' => 'Практикуй реальные разговоры с AI.\nБез давления. Без осуждения.',
			'auth.continueGoogle' => 'Продолжить с Google',
			'auth.continueApple' => 'Продолжить с Apple',
			'auth.continueGuest' => 'Продолжить как Гость',
			'auth.or' => 'или',
			'auth.alreadyHaveAccount' => 'Уже есть аккаунт?',
			'auth.signIn' => 'Войти',
			'auth.legal' => 'Регистрируясь в Lingola, вы принимаете Условия обслуживания. Подробнее о том, как мы обрабатываем данные: Политика конфиденциальности и Политика использования файлов cookie',
			'auth.terms' => 'Условия обслуживания',
			'auth.privacy' => 'Политика конфиденциальности',
			'auth.cookies' => 'Политика использования файлов cookie',
			'nav.home' => 'Главная',
			'nav.tutor' => 'Наставник',
			'nav.lesson' => 'Урок',
			'nav.rolePlay' => 'Ролевая игра',
			'nav.profile' => 'Профиль',
			'home.streakCount' => '2',
			'home.greeting' => 'Доброе утро, Jhon',
			'home.todayPractice' => 'Практика на сегодня',
			'home.continueConversation' => 'Продолжить разговор',
			'home.continueWithTutor' => ({required Object name}) => 'Продолжить с ${name} или выбрать другого преподавателя?',
			'home.continueSameTutor' => ({required Object name}) => 'Продолжить с ${name}',
			'home.chooseOtherTutor' => 'Выбрать другого преподавателя',
			'home.minutesLeft' => ({required Object value}) => 'Осталось ${value} мин',
			'home.lessonProgress' => 'Урок 2 — Приветствия',
			'home.timeCurrent' => '0мин',
			'home.timeTotal' => '/ 15мин',
			'home.kContinue' => 'Продолжить',
			'home.learningPath' => 'A1 - Начальный',
			'home.allLessons' => 'Все уроки',
			'home.introductions' => 'Знакомства I',
			'home.greetings' => 'Приветствия',
			'home.jobs' => 'Работы',
			'home.favoriteRoom' => 'Любимая комната',
			'home.dailyRoutine' => 'Ежедневная рутина',
			'home.scroll' => 'Прокрутить',
			'home.liveLesson' => 'Живой урок',
			'home.liveLessonSubtitle' => 'Проведите видеозвонок с нашим репетитором',
			'home.moreTutor' => 'Еще репетиторы',
			'home.startTalkNow' => 'Начать разговор сейчас',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Адаптивный',
			'home.tagCalm' => 'Спокойный',
			'home.tagPatient' => 'Терпеливый',
			'home.tagMethodical' => 'Методичный',
			'home.tagEncouraging' => 'Поддерживающий',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Больше функций',
			'home.practiceLabel' => 'ПРАКТИКА',
			'home.wordPractice' => 'Практика слов',
			'home.wordPracticeBody' => 'Ежедневно пополняйте свой словарный запас на выбранном языке',
			'home.immersiveLabel' => 'Погружающий',
			'home.quiz' => 'Викторина',
			'home.quizBodyLine1' => 'Учитесь на реальных',
			'home.quizBodyLine2' => 'примерах в контексте',
			'home.getStarted' => 'Начать',
			'home.library' => 'Библиотека',
			'home.libraryTitle' => 'Учитесь и сохраняйте',
			'home.learnMore' => 'Узнать больше',
			'home.premium.titleBefore' => 'Путь к ',
			'home.premium.titleHighlight' => 'свободному разговору',
			'home.premium.titleAfter' => ' без страха делать ошибки.',
			'home.premium.descriptionBefore' => 'Присоединяйтесь к миллионам студентов по всему миру. Начните преодолевать языковой барьер сегодня — ',
			'home.premium.descriptionHighlight' => 'первые 3 дня совершенно бесплатно.',
			'home.premium.feature1' => 'AI репетитор доступный 24/7',
			'home.premium.feature2' => 'Неограниченный доступ к частным репетиторам',
			'home.premium.feature3' => 'Ежедневный план уроков, адаптированный под вас',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/мес',
			'home.premium.discount' => 'Скидка 40% при годовой подписке',
			'home.premium.cta' => 'Начать',
			'libraryPage.title' => 'Библиотека',
			'libraryPage.searchWord' => 'Поиск слова',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Сохраненное слово',
			'libraryPage.savedWordTab' => 'Сохраненные слова',
			'libraryPage.dictionaryTab' => 'Словарь',
			'libraryPage.dictionaryLabel' => 'Словарь',
			'wordPracticePage.title' => 'Практика слов',
			'wordPracticePage.turkish' => 'ТУРЕЦКИЙ',
			'wordPracticePage.save' => 'Сохранить',
			'wordPracticePage.saved' => 'Сохранено',
			'wordPracticePage.listen' => 'Слушать',
			'wordPracticePage.hint' => 'Подсказка',
			'wordPracticePage.previous' => 'ПРЕДЫДУЩИЙ',
			'wordPracticePage.next' => 'СЛЕДУЮЩИЙ',
			'quizPage.title' => 'Викторина',
			'quizPage.headline' => 'Что ты хочешь улучшить сегодня?',
			'quizPage.subtitle' => 'Выбери свою тренировку — займет меньше 3 минут 🚀',
			'quizPage.readingTitle' => 'Чтение',
			'quizPage.readingBody' => 'Понимание через статьи и истории',
			'quizPage.writingTitle' => 'Письмо',
			'quizPage.writingBody' => 'Упражнения по грамматике и словарному запасу',
			'quizPage.speakingTitle' => 'Говорение',
			'quizPage.speakingBody' => 'Произношение с помощью AI-движка речи',
			'quizPage.readingTestTitle' => 'Тест на чтение',
			'quizPage.read' => 'Читать',
			'quizPage.listeningHint' => 'Четко произнеси английское слово...',
			'quizPage.micPermissionDenied' => 'Микрофон или распознавание речи недоступны.',
			'quizPage.matchSuccess' => 'Отлично! Это соответствует слову.',
			'quizPage.matchFail' => ({required Object heard}) => 'Слышал "${heard}". Попробуй еще раз.',
			'quizPage.successfulTitle' => 'Успешно!',
			'quizPage.successfulBody' => 'Произношение как у носителя языка!',
			'quizPage.failedTitle' => 'Неудача',
			'quizPage.failedBody' => 'Почти получилось, дай еще один шанс',
			'quizPage.tryAgain' => 'ПОПРОБУЙ ЕЩЕ РАЗ',
			'quizPage.writingTestTitle' => 'Тест на письмо',
			'quizPage.sourceLanguage' => 'ИСТОЧНИКОВЫЙ ЯЗЫК',
			'quizPage.answer' => 'ОТВЕТ',
			'quizPage.writeAnswerHint' => 'Напиши свой ответ здесь...',
			'quizPage.submit' => 'Отправить',
			'quizPage.speakingTestTitle' => 'Тест на говорение',
			'quizPage.speakingProficiency' => 'Уровень говорения',
			'quizPage.speakClearlyHint' => 'Говори четко в микрофон:',
			'quizPage.speakUp' => 'Говори громче',
			'quizPage.recording' => 'Запись...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'ВОПРОС ${current} ИЗ ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} в пути',
			'placeholder.body' => ({required Object tab}) => 'Мы готовим для вас сосредоточенный опыт с ${tab}.',
			'tutorPage.title' => 'Наставник',
			'tutorPage.chatWithLingola' => 'Чат с Lingola',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Чат с ${name}',
			'tutorPage.chatHistory' => 'История чата',
			'tutorPage.history' => 'История',
			'tutorPage.filter' => 'Фильтр',
			'tutorPage.country' => 'Страна',
			'tutorPage.focus' => 'Фокус',
			'tutorPage.moreCountries' => '8+ ещё',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'СОХРАНИТЬ',
			'tutorPage.clearFilter' => 'Сбросить фильтры',
			'tutorPage.startTalkNow' => 'Начать разговор сейчас',
			'tutorPage.typeMessage' => 'Введите сообщение...',
			'tutorPage.speaker' => 'Спикер',
			'tutorPage.messagesCount' => '12',
			'tutorPage.tutors.lingola' => 'Lingola',
			'tutorPage.tutors.zephyrion' => 'Zephyrion',
			'tutorPage.tutors.vaelen' => 'Vaelen',
			'tutorPage.tutors.elrion' => 'Elrion',
			'tutorPage.tutors.ukrath' => 'Ukrath',
			'tutorPage.tutors.elena' => 'Елена',
			'tutorPage.tutors.kenji' => 'Кенджи',
			'tutorPage.tutors.freya' => 'Фрея',
			'tutorPage.tutors.camila' => 'Камила',
			'tutorPage.tutors.marco' => 'Марко',
			'tutorPage.tutors.julian' => 'Юлиан',
			'tutorPage.tutors.ines' => 'Инес',
			'tutorPage.tutors.felix' => 'Феликс',
			'tutorPage.tutors.diego' => 'Диего',
			'tutorPage.tutors.amara' => 'Амара',
			'tutorPage.tutors.erik' => 'Эрик',
			'tutorPage.tutors.katie' => 'Кэти',
			'tutorPage.tutors.morgan' => 'Морган',
			'tutorPage.tutors.santa' => 'Дед Мороз',
			'tutorPage.tags.adaptive' => 'Адаптивный',
			'tutorPage.tags.calm' => 'Спокойный',
			'tutorPage.tags.patient' => 'Терпеливый',
			'tutorPage.tags.organized' => 'Организованный',
			'tutorPage.tags.relaxed' => 'Расслабленный',
			'tutorPage.tags.methodical' => 'Методичный',
			'tutorPage.tags.attentive' => 'Внимательный',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Любопытный',
			'tutorPage.tags.observer' => 'Наблюдатель',
			'tutorPage.tags.ancientKnowledge' => 'Древние знания',
			'tutorPage.tags.wise' => 'Мудрый',
			'tutorPage.tags.clear' => 'Ясный',
			'tutorPage.tags.decisive' => 'Решительный',
			'tutorPage.tags.disciplined' => 'Дисциплинированный',
			'tutorPage.tags.smart' => 'Умный',
			'tutorPage.tags.analytic' => 'Аналитический',
			'tutorPage.tags.cheerful' => 'Весёлый',
			'tutorPage.tags.generous' => 'Щедрый',
			'tutorPage.historyPreview1' => 'Привет! Я уже заскучал...',
			'tutorPage.historyPreview2' => 'Сегодня попрактикуемся заказывать еду?',
			'tutorPage.time1' => '11:00',
			'tutorPage.time2' => 'Вчера',
			'tutorPage.chat.incoming1' => 'Доброе утро! Рад, что ты готов практиковаться сегодня.',
			'tutorPage.chat.outgoing1' => 'Да, давай начнём с приветствий.',
			'tutorPage.chat.incoming2' => 'Отлично. Как бы ты поздоровался с коллегой?',
			'tutorPage.chat.typing' => 'Печатает',
			'tutorPage.calling.lessonBadge' => 'Урок 1 : Приветствия',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Урок ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Скучно?',
			'tutorPage.calling.englishLine' => 'Скучно? Я вычеркнул это слово из своего словаря. Вставай, план уже готов: мы идём в новый аркадный бар в Кадыкёе.',
			'tutorPage.calling.highlight' => 'Скучно?',
			'tutorPage.calling.close' => 'Завершить звонок',
			'tutorPage.calling.toggleCaptions' => 'Переключить субтитры',
			'tutorPage.calling.toggleHints' => 'Переключить подсказки',
			'tutorPage.calling.toggleMic' => 'Переключить микрофон',
			'tutorPage.calling.tapToSpeakHint' => 'Нажми, чтобы говорить, нажми снова, чтобы закончить',
			'lessonPage.title' => 'Продолжай учиться',
			'lessonPage.profile' => 'Профиль',
			'lessonPage.language' => 'Целевой язык',
			'lessonPage.completed' => 'Завершено',
			'lessonPage.locked' => 'Заблокировано',
			'lessonPage.pickTutorTitle' => 'Выбери своего преподавателя',
			'lessonPage.startTalk' => 'Начать урок',
			'lessonPage.chatInstead' => 'Чат вместо этого',
			'lessonPage.lockedHint' => 'Закончите предыдущий урок, чтобы разблокировать этот.',
			'lessonPage.levelLockedTitle' => 'Уровень закрыт',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Ваш уровень английского — ${userLevel}, поэтому уроки ${lessonLevel} недоступны без прохождения предыдущего пути.',
			'lessonPage.levelLockedOk' => 'Понятно',
			'lessonPage.notesTitle' => 'Заметки к уроку',
			'lessonPage.whatWeLearned' => 'Что мы узнали сегодня',
			'lessonPage.deleteNotes' => 'Удалить мои заметки к уроку',
			'lessonPage.deleteNotesConfirm' => 'Удалить эти заметки? Это действие нельзя отменить.',
			'lessonPage.delete' => 'Удалить',
			'lessonPage.cancel' => 'Отмена',
			'lessonPage.practiceCta' => 'Если это было слишком сложно, вы можете снова попрактиковаться в той же теме.',
			'lessonPage.practiceNow' => 'Практиковаться в этой теме',
			'lessonPage.openChat' => 'Открыть чат с преподавателем',
			'lessonPage.yourScore' => 'Ваш балл',
			'lessonPage.bestScore' => ({required Object score}) => 'Лучший ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Пассивный участник',
			'lessonPage.participationSilentBody' => 'На этот раз вы молчали. Думаю, вам стоит повторить этот урок.',
			'lessonPage.participationPassive' => 'Низкое участие',
			'lessonPage.participationPassiveBody' => 'Вы почти не говорили. Попробуйте урок снова и говорите больше.',
			'lessonPage.participationActive' => 'Хорошее участие',
			'lessonPage.participationActiveBody' => 'Вы присоединились к разговору. Так держать!',
			'lessonPage.participationStrong' => 'Сильное участие',
			'lessonPage.participationStrongBody' => 'Вы много говорили. Отличная работа!',
			'lessonPage.retakeLesson' => 'Повторить этот урок',
			'lessonPage.finishLesson' => 'Закончить урок',
			'lessonPage.savingNotes' => 'Ваш преподаватель пишет заметки к сегодняшнему уроку...',
			'lessonPage.noNotes' => 'Закончите этот урок, чтобы получить заметки от вашего преподавателя.',
			'lessonPage.notesDeleted' => 'Заметки к уроку удалены',
			'lessonPage.levels.a1.title' => 'A1 - Начальный',
			'lessonPage.levels.a1.lessons.0' => 'Приветствия',
			'lessonPage.levels.a1.lessons.1' => 'Знакомство I',
			'lessonPage.levels.a1.lessons.2' => 'Профессии',
			'lessonPage.levels.a1.lessons.3' => 'Любимая комната',
			'lessonPage.levels.a1.lessons.4' => 'Ежедневная рутина',
			'lessonPage.levels.a1.lessons.5' => 'Фрукты',
			'lessonPage.levels.a1.lessons.6' => 'Советы 1',
			'lessonPage.levels.a1.lessons.7' => 'Семья 1',
			'lessonPage.levels.a1.lessons.8' => 'Повседневные вещи',
			'lessonPage.levels.a1.lessons.9' => 'Родной город',
			'lessonPage.levels.a1.lessons.10' => 'Дом',
			'lessonPage.levels.a1.lessons.11' => 'Предпочтения в еде',
			'lessonPage.levels.a1.lessons.12' => 'Хобби 1',
			'lessonPage.levels.a1.lessons.13' => 'Успешные люди',
			'lessonPage.levels.a1.lessons.14' => 'Еда и напитки',
			'lessonPage.levels.a1.lessons.15' => 'Заказ в ресторане',
			'lessonPage.levels.a1.lessons.16' => 'Домашние животные',
			'lessonPage.levels.a1.lessons.17' => 'Здоровье и фитнес',
			'lessonPage.levels.a1.lessons.18' => 'Погода',
			'lessonPage.levels.a1.lessons.19' => 'Новый образ жизни',
			'lessonPage.levels.a1.lessons.20' => 'Становиться лучше',
			'lessonPage.levels.a1.lessons.21' => 'Хобби 2',
			'lessonPage.levels.a1.lessons.22' => 'Вопросы о местах',
			'lessonPage.levels.a1.lessons.23' => 'Принадлежность',
			'lessonPage.levels.a1.lessons.24' => 'Шоппинг 1',
			'lessonPage.levels.a1.lessons.25' => 'Сколько времени',
			'lessonPage.levels.a1.lessons.26' => 'Направления 1',
			'lessonPage.levels.a1.lessons.27' => 'Шоппинг 2',
			'lessonPage.levels.a1.lessons.28' => 'Познакомимся',
			'lessonPage.levels.a1.lessons.29' => 'Места объектов',
			'lessonPage.levels.a1.lessons.30' => 'Внешность',
			'lessonPage.levels.a1.lessons.31' => 'Направления 2',
			'lessonPage.levels.a2.title' => 'A2 - Основы',
			'lessonPage.levels.a2.lessons.0' => 'Семья 2',
			'lessonPage.levels.a2.lessons.1' => 'Люди и места',
			'lessonPage.levels.a2.lessons.2' => 'Семья 3',
			'lessonPage.levels.a2.lessons.3' => 'Описание объектов',
			'lessonPage.levels.a2.lessons.4' => 'Город',
			'lessonPage.levels.a2.lessons.5' => 'Строительный проект',
			'lessonPage.levels.a2.lessons.6' => 'Дом, милый дом',
			'lessonPage.levels.a2.lessons.7' => 'Который час?',
			'lessonPage.levels.a2.lessons.8' => 'Ежедневная рутина 2',
			'lessonPage.levels.a2.lessons.9' => 'Свободное время',
			'lessonPage.levels.a2.lessons.10' => 'Еда и питание',
			'lessonPage.levels.a2.lessons.11' => 'Покупки и потребление',
			'lessonPage.levels.a2.lessons.12' => 'Праздники',
			'lessonPage.levels.a2.lessons.13' => 'Планы на выходные',
			'lessonPage.levels.a2.lessons.14' => 'Официально или неформально',
			'lessonPage.levels.a2.lessons.15' => 'Мода',
			'lessonPage.levels.a2.lessons.16' => 'Покупки 3',
			'lessonPage.levels.a2.lessons.17' => 'Советы 2',
			'lessonPage.levels.a2.lessons.18' => 'Ты сможешь это сделать',
			'lessonPage.levels.a2.lessons.19' => 'Покупки 4',
			'lessonPage.levels.a2.lessons.20' => 'Небольшой разговор',
			'lessonPage.levels.a2.lessons.21' => 'Один латте, пожалуйста',
			'lessonPage.levels.a2.lessons.22' => 'Еда',
			'lessonPage.levels.a2.lessons.23' => 'Передвижение',
			'lessonPage.levels.a2.lessons.24' => 'Готов к поездке',
			'lessonPage.levels.a2.lessons.25' => 'Путешествие 1',
			'lessonPage.levels.a2.lessons.26' => 'Городские побеги',
			'lessonPage.levels.a2.lessons.27' => 'Путешествие 2',
			'lessonPage.levels.a2.lessons.28' => 'Место для проживания',
			'lessonPage.levels.a2.lessons.29' => 'Так волнительно',
			'lessonPage.levels.a2.lessons.30' => 'Правильный человек',
			'lessonPage.levels.a2.lessons.31' => 'Школа',
			'lessonPage.levels.a2.lessons.32' => 'Музыкальные предпочтения',
			'lessonPage.levels.a2.lessons.33' => 'Спорт',
			'lessonPage.levels.a2.lessons.34' => 'Правила гонки',
			'lessonPage.levels.a2.lessons.35' => 'Оставить сообщение',
			'lessonPage.levels.a2.lessons.36' => 'Запросы',
			'lessonPage.levels.a2.lessons.37' => 'Приглашения',
			'lessonPage.levels.a2.lessons.38' => 'Опыт путешествий',
			'lessonPage.levels.a2.lessons.39' => 'Прошедшее время 1',
			'lessonPage.levels.a2.lessons.40' => 'Прошедшее время 2',
			'lessonPage.levels.a2.lessons.41' => 'Прошедшее время 3',
			'lessonPage.levels.a2.lessons.42' => 'Вопросы о прошлом',
			'lessonPage.levels.a2.lessons.43' => 'Ты никогда не слишком стар',
			'lessonPage.levels.a2.lessons.44' => 'Воспоминания о детстве',
			'lessonPage.levels.a2.lessons.45' => 'Комплименты',
			'lessonPage.levels.a2.lessons.46' => 'Отговорки',
			'lessonPage.levels.a2.lessons.47' => 'Это так раздражает!',
			'lessonPage.levels.a2.lessons.48' => 'Цифровой мир',
			'lessonPage.levels.a2.lessons.49' => 'Рабочая жизнь',
			'lessonPage.levels.a2.lessons.50' => 'Я не понял это',
			'lessonPage.levels.a2.lessons.51' => 'Сохранить или потратить?',
			'lessonPage.levels.a2.lessons.52' => 'Скажи прости',
			'lessonPage.levels.b1.title' => 'B1 - Средний',
			'lessonPage.levels.b1.lessons.0' => 'Культурные традиции',
			'lessonPage.levels.b1.lessons.1' => 'Знаменитости',
			'lessonPage.levels.b1.lessons.2' => 'Искусство и креативность',
			'lessonPage.levels.b1.lessons.3' => 'Планы на будущее',
			'lessonPage.levels.b1.lessons.4' => 'Планирование мероприятий',
			'lessonPage.levels.b1.lessons.5' => 'Цели и планы',
			'lessonPage.levels.b1.lessons.6' => 'Исторические события',
			'lessonPage.levels.b1.lessons.7' => 'Технологии',
			'lessonPage.levels.b1.lessons.8' => 'Никогда не говори никогда',
			'lessonPage.levels.b1.lessons.9' => 'Что происходит',
			'lessonPage.levels.b1.lessons.10' => 'Мечтательный отпуск',
			'lessonPage.levels.b1.lessons.11' => 'Социальные сети',
			'lessonPage.levels.b1.lessons.12' => 'Рекомендации книг',
			'lessonPage.levels.b1.lessons.13' => 'Один из тех дней',
			'lessonPage.levels.b1.lessons.14' => 'Особенные фотографии',
			'lessonPage.levels.b1.lessons.15' => 'Личные достижения',
			'lessonPage.levels.b1.lessons.16' => 'Любимые фильмы',
			'lessonPage.levels.b1.lessons.17' => 'Новости',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.b1.lessons.18' => 'Счастье',
			'lessonPage.levels.b1.lessons.19' => 'Загруженная неделя',
			'lessonPage.levels.b1.lessons.20' => 'Где я вырос',
			'lessonPage.levels.b1.lessons.21' => 'Школьные дни',
			'lessonPage.levels.b1.lessons.22' => 'Профили',
			'lessonPage.levels.b1.lessons.23' => 'Карты жизни',
			'lessonPage.levels.b1.lessons.24' => 'Каждый день',
			'lessonPage.levels.b1.lessons.25' => 'Что дальше',
			'lessonPage.levels.b1.lessons.26' => 'Предложения',
			'lessonPage.levels.b1.lessons.27' => 'Что произошло',
			'lessonPage.levels.b1.lessons.28' => 'Воспоминания',
			'lessonPage.levels.b1.lessons.29' => 'Культурный шок',
			'lessonPage.levels.b1.lessons.30' => 'Фразы об интересах',
			'lessonPage.levels.b1.lessons.31' => 'Собеседования',
			'lessonPage.levels.b1.lessons.32' => 'Список желаний',
			'lessonPage.levels.b1.lessons.33' => 'Мой родной город',
			'lessonPage.levels.b1.lessons.34' => 'Поколение интернета',
			'lessonPage.levels.b1.lessons.35' => 'Популярные бренды',
			'lessonPage.levels.b1.lessons.36' => 'Фразы мнений',
			'lessonPage.levels.b1.lessons.37' => 'Как это выглядит',
			'lessonPage.levels.b1.lessons.38' => 'Жилое пространство',
			'lessonPage.levels.b1.lessons.39' => 'Правильное питание',
			'lessonPage.levels.b1.lessons.40' => 'Необычные хобби',
			'lessonPage.levels.b1.lessons.41' => 'Сложный выбор',
			'lessonPage.levels.b1.lessons.42' => 'Действуй',
			'lessonPage.levels.b1.lessons.43' => 'Новые навыки',
			'lessonPage.levels.b1.lessons.44' => 'Подать жалобу',
			'lessonPage.levels.b1.lessons.45' => 'Образование',
			'lessonPage.levels.b1.lessons.46' => 'Зеленые города',
			'lessonPage.levels.b1.lessons.47' => 'Что важно в работе',
			'lessonPage.levels.b1.lessons.48' => 'Личные вызовы',
			'lessonPage.levels.b1.lessons.49' => 'Фразы для собеседования',
			'lessonPage.levels.b1.lessons.50' => 'Вежливые окончания',
			'lessonPage.levels.b1.lessons.51' => 'Главные новости',
			'lessonPage.levels.b1.lessons.52' => 'Небольшие изменения',
			'lessonPage.levels.b1.lessons.53' => 'Извинения и оправдания',
			'lessonPage.levels.b1.lessons.54' => 'Этикет по телефону',
			'lessonPage.levels.b1.lessons.55' => 'Извини, что прерываю…',
			'lessonPage.levels.b1.lessons.56' => 'Ответы на жалобы',
			'lessonPage.levels.b2.title' => 'B2 - Выше среднего',
			'lessonPage.levels.b2.lessons.0' => 'Личности',
			'lessonPage.levels.b2.lessons.1' => 'Отличные лидеры',
			'lessonPage.levels.b2.lessons.2' => 'Здоровый образ жизни',
			'lessonPage.levels.b2.lessons.3' => 'Что есть правда?',
			'lessonPage.levels.b2.lessons.4' => 'Личностный рост',
			'lessonPage.levels.b2.lessons.5' => 'Высказываемся',
			'lessonPage.levels.b2.lessons.6' => 'Играем?',
			'lessonPage.levels.b2.lessons.7' => 'Я помню...',
			'lessonPage.levels.b2.lessons.8' => 'Социальная обратная связь',
			'lessonPage.levels.b2.lessons.9' => 'Место преступления',
			'lessonPage.levels.b2.lessons.10' => 'Вежливые неприятности',
			'lessonPage.levels.b2.lessons.11' => 'Разрешение конфликтов',
			'lessonPage.levels.b2.lessons.12' => 'Любишь или ненавидишь?',
			'lessonPage.levels.b2.lessons.13' => 'Экологические проблемы',
			'lessonPage.levels.b2.lessons.14' => 'Мы можем это решить',
			'lessonPage.levels.b2.lessons.15' => 'Тайны и преступления',
			'lessonPage.levels.b2.lessons.16' => 'Возможные будущие',
			'lessonPage.levels.b2.lessons.17' => 'Бизнес-планы',
			'lessonPage.levels.b2.lessons.18' => 'Решения на встречах',
			'lessonPage.levels.b2.lessons.19' => 'Это так предсказуемо...',
			'lessonPage.levels.b2.lessons.20' => 'На работе',
			'lessonPage.levels.b2.lessons.21' => 'Наука и технологии',
			'lessonPage.levels.b2.lessons.22' => 'Управление временем',
			'lessonPage.levels.b2.lessons.23' => 'Права человека',
			'lessonPage.levels.c1.title' => 'C1 - Продвинутый',
			'lessonPage.levels.c1.lessons.0' => 'Культурные нормы',
			'lessonPage.levels.c1.lessons.1' => 'Влияние социальных сетей',
			'lessonPage.levels.c1.lessons.2' => 'Выбор карьеры',
			'lessonPage.levels.c1.lessons.3' => 'Ускорение производительности',
			'lessonPage.levels.c1.lessons.4' => 'Изобретения',
			'lessonPage.levels.c1.lessons.5' => 'Путешествия во времени',
			'lessonPage.levels.c1.lessons.6' => 'Имущество',
			'lessonPage.levels.c1.lessons.7' => 'Навыки работы',
			'lessonPage.levels.c1.lessons.8' => 'Исторические изменения',
			'lessonPage.levels.c1.lessons.9' => 'Написание отзывов',
			'lessonPage.levels.c1.lessons.10' => 'Тайны',
			'lessonPage.levels.c1.lessons.11' => 'Странные теории',
			'lessonPage.levels.c1.lessons.12' => 'Знаменитости',
			'lessonPage.levels.c1.lessons.13' => 'Глобальная политика',
			'lessonPage.levels.c1.lessons.14' => 'Бум продуктов',
			'lessonPage.levels.c1.lessons.15' => 'Будем счастливы?',
			'lessonPage.levels.c1.lessons.16' => 'Может быть позже...',
			'lessonPage.levels.c1.lessons.17' => 'Новые решения',
			'lessonPage.levels.c1.lessons.18' => 'Контекстуальное влияние',
			'lessonPage.levels.c1.lessons.19' => 'Потерянный логотип',
			'lessonPage.levels.c1.lessons.20' => 'Добрые поступки',
			'lessonPage.levels.c1.lessons.21' => 'Какой фильм',
			'lessonPage.levels.c1.lessons.22' => 'Как раздражает',
			'lessonPage.levels.c1.lessons.23' => 'В новостях',
			'lessonPage.levels.c2.title' => 'C2 - Эксперт',
			'lessonPage.levels.c2.lessons.0' => 'Глобализация',
			'lessonPage.levels.c2.lessons.1' => 'Природные катастрофы',
			'lessonPage.levels.c2.lessons.2' => 'Реакция на информацию',
			'lessonPage.levels.c2.lessons.3' => 'Баланс работы и личной жизни',
			'lessonPage.levels.c2.lessons.4' => 'Удаленная работа',
			'lessonPage.levels.c2.lessons.5' => 'Семейные проблемы',
			'lessonPage.levels.c2.lessons.6' => 'Основы человеческой анатомии',
			'lessonPage.levels.c2.lessons.7' => 'Прогнозы здоровья',
			'lessonPage.levels.c2.lessons.8' => 'Доступ к медицинскому обслуживанию',
			'lessonPage.levels.c2.lessons.9' => 'Глобальный опыт путешествий',
			'lessonPage.levels.c2.lessons.10' => 'Суперспособности',
			'lessonPage.levels.c2.lessons.11' => 'Командообразование',
			'lessonPage.levels.c2.lessons.12' => 'Биофлуоресценция',
			'lessonPage.levels.c2.lessons.13' => 'Дилеммы',
			'lessonPage.levels.c2.lessons.14' => 'Социальный энтузиазм',
			'lessonPage.levels.c2.lessons.15' => 'Изменения',
			'lessonPage.levels.c2.lessons.16' => 'Работа, работа, работа',
			'lessonPage.levels.c2.lessons.17' => 'Местные проблемы',
			'lessonPage.levels.c2.lessons.18' => 'Проблемы, проблемы',
			'lessonPage.levels.c2.lessons.19' => 'Факт или вымысел?',
			'lessonPage.levels.c2.lessons.20' => 'Достопримечательности',
			'lessonPage.levels.c2.lessons.21' => 'Волонтерство',
			'lessonPage.levels.c2.lessons.22' => 'Глаз разума',
			'lessonPage.levels.c2.lessons.23' => 'Потребление медиа',
			'rolePlayPage.title' => 'Ролевая Игра',
			'rolePlayPage.subtitle' => 'Выберите свою роль — испытайте сценарий из реальной жизни 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} завершено',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} мин',
			'rolePlayPage.beginner' => 'Начинающий',
			'rolePlayPage.screenplay' => 'СЦЕНАРИЙ',
			'rolePlayPage.dailyInteractions' => 'Ежедневные Взаимодействия',
			'rolePlayPage.business' => 'Бизнес',
			'rolePlayPage.coffee.title' => 'Заказ в Кофейне',
			'rolePlayPage.coffee.screenplay' => 'Закажите свой любимый напиток, спросите о размерах и добавках, подтвердите общую сумму и заберите кофе на стойке.',
			'rolePlayPage.coffee.chat.briefing' => 'Привет! Сегодня мы будем практиковаться в заказе в кофейне — приветствие, размеры, добавки. Сначала я немного объясню, а потом мы разыграем. Звучит хорошо?',
			'rolePlayPage.coffee.chat.incoming1' => 'Добро пожаловать! Чем могу помочь вам сегодня?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Привет! Я хотел бы средний латте, пожалуйста.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Конечно',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Хотите горячий или холодный, и какие-то добавки?',
			'rolePlayPage.coffee.chat.botReply' => 'Отличный выбор. Что-то еще к вашему заказу?',
			'rolePlayPage.directions.title' => 'Спросить Направление на Улице',
			'rolePlayPage.directions.screenplay' => 'Спросите направление к месту, узнайте, как добраться до метро или автобуса, получите информацию о билетах и послушайте рекомендации по ресторанам.',
			'rolePlayPage.directions.chat.briefing' => 'Привет! Сегодня мы будем практиковаться в том, как спрашивать направление на улице. Сначала я немного объясню, а потом мы разыграем. Звучит хорошо?',
			'rolePlayPage.directions.chat.incoming1' => 'Привет! Вы выглядите немного потерянным — нужна помощь с поиском чего-то?',
			'rolePlayPage.directions.chat.outgoing1' => 'Да, я ищу ближайшую станцию метро.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Конечно',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Идите два квартала в ту сторону, затем поверните налево. Вы увидите вход.',
			'rolePlayPage.directions.chat.botReply' => 'Пожалуйста! Хотите совет по ресторану рядом со станцией?',
			'rolePlayPage.interview.title' => 'Собеседование',
			'rolePlayPage.interview.screenplay' => 'Представьтесь, ответьте на общие вопросы собеседования, расскажите о своем опыте и спросите о роли и следующих шагах.',
			'rolePlayPage.interview.chat.briefing' => 'Привет! Сегодня мы будем практиковаться в собеседовании. Сначала я немного объясню, а потом мы разыграем — я буду вас интервьюировать, а потом мы поменяемся. Звучит хорошо?',
			'rolePlayPage.interview.chat.incoming1' => 'Спасибо, что пришли сегодня. Можете кратко представиться?',
			'rolePlayPage.interview.chat.outgoing1' => 'Конечно. Я рад быть здесь и поделиться своим опытом.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Замечательно',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Расскажите о недавнем проекте, которым вы гордитесь.',
			'rolePlayPage.interview.chat.botReply' => 'Это впечатляет. Какие у вас есть вопросы о роли?',
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
			'notificationsPage.title' => 'Уведомления',
			'notificationsPage.deleteConfirmTitle' => 'Вы уверены?',
			'notificationsPage.deleteConfirmBody' => 'Это уведомление будет удалено.',
			'notificationsPage.delete' => 'Удалить',
			'notificationsPage.cancel' => 'Отмена',
			'notificationsPage.translation.title' => 'Новая перевод готова',
			'notificationsPage.translation.body' => 'Ваш аудиофайл перевода успешно преобразован в текст и переведен.',
			'notificationsPage.offer.title' => 'Вас ждет специальное предложение',
			'notificationsPage.offer.body' => 'Переходите на Premium для неограниченных переводов фотографий со скидкой 50%.',
			'notificationsPage.stories.title' => 'Откройте для себя новые истории',
			'notificationsPage.stories.body' => 'Учите новые слова через истории',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Уведомлений пока нет',
			'notificationsPage.emptySubtitle' => 'Не забудьте заглянуть сюда снова, когда получите уведомление.',
			'profilePage.title' => 'Профиль',
			'profilePage.userName' => 'Джон Доу',
			'profilePage.freeVersion' => 'Бесплатная версия',
			'profilePage.dayStreak' => 'День непрерывности!',
			'profilePage.accountSettings' => 'Настройки аккаунта',
			'profilePage.general' => 'Общие',
			'profilePage.profileSettings' => 'Настройки профиля',
			'profilePage.fullName' => 'Полное имя',
			'profilePage.email' => 'Электронная почта',
			'profilePage.deleteAccount' => 'Удалить аккаунт',
			'profilePage.save' => 'СОХРАНИТЬ',
			'profilePage.deleteTitle' => 'Мы не хотим, чтобы ты уходил, но мы понимаем.',
			'profilePage.deleteBody' => 'Скажи нам, почему ты хочешь уйти, чтобы мы могли улучшить опыт использования Lingola?',
			'profilePage.deleteReasons.aiCharacters' => 'Я не нашел персонажей с искусственным интеллектом реалистичными.',
			'profilePage.deleteReasons.videoIssues' => 'У меня возникают технические проблемы с видеозвонками.',
			'profilePage.deleteReasons.pricing' => 'Цены на подписку выше моих ожиданий.',
			'profilePage.deleteReasons.noMatch' => 'Я не нашел персонажей, которые мне подходят.',
			'profilePage.deleteReasons.shortTrial' => 'Я хотел попробовать всего на короткий срок.',
			'profilePage.deleteReasons.other' => 'Другое',
			'profilePage.messageOptional' => 'Сообщение (по желанию)',
			'profilePage.messageHint' => 'Если у тебя есть сообщение, напиши его.',
			'profilePage.next' => 'ДАЛЕЕ',
			'profilePage.specialOfferTitle' => 'Специальное предложение',
			'profilePage.specialOfferBody' => 'Посмотри на предложение, которое мы подготовили для тебя перед уходом.',
			'profilePage.monthlyPlanTitle' => 'Перейти на месячный план',
			'profilePage.monthlyPlanPrice' => '\$79/месяц, отмена в любое время',
			'profilePage.monthlyPlanDesc' => 'Без долгосрочных обязательств. Оставайся на связи с нашим сообществом на месячной основе.',
			'profilePage.whatYoullKeep' => 'Что ты сохранишь:',
			'profilePage.keepCharacters' => 'Доступ ко всем персонажам',
			'profilePage.keepVideo' => 'Неограниченные видеозвонки',
			'profilePage.keepCourses' => 'Доступ ко всем курсам',
			'profilePage.switchMonthlyCta' => 'Перейти на месячный план',
			'profilePage.confirmTitle' => 'Ты уверен?',
			'profilePage.confirmBody' => 'Мы действительно не хотим, чтобы ты уходил. Вот что ты потеряешь:',
			'profilePage.loseCharacters' => 'Неограниченный доступ к персонажам',
			'profilePage.loseVideo' => 'Неограниченный доступ к видеозвонкам',
			'profilePage.loseCourses' => 'Доступ ко всем курсам',
			'profilePage.discountTitle' => 'Останься и получи 60% скидку на 1 месяц',
			'profilePage.discountSubtitle' => 'Наше лучшее предложение. Всего \$27.60/месяц',
			'profilePage.acceptDiscountCta' => 'Принять 60% скидку и остаться',
			'profilePage.farewellTitle' => 'Нам грустно видеть тебя уходящим',
			'profilePage.farewellBody' => ({required Object date}) => 'Твое членство отменено. Ты будешь иметь доступ до конца текущего расчетного периода ${date}.',
			'profilePage.changeMindTitle' => '✨ Передумал?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Ты можешь восстановить свое членство в любое время до ${date}, чтобы сохранить свои преимущества.',
			'profilePage.reactivateCta' => 'Подожди, я хочу восстановить',
			'profilePage.done' => 'ГОТОВО',
			'profilePage.notifications' => 'Уведомления',
			'profilePage.appLanguage' => 'Язык приложения',
			'profilePage.explanationLanguage' => 'Язык объяснений',
			'profilePage.explanationNative' => 'Родной язык',
			'profilePage.explanationEnglish' => 'Английский',
			'profilePage.explanationUpdateFailed' => 'Не удалось обновить язык объяснений',
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
			'profilePage.remindMe' => 'Напомнить',
			'profilePage.reminderSave' => 'Сохранить',
			'profilePage.reminderSaved' => 'Напоминание сохранено',
			'profilePage.selectLanguageTitle' => 'Выбрать язык',
			'profilePage.premium' => 'Премиум',
			'profilePage.passive' => 'Пассивный',
			'profilePage.active' => 'Активен',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Поделиться с другом',
			'profilePage.shareWithFriendTitle' => 'Поделиться с другом',
			'profilePage.shareInviteBody' => 'Пригласи своих друзей и наслаждайтесь переводом вместе',
			'profilePage.rateUs' => 'Оцените нас',
			'profilePage.faq' => 'Часто задаваемые вопросы Lingola',
			'profilePage.faqItems.supportedLanguages.question' => 'Какие языки поддерживает приложение?',
			'profilePage.faqItems.supportedLanguages.answer' => 'Интерфейс Lingola доступен на английском, немецком, итальянском, французском, турецком, японском, испанском, русском, хинди, португальском и упрощённом китайском языках.',
			'profilePage.faqItems.howAiWorks.question' => 'Как работает ИИ?',
			'profilePage.faqItems.howAiWorks.answer' => 'ИИ взаимодействует с тобой как настоящий репетитор. Он анализирует твои разговоры, выявляет ошибки и предлагает персонализированную обратную связь на основе твоего прогресса.',
			'profilePage.faqItems.offlineUse.question' => 'Могу ли я использовать приложение офлайн?',
			'profilePage.faqItems.offlineUse.answer' => 'Да. Ты можешь заранее скачать определенные уроки и сценарии разговоров и использовать их офлайн. Однако для живого чата требуется интернет-соединение.',
			'profilePage.faqItems.isFree.question' => 'Приложение бесплатное?',
			'profilePage.faqItems.isFree.answer' => 'Базовая версия бесплатна. С Премиум ты получаешь расширенные сценарии чата, анализ произношения и режим личного репетитора.',
			'profilePage.faqItems.pronunciationEval.question' => 'Как оценивается мое произношение?',
			'profilePage.faqItems.pronunciationEval.answer' => 'Приложение анализирует твой голос и использует распознавание речи на основе ИИ, чтобы оценить твой акцент и произношение. Слова, которые нужно улучшить, выделяются.',
			'profilePage.faqItems.dailyPractice.question' => 'Мне нужно практиковаться каждый день?',
			'profilePage.faqItems.dailyPractice.answer' => 'Да. Система отслеживает твой прогресс каждый день. Всего 10–15 минут практики разговорной речи в день могут значительно ускорить твое изучение языка.',
			'profilePage.faqItems.levelDetermination.question' => 'Как определяется мой уровень обучения?',
			'profilePage.faqItems.levelDetermination.answer' => 'Краткая проверка уровня при первом входе анализирует твои текущие знания. После этого ИИ автоматически рекомендует уроки, подходящие твоему уровню.',
			'profilePage.faqItems.realPeopleChat.question' => 'Могу ли я общаться с реальными людьми?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Да. Пользователи Премиум могут планировать короткие практические сессии с реальными репетиторами.',
			'profilePage.faqItems.dataSecurity.question' => 'Безопасны ли мои данные?',
			'profilePage.faqItems.dataSecurity.answer' => 'Абсолютно. Все разговоры и данные пользователей хранятся в зашифрованном виде. Твоя личная информация никогда не передается третьим лицам.',
			'profilePage.faqItems.disableReminders.question' => 'Как отключить ежедневные напоминания?',
			'profilePage.faqItems.disableReminders.answer' => 'Перейди в настройки профиля, открой Уведомления и измени частоту напоминаний или полностью отключи уведомления.',
			'profilePage.support' => 'Поддержка',
			'profilePage.feedback' => 'Обратная связь',
			'profilePage.progression' => 'Прогресс',
			'profilePage.progressTitle' => 'Прогресс',
			'profilePage.goodMorning' => 'Доброе утро,',
			'profilePage.progressUserName' => 'Джон',
			'profilePage.progressLanguage' => 'Английский',
			'profilePage.past7Days' => 'Последние 7 дней',
			'profilePage.past7DaysBody' => 'Учись каждый день, чтобы создать свою непрерывность и выработать мощную привычку обучения.',
			'profilePage.currentLevel' => 'Текущий уровень',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Осталось всего ${xp} XP до достижения ${level}!',
			'profilePage.toNextLevel' => 'К СЛЕДУЮЩЕМУ УРОВНЮ',
			'profilePage.dayStreakLabel' => 'День непрерывности',
			'profilePage.totalPoints' => 'Всего очков',
			'profilePage.savedWords' => 'Сохраненные слова',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} элементов для проверки',
			'profilePage.logout' => 'Выйти',
			'profilePage.logoutTitle' => 'Вы собираетесь выйти',
			'profilePage.logoutBody' => 'Увидимся снова скоро! Нам будут не хватать твоих дыхательных упражнений.',
			'profilePage.logoutConfirm' => 'ВЫЙТИ',
			'profilePage.logoutCancel' => 'ОТМЕНА',
			'profilePage.days.mon' => 'ПН',
			'profilePage.days.tue' => 'ВТ',
			'profilePage.days.wed' => 'СР',
			'profilePage.days.thu' => 'ЧТ',
			'profilePage.days.fri' => 'ПТ',
			'profilePage.days.sat' => 'СБ',
			'profilePage.days.sun' => 'ВС',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Ваш сертификат',
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
			'profilePage.certificateVerifyHint' => 'Любой может отсканировать QR-код, чтобы подтвердить ваше достижение.',
			'profilePage.certificateShare' => 'Поделиться сертификатом',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'Сертификат недоступен',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'Вы пока не можете использовать этот сертификат, так как не завершили уроки уровня ${level}.',
			'profilePage.certificateNotAvailableOk' => 'Понятно',
			'profilePage.certificateShareQr' => 'Поделиться QR-кодом',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Когда вы завершите уровень CEFR в Lingola, ваш сертификат появится здесь — с вашим именем, уровнем и QR-кодом для проверки.',
			'profilePage.certificatePreviewHint' => 'Пройдите путь уровня, чтобы открыть сертификат',
			'profilePage.certificateTapToView' => 'Нажмите, чтобы просмотреть и поделиться сертификатом',
			'profilePage.settings' => 'Настройки',
			'profilePage.dailyGoalValueLight' => '5-10 мин/день',
			'profilePage.dailyGoalValueRecommended' => '15-20 мин/день',
			'profilePage.dailyGoalValueFast' => '30+ мин/день',
			'profilePage.settingsShare' => 'Share',
			'profilePage.settingsSupport' => 'Support',
			'profilePage.settingsAbout' => 'About',
			'profilePage.settingsAccount' => 'Account',
			'profilePage.followInstagram' => 'Follow on Instagram',
			'profilePage.followTikTok' => 'Follow on TikTok',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Похоже, вы сделали короткий перерыв.',
			'pushNotifications.h2.1' => 'Есть минутка для одного слова?',
			'pushNotifications.h2.2' => 'Мы здесь — не спешите.',
			'pushNotifications.h2.3' => 'Ваш ритм обучения немного приостановился.',
			'pushNotifications.h2.4' => 'Мини-обзор может быть приятным.',
			'pushNotifications.h4.0' => 'Сегодня вас может ждать новое слово 👀',
			'pushNotifications.h4.1' => 'Возможно, вам захочется немного попрактиковаться.',
			'pushNotifications.h4.2' => 'Вы могли пропустить полезную фразу.',
			'pushNotifications.h4.3' => 'Прогресс на сегодня все еще открыт.',
			'pushNotifications.h4.4' => 'Одно слово, одно предложение… может быть, оба.',
			'pushNotifications.h8.0' => 'Каждый день прогресс не обязателен.',
			'pushNotifications.h8.1' => 'Даже небольшой обзор имеет значение.',
			'pushNotifications.h8.2' => 'Вы ничего не потеряли, не занимаясь сегодня.',
			'pushNotifications.h8.3' => 'Мы готовы, когда вы будете готовы.',
			'pushNotifications.h8.4' => 'Изучение языка — это марафон, а не спринт.',
			'pushNotifications.h24.0' => 'Прошел день. Ваши слова все еще здесь.',
			'pushNotifications.h24.1' => 'Перерыв — это нормально.',
			'pushNotifications.h24.2' => 'Ваше место там, где вы его оставили.',
			'pushNotifications.h24.3' => 'Продолжайте, когда захотите.',
			'pushNotifications.h24.4' => 'Язык не убегает — и мы тоже.',
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
