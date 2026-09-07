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
class TranslationsPt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$pt app = _Translations$app$pt._(_root);
	@override late final _Translations$common$pt common = _Translations$common$pt._(_root);
	@override late final _Translations$onboarding$pt onboarding = _Translations$onboarding$pt._(_root);
	@override late final _Translations$targetLanguage$pt targetLanguage = _Translations$targetLanguage$pt._(_root);
	@override late final _Translations$language$pt language = _Translations$language$pt._(_root);
	@override late final _Translations$setup$pt setup = _Translations$setup$pt._(_root);
	@override late final _Translations$accountCreating$pt accountCreating = _Translations$accountCreating$pt._(_root);
	@override late final _Translations$planReady$pt planReady = _Translations$planReady$pt._(_root);
	@override late final _Translations$demoChat$pt demoChat = _Translations$demoChat$pt._(_root);
	@override late final _Translations$previewChat$pt previewChat = _Translations$previewChat$pt._(_root);
	@override late final _Translations$paywall$pt paywall = _Translations$paywall$pt._(_root);
	@override late final _Translations$auth$pt auth = _Translations$auth$pt._(_root);
	@override late final _Translations$nav$pt nav = _Translations$nav$pt._(_root);
	@override late final _Translations$home$pt home = _Translations$home$pt._(_root);
	@override late final _Translations$libraryPage$pt libraryPage = _Translations$libraryPage$pt._(_root);
	@override late final _Translations$wordPracticePage$pt wordPracticePage = _Translations$wordPracticePage$pt._(_root);
	@override late final _Translations$quizPage$pt quizPage = _Translations$quizPage$pt._(_root);
	@override late final _Translations$placeholder$pt placeholder = _Translations$placeholder$pt._(_root);
	@override late final _Translations$tutorPage$pt tutorPage = _Translations$tutorPage$pt._(_root);
	@override late final _Translations$lessonPage$pt lessonPage = _Translations$lessonPage$pt._(_root);
	@override late final _Translations$rolePlayPage$pt rolePlayPage = _Translations$rolePlayPage$pt._(_root);
	@override late final _Translations$notificationsPage$pt notificationsPage = _Translations$notificationsPage$pt._(_root);
	@override late final _Translations$profilePage$pt profilePage = _Translations$profilePage$pt._(_root);
	@override late final _Translations$pushNotifications$pt pushNotifications = _Translations$pushNotifications$pt._(_root);
	@override late final _Translations$apiErrors$pt apiErrors = _Translations$apiErrors$pt._(_root);
}

// Path: app
class _Translations$app$pt implements Translations$app$en {
	_Translations$app$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
	@override String get notifications => 'Notificações';
	@override String get streak => 'Sequência de aprendizado';
	@override String get profile => 'Perfil';
}

// Path: common
class _Translations$common$pt implements Translations$common$en {
	_Translations$common$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'CONTINUAR';
	@override String get back => 'VOLTAR';
	@override String get locked => 'Bloqueado';
	@override String minutes({required Object value}) => '${value} min';
	@override String get close => 'Fechar';
	@override String get getStarted => 'COMEÇAR';
	@override String get connectionError => 'Sem conexão. Verifique sua internet e tente novamente.';
	@override String get genericError => 'Algo deu errado. Por favor, tente novamente.';
	@override String get tryAgain => 'Tente novamente';
}

