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
	@override String get goalTitle => 'Qual é o seu objetivo?';
	@override String get goalCareer => 'Desenvolvimento de Carreira';
	@override String get goalTravel => 'Viajar';
	@override String get goalLiving => 'Viver no Exterior';
	@override String get goalStudying => 'Estudar no Exterior';
	@override String get goalOther => 'Outro';
	@override String get levelTitle => 'Qual é o seu nível atual de idioma?';
	@override String get levelBeginner => 'Iniciante — Eu conheço algumas palavras';
	@override String get levelIntermediate => 'Intermediário — Eu consigo ter conversas simples';
	@override String get levelAdvanced => 'Avançado — Eu falo, mas quero melhorar';
	@override String get paceTitle => 'Quão rápido você quer melhorar?';
	@override String get paceLight => '5-10 min/dia (leve)';
	@override String get paceRecommended => '15-20 min/dia (recomendado)';
	@override String get paceFast => '30+ min/dia (resultados rápidos)';
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
	@override String get incoming1 => 'Oi! Bem-vindo ao Lingola — Sou seu tutor de IA. Pronto para tentar um rápido olá em inglês?';
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
	@override late final _Translations$rolePlayPage$directions$pt directions = _Translations$rolePlayPage$directions$pt._(_root);
	@override late final _Translations$rolePlayPage$interview$pt interview = _Translations$rolePlayPage$interview$pt._(_root);
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
	@override String get email => 'E-mail';
	@override String get deleteAccount => 'Excluir Conta';
	@override String get save => 'SALVAR';
	@override String get deleteTitle => 'Não queremos que você vá, mas entendemos.';
	@override String get deleteBody => 'Você pode nos dizer por que deseja sair para melhorarmos a experiência do Lingola?';
	@override late final _Translations$profilePage$deleteReasons$pt deleteReasons = _Translations$profilePage$deleteReasons$pt._(_root);
	@override String get messageOptional => 'Mensagem (opcional)';
	@override String get messageHint => 'Se você tiver uma mensagem, por favor escreva.';
	@override String get next => 'PRÓXIMO';
	@override String get specialOfferTitle => 'Oferta Especial';
	@override String get specialOfferBody => 'Antes de sair, confira a oferta que preparamos para você.';
	@override String get monthlyPlanTitle => 'Mude para o Plano de 1 Mês';
	@override String get monthlyPlanPrice => '\$79/mês, cancele a qualquer momento';
	@override String get monthlyPlanDesc => 'Sem compromisso a longo prazo. Fique conectado com nossa comunidade mês a mês.';
	@override String get whatYoullKeep => 'O que você vai manter:';
	@override String get keepCharacters => 'Acesso a todos os personagens';
	@override String get keepVideo => 'Chamadas de vídeo ilimitadas';
	@override String get keepCourses => 'Acesso a todos os cursos';
	@override String get switchMonthlyCta => 'Mudar para o Plano Mensal';
	@override String get confirmTitle => 'Você tem certeza?';
	@override String get confirmBody => 'Nós realmente não queremos que você vá. Aqui está o que você vai perder:';
	@override String get loseCharacters => 'Acesso ilimitado a personagens';
	@override String get loseVideo => 'Acesso ilimitado a chamadas de vídeo';
	@override String get loseCourses => 'Acesso a todos os cursos';
	@override String get discountTitle => 'Fique e ganhe 60% de desconto por 1 mês';
	@override String get discountSubtitle => 'Nossa melhor oferta de todas. Apenas \$27.60/mês';
	@override String get acceptDiscountCta => 'Aceitar 60% de Desconto e Ficar';
	@override String get farewellTitle => 'Estamos tristes em ver você partir';
	@override String farewellBody({required Object date}) => 'Sua assinatura foi cancelada. Você terá acesso até o final do seu período de cobrança atual em ${date}.';
	@override String get changeMindTitle => '✨ Mudou de ideia?';
	@override String changeMindBody({required Object date}) => 'Você pode reativar sua assinatura a qualquer momento antes de ${date} para manter seus benefícios.';
	@override String get reactivateCta => 'Espera, quero reativar';
	@override String get done => 'FEITO';
	@override String get notifications => 'Notificações';
	@override String get appLanguage => 'Idioma do App';
	@override String get selectLanguageTitle => 'Selecionar Idioma';
	@override String get premium => 'Premium';
	@override String get passive => 'Passivo';
	@override String get active => 'Ativo';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Compartilhar com Amigo';
	@override String get shareWithFriendTitle => 'Compartilhar com Amigo';
	@override String get shareInviteBody => 'Convide seus amigos e aproveitem a tradução juntos';
	@override String get rateUs => 'Avalie-nos';
	@override String get faq => 'FAQ do Lingola';
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
	@override String get logoutTitle => 'Você está prestes a sair';
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
	@override String get notificationsPermissionDenied => 'Allow notifications in your device settings to get study reminders.';
	@override String get certificateTitle => 'Seu certificado';
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
	@override String get certificateVerifyHint => 'Qualquer pessoa pode escanear o código QR para verificar sua conquista.';
	@override String get certificateShare => 'Compartilhar certificado';
	@override String get certificateShareQr => 'Compartilhar código QR';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'Quando você concluir um nível CEFR no Lingola, seu certificado aparecerá aqui — com seu nome, nível e um código QR para verificação.';
	@override String get certificatePreviewHint => 'Conclua um caminho de nível para desbloquear seu certificado';
	@override String get certificateTapToView => 'Toque para ver e compartilhar seu certificado';
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

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$pt implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pedindo Direções na Rua';
	@override String get screenplay => 'Peça direções para um lugar, descubra como chegar ao metrô ou ônibus, obtenha informações sobre bilhetes e ouça recomendações de restaurantes.';
	@override late final _Translations$rolePlayPage$directions$chat$pt chat = _Translations$rolePlayPage$directions$chat$pt._(_root);
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

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$pt implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Quais idiomas o app suporta?';
	@override String get answer => 'O app atualmente suporta inglês, turco e alemão. Novos idiomas são adicionados regularmente.';
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
			'setup.goalTitle' => 'Qual é o seu objetivo?',
			'setup.goalCareer' => 'Desenvolvimento de Carreira',
			'setup.goalTravel' => 'Viajar',
			'setup.goalLiving' => 'Viver no Exterior',
			'setup.goalStudying' => 'Estudar no Exterior',
			'setup.goalOther' => 'Outro',
			'setup.levelTitle' => 'Qual é o seu nível atual de idioma?',
			'setup.levelBeginner' => 'Iniciante — Eu conheço algumas palavras',
			'setup.levelIntermediate' => 'Intermediário — Eu consigo ter conversas simples',
			'setup.levelAdvanced' => 'Avançado — Eu falo, mas quero melhorar',
			'setup.paceTitle' => 'Quão rápido você quer melhorar?',
			'setup.paceLight' => '5-10 min/dia (leve)',
			'setup.paceRecommended' => '15-20 min/dia (recomendado)',
			'setup.paceFast' => '30+ min/dia (resultados rápidos)',
			'accountCreating.title' => 'Sua Conta Pessoal Está Sendo Criada',
			'accountCreating.stepContent' => 'Conteúdo está sendo criado',
			'accountCreating.stepDialogues' => 'Diálogos estão sendo preparados',
			'accountCreating.stepLessons' => 'Aulas estão sendo otimizadas',
			'accountCreating.stepPlan' => 'Seu plano está sendo finalizado',
			'accountCreating.optimization' => 'Otimização',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Lição 1: Saudações',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Digite uma mensagem...',
			'previewChat.incoming1' => 'Oi! Bem-vindo ao Lingola — Sou seu tutor de IA. Pronto para tentar um rápido olá em inglês?',
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
			_ => null,
		} ?? switch (path) {
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
			'rolePlayPage.directions.title' => 'Pedindo Direções na Rua',
			'rolePlayPage.directions.screenplay' => 'Peça direções para um lugar, descubra como chegar ao metrô ou ônibus, obtenha informações sobre bilhetes e ouça recomendações de restaurantes.',
			'rolePlayPage.directions.chat.briefing' => 'Oi! Hoje vamos praticar pedir direções na rua. Vou explicar um pouco primeiro, depois vamos encenar. Tudo bem?',
			'rolePlayPage.directions.chat.incoming1' => 'Oi! Você parece um pouco perdido — precisa de ajuda para encontrar algo?',
			'rolePlayPage.directions.chat.outgoing1' => 'Sim, estou procurando a estação de metrô mais próxima.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Claro',
			'rolePlayPage.directions.chat.incoming2Rest' => '! Ande duas quadras naquela direção, depois vire à esquerda. Você verá a entrada.',
			'rolePlayPage.directions.chat.botReply' => 'De nada! Quer uma dica de restaurante perto da estação também?',
			'rolePlayPage.interview.title' => 'Entrevista de Emprego',
			'rolePlayPage.interview.screenplay' => 'Apresente-se, responda perguntas comuns de entrevista, fale sobre sua experiência e pergunte sobre o papel e os próximos passos.',
			'rolePlayPage.interview.chat.briefing' => 'Oi! Hoje vamos praticar uma entrevista de emprego. Vou explicar um pouco primeiro, depois vamos encenar — eu vou te entrevistar, depois trocamos. Tudo bem?',
			'rolePlayPage.interview.chat.incoming1' => 'Obrigado por vir hoje. Você poderia se apresentar brevemente?',
			'rolePlayPage.interview.chat.outgoing1' => 'Claro. Estou animado por estar aqui e compartilhar minha experiência.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Maravilhoso',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Fale-me sobre um projeto recente do qual você se orgulha.',
			'rolePlayPage.interview.chat.botReply' => 'Isso é impressionante. Que perguntas você tem sobre o papel?',
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
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Excluir Conta',
			'profilePage.save' => 'SALVAR',
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
			'profilePage.monthlyPlanTitle' => 'Mude para o Plano de 1 Mês',
			'profilePage.monthlyPlanPrice' => '\$79/mês, cancele a qualquer momento',
			'profilePage.monthlyPlanDesc' => 'Sem compromisso a longo prazo. Fique conectado com nossa comunidade mês a mês.',
			'profilePage.whatYoullKeep' => 'O que você vai manter:',
			'profilePage.keepCharacters' => 'Acesso a todos os personagens',
			'profilePage.keepVideo' => 'Chamadas de vídeo ilimitadas',
			'profilePage.keepCourses' => 'Acesso a todos os cursos',
			'profilePage.switchMonthlyCta' => 'Mudar para o Plano Mensal',
			'profilePage.confirmTitle' => 'Você tem certeza?',
			'profilePage.confirmBody' => 'Nós realmente não queremos que você vá. Aqui está o que você vai perder:',
			'profilePage.loseCharacters' => 'Acesso ilimitado a personagens',
			'profilePage.loseVideo' => 'Acesso ilimitado a chamadas de vídeo',
			'profilePage.loseCourses' => 'Acesso a todos os cursos',
			'profilePage.discountTitle' => 'Fique e ganhe 60% de desconto por 1 mês',
			'profilePage.discountSubtitle' => 'Nossa melhor oferta de todas. Apenas \$27.60/mês',
			'profilePage.acceptDiscountCta' => 'Aceitar 60% de Desconto e Ficar',
			'profilePage.farewellTitle' => 'Estamos tristes em ver você partir',
			'profilePage.farewellBody' => ({required Object date}) => 'Sua assinatura foi cancelada. Você terá acesso até o final do seu período de cobrança atual em ${date}.',
			'profilePage.changeMindTitle' => '✨ Mudou de ideia?',
			'profilePage.changeMindBody' => ({required Object date}) => 'Você pode reativar sua assinatura a qualquer momento antes de ${date} para manter seus benefícios.',
			'profilePage.reactivateCta' => 'Espera, quero reativar',
			'profilePage.done' => 'FEITO',
			'profilePage.notifications' => 'Notificações',
			'profilePage.appLanguage' => 'Idioma do App',
			'profilePage.selectLanguageTitle' => 'Selecionar Idioma',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passivo',
			'profilePage.active' => 'Ativo',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Compartilhar com Amigo',
			'profilePage.shareWithFriendTitle' => 'Compartilhar com Amigo',
			'profilePage.shareInviteBody' => 'Convide seus amigos e aproveitem a tradução juntos',
			'profilePage.rateUs' => 'Avalie-nos',
			'profilePage.faq' => 'FAQ do Lingola',
			'profilePage.faqItems.supportedLanguages.question' => 'Quais idiomas o app suporta?',
			'profilePage.faqItems.supportedLanguages.answer' => 'O app atualmente suporta inglês, turco e alemão. Novos idiomas são adicionados regularmente.',
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
			'profilePage.logoutTitle' => 'Você está prestes a sair',
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
			'profilePage.notificationsPermissionDenied' => 'Allow notifications in your device settings to get study reminders.',
			'profilePage.certificateTitle' => 'Seu certificado',
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
			'profilePage.certificateVerifyHint' => 'Qualquer pessoa pode escanear o código QR para verificar sua conquista.',
			'profilePage.certificateShare' => 'Compartilhar certificado',
			'profilePage.certificateShareQr' => 'Compartilhar código QR',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'Quando você concluir um nível CEFR no Lingola, seu certificado aparecerá aqui — com seu nome, nível e um código QR para verificação.',
			'profilePage.certificatePreviewHint' => 'Conclua um caminho de nível para desbloquear seu certificado',
			'profilePage.certificateTapToView' => 'Toque para ver e compartilhar seu certificado',
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
