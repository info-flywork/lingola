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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$ja app = _Translations$app$ja._(_root);
	@override late final _Translations$common$ja common = _Translations$common$ja._(_root);
	@override late final _Translations$onboarding$ja onboarding = _Translations$onboarding$ja._(_root);
	@override late final _Translations$targetLanguage$ja targetLanguage = _Translations$targetLanguage$ja._(_root);
	@override late final _Translations$language$ja language = _Translations$language$ja._(_root);
	@override late final _Translations$setup$ja setup = _Translations$setup$ja._(_root);
	@override late final _Translations$accountCreating$ja accountCreating = _Translations$accountCreating$ja._(_root);
	@override late final _Translations$planReady$ja planReady = _Translations$planReady$ja._(_root);
	@override late final _Translations$demoChat$ja demoChat = _Translations$demoChat$ja._(_root);
	@override late final _Translations$previewChat$ja previewChat = _Translations$previewChat$ja._(_root);
	@override late final _Translations$paywall$ja paywall = _Translations$paywall$ja._(_root);
	@override late final _Translations$auth$ja auth = _Translations$auth$ja._(_root);
	@override late final _Translations$nav$ja nav = _Translations$nav$ja._(_root);
	@override late final _Translations$home$ja home = _Translations$home$ja._(_root);
	@override late final _Translations$libraryPage$ja libraryPage = _Translations$libraryPage$ja._(_root);
	@override late final _Translations$wordPracticePage$ja wordPracticePage = _Translations$wordPracticePage$ja._(_root);
	@override late final _Translations$quizPage$ja quizPage = _Translations$quizPage$ja._(_root);
	@override late final _Translations$placeholder$ja placeholder = _Translations$placeholder$ja._(_root);
	@override late final _Translations$tutorPage$ja tutorPage = _Translations$tutorPage$ja._(_root);
	@override late final _Translations$lessonPage$ja lessonPage = _Translations$lessonPage$ja._(_root);
	@override late final _Translations$rolePlayPage$ja rolePlayPage = _Translations$rolePlayPage$ja._(_root);
	@override late final _Translations$notificationsPage$ja notificationsPage = _Translations$notificationsPage$ja._(_root);
	@override late final _Translations$profilePage$ja profilePage = _Translations$profilePage$ja._(_root);
	@override late final _Translations$pushNotifications$ja pushNotifications = _Translations$pushNotifications$ja._(_root);
	@override late final _Translations$apiErrors$ja apiErrors = _Translations$apiErrors$ja._(_root);
}

// Path: app
class _Translations$app$ja implements Translations$app$en {
	_Translations$app$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'プレミアム';
	@override String get notifications => '通知';
	@override String get streak => '学習の連続日数';
	@override String get profile => 'プロフィール';
}

// Path: common
class _Translations$common$ja implements Translations$common$en {
	_Translations$common$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => '続ける';
	@override String get back => '戻る';
	@override String get locked => 'ロックされています';
	@override String minutes({required Object value}) => '${value} 分';
	@override String get close => '閉じる';
	@override String get getStarted => '始める';
	@override String get connectionError => '接続できません。インターネットを確認して再試行してください。';
	@override String get genericError => '何かがうまくいきませんでした。もう一度お試しください。';
	@override String get tryAgain => '再試行';
}