// Path: onboarding
class _Translations$onboarding$pt implements Translations$onboarding$en {
	_Translations$onboarding$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Página de integração ${current} de ${total}';
	@override String get letsStart => 'Vamos começar';
	@override late final _Translations$onboarding$slide1$pt slide1 = _Translations$onboarding$slide1$pt._(_root);
	@override late final _Translations$onboarding$slide2$pt slide2 = _Translations$onboarding$slide2$pt._(_root);
	@override late final _Translations$onboarding$slide3$pt slide3 = _Translations$onboarding$slide3$pt._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$pt implements Translations$targetLanguage$en {
	_Translations$targetLanguage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selecione o idioma que você quer aprender';
	@override String get comingSoon => 'Mais idiomas em breve';
	@override String get korean => 'Coreano';
	@override String get portuguese => 'Português';
	@override String get portugueseBrazil => 'Português (Brasil)';
	@override String get german => 'Alemão';
	@override String get italian => 'Italiano';
	@override String get simplifiedChinese => 'Chinês Simplificado';
	@override String get arabic => 'Árabe';
	@override String get turkish => 'Turco';
	@override String get hindi => 'Hindi';
}

// Path: language
class _Translations$language$pt implements Translations$language$en {
	_Translations$language$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => 'Passo ${current} de ${total}';
	@override String get title => 'Sobre o que você quer falar?';
	@override String get nativeSection => 'Eu falo';
	@override String get nativeField => 'Idioma nativo';
	@override String get nativeName => 'Turco';
	@override String get targetSection => 'Eu quero aprender';
	@override String get targetField => 'Idioma alvo';
	@override String get targetName => 'Inglês';
	@override String get direction => 'Direção do idioma';
	@override String get selectLanguage => 'Selecionar idioma';
	@override String get comingSoonBadge => 'Em breve...';
	@override String get english => 'Inglês';
	@override String get french => 'Francês';
	@override String get japanese => 'Japonês';
	@override String get spanish => 'Espanhol';
	@override String get russian => 'Russo';
}

// Path: setup
class _Translations$setup$pt implements Translations$setup$en {
	_Translations$setup$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Por que você quer aprender um novo idioma?';
	@override String get goalHint => 'Vamos preparar um plano de estudo pessoal que se encaixa perfeitamente no seu objetivo';
	@override String get goalCareer => 'Desenvolvimento de Carreira';
	@override String get goalTravel => 'Viajar';
	@override String get goalLiving => 'Viver no Exterior';
	@override String get goalStudying => 'Educação';
	@override String get goalOther => 'Desenvolvimento pessoal';
	@override String get interestsTitle => 'Selecione seus interesses';
	@override String get interestsHint => 'Criaremos uma experiência de aprendizagem personalizada com temas que te interessam.';
	@override String get seeMoreEllipsis => 'Ver mais...';
	@override String get levelTitle => 'Como você descreveria seu nível atual?';
	@override String get paceTitle => 'Em quanto tempo você quer ver um progresso significativo?';
	@override String get explanationTitle => 'Quando você fizer perguntas no seu idioma, como explicamos?';
	@override String get explanationHint => 'Você pode mudar isso a qualquer momento nas configurações do perfil.';
	@override String get explanationNative => 'Explicar no meu idioma nativo';
	@override String get explanationEnglish => 'Explicar em inglês';
	@override String get levelA1 => 'Estou aprendendo este idioma do zero';
	@override String get levelA2 => 'Consigo participar de conversas básicas';
	@override String get levelB1 => 'Consigo lidar com conversas curtas sobre temas familiares';
	@override String get levelB2 => 'Consigo falar em detalhe sobre assuntos do dia a dia';
	@override String get levelC1 => 'Consigo falar com fluência com nativos';
	@override String get levelC2 => 'Consigo me expressar com clareza sobre qualquer assunto';
	@override String get paceHint => 'Ajuda a ajustar o ritmo do seu plano';
	@override String get paceMonth1 => '1 mês';
	@override String get paceMonth2_3 => '2–3 meses';
	@override String get paceMonth6 => '6 meses';
	@override String get paceYear1 => '1 ano';
	@override String get paceRelaxed => 'Não tenho pressa';
	@override String get progressInsightTitle => 'Veja progresso real em apenas 2 semanas!';
	@override String get progressInsightBody => 'Os usuários do Lingola geralmente notam um grande aumento na confiança ao falar desde o início.';
	@override String get progressInsightConfidence => 'Confiança ao falar';
	@override String get progressInsightToday => 'Hoje';
	@override String get progressInsightWeek2 => 'Semana 2';
	@override String get progressInsightWithLingola => 'Com Lingola';
	@override String get progressInsightWithoutApp => 'Sem o app';
	@override String get levelHint => 'O Lingola foi feito para ajudar alunos de todos os níveis';
	@override String get dailyPracticeTitle => 'Quanto você quer praticar por dia?';
	@override String get dailyPracticeHint => 'Siga no seu ritmo, cada dia um passo mais perto.';
	@override String dailyPracticeMonthlyHours({required Object hours}) => '${hours} horas / mês';
	@override String dailyPracticeOnlyMinutes({required Object minutes}) => 'Apenas ${minutes} min por dia';
	@override String dailyPracticeMinutesOption({required Object minutes}) => '${minutes} min';
	@override String get dailyPracticeToday => 'Hoje';
	@override String get practiceTimeTitle => 'Em que horário do dia você quer praticar?';
	@override String get practiceTimeHint => 'Lembretes ajudam a manter sua sequência e a chegar um passo mais perto da sua meta todos os dias.';
	@override String get practiceTimeMorning => 'Manhã';
	@override String get practiceTimeAfternoon => 'Tarde';
	@override String get practiceTimeEvening => 'Noite';
	@override String get practiceTimeFlexible => 'Sou flexível';
	@override String get practiceTimeSave => 'Salvar';
	@override String get setPracticeTimeTitle => 'Defina seu horário';
	@override String get setPracticeTimeHint => 'Em qual intervalo de tempo você gostaria de praticar?';
	@override String get periodAm => 'AM';
	@override String get periodPm => 'PM';
	@override String get promiseTitle => 'Prometo praticar conversação todos os dias';
	@override String get promiseBody => 'E alcançar meus objetivos de idioma o mais rápido possível com tutores de IA';
	@override String get promiseHoldHint => 'Pressione e segure o logo da Lingola para confirmar';
	@override String get aiTutorsIntroTitle => 'Escolha qualquer um dos 20+ tutores de IA no Lingola';
	@override String get aiTutorsIntroBody => 'Todos têm personalidades profundas e sotaques diferentes';
	@override String get aiTutorsIntroCta => 'Vamos te conhecer um pouco';
}

// Path: accountCreating
class _Translations$accountCreating$pt implements Translations$accountCreating$en {
	_Translations$accountCreating$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sua Conta Pessoal Está Sendo Criada';
	@override String get stepContent => 'Conteúdo está sendo criado';
	@override String get stepDialogues => 'Diálogos estão sendo preparados';
	@override String get stepLessons => 'Aulas estão sendo otimizadas';
	@override String get stepPlan => 'Seu plano está sendo finalizado';
	@override String get optimization => 'Otimização';
	@override String progress({required Object value}) => '${value}%';
	@override String get titleLine1 => 'Sua conta';
	@override String get titleLine2 => 'está sendo criada';
	@override String get testimonialQuote => 'Na primeira semana eu mal conseguia dizer oi. Na terceira já tinha conversas completas com meu tutor de IA. Não vou parar.';
	@override String get testimonialAuthor => 'Maria, 29 — há 3 meses';
	@override String get comparisonPitch => 'Aprenda mais de 600 frases extras com o Lingola, cerca de 30× mais rápido do que sozinho.';
	@override String get comparisonAloneCount => '400';
	@override String get comparisonLingolaCount => '1000';
	@override String get comparisonUnit => 'FRASES';
	@override String get comparisonAloneLabel => 'Sozinho';
	@override String get comparisonLingolaLabel => 'Lingola';
	@override String get fluencyPitch => 'De hoje à fluência — seu próximo nível está a apenas 30 dias';
	@override String get chartToday => 'Hoje';
	@override String get chartMid => '15 set';
	@override String get chartEnd => '30 set';
}

// Path: planReady
class _Translations$planReady$pt implements Translations$planReady$en {
	_Translations$planReady$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get titleLine1 => 'Seu plano está';
	@override String get titleLine2 => 'pronto!';
	@override String get statBanner => '95% of users see results within the first 7 days';
	@override String planTitle({required Object name}) => '${name}\'S PLAN';
	@override String get defaultName => 'YOUR';
	@override String get fieldCourse => 'COURSE';
	@override String get fieldLevel => 'YOUR LEVEL';
	@override String get fieldFocus => 'FOCUS AREA';
	@override String get fieldDuration => 'DURATION';
	@override String get fieldInterests => 'INTERESSES';
	@override String get startPlan => 'Começar meu plano →';
	@override String get courseEnglish => 'English';
	@override String get courseGerman => 'German';
	@override String get courseFrench => 'French';
	@override String get courseItalian => 'Italian';
	@override String get courseSpanish => 'Spanish';
	@override String get courseJapanese => 'Japanese';
	@override String get courseRussian => 'Russian';
	@override String get courseTurkish => 'Turkish';
	@override String get goalCareer => 'Desenvolvimento de Carreira';
	@override String get goalTravel => 'Viajar';
	@override String get goalLiving => 'Viver no Exterior';
	@override String get goalStudying => 'Educação';
	@override String get goalOther => 'Desenvolvimento pessoal';
	@override String get levelA1 => 'A1';
	@override String get levelA2 => 'A2';
	@override String get levelB1 => 'B1';
	@override String get levelB2 => 'B2';
	@override String get levelC1 => 'C1';
	@override String get levelC2 => 'C2';
	@override String get paceMonth1 => '1 mês';
	@override String get paceMonth2_3 => '2–3 meses';
	@override String get paceMonth6 => '6 meses';
	@override String get paceYear1 => '1 ano';
	@override String get paceRelaxed => 'Não tenho pressa';
}

// Path: demoChat
class _Translations$demoChat$pt implements Translations$demoChat$en {
	_Translations$demoChat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$pt implements Translations$previewChat$en {
	_Translations$previewChat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Lição 1: Saudações';
	@override String get speed => '1x';
	@override String get typeMessage => 'Digite uma mensagem...';
	@override String get incoming1 => 'Oi! Bem-vindo ao Lingola — sou seu tutor de IA. Não importa seu nível: aqui você se sentirá seguro enquanto aprende inglês. Em inglês dizemos \'Hi\' ou \'Hello\' — tente: escreva \'Hi!\' para mim em inglês!';
	@override String get outgoing1 => 'Oi! Estou pronto para praticar.';
	@override String get incoming2Highlight => 'Bom dia';
	@override String get incoming2Rest => ', Emrah! Fico feliz que você esteja se sentindo pronto. Um café da manhã é sempre um ótimo começo para construir uma conexão. Sobre o que você gostaria de conversar?';
	@override String get holdToSpeak => 'Segure para falar';
	@override String get recording => 'Gravando… solte para enviar';
	@override String get slideUpToLock => 'Deslize para cima para travar';
	@override String get slideLeftToCancel => 'Deslize para a esquerda para cancelar';
	@override String get recordingLockedHint => 'Toque em enviar quando terminar';
}

// Path: paywall
class _Translations$paywall$pt implements Translations$paywall$en {
	_Translations$paywall$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comece a Falar Hoje — Grátis';
	@override String get subtitle => 'Oportunidades de aprendizado ilimitadas';
	@override String get noCommitment => 'Sem compromisso';
	@override String get cancelAnytime => 'Cancele a qualquer momento';
	@override String get noPaymentToday => 'Sem pagamento hoje';
	@override String get daysFree => '3 Dias Grátis';
	@override String get thenPrice => 'Depois \$1.99/mês';
	@override String get trialActive => 'Teste Grátis Ativo';
	@override String get payableToday => 'Pagável Hoje';
	@override String get payableValue => '3 Dias Grátis 0.00\$';
	@override String get paymentDate => 'Data do pagamento: 13 de março de 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$pt implements Translations$auth$en {
	_Translations$auth$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Nossos diversos treinadores de IA';
	@override String get title => 'Comece a Falar um Novo Idioma, Hoje';
	@override String get body => 'Pratique conversas reais com IA.\nSem pressão. Sem julgamentos.';
	@override String get continueGoogle => 'Continuar com o Google';
	@override String get continueApple => 'Continuar com a Apple';
	@override String get continueGuest => 'Continuar como Convidado';
	@override String get or => 'ou';
	@override String get alreadyHaveAccount => 'Já tem uma conta?';
	@override String get signIn => 'Entrar';
	@override String get legal => 'Ao se inscrever no Lingola, você concorda com nossos Termos de Serviço. Saiba como processamos seus dados em nossa Política de Privacidade e Política de Cookies';
	@override String get terms => 'Termos de Serviço';
	@override String get privacy => 'Política de Privacidade';
	@override String get cookies => 'Política de Cookies';
}

// Path: nav
class _Translations$nav$pt implements Translations$nav$en {
	_Translations$nav$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get tutor => 'Professor';
	@override String get lesson => 'Lição';
	@override String get rolePlay => 'Atuação';
	@override String get profile => 'Perfil';
}

// Path: home
class _Translations$home$pt implements Translations$home$en {
	_Translations$home$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Bom Dia, Jhon';
	@override String get todayPractice => 'Prática de Hoje';
	@override String get continueConversation => 'Continuar Conversa';
	@override String continueWithTutor({required Object name}) => 'Continuar com ${name} ou escolher outro tutor?';
	@override String continueSameTutor({required Object name}) => 'Continuar com ${name}';
	@override String get chooseOtherTutor => 'Escolher outro tutor';
	@override String minutesLeft({required Object value}) => '${value} min restantes';
	@override String get lessonProgress => 'Lição 2 — Saudações';
	@override String get timeCurrent => '0min';
	@override String get timeTotal => '/ 15min';
	@override String get kContinue => 'Continuar';
	@override String get learningPath => 'A1 - Iniciante';
	@override String get allLessons => 'Todas as Lições';
	@override String get introductions => 'Apresentações I';
	@override String get greetings => 'Saudações';
	@override String get jobs => 'Trabalhos';
	@override String get favoriteRoom => 'Uma Sala Favorita';
	@override String get dailyRoutine => 'Rotina Diária';
	@override String get scroll => 'Deslizar';
	@override String get liveLesson => 'Aula Ao Vivo';
	@override String get liveLessonSubtitle => 'Faça uma videochamada com nosso tutor';
	@override String get moreTutor => 'Mais Tutor';
	@override String get startTalkNow => 'Começar a Conversar Agora';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Adaptável';
	@override String get tagCalm => 'Calmo';
	@override String get tagPatient => 'Paciente';
	@override String get tagMethodical => 'Metódico';
	@override String get tagEncouraging => 'Encorajador';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Mais Recursos';
	@override String get practiceLabel => 'PRÁTICA';
	@override String get wordPractice => 'Prática de Palavras';
	@override String get wordPracticeBody => 'Construa seu vocabulário na língua escolhida diariamente';
	@override String get immersiveLabel => 'IMERSIVO';
	@override String get quiz => 'Quiz';
	@override String get quizBodyLine1 => 'Aprenda através de';
	@override String get quizBodyLine2 => 'exemplos reais em contexto';
	@override String get getStarted => 'Começar';
	@override String get library => 'Biblioteca';
	@override String get libraryTitle => 'Aprenda e Economize';
	@override String get learnMore => 'Saiba Mais';
	@override late final _Translations$home$premium$pt premium = _Translations$home$premium$pt._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$pt implements Translations$libraryPage$en {
	_Translations$libraryPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Biblioteca';
	@override String get searchWord => 'Buscar Palavra';
	@override String savedWordCount({required Object count}) => '${count} Palavra Salva';
	@override String get savedWordTab => 'Palavra Salva';
	@override String get dictionaryTab => 'Dicionário';
	@override String get dictionaryLabel => 'Dicionário';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$pt implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prática de Palavras';
	@override String get turkish => 'TURCO';
	@override String get save => 'Salvar';
	@override String get saved => 'Salvo';
	@override String get listen => 'Ouvir';
	@override String get hint => 'Dica';
	@override String get previous => 'ANTERIOR';
	@override String get next => 'PRÓXIMO';
}

// Path: quizPage
class _Translations$quizPage$pt implements Translations$quizPage$en {
	_Translations$quizPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quiz';
	@override String get headline => 'O que você quer melhorar hoje?';
	@override String get subtitle => 'Escolha seu treino — leva menos de 3 minutos 🚀';
	@override String get readingTitle => 'Leitura';
	@override String get readingBody => 'Compreensão através de artigos e histórias';
	@override String get writingTitle => 'Escrita';
	@override String get writingBody => 'Exercícios de gramática e vocabulário';
	@override String get speakingTitle => 'Fala';
	@override String get speakingBody => 'Pronúncia via motor de fala de IA';
	@override String get readingTestTitle => 'Teste de Leitura';
	@override String get read => 'Ler';
	@override String get listeningHint => 'Fale a palavra em inglês claramente...';
	@override String get micPermissionDenied => 'Microfone ou reconhecimento de fala indisponível.';
	@override String get matchSuccess => 'Ótimo! Isso combina com a palavra.';
	@override String matchFail({required Object heard}) => 'Ouvi "${heard}". Tente novamente.';
	@override String get successfulTitle => 'Sucesso!';
	@override String get successfulBody => 'Pronúncia como um falante nativo!';
	@override String get failedTitle => 'Falhou';
	@override String get failedBody => 'Estava quase lá, dê mais uma chance';
	@override String get tryAgain => 'TENTE NOVAMENTE';
	@override String get writingTestTitle => 'Teste de Escrita';
	@override String get sourceLanguage => 'IDIOMA DE ORIGEM';
	@override String get answer => 'RESPOSTA';
	@override String get writeAnswerHint => 'Escreva sua resposta aqui...';
	@override String get submit => 'Enviar';
	@override String get speakingTestTitle => 'Teste de Fala';
	@override String get speakingProficiency => 'Proficiência em Fala';
	@override String get speakClearlyHint => 'Fale claramente no seu microfone:';
	@override String get speakUp => 'Fale Alto';
	@override String get recording => 'Gravando...';
	@override String questionOf({required Object current, required Object total}) => 'PERGUNTA ${current} DE ${total}';
}

// Path: placeholder
class _Translations$placeholder$pt implements Translations$placeholder$en {
	_Translations$placeholder$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} está a caminho';
	@override String body({required Object tab}) => 'Estamos preparando uma experiência focada em ${tab} para você.';
}

// Path: tutorPage
class _Translations$tutorPage$pt implements Translations$tutorPage$en {
	_Translations$tutorPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tutor';
	@override String get chatWithLingola => 'Converse com a Lingola';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => 'Converse com ${name}';
	@override String get chatHistory => 'Histórico de Conversas';
	@override String get history => 'Histórico';
	@override String get filter => 'Filtro';
	@override String get country => 'País';
	@override String get focus => 'Foco';
	@override String get moreCountries => '8+ mais';
	@override String get moreFocus => '+8';
	@override String get save => 'SALVAR';
	@override String get clearFilter => 'Remover filtros';
	@override String get startTalkNow => 'Começar a Conversar Agora';
	@override String get typeMessage => 'Digite uma mensagem...';
	@override String get speaker => 'Falante';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$pt tutors = _Translations$tutorPage$tutors$pt._(_root);
	@override late final _Translations$tutorPage$tags$pt tags = _Translations$tutorPage$tags$pt._(_root);
	@override String get historyPreview1 => 'Oi! Eu estava prestes a explodir de tédio...';
	@override String get historyPreview2 => 'Vamos praticar pedir comida hoje?';
	@override String get time1 => '11:00 AM';
	@override String get time2 => 'Ontem';
	@override late final _Translations$tutorPage$chat$pt chat = _Translations$tutorPage$chat$pt._(_root);
	@override late final _Translations$tutorPage$calling$pt calling = _Translations$tutorPage$calling$pt._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$pt implements Translations$lessonPage$en {
	_Translations$lessonPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Continue Aprendendo';
	@override String get profile => 'Perfil';
	@override String get language => 'Idioma alvo';
	@override String get completed => 'Concluído';
	@override String get locked => 'Bloqueado';
	@override String get pickTutorTitle => 'Escolha seu tutor';
	@override String get startTalk => 'Iniciar lição';
	@override String get chatInstead => 'Conversar em vez disso';
	@override String get lockedHint => 'Termine a lição anterior para desbloquear esta.';
	@override String get levelLockedTitle => 'Nível bloqueado';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'Seu nível de inglês é ${userLevel}, então você não pode abrir lições de ${lessonLevel} sem concluir o caminho anterior.';
	@override String get levelLockedOk => 'Entendi';
	@override String get notesTitle => 'Notas da lição';
	@override String get whatWeLearned => 'O que aprendemos hoje';
	@override String get deleteNotes => 'Excluir minhas notas da lição';
	@override String get deleteNotesConfirm => 'Excluir essas notas? Isso não pode ser desfeito.';
	@override String get delete => 'Excluir';
	@override String get cancel => 'Cancelar';
	@override String get practiceCta => 'Se isso pareceu difícil, você pode praticar o mesmo tópico novamente.';
	@override String get practiceNow => 'Praticar este tópico';
	@override String get openChat => 'Abrir chat com o tutor';
	@override String get yourScore => 'Sua pontuação';
	@override String bestScore({required Object score}) => 'Melhor ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Participante passivo';
	@override String get participationSilentBody => 'Você ficou quieto desta vez. Acho que você deveria refazer esta lição.';
	@override String get participationPassive => 'Baixa participação';
	@override String get participationPassiveBody => 'Você quase não falou. Tente a lição novamente e fale mais.';
	@override String get participationActive => 'Boa participação';
	@override String get participationActiveBody => 'Você entrou na conversa. Continue assim!';
	@override String get participationStrong => 'Participação forte';
	@override String get participationStrongBody => 'Você falou bastante. Ótimo trabalho!';
	@override String get retakeLesson => 'Refazer esta lição';
	@override String get finishLesson => 'Finalizar lição';
	@override String get savingNotes => 'Seu tutor está escrevendo as notas de hoje...';
	@override String get noNotes => 'Termine esta lição para receber as notas do seu tutor.';
	@override String get notesDeleted => 'Notas da lição excluídas';
	@override late final _Translations$lessonPage$levels$pt levels = _Translations$lessonPage$levels$pt._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$pt implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Role Play';
	@override String get subtitle => 'Escolha seu papel — viva um cenário da vida real 🎭';
	@override String progressCompleted({required Object value}) => '%${value} concluído';
	@override String minutes({required Object value}) => '${value} Min';
	@override String get beginner => 'Iniciante';
	@override String get screenplay => 'ROTEIRO';
	@override String get dailyInteractions => 'Interações Diárias';
	@override String get business => 'Negócios';
	@override late final _Translations$rolePlayPage$coffee$pt coffee = _Translations$rolePlayPage$coffee$pt._(_root);
	@override late final _Translations$rolePlayPage$coffeeQueue$pt coffeeQueue = _Translations$rolePlayPage$coffeeQueue$pt._(_root);
	@override late final _Translations$rolePlayPage$coffeeRecommendation$pt coffeeRecommendation = _Translations$rolePlayPage$coffeeRecommendation$pt._(_root);
	@override late final _Translations$rolePlayPage$coffeeWrongOrder$pt coffeeWrongOrder = _Translations$rolePlayPage$coffeeWrongOrder$pt._(_root);
	@override late final _Translations$rolePlayPage$directions$pt directions = _Translations$rolePlayPage$directions$pt._(_root);
	@override late final _Translations$rolePlayPage$directionsWrongWay$pt directionsWrongWay = _Translations$rolePlayPage$directionsWrongWay$pt._(_root);
	@override late final _Translations$rolePlayPage$directionsTransit$pt directionsTransit = _Translations$rolePlayPage$directionsTransit$pt._(_root);
	@override late final _Translations$rolePlayPage$directionsLost$pt directionsLost = _Translations$rolePlayPage$directionsLost$pt._(_root);
	@override late final _Translations$rolePlayPage$interview$pt interview = _Translations$rolePlayPage$interview$pt._(_root);
	@override late final _Translations$rolePlayPage$interviewSalary$pt interviewSalary = _Translations$rolePlayPage$interviewSalary$pt._(_root);
	@override late final _Translations$rolePlayPage$interviewExperience$pt interviewExperience = _Translations$rolePlayPage$interviewExperience$pt._(_root);
	@override late final _Translations$rolePlayPage$interviewStrengths$pt interviewStrengths = _Translations$rolePlayPage$interviewStrengths$pt._(_root);
	@override String get customScenarios => 'Your scenarios';
	@override String get createOwnScenario => 'Crie seu próprio cenário!';
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
	@override late final _Translations$rolePlayPage$missedTrain$pt missedTrain = _Translations$rolePlayPage$missedTrain$pt._(_root);
	@override late final _Translations$rolePlayPage$missedTrainRefund$pt missedTrainRefund = _Translations$rolePlayPage$missedTrainRefund$pt._(_root);
	@override late final _Translations$rolePlayPage$missedTrainTicket$pt missedTrainTicket = _Translations$rolePlayPage$missedTrainTicket$pt._(_root);
	@override late final _Translations$rolePlayPage$missedTrainNext$pt missedTrainNext = _Translations$rolePlayPage$missedTrainNext$pt._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$pt flightAttendant = _Translations$rolePlayPage$flightAttendant$pt._(_root);
	@override late final _Translations$rolePlayPage$flightDelay$pt flightDelay = _Translations$rolePlayPage$flightDelay$pt._(_root);
	@override late final _Translations$rolePlayPage$flightSpecialMeal$pt flightSpecialMeal = _Translations$rolePlayPage$flightSpecialMeal$pt._(_root);
	@override late final _Translations$rolePlayPage$flightSeat$pt flightSeat = _Translations$rolePlayPage$flightSeat$pt._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$pt trainTicket = _Translations$rolePlayPage$trainTicket$pt._(_root);
	@override late final _Translations$rolePlayPage$trainTicketUpgrade$pt trainTicketUpgrade = _Translations$rolePlayPage$trainTicketUpgrade$pt._(_root);
	@override late final _Translations$rolePlayPage$trainTicketPlatform$pt trainTicketPlatform = _Translations$rolePlayPage$trainTicketPlatform$pt._(_root);
	@override late final _Translations$rolePlayPage$trainTicketChange$pt trainTicketChange = _Translations$rolePlayPage$trainTicketChange$pt._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$pt restaurantReservation = _Translations$rolePlayPage$restaurantReservation$pt._(_root);
	@override late final _Translations$rolePlayPage$restaurantComplaint$pt restaurantComplaint = _Translations$rolePlayPage$restaurantComplaint$pt._(_root);
	@override late final _Translations$rolePlayPage$restaurantAllergy$pt restaurantAllergy = _Translations$rolePlayPage$restaurantAllergy$pt._(_root);
	@override late final _Translations$rolePlayPage$restaurantChange$pt restaurantChange = _Translations$rolePlayPage$restaurantChange$pt._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$pt doctorAppointment = _Translations$rolePlayPage$doctorAppointment$pt._(_root);
	@override late final _Translations$rolePlayPage$doctorFollowUp$pt doctorFollowUp = _Translations$rolePlayPage$doctorFollowUp$pt._(_root);
	@override late final _Translations$rolePlayPage$doctorPrescription$pt doctorPrescription = _Translations$rolePlayPage$doctorPrescription$pt._(_root);
	@override late final _Translations$rolePlayPage$doctorSymptoms$pt doctorSymptoms = _Translations$rolePlayPage$doctorSymptoms$pt._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$pt shoppingClothes = _Translations$rolePlayPage$shoppingClothes$pt._(_root);
	@override late final _Translations$rolePlayPage$shoppingDiscount$pt shoppingDiscount = _Translations$rolePlayPage$shoppingDiscount$pt._(_root);
	@override late final _Translations$rolePlayPage$shoppingReturn$pt shoppingReturn = _Translations$rolePlayPage$shoppingReturn$pt._(_root);
	@override late final _Translations$rolePlayPage$shoppingFittingRoom$pt shoppingFittingRoom = _Translations$rolePlayPage$shoppingFittingRoom$pt._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$pt takingTaxi = _Translations$rolePlayPage$takingTaxi$pt._(_root);
	@override late final _Translations$rolePlayPage$taxiComplaint$pt taxiComplaint = _Translations$rolePlayPage$taxiComplaint$pt._(_root);
	@override late final _Translations$rolePlayPage$taxiTraffic$pt taxiTraffic = _Translations$rolePlayPage$taxiTraffic$pt._(_root);
	@override late final _Translations$rolePlayPage$taxiFare$pt taxiFare = _Translations$rolePlayPage$taxiFare$pt._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$pt rentingApartment = _Translations$rolePlayPage$rentingApartment$pt._(_root);
	@override late final _Translations$rolePlayPage$rentingApartmentNegotiate$pt rentingApartmentNegotiate = _Translations$rolePlayPage$rentingApartmentNegotiate$pt._(_root);
	@override late final _Translations$rolePlayPage$rentingApartmentAgent$pt rentingApartmentAgent = _Translations$rolePlayPage$rentingApartmentAgent$pt._(_root);
	@override late final _Translations$rolePlayPage$rentingApartmentTour$pt rentingApartmentTour = _Translations$rolePlayPage$rentingApartmentTour$pt._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$pt birthdayParty = _Translations$rolePlayPage$birthdayParty$pt._(_root);
	@override late final _Translations$rolePlayPage$birthdaySurprise$pt birthdaySurprise = _Translations$rolePlayPage$birthdaySurprise$pt._(_root);
	@override late final _Translations$rolePlayPage$birthdayGifts$pt birthdayGifts = _Translations$rolePlayPage$birthdayGifts$pt._(_root);
	@override late final _Translations$rolePlayPage$birthdayInvite$pt birthdayInvite = _Translations$rolePlayPage$birthdayInvite$pt._(_root);
	@override String get deleteFailed => 'Não foi possível apagar o cenário. Tenta novamente.';
	@override String get easy => 'Fácil';
	@override String get medium => 'Médio';
	@override String get hard => 'Difícil';
	@override String get filterAll => 'Tudo';
	@override String get seeAll => 'Ver tudo';
	@override String get lingolaRolePlay => 'Lingola RolePlay';
	@override String get shopping => 'Compras';
	@override String get flirting => 'Flerte';
	@override String get lifeInTheUs => 'Vida nos EUA';
	@override String get freeDiscussion => 'Discussão livre';
	@override String get jobInterview => 'Entrevista de emprego';
	@override String get socialDynamics => 'Dinâmica social';
	@override String get restaurant => 'Restaurante';
	@override String get travel => 'Viagem';
	@override String get createFieldDifficulty => 'Dificuldade';
	@override late final _Translations$rolePlayPage$flirtingMeet$pt flirtingMeet = _Translations$rolePlayPage$flirtingMeet$pt._(_root);
	@override late final _Translations$rolePlayPage$flirtingAwkward$pt flirtingAwkward = _Translations$rolePlayPage$flirtingAwkward$pt._(_root);
	@override late final _Translations$rolePlayPage$flirtingAskOut$pt flirtingAskOut = _Translations$rolePlayPage$flirtingAskOut$pt._(_root);
	@override late final _Translations$rolePlayPage$flirtingCompliment$pt flirtingCompliment = _Translations$rolePlayPage$flirtingCompliment$pt._(_root);
	@override late final _Translations$rolePlayPage$freeTalkHobby$pt freeTalkHobby = _Translations$rolePlayPage$freeTalkHobby$pt._(_root);
	@override late final _Translations$rolePlayPage$freeTalkDisagree$pt freeTalkDisagree = _Translations$rolePlayPage$freeTalkDisagree$pt._(_root);
	@override late final _Translations$rolePlayPage$freeTalkMovies$pt freeTalkMovies = _Translations$rolePlayPage$freeTalkMovies$pt._(_root);
	@override late final _Translations$rolePlayPage$freeTalkWeekend$pt freeTalkWeekend = _Translations$rolePlayPage$freeTalkWeekend$pt._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$pt implements Translations$notificationsPage$en {
	_Translations$notificationsPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notificações';
	@override String get deleteConfirmTitle => 'Tem certeza?';
	@override String get deleteConfirmBody => 'Esta notificação será excluída.';
	@override String get delete => 'Excluir';
	@override String get cancel => 'Cancelar';
	@override late final _Translations$notificationsPage$translation$pt translation = _Translations$notificationsPage$translation$pt._(_root);
	@override late final _Translations$notificationsPage$offer$pt offer = _Translations$notificationsPage$offer$pt._(_root);
	@override late final _Translations$notificationsPage$stories$pt stories = _Translations$notificationsPage$stories$pt._(_root);
	@override late final _Translations$notificationsPage$practice$pt practice = _Translations$notificationsPage$practice$pt._(_root);
	@override late final _Translations$notificationsPage$streak$pt streak = _Translations$notificationsPage$streak$pt._(_root);
	@override late final _Translations$notificationsPage$premium$pt premium = _Translations$notificationsPage$premium$pt._(_root);
	@override String get emptyTitle => 'Nenhuma notificação ainda';
	@override String get emptySubtitle => 'Não se esqueça de verificar novamente quando receber uma notificação.';
}

// Path: profilePage
class _Translations$profilePage$pt implements Translations$profilePage$en {
	_Translations$profilePage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Versão Grátis';
	@override String get dayStreak => 'Sequência de Dias!';
	@override String get accountSettings => 'Configurações da Conta';
	@override String get general => 'Geral';
	@override String get profileSettings => 'Configurações do Perfil';
	@override String get fullName => 'Nome Completo';
	@override String get changeName => 'Alterar nome';
	@override String get email => 'E-mail';
	@override String get deleteAccount => 'Excluir Conta';
	@override String get save => 'SALVAR';
	@override String get saveTitle => 'Salvar';
	@override String get deleteTitle => 'Não queremos que você vá, mas entendemos.';
	@override String get deleteBody => 'Você pode nos dizer por que deseja sair para melhorarmos a experiência do Lingola?';
	@override late final _Translations$profilePage$deleteReasons$pt deleteReasons = _Translations$profilePage$deleteReasons$pt._(_root);
	@override String get messageOptional => 'Mensagem (opcional)';
	@override String get messageHint => 'Se você tiver uma mensagem, por favor escreva.';
	@override String get next => 'PRÓXIMO';
	@override String get specialOfferTitle => 'Oferta Especial';
	@override String get specialOfferBody => 'Antes de sair, confira a oferta que preparamos para você.';
	@override String get monthlyPlanTitle => 'Fique e ganhe 50% de desconto por 1 ano';
	@override String get monthlyPlanPrice => 'Nossa melhor oferta de todas. Apenas \$24,99/ano';
	@override String get monthlyPlanDesc => 'Nossa melhor oferta — 50% de desconto no plano anual.';
	@override String get whatYoullKeep => 'O que você vai manter:';
	@override String get keepCharacters => 'Acesso a todos os personagens';
	@override String get keepVideo => 'Chamadas de vídeo ilimitadas';
	@override String get keepCourses => 'Acesso a todos os cursos';
	@override String get switchMonthlyCta => 'Aceitar 50% de desconto e ficar';
	@override String get confirmTitle => 'Você tem certeza?';
	@override String get confirmBody => 'Nós realmente não queremos que você vá. Aqui está o que você vai perder:';
	@override String get loseCharacters => 'Acesso ilimitado a personagens';
	@override String get loseVideo => 'Acesso ilimitado a chamadas de vídeo';
	@override String get loseCourses => 'Acesso a todos os cursos';
	@override String get discountTitle => 'Fique e ganhe 50% de desconto por 1 ano';
	@override String get discountSubtitle => 'Nossa melhor oferta de todas. Apenas \$24,99/ano';
	@override String get acceptDiscountCta => 'Aceitar 50% de desconto e ficar';
	@override String get deleteCta => 'DELETE';
	@override String get farewellTitle => 'Estamos tristes em ver você partir';
	@override String farewellBody({required Object date}) => 'Sua assinatura foi cancelada. Você terá acesso até o final do seu período de cobrança atual em ${date}.';
	@override String get changeMindTitle => '✨ Mudou de ideia?';
	@override String changeMindBody({required Object date}) => 'Você pode reativar sua assinatura a qualquer momento antes de ${date} para manter seus benefícios.';
	@override String get reactivateCta => 'Espera, quero reativar';
	@override String get done => 'FEITO';
	@override String get notifications => 'Notificações';
	@override String get appLanguage => 'Idioma do App';
	@override String get explanationLanguage => 'Idioma das explicações';
	@override String get explanationNative => 'Idioma nativo';
	@override String get explanationEnglish => 'Inglês';
	@override String get explanationUpdateFailed => 'Não foi possível atualizar o idioma das explicações';
	@override String get learnInNativeLanguage => 'Aprenda no seu idioma nativo';
	@override String get targetLanguageLabel => 'Idioma alvo';
	@override String get languageLevel => 'Nível de idioma';
	@override String get nativeLanguage => 'Idioma nativo';
	@override String get interests => 'Interesses';
	@override String get goalChipCareer => 'Carreira';
	@override String get goalChipTravel => 'Viagem';
	@override String get goalChipLiving => 'Vida';
	@override String get goalChipStudying => 'Estudos';
	@override String get goalChipOther => 'Outro';
	@override String get dailyGoal => 'Meta diária';
	@override String get dailyReminder => 'Lembrete diário';
	@override String get selectNativeLanguageTitle => 'Selecione seu idioma nativo';
	@override String get reminderOn => 'Ligado';
	@override String get reminderOff => 'Desligado';
	@override String get remindMe => 'Lembrar-me';
	@override String get reminderSave => 'Salvar';
	@override String get reminderSaved => 'Lembrete salvo';
	@override String get selectLanguageTitle => 'Selecionar Idioma';
	@override String get premium => 'Premium';
	@override String get passive => 'Passivo';
	@override String get active => 'Ativo';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Compartilhar com Amigo';
	@override String get shareWithFriendTitle => 'Compartilhar com Amigo';
	@override String get shareInviteBody => 'Convide seus amigos e aproveitem a tradução juntos';
	@override String get rateUs => 'Avalie-nos';
	@override String get faq => 'Perguntas frequentes do Lingola';
	@override String get contactUs => 'Fale conosco';
	@override late final _Translations$profilePage$faqItems$pt faqItems = _Translations$profilePage$faqItems$pt._(_root);
	@override String get support => 'Suporte';
	@override String get feedback => 'Feedback';
	@override String get progression => 'Progressão';
	@override String get progressTitle => 'Progresso';
	@override String get goodMorning => 'Bom Dia,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'Inglês';
	@override String get past7Days => 'Últimos 7 Dias';
	@override String get past7DaysBody => 'Estude todos os dias para construir sua sequência e criar um hábito de aprendizado poderoso.';
	@override String get currentLevel => 'Nível Atual';
	@override String xpLeft({required Object xp, required Object level}) => 'Faltam apenas ${xp} XP para alcançar o nível ${level}!';
	@override String get toNextLevel => 'PARA O PRÓXIMO NÍVEL';
	@override String get dayStreakLabel => 'Sequência de Dias';
	@override String get totalPoints => 'Total de Pontos';
	@override String get savedWords => 'Palavras Salvas';
	@override String itemsToReview({required Object count}) => '${count} itens para revisar';
	@override String get logout => 'Sair';
	@override String get logoutTitle => 'Tem certeza de que deseja sair?';
	@override String get logoutBody => 'Até logo! Sentiremos falta dos seus exercícios de respiração.';
	@override String get logoutConfirm => 'SAIR';
	@override String get logoutCancel => 'CANCELAR';
	@override late final _Translations$profilePage$days$pt days = _Translations$profilePage$days$pt._(_root);
	@override String get profileSaved => 'Profile saved';
	@override String get profilePhotoUpdated => 'Profile photo updated';
	@override String get nameCannotBeEmpty => 'Name cannot be empty';
	@override String get profileSaveFailed => 'Could not save profile';
	@override String get photoUploadFailed => 'Photo upload failed';
	@override String get notificationsUpdateFailed => 'Could not update notifications';
	@override String get notificationsPermissionDenied => 'Permita notificações nas configurações do dispositivo para receber lembretes de estudo.';
	@override String get certificateTitle => 'Seu certificado';
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
	@override String get certificateVerifyHint => 'Qualquer pessoa pode escanear o código QR para verificar sua conquista.';
	@override String get certificateShare => 'Compartilhar certificado';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => 'Certificado bloqueado';
	@override String certificateNotAvailable({required Object level}) => 'Você ainda não pode usar este certificado porque não concluiu suas lições de ${level}.';
	@override String get certificateNotAvailableOk => 'Entendi';
	@override String get certificateShareQr => 'Compartilhar código QR';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Quando você concluir um nível CEFR no Lingola, seu certificado aparecerá aqui — com seu nome, nível e um código QR para verificação.';
	@override String get certificatePreviewHint => 'Conclua um caminho de nível para desbloquear seu certificado';
	@override String get certificateTapToView => 'Toque para ver e compartilhar seu certificado';
	@override String get settings => 'Configurações';
	@override String get dailyGoalValueLight => '5-10 min/dia';
	@override String get dailyGoalValueRecommended => '15-20 min/dia';
	@override String get dailyGoalValueFast => '30+ min/dia';
	@override String get settingsShare => 'Compartilhar';
	@override String get settingsSupport => 'Suporte';
	@override String get settingsAbout => 'Sobre';
	@override String get settingsAccount => 'Conta';
	@override String get followInstagram => 'Seguir no Instagram';
	@override String get followTikTok => 'Seguir no TikTok';
	@override String get chineseShort => 'Chinês';
	@override String get seeMore => 'Ver mais...';
	@override String get searchLanguages => 'Pesquisar';
	@override String get shareLingola => 'Compartilhar Lingola';
	@override String get settingsCertificates => 'Certificados';
	@override String get restorePurchases => 'Restaurar compras';
	@override String get aboutFlywork => 'Sobre a Flywork';
	@override String get faqHelp => 'Perguntas frequentes e ajuda';
	@override String get deleteAccountAndData => 'Excluir conta e dados';
	@override String get interestShopping => 'Compras';
	@override String get interestFood => 'Comida';
	@override String get interestPopCulture => 'Cultura pop';
	@override String get interestFilm => 'Filme';
	@override String get interestMusic => 'Música';
	@override String get interestSport => 'Esportes';
	@override String get interestTechnology => 'Tecnologia';
	@override String get interestScience => 'Ciência';
	@override String get interestHealth => 'Saúde';
	@override String get interestFashion => 'Moda';
	@override String get interestArt => 'Arte';
	@override String get interestLiterature => 'Literatura';
	@override String get interestHistory => 'História';
	@override String get interestCulture => 'Cultura';
	@override String get interestAstronomy => 'Astronomia';
	@override String get interestPet => 'Animais de estimação';
	@override String get interestSocialMedia => 'Redes sociais';
	@override String get interestEntrepreneur => 'Empreendedorismo';
	@override String get confirmDeleteWarning => 'Sua conta e todo o seu progresso serão excluídos permanentemente. Esta ação não pode ser desfeita.';
	@override String get confirmKeepGoing => 'Não desista do progresso';
	@override String get myCertificates => 'Meus certificados';
	@override String get certificatesEmptyTitle => 'Ainda não há certificados';
	@override String get certificatesEmptySubtitle => 'Não se esqueça de verificar novamente quando concluir um nível.';
	@override String get restorePurchasesSuccess => 'Suas compras foram restauradas.';
	@override String get restorePurchasesEmpty => 'Nenhuma compra ativa encontrada para esta conta.';
	@override String get certificateListA1 => 'A1 - Certificado iniciante';
	@override String get certificateListA2 => 'A2 - Certificado básico';
	@override String get certificateListB1 => 'B1 - Certificado intermediário';
	@override String get certificateListB2 => 'B2 - Certificado intermediário superior';
	@override String get certificateListC1 => 'C1 - Certificado avançado';
	@override String get certificateListC2 => 'C2 - Certificado especialista';
	@override String certificateListGeneric({required Object level}) => 'Certificado ${level}';
}

// Path: pushNotifications
class _Translations$pushNotifications$pt implements Translations$pushNotifications$en {
	_Translations$pushNotifications$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Parece que você fez uma pausa rápida.',
		'Tem um momento para uma palavra?',
		'Estamos aqui — sem pressa.',
		'Seu ritmo de aprendizado deu uma pausa.',
		'Uma mini revisão pode ser agradável.',
	];
	@override List<String> get h4 => [
		'Uma nova palavra pode estar te esperando hoje 👀',
		'Uma prática rápida pode ser útil.',
		'Você pode ter perdido uma frase interessante.',
		'O progresso de hoje ainda está aberto.',
		'Uma palavra, uma frase… talvez as duas.',
	];
	@override List<String> get h8 => [
		'Você não precisa progredir todos os dias.',
		'Até uma pequena revisão conta.',
		'Você não perdeu nada por não estudar hoje.',
		'Estamos prontos quando você estiver.',
		'Aprender um idioma é uma maratona, não uma corrida.',
	];
	@override List<String> get h24 => [
		'Um dia se passou. Suas palavras ainda estão aqui.',
		'Fazer uma pausa é normal.',
		'Seu lugar está bem onde você deixou.',
		'Continue quando quiser.',
		'O idioma não vai embora — e nós também não.',
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
class _Translations$apiErrors$pt implements Translations$apiErrors$en {
	_Translations$apiErrors$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$pt implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fale com Confiança em Semanas — Não em Meses';
	@override String get body => 'Pratique conversas reais com IA. Melhore seu sotaque, confiança e fluência, diariamente.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Eu não conseguia falar inglês antes. Agora eu falo diariamente no trabalho.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$pt implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Um Tutor Particular Sem o Preço';
	@override String get body => 'Conversas reais. Feedback instantâneo.\nSem agendamento. Sem pressão.';
	@override String get realTutor => 'Tutor Real';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / hr';
	@override String get priceLingola => '\$9.99 / ano';
	@override String get versus => 'VS';
	@override String get scheduled => 'Agendado';
	@override String get anytime => 'A qualquer momento';
	@override String get stressful => 'Estressante';
	@override String get noPressure => 'Sem pressão';
	@override String get price => 'Preço';
	@override String get availability => 'Disponibilidade';
	@override String get feeling => 'Sentimento';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$pt implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Um Plano de Aprendizado Construído Para Você';
	@override String get body => 'Seus objetivos, seu ritmo, seu nível.\nDo iniciante ao fluente — passo a passo.';
	@override String get goal => 'Objetivo';
	@override String get practice => 'Prática';
	@override String get progress => 'Progresso';
}

// Path: home.premium
class _Translations$home$premium$pt implements Translations$home$premium$en {
	_Translations$home$premium$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'O caminho para ';
	@override String get titleHighlight => 'falar fluentemente';
	@override String get titleAfter => ' sem medo de cometer erros.';
	@override String get descriptionBefore => 'Junte-se a milhões de estudantes em todo o mundo. Comece a quebrar a barreira do idioma hoje — ';
	@override String get descriptionHighlight => 'primeiros 3 dias completamente grátis.';
	@override String get feature1 => 'Tutor de IA acessível 24/7';
	@override String get feature2 => 'Acesso ilimitado a Tutores Privados';
	@override String get feature3 => 'Plano de aula diário personalizado para você';
	@override String get priceAmount => '1,99\$';
	@override String get pricePeriod => '/mês';
	@override String get discount => '40% de desconto na compra anual';
	@override String get cta => 'Começar';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$pt implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
	@override String get santa => 'Papai Noel';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$pt implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Adaptável';
	@override String get calm => 'Calmo';
	@override String get patient => 'Paciente';
	@override String get organized => 'Organizado';
	@override String get relaxed => 'Relaxado';
	@override String get methodical => 'Metódico';
	@override String get attentive => 'Atento';
	@override String get more => '+5';
	@override String get curious => 'Curioso';
	@override String get observer => 'Observador';
	@override String get ancientKnowledge => 'Conhecimento Antigo';
	@override String get wise => 'Sábio';
	@override String get clear => 'Claro';
	@override String get decisive => 'Decisivo';
	@override String get disciplined => 'Disciplinado';
	@override String get smart => 'Inteligente';
	@override String get analytic => 'Analítico';
	@override String get cheerful => 'Alegre';
	@override String get generous => 'Generoso';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$pt implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Bom dia! Estou feliz que você esteja se sentindo pronto para praticar hoje.';
	@override String get outgoing1 => 'Sim, vamos começar com cumprimentos.';
	@override String get incoming2 => 'Perfeito. Como você diria olá para um colega?';
	@override String get typing => 'Digitando';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$pt implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Aula 1 : Cumprimentos';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Aula ${number} : ${title}';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Entediado? Eu deletei essa palavra do meu vocabulário. Levante-se, o plano já está feito: vamos naquele novo bar de arcade em Kadıköy.';
	@override String get highlight => 'Entediado?';
	@override String get close => 'Encerrar chamada';
	@override String get toggleCaptions => 'Alternar legendas';
	@override String get toggleHints => 'Alternar dicas';
	@override String get toggleMic => 'Alternar microfone';
	@override String get tapToSpeakHint => 'Toque para falar, toque de novo para terminar';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$pt implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$pt a1 = _Translations$lessonPage$levels$a1$pt._(_root);
	@override late final _Translations$lessonPage$levels$a2$pt a2 = _Translations$lessonPage$levels$a2$pt._(_root);
	@override late final _Translations$lessonPage$levels$b1$pt b1 = _Translations$lessonPage$levels$b1$pt._(_root);
	@override late final _Translations$lessonPage$levels$b2$pt b2 = _Translations$lessonPage$levels$b2$pt._(_root);
	@override late final _Translations$lessonPage$levels$c1$pt c1 = _Translations$lessonPage$levels$c1$pt._(_root);
	@override late final _Translations$lessonPage$levels$c2$pt c2 = _Translations$lessonPage$levels$c2$pt._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$pt implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fazendo um Pedido na Cafeteria';
	@override String get screenplay => 'Peça sua bebida favorita, pergunte sobre tamanhos e adicionais, confirme seu total e pegue seu café no balcão.';
	@override late final _Translations$rolePlayPage$coffee$chat$pt chat = _Translations$rolePlayPage$coffee$chat$pt._(_root);
}

// Path: rolePlayPage.coffeeQueue
class _Translations$rolePlayPage$coffeeQueue$pt implements Translations$rolePlayPage$coffeeQueue$en {
	_Translations$rolePlayPage$coffeeQueue$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Waiting in the Coffee Line';
	@override String get screenplay => 'Stand in line at a busy café, chat politely with the person ahead of you, hold your spot, and get ready to order when it\'s your turn.';
	@override late final _Translations$rolePlayPage$coffeeQueue$chat$pt chat = _Translations$rolePlayPage$coffeeQueue$chat$pt._(_root);
}

// Path: rolePlayPage.coffeeRecommendation
class _Translations$rolePlayPage$coffeeRecommendation$pt implements Translations$rolePlayPage$coffeeRecommendation$en {
	_Translations$rolePlayPage$coffeeRecommendation$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking for a Drink Recommendation';
	@override String get screenplay => 'Ask the barista what they recommend, compare a few drinks, choose size and milk options, then place your order confidently.';
	@override late final _Translations$rolePlayPage$coffeeRecommendation$chat$pt chat = _Translations$rolePlayPage$coffeeRecommendation$chat$pt._(_root);
}

// Path: rolePlayPage.coffeeWrongOrder
class _Translations$rolePlayPage$coffeeWrongOrder$pt implements Translations$rolePlayPage$coffeeWrongOrder$en {
	_Translations$rolePlayPage$coffeeWrongOrder$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fixing a Wrong Coffee Order';
	@override String get screenplay => 'Politely explain that your drink is wrong, describe what you ordered, ask for a remake or swap, and thank the barista.';
	@override late final _Translations$rolePlayPage$coffeeWrongOrder$chat$pt chat = _Translations$rolePlayPage$coffeeWrongOrder$chat$pt._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$pt implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pedindo Direções na Rua';
	@override String get screenplay => 'Peça direções para um lugar, descubra como chegar ao metrô ou ônibus, obtenha informações sobre bilhetes e ouça recomendações de restaurantes.';
	@override late final _Translations$rolePlayPage$directions$chat$pt chat = _Translations$rolePlayPage$directions$chat$pt._(_root);
}

// Path: rolePlayPage.directionsWrongWay
class _Translations$rolePlayPage$directionsWrongWay$pt implements Translations$rolePlayPage$directionsWrongWay$en {
	_Translations$rolePlayPage$directionsWrongWay$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Correcting Wrong Directions';
	@override String get screenplay => 'Realize the directions were wrong, politely check again, and get clearer landmark-based instructions.';
	@override late final _Translations$rolePlayPage$directionsWrongWay$chat$pt chat = _Translations$rolePlayPage$directionsWrongWay$chat$pt._(_root);
}

// Path: rolePlayPage.directionsTransit
class _Translations$rolePlayPage$directionsTransit$pt implements Translations$rolePlayPage$directionsTransit$en {
	_Translations$rolePlayPage$directionsTransit$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About Bus or Subway Routes';
	@override String get screenplay => 'Ask which line to take, how many stops, and where to transfer to reach your destination.';
	@override late final _Translations$rolePlayPage$directionsTransit$chat$pt chat = _Translations$rolePlayPage$directionsTransit$chat$pt._(_root);
}

// Path: rolePlayPage.directionsLost
class _Translations$rolePlayPage$directionsLost$pt implements Translations$rolePlayPage$directionsLost$en {
	_Translations$rolePlayPage$directionsLost$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking for Help When You\'re Lost';
	@override String get screenplay => 'Admit you\'re lost, describe where you need to go, and confirm the directions before you leave.';
	@override late final _Translations$rolePlayPage$directionsLost$chat$pt chat = _Translations$rolePlayPage$directionsLost$chat$pt._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$pt implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrevista de Emprego';
	@override String get screenplay => 'Apresente-se, responda perguntas comuns de entrevista, fale sobre sua experiência e pergunte sobre o papel e os próximos passos.';
	@override late final _Translations$rolePlayPage$interview$chat$pt chat = _Translations$rolePlayPage$interview$chat$pt._(_root);
}

// Path: rolePlayPage.interviewSalary
class _Translations$rolePlayPage$interviewSalary$pt implements Translations$rolePlayPage$interviewSalary$en {
	_Translations$rolePlayPage$interviewSalary$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Discussing Salary Expectations';
	@override String get screenplay => 'Talk about salary range politely, ask about benefits, and keep the tone professional.';
	@override late final _Translations$rolePlayPage$interviewSalary$chat$pt chat = _Translations$rolePlayPage$interviewSalary$chat$pt._(_root);
}

// Path: rolePlayPage.interviewExperience
class _Translations$rolePlayPage$interviewExperience$pt implements Translations$rolePlayPage$interviewExperience$en {
	_Translations$rolePlayPage$interviewExperience$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Describing Work Experience';
	@override String get screenplay => 'Walk through a recent role, your responsibilities, and one achievement with numbers if possible.';
	@override late final _Translations$rolePlayPage$interviewExperience$chat$pt chat = _Translations$rolePlayPage$interviewExperience$chat$pt._(_root);
}

// Path: rolePlayPage.interviewStrengths
class _Translations$rolePlayPage$interviewStrengths$pt implements Translations$rolePlayPage$interviewStrengths$en {
	_Translations$rolePlayPage$interviewStrengths$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Your Strengths';
	@override String get screenplay => 'Describe two strengths with short examples and connect them to the job.';
	@override late final _Translations$rolePlayPage$interviewStrengths$chat$pt chat = _Translations$rolePlayPage$interviewStrengths$chat$pt._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$pt implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$pt chat = _Translations$rolePlayPage$missedTrain$chat$pt._(_root);
}

// Path: rolePlayPage.missedTrainRefund
class _Translations$rolePlayPage$missedTrainRefund$pt implements Translations$rolePlayPage$missedTrainRefund$en {
	_Translations$rolePlayPage$missedTrainRefund$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About Rebooking or a Refund';
	@override String get screenplay => 'Ask about rebooking, refunds, or compensation after missing a connection due to a delay.';
	@override late final _Translations$rolePlayPage$missedTrainRefund$chat$pt chat = _Translations$rolePlayPage$missedTrainRefund$chat$pt._(_root);
}

// Path: rolePlayPage.missedTrainTicket
class _Translations$rolePlayPage$missedTrainTicket$pt implements Translations$rolePlayPage$missedTrainTicket$en {
	_Translations$rolePlayPage$missedTrainTicket$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fixing a Ticket After Missing a Train';
	@override String get screenplay => 'Ask whether your ticket is still valid, if you can board the next train, and what to do at the gate.';
	@override late final _Translations$rolePlayPage$missedTrainTicket$chat$pt chat = _Translations$rolePlayPage$missedTrainTicket$chat$pt._(_root);
}

// Path: rolePlayPage.missedTrainNext
class _Translations$rolePlayPage$missedTrainNext$pt implements Translations$rolePlayPage$missedTrainNext$en {
	_Translations$rolePlayPage$missedTrainNext$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Finding the Next Train';
	@override String get screenplay => 'Explain you missed your train and ask when the next one leaves and which platform to use.';
	@override late final _Translations$rolePlayPage$missedTrainNext$chat$pt chat = _Translations$rolePlayPage$missedTrainNext$chat$pt._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$pt implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$pt chat = _Translations$rolePlayPage$flightAttendant$chat$pt._(_root);
}

// Path: rolePlayPage.flightDelay
class _Translations$rolePlayPage$flightDelay$pt implements Translations$rolePlayPage$flightDelay$en {
	_Translations$rolePlayPage$flightDelay$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About a Delay or Connection';
	@override String get screenplay => 'Ask why the flight is delayed, whether you\'ll make a connection, and what help is available.';
	@override late final _Translations$rolePlayPage$flightDelay$chat$pt chat = _Translations$rolePlayPage$flightDelay$chat$pt._(_root);
}

// Path: rolePlayPage.flightSpecialMeal
class _Translations$rolePlayPage$flightSpecialMeal$pt implements Translations$rolePlayPage$flightSpecialMeal$en {
	_Translations$rolePlayPage$flightSpecialMeal$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking for a Special Meal';
	@override String get screenplay => 'Ask about meal options, request vegetarian or other special meals, and confirm timing.';
	@override late final _Translations$rolePlayPage$flightSpecialMeal$chat$pt chat = _Translations$rolePlayPage$flightSpecialMeal$chat$pt._(_root);
}

// Path: rolePlayPage.flightSeat
class _Translations$rolePlayPage$flightSeat$pt implements Translations$rolePlayPage$flightSeat$en {
	_Translations$rolePlayPage$flightSeat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking to Change Seats';
	@override String get screenplay => 'Politely ask if you can switch seats for comfort, family, or a window/aisle preference.';
	@override late final _Translations$rolePlayPage$flightSeat$chat$pt chat = _Translations$rolePlayPage$flightSeat$chat$pt._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$pt implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$pt chat = _Translations$rolePlayPage$trainTicket$chat$pt._(_root);
}

// Path: rolePlayPage.trainTicketUpgrade
class _Translations$rolePlayPage$trainTicketUpgrade$pt implements Translations$rolePlayPage$trainTicketUpgrade$en {
	_Translations$rolePlayPage$trainTicketUpgrade$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Upgrading Your Seat or Class';
	@override String get screenplay => 'Ask about upgrading to quiet car or first class, compare prices, and complete the change.';
	@override late final _Translations$rolePlayPage$trainTicketUpgrade$chat$pt chat = _Translations$rolePlayPage$trainTicketUpgrade$chat$pt._(_root);
}

// Path: rolePlayPage.trainTicketPlatform
class _Translations$rolePlayPage$trainTicketPlatform$pt implements Translations$rolePlayPage$trainTicketPlatform$en {
	_Translations$rolePlayPage$trainTicketPlatform$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Finding the Right Platform';
	@override String get screenplay => 'Ask which platform your train leaves from and how to get there with luggage.';
	@override late final _Translations$rolePlayPage$trainTicketPlatform$chat$pt chat = _Translations$rolePlayPage$trainTicketPlatform$chat$pt._(_root);
}

// Path: rolePlayPage.trainTicketChange
class _Translations$rolePlayPage$trainTicketChange$pt implements Translations$rolePlayPage$trainTicketChange$en {
	_Translations$rolePlayPage$trainTicketChange$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changing Your Train Ticket Time';
	@override String get screenplay => 'Ask to change departure time, check fees, and confirm the new ticket.';
	@override late final _Translations$rolePlayPage$trainTicketChange$chat$pt chat = _Translations$rolePlayPage$trainTicketChange$chat$pt._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$pt implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$pt chat = _Translations$rolePlayPage$restaurantReservation$chat$pt._(_root);
}

// Path: rolePlayPage.restaurantComplaint
class _Translations$rolePlayPage$restaurantComplaint$pt implements Translations$rolePlayPage$restaurantComplaint$en {
	_Translations$rolePlayPage$restaurantComplaint$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Complaining Politely at a Restaurant';
	@override String get screenplay => 'Explain a problem with food or service calmly and ask for a fair fix.';
	@override late final _Translations$rolePlayPage$restaurantComplaint$chat$pt chat = _Translations$rolePlayPage$restaurantComplaint$chat$pt._(_root);
}

// Path: rolePlayPage.restaurantAllergy
class _Translations$rolePlayPage$restaurantAllergy$pt implements Translations$rolePlayPage$restaurantAllergy$en {
	_Translations$rolePlayPage$restaurantAllergy$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Food Allergies';
	@override String get screenplay => 'Explain allergies or diet needs, ask what\'s safe on the menu, and confirm with the staff.';
	@override late final _Translations$rolePlayPage$restaurantAllergy$chat$pt chat = _Translations$rolePlayPage$restaurantAllergy$chat$pt._(_root);
}

// Path: rolePlayPage.restaurantChange
class _Translations$rolePlayPage$restaurantChange$pt implements Translations$rolePlayPage$restaurantChange$en {
	_Translations$rolePlayPage$restaurantChange$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changing a Restaurant Reservation';
	@override String get screenplay => 'Call to change the time or party size and confirm the new details.';
	@override late final _Translations$rolePlayPage$restaurantChange$chat$pt chat = _Translations$rolePlayPage$restaurantChange$chat$pt._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$pt implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$pt chat = _Translations$rolePlayPage$doctorAppointment$chat$pt._(_root);
}

// Path: rolePlayPage.doctorFollowUp
class _Translations$rolePlayPage$doctorFollowUp$pt implements Translations$rolePlayPage$doctorFollowUp$en {
	_Translations$rolePlayPage$doctorFollowUp$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Test Results';
	@override String get screenplay => 'Ask what results mean, next steps, and whether you need another appointment.';
	@override late final _Translations$rolePlayPage$doctorFollowUp$chat$pt chat = _Translations$rolePlayPage$doctorFollowUp$chat$pt._(_root);
}

// Path: rolePlayPage.doctorPrescription
class _Translations$rolePlayPage$doctorPrescription$pt implements Translations$rolePlayPage$doctorPrescription$en {
	_Translations$rolePlayPage$doctorPrescription$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About Medicine';
	@override String get screenplay => 'Ask how to take medicine, about side effects, and when to come back if it doesn\'t help.';
	@override late final _Translations$rolePlayPage$doctorPrescription$chat$pt chat = _Translations$rolePlayPage$doctorPrescription$chat$pt._(_root);
}

// Path: rolePlayPage.doctorSymptoms
class _Translations$rolePlayPage$doctorSymptoms$pt implements Translations$rolePlayPage$doctorSymptoms$en {
	_Translations$rolePlayPage$doctorSymptoms$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Describing Your Symptoms';
	@override String get screenplay => 'Explain what hurts, when it started, and how strong the pain is.';
	@override late final _Translations$rolePlayPage$doctorSymptoms$chat$pt chat = _Translations$rolePlayPage$doctorSymptoms$chat$pt._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$pt implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$pt chat = _Translations$rolePlayPage$shoppingClothes$chat$pt._(_root);
}

// Path: rolePlayPage.shoppingDiscount
class _Translations$rolePlayPage$shoppingDiscount$pt implements Translations$rolePlayPage$shoppingDiscount$en {
	_Translations$rolePlayPage$shoppingDiscount$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About a Discount';
	@override String get screenplay => 'Ask about sales, student discounts, or price matches, then decide whether the deal is worth it.';
	@override late final _Translations$rolePlayPage$shoppingDiscount$chat$pt chat = _Translations$rolePlayPage$shoppingDiscount$chat$pt._(_root);
}

// Path: rolePlayPage.shoppingReturn
class _Translations$rolePlayPage$shoppingReturn$pt implements Translations$rolePlayPage$shoppingReturn$en {
	_Translations$rolePlayPage$shoppingReturn$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Returning an Item to the Store';
	@override String get screenplay => 'Return a purchase politely — explain the reason, show the receipt, and ask for a refund or exchange.';
	@override late final _Translations$rolePlayPage$shoppingReturn$chat$pt chat = _Translations$rolePlayPage$shoppingReturn$chat$pt._(_root);
}

// Path: rolePlayPage.shoppingFittingRoom
class _Translations$rolePlayPage$shoppingFittingRoom$pt implements Translations$rolePlayPage$shoppingFittingRoom$en {
	_Translations$rolePlayPage$shoppingFittingRoom$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trying Clothes in the Fitting Room';
	@override String get screenplay => 'Ask for a different size, check the mirror, and decide whether to buy the outfit.';
	@override late final _Translations$rolePlayPage$shoppingFittingRoom$chat$pt chat = _Translations$rolePlayPage$shoppingFittingRoom$chat$pt._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$pt implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$pt chat = _Translations$rolePlayPage$takingTaxi$chat$pt._(_root);
}

// Path: rolePlayPage.taxiComplaint
class _Translations$rolePlayPage$taxiComplaint$pt implements Translations$rolePlayPage$taxiComplaint$en {
	_Translations$rolePlayPage$taxiComplaint$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Handling a Taxi Problem';
	@override String get screenplay => 'Politely raise an issue — wrong route, AC, or fare — and ask for a fair solution.';
	@override late final _Translations$rolePlayPage$taxiComplaint$chat$pt chat = _Translations$rolePlayPage$taxiComplaint$chat$pt._(_root);
}

// Path: rolePlayPage.taxiTraffic
class _Translations$rolePlayPage$taxiTraffic$pt implements Translations$rolePlayPage$taxiTraffic$en {
	_Translations$rolePlayPage$taxiTraffic$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Traffic and Routes';
	@override String get screenplay => 'Discuss traffic, ask for a faster route, and decide whether to wait or take another way.';
	@override late final _Translations$rolePlayPage$taxiTraffic$chat$pt chat = _Translations$rolePlayPage$taxiTraffic$chat$pt._(_root);
}

// Path: rolePlayPage.taxiFare
class _Translations$rolePlayPage$taxiFare$pt implements Translations$rolePlayPage$taxiFare$en {
	_Translations$rolePlayPage$taxiFare$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking About the Taxi Fare';
	@override String get screenplay => 'Ask for an estimate before the ride, confirm payment options, and check the final amount at the end.';
	@override late final _Translations$rolePlayPage$taxiFare$chat$pt chat = _Translations$rolePlayPage$taxiFare$chat$pt._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$pt implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$pt chat = _Translations$rolePlayPage$rentingApartment$chat$pt._(_root);
}

// Path: rolePlayPage.rentingApartmentNegotiate
class _Translations$rolePlayPage$rentingApartmentNegotiate$pt implements Translations$rolePlayPage$rentingApartmentNegotiate$en {
	_Translations$rolePlayPage$rentingApartmentNegotiate$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Negotiating Rent and Lease Terms';
	@override String get screenplay => 'Negotiate rent, deposit, move-in date, and pet policy politely while staying clear about your limits.';
	@override late final _Translations$rolePlayPage$rentingApartmentNegotiate$chat$pt chat = _Translations$rolePlayPage$rentingApartmentNegotiate$chat$pt._(_root);
}

// Path: rolePlayPage.rentingApartmentAgent
class _Translations$rolePlayPage$rentingApartmentAgent$pt implements Translations$rolePlayPage$rentingApartmentAgent$en {
	_Translations$rolePlayPage$rentingApartmentAgent$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking with a Real Estate Agent';
	@override String get screenplay => 'Talk to an agent about budget, location, lease length, and which listings match your needs.';
	@override late final _Translations$rolePlayPage$rentingApartmentAgent$chat$pt chat = _Translations$rolePlayPage$rentingApartmentAgent$chat$pt._(_root);
}

// Path: rolePlayPage.rentingApartmentTour
class _Translations$rolePlayPage$rentingApartmentTour$pt implements Translations$rolePlayPage$rentingApartmentTour$en {
	_Translations$rolePlayPage$rentingApartmentTour$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About the Apartment on a Tour';
	@override String get screenplay => 'Ask about rooms, sunlight, noise, appliances, and whether furniture is included during a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartmentTour$chat$pt chat = _Translations$rolePlayPage$rentingApartmentTour$chat$pt._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$pt implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$pt chat = _Translations$rolePlayPage$birthdayParty$chat$pt._(_root);
}

// Path: rolePlayPage.birthdaySurprise
class _Translations$rolePlayPage$birthdaySurprise$pt implements Translations$rolePlayPage$birthdaySurprise$en {
	_Translations$rolePlayPage$birthdaySurprise$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Surprise Party';
	@override String get screenplay => 'Keep the surprise secret, assign tasks, and handle last-minute changes without spoiling it.';
	@override late final _Translations$rolePlayPage$birthdaySurprise$chat$pt chat = _Translations$rolePlayPage$birthdaySurprise$chat$pt._(_root);
}

// Path: rolePlayPage.birthdayGifts
class _Translations$rolePlayPage$birthdayGifts$pt implements Translations$rolePlayPage$birthdayGifts$en {
	_Translations$rolePlayPage$birthdayGifts$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Birthday Gifts';
	@override String get screenplay => 'Discuss gift ideas, budget, and whether to buy something together.';
	@override late final _Translations$rolePlayPage$birthdayGifts$chat$pt chat = _Translations$rolePlayPage$birthdayGifts$chat$pt._(_root);
}

// Path: rolePlayPage.birthdayInvite
class _Translations$rolePlayPage$birthdayInvite$pt implements Translations$rolePlayPage$birthdayInvite$en {
	_Translations$rolePlayPage$birthdayInvite$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inviting Guests to a Party';
	@override String get screenplay => 'Invite friends, share the date and place, and ask who can come.';
	@override late final _Translations$rolePlayPage$birthdayInvite$chat$pt chat = _Translations$rolePlayPage$birthdayInvite$chat$pt._(_root);
}

// Path: rolePlayPage.flirtingMeet
class _Translations$rolePlayPage$flirtingMeet$pt implements Translations$rolePlayPage$flirtingMeet$en {
	_Translations$rolePlayPage$flirtingMeet$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meeting Someone New at a Café';
	@override String get screenplay => 'Strike up a friendly conversation, share a little about yourself, exchange interests, and decide whether to meet again.';
	@override late final _Translations$rolePlayPage$flirtingMeet$chat$pt chat = _Translations$rolePlayPage$flirtingMeet$chat$pt._(_root);
}

// Path: rolePlayPage.flirtingAwkward
class _Translations$rolePlayPage$flirtingAwkward$pt implements Translations$rolePlayPage$flirtingAwkward$en {
	_Translations$rolePlayPage$flirtingAwkward$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Handling an Awkward Moment';
	@override String get screenplay => 'Recover from a misunderstanding or awkward pause, apologize lightly, and steer the chat back to a comfortable topic.';
	@override late final _Translations$rolePlayPage$flirtingAwkward$chat$pt chat = _Translations$rolePlayPage$flirtingAwkward$chat$pt._(_root);
}

// Path: rolePlayPage.flirtingAskOut
class _Translations$rolePlayPage$flirtingAskOut$pt implements Translations$rolePlayPage$flirtingAskOut$en {
	_Translations$rolePlayPage$flirtingAskOut$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Asking Someone Out';
	@override String get screenplay => 'After a short chat, suggest meeting again — coffee, a walk, or a movie — and handle a yes or a soft no gracefully.';
	@override late final _Translations$rolePlayPage$flirtingAskOut$chat$pt chat = _Translations$rolePlayPage$flirtingAskOut$chat$pt._(_root);
}

// Path: rolePlayPage.flirtingCompliment
class _Translations$rolePlayPage$flirtingCompliment$pt implements Translations$rolePlayPage$flirtingCompliment$en {
	_Translations$rolePlayPage$flirtingCompliment$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Giving a Friendly Compliment';
	@override String get screenplay => 'Start with a light compliment, keep it respectful, and see if the other person wants to keep talking.';
	@override late final _Translations$rolePlayPage$flirtingCompliment$chat$pt chat = _Translations$rolePlayPage$flirtingCompliment$chat$pt._(_root);
}

// Path: rolePlayPage.freeTalkHobby
class _Translations$rolePlayPage$freeTalkHobby$pt implements Translations$rolePlayPage$freeTalkHobby$en {
	_Translations$rolePlayPage$freeTalkHobby$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Hobbies';
	@override String get screenplay => 'Chat freely about free-time activities, ask follow-up questions, share preferences, and suggest trying something new together.';
	@override late final _Translations$rolePlayPage$freeTalkHobby$chat$pt chat = _Translations$rolePlayPage$freeTalkHobby$chat$pt._(_root);
}

// Path: rolePlayPage.freeTalkDisagree
class _Translations$rolePlayPage$freeTalkDisagree$pt implements Translations$rolePlayPage$freeTalkDisagree$en {
	_Translations$rolePlayPage$freeTalkDisagree$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Politely Disagreeing About Hobbies';
	@override String get screenplay => 'Disagree politely about a hobby preference, explain your view, and keep the conversation friendly.';
	@override late final _Translations$rolePlayPage$freeTalkDisagree$chat$pt chat = _Translations$rolePlayPage$freeTalkDisagree$chat$pt._(_root);
}

// Path: rolePlayPage.freeTalkMovies
class _Translations$rolePlayPage$freeTalkMovies$pt implements Translations$rolePlayPage$freeTalkMovies$en {
	_Translations$rolePlayPage$freeTalkMovies$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Movies';
	@override String get screenplay => 'Recommend a movie, ask about genres, and react to each other\'s favorites.';
	@override late final _Translations$rolePlayPage$freeTalkMovies$chat$pt chat = _Translations$rolePlayPage$freeTalkMovies$chat$pt._(_root);
}

// Path: rolePlayPage.freeTalkWeekend
class _Translations$rolePlayPage$freeTalkWeekend$pt implements Translations$rolePlayPage$freeTalkWeekend$en {
	_Translations$rolePlayPage$freeTalkWeekend$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Weekend Plans';
	@override String get screenplay => 'Share weekend plans, ask about theirs, and suggest a simple activity you could do together.';
	@override late final _Translations$rolePlayPage$freeTalkWeekend$chat$pt chat = _Translations$rolePlayPage$freeTalkWeekend$chat$pt._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$pt implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nova Tradução Pronta';
	@override String get body => 'Seu arquivo de tradução de áudio foi convertido com sucesso em texto e traduzido.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$pt implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uma Oferta Especial Te Aguarda';
	@override String get body => 'Faça upgrade para o Premium e tenha traduções de fotos ilimitadas com 50% de desconto.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$pt implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Descubra Novas Histórias';
	@override String get body => 'Aprenda novas palavras através de histórias';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$pt implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$pt implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$pt implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$pt implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Não achei os personagens de inteligência artificial realistas.';
	@override String get videoIssues => 'Estou enfrentando problemas técnicos nas videochamadas.';
	@override String get pricing => 'Os preços da assinatura estão acima das minhas expectativas.';
	@override String get noMatch => 'Não encontrei personagens no estilo que eu procurava.';
	@override String get shortTrial => 'Queria apenas testar por um curto período.';
	@override String get other => 'Outro';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$pt implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$pt supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$pt._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$pt howAiWorks = _Translations$profilePage$faqItems$howAiWorks$pt._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$pt offlineUse = _Translations$profilePage$faqItems$offlineUse$pt._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$pt isFree = _Translations$profilePage$faqItems$isFree$pt._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$pt pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$pt._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$pt dailyPractice = _Translations$profilePage$faqItems$dailyPractice$pt._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$pt levelDetermination = _Translations$profilePage$faqItems$levelDetermination$pt._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$pt realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$pt._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$pt dataSecurity = _Translations$profilePage$faqItems$dataSecurity$pt._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$pt disableReminders = _Translations$profilePage$faqItems$disableReminders$pt._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$pt implements Translations$profilePage$days$en {
	_Translations$profilePage$days$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get mon => 'SEG';
	@override String get tue => 'TER';
	@override String get wed => 'QUA';
	@override String get thu => 'QUI';
	@override String get fri => 'SEX';
	@override String get sat => 'SÁB';
	@override String get sun => 'DOM';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$pt implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Iniciante';
	@override List<String> get lessons => [
		'Saudações',
		'Apresentações I',
		'Profissões',
		'Um Quarto Favorito',
		'Rotina Diária',
		'Frutas',
		'Conselhos 1',
		'Família 1',
		'Coisas do Dia a Dia',
		'Cidade Natal',
		'Casa',
		'Preferências Alimentares',
		'Hobbies 1',
		'Pessoas de Sucesso',
		'Comidas e Bebidas',
		'Fazendo um Pedido em um Restaurante',
		'Animais de Estimação',
		'Saúde e Fitness',
		'Clima',
		'Novo Estilo de Vida',
		'Melhorando',
		'Hobbies 2',
		'Perguntas sobre Lugares',
		'Posse',
		'Compras 1',
		'Dizendo as Horas',
		'Direções 1',
		'Compras 2',
		'Conhecendo Você',
		'Lugares de Objetos',
		'Aparências',
		'Direções 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$pt implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Básico';
	@override List<String> get lessons => [
		'Família 2',
		'Pessoas e lugares',
		'Família 3',
		'Descrevendo objetos',
		'Cidade',
		'O projeto do prédio',
		'Lar doce lar',
		'Que horas são?',
		'Rotina diária 2',
		'Tempo livre',
		'Comida e nutrição',
		'Compras e consumo',
		'Férias',
		'Planos de fim de semana',
		'Formal ou casual',
		'Moda',
		'Compras 3',
		'Conselhos 2',
		'Você consegue!',
		'Compras 4',
		'Conversa fiada',
		'Um latte, por favor',
		'Comida',
		'Como se locomover',
		'Pronto para uma viagem',
		'Viagem 1',
		'Escapadas urbanas',
		'Viagem 2',
		'Um lugar para ficar',
		'Tão emocionante',
		'A pessoa certa',
		'Escola',
		'Preferências musicais',
		'Esportes',
		'Regras da corrida',
		'Deixe uma mensagem',
		'Pedidos',
		'Convites',
		'Experiências de viagem',
		'Passado 1',
		'Passado 2',
		'Passado 3',
		'Perguntas sobre o passado',
		'Você nunca é velho demais',
		'Memórias da infância',
		'Elogios',
		'Desculpas',
		'É tão irritante!',
		'Um mundo digital',
		'Vida profissional',
		'Eu não entendi isso',
		'Salvar ou gastar?',
		'Dizer desculpa',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$pt implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Intermediário';
	@override List<String> get lessons => [
		'Tradições culturais',
		'Celebridades',
		'Arte e criatividade',
		'Planos futuros',
		'Planejando eventos',
		'Metas e planos',
		'Eventos históricos',
		'Tecnologia',
		'Nunca, jamais',
		'O que está rolando',
		'Férias dos sonhos',
		'Mídias sociais',
		'Recomendações de livros',
		'Um daqueles dias',
		'Fotos especiais',
		'Conquistas pessoais',
		'Filmes favoritos',
		'Notícias de última hora',
		'Felicidade',
		'Uma semana agitada',
		'Onde eu cresci',
		'Dias de escola',
		'Perfis',
		'Mapas da vida',
		'Cotidiano',
		'O que vem a seguir',
		'Fazendo sugestões',
		'O que aconteceu',
		'Memórias',
		'Choque cultural',
		'Frases de interesse',
		'Entrevistas de emprego',
		'Listas de desejos',
		'Minha cidade ideal',
		'A geração da internet',
		'Marcas populares',
		'Frases de opinião',
		'Como é que fica',
		'Espaço de vida',
		'Comendo bem',
		'Hobbies incomuns',
		'Uma escolha difícil',
		'Tomar uma atitude',
		'Novas habilidades',
		'Fazendo uma reclamação',
		'Educação',
		'Cidades verdes',
		'O que tem em um emprego',
		'Desafios pessoais',
		'Frases de entrevista',
		'Desfechos educados',
		'Notícias de destaque',
		'Pequenas mudanças',
		'Desculpas e justificativas',
		'Etiqueta ao telefone',
		'Desculpa interromper…',
		'Respostas a reclamações',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$pt implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Intermediário Avançado';
	@override List<String> get lessons => [
		'Personalidades',
		'Grandes líderes',
		'Estilo de vida saudável',
		'Qual é a verdade?',
		'Crescimento pessoal',
		'Falar abertamente',
		'Atuando?',
		'Eu me lembro...',
		'Feedback social',
		'Cena do crime',
		'Problemas educados',
		'Resolução de conflitos',
		'Ame ou odeie?',
		'Questões ambientais',
		'Podemos resolver isso',
		'Mistérios e crimes',
		'Futuros possíveis',
		'Planos de negócios',
		'Decisões em reuniões',
		'É tão previsível...',
		'No trabalho',
		'Ciência e tecnologia',
		'Gestão do tempo',
		'Direitos humanos',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$pt implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - Avançado';
	@override List<String> get lessons => [
		'Normas culturais',
		'Influência das redes sociais',
		'Escolhas de carreira',
		'Acelerar desempenho',
		'Invenções',
		'Viagem no tempo',
		'Pertences',
		'Habilidades profissionais',
		'Mudanças históricas',
		'Escrita de revisão',
		'Mistérios',
		'Teorias estranhas',
		'Celebridades',
		'Política global',
		'Explosão de produtos',
		'Ficará feliz?',
		'Talvez mais tarde...',
		'Novas soluções',
		'Influência contextual',
		'Um logo perdido',
		'Ações gentis',
		'Que filme',
		'Que chato',
		'Nos jornais',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$pt implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Especialista';
	@override List<String> get lessons => [
		'Globalização',
		'Desastres naturais',
		'Reagindo à informação',
		'Equilíbrio entre vida pessoal e profissional',
		'Trabalho remoto',
		'Questões familiares',
		'Anatomia humana básica',
		'Previsões de saúde',
		'Acesso à saúde',
		'Experiência de viagem global',
		'Superpoderes',
		'Formação de equipe',
		'Biofluorescência',
		'Dilemas',
		'Entusiasmo social',
		'Mudanças',
		'Trabalho, trabalho, trabalho',
		'Questões locais',
		'Problemas, problemas',
		'Fato ou ficção?',
		'Turismo',
		'Voluntariado',
		'O olho da mente',
		'Consumo de mídia',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$pt implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Oi! Hoje vamos praticar fazer pedidos em uma cafeteria — cumprimentos, tamanhos, adicionais. Vou explicar um pouco primeiro, depois vamos encenar. Tudo bem?';
	@override String get incoming1 => 'Bem-vindo! O que posso preparar para você hoje?';
	@override String get outgoing1 => 'Oi! Eu gostaria de um latte médio, por favor.';
	@override String get incoming2Highlight => 'Claro';
	@override String get incoming2Rest => '! Você gostaria quente ou gelado, e algum adicional?';
	@override String get botReply => 'Ótima escolha. Mais alguma coisa com seu pedido?';
}

// Path: rolePlayPage.coffeeQueue.chat
class _Translations$rolePlayPage$coffeeQueue$chat$pt implements Translations$rolePlayPage$coffeeQueue$chat$en {
	_Translations$rolePlayPage$coffeeQueue$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice waiting in a coffee line — small talk, holding your place, and moving up. I\'ll explain a little first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'This line is moving slowly today, huh?';
	@override String get outgoing1 => 'Yeah — mornings are always busy here.';
	@override String get incoming2Highlight => 'True';
	@override String get incoming2Rest => '! Are you getting the usual, or trying something new?';
	@override String get botReply => 'Nice. Looks like you\'re next — good luck with your order!';
}

// Path: rolePlayPage.coffeeRecommendation.chat
class _Translations$rolePlayPage$coffeeRecommendation$chat$pt implements Translations$rolePlayPage$coffeeRecommendation$chat$en {
	_Translations$rolePlayPage$coffeeRecommendation$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking a barista for recommendations — flavors, sizes, milk options. I\'ll explain a little first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hey! Need a suggestion, or do you already know what you want?';
	@override String get outgoing1 => 'I\'d love a recommendation — something not too bitter.';
	@override String get incoming2Highlight => 'Perfect';
	@override String get incoming2Rest => '! Our honey oat latte is popular, or the caramel cold brew if you want iced.';
	@override String get botReply => 'Great pick. What size should I make that?';
}

// Path: rolePlayPage.coffeeWrongOrder.chat
class _Translations$rolePlayPage$coffeeWrongOrder$chat$pt implements Translations$rolePlayPage$coffeeWrongOrder$chat$en {
	_Translations$rolePlayPage$coffeeWrongOrder$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice fixing a wrong coffee order — staying polite, explaining the mistake, and asking for a remake. I\'ll teach a few phrases first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Here\'s your order — medium iced latte. Enjoy!';
	@override String get outgoing1 => 'Sorry, I think this might be wrong. I asked for a hot oat milk latte.';
	@override String get incoming2Highlight => 'Oh no';
	@override String get incoming2Rest => ' — my mistake! I\'ll remake that for you right away.';
	@override String get botReply => 'Thanks for your patience. Hot oat milk latte coming up.';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$pt implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Oi! Hoje vamos praticar pedir direções na rua. Vou explicar um pouco primeiro, depois vamos encenar. Tudo bem?';
	@override String get incoming1 => 'Oi! Você parece um pouco perdido — precisa de ajuda para encontrar algo?';
	@override String get outgoing1 => 'Sim, estou procurando a estação de metrô mais próxima.';
	@override String get incoming2Highlight => 'Claro';
	@override String get incoming2Rest => '! Ande duas quadras naquela direção, depois vire à esquerda. Você verá a entrada.';
	@override String get botReply => 'De nada! Quer uma dica de restaurante perto da estação também?';
}

// Path: rolePlayPage.directionsWrongWay.chat
class _Translations$rolePlayPage$directionsWrongWay$chat$pt implements Translations$rolePlayPage$directionsWrongWay$chat$en {
	_Translations$rolePlayPage$directionsWrongWay$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice fixing wrong directions politely. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Did you find the park?';
	@override String get outgoing1 => 'I think I went the wrong way. Could you explain it again with landmarks?';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => ' — walk past the red bookstore, then left at the fountain.';
	@override String get botReply => 'If you see the bakery, you\'ve gone too far.';
}

// Path: rolePlayPage.directionsTransit.chat
class _Translations$rolePlayPage$directionsTransit$chat$pt implements Translations$rolePlayPage$directionsTransit$chat$en {
	_Translations$rolePlayPage$directionsTransit$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about bus and subway routes. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Need transit help?';
	@override String get outgoing1 => 'Yes — which subway line goes to the museum?';
	@override String get incoming2Highlight => 'Take the blue line';
	@override String get incoming2Rest => ' three stops, then transfer to the green line.';
	@override String get botReply => 'The whole trip is about twenty minutes.';
}

// Path: rolePlayPage.directionsLost.chat
class _Translations$rolePlayPage$directionsLost$chat$pt implements Translations$rolePlayPage$directionsLost$chat$en {
	_Translations$rolePlayPage$directionsLost$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking for help when you\'re lost. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'You look a little lost — need a hand?';
	@override String get outgoing1 => 'Yes, please. I\'m trying to find City Hall.';
	@override String get incoming2Highlight => 'Easy';
	@override String get incoming2Rest => ' — go straight two blocks, then turn right.';
	@override String get botReply => 'Want me to point it out on the map too?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$pt implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Oi! Hoje vamos praticar uma entrevista de emprego. Vou explicar um pouco primeiro, depois vamos encenar — eu vou te entrevistar, depois trocamos. Tudo bem?';
	@override String get incoming1 => 'Obrigado por vir hoje. Você poderia se apresentar brevemente?';
	@override String get outgoing1 => 'Claro. Estou animado por estar aqui e compartilhar minha experiência.';
	@override String get incoming2Highlight => 'Maravilhoso';
	@override String get incoming2Rest => '. Fale-me sobre um projeto recente do qual você se orgulha.';
	@override String get botReply => 'Isso é impressionante. Que perguntas você tem sobre o papel?';
}

// Path: rolePlayPage.interviewSalary.chat
class _Translations$rolePlayPage$interviewSalary$chat$pt implements Translations$rolePlayPage$interviewSalary$chat$en {
	_Translations$rolePlayPage$interviewSalary$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice discussing salary expectations professionally. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'What are your salary expectations for this role?';
	@override String get outgoing1 => 'I\'m looking for a range around market average for this level. Could you share your band?';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Benefits also include remote days and learning budget.';
	@override String get botReply => 'Are benefits important in your decision?';
}

// Path: rolePlayPage.interviewExperience.chat
class _Translations$rolePlayPage$interviewExperience$chat$pt implements Translations$rolePlayPage$interviewExperience$chat$en {
	_Translations$rolePlayPage$interviewExperience$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice describing work experience clearly. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Tell me about your most recent role.';
	@override String get outgoing1 => 'I coordinated a small team and improved our delivery time.';
	@override String get incoming2Highlight => 'Interesting';
	@override String get incoming2Rest => '. By how much did you improve it?';
	@override String get botReply => 'What was the hardest part of that job?';
}

// Path: rolePlayPage.interviewStrengths.chat
class _Translations$rolePlayPage$interviewStrengths$chat$pt implements Translations$rolePlayPage$interviewStrengths$chat$en {
	_Translations$rolePlayPage$interviewStrengths$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about your strengths in an interview. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'What would you say are your biggest strengths?';
	@override String get outgoing1 => 'I\'m organized and I communicate clearly with teammates.';
	@override String get incoming2Highlight => 'Good';
	@override String get incoming2Rest => '. Can you give a quick example?';
	@override String get botReply => 'How do those strengths help in this role?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$pt implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.missedTrainRefund.chat
class _Translations$rolePlayPage$missedTrainRefund$chat$pt implements Translations$rolePlayPage$missedTrainRefund$chat$en {
	_Translations$rolePlayPage$missedTrainRefund$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about rebooking or refunds after a missed train. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'How can I help?';
	@override String get outgoing1 => 'My first train was delayed and I missed the connection. Can I rebook for free?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ' — I\'ll put you on the next available train.';
	@override String get botReply => 'Would you like an email confirmation too?';
}

// Path: rolePlayPage.missedTrainTicket.chat
class _Translations$rolePlayPage$missedTrainTicket$chat$pt implements Translations$rolePlayPage$missedTrainTicket$chat$en {
	_Translations$rolePlayPage$missedTrainTicket$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice fixing ticket issues after missing a train. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Ticket problems?';
	@override String get outgoing1 => 'I missed my train. Is this ticket still valid for the next one?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ' for the next two hours on the same route.';
	@override String get botReply => 'Just show it at the gate — you\'re fine.';
}

// Path: rolePlayPage.missedTrainNext.chat
class _Translations$rolePlayPage$missedTrainNext$chat$pt implements Translations$rolePlayPage$missedTrainNext$chat$en {
	_Translations$rolePlayPage$missedTrainNext$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice finding the next train after missing yours. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Can I help you?';
	@override String get outgoing1 => 'I just missed the 10:15 to Boston. When\'s the next one?';
	@override String get incoming2Highlight => 'Next is 10:45';
	@override String get incoming2Rest => ' from platform 3.';
	@override String get botReply => 'Do you need help with the ticket gate?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$pt implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.flightDelay.chat
class _Translations$rolePlayPage$flightDelay$chat$pt implements Translations$rolePlayPage$flightDelay$chat$en {
	_Translations$rolePlayPage$flightDelay$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about delays and connections on a flight. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'We\'ll be delayed about forty minutes.';
	@override String get outgoing1 => 'I have a tight connection. Will I still make it?';
	@override String get incoming2Highlight => 'We\'ll try';
	@override String get incoming2Rest => '. I\'ll radio ahead if needed.';
	@override String get botReply => 'Do you need gate information for the next flight?';
}

// Path: rolePlayPage.flightSpecialMeal.chat
class _Translations$rolePlayPage$flightSpecialMeal$chat$pt implements Translations$rolePlayPage$flightSpecialMeal$chat$en {
	_Translations$rolePlayPage$flightSpecialMeal$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking for a special meal on a flight. I\'ll explain first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'We\'re serving dinner soon.';
	@override String get outgoing1 => 'Do you have a vegetarian option?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ' — pasta or salad box.';
	@override String get botReply => 'I\'ll bring it with the next cart.';
}

// Path: rolePlayPage.flightSeat.chat
class _Translations$rolePlayPage$flightSeat$chat$pt implements Translations$rolePlayPage$flightSeat$chat$en {
	_Translations$rolePlayPage$flightSeat$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking a flight attendant to change seats. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Need anything before takeoff?';
	@override String get outgoing1 => 'Could I move to an aisle seat if one is free?';
	@override String get incoming2Highlight => 'Let me check';
	@override String get incoming2Rest => '… yes, 14C is open.';
	@override String get botReply => 'I\'ll move your bag tag too.';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$pt implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.trainTicketUpgrade.chat
class _Translations$rolePlayPage$trainTicketUpgrade$chat$pt implements Translations$rolePlayPage$trainTicketUpgrade$chat$en {
	_Translations$rolePlayPage$trainTicketUpgrade$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice upgrading a train seat or class. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Need help with your ticket?';
	@override String get outgoing1 => 'Can I upgrade to first class on this train?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ' — seats are open for an extra forty dollars.';
	@override String get botReply => 'Quiet car is cheaper if you prefer that.';
}

// Path: rolePlayPage.trainTicketPlatform.chat
class _Translations$rolePlayPage$trainTicketPlatform$chat$pt implements Translations$rolePlayPage$trainTicketPlatform$chat$en {
	_Translations$rolePlayPage$trainTicketPlatform$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice finding the right train platform. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Looking for your platform?';
	@override String get outgoing1 => 'Yes — the train to Chicago. Which platform is it?';
	@override String get incoming2Highlight => 'Platform 7';
	@override String get incoming2Rest => '. Elevators are on the left.';
	@override String get botReply => 'Boarding starts in ten minutes.';
}

// Path: rolePlayPage.trainTicketChange.chat
class _Translations$rolePlayPage$trainTicketChange$chat$pt implements Translations$rolePlayPage$trainTicketChange$chat$en {
	_Translations$rolePlayPage$trainTicketChange$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice changing a train ticket time. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Ticket desk — how can I help?';
	@override String get outgoing1 => 'Can I change my 3 pm ticket to the 5 pm train?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ', with a small change fee.';
	@override String get botReply => 'I\'ll print the updated ticket now.';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$pt implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.restaurantComplaint.chat
class _Translations$rolePlayPage$restaurantComplaint$chat$pt implements Translations$rolePlayPage$restaurantComplaint$chat$en {
	_Translations$rolePlayPage$restaurantComplaint$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice complaining politely at a restaurant. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Is everything alright with your meal?';
	@override String get outgoing1 => 'The pasta is cold. Could you remake it, please?';
	@override String get incoming2Highlight => 'I\'m sorry';
	@override String get incoming2Rest => ' — we\'ll remake it right away.';
	@override String get botReply => 'Would you like a drink while you wait?';
}

// Path: rolePlayPage.restaurantAllergy.chat
class _Translations$rolePlayPage$restaurantAllergy$chat$pt implements Translations$rolePlayPage$restaurantAllergy$chat$en {
	_Translations$rolePlayPage$restaurantAllergy$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about food allergies at a restaurant. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Any allergies we should know about?';
	@override String get outgoing1 => 'Yes — I\'m allergic to peanuts. Which dishes are safe?';
	@override String get incoming2Highlight => 'Most pasta dishes';
	@override String get incoming2Rest => ' are fine. I\'ll flag it for the kitchen.';
	@override String get botReply => 'Would you like the chef\'s recommendation?';
}

// Path: rolePlayPage.restaurantChange.chat
class _Translations$rolePlayPage$restaurantChange$chat$pt implements Translations$rolePlayPage$restaurantChange$chat$en {
	_Translations$rolePlayPage$restaurantChange$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice changing a restaurant reservation. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Reservation desk, how can I help?';
	@override String get outgoing1 => 'I have a booking for 7. Can we move it to 8 for four people?';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => ', 8 pm for four is available.';
	@override String get botReply => 'I\'ll text you the confirmation.';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$pt implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.doctorFollowUp.chat
class _Translations$rolePlayPage$doctorFollowUp$chat$pt implements Translations$rolePlayPage$doctorFollowUp$chat$en {
	_Translations$rolePlayPage$doctorFollowUp$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about test results with a doctor. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Your blood test results are back.';
	@override String get outgoing1 => 'What do they mean? Do I need more tests?';
	@override String get incoming2Highlight => 'Mostly normal';
	@override String get incoming2Rest => '. One value is a bit high, so let\'s recheck in a month.';
	@override String get botReply => 'Any questions before we finish?';
}

// Path: rolePlayPage.doctorPrescription.chat
class _Translations$rolePlayPage$doctorPrescription$chat$pt implements Translations$rolePlayPage$doctorPrescription$chat$en {
	_Translations$rolePlayPage$doctorPrescription$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about medicine and prescriptions. I\'ll explain first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'I\'m giving you this medicine twice a day.';
	@override String get outgoing1 => 'Should I take it with food? Any side effects?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ', with food. Mild drowsiness is possible.';
	@override String get botReply => 'If it doesn\'t help in three days, call us.';
}

// Path: rolePlayPage.doctorSymptoms.chat
class _Translations$rolePlayPage$doctorSymptoms$chat$pt implements Translations$rolePlayPage$doctorSymptoms$chat$en {
	_Translations$rolePlayPage$doctorSymptoms$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice describing symptoms at a doctor\'s appointment. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'What brings you in today?';
	@override String get outgoing1 => 'I\'ve had a sore throat for three days.';
	@override String get incoming2Highlight => 'I see';
	@override String get incoming2Rest => '. Any fever or cough?';
	@override String get botReply => 'On a scale of one to ten, how bad is the pain?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$pt implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.shoppingDiscount.chat
class _Translations$rolePlayPage$shoppingDiscount$chat$pt implements Translations$rolePlayPage$shoppingDiscount$chat$en {
	_Translations$rolePlayPage$shoppingDiscount$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about discounts and sales. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'That jacket looks great on you!';
	@override String get outgoing1 => 'Thanks! Is it on sale, or do you have any discounts today?';
	@override String get incoming2Highlight => 'Actually';
	@override String get incoming2Rest => ', there\'s 20% off if you buy two items.';
	@override String get botReply => 'Student discount is also available with ID.';
}

// Path: rolePlayPage.shoppingReturn.chat
class _Translations$rolePlayPage$shoppingReturn$chat$pt implements Translations$rolePlayPage$shoppingReturn$chat$en {
	_Translations$rolePlayPage$shoppingReturn$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice returning an item — being polite, explaining why, and asking for a refund. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hi! How can I help you today?';
	@override String get outgoing1 => 'I\'d like to return this shirt. It doesn\'t fit well.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Do you have the receipt with you?';
	@override String get botReply => 'Would you prefer a refund or an exchange?';
}

// Path: rolePlayPage.shoppingFittingRoom.chat
class _Translations$rolePlayPage$shoppingFittingRoom$chat$pt implements Translations$rolePlayPage$shoppingFittingRoom$chat$en {
	_Translations$rolePlayPage$shoppingFittingRoom$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice in a fitting room — sizes, colors, and deciding to buy. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'How\'s that size working for you?';
	@override String get outgoing1 => 'It\'s a bit tight. Do you have a larger size?';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '! I\'ll grab the next size for you.';
	@override String get botReply => 'Want to try another color while I check?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$pt implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.taxiComplaint.chat
class _Translations$rolePlayPage$taxiComplaint$chat$pt implements Translations$rolePlayPage$taxiComplaint$chat$en {
	_Translations$rolePlayPage$taxiComplaint$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice handling a problem in a taxi politely. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'We\'re almost there.';
	@override String get outgoing1 => 'Sorry, but this isn\'t the address I gave. Can we fix that?';
	@override String get incoming2Highlight => 'Oh';
	@override String get incoming2Rest => ' — my mistake. I\'ll turn around right away.';
	@override String get botReply => 'Thanks for telling me. No extra charge.';
}

// Path: rolePlayPage.taxiTraffic.chat
class _Translations$rolePlayPage$taxiTraffic$chat$pt implements Translations$rolePlayPage$taxiTraffic$chat$en {
	_Translations$rolePlayPage$taxiTraffic$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about traffic and alternate routes in a taxi. I\'ll explain first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Traffic is heavy on the highway.';
	@override String get outgoing1 => 'Is there a faster route through the city?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ', but there are more lights. It might still be quicker.';
	@override String get botReply => 'Want me to take the city route?';
}

// Path: rolePlayPage.taxiFare.chat
class _Translations$rolePlayPage$taxiFare$chat$pt implements Translations$rolePlayPage$taxiFare$chat$en {
	_Translations$rolePlayPage$taxiFare$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking about taxi fares. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Where to?';
	@override String get outgoing1 => 'To the airport, please. About how much will it cost?';
	@override String get incoming2Highlight => 'Around thirty';
	@override String get incoming2Rest => ', depending on traffic.';
	@override String get botReply => 'Card and cash are both fine.';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$pt implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.rentingApartmentNegotiate.chat
class _Translations$rolePlayPage$rentingApartmentNegotiate$chat$pt implements Translations$rolePlayPage$rentingApartmentNegotiate$chat$en {
	_Translations$rolePlayPage$rentingApartmentNegotiate$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice negotiating rent and lease terms. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'The rent is thirteen hundred plus utilities.';
	@override String get outgoing1 => 'Could you do twelve fifty if I sign a longer lease?';
	@override String get incoming2Highlight => 'Possibly';
	@override String get incoming2Rest => ' for a 18-month lease. Deposit is still one month.';
	@override String get botReply => 'Are pets allowed with an extra fee?';
}

// Path: rolePlayPage.rentingApartmentAgent.chat
class _Translations$rolePlayPage$rentingApartmentAgent$chat$pt implements Translations$rolePlayPage$rentingApartmentAgent$chat$en {
	_Translations$rolePlayPage$rentingApartmentAgent$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking with a real estate agent about rentals. I\'ll explain first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'What kind of apartment are you looking for?';
	@override String get outgoing1 => 'A one-bedroom near the subway, under twelve hundred a month.';
	@override String get incoming2Highlight => 'Perfect';
	@override String get incoming2Rest => '. I have three options in that range.';
	@override String get botReply => 'Do you prefer furnished or unfurnished?';
}

// Path: rolePlayPage.rentingApartmentTour.chat
class _Translations$rolePlayPage$rentingApartmentTour$chat$pt implements Translations$rolePlayPage$rentingApartmentTour$chat$en {
	_Translations$rolePlayPage$rentingApartmentTour$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about an apartment during a viewing. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Here\'s the living room — what do you think?';
	@override String get outgoing1 => 'It\'s nice. Does it get much sunlight in the afternoon?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => ', especially from these windows.';
	@override String get botReply => 'Want to see the kitchen and balcony next?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$pt implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: rolePlayPage.birthdaySurprise.chat
class _Translations$rolePlayPage$birthdaySurprise$chat$pt implements Translations$rolePlayPage$birthdaySurprise$chat$en {
	_Translations$rolePlayPage$birthdaySurprise$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a surprise party without spoiling it. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Is everything ready for the surprise?';
	@override String get outgoing1 => 'Almost — can you distract her until 7?';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. What if she finishes work early?';
	@override String get botReply => 'Text me and I\'ll stall with coffee.';
}

// Path: rolePlayPage.birthdayGifts.chat
class _Translations$rolePlayPage$birthdayGifts$chat$pt implements Translations$rolePlayPage$birthdayGifts$chat$en {
	_Translations$rolePlayPage$birthdayGifts$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about birthday gifts. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'What should we get for Emma?';
	@override String get outgoing1 => 'Maybe a book or headphones. What\'s our budget?';
	@override String get incoming2Highlight => 'Around thirty';
	@override String get incoming2Rest => ' each if we go together.';
	@override String get botReply => 'Want to shop online or in store?';
}

// Path: rolePlayPage.birthdayInvite.chat
class _Translations$rolePlayPage$birthdayInvite$chat$pt implements Translations$rolePlayPage$birthdayInvite$chat$en {
	_Translations$rolePlayPage$birthdayInvite$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice inviting guests to a birthday party. I\'ll explain first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'What\'s up?';
	@override String get outgoing1 => 'I\'m hosting a birthday party on Saturday. Can you come?';
	@override String get incoming2Highlight => 'Yes';
	@override String get incoming2Rest => '! What time does it start?';
	@override String get botReply => 'Should I bring anything?';
}

// Path: rolePlayPage.flirtingMeet.chat
class _Translations$rolePlayPage$flirtingMeet$chat$pt implements Translations$rolePlayPage$flirtingMeet$chat$en {
	_Translations$rolePlayPage$flirtingMeet$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice a light flirting conversation at a café — hellos, compliments, and asking for a number. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Is this seat taken? The place is packed today.';
	@override String get outgoing1 => 'Oh, go ahead! I was just waiting for my coffee.';
	@override String get incoming2Highlight => 'Thanks';
	@override String get incoming2Rest => '! I\'m Alex, by the way. What brings you here?';
	@override String get botReply => 'Nice to meet you. Do you come here often?';
}

// Path: rolePlayPage.flirtingAwkward.chat
class _Translations$rolePlayPage$flirtingAwkward$chat$pt implements Translations$rolePlayPage$flirtingAwkward$chat$en {
	_Translations$rolePlayPage$flirtingAwkward$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice handling an awkward moment in a flirty chat — light apology and recovery. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Wait… I think you mixed up my name.';
	@override String get outgoing1 => 'Oh no — sorry! That was embarrassing. Can we start over?';
	@override String get incoming2Highlight => 'Haha, sure';
	@override String get incoming2Rest => '. I\'m Maya.';
	@override String get botReply => 'No hard feelings. What were we talking about?';
}

// Path: rolePlayPage.flirtingAskOut.chat
class _Translations$rolePlayPage$flirtingAskOut$chat$pt implements Translations$rolePlayPage$flirtingAskOut$chat$en {
	_Translations$rolePlayPage$flirtingAskOut$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice asking someone out politely. I\'ll explain first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'I\'ve really enjoyed talking with you.';
	@override String get outgoing1 => 'Me too. Would you like to grab coffee sometime this week?';
	@override String get incoming2Highlight => 'I\'d love that';
	@override String get incoming2Rest => '. What day works for you?';
	@override String get botReply => 'Saturday afternoon is free for me.';
}

// Path: rolePlayPage.flirtingCompliment.chat
class _Translations$rolePlayPage$flirtingCompliment$chat$pt implements Translations$rolePlayPage$flirtingCompliment$chat$en {
	_Translations$rolePlayPage$flirtingCompliment$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice giving a friendly compliment — short, kind, and natural. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Oh, excuse me — I almost bumped into you.';
	@override String get outgoing1 => 'No worries! By the way, I like your jacket.';
	@override String get incoming2Highlight => 'Thanks';
	@override String get incoming2Rest => '! That\'s sweet of you to say.';
	@override String get botReply => 'Are you waiting for someone, or just hanging out?';
}

// Path: rolePlayPage.freeTalkHobby.chat
class _Translations$rolePlayPage$freeTalkHobby$chat$pt implements Translations$rolePlayPage$freeTalkHobby$chat$en {
	_Translations$rolePlayPage$freeTalkHobby$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice free discussion about hobbies — asking, answering, and reacting naturally. I\'ll explain first, then we\'ll talk. Ready?';
	@override String get incoming1 => 'So, what do you usually do on weekends?';
	@override String get outgoing1 => 'I like hiking and watching films. How about you?';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! I\'ve been meaning to try hiking more. Any favorite trails?';
	@override String get botReply => 'That sounds perfect. Want to go together sometime?';
}

// Path: rolePlayPage.freeTalkDisagree.chat
class _Translations$rolePlayPage$freeTalkDisagree$chat$pt implements Translations$rolePlayPage$freeTalkDisagree$chat$en {
	_Translations$rolePlayPage$freeTalkDisagree$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice disagreeing politely about hobbies. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'I think hiking is boring.';
	@override String get outgoing1 => 'I get that — for me it\'s relaxing. What do you prefer instead?';
	@override String get incoming2Highlight => 'Fair';
	@override String get incoming2Rest => '. I like indoor climbing more.';
	@override String get botReply => 'Maybe we can try each other\'s hobby once.';
}

// Path: rolePlayPage.freeTalkMovies.chat
class _Translations$rolePlayPage$freeTalkMovies$chat$pt implements Translations$rolePlayPage$freeTalkMovies$chat$en {
	_Translations$rolePlayPage$freeTalkMovies$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking about movies — genres, favorites, recommendations. I\'ll explain first, then we\'ll chat. Ready?';
	@override String get incoming1 => 'Seen any good movies lately?';
	@override String get outgoing1 => 'Yes — a comedy last week. Do you like comedies?';
	@override String get incoming2Highlight => 'Love them';
	@override String get incoming2Rest => '! Any titles you\'d recommend?';
	@override String get botReply => 'I\'ll send you my top three tonight.';
}

// Path: rolePlayPage.freeTalkWeekend.chat
class _Translations$rolePlayPage$freeTalkWeekend$chat$pt implements Translations$rolePlayPage$freeTalkWeekend$chat$en {
	_Translations$rolePlayPage$freeTalkWeekend$chat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice chatting about weekend plans. I\'ll explain first, then we\'ll talk. Sound good?';
	@override String get incoming1 => 'Any plans for the weekend?';
	@override String get outgoing1 => 'I might go to the park. What about you?';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! I was thinking of a museum.';
	@override String get botReply => 'Want to meet for a short walk on Sunday?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$pt implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Quais idiomas o app suporta?';
	@override String get answer => 'A interface do Lingola está disponível em inglês, alemão, italiano, francês, turco, japonês, espanhol, russo, hindi, português e chinês simplificado.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$pt implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Como a IA funciona?';
	@override String get answer => 'A IA interage com você como um tutor real. Ela analisa suas conversas, detecta erros e oferece feedback personalizado com base no seu progresso.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$pt implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Posso usar o app offline?';
	@override String get answer => 'Sim. Você pode baixar certas lições e cenários de conversa com antecedência e usá-los offline. No entanto, o chat ao vivo requer uma conexão com a internet.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$pt implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'O app é gratuito?';
	@override String get answer => 'A versão básica é gratuita. Com o Premium, você tem acesso a cenários de chat avançados, análise de pronúncia e modo tutor pessoal.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$pt implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Como minha pronúncia é avaliada?';
	@override String get answer => 'O app analisa sua voz e usa reconhecimento de fala com inteligência artificial para avaliar seu sotaque e pronúncia. Palavras que você precisa melhorar são destacadas.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$pt implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Preciso praticar diariamente?';
	@override String get answer => 'Sim. O sistema acompanha seu progresso todos os dias. Apenas 10–15 minutos de prática de fala por dia podem acelerar visivelmente seu aprendizado de idiomas.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$pt implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Como meu nível de aprendizado é determinado?';
	@override String get answer => 'Uma breve verificação de nível quando você faz login pela primeira vez analisa seu conhecimento atual. Depois disso, a IA recomenda automaticamente lições adequadas ao seu nível.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$pt implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Posso conversar com pessoas reais?';
	@override String get answer => 'Sim. Usuários Premium podem agendar sessões curtas de prática com tutores reais.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$pt implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Meus dados estão seguros?';
	@override String get answer => 'Com certeza. Todas as conversas e dados dos usuários são armazenados de forma criptografada. Suas informações pessoais nunca são compartilhadas com terceiros.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$pt implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Como desativo os lembretes diários?';
	@override String get answer => 'Vá para as configurações do perfil, abra Notificações e altere a frequência dos lembretes ou desative as notificações completamente.';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Notificações',
			'app.streak' => 'Sequência de aprendizado',
			'app.profile' => 'Perfil',
			'common.continueLabel' => 'CONTINUAR',
			'common.back' => 'VOLTAR',
			'common.locked' => 'Bloqueado',
			'common.minutes' => ({required Object value}) => '${value} min',
			'common.close' => 'Fechar',
			'common.getStarted' => 'COMEÇAR',
			'common.connectionError' => 'Sem conexão. Verifique sua internet e tente novamente.',
			'common.genericError' => 'Algo deu errado. Por favor, tente novamente.',
			'common.tryAgain' => 'Tente novamente',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Página de integração ${current} de ${total}',
			'onboarding.letsStart' => 'Vamos começar',
			'onboarding.slide1.title' => 'Fale com Confiança em Semanas — Não em Meses',
			'onboarding.slide1.body' => 'Pratique conversas reais com IA. Melhore seu sotaque, confiança e fluência, diariamente.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Eu não conseguia falar inglês antes. Agora eu falo diariamente no trabalho.',
			'onboarding.slide2.title' => 'Um Tutor Particular Sem o Preço',
			'onboarding.slide2.body' => 'Conversas reais. Feedback instantâneo.\nSem agendamento. Sem pressão.',
			'onboarding.slide2.realTutor' => 'Tutor Real',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / hr',
			'onboarding.slide2.priceLingola' => '\$9.99 / ano',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Agendado',
			'onboarding.slide2.anytime' => 'A qualquer momento',
			'onboarding.slide2.stressful' => 'Estressante',
			'onboarding.slide2.noPressure' => 'Sem pressão',
			'onboarding.slide2.price' => 'Preço',
			'onboarding.slide2.availability' => 'Disponibilidade',
			'onboarding.slide2.feeling' => 'Sentimento',
			'onboarding.slide3.title' => 'Um Plano de Aprendizado Construído Para Você',
			'onboarding.slide3.body' => 'Seus objetivos, seu ritmo, seu nível.\nDo iniciante ao fluente — passo a passo.',
			'onboarding.slide3.goal' => 'Objetivo',
			'onboarding.slide3.practice' => 'Prática',
			'onboarding.slide3.progress' => 'Progresso',
			'targetLanguage.title' => 'Selecione o idioma que você quer aprender',
			'targetLanguage.comingSoon' => 'Mais idiomas em breve',
			'targetLanguage.korean' => 'Coreano',
			'targetLanguage.portuguese' => 'Português',
			'targetLanguage.portugueseBrazil' => 'Português (Brasil)',
			'targetLanguage.german' => 'Alemão',
			'targetLanguage.italian' => 'Italiano',
			'targetLanguage.simplifiedChinese' => 'Chinês Simplificado',
			'targetLanguage.arabic' => 'Árabe',
			'targetLanguage.turkish' => 'Turco',
			'targetLanguage.hindi' => 'Hindi',
			'language.step' => ({required Object current, required Object total}) => 'Passo ${current} de ${total}',
			'language.title' => 'Sobre o que você quer falar?',
			'language.nativeSection' => 'Eu falo',
			'language.nativeField' => 'Idioma nativo',
			'language.nativeName' => 'Turco',
			'language.targetSection' => 'Eu quero aprender',
			'language.targetField' => 'Idioma alvo',
			'language.targetName' => 'Inglês',
			'language.direction' => 'Direção do idioma',
			'language.selectLanguage' => 'Selecionar idioma',
			'language.comingSoonBadge' => 'Em breve...',
			'language.english' => 'Inglês',
			'language.french' => 'Francês',
			'language.japanese' => 'Japonês',
			'language.spanish' => 'Espanhol',
			'language.russian' => 'Russo',
			'setup.goalTitle' => 'Por que você quer aprender um novo idioma?',
			'setup.goalHint' => 'Vamos preparar um plano de estudo pessoal que se encaixa perfeitamente no seu objetivo',
			'setup.goalCareer' => 'Desenvolvimento de Carreira',
			'setup.goalTravel' => 'Viajar',
			'setup.goalLiving' => 'Viver no Exterior',
			'setup.goalStudying' => 'Educação',
			'setup.goalOther' => 'Desenvolvimento pessoal',
			'setup.interestsTitle' => 'Selecione seus interesses',
			'setup.interestsHint' => 'Criaremos uma experiência de aprendizagem personalizada com temas que te interessam.',
			'setup.seeMoreEllipsis' => 'Ver mais...',
			'setup.levelTitle' => 'Como você descreveria seu nível atual?',
			'setup.paceTitle' => 'Em quanto tempo você quer ver um progresso significativo?',
			'setup.explanationTitle' => 'Quando você fizer perguntas no seu idioma, como explicamos?',
			'setup.explanationHint' => 'Você pode mudar isso a qualquer momento nas configurações do perfil.',
			'setup.explanationNative' => 'Explicar no meu idioma nativo',
			'setup.explanationEnglish' => 'Explicar em inglês',
			'setup.levelA1' => 'Estou aprendendo este idioma do zero',
			'setup.levelA2' => 'Consigo participar de conversas básicas',
			'setup.levelB1' => 'Consigo lidar com conversas curtas sobre temas familiares',
			'setup.levelB2' => 'Consigo falar em detalhe sobre assuntos do dia a dia',
			'setup.levelC1' => 'Consigo falar com fluência com nativos',
			'setup.levelC2' => 'Consigo me expressar com clareza sobre qualquer assunto',
			'setup.paceHint' => 'Ajuda a ajustar o ritmo do seu plano',
			'setup.paceMonth1' => '1 mês',
			'setup.paceMonth2_3' => '2–3 meses',
			'setup.paceMonth6' => '6 meses',
			'setup.paceYear1' => '1 ano',
			'setup.paceRelaxed' => 'Não tenho pressa',
			'setup.progressInsightTitle' => 'Veja progresso real em apenas 2 semanas!',
			'setup.progressInsightBody' => 'Os usuários do Lingola geralmente notam um grande aumento na confiança ao falar desde o início.',
			'setup.progressInsightConfidence' => 'Confiança ao falar',
			'setup.progressInsightToday' => 'Hoje',
			'setup.progressInsightWeek2' => 'Semana 2',
			'setup.progressInsightWithLingola' => 'Com Lingola',
			'setup.progressInsightWithoutApp' => 'Sem o app',
			'setup.levelHint' => 'O Lingola foi feito para ajudar alunos de todos os níveis',
			'setup.dailyPracticeTitle' => 'Quanto você quer praticar por dia?',
			'setup.dailyPracticeHint' => 'Siga no seu ritmo, cada dia um passo mais perto.',
			'setup.dailyPracticeMonthlyHours' => ({required Object hours}) => '${hours} horas / mês',
			'setup.dailyPracticeOnlyMinutes' => ({required Object minutes}) => 'Apenas ${minutes} min por dia',
			'setup.dailyPracticeMinutesOption' => ({required Object minutes}) => '${minutes} min',
			'setup.dailyPracticeToday' => 'Hoje',
			'setup.practiceTimeTitle' => 'Em que horário do dia você quer praticar?',
			'setup.practiceTimeHint' => 'Lembretes ajudam a manter sua sequência e a chegar um passo mais perto da sua meta todos os dias.',
			'setup.practiceTimeMorning' => 'Manhã',
			'setup.practiceTimeAfternoon' => 'Tarde',
			'setup.practiceTimeEvening' => 'Noite',
			'setup.practiceTimeFlexible' => 'Sou flexível',
			'setup.practiceTimeSave' => 'Salvar',
			'setup.setPracticeTimeTitle' => 'Defina seu horário',
			'setup.setPracticeTimeHint' => 'Em qual intervalo de tempo você gostaria de praticar?',
			'setup.periodAm' => 'AM',
			'setup.periodPm' => 'PM',
			'setup.promiseTitle' => 'Prometo praticar conversação todos os dias',
			'setup.promiseBody' => 'E alcançar meus objetivos de idioma o mais rápido possível com tutores de IA',
			'setup.promiseHoldHint' => 'Pressione e segure o logo da Lingola para confirmar',
			'setup.aiTutorsIntroTitle' => 'Escolha qualquer um dos 20+ tutores de IA no Lingola',
			'setup.aiTutorsIntroBody' => 'Todos têm personalidades profundas e sotaques diferentes',
			'setup.aiTutorsIntroCta' => 'Vamos te conhecer um pouco',
			'accountCreating.title' => 'Sua Conta Pessoal Está Sendo Criada',
			'accountCreating.stepContent' => 'Conteúdo está sendo criado',
			'accountCreating.stepDialogues' => 'Diálogos estão sendo preparados',
			'accountCreating.stepLessons' => 'Aulas estão sendo otimizadas',
			'accountCreating.stepPlan' => 'Seu plano está sendo finalizado',
			'accountCreating.optimization' => 'Otimização',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'accountCreating.titleLine1' => 'Sua conta',
			'accountCreating.titleLine2' => 'está sendo criada',
			'accountCreating.testimonialQuote' => 'Na primeira semana eu mal conseguia dizer oi. Na terceira já tinha conversas completas com meu tutor de IA. Não vou parar.',
			'accountCreating.testimonialAuthor' => 'Maria, 29 — há 3 meses',
			'accountCreating.comparisonPitch' => 'Aprenda mais de 600 frases extras com o Lingola, cerca de 30× mais rápido do que sozinho.',
			'accountCreating.comparisonAloneCount' => '400',
			'accountCreating.comparisonLingolaCount' => '1000',
			'accountCreating.comparisonUnit' => 'FRASES',
			'accountCreating.comparisonAloneLabel' => 'Sozinho',
			'accountCreating.comparisonLingolaLabel' => 'Lingola',
			'accountCreating.fluencyPitch' => 'De hoje à fluência — seu próximo nível está a apenas 30 dias',
			'accountCreating.chartToday' => 'Hoje',
			'accountCreating.chartMid' => '15 set',
			'accountCreating.chartEnd' => '30 set',
			'planReady.titleLine1' => 'Seu plano está',
			'planReady.titleLine2' => 'pronto!',
			'planReady.statBanner' => '95% of users see results within the first 7 days',
			'planReady.planTitle' => ({required Object name}) => '${name}\'S PLAN',
			'planReady.defaultName' => 'YOUR',
			'planReady.fieldCourse' => 'COURSE',
			'planReady.fieldLevel' => 'YOUR LEVEL',
			'planReady.fieldFocus' => 'FOCUS AREA',
			'planReady.fieldDuration' => 'DURATION',
			'planReady.fieldInterests' => 'INTERESSES',
			'planReady.startPlan' => 'Começar meu plano →',
			'planReady.courseEnglish' => 'English',
			'planReady.courseGerman' => 'German',
			'planReady.courseFrench' => 'French',
			'planReady.courseItalian' => 'Italian',
			'planReady.courseSpanish' => 'Spanish',
			'planReady.courseJapanese' => 'Japanese',
			'planReady.courseRussian' => 'Russian',
			'planReady.courseTurkish' => 'Turkish',
			'planReady.goalCareer' => 'Desenvolvimento de Carreira',
			'planReady.goalTravel' => 'Viajar',
			'planReady.goalLiving' => 'Viver no Exterior',
			'planReady.goalStudying' => 'Educação',
			'planReady.goalOther' => 'Desenvolvimento pessoal',
			'planReady.levelA1' => 'A1',
			'planReady.levelA2' => 'A2',
			'planReady.levelB1' => 'B1',
			'planReady.levelB2' => 'B2',
			'planReady.levelC1' => 'C1',
			'planReady.levelC2' => 'C2',
			'planReady.paceMonth1' => '1 mês',
			'planReady.paceMonth2_3' => '2–3 meses',
			'planReady.paceMonth6' => '6 meses',
			'planReady.paceYear1' => '1 ano',
			'planReady.paceRelaxed' => 'Não tenho pressa',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lição 1: Saudações',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Digite uma mensagem...',
			'previewChat.incoming1' => 'Oi! Bem-vindo ao Lingola — sou seu tutor de IA. Não importa seu nível: aqui você se sentirá seguro enquanto aprende inglês. Em inglês dizemos \'Hi\' ou \'Hello\' — tente: escreva \'Hi!\' para mim em inglês!',
			'previewChat.outgoing1' => 'Oi! Estou pronto para praticar.',
			'previewChat.incoming2Highlight' => 'Bom dia',
			'previewChat.incoming2Rest' => ', Emrah! Fico feliz que você esteja se sentindo pronto. Um café da manhã é sempre um ótimo começo para construir uma conexão. Sobre o que você gostaria de conversar?',
			'previewChat.holdToSpeak' => 'Segure para falar',
			'previewChat.recording' => 'Gravando… solte para enviar',
			'previewChat.slideUpToLock' => 'Deslize para cima para travar',
			'previewChat.slideLeftToCancel' => 'Deslize para a esquerda para cancelar',
			'previewChat.recordingLockedHint' => 'Toque em enviar quando terminar',
			'paywall.title' => 'Comece a Falar Hoje — Grátis',
			'paywall.subtitle' => 'Oportunidades de aprendizado ilimitadas',
			'paywall.noCommitment' => 'Sem compromisso',
			'paywall.cancelAnytime' => 'Cancele a qualquer momento',
			'paywall.noPaymentToday' => 'Sem pagamento hoje',
			'paywall.daysFree' => '3 Dias Grátis',
			'paywall.thenPrice' => 'Depois \$1.99/mês',
			'paywall.trialActive' => 'Teste Grátis Ativo',
			'paywall.payableToday' => 'Pagável Hoje',
			'paywall.payableValue' => '3 Dias Grátis 0.00\$',
			'paywall.paymentDate' => 'Data do pagamento: 13 de março de 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Nossos diversos treinadores de IA',
			'auth.title' => 'Comece a Falar um Novo Idioma, Hoje',
			'auth.body' => 'Pratique conversas reais com IA.\nSem pressão. Sem julgamentos.',
			'auth.continueGoogle' => 'Continuar com o Google',
			'auth.continueApple' => 'Continuar com a Apple',
			'auth.continueGuest' => 'Continuar como Convidado',
			'auth.or' => 'ou',
			'auth.alreadyHaveAccount' => 'Já tem uma conta?',
			'auth.signIn' => 'Entrar',
			'auth.legal' => 'Ao se inscrever no Lingola, você concorda com nossos Termos de Serviço. Saiba como processamos seus dados em nossa Política de Privacidade e Política de Cookies',
			'auth.terms' => 'Termos de Serviço',
			'auth.privacy' => 'Política de Privacidade',
			'auth.cookies' => 'Política de Cookies',
			'nav.home' => 'Início',
			'nav.tutor' => 'Professor',
			'nav.lesson' => 'Lição',
			'nav.rolePlay' => 'Atuação',
			'nav.profile' => 'Perfil',
			'home.streakCount' => '2',
			'home.greeting' => 'Bom Dia, Jhon',
			'home.todayPractice' => 'Prática de Hoje',
			'home.continueConversation' => 'Continuar Conversa',
			'home.continueWithTutor' => ({required Object name}) => 'Continuar com ${name} ou escolher outro tutor?',
			'home.continueSameTutor' => ({required Object name}) => 'Continuar com ${name}',
			'home.chooseOtherTutor' => 'Escolher outro tutor',
			'home.minutesLeft' => ({required Object value}) => '${value} min restantes',
			'home.lessonProgress' => 'Lição 2 — Saudações',
			'home.timeCurrent' => '0min',
			'home.timeTotal' => '/ 15min',
			'home.kContinue' => 'Continuar',
			'home.learningPath' => 'A1 - Iniciante',
			'home.allLessons' => 'Todas as Lições',
			'home.introductions' => 'Apresentações I',
			'home.greetings' => 'Saudações',
			'home.jobs' => 'Trabalhos',
			'home.favoriteRoom' => 'Uma Sala Favorita',
			'home.dailyRoutine' => 'Rotina Diária',
			'home.scroll' => 'Deslizar',
			'home.liveLesson' => 'Aula Ao Vivo',
			'home.liveLessonSubtitle' => 'Faça uma videochamada com nosso tutor',
			'home.moreTutor' => 'Mais Tutor',
			'home.startTalkNow' => 'Começar a Conversar Agora',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Adaptável',
			'home.tagCalm' => 'Calmo',
			'home.tagPatient' => 'Paciente',
			'home.tagMethodical' => 'Metódico',
			'home.tagEncouraging' => 'Encorajador',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Mais Recursos',
			'home.practiceLabel' => 'PRÁTICA',
			'home.wordPractice' => 'Prática de Palavras',
			'home.wordPracticeBody' => 'Construa seu vocabulário na língua escolhida diariamente',
			'home.immersiveLabel' => 'IMERSIVO',
			'home.quiz' => 'Quiz',
			'home.quizBodyLine1' => 'Aprenda através de',
			'home.quizBodyLine2' => 'exemplos reais em contexto',
			'home.getStarted' => 'Começar',
			'home.library' => 'Biblioteca',
			'home.libraryTitle' => 'Aprenda e Economize',
			'home.learnMore' => 'Saiba Mais',
			'home.premium.titleBefore' => 'O caminho para ',
			'home.premium.titleHighlight' => 'falar fluentemente',
			'home.premium.titleAfter' => ' sem medo de cometer erros.',
			'home.premium.descriptionBefore' => 'Junte-se a milhões de estudantes em todo o mundo. Comece a quebrar a barreira do idioma hoje — ',
			'home.premium.descriptionHighlight' => 'primeiros 3 dias completamente grátis.',
			'home.premium.feature1' => 'Tutor de IA acessível 24/7',
			'home.premium.feature2' => 'Acesso ilimitado a Tutores Privados',
			'home.premium.feature3' => 'Plano de aula diário personalizado para você',
			'home.premium.priceAmount' => '1,99\$',
			'home.premium.pricePeriod' => '/mês',
			'home.premium.discount' => '40% de desconto na compra anual',
			'home.premium.cta' => 'Começar',
			'libraryPage.title' => 'Biblioteca',
			'libraryPage.searchWord' => 'Buscar Palavra',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Palavra Salva',
			'libraryPage.savedWordTab' => 'Palavra Salva',
			'libraryPage.dictionaryTab' => 'Dicionário',
			'libraryPage.dictionaryLabel' => 'Dicionário',
			'wordPracticePage.title' => 'Prática de Palavras',
			'wordPracticePage.turkish' => 'TURCO',
			'wordPracticePage.save' => 'Salvar',
			'wordPracticePage.saved' => 'Salvo',
			'wordPracticePage.listen' => 'Ouvir',
			'wordPracticePage.hint' => 'Dica',
			'wordPracticePage.previous' => 'ANTERIOR',
			'wordPracticePage.next' => 'PRÓXIMO',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'O que você quer melhorar hoje?',
			'quizPage.subtitle' => 'Escolha seu treino — leva menos de 3 minutos 🚀',
			'quizPage.readingTitle' => 'Leitura',
			'quizPage.readingBody' => 'Compreensão através de artigos e histórias',
			'quizPage.writingTitle' => 'Escrita',
			'quizPage.writingBody' => 'Exercícios de gramática e vocabulário',
			'quizPage.speakingTitle' => 'Fala',
			'quizPage.speakingBody' => 'Pronúncia via motor de fala de IA',
			'quizPage.readingTestTitle' => 'Teste de Leitura',
			'quizPage.read' => 'Ler',
			'quizPage.listeningHint' => 'Fale a palavra em inglês claramente...',
			'quizPage.micPermissionDenied' => 'Microfone ou reconhecimento de fala indisponível.',
			'quizPage.matchSuccess' => 'Ótimo! Isso combina com a palavra.',
			'quizPage.matchFail' => ({required Object heard}) => 'Ouvi "${heard}". Tente novamente.',
			'quizPage.successfulTitle' => 'Sucesso!',
			'quizPage.successfulBody' => 'Pronúncia como um falante nativo!',
			'quizPage.failedTitle' => 'Falhou',
			'quizPage.failedBody' => 'Estava quase lá, dê mais uma chance',
			'quizPage.tryAgain' => 'TENTE NOVAMENTE',
			'quizPage.writingTestTitle' => 'Teste de Escrita',
			'quizPage.sourceLanguage' => 'IDIOMA DE ORIGEM',
			'quizPage.answer' => 'RESPOSTA',
			'quizPage.writeAnswerHint' => 'Escreva sua resposta aqui...',
			'quizPage.submit' => 'Enviar',
			'quizPage.speakingTestTitle' => 'Teste de Fala',
			'quizPage.speakingProficiency' => 'Proficiência em Fala',
			'quizPage.speakClearlyHint' => 'Fale claramente no seu microfone:',
			'quizPage.speakUp' => 'Fale Alto',
			'quizPage.recording' => 'Gravando...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'PERGUNTA ${current} DE ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} está a caminho',
			'placeholder.body' => ({required Object tab}) => 'Estamos preparando uma experiência focada em ${tab} para você.',
			'tutorPage.title' => 'Tutor',
			'tutorPage.chatWithLingola' => 'Converse com a Lingola',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => 'Converse com ${name}',
			'tutorPage.chatHistory' => 'Histórico de Conversas',
			'tutorPage.history' => 'Histórico',
			'tutorPage.filter' => 'Filtro',
			'tutorPage.country' => 'País',
			'tutorPage.focus' => 'Foco',
			'tutorPage.moreCountries' => '8+ mais',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'SALVAR',
			'tutorPage.clearFilter' => 'Remover filtros',
			'tutorPage.startTalkNow' => 'Começar a Conversar Agora',
			'tutorPage.typeMessage' => 'Digite uma mensagem...',
			'tutorPage.speaker' => 'Falante',
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
			'tutorPage.tutors.santa' => 'Papai Noel',
			'tutorPage.tags.adaptive' => 'Adaptável',
			'tutorPage.tags.calm' => 'Calmo',
			'tutorPage.tags.patient' => 'Paciente',
			'tutorPage.tags.organized' => 'Organizado',
			'tutorPage.tags.relaxed' => 'Relaxado',
			'tutorPage.tags.methodical' => 'Metódico',
			'tutorPage.tags.attentive' => 'Atento',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Curioso',
			'tutorPage.tags.observer' => 'Observador',
			'tutorPage.tags.ancientKnowledge' => 'Conhecimento Antigo',
			'tutorPage.tags.wise' => 'Sábio',
			'tutorPage.tags.clear' => 'Claro',
			'tutorPage.tags.decisive' => 'Decisivo',
			'tutorPage.tags.disciplined' => 'Disciplinado',
			'tutorPage.tags.smart' => 'Inteligente',
			'tutorPage.tags.analytic' => 'Analítico',
			'tutorPage.tags.cheerful' => 'Alegre',
			'tutorPage.tags.generous' => 'Generoso',
			'tutorPage.historyPreview1' => 'Oi! Eu estava prestes a explodir de tédio...',
			'tutorPage.historyPreview2' => 'Vamos praticar pedir comida hoje?',
			'tutorPage.time1' => '11:00 AM',
			'tutorPage.time2' => 'Ontem',
			'tutorPage.chat.incoming1' => 'Bom dia! Estou feliz que você esteja se sentindo pronto para praticar hoje.',
			'tutorPage.chat.outgoing1' => 'Sim, vamos começar com cumprimentos.',
			'tutorPage.chat.incoming2' => 'Perfeito. Como você diria olá para um colega?',
			'tutorPage.chat.typing' => 'Digitando',
			'tutorPage.calling.lessonBadge' => 'Aula 1 : Cumprimentos',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Aula ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Entediado? Eu deletei essa palavra do meu vocabulário. Levante-se, o plano já está feito: vamos naquele novo bar de arcade em Kadıköy.',
			'tutorPage.calling.highlight' => 'Entediado?',
			'tutorPage.calling.close' => 'Encerrar chamada',
			'tutorPage.calling.toggleCaptions' => 'Alternar legendas',
			'tutorPage.calling.toggleHints' => 'Alternar dicas',
			'tutorPage.calling.toggleMic' => 'Alternar microfone',
			'tutorPage.calling.tapToSpeakHint' => 'Toque para falar, toque de novo para terminar',
			'lessonPage.title' => 'Continue Aprendendo',
			'lessonPage.profile' => 'Perfil',
			'lessonPage.language' => 'Idioma alvo',
			'lessonPage.completed' => 'Concluído',
			'lessonPage.locked' => 'Bloqueado',
			'lessonPage.pickTutorTitle' => 'Escolha seu tutor',
			'lessonPage.startTalk' => 'Iniciar lição',
			'lessonPage.chatInstead' => 'Conversar em vez disso',
			'lessonPage.lockedHint' => 'Termine a lição anterior para desbloquear esta.',
			'lessonPage.levelLockedTitle' => 'Nível bloqueado',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'Seu nível de inglês é ${userLevel}, então você não pode abrir lições de ${lessonLevel} sem concluir o caminho anterior.',
			'lessonPage.levelLockedOk' => 'Entendi',
			'lessonPage.notesTitle' => 'Notas da lição',
			'lessonPage.whatWeLearned' => 'O que aprendemos hoje',
			'lessonPage.deleteNotes' => 'Excluir minhas notas da lição',
			'lessonPage.deleteNotesConfirm' => 'Excluir essas notas? Isso não pode ser desfeito.',
			'lessonPage.delete' => 'Excluir',
			'lessonPage.cancel' => 'Cancelar',
			'lessonPage.practiceCta' => 'Se isso pareceu difícil, você pode praticar o mesmo tópico novamente.',
			'lessonPage.practiceNow' => 'Praticar este tópico',
			'lessonPage.openChat' => 'Abrir chat com o tutor',
			'lessonPage.yourScore' => 'Sua pontuação',
			'lessonPage.bestScore' => ({required Object score}) => 'Melhor ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Participante passivo',
			'lessonPage.participationSilentBody' => 'Você ficou quieto desta vez. Acho que você deveria refazer esta lição.',
			'lessonPage.participationPassive' => 'Baixa participação',
			'lessonPage.participationPassiveBody' => 'Você quase não falou. Tente a lição novamente e fale mais.',
			'lessonPage.participationActive' => 'Boa participação',
			'lessonPage.participationActiveBody' => 'Você entrou na conversa. Continue assim!',
			'lessonPage.participationStrong' => 'Participação forte',
			'lessonPage.participationStrongBody' => 'Você falou bastante. Ótimo trabalho!',
			'lessonPage.retakeLesson' => 'Refazer esta lição',
			'lessonPage.finishLesson' => 'Finalizar lição',
			'lessonPage.savingNotes' => 'Seu tutor está escrevendo as notas de hoje...',
			'lessonPage.noNotes' => 'Termine esta lição para receber as notas do seu tutor.',
			'lessonPage.notesDeleted' => 'Notas da lição excluídas',
			'lessonPage.levels.a1.title' => 'A1 - Iniciante',
			'lessonPage.levels.a1.lessons.0' => 'Saudações',
			'lessonPage.levels.a1.lessons.1' => 'Apresentações I',
			'lessonPage.levels.a1.lessons.2' => 'Profissões',
			'lessonPage.levels.a1.lessons.3' => 'Um Quarto Favorito',
			'lessonPage.levels.a1.lessons.4' => 'Rotina Diária',
			'lessonPage.levels.a1.lessons.5' => 'Frutas',
			'lessonPage.levels.a1.lessons.6' => 'Conselhos 1',
			'lessonPage.levels.a1.lessons.7' => 'Família 1',
			'lessonPage.levels.a1.lessons.8' => 'Coisas do Dia a Dia',
			'lessonPage.levels.a1.lessons.9' => 'Cidade Natal',
			'lessonPage.levels.a1.lessons.10' => 'Casa',
			'lessonPage.levels.a1.lessons.11' => 'Preferências Alimentares',
			'lessonPage.levels.a1.lessons.12' => 'Hobbies 1',
			'lessonPage.levels.a1.lessons.13' => 'Pessoas de Sucesso',
			'lessonPage.levels.a1.lessons.14' => 'Comidas e Bebidas',
			'lessonPage.levels.a1.lessons.15' => 'Fazendo um Pedido em um Restaurante',
			'lessonPage.levels.a1.lessons.16' => 'Animais de Estimação',
			'lessonPage.levels.a1.lessons.17' => 'Saúde e Fitness',
			'lessonPage.levels.a1.lessons.18' => 'Clima',
			'lessonPage.levels.a1.lessons.19' => 'Novo Estilo de Vida',
			'lessonPage.levels.a1.lessons.20' => 'Melhorando',
			'lessonPage.levels.a1.lessons.21' => 'Hobbies 2',
			'lessonPage.levels.a1.lessons.22' => 'Perguntas sobre Lugares',
			'lessonPage.levels.a1.lessons.23' => 'Posse',
			'lessonPage.levels.a1.lessons.24' => 'Compras 1',
			'lessonPage.levels.a1.lessons.25' => 'Dizendo as Horas',
			'lessonPage.levels.a1.lessons.26' => 'Direções 1',
			'lessonPage.levels.a1.lessons.27' => 'Compras 2',
			'lessonPage.levels.a1.lessons.28' => 'Conhecendo Você',
			'lessonPage.levels.a1.lessons.29' => 'Lugares de Objetos',
			'lessonPage.levels.a1.lessons.30' => 'Aparências',
			'lessonPage.levels.a1.lessons.31' => 'Direções 2',
			'lessonPage.levels.a2.title' => 'A2 - Básico',
			'lessonPage.levels.a2.lessons.0' => 'Família 2',
			'lessonPage.levels.a2.lessons.1' => 'Pessoas e lugares',
			'lessonPage.levels.a2.lessons.2' => 'Família 3',
			'lessonPage.levels.a2.lessons.3' => 'Descrevendo objetos',
			'lessonPage.levels.a2.lessons.4' => 'Cidade',
			'lessonPage.levels.a2.lessons.5' => 'O projeto do prédio',
			'lessonPage.levels.a2.lessons.6' => 'Lar doce lar',
			'lessonPage.levels.a2.lessons.7' => 'Que horas são?',
			'lessonPage.levels.a2.lessons.8' => 'Rotina diária 2',
			'lessonPage.levels.a2.lessons.9' => 'Tempo livre',
			'lessonPage.levels.a2.lessons.10' => 'Comida e nutrição',
			'lessonPage.levels.a2.lessons.11' => 'Compras e consumo',
			'lessonPage.levels.a2.lessons.12' => 'Férias',
			'lessonPage.levels.a2.lessons.13' => 'Planos de fim de semana',
			'lessonPage.levels.a2.lessons.14' => 'Formal ou casual',
			'lessonPage.levels.a2.lessons.15' => 'Moda',
			'lessonPage.levels.a2.lessons.16' => 'Compras 3',
			'lessonPage.levels.a2.lessons.17' => 'Conselhos 2',
			'lessonPage.levels.a2.lessons.18' => 'Você consegue!',
			'lessonPage.levels.a2.lessons.19' => 'Compras 4',
			'lessonPage.levels.a2.lessons.20' => 'Conversa fiada',
			'lessonPage.levels.a2.lessons.21' => 'Um latte, por favor',
			'lessonPage.levels.a2.lessons.22' => 'Comida',
			'lessonPage.levels.a2.lessons.23' => 'Como se locomover',
			'lessonPage.levels.a2.lessons.24' => 'Pronto para uma viagem',
			'lessonPage.levels.a2.lessons.25' => 'Viagem 1',
			'lessonPage.levels.a2.lessons.26' => 'Escapadas urbanas',
			'lessonPage.levels.a2.lessons.27' => 'Viagem 2',
			'lessonPage.levels.a2.lessons.28' => 'Um lugar para ficar',
			'lessonPage.levels.a2.lessons.29' => 'Tão emocionante',
			'lessonPage.levels.a2.lessons.30' => 'A pessoa certa',
			'lessonPage.levels.a2.lessons.31' => 'Escola',
			'lessonPage.levels.a2.lessons.32' => 'Preferências musicais',
			'lessonPage.levels.a2.lessons.33' => 'Esportes',
			'lessonPage.levels.a2.lessons.34' => 'Regras da corrida',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.a2.lessons.35' => 'Deixe uma mensagem',
			'lessonPage.levels.a2.lessons.36' => 'Pedidos',
			'lessonPage.levels.a2.lessons.37' => 'Convites',
			'lessonPage.levels.a2.lessons.38' => 'Experiências de viagem',
			'lessonPage.levels.a2.lessons.39' => 'Passado 1',
			'lessonPage.levels.a2.lessons.40' => 'Passado 2',
			'lessonPage.levels.a2.lessons.41' => 'Passado 3',
			'lessonPage.levels.a2.lessons.42' => 'Perguntas sobre o passado',
			'lessonPage.levels.a2.lessons.43' => 'Você nunca é velho demais',
			'lessonPage.levels.a2.lessons.44' => 'Memórias da infância',
			'lessonPage.levels.a2.lessons.45' => 'Elogios',
			'lessonPage.levels.a2.lessons.46' => 'Desculpas',
			'lessonPage.levels.a2.lessons.47' => 'É tão irritante!',
			'lessonPage.levels.a2.lessons.48' => 'Um mundo digital',
			'lessonPage.levels.a2.lessons.49' => 'Vida profissional',
			'lessonPage.levels.a2.lessons.50' => 'Eu não entendi isso',
			'lessonPage.levels.a2.lessons.51' => 'Salvar ou gastar?',
			'lessonPage.levels.a2.lessons.52' => 'Dizer desculpa',
			'lessonPage.levels.b1.title' => 'B1 - Intermediário',
			'lessonPage.levels.b1.lessons.0' => 'Tradições culturais',
			'lessonPage.levels.b1.lessons.1' => 'Celebridades',
			'lessonPage.levels.b1.lessons.2' => 'Arte e criatividade',
			'lessonPage.levels.b1.lessons.3' => 'Planos futuros',
			'lessonPage.levels.b1.lessons.4' => 'Planejando eventos',
			'lessonPage.levels.b1.lessons.5' => 'Metas e planos',
			'lessonPage.levels.b1.lessons.6' => 'Eventos históricos',
			'lessonPage.levels.b1.lessons.7' => 'Tecnologia',
			'lessonPage.levels.b1.lessons.8' => 'Nunca, jamais',
			'lessonPage.levels.b1.lessons.9' => 'O que está rolando',
			'lessonPage.levels.b1.lessons.10' => 'Férias dos sonhos',
			'lessonPage.levels.b1.lessons.11' => 'Mídias sociais',
			'lessonPage.levels.b1.lessons.12' => 'Recomendações de livros',
			'lessonPage.levels.b1.lessons.13' => 'Um daqueles dias',
			'lessonPage.levels.b1.lessons.14' => 'Fotos especiais',
			'lessonPage.levels.b1.lessons.15' => 'Conquistas pessoais',
			'lessonPage.levels.b1.lessons.16' => 'Filmes favoritos',
			'lessonPage.levels.b1.lessons.17' => 'Notícias de última hora',
			'lessonPage.levels.b1.lessons.18' => 'Felicidade',
			'lessonPage.levels.b1.lessons.19' => 'Uma semana agitada',
			'lessonPage.levels.b1.lessons.20' => 'Onde eu cresci',
			'lessonPage.levels.b1.lessons.21' => 'Dias de escola',
			'lessonPage.levels.b1.lessons.22' => 'Perfis',
			'lessonPage.levels.b1.lessons.23' => 'Mapas da vida',
			'lessonPage.levels.b1.lessons.24' => 'Cotidiano',
			'lessonPage.levels.b1.lessons.25' => 'O que vem a seguir',
			'lessonPage.levels.b1.lessons.26' => 'Fazendo sugestões',
			'lessonPage.levels.b1.lessons.27' => 'O que aconteceu',
			'lessonPage.levels.b1.lessons.28' => 'Memórias',
			'lessonPage.levels.b1.lessons.29' => 'Choque cultural',
			'lessonPage.levels.b1.lessons.30' => 'Frases de interesse',
			'lessonPage.levels.b1.lessons.31' => 'Entrevistas de emprego',
			'lessonPage.levels.b1.lessons.32' => 'Listas de desejos',
			'lessonPage.levels.b1.lessons.33' => 'Minha cidade ideal',
			'lessonPage.levels.b1.lessons.34' => 'A geração da internet',
			'lessonPage.levels.b1.lessons.35' => 'Marcas populares',
			'lessonPage.levels.b1.lessons.36' => 'Frases de opinião',
			'lessonPage.levels.b1.lessons.37' => 'Como é que fica',
			'lessonPage.levels.b1.lessons.38' => 'Espaço de vida',
			'lessonPage.levels.b1.lessons.39' => 'Comendo bem',
			'lessonPage.levels.b1.lessons.40' => 'Hobbies incomuns',
			'lessonPage.levels.b1.lessons.41' => 'Uma escolha difícil',
			'lessonPage.levels.b1.lessons.42' => 'Tomar uma atitude',
			'lessonPage.levels.b1.lessons.43' => 'Novas habilidades',
			'lessonPage.levels.b1.lessons.44' => 'Fazendo uma reclamação',
			'lessonPage.levels.b1.lessons.45' => 'Educação',
			'lessonPage.levels.b1.lessons.46' => 'Cidades verdes',
			'lessonPage.levels.b1.lessons.47' => 'O que tem em um emprego',
			'lessonPage.levels.b1.lessons.48' => 'Desafios pessoais',
			'lessonPage.levels.b1.lessons.49' => 'Frases de entrevista',
			'lessonPage.levels.b1.lessons.50' => 'Desfechos educados',
			'lessonPage.levels.b1.lessons.51' => 'Notícias de destaque',
			'lessonPage.levels.b1.lessons.52' => 'Pequenas mudanças',
			'lessonPage.levels.b1.lessons.53' => 'Desculpas e justificativas',
			'lessonPage.levels.b1.lessons.54' => 'Etiqueta ao telefone',
			'lessonPage.levels.b1.lessons.55' => 'Desculpa interromper…',
			'lessonPage.levels.b1.lessons.56' => 'Respostas a reclamações',
			'lessonPage.levels.b2.title' => 'B2 - Intermediário Avançado',
			'lessonPage.levels.b2.lessons.0' => 'Personalidades',
			'lessonPage.levels.b2.lessons.1' => 'Grandes líderes',
			'lessonPage.levels.b2.lessons.2' => 'Estilo de vida saudável',
			'lessonPage.levels.b2.lessons.3' => 'Qual é a verdade?',
			'lessonPage.levels.b2.lessons.4' => 'Crescimento pessoal',
			'lessonPage.levels.b2.lessons.5' => 'Falar abertamente',
			'lessonPage.levels.b2.lessons.6' => 'Atuando?',
			'lessonPage.levels.b2.lessons.7' => 'Eu me lembro...',
			'lessonPage.levels.b2.lessons.8' => 'Feedback social',
			'lessonPage.levels.b2.lessons.9' => 'Cena do crime',
			'lessonPage.levels.b2.lessons.10' => 'Problemas educados',
			'lessonPage.levels.b2.lessons.11' => 'Resolução de conflitos',
			'lessonPage.levels.b2.lessons.12' => 'Ame ou odeie?',
			'lessonPage.levels.b2.lessons.13' => 'Questões ambientais',
			'lessonPage.levels.b2.lessons.14' => 'Podemos resolver isso',
			'lessonPage.levels.b2.lessons.15' => 'Mistérios e crimes',
			'lessonPage.levels.b2.lessons.16' => 'Futuros possíveis',
			'lessonPage.levels.b2.lessons.17' => 'Planos de negócios',
			'lessonPage.levels.b2.lessons.18' => 'Decisões em reuniões',
			'lessonPage.levels.b2.lessons.19' => 'É tão previsível...',
			'lessonPage.levels.b2.lessons.20' => 'No trabalho',
			'lessonPage.levels.b2.lessons.21' => 'Ciência e tecnologia',
			'lessonPage.levels.b2.lessons.22' => 'Gestão do tempo',
			'lessonPage.levels.b2.lessons.23' => 'Direitos humanos',
			'lessonPage.levels.c1.title' => 'C1 - Avançado',
			'lessonPage.levels.c1.lessons.0' => 'Normas culturais',
			'lessonPage.levels.c1.lessons.1' => 'Influência das redes sociais',
			'lessonPage.levels.c1.lessons.2' => 'Escolhas de carreira',
			'lessonPage.levels.c1.lessons.3' => 'Acelerar desempenho',
			'lessonPage.levels.c1.lessons.4' => 'Invenções',
			'lessonPage.levels.c1.lessons.5' => 'Viagem no tempo',
			'lessonPage.levels.c1.lessons.6' => 'Pertences',
			'lessonPage.levels.c1.lessons.7' => 'Habilidades profissionais',
			'lessonPage.levels.c1.lessons.8' => 'Mudanças históricas',
			'lessonPage.levels.c1.lessons.9' => 'Escrita de revisão',
			'lessonPage.levels.c1.lessons.10' => 'Mistérios',
			'lessonPage.levels.c1.lessons.11' => 'Teorias estranhas',
			'lessonPage.levels.c1.lessons.12' => 'Celebridades',
			'lessonPage.levels.c1.lessons.13' => 'Política global',
			'lessonPage.levels.c1.lessons.14' => 'Explosão de produtos',
			'lessonPage.levels.c1.lessons.15' => 'Ficará feliz?',
			'lessonPage.levels.c1.lessons.16' => 'Talvez mais tarde...',
			'lessonPage.levels.c1.lessons.17' => 'Novas soluções',
			'lessonPage.levels.c1.lessons.18' => 'Influência contextual',
			'lessonPage.levels.c1.lessons.19' => 'Um logo perdido',
			'lessonPage.levels.c1.lessons.20' => 'Ações gentis',
			'lessonPage.levels.c1.lessons.21' => 'Que filme',
			'lessonPage.levels.c1.lessons.22' => 'Que chato',
			'lessonPage.levels.c1.lessons.23' => 'Nos jornais',
			'lessonPage.levels.c2.title' => 'C2 - Especialista',
			'lessonPage.levels.c2.lessons.0' => 'Globalização',
			'lessonPage.levels.c2.lessons.1' => 'Desastres naturais',
			'lessonPage.levels.c2.lessons.2' => 'Reagindo à informação',
			'lessonPage.levels.c2.lessons.3' => 'Equilíbrio entre vida pessoal e profissional',
			'lessonPage.levels.c2.lessons.4' => 'Trabalho remoto',
			'lessonPage.levels.c2.lessons.5' => 'Questões familiares',
			'lessonPage.levels.c2.lessons.6' => 'Anatomia humana básica',
			'lessonPage.levels.c2.lessons.7' => 'Previsões de saúde',
			'lessonPage.levels.c2.lessons.8' => 'Acesso à saúde',
			'lessonPage.levels.c2.lessons.9' => 'Experiência de viagem global',
			'lessonPage.levels.c2.lessons.10' => 'Superpoderes',
			'lessonPage.levels.c2.lessons.11' => 'Formação de equipe',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescência',
			'lessonPage.levels.c2.lessons.13' => 'Dilemas',
			'lessonPage.levels.c2.lessons.14' => 'Entusiasmo social',
			'lessonPage.levels.c2.lessons.15' => 'Mudanças',
			'lessonPage.levels.c2.lessons.16' => 'Trabalho, trabalho, trabalho',
			'lessonPage.levels.c2.lessons.17' => 'Questões locais',
			'lessonPage.levels.c2.lessons.18' => 'Problemas, problemas',
			'lessonPage.levels.c2.lessons.19' => 'Fato ou ficção?',
			'lessonPage.levels.c2.lessons.20' => 'Turismo',
			'lessonPage.levels.c2.lessons.21' => 'Voluntariado',
			'lessonPage.levels.c2.lessons.22' => 'O olho da mente',
			'lessonPage.levels.c2.lessons.23' => 'Consumo de mídia',
			'rolePlayPage.title' => 'Role Play',
			'rolePlayPage.subtitle' => 'Escolha seu papel — viva um cenário da vida real 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} concluído',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Min',
			'rolePlayPage.beginner' => 'Iniciante',
			'rolePlayPage.screenplay' => 'ROTEIRO',
			'rolePlayPage.dailyInteractions' => 'Interações Diárias',
			'rolePlayPage.business' => 'Negócios',
			'rolePlayPage.coffee.title' => 'Fazendo um Pedido na Cafeteria',
			'rolePlayPage.coffee.screenplay' => 'Peça sua bebida favorita, pergunte sobre tamanhos e adicionais, confirme seu total e pegue seu café no balcão.',
			'rolePlayPage.coffee.chat.briefing' => 'Oi! Hoje vamos praticar fazer pedidos em uma cafeteria — cumprimentos, tamanhos, adicionais. Vou explicar um pouco primeiro, depois vamos encenar. Tudo bem?',
			'rolePlayPage.coffee.chat.incoming1' => 'Bem-vindo! O que posso preparar para você hoje?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Oi! Eu gostaria de um latte médio, por favor.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Claro',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Você gostaria quente ou gelado, e algum adicional?',
			'rolePlayPage.coffee.chat.botReply' => 'Ótima escolha. Mais alguma coisa com seu pedido?',
			'rolePlayPage.coffeeQueue.title' => 'Waiting in the Coffee Line',
			'rolePlayPage.coffeeQueue.screenplay' => 'Stand in line at a busy café, chat politely with the person ahead of you, hold your spot, and get ready to order when it\'s your turn.',
			'rolePlayPage.coffeeQueue.chat.briefing' => 'Hi! Today we\'ll practice waiting in a coffee line — small talk, holding your place, and moving up. I\'ll explain a little first, then we\'ll act it out. Ready?',
			'rolePlayPage.coffeeQueue.chat.incoming1' => 'This line is moving slowly today, huh?',
			'rolePlayPage.coffeeQueue.chat.outgoing1' => 'Yeah — mornings are always busy here.',
			'rolePlayPage.coffeeQueue.chat.incoming2Highlight' => 'True',
			'rolePlayPage.coffeeQueue.chat.incoming2Rest' => '! Are you getting the usual, or trying something new?',
			'rolePlayPage.coffeeQueue.chat.botReply' => 'Nice. Looks like you\'re next — good luck with your order!',
			'rolePlayPage.coffeeRecommendation.title' => 'Asking for a Drink Recommendation',
			'rolePlayPage.coffeeRecommendation.screenplay' => 'Ask the barista what they recommend, compare a few drinks, choose size and milk options, then place your order confidently.',
			'rolePlayPage.coffeeRecommendation.chat.briefing' => 'Hi! Today we\'ll practice asking a barista for recommendations — flavors, sizes, milk options. I\'ll explain a little first, then we\'ll role-play. Sound good?',
			'rolePlayPage.coffeeRecommendation.chat.incoming1' => 'Hey! Need a suggestion, or do you already know what you want?',
			'rolePlayPage.coffeeRecommendation.chat.outgoing1' => 'I\'d love a recommendation — something not too bitter.',
			'rolePlayPage.coffeeRecommendation.chat.incoming2Highlight' => 'Perfect',
			'rolePlayPage.coffeeRecommendation.chat.incoming2Rest' => '! Our honey oat latte is popular, or the caramel cold brew if you want iced.',
			'rolePlayPage.coffeeRecommendation.chat.botReply' => 'Great pick. What size should I make that?',
			'rolePlayPage.coffeeWrongOrder.title' => 'Fixing a Wrong Coffee Order',
			'rolePlayPage.coffeeWrongOrder.screenplay' => 'Politely explain that your drink is wrong, describe what you ordered, ask for a remake or swap, and thank the barista.',
			'rolePlayPage.coffeeWrongOrder.chat.briefing' => 'Hi! Today we\'ll practice fixing a wrong coffee order — staying polite, explaining the mistake, and asking for a remake. I\'ll teach a few phrases first, then we\'ll act it out. Ready?',
			'rolePlayPage.coffeeWrongOrder.chat.incoming1' => 'Here\'s your order — medium iced latte. Enjoy!',
			'rolePlayPage.coffeeWrongOrder.chat.outgoing1' => 'Sorry, I think this might be wrong. I asked for a hot oat milk latte.',
			'rolePlayPage.coffeeWrongOrder.chat.incoming2Highlight' => 'Oh no',
			'rolePlayPage.coffeeWrongOrder.chat.incoming2Rest' => ' — my mistake! I\'ll remake that for you right away.',
			'rolePlayPage.coffeeWrongOrder.chat.botReply' => 'Thanks for your patience. Hot oat milk latte coming up.',
			'rolePlayPage.directions.title' => 'Pedindo Direções na Rua',
			'rolePlayPage.directions.screenplay' => 'Peça direções para um lugar, descubra como chegar ao metrô ou ônibus, obtenha informações sobre bilhetes e ouça recomendações de restaurantes.',
			'rolePlayPage.directions.chat.briefing' => 'Oi! Hoje vamos praticar pedir direções na rua. Vou explicar um pouco primeiro, depois vamos encenar. Tudo bem?',
			'rolePlayPage.directions.chat.incoming1' => 'Oi! Você parece um pouco perdido — precisa de ajuda para encontrar algo?',
			'rolePlayPage.directions.chat.outgoing1' => 'Sim, estou procurando a estação de metrô mais próxima.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Claro',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Ande duas quadras naquela direção, depois vire à esquerda. Você verá a entrada.',
			'rolePlayPage.directions.chat.botReply' => 'De nada! Quer uma dica de restaurante perto da estação também?',
			'rolePlayPage.directionsWrongWay.title' => 'Correcting Wrong Directions',
			'rolePlayPage.directionsWrongWay.screenplay' => 'Realize the directions were wrong, politely check again, and get clearer landmark-based instructions.',
			'rolePlayPage.directionsWrongWay.chat.briefing' => 'Hi! Today we\'ll practice fixing wrong directions politely. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.directionsWrongWay.chat.incoming1' => 'Did you find the park?',
			'rolePlayPage.directionsWrongWay.chat.outgoing1' => 'I think I went the wrong way. Could you explain it again with landmarks?',
			'rolePlayPage.directionsWrongWay.chat.incoming2Highlight' => 'Of course',
			'rolePlayPage.directionsWrongWay.chat.incoming2Rest' => ' — walk past the red bookstore, then left at the fountain.',
			'rolePlayPage.directionsWrongWay.chat.botReply' => 'If you see the bakery, you\'ve gone too far.',
			'rolePlayPage.directionsTransit.title' => 'Asking About Bus or Subway Routes',
			'rolePlayPage.directionsTransit.screenplay' => 'Ask which line to take, how many stops, and where to transfer to reach your destination.',
			'rolePlayPage.directionsTransit.chat.briefing' => 'Hi! Today we\'ll practice asking about bus and subway routes. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.directionsTransit.chat.incoming1' => 'Need transit help?',
			'rolePlayPage.directionsTransit.chat.outgoing1' => 'Yes — which subway line goes to the museum?',
			'rolePlayPage.directionsTransit.chat.incoming2Highlight' => 'Take the blue line',
			'rolePlayPage.directionsTransit.chat.incoming2Rest' => ' three stops, then transfer to the green line.',
			'rolePlayPage.directionsTransit.chat.botReply' => 'The whole trip is about twenty minutes.',
			'rolePlayPage.directionsLost.title' => 'Asking for Help When You\'re Lost',
			'rolePlayPage.directionsLost.screenplay' => 'Admit you\'re lost, describe where you need to go, and confirm the directions before you leave.',
			'rolePlayPage.directionsLost.chat.briefing' => 'Hi! Today we\'ll practice asking for help when you\'re lost. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.directionsLost.chat.incoming1' => 'You look a little lost — need a hand?',
			'rolePlayPage.directionsLost.chat.outgoing1' => 'Yes, please. I\'m trying to find City Hall.',
			'rolePlayPage.directionsLost.chat.incoming2Highlight' => 'Easy',
			'rolePlayPage.directionsLost.chat.incoming2Rest' => ' — go straight two blocks, then turn right.',
			'rolePlayPage.directionsLost.chat.botReply' => 'Want me to point it out on the map too?',
			'rolePlayPage.interview.title' => 'Entrevista de Emprego',
			'rolePlayPage.interview.screenplay' => 'Apresente-se, responda perguntas comuns de entrevista, fale sobre sua experiência e pergunte sobre o papel e os próximos passos.',
			'rolePlayPage.interview.chat.briefing' => 'Oi! Hoje vamos praticar uma entrevista de emprego. Vou explicar um pouco primeiro, depois vamos encenar — eu vou te entrevistar, depois trocamos. Tudo bem?',
			'rolePlayPage.interview.chat.incoming1' => 'Obrigado por vir hoje. Você poderia se apresentar brevemente?',
			'rolePlayPage.interview.chat.outgoing1' => 'Claro. Estou animado por estar aqui e compartilhar minha experiência.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Maravilhoso',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Fale-me sobre um projeto recente do qual você se orgulha.',
			'rolePlayPage.interview.chat.botReply' => 'Isso é impressionante. Que perguntas você tem sobre o papel?',
			'rolePlayPage.interviewSalary.title' => 'Discussing Salary Expectations',
			'rolePlayPage.interviewSalary.screenplay' => 'Talk about salary range politely, ask about benefits, and keep the tone professional.',
			'rolePlayPage.interviewSalary.chat.briefing' => 'Hi! Today we\'ll practice discussing salary expectations professionally. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.interviewSalary.chat.incoming1' => 'What are your salary expectations for this role?',
			'rolePlayPage.interviewSalary.chat.outgoing1' => 'I\'m looking for a range around market average for this level. Could you share your band?',
			'rolePlayPage.interviewSalary.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.interviewSalary.chat.incoming2Rest' => '. Benefits also include remote days and learning budget.',
			'rolePlayPage.interviewSalary.chat.botReply' => 'Are benefits important in your decision?',
			'rolePlayPage.interviewExperience.title' => 'Describing Work Experience',
			'rolePlayPage.interviewExperience.screenplay' => 'Walk through a recent role, your responsibilities, and one achievement with numbers if possible.',
			'rolePlayPage.interviewExperience.chat.briefing' => 'Hi! Today we\'ll practice describing work experience clearly. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.interviewExperience.chat.incoming1' => 'Tell me about your most recent role.',
			'rolePlayPage.interviewExperience.chat.outgoing1' => 'I coordinated a small team and improved our delivery time.',
			'rolePlayPage.interviewExperience.chat.incoming2Highlight' => 'Interesting',
			'rolePlayPage.interviewExperience.chat.incoming2Rest' => '. By how much did you improve it?',
			'rolePlayPage.interviewExperience.chat.botReply' => 'What was the hardest part of that job?',
			'rolePlayPage.interviewStrengths.title' => 'Talking About Your Strengths',
			'rolePlayPage.interviewStrengths.screenplay' => 'Describe two strengths with short examples and connect them to the job.',
			'rolePlayPage.interviewStrengths.chat.briefing' => 'Hi! Today we\'ll practice talking about your strengths in an interview. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.interviewStrengths.chat.incoming1' => 'What would you say are your biggest strengths?',
			'rolePlayPage.interviewStrengths.chat.outgoing1' => 'I\'m organized and I communicate clearly with teammates.',
			'rolePlayPage.interviewStrengths.chat.incoming2Highlight' => 'Good',
			'rolePlayPage.interviewStrengths.chat.incoming2Rest' => '. Can you give a quick example?',
			'rolePlayPage.interviewStrengths.chat.botReply' => 'How do those strengths help in this role?',
			'rolePlayPage.customScenarios' => 'Your scenarios',
			'rolePlayPage.createOwnScenario' => 'Crie seu próprio cenário!',
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
			'rolePlayPage.missedTrainRefund.title' => 'Asking About Rebooking or a Refund',
			'rolePlayPage.missedTrainRefund.screenplay' => 'Ask about rebooking, refunds, or compensation after missing a connection due to a delay.',
			'rolePlayPage.missedTrainRefund.chat.briefing' => 'Hi! Today we\'ll practice asking about rebooking or refunds after a missed train. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.missedTrainRefund.chat.incoming1' => 'How can I help?',
			'rolePlayPage.missedTrainRefund.chat.outgoing1' => 'My first train was delayed and I missed the connection. Can I rebook for free?',
			'rolePlayPage.missedTrainRefund.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.missedTrainRefund.chat.incoming2Rest' => ' — I\'ll put you on the next available train.',
			'rolePlayPage.missedTrainRefund.chat.botReply' => 'Would you like an email confirmation too?',
			'rolePlayPage.missedTrainTicket.title' => 'Fixing a Ticket After Missing a Train',
			'rolePlayPage.missedTrainTicket.screenplay' => 'Ask whether your ticket is still valid, if you can board the next train, and what to do at the gate.',
			'rolePlayPage.missedTrainTicket.chat.briefing' => 'Hi! Today we\'ll practice fixing ticket issues after missing a train. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.missedTrainTicket.chat.incoming1' => 'Ticket problems?',
			'rolePlayPage.missedTrainTicket.chat.outgoing1' => 'I missed my train. Is this ticket still valid for the next one?',
			'rolePlayPage.missedTrainTicket.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.missedTrainTicket.chat.incoming2Rest' => ' for the next two hours on the same route.',
			'rolePlayPage.missedTrainTicket.chat.botReply' => 'Just show it at the gate — you\'re fine.',
			'rolePlayPage.missedTrainNext.title' => 'Finding the Next Train',
			'rolePlayPage.missedTrainNext.screenplay' => 'Explain you missed your train and ask when the next one leaves and which platform to use.',
			'rolePlayPage.missedTrainNext.chat.briefing' => 'Hi! Today we\'ll practice finding the next train after missing yours. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.missedTrainNext.chat.incoming1' => 'Can I help you?',
			'rolePlayPage.missedTrainNext.chat.outgoing1' => 'I just missed the 10:15 to Boston. When\'s the next one?',
			'rolePlayPage.missedTrainNext.chat.incoming2Highlight' => 'Next is 10:45',
			'rolePlayPage.missedTrainNext.chat.incoming2Rest' => ' from platform 3.',
			'rolePlayPage.missedTrainNext.chat.botReply' => 'Do you need help with the ticket gate?',
			'rolePlayPage.flightAttendant.title' => 'Talking to a Flight Attendant',
			'rolePlayPage.flightAttendant.screenplay' => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.',
			'rolePlayPage.flightAttendant.chat.briefing' => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.flightAttendant.chat.incoming1' => 'Hello! May I see your boarding pass, please?',
			'rolePlayPage.flightAttendant.chat.outgoing1' => 'Sure, here you go. I\'m in seat 14B.',
			'rolePlayPage.flightAttendant.chat.incoming2Highlight' => 'Thank you',
			'rolePlayPage.flightAttendant.chat.incoming2Rest' => '. Would you like some help finding your seat?',
			'rolePlayPage.flightAttendant.chat.botReply' => 'Would you like something to drink — water, juice, coffee, or tea?',
			'rolePlayPage.flightDelay.title' => 'Asking About a Delay or Connection',
			'rolePlayPage.flightDelay.screenplay' => 'Ask why the flight is delayed, whether you\'ll make a connection, and what help is available.',
			'rolePlayPage.flightDelay.chat.briefing' => 'Hi! Today we\'ll practice asking about delays and connections on a flight. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flightDelay.chat.incoming1' => 'We\'ll be delayed about forty minutes.',
			'rolePlayPage.flightDelay.chat.outgoing1' => 'I have a tight connection. Will I still make it?',
			'rolePlayPage.flightDelay.chat.incoming2Highlight' => 'We\'ll try',
			'rolePlayPage.flightDelay.chat.incoming2Rest' => '. I\'ll radio ahead if needed.',
			'rolePlayPage.flightDelay.chat.botReply' => 'Do you need gate information for the next flight?',
			'rolePlayPage.flightSpecialMeal.title' => 'Asking for a Special Meal',
			'rolePlayPage.flightSpecialMeal.screenplay' => 'Ask about meal options, request vegetarian or other special meals, and confirm timing.',
			'rolePlayPage.flightSpecialMeal.chat.briefing' => 'Hi! Today we\'ll practice asking for a special meal on a flight. I\'ll explain first, then we\'ll act it out. Ready?',
			'rolePlayPage.flightSpecialMeal.chat.incoming1' => 'We\'re serving dinner soon.',
			'rolePlayPage.flightSpecialMeal.chat.outgoing1' => 'Do you have a vegetarian option?',
			'rolePlayPage.flightSpecialMeal.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.flightSpecialMeal.chat.incoming2Rest' => ' — pasta or salad box.',
			'rolePlayPage.flightSpecialMeal.chat.botReply' => 'I\'ll bring it with the next cart.',
			'rolePlayPage.flightSeat.title' => 'Asking to Change Seats',
			'rolePlayPage.flightSeat.screenplay' => 'Politely ask if you can switch seats for comfort, family, or a window/aisle preference.',
			'rolePlayPage.flightSeat.chat.briefing' => 'Hi! Today we\'ll practice asking a flight attendant to change seats. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flightSeat.chat.incoming1' => 'Need anything before takeoff?',
			'rolePlayPage.flightSeat.chat.outgoing1' => 'Could I move to an aisle seat if one is free?',
			'rolePlayPage.flightSeat.chat.incoming2Highlight' => 'Let me check',
			'rolePlayPage.flightSeat.chat.incoming2Rest' => '… yes, 14C is open.',
			'rolePlayPage.flightSeat.chat.botReply' => 'I\'ll move your bag tag too.',
			'rolePlayPage.trainTicket.title' => 'Buying a Train Ticket',
			'rolePlayPage.trainTicket.screenplay' => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.',
			'rolePlayPage.trainTicket.chat.briefing' => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.trainTicket.chat.incoming1' => 'Hello! Where would you like to go?',
			'rolePlayPage.trainTicket.chat.outgoing1' => 'I\'d like to go to Edinburgh, please.',
			'rolePlayPage.trainTicket.chat.incoming2Highlight' => 'Great',
			'rolePlayPage.trainTicket.chat.incoming2Rest' => '. When would you like to travel?',
			'rolePlayPage.trainTicket.chat.botReply' => 'Would you like a one-way or return ticket?',
			'rolePlayPage.trainTicketUpgrade.title' => 'Upgrading Your Seat or Class',
			'rolePlayPage.trainTicketUpgrade.screenplay' => 'Ask about upgrading to quiet car or first class, compare prices, and complete the change.',
			'rolePlayPage.trainTicketUpgrade.chat.briefing' => 'Hi! Today we\'ll practice upgrading a train seat or class. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.trainTicketUpgrade.chat.incoming1' => 'Need help with your ticket?',
			'rolePlayPage.trainTicketUpgrade.chat.outgoing1' => 'Can I upgrade to first class on this train?',
			'rolePlayPage.trainTicketUpgrade.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.trainTicketUpgrade.chat.incoming2Rest' => ' — seats are open for an extra forty dollars.',
			'rolePlayPage.trainTicketUpgrade.chat.botReply' => 'Quiet car is cheaper if you prefer that.',
			'rolePlayPage.trainTicketPlatform.title' => 'Finding the Right Platform',
			'rolePlayPage.trainTicketPlatform.screenplay' => 'Ask which platform your train leaves from and how to get there with luggage.',
			'rolePlayPage.trainTicketPlatform.chat.briefing' => 'Hi! Today we\'ll practice finding the right train platform. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.trainTicketPlatform.chat.incoming1' => 'Looking for your platform?',
			'rolePlayPage.trainTicketPlatform.chat.outgoing1' => 'Yes — the train to Chicago. Which platform is it?',
			'rolePlayPage.trainTicketPlatform.chat.incoming2Highlight' => 'Platform 7',
			'rolePlayPage.trainTicketPlatform.chat.incoming2Rest' => '. Elevators are on the left.',
			'rolePlayPage.trainTicketPlatform.chat.botReply' => 'Boarding starts in ten minutes.',
			'rolePlayPage.trainTicketChange.title' => 'Changing Your Train Ticket Time',
			'rolePlayPage.trainTicketChange.screenplay' => 'Ask to change departure time, check fees, and confirm the new ticket.',
			'rolePlayPage.trainTicketChange.chat.briefing' => 'Hi! Today we\'ll practice changing a train ticket time. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.trainTicketChange.chat.incoming1' => 'Ticket desk — how can I help?',
			'rolePlayPage.trainTicketChange.chat.outgoing1' => 'Can I change my 3 pm ticket to the 5 pm train?',
			'rolePlayPage.trainTicketChange.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.trainTicketChange.chat.incoming2Rest' => ', with a small change fee.',
			'rolePlayPage.trainTicketChange.chat.botReply' => 'I\'ll print the updated ticket now.',
			'rolePlayPage.restaurantReservation.title' => 'Making a Restaurant Reservation',
			'rolePlayPage.restaurantReservation.screenplay' => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.',
			'rolePlayPage.restaurantReservation.chat.briefing' => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?',
			'rolePlayPage.restaurantReservation.chat.incoming1' => 'Hello! How can I help you?',
			'rolePlayPage.restaurantReservation.chat.outgoing1' => 'Hi, I\'d like to make a reservation for dinner, please.',
			'rolePlayPage.restaurantReservation.chat.incoming2Highlight' => 'Of course',
			'rolePlayPage.restaurantReservation.chat.incoming2Rest' => '. What day would you like to come?',
			'rolePlayPage.restaurantReservation.chat.botReply' => 'How many people will be joining you?',
			'rolePlayPage.restaurantComplaint.title' => 'Complaining Politely at a Restaurant',
			'rolePlayPage.restaurantComplaint.screenplay' => 'Explain a problem with food or service calmly and ask for a fair fix.',
			'rolePlayPage.restaurantComplaint.chat.briefing' => 'Hi! Today we\'ll practice complaining politely at a restaurant. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.restaurantComplaint.chat.incoming1' => 'Is everything alright with your meal?',
			'rolePlayPage.restaurantComplaint.chat.outgoing1' => 'The pasta is cold. Could you remake it, please?',
			'rolePlayPage.restaurantComplaint.chat.incoming2Highlight' => 'I\'m sorry',
			'rolePlayPage.restaurantComplaint.chat.incoming2Rest' => ' — we\'ll remake it right away.',
			'rolePlayPage.restaurantComplaint.chat.botReply' => 'Would you like a drink while you wait?',
			'rolePlayPage.restaurantAllergy.title' => 'Talking About Food Allergies',
			'rolePlayPage.restaurantAllergy.screenplay' => 'Explain allergies or diet needs, ask what\'s safe on the menu, and confirm with the staff.',
			'rolePlayPage.restaurantAllergy.chat.briefing' => 'Hi! Today we\'ll practice talking about food allergies at a restaurant. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.restaurantAllergy.chat.incoming1' => 'Any allergies we should know about?',
			'rolePlayPage.restaurantAllergy.chat.outgoing1' => 'Yes — I\'m allergic to peanuts. Which dishes are safe?',
			'rolePlayPage.restaurantAllergy.chat.incoming2Highlight' => 'Most pasta dishes',
			'rolePlayPage.restaurantAllergy.chat.incoming2Rest' => ' are fine. I\'ll flag it for the kitchen.',
			'rolePlayPage.restaurantAllergy.chat.botReply' => 'Would you like the chef\'s recommendation?',
			'rolePlayPage.restaurantChange.title' => 'Changing a Restaurant Reservation',
			'rolePlayPage.restaurantChange.screenplay' => 'Call to change the time or party size and confirm the new details.',
			'rolePlayPage.restaurantChange.chat.briefing' => 'Hi! Today we\'ll practice changing a restaurant reservation. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.restaurantChange.chat.incoming1' => 'Reservation desk, how can I help?',
			'rolePlayPage.restaurantChange.chat.outgoing1' => 'I have a booking for 7. Can we move it to 8 for four people?',
			'rolePlayPage.restaurantChange.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.restaurantChange.chat.incoming2Rest' => ', 8 pm for four is available.',
			'rolePlayPage.restaurantChange.chat.botReply' => 'I\'ll text you the confirmation.',
			'rolePlayPage.doctorAppointment.title' => 'Making a Doctor\'s Appointment',
			'rolePlayPage.doctorAppointment.screenplay' => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.',
			'rolePlayPage.doctorAppointment.chat.briefing' => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.doctorAppointment.chat.incoming1' => 'Hello! How can I help you today?',
			'rolePlayPage.doctorAppointment.chat.outgoing1' => 'Hi, I\'d like to book an appointment with a doctor, please.',
			'rolePlayPage.doctorAppointment.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.doctorAppointment.chat.incoming2Rest' => '. Have you visited our clinic before?',
			'rolePlayPage.doctorAppointment.chat.botReply' => 'What would you like to see the doctor about?',
			'rolePlayPage.doctorFollowUp.title' => 'Talking About Test Results',
			'rolePlayPage.doctorFollowUp.screenplay' => 'Ask what results mean, next steps, and whether you need another appointment.',
			'rolePlayPage.doctorFollowUp.chat.briefing' => 'Hi! Today we\'ll practice talking about test results with a doctor. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.doctorFollowUp.chat.incoming1' => 'Your blood test results are back.',
			'rolePlayPage.doctorFollowUp.chat.outgoing1' => 'What do they mean? Do I need more tests?',
			'rolePlayPage.doctorFollowUp.chat.incoming2Highlight' => 'Mostly normal',
			'rolePlayPage.doctorFollowUp.chat.incoming2Rest' => '. One value is a bit high, so let\'s recheck in a month.',
			'rolePlayPage.doctorFollowUp.chat.botReply' => 'Any questions before we finish?',
			'rolePlayPage.doctorPrescription.title' => 'Asking About Medicine',
			'rolePlayPage.doctorPrescription.screenplay' => 'Ask how to take medicine, about side effects, and when to come back if it doesn\'t help.',
			'rolePlayPage.doctorPrescription.chat.briefing' => 'Hi! Today we\'ll practice asking about medicine and prescriptions. I\'ll explain first, then we\'ll act it out. Ready?',
			'rolePlayPage.doctorPrescription.chat.incoming1' => 'I\'m giving you this medicine twice a day.',
			'rolePlayPage.doctorPrescription.chat.outgoing1' => 'Should I take it with food? Any side effects?',
			'rolePlayPage.doctorPrescription.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.doctorPrescription.chat.incoming2Rest' => ', with food. Mild drowsiness is possible.',
			'rolePlayPage.doctorPrescription.chat.botReply' => 'If it doesn\'t help in three days, call us.',
			'rolePlayPage.doctorSymptoms.title' => 'Describing Your Symptoms',
			'rolePlayPage.doctorSymptoms.screenplay' => 'Explain what hurts, when it started, and how strong the pain is.',
			'rolePlayPage.doctorSymptoms.chat.briefing' => 'Hi! Today we\'ll practice describing symptoms at a doctor\'s appointment. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.doctorSymptoms.chat.incoming1' => 'What brings you in today?',
			'rolePlayPage.doctorSymptoms.chat.outgoing1' => 'I\'ve had a sore throat for three days.',
			'rolePlayPage.doctorSymptoms.chat.incoming2Highlight' => 'I see',
			'rolePlayPage.doctorSymptoms.chat.incoming2Rest' => '. Any fever or cough?',
			'rolePlayPage.doctorSymptoms.chat.botReply' => 'On a scale of one to ten, how bad is the pain?',
			'rolePlayPage.shoppingClothes.title' => 'Shopping for Clothes',
			'rolePlayPage.shoppingClothes.screenplay' => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.',
			'rolePlayPage.shoppingClothes.chat.briefing' => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?',
			'rolePlayPage.shoppingClothes.chat.incoming1' => 'Hello! Can I help you find something?',
			'rolePlayPage.shoppingClothes.chat.outgoing1' => 'Yes, I\'m looking for a casual shirt for everyday wear.',
			'rolePlayPage.shoppingClothes.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.shoppingClothes.chat.incoming2Rest' => '. What size do you usually wear?',
			'rolePlayPage.shoppingClothes.chat.botReply' => 'Would you prefer something casual or more formal?',
			'rolePlayPage.shoppingDiscount.title' => 'Asking About a Discount',
			'rolePlayPage.shoppingDiscount.screenplay' => 'Ask about sales, student discounts, or price matches, then decide whether the deal is worth it.',
			'rolePlayPage.shoppingDiscount.chat.briefing' => 'Hi! Today we\'ll practice asking about discounts and sales. I\'ll teach a few phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.shoppingDiscount.chat.incoming1' => 'That jacket looks great on you!',
			'rolePlayPage.shoppingDiscount.chat.outgoing1' => 'Thanks! Is it on sale, or do you have any discounts today?',
			'rolePlayPage.shoppingDiscount.chat.incoming2Highlight' => 'Actually',
			'rolePlayPage.shoppingDiscount.chat.incoming2Rest' => ', there\'s 20% off if you buy two items.',
			'rolePlayPage.shoppingDiscount.chat.botReply' => 'Student discount is also available with ID.',
			'rolePlayPage.shoppingReturn.title' => 'Returning an Item to the Store',
			'rolePlayPage.shoppingReturn.screenplay' => 'Return a purchase politely — explain the reason, show the receipt, and ask for a refund or exchange.',
			'rolePlayPage.shoppingReturn.chat.briefing' => 'Hi! Today we\'ll practice returning an item — being polite, explaining why, and asking for a refund. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.shoppingReturn.chat.incoming1' => 'Hi! How can I help you today?',
			'rolePlayPage.shoppingReturn.chat.outgoing1' => 'I\'d like to return this shirt. It doesn\'t fit well.',
			'rolePlayPage.shoppingReturn.chat.incoming2Highlight' => 'No problem',
			'rolePlayPage.shoppingReturn.chat.incoming2Rest' => '. Do you have the receipt with you?',
			'rolePlayPage.shoppingReturn.chat.botReply' => 'Would you prefer a refund or an exchange?',
			'rolePlayPage.shoppingFittingRoom.title' => 'Trying Clothes in the Fitting Room',
			'rolePlayPage.shoppingFittingRoom.screenplay' => 'Ask for a different size, check the mirror, and decide whether to buy the outfit.',
			'rolePlayPage.shoppingFittingRoom.chat.briefing' => 'Hi! Today we\'ll practice in a fitting room — sizes, colors, and deciding to buy. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.shoppingFittingRoom.chat.incoming1' => 'How\'s that size working for you?',
			'rolePlayPage.shoppingFittingRoom.chat.outgoing1' => 'It\'s a bit tight. Do you have a larger size?',
			'rolePlayPage.shoppingFittingRoom.chat.incoming2Highlight' => 'Sure',
			'rolePlayPage.shoppingFittingRoom.chat.incoming2Rest' => '! I\'ll grab the next size for you.',
			'rolePlayPage.shoppingFittingRoom.chat.botReply' => 'Want to try another color while I check?',
			'rolePlayPage.takingTaxi.title' => 'Taking a Taxi',
			'rolePlayPage.takingTaxi.screenplay' => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.',
			'rolePlayPage.takingTaxi.chat.briefing' => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?',
			'rolePlayPage.takingTaxi.chat.incoming1' => 'Hello! Where would you like to go?',
			'rolePlayPage.takingTaxi.chat.outgoing1' => 'The Grand Hotel on Park Street, please.',
			'rolePlayPage.takingTaxi.chat.incoming2Highlight' => 'Got it',
			'rolePlayPage.takingTaxi.chat.incoming2Rest' => '. Do you have the exact address?',
			'rolePlayPage.takingTaxi.chat.botReply' => 'Would you prefer the fastest route?',
			'rolePlayPage.taxiComplaint.title' => 'Handling a Taxi Problem',
			'rolePlayPage.taxiComplaint.screenplay' => 'Politely raise an issue — wrong route, AC, or fare — and ask for a fair solution.',
			'rolePlayPage.taxiComplaint.chat.briefing' => 'Hi! Today we\'ll practice handling a problem in a taxi politely. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.taxiComplaint.chat.incoming1' => 'We\'re almost there.',
			'rolePlayPage.taxiComplaint.chat.outgoing1' => 'Sorry, but this isn\'t the address I gave. Can we fix that?',
			'rolePlayPage.taxiComplaint.chat.incoming2Highlight' => 'Oh',
			'rolePlayPage.taxiComplaint.chat.incoming2Rest' => ' — my mistake. I\'ll turn around right away.',
			'rolePlayPage.taxiComplaint.chat.botReply' => 'Thanks for telling me. No extra charge.',
			'rolePlayPage.taxiTraffic.title' => 'Talking About Traffic and Routes',
			'rolePlayPage.taxiTraffic.screenplay' => 'Discuss traffic, ask for a faster route, and decide whether to wait or take another way.',
			'rolePlayPage.taxiTraffic.chat.briefing' => 'Hi! Today we\'ll practice talking about traffic and alternate routes in a taxi. I\'ll explain first, then we\'ll act it out. Ready?',
			'rolePlayPage.taxiTraffic.chat.incoming1' => 'Traffic is heavy on the highway.',
			'rolePlayPage.taxiTraffic.chat.outgoing1' => 'Is there a faster route through the city?',
			'rolePlayPage.taxiTraffic.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.taxiTraffic.chat.incoming2Rest' => ', but there are more lights. It might still be quicker.',
			'rolePlayPage.taxiTraffic.chat.botReply' => 'Want me to take the city route?',
			'rolePlayPage.taxiFare.title' => 'Asking About the Taxi Fare',
			'rolePlayPage.taxiFare.screenplay' => 'Ask for an estimate before the ride, confirm payment options, and check the final amount at the end.',
			'rolePlayPage.taxiFare.chat.briefing' => 'Hi! Today we\'ll practice asking about taxi fares. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.taxiFare.chat.incoming1' => 'Where to?',
			'rolePlayPage.taxiFare.chat.outgoing1' => 'To the airport, please. About how much will it cost?',
			'rolePlayPage.taxiFare.chat.incoming2Highlight' => 'Around thirty',
			'rolePlayPage.taxiFare.chat.incoming2Rest' => ', depending on traffic.',
			'rolePlayPage.taxiFare.chat.botReply' => 'Card and cash are both fine.',
			'rolePlayPage.rentingApartment.title' => 'Renting an Apartment',
			'rolePlayPage.rentingApartment.screenplay' => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.',
			'rolePlayPage.rentingApartment.chat.briefing' => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?',
			'rolePlayPage.rentingApartment.chat.incoming1' => 'Hello! Are you interested in renting the apartment?',
			'rolePlayPage.rentingApartment.chat.outgoing1' => 'Yes, I\'d like to know more about it, please.',
			'rolePlayPage.rentingApartment.chat.incoming2Highlight' => 'Great',
			'rolePlayPage.rentingApartment.chat.incoming2Rest' => '. When are you looking to move in?',
			'rolePlayPage.rentingApartment.chat.botReply' => 'Do you need a furnished or unfurnished apartment?',
			'rolePlayPage.rentingApartmentNegotiate.title' => 'Negotiating Rent and Lease Terms',
			'rolePlayPage.rentingApartmentNegotiate.screenplay' => 'Negotiate rent, deposit, move-in date, and pet policy politely while staying clear about your limits.',
			'rolePlayPage.rentingApartmentNegotiate.chat.briefing' => 'Hi! Today we\'ll practice negotiating rent and lease terms. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.rentingApartmentNegotiate.chat.incoming1' => 'The rent is thirteen hundred plus utilities.',
			'rolePlayPage.rentingApartmentNegotiate.chat.outgoing1' => 'Could you do twelve fifty if I sign a longer lease?',
			'rolePlayPage.rentingApartmentNegotiate.chat.incoming2Highlight' => 'Possibly',
			'rolePlayPage.rentingApartmentNegotiate.chat.incoming2Rest' => ' for a 18-month lease. Deposit is still one month.',
			_ => null,
		} ?? switch (path) {
			'rolePlayPage.rentingApartmentNegotiate.chat.botReply' => 'Are pets allowed with an extra fee?',
			'rolePlayPage.rentingApartmentAgent.title' => 'Talking with a Real Estate Agent',
			'rolePlayPage.rentingApartmentAgent.screenplay' => 'Talk to an agent about budget, location, lease length, and which listings match your needs.',
			'rolePlayPage.rentingApartmentAgent.chat.briefing' => 'Hi! Today we\'ll practice talking with a real estate agent about rentals. I\'ll explain first, then we\'ll act it out. Ready?',
			'rolePlayPage.rentingApartmentAgent.chat.incoming1' => 'What kind of apartment are you looking for?',
			'rolePlayPage.rentingApartmentAgent.chat.outgoing1' => 'A one-bedroom near the subway, under twelve hundred a month.',
			'rolePlayPage.rentingApartmentAgent.chat.incoming2Highlight' => 'Perfect',
			'rolePlayPage.rentingApartmentAgent.chat.incoming2Rest' => '. I have three options in that range.',
			'rolePlayPage.rentingApartmentAgent.chat.botReply' => 'Do you prefer furnished or unfurnished?',
			'rolePlayPage.rentingApartmentTour.title' => 'Talking About the Apartment on a Tour',
			'rolePlayPage.rentingApartmentTour.screenplay' => 'Ask about rooms, sunlight, noise, appliances, and whether furniture is included during a viewing.',
			'rolePlayPage.rentingApartmentTour.chat.briefing' => 'Hi! Today we\'ll practice talking about an apartment during a viewing. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.rentingApartmentTour.chat.incoming1' => 'Here\'s the living room — what do you think?',
			'rolePlayPage.rentingApartmentTour.chat.outgoing1' => 'It\'s nice. Does it get much sunlight in the afternoon?',
			'rolePlayPage.rentingApartmentTour.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.rentingApartmentTour.chat.incoming2Rest' => ', especially from these windows.',
			'rolePlayPage.rentingApartmentTour.chat.botReply' => 'Want to see the kitchen and balcony next?',
			'rolePlayPage.birthdayParty.title' => 'Planning a Birthday Party',
			'rolePlayPage.birthdayParty.screenplay' => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.',
			'rolePlayPage.birthdayParty.chat.briefing' => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?',
			'rolePlayPage.birthdayParty.chat.incoming1' => 'So, whose birthday are we planning?',
			'rolePlayPage.birthdayParty.chat.outgoing1' => 'It\'s for my friend Emma — her birthday is next month.',
			'rolePlayPage.birthdayParty.chat.incoming2Highlight' => 'Nice',
			'rolePlayPage.birthdayParty.chat.incoming2Rest' => '! When should we have the party?',
			'rolePlayPage.birthdayParty.chat.botReply' => 'Would you rather have the party at home or at a restaurant?',
			'rolePlayPage.birthdaySurprise.title' => 'Planning a Surprise Party',
			'rolePlayPage.birthdaySurprise.screenplay' => 'Keep the surprise secret, assign tasks, and handle last-minute changes without spoiling it.',
			'rolePlayPage.birthdaySurprise.chat.briefing' => 'Hi! Today we\'ll practice planning a surprise party without spoiling it. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.birthdaySurprise.chat.incoming1' => 'Is everything ready for the surprise?',
			'rolePlayPage.birthdaySurprise.chat.outgoing1' => 'Almost — can you distract her until 7?',
			'rolePlayPage.birthdaySurprise.chat.incoming2Highlight' => 'Got it',
			'rolePlayPage.birthdaySurprise.chat.incoming2Rest' => '. What if she finishes work early?',
			'rolePlayPage.birthdaySurprise.chat.botReply' => 'Text me and I\'ll stall with coffee.',
			'rolePlayPage.birthdayGifts.title' => 'Talking About Birthday Gifts',
			'rolePlayPage.birthdayGifts.screenplay' => 'Discuss gift ideas, budget, and whether to buy something together.',
			'rolePlayPage.birthdayGifts.chat.briefing' => 'Hi! Today we\'ll practice talking about birthday gifts. I\'ll explain first, then we\'ll act it out. Sound good?',
			'rolePlayPage.birthdayGifts.chat.incoming1' => 'What should we get for Emma?',
			'rolePlayPage.birthdayGifts.chat.outgoing1' => 'Maybe a book or headphones. What\'s our budget?',
			'rolePlayPage.birthdayGifts.chat.incoming2Highlight' => 'Around thirty',
			'rolePlayPage.birthdayGifts.chat.incoming2Rest' => ' each if we go together.',
			'rolePlayPage.birthdayGifts.chat.botReply' => 'Want to shop online or in store?',
			'rolePlayPage.birthdayInvite.title' => 'Inviting Guests to a Party',
			'rolePlayPage.birthdayInvite.screenplay' => 'Invite friends, share the date and place, and ask who can come.',
			'rolePlayPage.birthdayInvite.chat.briefing' => 'Hi! Today we\'ll practice inviting guests to a birthday party. I\'ll explain first, then we\'ll role-play. Ready?',
			'rolePlayPage.birthdayInvite.chat.incoming1' => 'What\'s up?',
			'rolePlayPage.birthdayInvite.chat.outgoing1' => 'I\'m hosting a birthday party on Saturday. Can you come?',
			'rolePlayPage.birthdayInvite.chat.incoming2Highlight' => 'Yes',
			'rolePlayPage.birthdayInvite.chat.incoming2Rest' => '! What time does it start?',
			'rolePlayPage.birthdayInvite.chat.botReply' => 'Should I bring anything?',
			'rolePlayPage.deleteFailed' => 'Não foi possível apagar o cenário. Tenta novamente.',
			'rolePlayPage.easy' => 'Fácil',
			'rolePlayPage.medium' => 'Médio',
			'rolePlayPage.hard' => 'Difícil',
			'rolePlayPage.filterAll' => 'Tudo',
			'rolePlayPage.seeAll' => 'Ver tudo',
			'rolePlayPage.lingolaRolePlay' => 'Lingola RolePlay',
			'rolePlayPage.shopping' => 'Compras',
			'rolePlayPage.flirting' => 'Flerte',
			'rolePlayPage.lifeInTheUs' => 'Vida nos EUA',
			'rolePlayPage.freeDiscussion' => 'Discussão livre',
			'rolePlayPage.jobInterview' => 'Entrevista de emprego',
			'rolePlayPage.socialDynamics' => 'Dinâmica social',
			'rolePlayPage.restaurant' => 'Restaurante',
			'rolePlayPage.travel' => 'Viagem',
			'rolePlayPage.createFieldDifficulty' => 'Dificuldade',
			'rolePlayPage.flirtingMeet.title' => 'Meeting Someone New at a Café',
			'rolePlayPage.flirtingMeet.screenplay' => 'Strike up a friendly conversation, share a little about yourself, exchange interests, and decide whether to meet again.',
			'rolePlayPage.flirtingMeet.chat.briefing' => 'Hi! Today we\'ll practice a light flirting conversation at a café — hellos, compliments, and asking for a number. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flirtingMeet.chat.incoming1' => 'Is this seat taken? The place is packed today.',
			'rolePlayPage.flirtingMeet.chat.outgoing1' => 'Oh, go ahead! I was just waiting for my coffee.',
			'rolePlayPage.flirtingMeet.chat.incoming2Highlight' => 'Thanks',
			'rolePlayPage.flirtingMeet.chat.incoming2Rest' => '! I\'m Alex, by the way. What brings you here?',
			'rolePlayPage.flirtingMeet.chat.botReply' => 'Nice to meet you. Do you come here often?',
			'rolePlayPage.flirtingAwkward.title' => 'Handling an Awkward Moment',
			'rolePlayPage.flirtingAwkward.screenplay' => 'Recover from a misunderstanding or awkward pause, apologize lightly, and steer the chat back to a comfortable topic.',
			'rolePlayPage.flirtingAwkward.chat.briefing' => 'Hi! Today we\'ll practice handling an awkward moment in a flirty chat — light apology and recovery. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flirtingAwkward.chat.incoming1' => 'Wait… I think you mixed up my name.',
			'rolePlayPage.flirtingAwkward.chat.outgoing1' => 'Oh no — sorry! That was embarrassing. Can we start over?',
			'rolePlayPage.flirtingAwkward.chat.incoming2Highlight' => 'Haha, sure',
			'rolePlayPage.flirtingAwkward.chat.incoming2Rest' => '. I\'m Maya.',
			'rolePlayPage.flirtingAwkward.chat.botReply' => 'No hard feelings. What were we talking about?',
			'rolePlayPage.flirtingAskOut.title' => 'Asking Someone Out',
			'rolePlayPage.flirtingAskOut.screenplay' => 'After a short chat, suggest meeting again — coffee, a walk, or a movie — and handle a yes or a soft no gracefully.',
			'rolePlayPage.flirtingAskOut.chat.briefing' => 'Hi! Today we\'ll practice asking someone out politely. I\'ll explain first, then we\'ll act it out. Ready?',
			'rolePlayPage.flirtingAskOut.chat.incoming1' => 'I\'ve really enjoyed talking with you.',
			'rolePlayPage.flirtingAskOut.chat.outgoing1' => 'Me too. Would you like to grab coffee sometime this week?',
			'rolePlayPage.flirtingAskOut.chat.incoming2Highlight' => 'I\'d love that',
			'rolePlayPage.flirtingAskOut.chat.incoming2Rest' => '. What day works for you?',
			'rolePlayPage.flirtingAskOut.chat.botReply' => 'Saturday afternoon is free for me.',
			'rolePlayPage.flirtingCompliment.title' => 'Giving a Friendly Compliment',
			'rolePlayPage.flirtingCompliment.screenplay' => 'Start with a light compliment, keep it respectful, and see if the other person wants to keep talking.',
			'rolePlayPage.flirtingCompliment.chat.briefing' => 'Hi! Today we\'ll practice giving a friendly compliment — short, kind, and natural. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flirtingCompliment.chat.incoming1' => 'Oh, excuse me — I almost bumped into you.',
			'rolePlayPage.flirtingCompliment.chat.outgoing1' => 'No worries! By the way, I like your jacket.',
			'rolePlayPage.flirtingCompliment.chat.incoming2Highlight' => 'Thanks',
			'rolePlayPage.flirtingCompliment.chat.incoming2Rest' => '! That\'s sweet of you to say.',
			'rolePlayPage.flirtingCompliment.chat.botReply' => 'Are you waiting for someone, or just hanging out?',
			'rolePlayPage.freeTalkHobby.title' => 'Talking About Hobbies',
			'rolePlayPage.freeTalkHobby.screenplay' => 'Chat freely about free-time activities, ask follow-up questions, share preferences, and suggest trying something new together.',
			'rolePlayPage.freeTalkHobby.chat.briefing' => 'Hi! Today we\'ll practice free discussion about hobbies — asking, answering, and reacting naturally. I\'ll explain first, then we\'ll talk. Ready?',
			'rolePlayPage.freeTalkHobby.chat.incoming1' => 'So, what do you usually do on weekends?',
			'rolePlayPage.freeTalkHobby.chat.outgoing1' => 'I like hiking and watching films. How about you?',
			'rolePlayPage.freeTalkHobby.chat.incoming2Highlight' => 'Nice',
			'rolePlayPage.freeTalkHobby.chat.incoming2Rest' => '! I\'ve been meaning to try hiking more. Any favorite trails?',
			'rolePlayPage.freeTalkHobby.chat.botReply' => 'That sounds perfect. Want to go together sometime?',
			'rolePlayPage.freeTalkDisagree.title' => 'Politely Disagreeing About Hobbies',
			'rolePlayPage.freeTalkDisagree.screenplay' => 'Disagree politely about a hobby preference, explain your view, and keep the conversation friendly.',
			'rolePlayPage.freeTalkDisagree.chat.briefing' => 'Hi! Today we\'ll practice disagreeing politely about hobbies. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.freeTalkDisagree.chat.incoming1' => 'I think hiking is boring.',
			'rolePlayPage.freeTalkDisagree.chat.outgoing1' => 'I get that — for me it\'s relaxing. What do you prefer instead?',
			'rolePlayPage.freeTalkDisagree.chat.incoming2Highlight' => 'Fair',
			'rolePlayPage.freeTalkDisagree.chat.incoming2Rest' => '. I like indoor climbing more.',
			'rolePlayPage.freeTalkDisagree.chat.botReply' => 'Maybe we can try each other\'s hobby once.',
			'rolePlayPage.freeTalkMovies.title' => 'Talking About Movies',
			'rolePlayPage.freeTalkMovies.screenplay' => 'Recommend a movie, ask about genres, and react to each other\'s favorites.',
			'rolePlayPage.freeTalkMovies.chat.briefing' => 'Hi! Today we\'ll practice talking about movies — genres, favorites, recommendations. I\'ll explain first, then we\'ll chat. Ready?',
			'rolePlayPage.freeTalkMovies.chat.incoming1' => 'Seen any good movies lately?',
			'rolePlayPage.freeTalkMovies.chat.outgoing1' => 'Yes — a comedy last week. Do you like comedies?',
			'rolePlayPage.freeTalkMovies.chat.incoming2Highlight' => 'Love them',
			'rolePlayPage.freeTalkMovies.chat.incoming2Rest' => '! Any titles you\'d recommend?',
			'rolePlayPage.freeTalkMovies.chat.botReply' => 'I\'ll send you my top three tonight.',
			'rolePlayPage.freeTalkWeekend.title' => 'Talking About Weekend Plans',
			'rolePlayPage.freeTalkWeekend.screenplay' => 'Share weekend plans, ask about theirs, and suggest a simple activity you could do together.',
			'rolePlayPage.freeTalkWeekend.chat.briefing' => 'Hi! Today we\'ll practice chatting about weekend plans. I\'ll explain first, then we\'ll talk. Sound good?',
			'rolePlayPage.freeTalkWeekend.chat.incoming1' => 'Any plans for the weekend?',
			'rolePlayPage.freeTalkWeekend.chat.outgoing1' => 'I might go to the park. What about you?',
			'rolePlayPage.freeTalkWeekend.chat.incoming2Highlight' => 'Nice',
			'rolePlayPage.freeTalkWeekend.chat.incoming2Rest' => '! I was thinking of a museum.',
			'rolePlayPage.freeTalkWeekend.chat.botReply' => 'Want to meet for a short walk on Sunday?',
			'notificationsPage.title' => 'Notificações',
			'notificationsPage.deleteConfirmTitle' => 'Tem certeza?',
			'notificationsPage.deleteConfirmBody' => 'Esta notificação será excluída.',
			'notificationsPage.delete' => 'Excluir',
			'notificationsPage.cancel' => 'Cancelar',
			'notificationsPage.translation.title' => 'Nova Tradução Pronta',
			'notificationsPage.translation.body' => 'Seu arquivo de tradução de áudio foi convertido com sucesso em texto e traduzido.',
			'notificationsPage.offer.title' => 'Uma Oferta Especial Te Aguarda',
			'notificationsPage.offer.body' => 'Faça upgrade para o Premium e tenha traduções de fotos ilimitadas com 50% de desconto.',
			'notificationsPage.stories.title' => 'Descubra Novas Histórias',
			'notificationsPage.stories.body' => 'Aprenda novas palavras através de histórias',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'Nenhuma notificação ainda',
			'notificationsPage.emptySubtitle' => 'Não se esqueça de verificar novamente quando receber uma notificação.',
			'profilePage.title' => 'Perfil',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Versão Grátis',
			'profilePage.dayStreak' => 'Sequência de Dias!',
			'profilePage.accountSettings' => 'Configurações da Conta',
			'profilePage.general' => 'Geral',
			'profilePage.profileSettings' => 'Configurações do Perfil',
			'profilePage.fullName' => 'Nome Completo',
			'profilePage.changeName' => 'Alterar nome',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Excluir Conta',
			'profilePage.save' => 'SALVAR',
			'profilePage.saveTitle' => 'Salvar',
			'profilePage.deleteTitle' => 'Não queremos que você vá, mas entendemos.',
			'profilePage.deleteBody' => 'Você pode nos dizer por que deseja sair para melhorarmos a experiência do Lingola?',
			'profilePage.deleteReasons.aiCharacters' => 'Não achei os personagens de inteligência artificial realistas.',
			'profilePage.deleteReasons.videoIssues' => 'Estou enfrentando problemas técnicos nas videochamadas.',
			'profilePage.deleteReasons.pricing' => 'Os preços da assinatura estão acima das minhas expectativas.',
			'profilePage.deleteReasons.noMatch' => 'Não encontrei personagens no estilo que eu procurava.',
			'profilePage.deleteReasons.shortTrial' => 'Queria apenas testar por um curto período.',
			'profilePage.deleteReasons.other' => 'Outro',
			'profilePage.messageOptional' => 'Mensagem (opcional)',
			'profilePage.messageHint' => 'Se você tiver uma mensagem, por favor escreva.',
			'profilePage.next' => 'PRÓXIMO',
			'profilePage.specialOfferTitle' => 'Oferta Especial',
			'profilePage.specialOfferBody' => 'Antes de sair, confira a oferta que preparamos para você.',
			'profilePage.monthlyPlanTitle' => 'Fique e ganhe 50% de desconto por 1 ano',
			'profilePage.monthlyPlanPrice' => 'Nossa melhor oferta de todas. Apenas \$24,99/ano',
			'profilePage.monthlyPlanDesc' => 'Nossa melhor oferta — 50% de desconto no plano anual.',
			'profilePage.whatYoullKeep' => 'O que você vai manter:',
			'profilePage.keepCharacters' => 'Acesso a todos os personagens',
			'profilePage.keepVideo' => 'Chamadas de vídeo ilimitadas',
			'profilePage.keepCourses' => 'Acesso a todos os cursos',
			'profilePage.switchMonthlyCta' => 'Aceitar 50% de desconto e ficar',
			'profilePage.confirmTitle' => 'Você tem certeza?',
			'profilePage.confirmBody' => 'Nós realmente não queremos que você vá. Aqui está o que você vai perder:',
			'profilePage.loseCharacters' => 'Acesso ilimitado a personagens',
			'profilePage.loseVideo' => 'Acesso ilimitado a chamadas de vídeo',
			'profilePage.loseCourses' => 'Acesso a todos os cursos',
			'profilePage.discountTitle' => 'Fique e ganhe 50% de desconto por 1 ano',
			'profilePage.discountSubtitle' => 'Nossa melhor oferta de todas. Apenas \$24,99/ano',
			'profilePage.acceptDiscountCta' => 'Aceitar 50% de desconto e ficar',
			'profilePage.deleteCta' => 'DELETE',
			'profilePage.farewellTitle' => 'Estamos tristes em ver você partir',
			'profilePage.farewellBody' => ({required Object date}) => 'Sua assinatura foi cancelada. Você terá acesso até o final do seu período de cobrança atual em ${date}.',
			'profilePage.changeMindTitle' => '✨ Mudou de ideia?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Você pode reativar sua assinatura a qualquer momento antes de ${date} para manter seus benefícios.',
			'profilePage.reactivateCta' => 'Espera, quero reativar',
			'profilePage.done' => 'FEITO',
			'profilePage.notifications' => 'Notificações',
			'profilePage.appLanguage' => 'Idioma do App',
			'profilePage.explanationLanguage' => 'Idioma das explicações',
			'profilePage.explanationNative' => 'Idioma nativo',
			'profilePage.explanationEnglish' => 'Inglês',
			'profilePage.explanationUpdateFailed' => 'Não foi possível atualizar o idioma das explicações',
			'profilePage.learnInNativeLanguage' => 'Aprenda no seu idioma nativo',
			'profilePage.targetLanguageLabel' => 'Idioma alvo',
			'profilePage.languageLevel' => 'Nível de idioma',
			'profilePage.nativeLanguage' => 'Idioma nativo',
			'profilePage.interests' => 'Interesses',
			'profilePage.goalChipCareer' => 'Carreira',
			'profilePage.goalChipTravel' => 'Viagem',
			'profilePage.goalChipLiving' => 'Vida',
			'profilePage.goalChipStudying' => 'Estudos',
			'profilePage.goalChipOther' => 'Outro',
			'profilePage.dailyGoal' => 'Meta diária',
			'profilePage.dailyReminder' => 'Lembrete diário',
			'profilePage.selectNativeLanguageTitle' => 'Selecione seu idioma nativo',
			'profilePage.reminderOn' => 'Ligado',
			'profilePage.reminderOff' => 'Desligado',
			'profilePage.remindMe' => 'Lembrar-me',
			'profilePage.reminderSave' => 'Salvar',
			'profilePage.reminderSaved' => 'Lembrete salvo',
			'profilePage.selectLanguageTitle' => 'Selecionar Idioma',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passivo',
			'profilePage.active' => 'Ativo',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Compartilhar com Amigo',
			'profilePage.shareWithFriendTitle' => 'Compartilhar com Amigo',
			'profilePage.shareInviteBody' => 'Convide seus amigos e aproveitem a tradução juntos',
			'profilePage.rateUs' => 'Avalie-nos',
			'profilePage.faq' => 'Perguntas frequentes do Lingola',
			'profilePage.contactUs' => 'Fale conosco',
			'profilePage.faqItems.supportedLanguages.question' => 'Quais idiomas o app suporta?',
			'profilePage.faqItems.supportedLanguages.answer' => 'A interface do Lingola está disponível em inglês, alemão, italiano, francês, turco, japonês, espanhol, russo, hindi, português e chinês simplificado.',
			'profilePage.faqItems.howAiWorks.question' => 'Como a IA funciona?',
			'profilePage.faqItems.howAiWorks.answer' => 'A IA interage com você como um tutor real. Ela analisa suas conversas, detecta erros e oferece feedback personalizado com base no seu progresso.',
			'profilePage.faqItems.offlineUse.question' => 'Posso usar o app offline?',
			'profilePage.faqItems.offlineUse.answer' => 'Sim. Você pode baixar certas lições e cenários de conversa com antecedência e usá-los offline. No entanto, o chat ao vivo requer uma conexão com a internet.',
			'profilePage.faqItems.isFree.question' => 'O app é gratuito?',
			'profilePage.faqItems.isFree.answer' => 'A versão básica é gratuita. Com o Premium, você tem acesso a cenários de chat avançados, análise de pronúncia e modo tutor pessoal.',
			'profilePage.faqItems.pronunciationEval.question' => 'Como minha pronúncia é avaliada?',
			'profilePage.faqItems.pronunciationEval.answer' => 'O app analisa sua voz e usa reconhecimento de fala com inteligência artificial para avaliar seu sotaque e pronúncia. Palavras que você precisa melhorar são destacadas.',
			'profilePage.faqItems.dailyPractice.question' => 'Preciso praticar diariamente?',
			'profilePage.faqItems.dailyPractice.answer' => 'Sim. O sistema acompanha seu progresso todos os dias. Apenas 10–15 minutos de prática de fala por dia podem acelerar visivelmente seu aprendizado de idiomas.',
			'profilePage.faqItems.levelDetermination.question' => 'Como meu nível de aprendizado é determinado?',
			'profilePage.faqItems.levelDetermination.answer' => 'Uma breve verificação de nível quando você faz login pela primeira vez analisa seu conhecimento atual. Depois disso, a IA recomenda automaticamente lições adequadas ao seu nível.',
			'profilePage.faqItems.realPeopleChat.question' => 'Posso conversar com pessoas reais?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Sim. Usuários Premium podem agendar sessões curtas de prática com tutores reais.',
			'profilePage.faqItems.dataSecurity.question' => 'Meus dados estão seguros?',
			'profilePage.faqItems.dataSecurity.answer' => 'Com certeza. Todas as conversas e dados dos usuários são armazenados de forma criptografada. Suas informações pessoais nunca são compartilhadas com terceiros.',
			'profilePage.faqItems.disableReminders.question' => 'Como desativo os lembretes diários?',
			'profilePage.faqItems.disableReminders.answer' => 'Vá para as configurações do perfil, abra Notificações e altere a frequência dos lembretes ou desative as notificações completamente.',
			'profilePage.support' => 'Suporte',
			'profilePage.feedback' => 'Feedback',
			'profilePage.progression' => 'Progressão',
			'profilePage.progressTitle' => 'Progresso',
			'profilePage.goodMorning' => 'Bom Dia,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'Inglês',
			'profilePage.past7Days' => 'Últimos 7 Dias',
			'profilePage.past7DaysBody' => 'Estude todos os dias para construir sua sequência e criar um hábito de aprendizado poderoso.',
			'profilePage.currentLevel' => 'Nível Atual',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Faltam apenas ${xp} XP para alcançar o nível ${level}!',
			'profilePage.toNextLevel' => 'PARA O PRÓXIMO NÍVEL',
			'profilePage.dayStreakLabel' => 'Sequência de Dias',
			'profilePage.totalPoints' => 'Total de Pontos',
			'profilePage.savedWords' => 'Palavras Salvas',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} itens para revisar',
			'profilePage.logout' => 'Sair',
			'profilePage.logoutTitle' => 'Tem certeza de que deseja sair?',
			'profilePage.logoutBody' => 'Até logo! Sentiremos falta dos seus exercícios de respiração.',
			'profilePage.logoutConfirm' => 'SAIR',
			'profilePage.logoutCancel' => 'CANCELAR',
			'profilePage.days.mon' => 'SEG',
			'profilePage.days.tue' => 'TER',
			'profilePage.days.wed' => 'QUA',
			'profilePage.days.thu' => 'QUI',
			'profilePage.days.fri' => 'SEX',
			'profilePage.days.sat' => 'SÁB',
			'profilePage.days.sun' => 'DOM',
			'profilePage.profileSaved' => 'Profile saved',
			'profilePage.profilePhotoUpdated' => 'Profile photo updated',
			'profilePage.nameCannotBeEmpty' => 'Name cannot be empty',
			'profilePage.profileSaveFailed' => 'Could not save profile',
			'profilePage.photoUploadFailed' => 'Photo upload failed',
			'profilePage.notificationsUpdateFailed' => 'Could not update notifications',
			'profilePage.notificationsPermissionDenied' => 'Permita notificações nas configurações do dispositivo para receber lembretes de estudo.',
			'profilePage.certificateTitle' => 'Seu certificado',
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
			'profilePage.certificateVerifyHint' => 'Qualquer pessoa pode escanear o código QR para verificar sua conquista.',
			'profilePage.certificateShare' => 'Compartilhar certificado',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => 'Certificado bloqueado',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'Você ainda não pode usar este certificado porque não concluiu suas lições de ${level}.',
			'profilePage.certificateNotAvailableOk' => 'Entendi',
			'profilePage.certificateShareQr' => 'Compartilhar código QR',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Quando você concluir um nível CEFR no Lingola, seu certificado aparecerá aqui — com seu nome, nível e um código QR para verificação.',
			'profilePage.certificatePreviewHint' => 'Conclua um caminho de nível para desbloquear seu certificado',
			'profilePage.certificateTapToView' => 'Toque para ver e compartilhar seu certificado',
			'profilePage.settings' => 'Configurações',
			'profilePage.dailyGoalValueLight' => '5-10 min/dia',
			'profilePage.dailyGoalValueRecommended' => '15-20 min/dia',
			'profilePage.dailyGoalValueFast' => '30+ min/dia',
			'profilePage.settingsShare' => 'Compartilhar',
			'profilePage.settingsSupport' => 'Suporte',
			'profilePage.settingsAbout' => 'Sobre',
			'profilePage.settingsAccount' => 'Conta',
			'profilePage.followInstagram' => 'Seguir no Instagram',
			'profilePage.followTikTok' => 'Seguir no TikTok',
			'profilePage.chineseShort' => 'Chinês',
			'profilePage.seeMore' => 'Ver mais...',
			'profilePage.searchLanguages' => 'Pesquisar',
			'profilePage.shareLingola' => 'Compartilhar Lingola',
			'profilePage.settingsCertificates' => 'Certificados',
			'profilePage.restorePurchases' => 'Restaurar compras',
			'profilePage.aboutFlywork' => 'Sobre a Flywork',
			'profilePage.faqHelp' => 'Perguntas frequentes e ajuda',
			'profilePage.deleteAccountAndData' => 'Excluir conta e dados',
			'profilePage.interestShopping' => 'Compras',
			'profilePage.interestFood' => 'Comida',
			'profilePage.interestPopCulture' => 'Cultura pop',
			'profilePage.interestFilm' => 'Filme',
			'profilePage.interestMusic' => 'Música',
			'profilePage.interestSport' => 'Esportes',
			'profilePage.interestTechnology' => 'Tecnologia',
			'profilePage.interestScience' => 'Ciência',
			'profilePage.interestHealth' => 'Saúde',
			'profilePage.interestFashion' => 'Moda',
			'profilePage.interestArt' => 'Arte',
			'profilePage.interestLiterature' => 'Literatura',
			'profilePage.interestHistory' => 'História',
			'profilePage.interestCulture' => 'Cultura',
			'profilePage.interestAstronomy' => 'Astronomia',
			'profilePage.interestPet' => 'Animais de estimação',
			'profilePage.interestSocialMedia' => 'Redes sociais',
			'profilePage.interestEntrepreneur' => 'Empreendedorismo',
			'profilePage.confirmDeleteWarning' => 'Sua conta e todo o seu progresso serão excluídos permanentemente. Esta ação não pode ser desfeita.',
			'profilePage.confirmKeepGoing' => 'Não desista do progresso',
			'profilePage.myCertificates' => 'Meus certificados',
			'profilePage.certificatesEmptyTitle' => 'Ainda não há certificados',
			'profilePage.certificatesEmptySubtitle' => 'Não se esqueça de verificar novamente quando concluir um nível.',
			'profilePage.restorePurchasesSuccess' => 'Suas compras foram restauradas.',
			'profilePage.restorePurchasesEmpty' => 'Nenhuma compra ativa encontrada para esta conta.',
			'profilePage.certificateListA1' => 'A1 - Certificado iniciante',
			'profilePage.certificateListA2' => 'A2 - Certificado básico',
			'profilePage.certificateListB1' => 'B1 - Certificado intermediário',
			'profilePage.certificateListB2' => 'B2 - Certificado intermediário superior',
			'profilePage.certificateListC1' => 'C1 - Certificado avançado',
			'profilePage.certificateListC2' => 'C2 - Certificado especialista',
			'profilePage.certificateListGeneric' => ({required Object level}) => 'Certificado ${level}',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Parece que você fez uma pausa rápida.',
			'pushNotifications.h2.1' => 'Tem um momento para uma palavra?',
			'pushNotifications.h2.2' => 'Estamos aqui — sem pressa.',
			'pushNotifications.h2.3' => 'Seu ritmo de aprendizado deu uma pausa.',
			'pushNotifications.h2.4' => 'Uma mini revisão pode ser agradável.',
			'pushNotifications.h4.0' => 'Uma nova palavra pode estar te esperando hoje 👀',
			'pushNotifications.h4.1' => 'Uma prática rápida pode ser útil.',
			'pushNotifications.h4.2' => 'Você pode ter perdido uma frase interessante.',
			'pushNotifications.h4.3' => 'O progresso de hoje ainda está aberto.',
			'pushNotifications.h4.4' => 'Uma palavra, uma frase… talvez as duas.',
			'pushNotifications.h8.0' => 'Você não precisa progredir todos os dias.',
			'pushNotifications.h8.1' => 'Até uma pequena revisão conta.',
			'pushNotifications.h8.2' => 'Você não perdeu nada por não estudar hoje.',
			'pushNotifications.h8.3' => 'Estamos prontos quando você estiver.',
			'pushNotifications.h8.4' => 'Aprender um idioma é uma maratona, não uma corrida.',
			'pushNotifications.h24.0' => 'Um dia se passou. Suas palavras ainda estão aqui.',
			'pushNotifications.h24.1' => 'Fazer uma pausa é normal.',
			'pushNotifications.h24.2' => 'Seu lugar está bem onde você deixou.',
			'pushNotifications.h24.3' => 'Continue quando quiser.',
			'pushNotifications.h24.4' => 'O idioma não vai embora — e nós também não.',
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