// Path: onboarding
class _Translations$onboarding$ja implements Translations$onboarding$en {
	_Translations$onboarding$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'オンボーディングページ ${current} / ${total}';
	@override String get letsStart => 'はじめましょう';
	@override late final _Translations$onboarding$slide1$ja slide1 = _Translations$onboarding$slide1$ja._(_root);
	@override late final _Translations$onboarding$slide2$ja slide2 = _Translations$onboarding$slide2$ja._(_root);
	@override late final _Translations$onboarding$slide3$ja slide3 = _Translations$onboarding$slide3$ja._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$ja implements Translations$targetLanguage$en {
	_Translations$targetLanguage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '学びたい言語を選んでください';
	@override String get comingSoon => 'さらに多くの言語がもうすぐ登場します';
	@override String get korean => '韓国語';
	@override String get portuguese => 'ポルトガル語';
	@override String get portugueseBrazil => 'ポルトガル語（ブラジル）';
	@override String get german => 'ドイツ語';
	@override String get italian => 'イタリア語';
	@override String get simplifiedChinese => '簡体字中国語';
	@override String get arabic => 'アラビア語';
	@override String get turkish => 'トルコ語';
	@override String get hindi => 'ヒンディー語';
}

// Path: language
class _Translations$language$ja implements Translations$language$en {
	_Translations$language$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String step({required Object total, required Object current}) => '${total}のうち${current}ステップ';
	@override String get title => '何を話したいですか？';
	@override String get nativeSection => '私は話します';
	@override String get nativeField => '母国語';
	@override String get nativeName => 'トルコ語';
	@override String get targetSection => '学びたい言語';
	@override String get targetField => '目標言語';
	@override String get targetName => '英語';
	@override String get direction => '言語の方向';
	@override String get selectLanguage => '言語を選択';
	@override String get comingSoonBadge => '近日公開...';
	@override String get english => '英語';
	@override String get french => 'フランス語';
	@override String get japanese => '日本語';
	@override String get spanish => 'スペイン語';
	@override String get russian => 'ロシア語';
}

// Path: setup
class _Translations$setup$ja implements Translations$setup$en {
	_Translations$setup$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'なぜ新しい言語を学びたいですか？';
	@override String get goalHint => 'あなたの目標にぴったりの学習プランを作成します';
	@override String get goalCareer => 'キャリア開発';
	@override String get goalTravel => '旅行';
	@override String get goalLiving => '海外生活';
	@override String get goalStudying => '教育';
	@override String get goalOther => '自己成長';
	@override String get interestsTitle => '興味のある分野を選んでください';
	@override String get interestsHint => '興味のあるトピックで、あなた専用の学習体験をつくります。';
	@override String get seeMoreEllipsis => 'もっと見る...';
	@override String get levelTitle => '今のレベルをどう表現しますか？';
	@override String get paceTitle => 'どれくらい早く大きな進歩を見たいですか？';
	@override String get explanationTitle => '自分の言語で質問するとき、どう説明しますか？';
	@override String get explanationHint => 'プロフィール設定からいつでも変更できます。';
	@override String get explanationNative => '母国語で説明する';
	@override String get explanationEnglish => '英語で説明する';
	@override String get levelA1 => 'この言語をゼロから学んでいます';
	@override String get levelA2 => '基本的な会話に参加できます';
	@override String get levelB1 => 'なじみのある話題で短い会話ができます';
	@override String get levelB2 => '日常の話題について詳しく話せます';
	@override String get levelC1 => 'ネイティブと流暢に話せます';
	@override String get levelC2 => 'どんな話題でも明確に伝えられます';
	@override String get paceHint => 'プランのペース調整に役立ちます';
	@override String get paceMonth1 => '1か月';
	@override String get paceMonth2_3 => '2～3か月';
	@override String get paceMonth6 => '6か月';
	@override String get paceYear1 => '1年';
	@override String get paceRelaxed => '急いでいません';
	@override String get progressInsightTitle => 'わずか2週間で本当の上達を実感！';
	@override String get progressInsightBody => 'Lingolaのユーザーは、最初からスピーキングの自信が大きく上がることに気づくことが多いです。';
	@override String get progressInsightConfidence => 'スピーキングの自信';
	@override String get progressInsightToday => 'Today';
	@override String get progressInsightWeek2 => '2週目';
	@override String get progressInsightWithLingola => 'Lingolaあり';
	@override String get progressInsightWithoutApp => 'アプリなし';
	@override String get levelHint => 'Lingolaはあらゆるレベルの学習者をサポートするために作られました';
	@override String get dailyPracticeTitle => '1日どのくらい練習したいですか？';
	@override String get dailyPracticeHint => '自分のペースで、毎日一歩ずつ近づこう。';
	@override String dailyPracticeMonthlyHours({required Object hours}) => '${hours} / month';
	@override String dailyPracticeOnlyMinutes({required Object minutes}) => '1日たった${minutes}分';
	@override String dailyPracticeMinutesOption({required Object minutes}) => '${minutes}分';
	@override String get dailyPracticeToday => '今日';
	@override String get practiceTimeTitle => '1日のどの時間帯に練習したいですか？';
	@override String get practiceTimeHint => 'リマインダーは連続記録を保ち、毎日目標に一歩近づくのに役立ちます。';
	@override String get practiceTimeMorning => '朝';
	@override String get practiceTimeAfternoon => '午後';
	@override String get practiceTimeEvening => '夜';
	@override String get practiceTimeFlexible => '柔軟でOK';
	@override String get practiceTimeSave => '保存';
	@override String get setPracticeTimeTitle => '時間を設定';
	@override String get setPracticeTimeHint => 'どの時間帯で練習したいですか？';
	@override String get promiseTitle => '毎日スピーキング練習をすると約束します';
	@override String get promiseBody => 'そしてAI講師と一緒に、できるだけ早く語学目標に到達します';
	@override String get promiseHoldHint => '確認するにはLingolaロゴを長押ししてください';
	@override String get aiTutorsIntroTitle => 'Lingolaの20人以上のAI講師から好きな人を選べます';
	@override String get aiTutorsIntroBody => 'みんな深い個性と異なるアクセントを持っています';
	@override String get aiTutorsIntroCta => '少しあなたのことを教えて';
}

// Path: accountCreating
class _Translations$accountCreating$ja implements Translations$accountCreating$en {
	_Translations$accountCreating$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'あなたの個人アカウントが作成中です';
	@override String get stepContent => 'コンテンツが作成中です';
	@override String get stepDialogues => 'ダイアログが準備中です';
	@override String get stepLessons => 'レッスンが最適化中です';
	@override String get stepPlan => 'あなたのプランが最終調整中です';
	@override String get optimization => '最適化';
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
class _Translations$planReady$ja implements Translations$planReady$en {
	_Translations$planReady$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
	@override String get fieldInterests => '興味・関心';
	@override String get startPlan => 'Start my plan →';
	@override String get courseEnglish => 'English';
	@override String get courseGerman => 'German';
	@override String get courseFrench => 'French';
	@override String get courseItalian => 'Italian';
	@override String get courseSpanish => 'Spanish';
	@override String get courseJapanese => 'Japanese';
	@override String get courseRussian => 'Russian';
	@override String get courseTurkish => 'Turkish';
	@override String get goalCareer => 'キャリア開発';
	@override String get goalTravel => '旅行';
	@override String get goalLiving => '海外生活';
	@override String get goalStudying => '教育';
	@override String get goalOther => '自己成長';
	@override String get levelA1 => 'A1';
	@override String get levelA2 => 'A2';
	@override String get levelB1 => 'B1';
	@override String get levelB2 => 'B2';
	@override String get levelC1 => 'C1';
	@override String get levelC2 => 'C2';
	@override String get paceMonth1 => '1か月';
	@override String get paceMonth2_3 => '2～3か月';
	@override String get paceMonth6 => '6か月';
	@override String get paceYear1 => '1年';
	@override String get paceRelaxed => '急いでいません';
}

// Path: demoChat
class _Translations$demoChat$ja implements Translations$demoChat$en {
	_Translations$demoChat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Getting to know you';
	@override String get speed => '1x';
	@override String get typeMessage => 'Type a message...';
	@override String get incoming1 => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?';
}

// Path: previewChat
class _Translations$previewChat$ja implements Translations$previewChat$en {
	_Translations$previewChat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'レッスン 1: 挨拶';
	@override String get speed => '1x';
	@override String get typeMessage => 'メッセージを入力...';
	@override String get incoming1 => 'こんにちは！Lingolaへようこそ — 私があなたのAIチューターです。レベルは関係ありません。ここでは安心して英語を学べます。英語で「こんにちは」は \'Hi\' や \'Hello\' と言います — 試してみて、英語で \'Hi!\' と送ってください！';
	@override String get outgoing1 => 'こんにちは！練習する準備ができています。';
	@override String get incoming2Highlight => 'おはよう';
	@override String get incoming2Rest => '、エムラ！あなたが準備ができていると聞いて嬉しいです。朝のコーヒーは、つながりを築く素晴らしいスタートです。何について話したいですか？';
	@override String get holdToSpeak => '話すには長押し';
	@override String get recording => '録音中…送信するには離してください';
	@override String get slideUpToLock => '上にスワイプしてロック';
	@override String get slideLeftToCancel => '左にスワイプしてキャンセル';
	@override String get recordingLockedHint => '終わったら送信をタップ';
}

// Path: paywall
class _Translations$paywall$ja implements Translations$paywall$en {
	_Translations$paywall$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '今日から話し始めよう — 無料';
	@override String get subtitle => '無限の学習機会';
	@override String get noCommitment => '契約不要';
	@override String get cancelAnytime => 'いつでもキャンセル可能';
	@override String get noPaymentToday => '今日は支払いなし';
	@override String get daysFree => '3日間無料';
	@override String get thenPrice => 'その後は\$1.99/月';
	@override String get trialActive => '無料トライアル中';
	@override String get payableToday => '今日の支払い';
	@override String get payableValue => '3日間無料 0.00\$';
	@override String get paymentDate => '支払い日: 2026年3月13日';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$ja implements Translations$auth$en {
	_Translations$auth$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => '多様なAIトレーナーたち';
	@override String get title => '今日から新しい言語を話し始めよう';
	@override String get body => 'AIとのリアルな会話を練習しよう。\nプレッシャーなし、ジャッジなし。';
	@override String get continueGoogle => 'Googleで続ける';
	@override String get continueApple => 'Appleで続ける';
	@override String get continueGuest => 'ゲストとして続ける';
	@override String get or => 'または';
	@override String get alreadyHaveAccount => 'すでにアカウントをお持ちですか？';
	@override String get signIn => 'ログイン';
	@override String get legal => 'Lingolaにサインアップすることで、利用規約に同意したことになります。プライバシーポリシーとクッキーポリシーでデータの処理方法を学んでください。';
	@override String get terms => '利用規約';
	@override String get privacy => 'プライバシーポリシー';
	@override String get cookies => 'クッキーポリシー';
}

// Path: nav
class _Translations$nav$ja implements Translations$nav$en {
	_Translations$nav$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get tutor => 'チューター';
	@override String get lesson => 'レッスン';
	@override String get rolePlay => 'ロールプレイ';
	@override String get profile => 'プロフィール';
}

// Path: home
class _Translations$home$ja implements Translations$home$en {
	_Translations$home$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'おはよう、Jhon';
	@override String get todayPractice => '今日の練習';
	@override String get continueConversation => '会話を続ける';
	@override String continueWithTutor({required Object name}) => '${name} と続けますか？それとも別のチューターを選びますか？';
	@override String continueSameTutor({required Object name}) => '${name} と続ける';
	@override String get chooseOtherTutor => '別のチューターを選ぶ';
	@override String minutesLeft({required Object value}) => '残り ${value} 分';
	@override String get lessonProgress => 'レッスン2 — 挨拶';
	@override String get timeCurrent => '0分';
	@override String get timeTotal => '/ 15分';
	@override String get kContinue => '続ける';
	@override String get learningPath => 'A1 - スターター';
	@override String get allLessons => 'すべてのレッスン';
	@override String get introductions => '自己紹介 I';
	@override String get greetings => '挨拶';
	@override String get jobs => '仕事';
	@override String get favoriteRoom => 'お気に入りの部屋';
	@override String get dailyRoutine => '日常生活';
	@override String get scroll => 'スクロール';
	@override String get liveLesson => 'ライブレッスン';
	@override String get liveLessonSubtitle => '私たちのチューターとビデオ通話をしましょう';
	@override String get moreTutor => 'もっとチューター';
	@override String get startTalkNow => '今すぐ話し始める';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => '適応型';
	@override String get tagCalm => '落ち着いた';
	@override String get tagPatient => '忍耐強い';
	@override String get tagMethodical => '計画的';
	@override String get tagEncouraging => '励まし';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'もっと機能';
	@override String get practiceLabel => '練習';
	@override String get wordPractice => '単語練習';
	@override String get wordPracticeBody => '選んだ言語の語彙を毎日増やそう';
	@override String get immersiveLabel => '没入型';
	@override String get quiz => 'クイズ';
	@override String get quizBodyLine1 => '実際の';
	@override String get quizBodyLine2 => '文脈の例を通じて学ぶ';
	@override String get getStarted => '始める';
	@override String get library => 'ライブラリ';
	@override String get libraryTitle => '学び、保存する';
	@override String get learnMore => 'もっと学ぶ';
	@override late final _Translations$home$premium$ja premium = _Translations$home$premium$ja._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$ja implements Translations$libraryPage$en {
	_Translations$libraryPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ライブラリ';
	@override String get searchWord => '検索ワード';
	@override String savedWordCount({required Object count}) => '${count} 保存した単語';
	@override String get savedWordTab => '保存した単語';
	@override String get dictionaryTab => '辞書';
	@override String get dictionaryLabel => '辞書';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$ja implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '単語練習';
	@override String get turkish => 'トルコ語';
	@override String get save => '保存する';
	@override String get saved => '保存済み';
	@override String get listen => '聞く';
	@override String get hint => 'ヒント';
	@override String get previous => '前へ';
	@override String get next => '次へ';
}

// Path: quizPage
class _Translations$quizPage$ja implements Translations$quizPage$en {
	_Translations$quizPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'クイズ';
	@override String get headline => '今日は何を改善したいですか？';
	@override String get subtitle => 'トレーニングを選んで — 3分以内で終わります 🚀';
	@override String get readingTitle => 'リーディング';
	@override String get readingBody => '記事やストーリーを通じた理解';
	@override String get writingTitle => 'ライティング';
	@override String get writingBody => '文法と語彙の練習';
	@override String get speakingTitle => 'スピーキング';
	@override String get speakingBody => 'AI音声エンジンによる発音';
	@override String get readingTestTitle => 'リーディングテスト';
	@override String get read => '読む';
	@override String get listeningHint => '英単語をはっきりと話してください…';
	@override String get micPermissionDenied => 'マイクまたは音声認識が利用できません。';
	@override String get matchSuccess => '素晴らしい！その単語と一致しました。';
	@override String matchFail({required Object heard}) => '"${heard}"が聞こえました。もう一度試してください。';
	@override String get successfulTitle => '成功！';
	@override String get successfulBody => 'ネイティブスピーカーのような発音！';
	@override String get failedTitle => '失敗';
	@override String get failedBody => 'ほぼできていました、もう一度チャンスを与えてください';
	@override String get tryAgain => 'もう一度試す';
	@override String get writingTestTitle => 'ライティングテスト';
	@override String get sourceLanguage => 'ソース言語';
	@override String get answer => '回答';
	@override String get writeAnswerHint => 'ここにあなたの答えを書いてください...';
	@override String get submit => '送信';
	@override String get speakingTestTitle => 'スピーキングテスト';
	@override String get speakingProficiency => 'スピーキング能力';
	@override String get speakClearlyHint => 'マイクに向かってはっきり話してください：';
	@override String get speakUp => '大きな声で話す';
	@override String get recording => '録音中...';
	@override String questionOf({required Object current, required Object total}) => '質問 ${current} / ${total}';
}

// Path: placeholder
class _Translations$placeholder$ja implements Translations$placeholder$en {
	_Translations$placeholder$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} が準備中です';
	@override String body({required Object tab}) => '${tab} のための集中した体験を準備しています。';
}

// Path: tutorPage
class _Translations$tutorPage$ja implements Translations$tutorPage$en {
	_Translations$tutorPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'チューター';
	@override String get chatWithLingola => 'Lingolaとチャット';
	@override String get startChat => 'Chat';
	@override String chatWithTutor({required Object name}) => '${name}とチャット';
	@override String get chatHistory => 'チャット履歴';
	@override String get history => '履歴';
	@override String get filter => 'フィルター';
	@override String get country => '国';
	@override String get focus => 'フォーカス';
	@override String get moreCountries => '8カ国以上';
	@override String get moreFocus => '+8';
	@override String get save => '保存';
	@override String get clearFilter => 'フィルターを解除';
	@override String get startTalkNow => '今すぐ話し始める';
	@override String get typeMessage => 'メッセージを入力...';
	@override String get speaker => 'スピーカー';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$ja tutors = _Translations$tutorPage$tutors$ja._(_root);
	@override late final _Translations$tutorPage$tags$ja tags = _Translations$tutorPage$tags$ja._(_root);
	@override String get historyPreview1 => 'やあ！退屈で爆発しそうだった...';
	@override String get historyPreview2 => '今日は食べ物の注文を練習しようか？';
	@override String get time1 => '午前11:00';
	@override String get time2 => '昨日';
	@override late final _Translations$tutorPage$chat$ja chat = _Translations$tutorPage$chat$ja._(_root);
	@override late final _Translations$tutorPage$calling$ja calling = _Translations$tutorPage$calling$ja._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$ja implements Translations$lessonPage$en {
	_Translations$lessonPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '学びを続ける';
	@override String get profile => 'プロフィール';
	@override String get language => '目標言語';
	@override String get completed => '完了';
	@override String get locked => 'ロック中';
	@override String get pickTutorTitle => 'チューターを選ぶ';
	@override String get startTalk => 'レッスンを始める';
	@override String get chatInstead => '代わりにチャットする';
	@override String get lockedHint => 'このレッスンを解除するには、前のレッスンを終わらせてください。';
	@override String get levelLockedTitle => 'レベル制限';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'あなたの英語レベルは${userLevel}のため、前のパスを完了せずに${lessonLevel}のレッスンは開けません。';
	@override String get levelLockedOk => 'わかりました';
	@override String get notesTitle => 'レッスンノート';
	@override String get whatWeLearned => '今日学んだこと';
	@override String get deleteNotes => 'レッスンノートを削除する';
	@override String get deleteNotesConfirm => 'これらのノートを削除しますか？これは元に戻せません。';
	@override String get delete => '削除';
	@override String get cancel => 'キャンセル';
	@override String get practiceCta => 'これが難しすぎた場合は、同じトピックを再度練習できます。';
	@override String get practiceNow => 'このトピックを練習する';
	@override String get openChat => 'チューターとのチャットを開く';
	@override String get yourScore => 'あなたのスコア';
	@override String bestScore({required Object score}) => '最高 ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => '受動的参加者';
	@override String get participationSilentBody => '今回は静かでしたね。このレッスンを再受講した方がいいと思います。';
	@override String get participationPassive => '低い参加';
	@override String get participationPassiveBody => 'ほとんど話しませんでした。レッスンを再度試して、もっと話してみてください。';
	@override String get participationActive => '良い参加';
	@override String get participationActiveBody => '会話に参加しました。これを続けてください！';
	@override String get participationStrong => '強い参加';
	@override String get participationStrongBody => 'たくさん話しました。素晴らしい仕事です！';
	@override String get retakeLesson => 'このレッスンを再受講する';
	@override String get finishLesson => 'レッスンを終わらせる';
	@override String get savingNotes => 'あなたのチューターが今日のノートを書いています…';
	@override String get noNotes => 'このレッスンを終わらせて、チューターからのノートを受け取りましょう。';
	@override String get notesDeleted => 'レッスンノートが削除されました';
	@override late final _Translations$lessonPage$levels$ja levels = _Translations$lessonPage$levels$ja._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$ja implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ロールプレイ';
	@override String get subtitle => '役割を選んで — 実際のシナリオを体験しよう 🎭';
	@override String progressCompleted({required Object value}) => '%${value} 完了';
	@override String minutes({required Object value}) => '${value} 分';
	@override String get beginner => '初心者';
	@override String get screenplay => 'シナリオ';
	@override String get dailyInteractions => '日常のやり取り';
	@override String get business => 'ビジネス';
	@override late final _Translations$rolePlayPage$coffee$ja coffee = _Translations$rolePlayPage$coffee$ja._(_root);
	@override late final _Translations$rolePlayPage$directions$ja directions = _Translations$rolePlayPage$directions$ja._(_root);
	@override late final _Translations$rolePlayPage$interview$ja interview = _Translations$rolePlayPage$interview$ja._(_root);
	@override String get customScenarios => 'Your scenarios';
	@override String get createOwnScenario => '自分のシナリオを作成！';
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
	@override late final _Translations$rolePlayPage$missedTrain$ja missedTrain = _Translations$rolePlayPage$missedTrain$ja._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$ja flightAttendant = _Translations$rolePlayPage$flightAttendant$ja._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$ja trainTicket = _Translations$rolePlayPage$trainTicket$ja._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$ja restaurantReservation = _Translations$rolePlayPage$restaurantReservation$ja._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$ja doctorAppointment = _Translations$rolePlayPage$doctorAppointment$ja._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$ja shoppingClothes = _Translations$rolePlayPage$shoppingClothes$ja._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$ja takingTaxi = _Translations$rolePlayPage$takingTaxi$ja._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$ja rentingApartment = _Translations$rolePlayPage$rentingApartment$ja._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$ja birthdayParty = _Translations$rolePlayPage$birthdayParty$ja._(_root);
	@override String get deleteFailed => 'シナリオを削除できませんでした。もう一度お試しください。';
	@override String get easy => 'かんたん';
	@override String get medium => 'ふつう';
	@override String get hard => 'むずかしい';
	@override String get filterAll => 'すべて';
	@override String get seeAll => 'すべて見る';
	@override String get lingolaRolePlay => 'Lingola RolePlay';
	@override String get shopping => 'ショッピング';
	@override String get flirting => '恋愛トーク';
	@override String get lifeInTheUs => 'アメリカでの生活';
	@override String get freeDiscussion => 'フリートーク';
	@override String get jobInterview => '就職面接';
	@override String get socialDynamics => 'ソーシャル';
	@override String get restaurant => 'レストラン';
	@override String get travel => '旅行';
	@override String get createFieldDifficulty => '難易度';
	@override late final _Translations$rolePlayPage$flirtingMeet$ja flirtingMeet = _Translations$rolePlayPage$flirtingMeet$ja._(_root);
	@override late final _Translations$rolePlayPage$freeTalkHobby$ja freeTalkHobby = _Translations$rolePlayPage$freeTalkHobby$ja._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$ja implements Translations$notificationsPage$en {
	_Translations$notificationsPage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '通知';
	@override String get deleteConfirmTitle => 'よろしいですか？';
	@override String get deleteConfirmBody => 'この通知は削除されます。';
	@override String get delete => '削除';
	@override String get cancel => 'キャンセル';
	@override late final _Translations$notificationsPage$translation$ja translation = _Translations$notificationsPage$translation$ja._(_root);
	@override late final _Translations$notificationsPage$offer$ja offer = _Translations$notificationsPage$offer$ja._(_root);
	@override late final _Translations$notificationsPage$stories$ja stories = _Translations$notificationsPage$stories$ja._(_root);
	@override late final _Translations$notificationsPage$practice$ja practice = _Translations$notificationsPage$practice$ja._(_root);
	@override late final _Translations$notificationsPage$streak$ja streak = _Translations$notificationsPage$streak$ja._(_root);
	@override late final _Translations$notificationsPage$premium$ja premium = _Translations$notificationsPage$premium$ja._(_root);
	@override String get emptyTitle => 'まだ通知はありません';
	@override String get emptySubtitle => '通知を受け取ったら、もう一度確認するのを忘れないでください。';
}

// Path: profilePage
class _Translations$profilePage$ja implements Translations$profilePage$en {
	_Translations$profilePage$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール';
	@override String get userName => 'ジョン・ドー';
	@override String get freeVersion => '無料版';
	@override String get dayStreak => '連続学習日数！';
	@override String get accountSettings => 'アカウント設定';
	@override String get general => '一般';
	@override String get profileSettings => 'プロフィール設定';
	@override String get fullName => 'フルネーム';
	@override String get email => 'Eメール';
	@override String get deleteAccount => 'アカウントを削除';
	@override String get save => '保存';
	@override String get deleteTitle => 'あなたが去るのは望んでいませんが、理解しています。';
	@override String get deleteBody => 'Lingolaの体験を向上させるために、なぜ離れたいのか教えてもらえますか？';
	@override late final _Translations$profilePage$deleteReasons$ja deleteReasons = _Translations$profilePage$deleteReasons$ja._(_root);
	@override String get messageOptional => 'メッセージ（任意）';
	@override String get messageHint => 'メッセージがあれば、ぜひ書いてください。';
	@override String get next => '次へ';
	@override String get specialOfferTitle => '特別オファー';
	@override String get specialOfferBody => '去る前に、あなたのために用意したオファーをチェックしてください。';
	@override String get monthlyPlanTitle => '1ヶ月プランに切り替え';
	@override String get monthlyPlanPrice => '\$79/月、いつでもキャンセル可能';
	@override String get monthlyPlanDesc => '長期契約は不要です。月ごとにコミュニティとつながり続けましょう。';
	@override String get whatYoullKeep => '保持するもの:';
	@override String get keepCharacters => 'すべてのキャラクターにアクセス';
	@override String get keepVideo => '無制限のビデオ通話';
	@override String get keepCourses => 'すべてのコースにアクセス';
	@override String get switchMonthlyCta => '月額プランに切り替え';
	@override String get confirmTitle => '本当に大丈夫ですか？';
	@override String get confirmBody => 'あなたが去るのは本当に見たくありません。失うものはこれです:';
	@override String get loseCharacters => '無制限のキャラクターアクセス';
	@override String get loseVideo => '無制限のビデオ通話アクセス';
	@override String get loseCourses => 'すべてのコースへのアクセス';
	@override String get discountTitle => '留まって1ヶ月60%オフ';
	@override String get discountSubtitle => '今までで最高のオファー。たったの\$27.60/月';
	@override String get acceptDiscountCta => '60%オフを受け入れて留まる';
	@override String get farewellTitle => 'あなたが去るのは悲しいです';
	@override String farewellBody({required Object date}) => 'あなたのメンバーシップはキャンセルされました。${date}まで現在の請求期間にアクセスできます。';
	@override String get changeMindTitle => '✨ 気が変わった？';
	@override String changeMindBody({required Object date}) => 'あなたの特典を保持するために、${date}の前にいつでもメンバーシップを再アクティブ化できます。';
	@override String get reactivateCta => '待って、再アクティブ化したい';
	@override String get done => '完了';
	@override String get notifications => '通知';
	@override String get appLanguage => 'アプリ言語';
	@override String get explanationLanguage => '説明の言語';
	@override String get explanationNative => '母国語';
	@override String get explanationEnglish => '英語';
	@override String get explanationUpdateFailed => '説明の言語を更新できませんでした';
	@override String get learnInNativeLanguage => '母国語で学ぶ';
	@override String get targetLanguageLabel => '学習言語';
	@override String get languageLevel => '言語レベル';
	@override String get nativeLanguage => '母国語';
	@override String get interests => '興味・関心';
	@override String get goalChipCareer => 'キャリア';
	@override String get goalChipTravel => '旅行';
	@override String get goalChipLiving => '生活';
	@override String get goalChipStudying => '勉強';
	@override String get goalChipOther => 'その他';
	@override String get dailyGoal => '毎日の目標';
	@override String get dailyReminder => '毎日のリマインダー';
	@override String get selectNativeLanguageTitle => '母国語を選択';
	@override String get reminderOn => 'オン';
	@override String get reminderOff => 'オフ';
	@override String get remindMe => 'リマインダーを受け取る';
	@override String get reminderSave => '保存';
	@override String get reminderSaved => 'リマインダーを保存しました';
	@override String get selectLanguageTitle => '言語を選択';
	@override String get premium => 'プレミアム';
	@override String get passive => 'パッシブ';
	@override String get active => '有効';
	@override String get premiumVersion => 'プレミアム';
	@override String get shareFriend => '友達と共有';
	@override String get shareWithFriendTitle => '友達と共有';
	@override String get shareInviteBody => '友達を招待して、一緒に翻訳を楽しもう';
	@override String get rateUs => '評価する';
	@override String get faq => 'よくある質問';
	@override late final _Translations$profilePage$faqItems$ja faqItems = _Translations$profilePage$faqItems$ja._(_root);
	@override String get support => 'サポート';
	@override String get feedback => 'フィードバック';
	@override String get progression => '進捗';
	@override String get progressTitle => '進捗';
	@override String get goodMorning => 'おはようございます、';
	@override String get progressUserName => 'ジョン';
	@override String get progressLanguage => '英語';
	@override String get past7Days => '過去7日間';
	@override String get past7DaysBody => '毎日勉強して連続学習日数を築き、強力な学習習慣を作りましょう。';
	@override String get currentLevel => '現在のレベル';
	@override String xpLeft({required Object level, required Object xp}) => '${level}に到達するまで、あと${xp} XPです！';
	@override String get toNextLevel => '次のレベルへ';
	@override String get dayStreakLabel => '連続学習日数';
	@override String get totalPoints => '合計ポイント';
	@override String get savedWords => '保存した単語';
	@override String itemsToReview({required Object count}) => '${count} 件のレビューアイテム';
	@override String get logout => 'ログアウト';
	@override String get logoutTitle => 'ログアウトしてもよろしいですか？';
	@override String get logoutBody => 'またすぐにお会いしましょう！あなたの呼吸エクササイズが恋しいです。';
	@override String get logoutConfirm => 'ログアウト';
	@override String get logoutCancel => 'キャンセル';
	@override late final _Translations$profilePage$days$ja days = _Translations$profilePage$days$ja._(_root);
	@override String get profileSaved => 'プロフィールを保存しました';
	@override String get profilePhotoUpdated => 'プロフィール写真を更新しました';
	@override String get nameCannotBeEmpty => '名前を入力してください';
	@override String get profileSaveFailed => 'プロフィールを保存できませんでした';
	@override String get photoUploadFailed => '写真のアップロードに失敗しました';
	@override String get notificationsUpdateFailed => '通知を更新できませんでした';
	@override String get notificationsPermissionDenied => '学習リマインダーを受け取るには、端末の設定で通知を許可してください。';
	@override String get certificateTitle => 'あなたの証明書';
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
	@override String get certificateVerifyHint => 'QRコードをスキャンすれば、誰でも成果を確認できます。';
	@override String get certificateShare => '証明書を共有';
	@override String get certificateDownload => 'Download';
	@override String get certificateDownloadSaved => 'Certificate saved to your gallery';
	@override String get certificateDownloadFailed => 'Could not save certificate. Please try again.';
	@override String get certificateCreateQr => 'Create QR';
	@override String get certificateNotAvailableTitle => '証明書はロック中';
	@override String certificateNotAvailable({required Object level}) => '${level}のレッスンをまだ完了していないため、この証明書はまだ利用できません。';
	@override String get certificateNotAvailableOk => 'わかりました';
	@override String get certificateShareQr => 'QRコードを共有';
	@override String certificateShareBody({required Object level}) => 'I earned my Lingola ${level} certificate!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Certificate';
	@override String get certificateProvidedBy => 'Certificate provided by';
	@override String get certificatePreviewBody => 'LingolaでCEFRレベルを完了すると、お名前・レベル・確認用QRコード付きの証明書がここに表示されます。';
	@override String get certificatePreviewHint => 'レベルコースを完了して証明書を解除しましょう';
	@override String get certificateTapToView => 'タップして証明書を表示・共有';
	@override String get settings => '設定';
	@override String get dailyGoalValueLight => '1日5-10分';
	@override String get dailyGoalValueRecommended => '1日15-20分';
	@override String get dailyGoalValueFast => '1日30分以上';
	@override String get settingsShare => '共有';
	@override String get settingsSupport => 'サポート';
	@override String get settingsAbout => '情報';
	@override String get settingsAccount => 'アカウント';
	@override String get followInstagram => 'Instagramでフォロー';
	@override String get followTikTok => 'TikTokでフォロー';
	@override String get chineseShort => '中国語';
	@override String get seeMore => 'もっと見る...';
	@override String get searchLanguages => '検索';
	@override String get shareLingola => 'Lingolaをシェア';
	@override String get settingsCertificates => '証明書';
	@override String get restorePurchases => '購入を復元';
	@override String get aboutFlywork => 'Flyworkについて';
	@override String get faqHelp => 'よくある質問とヘルプ';
	@override String get deleteAccountAndData => 'アカウントとデータを削除';
	@override String get interestShopping => 'ショッピング';
	@override String get interestFood => '食事';
	@override String get interestPopCulture => 'ポップカルチャー';
	@override String get interestFilm => '映画';
	@override String get interestMusic => '音楽';
	@override String get interestSport => 'スポーツ';
	@override String get interestTechnology => 'テクノロジー';
	@override String get interestScience => '科学';
	@override String get interestHealth => '健康';
	@override String get interestFashion => 'ファッション';
	@override String get interestArt => 'アート';
	@override String get interestLiterature => '文学';
	@override String get interestHistory => '歴史';
	@override String get interestCulture => '文化';
	@override String get interestAstronomy => '天文学';
	@override String get interestPet => 'ペット';
	@override String get interestSocialMedia => 'ソーシャルメディア';
	@override String get interestEntrepreneur => '起業';
	@override String get confirmDeleteWarning => 'アカウントとすべての進捗が完全に削除されます。この操作は元に戻せません。';
	@override String get confirmKeepGoing => '進捗をあきらめない';
	@override String get myCertificates => 'マイ証明書';
	@override String get certificatesEmptyTitle => 'まだ証明書はありません';
	@override String get certificatesEmptySubtitle => 'レベルを完了したら、もう一度確認してください。';
	@override String get restorePurchasesSuccess => '購入が復元されました。';
	@override String get restorePurchasesEmpty => 'このアカウントに有効な購入は見つかりませんでした。';
}

// Path: pushNotifications
class _Translations$pushNotifications$ja implements Translations$pushNotifications$en {
	_Translations$pushNotifications$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'ちょっとした休憩を取ったようですね。',
		'一言の時間はありますか？',
		'私たちはここにいます — 焦らずに。',
		'学習のリズムが少し止まりましたね。',
		'ミニレビューをしてみると気持ちが良いかもしれません。',
	];
	@override List<String> get h4 => [
		'今日は新しい言葉が待っているかもしれません 👀',
		'ちょっとした練習ができるかもしれません。',
		'役立つフレーズを見逃したかもしれません。',
		'今日の進捗はまだ開いています。',
		'一言、一文…もしかしたら両方。',
	];
	@override List<String> get h8 => [
		'毎日進む必要はありません。',
		'少しのレビューも大切です。',
		'今日は勉強しなくても何も失いませんでした。',
		'あなたの準備ができたら、私たちも準備万端です。',
		'言語学習はマラソンです、スプリントではありません。',
	];
	@override List<String> get h24 => [
		'1日が過ぎました。あなたの言葉はまだここにあります。',
		'休憩を取るのは普通のことです。',
		'あなたの場所は、あなたが離れたところにそのままです。',
		'いつでも続けてください。',
		'言語は逃げません — 私たちも逃げません。',
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
class _Translations$apiErrors$ja implements Translations$apiErrors$en {
	_Translations$apiErrors$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _Translations$onboarding$slide1$ja implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '数週間で自信を持って話そう — 数ヶ月ではなく';
	@override String get body => 'AIとリアルな会話を練習しよう。毎日、アクセント、自信、流暢さを向上させる。';
	@override String get testimonialName => 'サラ・ウィリアムズ、24歳';
	@override String get testimonialBody => '以前は英語を話せませんでした。今では毎日仕事で話しています。';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$ja implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '価格なしのプライベートチューター';
	@override String get body => 'リアルな会話。即時フィードバック。\nスケジュールなし。プレッシャーなし。';
	@override String get realTutor => 'リアルチューター';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / 時間';
	@override String get priceLingola => '\$9.99 / 年';
	@override String get versus => 'VS';
	@override String get scheduled => 'スケジュール済み';
	@override String get anytime => 'いつでも';
	@override String get stressful => 'ストレスがかかる';
	@override String get noPressure => 'プレッシャーなし';
	@override String get price => '価格';
	@override String get availability => '利用可能性';
	@override String get feeling => '感覚';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$ja implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'あなたに合わせた学習プラン';
	@override String get body => 'あなたの目標、あなたのペース、あなたのレベル。\n初心者から流暢まで — 一歩ずつ。';
	@override String get goal => '目標';
	@override String get practice => '練習';
	@override String get progress => '進捗';
}

// Path: home.premium
class _Translations$home$premium$ja implements Translations$home$premium$en {
	_Translations$home$premium$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => '流暢に話すための';
	@override String get titleHighlight => '道';
	@override String get titleAfter => 'ミスを恐れずに。';
	@override String get descriptionBefore => '世界中の何百万もの学生に参加しよう。今日から言語の壁を打破しよう — ';
	@override String get descriptionHighlight => '最初の3日間は完全無料。';
	@override String get feature1 => '24/7アクセス可能なAIチューター';
	@override String get feature2 => 'プライベートチューターへの無制限アクセス';
	@override String get feature3 => 'あなたに合わせた毎日のレッスンプラン';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/月';
	@override String get discount => '年契約で40%オフ';
	@override String get cta => '始める';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$ja implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get lingola => 'Lingola';
	@override String get zephyrion => 'ゼファリオン';
	@override String get vaelen => 'ヴァエレン';
	@override String get elrion => 'エルリオン';
	@override String get ukrath => 'ウクラト';
	@override String get elena => 'エレナ';
	@override String get kenji => 'ケンジ';
	@override String get freya => 'フレイヤ';
	@override String get camila => 'カミラ';
	@override String get marco => 'マルコ';
	@override String get julian => 'ジュリアン';
	@override String get ines => 'イネス';
	@override String get felix => 'フェリックス';
	@override String get diego => 'ディエゴ';
	@override String get amara => 'アマラ';
	@override String get erik => 'エリック';
	@override String get katie => 'ケイティ';
	@override String get morgan => 'モーガン';
	@override String get santa => 'サンタクロース';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$ja implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get adaptive => '適応力がある';
	@override String get calm => '落ち着いている';
	@override String get patient => '忍耐強い';
	@override String get organized => '整理整頓された';
	@override String get relaxed => 'リラックスした';
	@override String get methodical => '体系的な';
	@override String get attentive => '注意深い';
	@override String get more => '+5';
	@override String get curious => '好奇心旺盛';
	@override String get observer => '観察者';
	@override String get ancientKnowledge => '古代の知識';
	@override String get wise => '賢い';
	@override String get clear => '明確な';
	@override String get decisive => '決断力がある';
	@override String get disciplined => '規律正しい';
	@override String get smart => '賢い';
	@override String get analytic => '分析的';
	@override String get cheerful => '陽気な';
	@override String get generous => '寛大な';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$ja implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'おはよう！今日は練習する準備ができているのが嬉しいよ。';
	@override String get outgoing1 => 'うん、挨拶から始めよう。';
	@override String get incoming2 => '完璧。同僚にどうやって挨拶する？';
	@override String get typing => '入力中';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$ja implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'レッスン1 : 挨拶';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'レッスン ${number} : ${title}';
	@override String get nativeLine => '退屈？';
	@override String get englishLine => '退屈？その言葉は私の語彙から消したよ。立ち上がって、計画はもう決まってる：カディキョイの新しいアーケードバーに行くよ。';
	@override String get highlight => '退屈？';
	@override String get close => '通話を終了';
	@override String get toggleCaptions => '字幕を切り替え';
	@override String get toggleHints => 'ヒントを切り替え';
	@override String get toggleMic => 'マイクを切り替え';
	@override String get tapToSpeakHint => 'タップして話す、もう一度タップして終了';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$ja implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$ja a1 = _Translations$lessonPage$levels$a1$ja._(_root);
	@override late final _Translations$lessonPage$levels$a2$ja a2 = _Translations$lessonPage$levels$a2$ja._(_root);
	@override late final _Translations$lessonPage$levels$b1$ja b1 = _Translations$lessonPage$levels$b1$ja._(_root);
	@override late final _Translations$lessonPage$levels$b2$ja b2 = _Translations$lessonPage$levels$b2$ja._(_root);
	@override late final _Translations$lessonPage$levels$c1$ja c1 = _Translations$lessonPage$levels$c1$ja._(_root);
	@override late final _Translations$lessonPage$levels$c2$ja c2 = _Translations$lessonPage$levels$c2$ja._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$ja implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'コーヒーショップでの注文';
	@override String get screenplay => 'お気に入りの飲み物を注文し、サイズやトッピングを尋ね、合計を確認して、カウンターでコーヒーを受け取ります。';
	@override late final _Translations$rolePlayPage$coffee$chat$ja chat = _Translations$rolePlayPage$coffee$chat$ja._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$ja implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '道を尋ねる';
	@override String get screenplay => '場所への道を尋ね、地下鉄やバスの行き方を確認し、チケットの情報を得て、レストランのおすすめを聞きます。';
	@override late final _Translations$rolePlayPage$directions$chat$ja chat = _Translations$rolePlayPage$directions$chat$ja._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$ja implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '就職面接';
	@override String get screenplay => '自己紹介をし、一般的な面接の質問に答え、経験について話し、役割や次のステップについて尋ねます。';
	@override late final _Translations$rolePlayPage$interview$chat$ja chat = _Translations$rolePlayPage$interview$chat$ja._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$ja implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'You Missed Your Train';
	@override String get screenplay => 'You missed your train and ask a station staff member for help — explain where you\'re going, find the next train, and get directions to the platform.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$ja chat = _Translations$rolePlayPage$missedTrain$chat$ja._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$ja implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking to a Flight Attendant';
	@override String get screenplay => 'You\'re a passenger on a flight. Find your seat, get help with luggage, choose food and drinks, and ask for anything you need during the flight.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$ja chat = _Translations$rolePlayPage$flightAttendant$chat$ja._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$ja implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buying a Train Ticket';
	@override String get screenplay => 'At a train station, tell the clerk where you\'re going, pick a departure time, choose ticket type and seat, and pay for your ticket.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$ja chat = _Translations$rolePlayPage$trainTicket$chat$ja._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$ja implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Restaurant Reservation';
	@override String get screenplay => 'Call or visit a restaurant to book a table — choose the date, time, number of guests, seating preference, and confirm your reservation.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$ja chat = _Translations$rolePlayPage$restaurantReservation$chat$ja._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$ja implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Making a Doctor\'s Appointment';
	@override String get screenplay => 'Call a clinic to book a doctor\'s appointment — explain why you need to visit, choose a day and time, and confirm your details.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$ja chat = _Translations$rolePlayPage$doctorAppointment$chat$ja._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$ja implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Shopping for Clothes';
	@override String get screenplay => 'In a clothing store, tell the assistant what you\'re looking for, try items on, compare sizes and colors, and decide whether to buy.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$ja chat = _Translations$rolePlayPage$shoppingClothes$chat$ja._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$ja implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taking a Taxi';
	@override String get screenplay => 'Get in a taxi in a new city, tell the driver where you\'re going, talk about the route, and pay at the end of the ride.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$ja chat = _Translations$rolePlayPage$takingTaxi$chat$ja._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$ja implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Renting an Apartment';
	@override String get screenplay => 'Talk to a landlord about a rental apartment — ask about rent, bills, deposit, pets, parking, and arrange a viewing.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$ja chat = _Translations$rolePlayPage$rentingApartment$chat$ja._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$ja implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planning a Birthday Party';
	@override String get screenplay => 'Plan a birthday party with a friend — pick the venue, date, guest list, food, cake, music, and activities together.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$ja chat = _Translations$rolePlayPage$birthdayParty$chat$ja._(_root);
}

// Path: rolePlayPage.flirtingMeet
class _Translations$rolePlayPage$flirtingMeet$ja implements Translations$rolePlayPage$flirtingMeet$en {
	_Translations$rolePlayPage$flirtingMeet$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meeting Someone New at a Café';
	@override String get screenplay => 'Strike up a friendly conversation, share a little about yourself, exchange interests, and decide whether to meet again.';
	@override late final _Translations$rolePlayPage$flirtingMeet$chat$ja chat = _Translations$rolePlayPage$flirtingMeet$chat$ja._(_root);
}

// Path: rolePlayPage.freeTalkHobby
class _Translations$rolePlayPage$freeTalkHobby$ja implements Translations$rolePlayPage$freeTalkHobby$en {
	_Translations$rolePlayPage$freeTalkHobby$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talking About Hobbies';
	@override String get screenplay => 'Chat freely about free-time activities, ask follow-up questions, share preferences, and suggest trying something new together.';
	@override late final _Translations$rolePlayPage$freeTalkHobby$chat$ja chat = _Translations$rolePlayPage$freeTalkHobby$chat$ja._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$ja implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '新しい翻訳が準備できました';
	@override String get body => 'あなたの音声翻訳ファイルはテキストに変換され、翻訳されました。';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$ja implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '特別オファーが待っています';
	@override String get body => 'プレミアムにアップグレードして、無制限の写真翻訳を50％オフで利用しましょう。';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$ja implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '新しいストーリーを発見しよう';
	@override String get body => 'ストーリーを通じて新しい単語を学びましょう';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$ja implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your daily practice is waiting';
	@override String get body => 'Spend 5 minutes on a quick word, reading, or speaking exercise.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$ja implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Keep your streak alive';
	@override String get body => 'A short session today protects your day streak and builds the habit.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$ja implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unlock all tutors & lessons';
	@override String get body => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$ja implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'AIキャラクターがリアルだとは思えませんでした。';
	@override String get videoIssues => 'ビデオチャットで技術的な問題が発生しています。';
	@override String get pricing => 'サブスクリプションの価格が期待以上です。';
	@override String get noMatch => '探しているスタイルのキャラクターが見つかりませんでした。';
	@override String get shortTrial => '短期間だけ試したかったです。';
	@override String get other => 'その他';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$ja implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$ja supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$ja._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$ja howAiWorks = _Translations$profilePage$faqItems$howAiWorks$ja._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$ja offlineUse = _Translations$profilePage$faqItems$offlineUse$ja._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$ja isFree = _Translations$profilePage$faqItems$isFree$ja._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$ja pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$ja._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$ja dailyPractice = _Translations$profilePage$faqItems$dailyPractice$ja._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$ja levelDetermination = _Translations$profilePage$faqItems$levelDetermination$ja._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$ja realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$ja._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$ja dataSecurity = _Translations$profilePage$faqItems$dataSecurity$ja._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$ja disableReminders = _Translations$profilePage$faqItems$disableReminders$ja._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$ja implements Translations$profilePage$days$en {
	_Translations$profilePage$days$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get mon => '月';
	@override String get tue => '火';
	@override String get wed => '水';
	@override String get thu => '木';
	@override String get fri => '金';
	@override String get sat => '土';
	@override String get sun => '日';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$ja implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - スターター';
	@override List<String> get lessons => [
		'挨拶',
		'自己紹介 I',
		'仕事',
		'お気に入りの部屋',
		'日常生活',
		'果物',
		'アドバイス 1',
		'家族 1',
		'日常のもの',
		'故郷',
		'家',
		'食べ物の好み',
		'趣味 1',
		'成功した人々',
		'食べ物と飲み物',
		'レストランでの注文',
		'ペット',
		'健康とフィットネス',
		'天気',
		'新しいライフスタイル',
		'上達する',
		'趣味 2',
		'場所についての質問',
		'所有',
		'買い物 1',
		'時間を伝える',
		'道案内 1',
		'買い物 2',
		'あなたを知る',
		'物の場所',
		'外見',
		'道案内 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$ja implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - 基本';
	@override List<String> get lessons => [
		'家族 2',
		'人と場所',
		'家族 3',
		'物の説明',
		'都市',
		'建物プロジェクト',
		'我が家',
		'今何時？',
		'日常生活 2',
		'自由時間',
		'食べ物と栄養',
		'ショッピングと消費者',
		'休日',
		'週末の計画',
		'フォーマルかカジュアルか',
		'ファッション',
		'ショッピング 3',
		'アドバイス 2',
		'あなたならできる',
		'ショッピング 4',
		'雑談',
		'ラテを一杯ください',
		'食べ物',
		'移動手段',
		'旅行の準備',
		'旅行 1',
		'都市の逃避',
		'旅行 2',
		'宿泊場所',
		'とてもワクワクする',
		'正しい人',
		'学校',
		'音楽の好み',
		'スポーツ',
		'レースのルール',
		'メッセージを残す',
		'リクエスト',
		'招待状',
		'旅行の経験',
		'過去形 1',
		'過去形 2',
		'過去形 3',
		'過去についての質問',
		'年齢は関係ない',
		'子供の頃の思い出',
		'褒め言葉',
		'言い訳',
		'本当にイライラする！',
		'デジタルの世界',
		'仕事の生活',
		'それは理解できなかった',
		'貯めるか使うか？',
		'ごめんなさいと言う',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$ja implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - 中級';
	@override List<String> get lessons => [
		'文化的伝統',
		'有名人',
		'アートとクリエイティビティ',
		'未来の計画',
		'イベントの計画',
		'目標と計画',
		'歴史的な出来事',
		'テクノロジー',
		'決して',
		'何があるのか',
		'夢のバケーション',
		'ソーシャルメディア',
		'本のおすすめ',
		'そんな日',
		'特別な写真',
		'個人的な成果',
		'お気に入りの映画',
		'ニュース速報',
		'幸せ',
		'忙しい週',
		'私が育った場所',
		'学校の日々',
		'プロフィール',
		'ライフマップ',
		'日常',
		'次は何か',
		'提案作り',
		'何が起こったのか',
		'思い出',
		'カルチャーショック',
		'興味のあるフレーズ',
		'就職面接',
		'バケットリスト',
		'私の好きな街',
		'インターネット世代',
		'人気ブランド',
		'意見のフレーズ',
		'どう見えるか',
		'住空間',
		'健康的な食事',
		'珍しい趣味',
		'難しい選択',
		'行動を起こす',
		'新しいスキル',
		'苦情を言う',
		'教育',
		'グリーンシティ',
		'仕事に何があるか',
		'個人的な挑戦',
		'面接のフレーズ',
		'丁寧な締めくくり',
		'ヘッドラインニュース',
		'小さな変化',
		'謝罪の言い訳',
		'電話のマナー',
		'お邪魔してすみません…',
		'苦情への返答',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$ja implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - 上級中級';
	@override List<String> get lessons => [
		'個性',
		'素晴らしいリード',
		'健康的なライフスタイル',
		'真実とは？',
		'自己成長',
		'意見を言う',
		'演じる？',
		'覚えてる...',
		'社会的フィードバック',
		'犯罪現場',
		'丁寧なトラブル',
		'対立解決',
		'好きか嫌いか？',
		'環境問題',
		'解決できるよ',
		'ミステリーと犯罪',
		'可能な未来',
		'ビジネスプラン',
		'会議の決定',
		'とても予測可能...',
		'仕事中',
		'科学と技術',
		'時間管理',
		'人権',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$ja implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - 上級';
	@override List<String> get lessons => [
		'文化的規範',
		'ソーシャルメディアの影響',
		'キャリアの選択',
		'パフォーマンスを加速する',
		'発明',
		'タイムトラベル',
		'所有物',
		'仕事のスキル',
		'歴史的変化',
		'レビューライティング',
		'ミステリー',
		'奇妙な理論',
		'セレブリティ',
		'グローバル政治',
		'製品ブーム',
		'幸せになるのかな？',
		'後でかも...',
		'新しい解決策',
		'文脈的影響',
		'失われたロゴ',
		'親切な行為',
		'なんて映画だ',
		'うざいな',
		'ニュースで',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$ja implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - エキスパート';
	@override List<String> get lessons => [
		'グローバリゼーション',
		'自然災害',
		'情報への反応',
		'ワークライフバランス',
		'リモートワーク',
		'家族の問題',
		'基本的な人体解剖学',
		'健康予測',
		'医療アクセス',
		'グローバルな旅行体験',
		'超能力',
		'チームビルディング',
		'バイオ蛍光',
		'ジレンマ',
		'社会的熱意',
		'変化',
		'働く、働く、働く',
		'地域の問題',
		'問題、問題',
		'事実かフィクションか？',
		'観光',
		'ボランティア活動',
		'心の目',
		'メディア消費',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$ja implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'こんにちは！今日はコーヒーショップでの注文を練習します — こんにちは、サイズ、トッピング。最初に少し説明してから、演じますね。いいですか？';
	@override String get incoming1 => 'いらっしゃいませ！今日は何をお作りしましょうか？';
	@override String get outgoing1 => 'こんにちは！ミディアムラテをお願いします。';
	@override String get incoming2Highlight => 'もちろん';
	@override String get incoming2Rest => '! ホットですか、それともアイスですか？トッピングはどうしますか？';
	@override String get botReply => '素晴らしい選択ですね。他に何かご注文はありますか？';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$ja implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'こんにちは！今日は道を尋ねる練習をします。最初に少し説明してから、演じますね。いいですか？';
	@override String get incoming1 => 'こんにちは！少し迷っているようですね — 何か探してますか？';
	@override String get outgoing1 => 'はい、最寄りの地下鉄駅を探しています。';
	@override String get incoming2Highlight => 'もちろん';
	@override String get incoming2Rest => '! あちらに2ブロック歩いて、左に曲がってください。入口が見えますよ。';
	@override String get botReply => 'どういたしまして！駅の近くのレストランのヒントも欲しいですか？';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$ja implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'こんにちは！今日は就職面接の練習をします。最初に少し説明してから、演じますね — 私があなたを面接して、その後交代します。いいですか？';
	@override String get incoming1 => '今日はお越しいただきありがとうございます。簡単に自己紹介をしていただけますか？';
	@override String get outgoing1 => 'もちろんです。ここに来られて嬉しく、自分の経験を共有できることにワクワクしています。';
	@override String get incoming2Highlight => '素晴らしい';
	@override String get incoming2Rest => 'ですね。最近誇りに思っているプロジェクトについて教えてください。';
	@override String get botReply => 'それは素晴らしいですね。この役割について何か質問はありますか？';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$ja implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice what to say when you miss your train at a station. I\'ll teach a few phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello, where are you trying to go?';
	@override String get outgoing1 => 'I need to get to Manchester. I think I missed my 10:15 train.';
	@override String get incoming2Highlight => 'No problem';
	@override String get incoming2Rest => '. Let me check the next available train for you.';
	@override String get botReply => 'Would you prefer the fastest option or the cheapest one?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$ja implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a flight attendant on a plane — seats, luggage, meals. I\'ll explain first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! May I see your boarding pass, please?';
	@override String get outgoing1 => 'Sure, here you go. I\'m in seat 14B.';
	@override String get incoming2Highlight => 'Thank you';
	@override String get incoming2Rest => '. Would you like some help finding your seat?';
	@override String get botReply => 'Would you like something to drink — water, juice, coffee, or tea?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$ja implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice buying a train ticket at the counter. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'I\'d like to go to Edinburgh, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When would you like to travel?';
	@override String get botReply => 'Would you like a one-way or return ticket?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$ja implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a restaurant reservation. I\'ll explain a few phrases first, then we\'ll act it out. Sound good?';
	@override String get incoming1 => 'Hello! How can I help you?';
	@override String get outgoing1 => 'Hi, I\'d like to make a reservation for dinner, please.';
	@override String get incoming2Highlight => 'Of course';
	@override String get incoming2Rest => '. What day would you like to come?';
	@override String get botReply => 'How many people will be joining you?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$ja implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice making a doctor\'s appointment by phone. I\'ll teach key phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'Hello! How can I help you today?';
	@override String get outgoing1 => 'Hi, I\'d like to book an appointment with a doctor, please.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. Have you visited our clinic before?';
	@override String get botReply => 'What would you like to see the doctor about?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$ja implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice shopping for clothes in a store. I\'ll explain useful phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Can I help you find something?';
	@override String get outgoing1 => 'Yes, I\'m looking for a casual shirt for everyday wear.';
	@override String get incoming2Highlight => 'Sure';
	@override String get incoming2Rest => '. What size do you usually wear?';
	@override String get botReply => 'Would you prefer something casual or more formal?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$ja implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice taking a taxi — giving your destination, chatting with the driver, and paying. I\'ll teach first, then we\'ll act it out. Ready?';
	@override String get incoming1 => 'Hello! Where would you like to go?';
	@override String get outgoing1 => 'The Grand Hotel on Park Street, please.';
	@override String get incoming2Highlight => 'Got it';
	@override String get incoming2Rest => '. Do you have the exact address?';
	@override String get botReply => 'Would you prefer the fastest route?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$ja implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice talking to a landlord about renting an apartment. I\'ll explain key phrases first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Hello! Are you interested in renting the apartment?';
	@override String get outgoing1 => 'Yes, I\'d like to know more about it, please.';
	@override String get incoming2Highlight => 'Great';
	@override String get incoming2Rest => '. When are you looking to move in?';
	@override String get botReply => 'Do you need a furnished or unfurnished apartment?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$ja implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice planning a birthday party with a friend. I\'ll teach useful phrases first, then we\'ll role-play. Ready?';
	@override String get incoming1 => 'So, whose birthday are we planning?';
	@override String get outgoing1 => 'It\'s for my friend Emma — her birthday is next month.';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! When should we have the party?';
	@override String get botReply => 'Would you rather have the party at home or at a restaurant?';
}

// Path: rolePlayPage.flirtingMeet.chat
class _Translations$rolePlayPage$flirtingMeet$chat$ja implements Translations$rolePlayPage$flirtingMeet$chat$en {
	_Translations$rolePlayPage$flirtingMeet$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice a light flirting conversation at a café — hellos, compliments, and asking for a number. I\'ll explain first, then we\'ll role-play. Sound good?';
	@override String get incoming1 => 'Is this seat taken? The place is packed today.';
	@override String get outgoing1 => 'Oh, go ahead! I was just waiting for my coffee.';
	@override String get incoming2Highlight => 'Thanks';
	@override String get incoming2Rest => '! I\'m Alex, by the way. What brings you here?';
	@override String get botReply => 'Nice to meet you. Do you come here often?';
}

// Path: rolePlayPage.freeTalkHobby.chat
class _Translations$rolePlayPage$freeTalkHobby$chat$ja implements Translations$rolePlayPage$freeTalkHobby$chat$en {
	_Translations$rolePlayPage$freeTalkHobby$chat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Hi! Today we\'ll practice free discussion about hobbies — asking, answering, and reacting naturally. I\'ll explain first, then we\'ll talk. Ready?';
	@override String get incoming1 => 'So, what do you usually do on weekends?';
	@override String get outgoing1 => 'I like hiking and watching films. How about you?';
	@override String get incoming2Highlight => 'Nice';
	@override String get incoming2Rest => '! I\'ve been meaning to try hiking more. Any favorite trails?';
	@override String get botReply => 'That sounds perfect. Want to go together sometime?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$ja implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => 'アプリはどの言語をサポートしていますか？';
	@override String get answer => 'Lingolaのインターフェースは、英語、ドイツ語、イタリア語、フランス語、トルコ語、日本語、スペイン語、ロシア語、ヒンディー語、ポルトガル語、簡体字中国語で利用できます。';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$ja implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => 'AIはどのように機能しますか？';
	@override String get answer => 'AIは本物のチューターのようにあなたと対話します。会話を分析し、間違いを検出し、進捗に基づいてパーソナライズされたフィードバックを提供します。';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$ja implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => 'アプリをオフラインで使用できますか？';
	@override String get answer => 'はい。特定のレッスンや会話シナリオを事前にダウンロードしてオフラインで使用できます。ただし、ライブチャットにはインターネット接続が必要です。';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$ja implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => 'アプリは無料ですか？';
	@override String get answer => '基本版は無料です。プレミアムにすると、高度なチャットシナリオ、発音分析、個人チューターモードが利用できます。';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$ja implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '私の発音はどのように評価されますか？';
	@override String get answer => 'アプリはあなたの声を分析し、AIによる音声認識を使用してアクセントと発音をスコアリングします。改善が必要な単語がハイライトされます。';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$ja implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '毎日練習する必要がありますか？';
	@override String get answer => 'はい。システムは毎日あなたの進捗を追跡します。1日10〜15分のスピーキング練習で、言語学習が明らかに加速します。';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$ja implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '私の学習レベルはどのように決定されますか？';
	@override String get answer => '最初にサインインしたときの短いレベルチェックで、現在の知識を分析します。その後、AIが自動的にあなたのレベルに合ったレッスンを推薦します。';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$ja implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '本物の人と話すことはできますか？';
	@override String get answer => 'はい。プレミアムユーザーは、本物のチューターとの短い練習セッションをスケジュールできます。';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$ja implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '私のデータは安全ですか？';
	@override String get answer => 'もちろんです。すべての会話とユーザーデータは暗号化されて保存されます。あなたの個人情報は第三者と共有されることはありません。';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$ja implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '毎日のリマインダーをオフにするにはどうすればいいですか？';
	@override String get answer => 'プロフィール設定に移動し、通知を開いてリマインダーの頻度を変更するか、通知を完全にオフにします。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'プレミアム',
			'app.notifications' => '通知',
			'app.streak' => '学習の連続日数',
			'app.profile' => 'プロフィール',
			'common.continueLabel' => '続ける',
			'common.back' => '戻る',
			'common.locked' => 'ロックされています',
			'common.minutes' => ({required Object value}) => '${value} 分',
			'common.close' => '閉じる',
			'common.getStarted' => '始める',
			'common.connectionError' => '接続できません。インターネットを確認して再試行してください。',
			'common.genericError' => '何かがうまくいきませんでした。もう一度お試しください。',
			'common.tryAgain' => '再試行',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'オンボーディングページ ${current} / ${total}',
			'onboarding.letsStart' => 'はじめましょう',
			'onboarding.slide1.title' => '数週間で自信を持って話そう — 数ヶ月ではなく',
			'onboarding.slide1.body' => 'AIとリアルな会話を練習しよう。毎日、アクセント、自信、流暢さを向上させる。',
			'onboarding.slide1.testimonialName' => 'サラ・ウィリアムズ、24歳',
			'onboarding.slide1.testimonialBody' => '以前は英語を話せませんでした。今では毎日仕事で話しています。',
			'onboarding.slide2.title' => '価格なしのプライベートチューター',
			'onboarding.slide2.body' => 'リアルな会話。即時フィードバック。\nスケジュールなし。プレッシャーなし。',
			'onboarding.slide2.realTutor' => 'リアルチューター',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / 時間',
			'onboarding.slide2.priceLingola' => '\$9.99 / 年',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'スケジュール済み',
			'onboarding.slide2.anytime' => 'いつでも',
			'onboarding.slide2.stressful' => 'ストレスがかかる',
			'onboarding.slide2.noPressure' => 'プレッシャーなし',
			'onboarding.slide2.price' => '価格',
			'onboarding.slide2.availability' => '利用可能性',
			'onboarding.slide2.feeling' => '感覚',
			'onboarding.slide3.title' => 'あなたに合わせた学習プラン',
			'onboarding.slide3.body' => 'あなたの目標、あなたのペース、あなたのレベル。\n初心者から流暢まで — 一歩ずつ。',
			'onboarding.slide3.goal' => '目標',
			'onboarding.slide3.practice' => '練習',
			'onboarding.slide3.progress' => '進捗',
			'targetLanguage.title' => '学びたい言語を選んでください',
			'targetLanguage.comingSoon' => 'さらに多くの言語がもうすぐ登場します',
			'targetLanguage.korean' => '韓国語',
			'targetLanguage.portuguese' => 'ポルトガル語',
			'targetLanguage.portugueseBrazil' => 'ポルトガル語（ブラジル）',
			'targetLanguage.german' => 'ドイツ語',
			'targetLanguage.italian' => 'イタリア語',
			'targetLanguage.simplifiedChinese' => '簡体字中国語',
			'targetLanguage.arabic' => 'アラビア語',
			'targetLanguage.turkish' => 'トルコ語',
			'targetLanguage.hindi' => 'ヒンディー語',
			'language.step' => ({required Object total, required Object current}) => '${total}のうち${current}ステップ',
			'language.title' => '何を話したいですか？',
			'language.nativeSection' => '私は話します',
			'language.nativeField' => '母国語',
			'language.nativeName' => 'トルコ語',
			'language.targetSection' => '学びたい言語',
			'language.targetField' => '目標言語',
			'language.targetName' => '英語',
			'language.direction' => '言語の方向',
			'language.selectLanguage' => '言語を選択',
			'language.comingSoonBadge' => '近日公開...',
			'language.english' => '英語',
			'language.french' => 'フランス語',
			'language.japanese' => '日本語',
			'language.spanish' => 'スペイン語',
			'language.russian' => 'ロシア語',
			'setup.goalTitle' => 'なぜ新しい言語を学びたいですか？',
			'setup.goalHint' => 'あなたの目標にぴったりの学習プランを作成します',
			'setup.goalCareer' => 'キャリア開発',
			'setup.goalTravel' => '旅行',
			'setup.goalLiving' => '海外生活',
			'setup.goalStudying' => '教育',
			'setup.goalOther' => '自己成長',
			'setup.interestsTitle' => '興味のある分野を選んでください',
			'setup.interestsHint' => '興味のあるトピックで、あなた専用の学習体験をつくります。',
			'setup.seeMoreEllipsis' => 'もっと見る...',
			'setup.levelTitle' => '今のレベルをどう表現しますか？',
			'setup.paceTitle' => 'どれくらい早く大きな進歩を見たいですか？',
			'setup.explanationTitle' => '自分の言語で質問するとき、どう説明しますか？',
			'setup.explanationHint' => 'プロフィール設定からいつでも変更できます。',
			'setup.explanationNative' => '母国語で説明する',
			'setup.explanationEnglish' => '英語で説明する',
			'setup.levelA1' => 'この言語をゼロから学んでいます',
			'setup.levelA2' => '基本的な会話に参加できます',
			'setup.levelB1' => 'なじみのある話題で短い会話ができます',
			'setup.levelB2' => '日常の話題について詳しく話せます',
			'setup.levelC1' => 'ネイティブと流暢に話せます',
			'setup.levelC2' => 'どんな話題でも明確に伝えられます',
			'setup.paceHint' => 'プランのペース調整に役立ちます',
			'setup.paceMonth1' => '1か月',
			'setup.paceMonth2_3' => '2～3か月',
			'setup.paceMonth6' => '6か月',
			'setup.paceYear1' => '1年',
			'setup.paceRelaxed' => '急いでいません',
			'setup.progressInsightTitle' => 'わずか2週間で本当の上達を実感！',
			'setup.progressInsightBody' => 'Lingolaのユーザーは、最初からスピーキングの自信が大きく上がることに気づくことが多いです。',
			'setup.progressInsightConfidence' => 'スピーキングの自信',
			'setup.progressInsightToday' => 'Today',
			'setup.progressInsightWeek2' => '2週目',
			'setup.progressInsightWithLingola' => 'Lingolaあり',
			'setup.progressInsightWithoutApp' => 'アプリなし',
			'setup.levelHint' => 'Lingolaはあらゆるレベルの学習者をサポートするために作られました',
			'setup.dailyPracticeTitle' => '1日どのくらい練習したいですか？',
			'setup.dailyPracticeHint' => '自分のペースで、毎日一歩ずつ近づこう。',
			'setup.dailyPracticeMonthlyHours' => ({required Object hours}) => '${hours} / month',
			'setup.dailyPracticeOnlyMinutes' => ({required Object minutes}) => '1日たった${minutes}分',
			'setup.dailyPracticeMinutesOption' => ({required Object minutes}) => '${minutes}分',
			'setup.dailyPracticeToday' => '今日',
			'setup.practiceTimeTitle' => '1日のどの時間帯に練習したいですか？',
			'setup.practiceTimeHint' => 'リマインダーは連続記録を保ち、毎日目標に一歩近づくのに役立ちます。',
			'setup.practiceTimeMorning' => '朝',
			'setup.practiceTimeAfternoon' => '午後',
			'setup.practiceTimeEvening' => '夜',
			'setup.practiceTimeFlexible' => '柔軟でOK',
			'setup.practiceTimeSave' => '保存',
			'setup.setPracticeTimeTitle' => '時間を設定',
			'setup.setPracticeTimeHint' => 'どの時間帯で練習したいですか？',
			'setup.promiseTitle' => '毎日スピーキング練習をすると約束します',
			'setup.promiseBody' => 'そしてAI講師と一緒に、できるだけ早く語学目標に到達します',
			'setup.promiseHoldHint' => '確認するにはLingolaロゴを長押ししてください',
			'setup.aiTutorsIntroTitle' => 'Lingolaの20人以上のAI講師から好きな人を選べます',
			'setup.aiTutorsIntroBody' => 'みんな深い個性と異なるアクセントを持っています',
			'setup.aiTutorsIntroCta' => '少しあなたのことを教えて',
			'accountCreating.title' => 'あなたの個人アカウントが作成中です',
			'accountCreating.stepContent' => 'コンテンツが作成中です',
			'accountCreating.stepDialogues' => 'ダイアログが準備中です',
			'accountCreating.stepLessons' => 'レッスンが最適化中です',
			'accountCreating.stepPlan' => 'あなたのプランが最終調整中です',
			'accountCreating.optimization' => '最適化',
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
			'planReady.fieldInterests' => '興味・関心',
			'planReady.startPlan' => 'Start my plan →',
			'planReady.courseEnglish' => 'English',
			'planReady.courseGerman' => 'German',
			'planReady.courseFrench' => 'French',
			'planReady.courseItalian' => 'Italian',
			'planReady.courseSpanish' => 'Spanish',
			'planReady.courseJapanese' => 'Japanese',
			'planReady.courseRussian' => 'Russian',
			'planReady.courseTurkish' => 'Turkish',
			'planReady.goalCareer' => 'キャリア開発',
			'planReady.goalTravel' => '旅行',
			'planReady.goalLiving' => '海外生活',
			'planReady.goalStudying' => '教育',
			'planReady.goalOther' => '自己成長',
			'planReady.levelA1' => 'A1',
			'planReady.levelA2' => 'A2',
			'planReady.levelB1' => 'B1',
			'planReady.levelB2' => 'B2',
			'planReady.levelC1' => 'C1',
			'planReady.levelC2' => 'C2',
			'planReady.paceMonth1' => '1か月',
			'planReady.paceMonth2_3' => '2～3か月',
			'planReady.paceMonth6' => '6か月',
			'planReady.paceYear1' => '1年',
			'planReady.paceRelaxed' => '急いでいません',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Getting to know you',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Type a message...',
			'demoChat.incoming1' => 'Hi! I\'m your AI tutor. Before we start — if you\'d rather not continue in English, or if you don\'t understand something, just tell me and I\'ll switch to your language. Hope you\'re doing well! Let\'s learn a bit about you — are you working right now, or are you a student?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'レッスン 1: 挨拶',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'メッセージを入力...',
			'previewChat.incoming1' => 'こんにちは！Lingolaへようこそ — 私があなたのAIチューターです。レベルは関係ありません。ここでは安心して英語を学べます。英語で「こんにちは」は \'Hi\' や \'Hello\' と言います — 試してみて、英語で \'Hi!\' と送ってください！',
			'previewChat.outgoing1' => 'こんにちは！練習する準備ができています。',
			'previewChat.incoming2Highlight' => 'おはよう',
			'previewChat.incoming2Rest' => '、エムラ！あなたが準備ができていると聞いて嬉しいです。朝のコーヒーは、つながりを築く素晴らしいスタートです。何について話したいですか？',
			'previewChat.holdToSpeak' => '話すには長押し',
			'previewChat.recording' => '録音中…送信するには離してください',
			'previewChat.slideUpToLock' => '上にスワイプしてロック',
			'previewChat.slideLeftToCancel' => '左にスワイプしてキャンセル',
			'previewChat.recordingLockedHint' => '終わったら送信をタップ',
			'paywall.title' => '今日から話し始めよう — 無料',
			'paywall.subtitle' => '無限の学習機会',
			'paywall.noCommitment' => '契約不要',
			'paywall.cancelAnytime' => 'いつでもキャンセル可能',
			'paywall.noPaymentToday' => '今日は支払いなし',
			'paywall.daysFree' => '3日間無料',
			'paywall.thenPrice' => 'その後は\$1.99/月',
			'paywall.trialActive' => '無料トライアル中',
			'paywall.payableToday' => '今日の支払い',
			'paywall.payableValue' => '3日間無料 0.00\$',
			'paywall.paymentDate' => '支払い日: 2026年3月13日',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => '多様なAIトレーナーたち',
			'auth.title' => '今日から新しい言語を話し始めよう',
			'auth.body' => 'AIとのリアルな会話を練習しよう。\nプレッシャーなし、ジャッジなし。',
			'auth.continueGoogle' => 'Googleで続ける',
			'auth.continueApple' => 'Appleで続ける',
			'auth.continueGuest' => 'ゲストとして続ける',
			'auth.or' => 'または',
			'auth.alreadyHaveAccount' => 'すでにアカウントをお持ちですか？',
			'auth.signIn' => 'ログイン',
			'auth.legal' => 'Lingolaにサインアップすることで、利用規約に同意したことになります。プライバシーポリシーとクッキーポリシーでデータの処理方法を学んでください。',
			'auth.terms' => '利用規約',
			'auth.privacy' => 'プライバシーポリシー',
			'auth.cookies' => 'クッキーポリシー',
			'nav.home' => 'ホーム',
			'nav.tutor' => 'チューター',
			'nav.lesson' => 'レッスン',
			'nav.rolePlay' => 'ロールプレイ',
			'nav.profile' => 'プロフィール',
			'home.streakCount' => '2',
			'home.greeting' => 'おはよう、Jhon',
			'home.todayPractice' => '今日の練習',
			'home.continueConversation' => '会話を続ける',
			'home.continueWithTutor' => ({required Object name}) => '${name} と続けますか？それとも別のチューターを選びますか？',
			'home.continueSameTutor' => ({required Object name}) => '${name} と続ける',
			'home.chooseOtherTutor' => '別のチューターを選ぶ',
			'home.minutesLeft' => ({required Object value}) => '残り ${value} 分',
			'home.lessonProgress' => 'レッスン2 — 挨拶',
			'home.timeCurrent' => '0分',
			'home.timeTotal' => '/ 15分',
			'home.kContinue' => '続ける',
			'home.learningPath' => 'A1 - スターター',
			'home.allLessons' => 'すべてのレッスン',
			'home.introductions' => '自己紹介 I',
			'home.greetings' => '挨拶',
			'home.jobs' => '仕事',
			'home.favoriteRoom' => 'お気に入りの部屋',
			'home.dailyRoutine' => '日常生活',
			'home.scroll' => 'スクロール',
			'home.liveLesson' => 'ライブレッスン',
			'home.liveLessonSubtitle' => '私たちのチューターとビデオ通話をしましょう',
			'home.moreTutor' => 'もっとチューター',
			'home.startTalkNow' => '今すぐ話し始める',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => '適応型',
			'home.tagCalm' => '落ち着いた',
			'home.tagPatient' => '忍耐強い',
			'home.tagMethodical' => '計画的',
			'home.tagEncouraging' => '励まし',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'もっと機能',
			'home.practiceLabel' => '練習',
			'home.wordPractice' => '単語練習',
			'home.wordPracticeBody' => '選んだ言語の語彙を毎日増やそう',
			'home.immersiveLabel' => '没入型',
			'home.quiz' => 'クイズ',
			'home.quizBodyLine1' => '実際の',
			'home.quizBodyLine2' => '文脈の例を通じて学ぶ',
			'home.getStarted' => '始める',
			'home.library' => 'ライブラリ',
			'home.libraryTitle' => '学び、保存する',
			'home.learnMore' => 'もっと学ぶ',
			'home.premium.titleBefore' => '流暢に話すための',
			'home.premium.titleHighlight' => '道',
			'home.premium.titleAfter' => 'ミスを恐れずに。',
			'home.premium.descriptionBefore' => '世界中の何百万もの学生に参加しよう。今日から言語の壁を打破しよう — ',
			'home.premium.descriptionHighlight' => '最初の3日間は完全無料。',
			'home.premium.feature1' => '24/7アクセス可能なAIチューター',
			'home.premium.feature2' => 'プライベートチューターへの無制限アクセス',
			'home.premium.feature3' => 'あなたに合わせた毎日のレッスンプラン',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/月',
			'home.premium.discount' => '年契約で40%オフ',
			'home.premium.cta' => '始める',
			'libraryPage.title' => 'ライブラリ',
			'libraryPage.searchWord' => '検索ワード',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} 保存した単語',
			'libraryPage.savedWordTab' => '保存した単語',
			'libraryPage.dictionaryTab' => '辞書',
			'libraryPage.dictionaryLabel' => '辞書',
			'wordPracticePage.title' => '単語練習',
			'wordPracticePage.turkish' => 'トルコ語',
			'wordPracticePage.save' => '保存する',
			'wordPracticePage.saved' => '保存済み',
			'wordPracticePage.listen' => '聞く',
			'wordPracticePage.hint' => 'ヒント',
			'wordPracticePage.previous' => '前へ',
			'wordPracticePage.next' => '次へ',
			'quizPage.title' => 'クイズ',
			'quizPage.headline' => '今日は何を改善したいですか？',
			'quizPage.subtitle' => 'トレーニングを選んで — 3分以内で終わります 🚀',
			'quizPage.readingTitle' => 'リーディング',
			'quizPage.readingBody' => '記事やストーリーを通じた理解',
			'quizPage.writingTitle' => 'ライティング',
			'quizPage.writingBody' => '文法と語彙の練習',
			'quizPage.speakingTitle' => 'スピーキング',
			'quizPage.speakingBody' => 'AI音声エンジンによる発音',
			'quizPage.readingTestTitle' => 'リーディングテスト',
			'quizPage.read' => '読む',
			'quizPage.listeningHint' => '英単語をはっきりと話してください…',
			'quizPage.micPermissionDenied' => 'マイクまたは音声認識が利用できません。',
			'quizPage.matchSuccess' => '素晴らしい！その単語と一致しました。',
			'quizPage.matchFail' => ({required Object heard}) => '"${heard}"が聞こえました。もう一度試してください。',
			'quizPage.successfulTitle' => '成功！',
			'quizPage.successfulBody' => 'ネイティブスピーカーのような発音！',
			'quizPage.failedTitle' => '失敗',
			'quizPage.failedBody' => 'ほぼできていました、もう一度チャンスを与えてください',
			'quizPage.tryAgain' => 'もう一度試す',
			'quizPage.writingTestTitle' => 'ライティングテスト',
			'quizPage.sourceLanguage' => 'ソース言語',
			'quizPage.answer' => '回答',
			'quizPage.writeAnswerHint' => 'ここにあなたの答えを書いてください...',
			'quizPage.submit' => '送信',
			'quizPage.speakingTestTitle' => 'スピーキングテスト',
			'quizPage.speakingProficiency' => 'スピーキング能力',
			'quizPage.speakClearlyHint' => 'マイクに向かってはっきり話してください：',
			'quizPage.speakUp' => '大きな声で話す',
			'quizPage.recording' => '録音中...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => '質問 ${current} / ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} が準備中です',
			'placeholder.body' => ({required Object tab}) => '${tab} のための集中した体験を準備しています。',
			'tutorPage.title' => 'チューター',
			'tutorPage.chatWithLingola' => 'Lingolaとチャット',
			'tutorPage.startChat' => 'Chat',
			'tutorPage.chatWithTutor' => ({required Object name}) => '${name}とチャット',
			'tutorPage.chatHistory' => 'チャット履歴',
			'tutorPage.history' => '履歴',
			'tutorPage.filter' => 'フィルター',
			'tutorPage.country' => '国',
			'tutorPage.focus' => 'フォーカス',
			'tutorPage.moreCountries' => '8カ国以上',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => '保存',
			'tutorPage.clearFilter' => 'フィルターを解除',
			'tutorPage.startTalkNow' => '今すぐ話し始める',
			'tutorPage.typeMessage' => 'メッセージを入力...',
			'tutorPage.speaker' => 'スピーカー',
			'tutorPage.messagesCount' => '12',
			'tutorPage.tutors.lingola' => 'Lingola',
			'tutorPage.tutors.zephyrion' => 'ゼファリオン',
			'tutorPage.tutors.vaelen' => 'ヴァエレン',
			'tutorPage.tutors.elrion' => 'エルリオン',
			'tutorPage.tutors.ukrath' => 'ウクラト',
			'tutorPage.tutors.elena' => 'エレナ',
			'tutorPage.tutors.kenji' => 'ケンジ',
			'tutorPage.tutors.freya' => 'フレイヤ',
			'tutorPage.tutors.camila' => 'カミラ',
			'tutorPage.tutors.marco' => 'マルコ',
			'tutorPage.tutors.julian' => 'ジュリアン',
			'tutorPage.tutors.ines' => 'イネス',
			'tutorPage.tutors.felix' => 'フェリックス',
			'tutorPage.tutors.diego' => 'ディエゴ',
			'tutorPage.tutors.amara' => 'アマラ',
			'tutorPage.tutors.erik' => 'エリック',
			'tutorPage.tutors.katie' => 'ケイティ',
			'tutorPage.tutors.morgan' => 'モーガン',
			'tutorPage.tutors.santa' => 'サンタクロース',
			'tutorPage.tags.adaptive' => '適応力がある',
			'tutorPage.tags.calm' => '落ち着いている',
			'tutorPage.tags.patient' => '忍耐強い',
			'tutorPage.tags.organized' => '整理整頓された',
			'tutorPage.tags.relaxed' => 'リラックスした',
			'tutorPage.tags.methodical' => '体系的な',
			'tutorPage.tags.attentive' => '注意深い',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => '好奇心旺盛',
			'tutorPage.tags.observer' => '観察者',
			'tutorPage.tags.ancientKnowledge' => '古代の知識',
			'tutorPage.tags.wise' => '賢い',
			'tutorPage.tags.clear' => '明確な',
			'tutorPage.tags.decisive' => '決断力がある',
			'tutorPage.tags.disciplined' => '規律正しい',
			'tutorPage.tags.smart' => '賢い',
			'tutorPage.tags.analytic' => '分析的',
			'tutorPage.tags.cheerful' => '陽気な',
			'tutorPage.tags.generous' => '寛大な',
			'tutorPage.historyPreview1' => 'やあ！退屈で爆発しそうだった...',
			'tutorPage.historyPreview2' => '今日は食べ物の注文を練習しようか？',
			'tutorPage.time1' => '午前11:00',
			'tutorPage.time2' => '昨日',
			'tutorPage.chat.incoming1' => 'おはよう！今日は練習する準備ができているのが嬉しいよ。',
			'tutorPage.chat.outgoing1' => 'うん、挨拶から始めよう。',
			'tutorPage.chat.incoming2' => '完璧。同僚にどうやって挨拶する？',
			'tutorPage.chat.typing' => '入力中',
			'tutorPage.calling.lessonBadge' => 'レッスン1 : 挨拶',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'レッスン ${number} : ${title}',
			'tutorPage.calling.nativeLine' => '退屈？',
			'tutorPage.calling.englishLine' => '退屈？その言葉は私の語彙から消したよ。立ち上がって、計画はもう決まってる：カディキョイの新しいアーケードバーに行くよ。',
			'tutorPage.calling.highlight' => '退屈？',
			'tutorPage.calling.close' => '通話を終了',
			'tutorPage.calling.toggleCaptions' => '字幕を切り替え',
			'tutorPage.calling.toggleHints' => 'ヒントを切り替え',
			'tutorPage.calling.toggleMic' => 'マイクを切り替え',
			'tutorPage.calling.tapToSpeakHint' => 'タップして話す、もう一度タップして終了',
			'lessonPage.title' => '学びを続ける',
			'lessonPage.profile' => 'プロフィール',
			'lessonPage.language' => '目標言語',
			'lessonPage.completed' => '完了',
			'lessonPage.locked' => 'ロック中',
			'lessonPage.pickTutorTitle' => 'チューターを選ぶ',
			'lessonPage.startTalk' => 'レッスンを始める',
			'lessonPage.chatInstead' => '代わりにチャットする',
			'lessonPage.lockedHint' => 'このレッスンを解除するには、前のレッスンを終わらせてください。',
			'lessonPage.levelLockedTitle' => 'レベル制限',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'あなたの英語レベルは${userLevel}のため、前のパスを完了せずに${lessonLevel}のレッスンは開けません。',
			'lessonPage.levelLockedOk' => 'わかりました',
			'lessonPage.notesTitle' => 'レッスンノート',
			'lessonPage.whatWeLearned' => '今日学んだこと',
			'lessonPage.deleteNotes' => 'レッスンノートを削除する',
			'lessonPage.deleteNotesConfirm' => 'これらのノートを削除しますか？これは元に戻せません。',
			'lessonPage.delete' => '削除',
			'lessonPage.cancel' => 'キャンセル',
			'lessonPage.practiceCta' => 'これが難しすぎた場合は、同じトピックを再度練習できます。',
			'lessonPage.practiceNow' => 'このトピックを練習する',
			'lessonPage.openChat' => 'チューターとのチャットを開く',
			'lessonPage.yourScore' => 'あなたのスコア',
			'lessonPage.bestScore' => ({required Object score}) => '最高 ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => '受動的参加者',
			'lessonPage.participationSilentBody' => '今回は静かでしたね。このレッスンを再受講した方がいいと思います。',
			'lessonPage.participationPassive' => '低い参加',
			'lessonPage.participationPassiveBody' => 'ほとんど話しませんでした。レッスンを再度試して、もっと話してみてください。',
			'lessonPage.participationActive' => '良い参加',
			'lessonPage.participationActiveBody' => '会話に参加しました。これを続けてください！',
			'lessonPage.participationStrong' => '強い参加',
			'lessonPage.participationStrongBody' => 'たくさん話しました。素晴らしい仕事です！',
			'lessonPage.retakeLesson' => 'このレッスンを再受講する',
			'lessonPage.finishLesson' => 'レッスンを終わらせる',
			'lessonPage.savingNotes' => 'あなたのチューターが今日のノートを書いています…',
			'lessonPage.noNotes' => 'このレッスンを終わらせて、チューターからのノートを受け取りましょう。',
			'lessonPage.notesDeleted' => 'レッスンノートが削除されました',
			'lessonPage.levels.a1.title' => 'A1 - スターター',
			'lessonPage.levels.a1.lessons.0' => '挨拶',
			'lessonPage.levels.a1.lessons.1' => '自己紹介 I',
			'lessonPage.levels.a1.lessons.2' => '仕事',
			'lessonPage.levels.a1.lessons.3' => 'お気に入りの部屋',
			'lessonPage.levels.a1.lessons.4' => '日常生活',
			'lessonPage.levels.a1.lessons.5' => '果物',
			'lessonPage.levels.a1.lessons.6' => 'アドバイス 1',
			'lessonPage.levels.a1.lessons.7' => '家族 1',
			'lessonPage.levels.a1.lessons.8' => '日常のもの',
			'lessonPage.levels.a1.lessons.9' => '故郷',
			'lessonPage.levels.a1.lessons.10' => '家',
			'lessonPage.levels.a1.lessons.11' => '食べ物の好み',
			'lessonPage.levels.a1.lessons.12' => '趣味 1',
			'lessonPage.levels.a1.lessons.13' => '成功した人々',
			'lessonPage.levels.a1.lessons.14' => '食べ物と飲み物',
			'lessonPage.levels.a1.lessons.15' => 'レストランでの注文',
			'lessonPage.levels.a1.lessons.16' => 'ペット',
			'lessonPage.levels.a1.lessons.17' => '健康とフィットネス',
			'lessonPage.levels.a1.lessons.18' => '天気',
			'lessonPage.levels.a1.lessons.19' => '新しいライフスタイル',
			'lessonPage.levels.a1.lessons.20' => '上達する',
			'lessonPage.levels.a1.lessons.21' => '趣味 2',
			'lessonPage.levels.a1.lessons.22' => '場所についての質問',
			'lessonPage.levels.a1.lessons.23' => '所有',
			'lessonPage.levels.a1.lessons.24' => '買い物 1',
			'lessonPage.levels.a1.lessons.25' => '時間を伝える',
			'lessonPage.levels.a1.lessons.26' => '道案内 1',
			'lessonPage.levels.a1.lessons.27' => '買い物 2',
			'lessonPage.levels.a1.lessons.28' => 'あなたを知る',
			'lessonPage.levels.a1.lessons.29' => '物の場所',
			'lessonPage.levels.a1.lessons.30' => '外見',
			'lessonPage.levels.a1.lessons.31' => '道案内 2',
			'lessonPage.levels.a2.title' => 'A2 - 基本',
			'lessonPage.levels.a2.lessons.0' => '家族 2',
			'lessonPage.levels.a2.lessons.1' => '人と場所',
			'lessonPage.levels.a2.lessons.2' => '家族 3',
			'lessonPage.levels.a2.lessons.3' => '物の説明',
			'lessonPage.levels.a2.lessons.4' => '都市',
			'lessonPage.levels.a2.lessons.5' => '建物プロジェクト',
			'lessonPage.levels.a2.lessons.6' => '我が家',
			'lessonPage.levels.a2.lessons.7' => '今何時？',
			'lessonPage.levels.a2.lessons.8' => '日常生活 2',
			'lessonPage.levels.a2.lessons.9' => '自由時間',
			'lessonPage.levels.a2.lessons.10' => '食べ物と栄養',
			'lessonPage.levels.a2.lessons.11' => 'ショッピングと消費者',
			'lessonPage.levels.a2.lessons.12' => '休日',
			'lessonPage.levels.a2.lessons.13' => '週末の計画',
			'lessonPage.levels.a2.lessons.14' => 'フォーマルかカジュアルか',
			'lessonPage.levels.a2.lessons.15' => 'ファッション',
			'lessonPage.levels.a2.lessons.16' => 'ショッピング 3',
			'lessonPage.levels.a2.lessons.17' => 'アドバイス 2',
			'lessonPage.levels.a2.lessons.18' => 'あなたならできる',
			'lessonPage.levels.a2.lessons.19' => 'ショッピング 4',
			'lessonPage.levels.a2.lessons.20' => '雑談',
			'lessonPage.levels.a2.lessons.21' => 'ラテを一杯ください',
			'lessonPage.levels.a2.lessons.22' => '食べ物',
			'lessonPage.levels.a2.lessons.23' => '移動手段',
			'lessonPage.levels.a2.lessons.24' => '旅行の準備',
			'lessonPage.levels.a2.lessons.25' => '旅行 1',
			'lessonPage.levels.a2.lessons.26' => '都市の逃避',
			'lessonPage.levels.a2.lessons.27' => '旅行 2',
			'lessonPage.levels.a2.lessons.28' => '宿泊場所',
			'lessonPage.levels.a2.lessons.29' => 'とてもワクワクする',
			'lessonPage.levels.a2.lessons.30' => '正しい人',
			'lessonPage.levels.a2.lessons.31' => '学校',
			'lessonPage.levels.a2.lessons.32' => '音楽の好み',
			'lessonPage.levels.a2.lessons.33' => 'スポーツ',
			'lessonPage.levels.a2.lessons.34' => 'レースのルール',
			'lessonPage.levels.a2.lessons.35' => 'メッセージを残す',
			'lessonPage.levels.a2.lessons.36' => 'リクエスト',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.a2.lessons.37' => '招待状',
			'lessonPage.levels.a2.lessons.38' => '旅行の経験',
			'lessonPage.levels.a2.lessons.39' => '過去形 1',
			'lessonPage.levels.a2.lessons.40' => '過去形 2',
			'lessonPage.levels.a2.lessons.41' => '過去形 3',
			'lessonPage.levels.a2.lessons.42' => '過去についての質問',
			'lessonPage.levels.a2.lessons.43' => '年齢は関係ない',
			'lessonPage.levels.a2.lessons.44' => '子供の頃の思い出',
			'lessonPage.levels.a2.lessons.45' => '褒め言葉',
			'lessonPage.levels.a2.lessons.46' => '言い訳',
			'lessonPage.levels.a2.lessons.47' => '本当にイライラする！',
			'lessonPage.levels.a2.lessons.48' => 'デジタルの世界',
			'lessonPage.levels.a2.lessons.49' => '仕事の生活',
			'lessonPage.levels.a2.lessons.50' => 'それは理解できなかった',
			'lessonPage.levels.a2.lessons.51' => '貯めるか使うか？',
			'lessonPage.levels.a2.lessons.52' => 'ごめんなさいと言う',
			'lessonPage.levels.b1.title' => 'B1 - 中級',
			'lessonPage.levels.b1.lessons.0' => '文化的伝統',
			'lessonPage.levels.b1.lessons.1' => '有名人',
			'lessonPage.levels.b1.lessons.2' => 'アートとクリエイティビティ',
			'lessonPage.levels.b1.lessons.3' => '未来の計画',
			'lessonPage.levels.b1.lessons.4' => 'イベントの計画',
			'lessonPage.levels.b1.lessons.5' => '目標と計画',
			'lessonPage.levels.b1.lessons.6' => '歴史的な出来事',
			'lessonPage.levels.b1.lessons.7' => 'テクノロジー',
			'lessonPage.levels.b1.lessons.8' => '決して',
			'lessonPage.levels.b1.lessons.9' => '何があるのか',
			'lessonPage.levels.b1.lessons.10' => '夢のバケーション',
			'lessonPage.levels.b1.lessons.11' => 'ソーシャルメディア',
			'lessonPage.levels.b1.lessons.12' => '本のおすすめ',
			'lessonPage.levels.b1.lessons.13' => 'そんな日',
			'lessonPage.levels.b1.lessons.14' => '特別な写真',
			'lessonPage.levels.b1.lessons.15' => '個人的な成果',
			'lessonPage.levels.b1.lessons.16' => 'お気に入りの映画',
			'lessonPage.levels.b1.lessons.17' => 'ニュース速報',
			'lessonPage.levels.b1.lessons.18' => '幸せ',
			'lessonPage.levels.b1.lessons.19' => '忙しい週',
			'lessonPage.levels.b1.lessons.20' => '私が育った場所',
			'lessonPage.levels.b1.lessons.21' => '学校の日々',
			'lessonPage.levels.b1.lessons.22' => 'プロフィール',
			'lessonPage.levels.b1.lessons.23' => 'ライフマップ',
			'lessonPage.levels.b1.lessons.24' => '日常',
			'lessonPage.levels.b1.lessons.25' => '次は何か',
			'lessonPage.levels.b1.lessons.26' => '提案作り',
			'lessonPage.levels.b1.lessons.27' => '何が起こったのか',
			'lessonPage.levels.b1.lessons.28' => '思い出',
			'lessonPage.levels.b1.lessons.29' => 'カルチャーショック',
			'lessonPage.levels.b1.lessons.30' => '興味のあるフレーズ',
			'lessonPage.levels.b1.lessons.31' => '就職面接',
			'lessonPage.levels.b1.lessons.32' => 'バケットリスト',
			'lessonPage.levels.b1.lessons.33' => '私の好きな街',
			'lessonPage.levels.b1.lessons.34' => 'インターネット世代',
			'lessonPage.levels.b1.lessons.35' => '人気ブランド',
			'lessonPage.levels.b1.lessons.36' => '意見のフレーズ',
			'lessonPage.levels.b1.lessons.37' => 'どう見えるか',
			'lessonPage.levels.b1.lessons.38' => '住空間',
			'lessonPage.levels.b1.lessons.39' => '健康的な食事',
			'lessonPage.levels.b1.lessons.40' => '珍しい趣味',
			'lessonPage.levels.b1.lessons.41' => '難しい選択',
			'lessonPage.levels.b1.lessons.42' => '行動を起こす',
			'lessonPage.levels.b1.lessons.43' => '新しいスキル',
			'lessonPage.levels.b1.lessons.44' => '苦情を言う',
			'lessonPage.levels.b1.lessons.45' => '教育',
			'lessonPage.levels.b1.lessons.46' => 'グリーンシティ',
			'lessonPage.levels.b1.lessons.47' => '仕事に何があるか',
			'lessonPage.levels.b1.lessons.48' => '個人的な挑戦',
			'lessonPage.levels.b1.lessons.49' => '面接のフレーズ',
			'lessonPage.levels.b1.lessons.50' => '丁寧な締めくくり',
			'lessonPage.levels.b1.lessons.51' => 'ヘッドラインニュース',
			'lessonPage.levels.b1.lessons.52' => '小さな変化',
			'lessonPage.levels.b1.lessons.53' => '謝罪の言い訳',
			'lessonPage.levels.b1.lessons.54' => '電話のマナー',
			'lessonPage.levels.b1.lessons.55' => 'お邪魔してすみません…',
			'lessonPage.levels.b1.lessons.56' => '苦情への返答',
			'lessonPage.levels.b2.title' => 'B2 - 上級中級',
			'lessonPage.levels.b2.lessons.0' => '個性',
			'lessonPage.levels.b2.lessons.1' => '素晴らしいリード',
			'lessonPage.levels.b2.lessons.2' => '健康的なライフスタイル',
			'lessonPage.levels.b2.lessons.3' => '真実とは？',
			'lessonPage.levels.b2.lessons.4' => '自己成長',
			'lessonPage.levels.b2.lessons.5' => '意見を言う',
			'lessonPage.levels.b2.lessons.6' => '演じる？',
			'lessonPage.levels.b2.lessons.7' => '覚えてる...',
			'lessonPage.levels.b2.lessons.8' => '社会的フィードバック',
			'lessonPage.levels.b2.lessons.9' => '犯罪現場',
			'lessonPage.levels.b2.lessons.10' => '丁寧なトラブル',
			'lessonPage.levels.b2.lessons.11' => '対立解決',
			'lessonPage.levels.b2.lessons.12' => '好きか嫌いか？',
			'lessonPage.levels.b2.lessons.13' => '環境問題',
			'lessonPage.levels.b2.lessons.14' => '解決できるよ',
			'lessonPage.levels.b2.lessons.15' => 'ミステリーと犯罪',
			'lessonPage.levels.b2.lessons.16' => '可能な未来',
			'lessonPage.levels.b2.lessons.17' => 'ビジネスプラン',
			'lessonPage.levels.b2.lessons.18' => '会議の決定',
			'lessonPage.levels.b2.lessons.19' => 'とても予測可能...',
			'lessonPage.levels.b2.lessons.20' => '仕事中',
			'lessonPage.levels.b2.lessons.21' => '科学と技術',
			'lessonPage.levels.b2.lessons.22' => '時間管理',
			'lessonPage.levels.b2.lessons.23' => '人権',
			'lessonPage.levels.c1.title' => 'C1 - 上級',
			'lessonPage.levels.c1.lessons.0' => '文化的規範',
			'lessonPage.levels.c1.lessons.1' => 'ソーシャルメディアの影響',
			'lessonPage.levels.c1.lessons.2' => 'キャリアの選択',
			'lessonPage.levels.c1.lessons.3' => 'パフォーマンスを加速する',
			'lessonPage.levels.c1.lessons.4' => '発明',
			'lessonPage.levels.c1.lessons.5' => 'タイムトラベル',
			'lessonPage.levels.c1.lessons.6' => '所有物',
			'lessonPage.levels.c1.lessons.7' => '仕事のスキル',
			'lessonPage.levels.c1.lessons.8' => '歴史的変化',
			'lessonPage.levels.c1.lessons.9' => 'レビューライティング',
			'lessonPage.levels.c1.lessons.10' => 'ミステリー',
			'lessonPage.levels.c1.lessons.11' => '奇妙な理論',
			'lessonPage.levels.c1.lessons.12' => 'セレブリティ',
			'lessonPage.levels.c1.lessons.13' => 'グローバル政治',
			'lessonPage.levels.c1.lessons.14' => '製品ブーム',
			'lessonPage.levels.c1.lessons.15' => '幸せになるのかな？',
			'lessonPage.levels.c1.lessons.16' => '後でかも...',
			'lessonPage.levels.c1.lessons.17' => '新しい解決策',
			'lessonPage.levels.c1.lessons.18' => '文脈的影響',
			'lessonPage.levels.c1.lessons.19' => '失われたロゴ',
			'lessonPage.levels.c1.lessons.20' => '親切な行為',
			'lessonPage.levels.c1.lessons.21' => 'なんて映画だ',
			'lessonPage.levels.c1.lessons.22' => 'うざいな',
			'lessonPage.levels.c1.lessons.23' => 'ニュースで',
			'lessonPage.levels.c2.title' => 'C2 - エキスパート',
			'lessonPage.levels.c2.lessons.0' => 'グローバリゼーション',
			'lessonPage.levels.c2.lessons.1' => '自然災害',
			'lessonPage.levels.c2.lessons.2' => '情報への反応',
			'lessonPage.levels.c2.lessons.3' => 'ワークライフバランス',
			'lessonPage.levels.c2.lessons.4' => 'リモートワーク',
			'lessonPage.levels.c2.lessons.5' => '家族の問題',
			'lessonPage.levels.c2.lessons.6' => '基本的な人体解剖学',
			'lessonPage.levels.c2.lessons.7' => '健康予測',
			'lessonPage.levels.c2.lessons.8' => '医療アクセス',
			'lessonPage.levels.c2.lessons.9' => 'グローバルな旅行体験',
			'lessonPage.levels.c2.lessons.10' => '超能力',
			'lessonPage.levels.c2.lessons.11' => 'チームビルディング',
			'lessonPage.levels.c2.lessons.12' => 'バイオ蛍光',
			'lessonPage.levels.c2.lessons.13' => 'ジレンマ',
			'lessonPage.levels.c2.lessons.14' => '社会的熱意',
			'lessonPage.levels.c2.lessons.15' => '変化',
			'lessonPage.levels.c2.lessons.16' => '働く、働く、働く',
			'lessonPage.levels.c2.lessons.17' => '地域の問題',
			'lessonPage.levels.c2.lessons.18' => '問題、問題',
			'lessonPage.levels.c2.lessons.19' => '事実かフィクションか？',
			'lessonPage.levels.c2.lessons.20' => '観光',
			'lessonPage.levels.c2.lessons.21' => 'ボランティア活動',
			'lessonPage.levels.c2.lessons.22' => '心の目',
			'lessonPage.levels.c2.lessons.23' => 'メディア消費',
			'rolePlayPage.title' => 'ロールプレイ',
			'rolePlayPage.subtitle' => '役割を選んで — 実際のシナリオを体験しよう 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} 完了',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} 分',
			'rolePlayPage.beginner' => '初心者',
			'rolePlayPage.screenplay' => 'シナリオ',
			'rolePlayPage.dailyInteractions' => '日常のやり取り',
			'rolePlayPage.business' => 'ビジネス',
			'rolePlayPage.coffee.title' => 'コーヒーショップでの注文',
			'rolePlayPage.coffee.screenplay' => 'お気に入りの飲み物を注文し、サイズやトッピングを尋ね、合計を確認して、カウンターでコーヒーを受け取ります。',
			'rolePlayPage.coffee.chat.briefing' => 'こんにちは！今日はコーヒーショップでの注文を練習します — こんにちは、サイズ、トッピング。最初に少し説明してから、演じますね。いいですか？',
			'rolePlayPage.coffee.chat.incoming1' => 'いらっしゃいませ！今日は何をお作りしましょうか？',
			'rolePlayPage.coffee.chat.outgoing1' => 'こんにちは！ミディアムラテをお願いします。',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'もちろん',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! ホットですか、それともアイスですか？トッピングはどうしますか？',
			'rolePlayPage.coffee.chat.botReply' => '素晴らしい選択ですね。他に何かご注文はありますか？',
			'rolePlayPage.directions.title' => '道を尋ねる',
			'rolePlayPage.directions.screenplay' => '場所への道を尋ね、地下鉄やバスの行き方を確認し、チケットの情報を得て、レストランのおすすめを聞きます。',
			'rolePlayPage.directions.chat.briefing' => 'こんにちは！今日は道を尋ねる練習をします。最初に少し説明してから、演じますね。いいですか？',
			'rolePlayPage.directions.chat.incoming1' => 'こんにちは！少し迷っているようですね — 何か探してますか？',
			'rolePlayPage.directions.chat.outgoing1' => 'はい、最寄りの地下鉄駅を探しています。',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'もちろん',
			'rolePlayPage.directions.chat.incoming2Rest' => '! あちらに2ブロック歩いて、左に曲がってください。入口が見えますよ。',
			'rolePlayPage.directions.chat.botReply' => 'どういたしまして！駅の近くのレストランのヒントも欲しいですか？',
			'rolePlayPage.interview.title' => '就職面接',
			'rolePlayPage.interview.screenplay' => '自己紹介をし、一般的な面接の質問に答え、経験について話し、役割や次のステップについて尋ねます。',
			'rolePlayPage.interview.chat.briefing' => 'こんにちは！今日は就職面接の練習をします。最初に少し説明してから、演じますね — 私があなたを面接して、その後交代します。いいですか？',
			'rolePlayPage.interview.chat.incoming1' => '今日はお越しいただきありがとうございます。簡単に自己紹介をしていただけますか？',
			'rolePlayPage.interview.chat.outgoing1' => 'もちろんです。ここに来られて嬉しく、自分の経験を共有できることにワクワクしています。',
			'rolePlayPage.interview.chat.incoming2Highlight' => '素晴らしい',
			'rolePlayPage.interview.chat.incoming2Rest' => 'ですね。最近誇りに思っているプロジェクトについて教えてください。',
			'rolePlayPage.interview.chat.botReply' => 'それは素晴らしいですね。この役割について何か質問はありますか？',
			'rolePlayPage.customScenarios' => 'Your scenarios',
			'rolePlayPage.createOwnScenario' => '自分のシナリオを作成！',
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
			'rolePlayPage.deleteFailed' => 'シナリオを削除できませんでした。もう一度お試しください。',
			'rolePlayPage.easy' => 'かんたん',
			'rolePlayPage.medium' => 'ふつう',
			'rolePlayPage.hard' => 'むずかしい',
			'rolePlayPage.filterAll' => 'すべて',
			'rolePlayPage.seeAll' => 'すべて見る',
			'rolePlayPage.lingolaRolePlay' => 'Lingola RolePlay',
			'rolePlayPage.shopping' => 'ショッピング',
			'rolePlayPage.flirting' => '恋愛トーク',
			'rolePlayPage.lifeInTheUs' => 'アメリカでの生活',
			'rolePlayPage.freeDiscussion' => 'フリートーク',
			'rolePlayPage.jobInterview' => '就職面接',
			'rolePlayPage.socialDynamics' => 'ソーシャル',
			'rolePlayPage.restaurant' => 'レストラン',
			'rolePlayPage.travel' => '旅行',
			'rolePlayPage.createFieldDifficulty' => '難易度',
			'rolePlayPage.flirtingMeet.title' => 'Meeting Someone New at a Café',
			'rolePlayPage.flirtingMeet.screenplay' => 'Strike up a friendly conversation, share a little about yourself, exchange interests, and decide whether to meet again.',
			'rolePlayPage.flirtingMeet.chat.briefing' => 'Hi! Today we\'ll practice a light flirting conversation at a café — hellos, compliments, and asking for a number. I\'ll explain first, then we\'ll role-play. Sound good?',
			'rolePlayPage.flirtingMeet.chat.incoming1' => 'Is this seat taken? The place is packed today.',
			'rolePlayPage.flirtingMeet.chat.outgoing1' => 'Oh, go ahead! I was just waiting for my coffee.',
			'rolePlayPage.flirtingMeet.chat.incoming2Highlight' => 'Thanks',
			'rolePlayPage.flirtingMeet.chat.incoming2Rest' => '! I\'m Alex, by the way. What brings you here?',
			'rolePlayPage.flirtingMeet.chat.botReply' => 'Nice to meet you. Do you come here often?',
			'rolePlayPage.freeTalkHobby.title' => 'Talking About Hobbies',
			'rolePlayPage.freeTalkHobby.screenplay' => 'Chat freely about free-time activities, ask follow-up questions, share preferences, and suggest trying something new together.',
			'rolePlayPage.freeTalkHobby.chat.briefing' => 'Hi! Today we\'ll practice free discussion about hobbies — asking, answering, and reacting naturally. I\'ll explain first, then we\'ll talk. Ready?',
			'rolePlayPage.freeTalkHobby.chat.incoming1' => 'So, what do you usually do on weekends?',
			'rolePlayPage.freeTalkHobby.chat.outgoing1' => 'I like hiking and watching films. How about you?',
			'rolePlayPage.freeTalkHobby.chat.incoming2Highlight' => 'Nice',
			'rolePlayPage.freeTalkHobby.chat.incoming2Rest' => '! I\'ve been meaning to try hiking more. Any favorite trails?',
			'rolePlayPage.freeTalkHobby.chat.botReply' => 'That sounds perfect. Want to go together sometime?',
			'notificationsPage.title' => '通知',
			'notificationsPage.deleteConfirmTitle' => 'よろしいですか？',
			'notificationsPage.deleteConfirmBody' => 'この通知は削除されます。',
			'notificationsPage.delete' => '削除',
			'notificationsPage.cancel' => 'キャンセル',
			'notificationsPage.translation.title' => '新しい翻訳が準備できました',
			'notificationsPage.translation.body' => 'あなたの音声翻訳ファイルはテキストに変換され、翻訳されました。',
			'notificationsPage.offer.title' => '特別オファーが待っています',
			'notificationsPage.offer.body' => 'プレミアムにアップグレードして、無制限の写真翻訳を50％オフで利用しましょう。',
			'notificationsPage.stories.title' => '新しいストーリーを発見しよう',
			'notificationsPage.stories.body' => 'ストーリーを通じて新しい単語を学びましょう',
			'notificationsPage.practice.title' => 'Your daily practice is waiting',
			'notificationsPage.practice.body' => 'Spend 5 minutes on a quick word, reading, or speaking exercise.',
			'notificationsPage.streak.title' => 'Keep your streak alive',
			'notificationsPage.streak.body' => 'A short session today protects your day streak and builds the habit.',
			'notificationsPage.premium.title' => 'Unlock all tutors & lessons',
			'notificationsPage.premium.body' => 'Go Premium for unlimited lessons, role-play scenarios, and AI tutors.',
			'notificationsPage.emptyTitle' => 'まだ通知はありません',
			'notificationsPage.emptySubtitle' => '通知を受け取ったら、もう一度確認するのを忘れないでください。',
			'profilePage.title' => 'プロフィール',
			'profilePage.userName' => 'ジョン・ドー',
			'profilePage.freeVersion' => '無料版',
			'profilePage.dayStreak' => '連続学習日数！',
			'profilePage.accountSettings' => 'アカウント設定',
			'profilePage.general' => '一般',
			'profilePage.profileSettings' => 'プロフィール設定',
			'profilePage.fullName' => 'フルネーム',
			'profilePage.email' => 'Eメール',
			'profilePage.deleteAccount' => 'アカウントを削除',
			'profilePage.save' => '保存',
			'profilePage.deleteTitle' => 'あなたが去るのは望んでいませんが、理解しています。',
			'profilePage.deleteBody' => 'Lingolaの体験を向上させるために、なぜ離れたいのか教えてもらえますか？',
			'profilePage.deleteReasons.aiCharacters' => 'AIキャラクターがリアルだとは思えませんでした。',
			'profilePage.deleteReasons.videoIssues' => 'ビデオチャットで技術的な問題が発生しています。',
			'profilePage.deleteReasons.pricing' => 'サブスクリプションの価格が期待以上です。',
			'profilePage.deleteReasons.noMatch' => '探しているスタイルのキャラクターが見つかりませんでした。',
			'profilePage.deleteReasons.shortTrial' => '短期間だけ試したかったです。',
			'profilePage.deleteReasons.other' => 'その他',
			'profilePage.messageOptional' => 'メッセージ（任意）',
			'profilePage.messageHint' => 'メッセージがあれば、ぜひ書いてください。',
			'profilePage.next' => '次へ',
			'profilePage.specialOfferTitle' => '特別オファー',
			'profilePage.specialOfferBody' => '去る前に、あなたのために用意したオファーをチェックしてください。',
			'profilePage.monthlyPlanTitle' => '1ヶ月プランに切り替え',
			'profilePage.monthlyPlanPrice' => '\$79/月、いつでもキャンセル可能',
			'profilePage.monthlyPlanDesc' => '長期契約は不要です。月ごとにコミュニティとつながり続けましょう。',
			'profilePage.whatYoullKeep' => '保持するもの:',
			'profilePage.keepCharacters' => 'すべてのキャラクターにアクセス',
			'profilePage.keepVideo' => '無制限のビデオ通話',
			'profilePage.keepCourses' => 'すべてのコースにアクセス',
			'profilePage.switchMonthlyCta' => '月額プランに切り替え',
			'profilePage.confirmTitle' => '本当に大丈夫ですか？',
			'profilePage.confirmBody' => 'あなたが去るのは本当に見たくありません。失うものはこれです:',
			'profilePage.loseCharacters' => '無制限のキャラクターアクセス',
			'profilePage.loseVideo' => '無制限のビデオ通話アクセス',
			'profilePage.loseCourses' => 'すべてのコースへのアクセス',
			'profilePage.discountTitle' => '留まって1ヶ月60%オフ',
			'profilePage.discountSubtitle' => '今までで最高のオファー。たったの\$27.60/月',
			'profilePage.acceptDiscountCta' => '60%オフを受け入れて留まる',
			'profilePage.farewellTitle' => 'あなたが去るのは悲しいです',
			'profilePage.farewellBody' => ({required Object date}) => 'あなたのメンバーシップはキャンセルされました。${date}まで現在の請求期間にアクセスできます。',
			'profilePage.changeMindTitle' => '✨ 気が変わった？',
			'profilePage.changeMindBody' => ({required Object date}) => 'あなたの特典を保持するために、${date}の前にいつでもメンバーシップを再アクティブ化できます。',
			'profilePage.reactivateCta' => '待って、再アクティブ化したい',
			'profilePage.done' => '完了',
			'profilePage.notifications' => '通知',
			'profilePage.appLanguage' => 'アプリ言語',
			'profilePage.explanationLanguage' => '説明の言語',
			'profilePage.explanationNative' => '母国語',
			'profilePage.explanationEnglish' => '英語',
			'profilePage.explanationUpdateFailed' => '説明の言語を更新できませんでした',
			'profilePage.learnInNativeLanguage' => '母国語で学ぶ',
			'profilePage.targetLanguageLabel' => '学習言語',
			'profilePage.languageLevel' => '言語レベル',
			'profilePage.nativeLanguage' => '母国語',
			'profilePage.interests' => '興味・関心',
			'profilePage.goalChipCareer' => 'キャリア',
			'profilePage.goalChipTravel' => '旅行',
			'profilePage.goalChipLiving' => '生活',
			'profilePage.goalChipStudying' => '勉強',
			'profilePage.goalChipOther' => 'その他',
			'profilePage.dailyGoal' => '毎日の目標',
			'profilePage.dailyReminder' => '毎日のリマインダー',
			'profilePage.selectNativeLanguageTitle' => '母国語を選択',
			'profilePage.reminderOn' => 'オン',
			'profilePage.reminderOff' => 'オフ',
			'profilePage.remindMe' => 'リマインダーを受け取る',
			'profilePage.reminderSave' => '保存',
			'profilePage.reminderSaved' => 'リマインダーを保存しました',
			'profilePage.selectLanguageTitle' => '言語を選択',
			'profilePage.premium' => 'プレミアム',
			'profilePage.passive' => 'パッシブ',
			'profilePage.active' => '有効',
			'profilePage.premiumVersion' => 'プレミアム',
			'profilePage.shareFriend' => '友達と共有',
			'profilePage.shareWithFriendTitle' => '友達と共有',
			'profilePage.shareInviteBody' => '友達を招待して、一緒に翻訳を楽しもう',
			'profilePage.rateUs' => '評価する',
			'profilePage.faq' => 'よくある質問',
			'profilePage.faqItems.supportedLanguages.question' => 'アプリはどの言語をサポートしていますか？',
			'profilePage.faqItems.supportedLanguages.answer' => 'Lingolaのインターフェースは、英語、ドイツ語、イタリア語、フランス語、トルコ語、日本語、スペイン語、ロシア語、ヒンディー語、ポルトガル語、簡体字中国語で利用できます。',
			'profilePage.faqItems.howAiWorks.question' => 'AIはどのように機能しますか？',
			'profilePage.faqItems.howAiWorks.answer' => 'AIは本物のチューターのようにあなたと対話します。会話を分析し、間違いを検出し、進捗に基づいてパーソナライズされたフィードバックを提供します。',
			'profilePage.faqItems.offlineUse.question' => 'アプリをオフラインで使用できますか？',
			'profilePage.faqItems.offlineUse.answer' => 'はい。特定のレッスンや会話シナリオを事前にダウンロードしてオフラインで使用できます。ただし、ライブチャットにはインターネット接続が必要です。',
			'profilePage.faqItems.isFree.question' => 'アプリは無料ですか？',
			'profilePage.faqItems.isFree.answer' => '基本版は無料です。プレミアムにすると、高度なチャットシナリオ、発音分析、個人チューターモードが利用できます。',
			'profilePage.faqItems.pronunciationEval.question' => '私の発音はどのように評価されますか？',
			'profilePage.faqItems.pronunciationEval.answer' => 'アプリはあなたの声を分析し、AIによる音声認識を使用してアクセントと発音をスコアリングします。改善が必要な単語がハイライトされます。',
			'profilePage.faqItems.dailyPractice.question' => '毎日練習する必要がありますか？',
			'profilePage.faqItems.dailyPractice.answer' => 'はい。システムは毎日あなたの進捗を追跡します。1日10〜15分のスピーキング練習で、言語学習が明らかに加速します。',
			'profilePage.faqItems.levelDetermination.question' => '私の学習レベルはどのように決定されますか？',
			'profilePage.faqItems.levelDetermination.answer' => '最初にサインインしたときの短いレベルチェックで、現在の知識を分析します。その後、AIが自動的にあなたのレベルに合ったレッスンを推薦します。',
			'profilePage.faqItems.realPeopleChat.question' => '本物の人と話すことはできますか？',
			'profilePage.faqItems.realPeopleChat.answer' => 'はい。プレミアムユーザーは、本物のチューターとの短い練習セッションをスケジュールできます。',
			'profilePage.faqItems.dataSecurity.question' => '私のデータは安全ですか？',
			'profilePage.faqItems.dataSecurity.answer' => 'もちろんです。すべての会話とユーザーデータは暗号化されて保存されます。あなたの個人情報は第三者と共有されることはありません。',
			'profilePage.faqItems.disableReminders.question' => '毎日のリマインダーをオフにするにはどうすればいいですか？',
			'profilePage.faqItems.disableReminders.answer' => 'プロフィール設定に移動し、通知を開いてリマインダーの頻度を変更するか、通知を完全にオフにします。',
			'profilePage.support' => 'サポート',
			'profilePage.feedback' => 'フィードバック',
			'profilePage.progression' => '進捗',
			'profilePage.progressTitle' => '進捗',
			'profilePage.goodMorning' => 'おはようございます、',
			'profilePage.progressUserName' => 'ジョン',
			'profilePage.progressLanguage' => '英語',
			'profilePage.past7Days' => '過去7日間',
			'profilePage.past7DaysBody' => '毎日勉強して連続学習日数を築き、強力な学習習慣を作りましょう。',
			'profilePage.currentLevel' => '現在のレベル',
			'profilePage.xpLeft' => ({required Object level, required Object xp}) => '${level}に到達するまで、あと${xp} XPです！',
			'profilePage.toNextLevel' => '次のレベルへ',
			'profilePage.dayStreakLabel' => '連続学習日数',
			'profilePage.totalPoints' => '合計ポイント',
			'profilePage.savedWords' => '保存した単語',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} 件のレビューアイテム',
			'profilePage.logout' => 'ログアウト',
			'profilePage.logoutTitle' => 'ログアウトしてもよろしいですか？',
			'profilePage.logoutBody' => 'またすぐにお会いしましょう！あなたの呼吸エクササイズが恋しいです。',
			'profilePage.logoutConfirm' => 'ログアウト',
			'profilePage.logoutCancel' => 'キャンセル',
			'profilePage.days.mon' => '月',
			'profilePage.days.tue' => '火',
			'profilePage.days.wed' => '水',
			'profilePage.days.thu' => '木',
			'profilePage.days.fri' => '金',
			'profilePage.days.sat' => '土',
			'profilePage.days.sun' => '日',
			'profilePage.profileSaved' => 'プロフィールを保存しました',
			'profilePage.profilePhotoUpdated' => 'プロフィール写真を更新しました',
			'profilePage.nameCannotBeEmpty' => '名前を入力してください',
			'profilePage.profileSaveFailed' => 'プロフィールを保存できませんでした',
			'profilePage.photoUploadFailed' => '写真のアップロードに失敗しました',
			'profilePage.notificationsUpdateFailed' => '通知を更新できませんでした',
			'profilePage.notificationsPermissionDenied' => '学習リマインダーを受け取るには、端末の設定で通知を許可してください。',
			'profilePage.certificateTitle' => 'あなたの証明書',
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
			'profilePage.certificateVerifyHint' => 'QRコードをスキャンすれば、誰でも成果を確認できます。',
			'profilePage.certificateShare' => '証明書を共有',
			'profilePage.certificateDownload' => 'Download',
			'profilePage.certificateDownloadSaved' => 'Certificate saved to your gallery',
			'profilePage.certificateDownloadFailed' => 'Could not save certificate. Please try again.',
			'profilePage.certificateCreateQr' => 'Create QR',
			'profilePage.certificateNotAvailableTitle' => '証明書はロック中',
			'profilePage.certificateNotAvailable' => ({required Object level}) => '${level}のレッスンをまだ完了していないため、この証明書はまだ利用できません。',
			'profilePage.certificateNotAvailableOk' => 'わかりました',
			'profilePage.certificateShareQr' => 'QRコードを共有',
			'profilePage.certificateShareBody' => ({required Object level}) => 'I earned my Lingola ${level} certificate!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Certificate',
			'profilePage.certificateProvidedBy' => 'Certificate provided by',
			'profilePage.certificatePreviewBody' => 'LingolaでCEFRレベルを完了すると、お名前・レベル・確認用QRコード付きの証明書がここに表示されます。',
			'profilePage.certificatePreviewHint' => 'レベルコースを完了して証明書を解除しましょう',
			'profilePage.certificateTapToView' => 'タップして証明書を表示・共有',
			'profilePage.settings' => '設定',
			'profilePage.dailyGoalValueLight' => '1日5-10分',
			'profilePage.dailyGoalValueRecommended' => '1日15-20分',
			'profilePage.dailyGoalValueFast' => '1日30分以上',
			'profilePage.settingsShare' => '共有',
			'profilePage.settingsSupport' => 'サポート',
			'profilePage.settingsAbout' => '情報',
			'profilePage.settingsAccount' => 'アカウント',
			'profilePage.followInstagram' => 'Instagramでフォロー',
			'profilePage.followTikTok' => 'TikTokでフォロー',
			'profilePage.chineseShort' => '中国語',
			'profilePage.seeMore' => 'もっと見る...',
			'profilePage.searchLanguages' => '検索',
			'profilePage.shareLingola' => 'Lingolaをシェア',
			'profilePage.settingsCertificates' => '証明書',
			'profilePage.restorePurchases' => '購入を復元',
			'profilePage.aboutFlywork' => 'Flyworkについて',
			'profilePage.faqHelp' => 'よくある質問とヘルプ',
			_ => null,
		} ?? switch (path) {
			'profilePage.deleteAccountAndData' => 'アカウントとデータを削除',
			'profilePage.interestShopping' => 'ショッピング',
			'profilePage.interestFood' => '食事',
			'profilePage.interestPopCulture' => 'ポップカルチャー',
			'profilePage.interestFilm' => '映画',
			'profilePage.interestMusic' => '音楽',
			'profilePage.interestSport' => 'スポーツ',
			'profilePage.interestTechnology' => 'テクノロジー',
			'profilePage.interestScience' => '科学',
			'profilePage.interestHealth' => '健康',
			'profilePage.interestFashion' => 'ファッション',
			'profilePage.interestArt' => 'アート',
			'profilePage.interestLiterature' => '文学',
			'profilePage.interestHistory' => '歴史',
			'profilePage.interestCulture' => '文化',
			'profilePage.interestAstronomy' => '天文学',
			'profilePage.interestPet' => 'ペット',
			'profilePage.interestSocialMedia' => 'ソーシャルメディア',
			'profilePage.interestEntrepreneur' => '起業',
			'profilePage.confirmDeleteWarning' => 'アカウントとすべての進捗が完全に削除されます。この操作は元に戻せません。',
			'profilePage.confirmKeepGoing' => '進捗をあきらめない',
			'profilePage.myCertificates' => 'マイ証明書',
			'profilePage.certificatesEmptyTitle' => 'まだ証明書はありません',
			'profilePage.certificatesEmptySubtitle' => 'レベルを完了したら、もう一度確認してください。',
			'profilePage.restorePurchasesSuccess' => '購入が復元されました。',
			'profilePage.restorePurchasesEmpty' => 'このアカウントに有効な購入は見つかりませんでした。',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'ちょっとした休憩を取ったようですね。',
			'pushNotifications.h2.1' => '一言の時間はありますか？',
			'pushNotifications.h2.2' => '私たちはここにいます — 焦らずに。',
			'pushNotifications.h2.3' => '学習のリズムが少し止まりましたね。',
			'pushNotifications.h2.4' => 'ミニレビューをしてみると気持ちが良いかもしれません。',
			'pushNotifications.h4.0' => '今日は新しい言葉が待っているかもしれません 👀',
			'pushNotifications.h4.1' => 'ちょっとした練習ができるかもしれません。',
			'pushNotifications.h4.2' => '役立つフレーズを見逃したかもしれません。',
			'pushNotifications.h4.3' => '今日の進捗はまだ開いています。',
			'pushNotifications.h4.4' => '一言、一文…もしかしたら両方。',
			'pushNotifications.h8.0' => '毎日進む必要はありません。',
			'pushNotifications.h8.1' => '少しのレビューも大切です。',
			'pushNotifications.h8.2' => '今日は勉強しなくても何も失いませんでした。',
			'pushNotifications.h8.3' => 'あなたの準備ができたら、私たちも準備万端です。',
			'pushNotifications.h8.4' => '言語学習はマラソンです、スプリントではありません。',
			'pushNotifications.h24.0' => '1日が過ぎました。あなたの言葉はまだここにあります。',
			'pushNotifications.h24.1' => '休憩を取るのは普通のことです。',
			'pushNotifications.h24.2' => 'あなたの場所は、あなたが離れたところにそのままです。',
			'pushNotifications.h24.3' => 'いつでも続けてください。',
			'pushNotifications.h24.4' => '言語は逃げません — 私たちも逃げません。',
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
