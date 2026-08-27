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
class TranslationsZh with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$zh app = _Translations$app$zh._(_root);
	@override late final _Translations$common$zh common = _Translations$common$zh._(_root);
	@override late final _Translations$onboarding$zh onboarding = _Translations$onboarding$zh._(_root);
	@override late final _Translations$targetLanguage$zh targetLanguage = _Translations$targetLanguage$zh._(_root);
	@override late final _Translations$language$zh language = _Translations$language$zh._(_root);
	@override late final _Translations$setup$zh setup = _Translations$setup$zh._(_root);
	@override late final _Translations$accountCreating$zh accountCreating = _Translations$accountCreating$zh._(_root);
	@override late final _Translations$previewChat$zh previewChat = _Translations$previewChat$zh._(_root);
	@override late final _Translations$paywall$zh paywall = _Translations$paywall$zh._(_root);
	@override late final _Translations$auth$zh auth = _Translations$auth$zh._(_root);
	@override late final _Translations$nav$zh nav = _Translations$nav$zh._(_root);
	@override late final _Translations$home$zh home = _Translations$home$zh._(_root);
	@override late final _Translations$libraryPage$zh libraryPage = _Translations$libraryPage$zh._(_root);
	@override late final _Translations$wordPracticePage$zh wordPracticePage = _Translations$wordPracticePage$zh._(_root);
	@override late final _Translations$quizPage$zh quizPage = _Translations$quizPage$zh._(_root);
	@override late final _Translations$placeholder$zh placeholder = _Translations$placeholder$zh._(_root);
	@override late final _Translations$tutorPage$zh tutorPage = _Translations$tutorPage$zh._(_root);
	@override late final _Translations$lessonPage$zh lessonPage = _Translations$lessonPage$zh._(_root);
	@override late final _Translations$rolePlayPage$zh rolePlayPage = _Translations$rolePlayPage$zh._(_root);
	@override late final _Translations$notificationsPage$zh notificationsPage = _Translations$notificationsPage$zh._(_root);
	@override late final _Translations$profilePage$zh profilePage = _Translations$profilePage$zh._(_root);
	@override late final _Translations$pushNotifications$zh pushNotifications = _Translations$pushNotifications$zh._(_root);
}

// Path: app
class _Translations$app$zh implements Translations$app$en {
	_Translations$app$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => '高级';
	@override String get notifications => '通知';
	@override String get streak => '学习连续天数';
	@override String get profile => '个人资料';
}

// Path: common
class _Translations$common$zh implements Translations$common$en {
	_Translations$common$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => '继续';
	@override String get back => '返回';
	@override String get locked => '已锁定';
	@override String minutes({required Object value}) => '${value} 分钟';
	@override String get close => '关闭';
	@override String get getStarted => '开始使用';
	@override String get connectionError => '没有连接。检查你的互联网并重试。';
	@override String get genericError => '出了点问题。请再试一次。';
	@override String get tryAgain => '再试一次';
}

// Path: onboarding
class _Translations$onboarding$zh implements Translations$onboarding$en {
	_Translations$onboarding$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => '引导页面 ${current} / ${total}';
	@override late final _Translations$onboarding$slide1$zh slide1 = _Translations$onboarding$slide1$zh._(_root);
	@override late final _Translations$onboarding$slide2$zh slide2 = _Translations$onboarding$slide2$zh._(_root);
	@override late final _Translations$onboarding$slide3$zh slide3 = _Translations$onboarding$slide3$zh._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$zh implements Translations$targetLanguage$en {
	_Translations$targetLanguage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '选择你想学习的语言';
	@override String get comingSoon => '更多语言即将推出';
	@override String get korean => '韩语';
	@override String get portuguese => '葡萄牙语';
	@override String get portugueseBrazil => '葡萄牙语（巴西）';
	@override String get german => '德语';
	@override String get italian => '意大利语';
	@override String get simplifiedChinese => '简体中文';
	@override String get arabic => '阿拉伯语';
	@override String get turkish => '土耳其语';
	@override String get hindi => '印地语';
}

// Path: language
class _Translations$language$zh implements Translations$language$en {
	_Translations$language$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String step({required Object current, required Object total}) => '第 ${current} 步，共 ${total} 步';
	@override String get title => '你想说什么？';
	@override String get nativeSection => '我会说';
	@override String get nativeField => '母语';
	@override String get nativeName => '土耳其语';
	@override String get targetSection => '我想学习';
	@override String get targetField => '目标语言';
	@override String get targetName => '英语';
	@override String get direction => '语言方向';
	@override String get selectLanguage => '选择语言';
	@override String get comingSoonBadge => '敬请期待...';
	@override String get english => '英语';
	@override String get french => '法语';
	@override String get japanese => '日语';
	@override String get spanish => '西班牙语';
	@override String get russian => '俄语';
}

// Path: setup
class _Translations$setup$zh implements Translations$setup$en {
	_Translations$setup$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => '你的目标是什么？';
	@override String get goalCareer => '职业发展';
	@override String get goalTravel => '旅行';
	@override String get goalLiving => '海外生活';
	@override String get goalStudying => '留学';
	@override String get goalOther => '其他';
	@override String get levelTitle => '你目前的语言水平是什么？';
	@override String get levelBeginner => '初学者 — 我知道一些单词';
	@override String get levelIntermediate => '中级 — 我能进行简单对话';
	@override String get levelAdvanced => '高级 — 我会说但想要提高';
	@override String get paceTitle => '你想多快提高？';
	@override String get paceLight => '每天5-10分钟（轻松）';
	@override String get paceRecommended => '每天15-20分钟（推荐）';
	@override String get paceFast => '每天30分钟以上（快速见效）';
}

// Path: accountCreating
class _Translations$accountCreating$zh implements Translations$accountCreating$en {
	_Translations$accountCreating$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '正在创建您的个人账户';
	@override String get stepContent => '内容正在创建中';
	@override String get stepDialogues => '对话正在准备中';
	@override String get stepLessons => '课程正在优化中';
	@override String get stepPlan => '您的计划正在最终确定';
	@override String get optimization => '优化中';
	@override String progress({required Object value}) => '${value}%';
}

// Path: previewChat
class _Translations$previewChat$zh implements Translations$previewChat$en {
	_Translations$previewChat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => '课程 1：问候';
	@override String get speed => '1x';
	@override String get typeMessage => '输入消息...';
	@override String get incoming1 => '嗨！欢迎来到 Lingola — 我是你的 AI 导师。准备好用英语打个招呼吗？';
	@override String get outgoing1 => '嗨！我准备好练习了。';
	@override String get incoming2Highlight => '早上好';
	@override String get incoming2Rest => '，Emrah！我很高兴你准备好了。早上的咖啡总是建立联系的好开始。你想聊些什么？';
	@override String get holdToSpeak => '按住说话';
	@override String get recording => '录音中… 松开发送';
	@override String get slideUpToLock => '上滑锁定';
	@override String get slideLeftToCancel => '左滑取消';
	@override String get recordingLockedHint => '完成后点击发送';
}

// Path: paywall
class _Translations$paywall$zh implements Translations$paywall$en {
	_Translations$paywall$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '今天开始说话 — 免费';
	@override String get subtitle => '无限学习机会';
	@override String get noCommitment => '无任何承诺';
	@override String get cancelAnytime => '随时取消';
	@override String get noPaymentToday => '今天无需付款';
	@override String get daysFree => '免费3天';
	@override String get thenPrice => '然后是 \$1.99/月';
	@override String get trialActive => '免费试用中';
	@override String get payableToday => '今天需付款';
	@override String get payableValue => '3天免费 0.00\$';
	@override String get paymentDate => '付款日期：2026年3月13日';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$zh implements Translations$auth$en {
	_Translations$auth$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => '我们多样化的AI教练';
	@override String get title => '今天开始说一种新语言';
	@override String get body => '与AI练习真实对话。\n没有压力，没有评判。';
	@override String get continueGoogle => '继续使用Google';
	@override String get continueApple => '继续使用Apple';
	@override String get continueGuest => '作为访客继续';
	@override String get legal => '通过注册Lingola，您同意我们的服务条款。了解我们如何处理您的数据，请查看我们的隐私政策和Cookies政策';
	@override String get terms => '服务条款';
	@override String get privacy => '隐私政策';
	@override String get cookies => 'Cookies政策';
}

// Path: nav
class _Translations$nav$zh implements Translations$nav$en {
	_Translations$nav$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get tutor => '导师';
	@override String get lesson => '课程';
	@override String get rolePlay => '角色扮演';
	@override String get profile => '个人资料';
}

// Path: home
class _Translations$home$zh implements Translations$home$en {
	_Translations$home$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => '早上好，Jhon';
	@override String get todayPractice => '今天的练习';
	@override String get continueConversation => '继续对话';
	@override String continueWithTutor({required Object name}) => '继续与${name}练习，还是换一位导师？';
	@override String continueSameTutor({required Object name}) => '继续与${name}练习';
	@override String get chooseOtherTutor => '选择其他导师';
	@override String minutesLeft({required Object value}) => '剩余 ${value} 分钟';
	@override String get lessonProgress => '课程 2 — 问候';
	@override String get timeCurrent => '0分钟';
	@override String get timeTotal => '/ 15分钟';
	@override String get kContinue => '继续';
	@override String get learningPath => 'A1 - 入门';
	@override String get allLessons => '所有课程';
	@override String get introductions => '自我介绍 I';
	@override String get greetings => '问候';
	@override String get jobs => '职业';
	@override String get favoriteRoom => '最喜欢的房间';
	@override String get dailyRoutine => '日常活动';
	@override String get scroll => '滚动';
	@override String get liveLesson => '直播课程';
	@override String get liveLessonSubtitle => '与我们的导师视频通话';
	@override String get moreTutor => '更多导师';
	@override String get startTalkNow => '立即开始对话';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => '梅琳';
	@override String get tutorKate => '凯特';
	@override String get tagAdaptive => '适应性';
	@override String get tagCalm => '冷静';
	@override String get tagPatient => '耐心';
	@override String get tagMethodical => '有条理';
	@override String get tagEncouraging => '鼓励';
	@override String get tagMore => '+5';
	@override String get moreFeatures => '更多功能';
	@override String get practiceLabel => '练习';
	@override String get wordPractice => '单词练习';
	@override String get wordPracticeBody => '每天在你选择的语言中扩展词汇量';
	@override String get immersiveLabel => '沉浸式';
	@override String get quiz => '测验';
	@override String get quizBodyLine1 => '通过真实的';
	@override String get quizBodyLine2 => '上下文示例学习';
	@override String get getStarted => '开始';
	@override String get library => '图书馆';
	@override String get libraryTitle => '学习与保存';
	@override String get learnMore => '了解更多';
	@override late final _Translations$home$premium$zh premium = _Translations$home$premium$zh._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$zh implements Translations$libraryPage$en {
	_Translations$libraryPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '图书馆';
	@override String get searchWord => '搜索词';
	@override String savedWordCount({required Object count}) => '${count} 个保存的词';
	@override String get savedWordTab => '保存的词';
	@override String get dictionaryTab => '词典';
	@override String get dictionaryLabel => '词典';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$zh implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '单词练习';
	@override String get turkish => '土耳其语';
	@override String get save => '保存';
	@override String get saved => '已保存';
	@override String get listen => '听';
	@override String get hint => '提示';
	@override String get previous => '上一个';
	@override String get next => '下一个';
}

// Path: quizPage
class _Translations$quizPage$zh implements Translations$quizPage$en {
	_Translations$quizPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '测验';
	@override String get headline => '你今天想提高什么？';
	@override String get subtitle => '选择你的训练 — 不到 3 分钟 🚀';
	@override String get readingTitle => '阅读';
	@override String get readingBody => '通过文章和故事理解';
	@override String get writingTitle => '写作';
	@override String get writingBody => '语法和词汇练习';
	@override String get speakingTitle => '口语';
	@override String get speakingBody => '通过 AI 语音引擎发音';
	@override String get readingTestTitle => '阅读测试';
	@override String get read => '阅读';
	@override String get listeningHint => '清晰地说出英文单词……';
	@override String get micPermissionDenied => '麦克风或语音识别不可用。';
	@override String get matchSuccess => '太棒了！这和单词匹配。';
	@override String matchFail({required Object heard}) => '听到 "${heard}"。再试一次。';
	@override String get successfulTitle => '成功！';
	@override String get successfulBody => '发音像母语者一样！';
	@override String get failedTitle => '失败';
	@override String get failedBody => '差一点就成功了，再给它一次机会';
	@override String get tryAgain => '再试一次';
	@override String get writingTestTitle => '写作测试';
	@override String get sourceLanguage => '源语言';
	@override String get answer => '答案';
	@override String get writeAnswerHint => '在这里写下你的答案……';
	@override String get submit => '提交';
	@override String get speakingTestTitle => '口语测试';
	@override String get speakingProficiency => '口语水平';
	@override String get speakClearlyHint => '清晰地对着麦克风说：';
	@override String get speakUp => '大声说';
	@override String get recording => '录音中……';
	@override String questionOf({required Object current, required Object total}) => '第 ${current} 题，共 ${total} 题';
}

// Path: placeholder
class _Translations$placeholder$zh implements Translations$placeholder$en {
	_Translations$placeholder$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} 正在路上';
	@override String body({required Object tab}) => '我们正在为你准备一个专注的 ${tab} 体验。';
}

// Path: tutorPage
class _Translations$tutorPage$zh implements Translations$tutorPage$en {
	_Translations$tutorPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '导师';
	@override String get chatWithLingola => '与Lingola聊天';
	@override String chatWithTutor({required Object name}) => '与${name}聊天';
	@override String get chatHistory => '聊天记录';
	@override String get history => '历史';
	@override String get filter => '筛选';
	@override String get country => '国家';
	@override String get focus => '重点';
	@override String get moreCountries => '还有8个+';
	@override String get moreFocus => '+8';
	@override String get save => '保存';
	@override String get startTalkNow => '立即开始聊天';
	@override String get typeMessage => '输入消息...';
	@override String get speaker => '发言者';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$zh tutors = _Translations$tutorPage$tutors$zh._(_root);
	@override late final _Translations$tutorPage$tags$zh tags = _Translations$tutorPage$tags$zh._(_root);
	@override String get historyPreview1 => '嘿！我快无聊死了...';
	@override String get historyPreview2 => '今天我们来练习点餐吧？';
	@override String get time1 => '上午11:00';
	@override String get time2 => '昨天';
	@override late final _Translations$tutorPage$chat$zh chat = _Translations$tutorPage$chat$zh._(_root);
	@override late final _Translations$tutorPage$calling$zh calling = _Translations$tutorPage$calling$zh._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$zh implements Translations$lessonPage$en {
	_Translations$lessonPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '继续学习';
	@override String get profile => '个人资料';
	@override String get language => '目标语言';
	@override String get completed => '已完成';
	@override String get locked => '已锁定';
	@override String get pickTutorTitle => '选择你的导师';
	@override String get startTalk => '开始课程';
	@override String get chatInstead => '改为聊天';
	@override String get lockedHint => '完成上一节课以解锁这一节。';
	@override String get levelLockedTitle => '等级锁定';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => '你的英语水平是${userLevel}，因此在完成前面的路径之前无法打开${lessonLevel}课程。';
	@override String get levelLockedOk => '知道了';
	@override String get notesTitle => '课程笔记';
	@override String get whatWeLearned => '我们今天学到了什么';
	@override String get deleteNotes => '删除我的课程笔记';
	@override String get deleteNotesConfirm => '确定要删除这些笔记吗？此操作无法撤销。';
	@override String get delete => '删除';
	@override String get cancel => '取消';
	@override String get practiceCta => '如果觉得太难，可以再练习一次相同的话题。';
	@override String get practiceNow => '练习这个话题';
	@override String get openChat => '与导师打开聊天';
	@override String get yourScore => '你的分数';
	@override String bestScore({required Object score}) => '最佳 ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => '被动参与者';
	@override String get participationSilentBody => '这次你保持沉默。我觉得你应该重修这节课。';
	@override String get participationPassive => '参与度低';
	@override String get participationPassiveBody => '你几乎没有发言。再试一次这节课，多说几句。';
	@override String get participationActive => '参与度良好';
	@override String get participationActiveBody => '你参与了对话。继续保持！';
	@override String get participationStrong => '参与度强';
	@override String get participationStrongBody => '你说了很多。干得好！';
	@override String get retakeLesson => '重修这节课';
	@override String get finishLesson => '完成课程';
	@override String get savingNotes => '你的导师正在写今天的笔记……';
	@override String get noNotes => '完成这节课以获取导师的笔记。';
	@override String get notesDeleted => '课程笔记已删除';
	@override late final _Translations$lessonPage$levels$zh levels = _Translations$lessonPage$levels$zh._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$zh implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '角色扮演';
	@override String get subtitle => '选择你的角色 — 体验真实场景 🎭';
	@override String progressCompleted({required Object value}) => '%${value} 完成';
	@override String minutes({required Object value}) => '${value} 分钟';
	@override String get beginner => '初学者';
	@override String get screenplay => '剧本';
	@override String get dailyInteractions => '日常互动';
	@override String get business => '商务';
	@override late final _Translations$rolePlayPage$coffee$zh coffee = _Translations$rolePlayPage$coffee$zh._(_root);
	@override late final _Translations$rolePlayPage$directions$zh directions = _Translations$rolePlayPage$directions$zh._(_root);
	@override late final _Translations$rolePlayPage$interview$zh interview = _Translations$rolePlayPage$interview$zh._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$zh implements Translations$notificationsPage$en {
	_Translations$notificationsPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '通知';
	@override String get deleteConfirmTitle => '确定吗？';
	@override String get deleteConfirmBody => '此通知将被删除。';
	@override String get delete => '删除';
	@override String get cancel => '取消';
	@override late final _Translations$notificationsPage$translation$zh translation = _Translations$notificationsPage$translation$zh._(_root);
	@override late final _Translations$notificationsPage$offer$zh offer = _Translations$notificationsPage$offer$zh._(_root);
	@override late final _Translations$notificationsPage$stories$zh stories = _Translations$notificationsPage$stories$zh._(_root);
}

// Path: profilePage
class _Translations$profilePage$zh implements Translations$profilePage$en {
	_Translations$profilePage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '个人资料';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => '免费版';
	@override String get dayStreak => '连续学习天数！';
	@override String get accountSettings => '账户设置';
	@override String get general => '常规';
	@override String get profileSettings => '个人资料设置';
	@override String get fullName => '全名';
	@override String get email => '电子邮件';
	@override String get deleteAccount => '删除账户';
	@override String get save => '保存';
	@override String get deleteTitle => '我们不想失去你，但我们理解。';
	@override String get deleteBody => '能告诉我们你为什么想要离开，以帮助我们改善Lingola的体验吗？';
	@override late final _Translations$profilePage$deleteReasons$zh deleteReasons = _Translations$profilePage$deleteReasons$zh._(_root);
	@override String get messageOptional => '留言（可选）';
	@override String get messageHint => '如果你有留言，请写下来。';
	@override String get next => '下一步';
	@override String get specialOfferTitle => '特别优惠';
	@override String get specialOfferBody => '在离开之前，看看我们为你准备的优惠。';
	@override String get monthlyPlanTitle => '切换到1个月计划';
	@override String get monthlyPlanPrice => '\$79/月，随时取消';
	@override String get monthlyPlanDesc => '没有长期承诺。按月与我们的社区保持联系。';
	@override String get whatYoullKeep => '你将保留的内容：';
	@override String get keepCharacters => '访问所有角色';
	@override String get keepVideo => '无限视频通话';
	@override String get keepCourses => '访问所有课程';
	@override String get switchMonthlyCta => '切换到月度计划';
	@override String get confirmTitle => '你确定吗？';
	@override String get confirmBody => '我们真的不想看到你离开。你将失去以下内容：';
	@override String get loseCharacters => '无限角色访问';
	@override String get loseVideo => '无限视频通话访问';
	@override String get loseCourses => '访问所有课程';
	@override String get discountTitle => '留下来并享受1个月60%的折扣';
	@override String get discountSubtitle => '我们有史以来最好的优惠。仅需\$27.60/月';
	@override String get acceptDiscountCta => '接受60%折扣并继续使用';
	@override String get farewellTitle => '我们很遗憾看到你离开';
	@override String farewellBody({required Object date}) => '你的会员已被取消。你将可以使用到${date}的账单周期结束。';
	@override String get changeMindTitle => '✨ 改变主意了吗？';
	@override String changeMindBody({required Object date}) => '你可以在${date}之前随时重新激活你的会员以保留你的权益。';
	@override String get reactivateCta => '等一下，我想重新激活';
	@override String get done => '完成';
	@override String get notifications => '通知';
	@override String get appLanguage => '应用语言';
	@override String get selectLanguageTitle => '选择语言';
	@override String get premium => '高级版';
	@override String get passive => '被动';
	@override String get active => '已开通';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => '分享给朋友';
	@override String get shareWithFriendTitle => '与朋友分享';
	@override String get shareInviteBody => '邀请你的朋友，一起享受翻译的乐趣';
	@override String get rateUs => '评价我们';
	@override String get faq => 'Lingola 常见问题';
	@override late final _Translations$profilePage$faqItems$zh faqItems = _Translations$profilePage$faqItems$zh._(_root);
	@override String get support => '支持';
	@override String get feedback => '反馈';
	@override String get progression => '进度';
	@override String get progressTitle => '进度';
	@override String get goodMorning => '早上好，';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => '英语';
	@override String get past7Days => '过去7天';
	@override String get past7DaysBody => '每天学习以建立你的连续学习记录，培养强大的学习习惯。';
	@override String get currentLevel => '当前等级';
	@override String xpLeft({required Object level, required Object xp}) => '距离达到 ${level} 还差 ${xp} XP！';
	@override String get toNextLevel => '前往下一个等级';
	@override String get dayStreakLabel => '连续学习天数';
	@override String get totalPoints => '总积分';
	@override String get savedWords => '已保存单词';
	@override String itemsToReview({required Object count}) => '${count} 个项目待复习';
	@override String get logout => '登出';
	@override String get logoutTitle => '你即将登出';
	@override String get logoutBody => '期待很快再见！我们会想念你的呼吸练习。';
	@override String get logoutConfirm => '登出';
	@override String get logoutCancel => '取消';
	@override late final _Translations$profilePage$days$zh days = _Translations$profilePage$days$zh._(_root);
}

// Path: pushNotifications
class _Translations$pushNotifications$zh implements Translations$pushNotifications$en {
	_Translations$pushNotifications$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'看起来你休息了一会儿。',
		'有时间来学习一个单词吗？',
		'我们在这里 — 不着急。',
		'你的学习节奏暂停了一下。',
		'小小的复习可能会让你感觉不错。',
	];
	@override List<String> get h4 => [
		'今天可能有一个新单词在等着你 👀',
		'你可能错过了一个快速练习。',
		'你可能跳过了一个有用的短语。',
		'今天的进展依然开放。',
		'一个单词，一个句子…也许两个都来。',
	];
	@override List<String> get h8 => [
		'你不必每天都有进展。',
		'即使是小小的复习也很重要。',
		'今天没有学习也没有损失。',
		'我们随时准备好。',
		'语言学习是马拉松，而不是短跑。',
	];
	@override List<String> get h24 => [
		'一天过去了。你的单词依然在这里。',
		'休息是很正常的。',
		'你的学习进度就在你离开的地方。',
		'随时继续学习。',
		'语言不会跑掉 — 我们也不会。',
	];
}

// Path: onboarding.slide1
class _Translations$onboarding$slide1$zh implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '几周内自信开口 — 而不是几个月';
	@override String get body => '与 AI 练习真实对话。每天提高你的口音、自信和流利度。';
	@override String get testimonialName => '莎拉·威廉姆斯, 24';
	@override String get testimonialBody => '我之前不会说英语。现在我每天在工作中都在说。';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$zh implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '没有高价的私人导师';
	@override String get body => '真实对话。即时反馈。\n无需安排。没有压力。';
	@override String get realTutor => '真实导师';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / 小时';
	@override String get priceLingola => '\$9.99 / 年';
	@override String get versus => 'VS';
	@override String get scheduled => '已安排';
	@override String get anytime => '随时';
	@override String get stressful => '有压力';
	@override String get noPressure => '没有压力';
	@override String get price => '价格';
	@override String get availability => '可用性';
	@override String get feeling => '感觉';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$zh implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '围绕你构建的学习计划';
	@override String get body => '你的目标，你的节奏，你的水平。\n从初学者到流利 — 逐步进行。';
	@override String get goal => '目标';
	@override String get practice => '练习';
	@override String get progress => '进展';
}

// Path: home.premium
class _Translations$home$premium$zh implements Translations$home$premium$en {
	_Translations$home$premium$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => '通往 ';
	@override String get titleHighlight => '流利交流的道路';
	@override String get titleAfter => '，无惧犯错。';
	@override String get descriptionBefore => '加入全球数百万学生。今天就开始打破语言障碍 — ';
	@override String get descriptionHighlight => '前 3 天完全免费。';
	@override String get feature1 => '24/7 可访问的 AI 导师';
	@override String get feature2 => '无限访问私人导师';
	@override String get feature3 => '为你量身定制的每日课程计划';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/月';
	@override String get discount => '年度购买享受 40% 折扣';
	@override String get cta => '开始';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$zh implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
	@override String get santa => '圣诞老人';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$zh implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get adaptive => '适应性强';
	@override String get calm => '冷静';
	@override String get patient => '耐心';
	@override String get organized => '有条理';
	@override String get relaxed => '放松';
	@override String get methodical => '有方法';
	@override String get attentive => '专注';
	@override String get more => '+5';
	@override String get curious => '好奇';
	@override String get observer => '观察者';
	@override String get ancientKnowledge => '古老的知识';
	@override String get wise => '智慧';
	@override String get clear => '清晰';
	@override String get decisive => '果断';
	@override String get disciplined => '自律';
	@override String get smart => '聪明';
	@override String get analytic => '分析型';
	@override String get cheerful => '愉快';
	@override String get generous => '慷慨';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$zh implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => '早上好！我很高兴你今天准备好练习了。';
	@override String get outgoing1 => '是的，我们先从问候开始。';
	@override String get incoming2 => '太好了。你会怎么跟同事打招呼？';
	@override String get typing => '输入中';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$zh implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => '课程 1 : 问候';
	@override String get nativeLine => '你无聊吗？';
	@override String get englishLine => '无聊？我把那个词从我的词汇中删除了。起来吧，计划已经定了：我们去卡迪柯伊的新游戏酒吧。';
	@override String get highlight => '无聊吗？';
	@override String get close => '结束通话';
	@override String get toggleCaptions => '切换字幕';
	@override String get toggleHints => '切换提示';
	@override String get toggleMic => '切换麦克风';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$zh implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$zh a1 = _Translations$lessonPage$levels$a1$zh._(_root);
	@override late final _Translations$lessonPage$levels$a2$zh a2 = _Translations$lessonPage$levels$a2$zh._(_root);
	@override late final _Translations$lessonPage$levels$b1$zh b1 = _Translations$lessonPage$levels$b1$zh._(_root);
	@override late final _Translations$lessonPage$levels$b2$zh b2 = _Translations$lessonPage$levels$b2$zh._(_root);
	@override late final _Translations$lessonPage$levels$c1$zh c1 = _Translations$lessonPage$levels$c1$zh._(_root);
	@override late final _Translations$lessonPage$levels$c2$zh c2 = _Translations$lessonPage$levels$c2$zh._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$zh implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '在咖啡店点单';
	@override String get screenplay => '点你最喜欢的饮料，询问尺寸和附加选项，确认总价，然后在柜台取咖啡。';
	@override late final _Translations$rolePlayPage$coffee$chat$zh chat = _Translations$rolePlayPage$coffee$chat$zh._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$zh implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '在街上问路';
	@override String get screenplay => '询问去某个地方的方向，了解如何到达地铁或公交车站，获取票务信息，并听取餐厅推荐。';
	@override late final _Translations$rolePlayPage$directions$chat$zh chat = _Translations$rolePlayPage$directions$chat$zh._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$zh implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '工作面试';
	@override String get screenplay => '介绍自己，回答常见的面试问题，谈谈你的经历，并询问关于职位和下一步的事项。';
	@override late final _Translations$rolePlayPage$interview$chat$zh chat = _Translations$rolePlayPage$interview$chat$zh._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$zh implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '新的翻译已准备好';
	@override String get body => '您的音频翻译文件已成功转换为文本并翻译。';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$zh implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '特别优惠等着你';
	@override String get body => '升级到Premium享受无限照片翻译，立减50%。';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$zh implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '发现新故事';
	@override String get body => '通过故事学习新单词';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$zh implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => '我觉得人工智能角色不够真实。';
	@override String get videoIssues => '我在视频聊天中遇到技术问题。';
	@override String get pricing => '订阅价格超出了我的预期。';
	@override String get noMatch => '我没有找到我想要的角色风格。';
	@override String get shortTrial => '我只是想短暂试用一下。';
	@override String get other => '其他';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$zh implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$supportedLanguages$zh supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$zh._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$zh howAiWorks = _Translations$profilePage$faqItems$howAiWorks$zh._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$zh offlineUse = _Translations$profilePage$faqItems$offlineUse$zh._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$zh isFree = _Translations$profilePage$faqItems$isFree$zh._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$zh pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$zh._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$zh dailyPractice = _Translations$profilePage$faqItems$dailyPractice$zh._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$zh levelDetermination = _Translations$profilePage$faqItems$levelDetermination$zh._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$zh realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$zh._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$zh dataSecurity = _Translations$profilePage$faqItems$dataSecurity$zh._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$zh disableReminders = _Translations$profilePage$faqItems$disableReminders$zh._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$zh implements Translations$profilePage$days$en {
	_Translations$profilePage$days$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get mon => '周一';
	@override String get tue => '周二';
	@override String get wed => '周三';
	@override String get thu => '周四';
	@override String get fri => '周五';
	@override String get sat => '周六';
	@override String get sun => '周日';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$zh implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - 入门';
	@override List<String> get lessons => [
		'问候',
		'自我介绍 I',
		'职业',
		'最喜欢的房间',
		'日常生活',
		'水果',
		'建议 1',
		'家庭 1',
		'日常物品',
		'家乡',
		'房子',
		'饮食偏好',
		'爱好 1',
		'成功的人',
		'食物和饮料',
		'在餐厅点餐',
		'宠物',
		'健康与健身',
		'天气',
		'新生活方式',
		'变得更好',
		'爱好 2',
		'关于地方的问题',
		'拥有',
		'购物 1',
		'报时',
		'方向 1',
		'购物 2',
		'了解你',
		'物品的位置',
		'外貌',
		'方向 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$zh implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - 基础';
	@override List<String> get lessons => [
		'家庭 2',
		'人和地方',
		'家庭 3',
		'描述物品',
		'城市',
		'建筑项目',
		'温馨的家',
		'现在几点了',
		'日常生活 2',
		'闲暇时间',
		'食物与营养',
		'购物与消费',
		'假期',
		'周末计划',
		'正式或休闲',
		'时尚',
		'购物 3',
		'建议 2',
		'你可以做到',
		'购物 4',
		'闲聊',
		'请来一杯拿铁',
		'食物',
		'出行',
		'准备旅行',
		'旅行 1',
		'城市逃离',
		'旅行 2',
		'住宿地点',
		'太兴奋了',
		'合适的人',
		'学校',
		'音乐偏好',
		'运动',
		'比赛规则',
		'留言',
		'请求',
		'邀请',
		'旅行经历',
		'过去时 1',
		'过去时 2',
		'过去时 3',
		'关于过去的问题',
		'你永远不会太老',
		'童年回忆',
		'赞美',
		'借口',
		'真烦人！',
		'数字世界',
		'工作生活',
		'我没听懂',
		'存还是花？',
		'说声对不起',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$zh implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - 中级';
	@override List<String> get lessons => [
		'文化传统',
		'名人',
		'艺术与创造力',
		'未来计划',
		'活动策划',
		'目标与计划',
		'历史事件',
		'科技',
		'从未',
		'现在有什么',
		'梦想假期',
		'社交媒体',
		'书籍推荐',
		'这样的日子',
		'特别的照片',
		'个人成就',
		'最喜欢的电影',
		'新闻快讯',
		'幸福',
		'忙碌的一周',
		'我成长的地方',
		'学校时光',
		'个人简介',
		'生活地图',
		'日常',
		'接下来是什么',
		'提出建议',
		'发生了什么',
		'回忆',
		'文化冲击',
		'兴趣短语',
		'工作面试',
		'愿望清单',
		'我喜欢的城镇',
		'互联网一代',
		'流行品牌',
		'观点短语',
		'看起来怎么样',
		'居住空间',
		'健康饮食',
		'不寻常的爱好',
		'艰难的选择',
		'采取行动',
		'新技能',
		'投诉',
		'教育',
		'绿色城市',
		'工作内容',
		'个人挑战',
		'面试短语',
		'礼貌的结束语',
		'头条新闻',
		'小改变',
		'道歉与借口',
		'电话礼仪',
		'抱歉打扰…',
		'投诉回复',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$zh implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - 中高级';
	@override List<String> get lessons => [
		'个性',
		'优秀的引导',
		'健康生活方式',
		'真相是什么？',
		'个人成长',
		'大胆表达',
		'表演出来？',
		'我记得...',
		'社交反馈',
		'犯罪现场',
		'礼貌的麻烦',
		'冲突解决',
		'爱它还是恨它？',
		'环境问题',
		'我们可以解决',
		'神秘与犯罪',
		'可能的未来',
		'商业计划',
		'会议决策',
		'太可预测了...',
		'在工作中',
		'科学与技术',
		'时间管理',
		'人权',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$zh implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - 高级';
	@override List<String> get lessons => [
		'文化规范',
		'社交媒体的影响',
		'职业选择',
		'加速表现',
		'发明',
		'时间旅行',
		'财物',
		'工作技能',
		'历史变迁',
		'写作复习',
		'神秘事件',
		'奇怪的理论',
		'名人',
		'全球政治',
		'产品热潮',
		'会快乐吗？',
		'也许稍后...',
		'新解决方案',
		'情境影响',
		'一个失落的标志',
		'善举',
		'多么精彩的电影',
		'真烦人',
		'新闻中',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$zh implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - 专家';
	@override List<String> get lessons => [
		'全球化',
		'自然灾害',
		'对信息的反应',
		'工作与生活的平衡',
		'远程工作',
		'家庭问题',
		'基本人体解剖学',
		'健康预测',
		'医疗保健获取',
		'全球旅行体验',
		'超能力',
		'团队建设',
		'生物荧光',
		'困境',
		'社会热情',
		'变化',
		'工作，工作，工作',
		'地方问题',
		'问题，问题',
		'事实还是虚构？',
		'观光',
		'志愿服务',
		'心灵之眼',
		'媒体消费',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$zh implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get briefing => '嗨！今天我们将练习在咖啡店点单 — 打招呼、尺寸、附加选项。我会先简单解释一下，然后我们来演练。听起来不错吧？';
	@override String get incoming1 => '欢迎！今天我能为你准备什么？';
	@override String get outgoing1 => '嗨！我想要一杯中杯拿铁，谢谢。';
	@override String get incoming2Highlight => '当然';
	@override String get incoming2Rest => '！你想要热的还是冰的，还有其他附加选项吗？';
	@override String get botReply => '好选择。还有其他需要加的吗？';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$zh implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get briefing => '嗨！今天我们将练习在街上问路。我会先简单解释一下，然后我们来演练。听起来不错吧？';
	@override String get incoming1 => '你好！你看起来有点迷路 — 需要帮忙找什么吗？';
	@override String get outgoing1 => '是的，我在找最近的地铁站。';
	@override String get incoming2Highlight => '当然';
	@override String get incoming2Rest => '！往那边走两个街区，然后左转。你会看到入口。';
	@override String get botReply => '不客气！想要在车站附近的餐厅推荐吗？';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$zh implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get briefing => '嗨！今天我们将练习工作面试。我会先简单解释一下，然后我们来演练 — 我来面试你，然后我们换角色。听起来不错吧？';
	@override String get incoming1 => '感谢你今天来面试。你能简单介绍一下自己吗？';
	@override String get outgoing1 => '当然。我很高兴来到这里分享我的经历。';
	@override String get incoming2Highlight => '太好了';
	@override String get incoming2Rest => '。告诉我一个你引以为豪的最近项目。';
	@override String get botReply => '那真令人印象深刻。你对这个职位有什么问题吗？';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$zh implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '应用支持哪些语言？';
	@override String get answer => '该应用目前支持英语、土耳其语和德语。新语言会定期添加。';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$zh implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '人工智能是如何工作的？';
	@override String get answer => '人工智能像真正的导师一样与你互动。它分析你的对话，检测错误，并根据你的进度提供个性化反馈。';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$zh implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我可以离线使用应用吗？';
	@override String get answer => '可以。你可以提前下载某些课程和对话场景并离线使用。但是，实时聊天需要互联网连接。';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$zh implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '这个应用是免费的吗？';
	@override String get answer => '基础版本是免费的。通过高级版，你可以获得高级聊天场景、发音分析和个人导师模式。';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$zh implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我的发音是如何评估的？';
	@override String get answer => '该应用分析你的声音，并使用人工智能驱动的语音识别来评分你的口音和发音。需要改进的单词会被突出显示。';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$zh implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我需要每天练习吗？';
	@override String get answer => '是的。系统每天跟踪你的进度。每天只需10-15分钟的口语练习就能显著加快你的语言学习。';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$zh implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我的学习水平是如何确定的？';
	@override String get answer => '首次登录时会进行一次短暂的水平检查，分析你的当前知识。之后，人工智能会自动推荐适合你水平的课程。';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$zh implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我可以和真实的人聊天吗？';
	@override String get answer => '可以。高级用户可以安排与真实导师的短期练习课程。';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$zh implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我的数据安全吗？';
	@override String get answer => '绝对安全。所有对话和用户数据都以加密形式存储。你的个人信息从不与第三方共享。';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$zh implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get question => '我如何关闭每日提醒？';
	@override String get answer => '前往个人资料设置，打开通知，修改提醒频率或完全关闭通知。';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => '高级',
			'app.notifications' => '通知',
			'app.streak' => '学习连续天数',
			'app.profile' => '个人资料',
			'common.continueLabel' => '继续',
			'common.back' => '返回',
			'common.locked' => '已锁定',
			'common.minutes' => ({required Object value}) => '${value} 分钟',
			'common.close' => '关闭',
			'common.getStarted' => '开始使用',
			'common.connectionError' => '没有连接。检查你的互联网并重试。',
			'common.genericError' => '出了点问题。请再试一次。',
			'common.tryAgain' => '再试一次',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => '引导页面 ${current} / ${total}',
			'onboarding.slide1.title' => '几周内自信开口 — 而不是几个月',
			'onboarding.slide1.body' => '与 AI 练习真实对话。每天提高你的口音、自信和流利度。',
			'onboarding.slide1.testimonialName' => '莎拉·威廉姆斯, 24',
			'onboarding.slide1.testimonialBody' => '我之前不会说英语。现在我每天在工作中都在说。',
			'onboarding.slide2.title' => '没有高价的私人导师',
			'onboarding.slide2.body' => '真实对话。即时反馈。\n无需安排。没有压力。',
			'onboarding.slide2.realTutor' => '真实导师',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / 小时',
			'onboarding.slide2.priceLingola' => '\$9.99 / 年',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => '已安排',
			'onboarding.slide2.anytime' => '随时',
			'onboarding.slide2.stressful' => '有压力',
			'onboarding.slide2.noPressure' => '没有压力',
			'onboarding.slide2.price' => '价格',
			'onboarding.slide2.availability' => '可用性',
			'onboarding.slide2.feeling' => '感觉',
			'onboarding.slide3.title' => '围绕你构建的学习计划',
			'onboarding.slide3.body' => '你的目标，你的节奏，你的水平。\n从初学者到流利 — 逐步进行。',
			'onboarding.slide3.goal' => '目标',
			'onboarding.slide3.practice' => '练习',
			'onboarding.slide3.progress' => '进展',
			'targetLanguage.title' => '选择你想学习的语言',
			'targetLanguage.comingSoon' => '更多语言即将推出',
			'targetLanguage.korean' => '韩语',
			'targetLanguage.portuguese' => '葡萄牙语',
			'targetLanguage.portugueseBrazil' => '葡萄牙语（巴西）',
			'targetLanguage.german' => '德语',
			'targetLanguage.italian' => '意大利语',
			'targetLanguage.simplifiedChinese' => '简体中文',
			'targetLanguage.arabic' => '阿拉伯语',
			'targetLanguage.turkish' => '土耳其语',
			'targetLanguage.hindi' => '印地语',
			'language.step' => ({required Object current, required Object total}) => '第 ${current} 步，共 ${total} 步',
			'language.title' => '你想说什么？',
			'language.nativeSection' => '我会说',
			'language.nativeField' => '母语',
			'language.nativeName' => '土耳其语',
			'language.targetSection' => '我想学习',
			'language.targetField' => '目标语言',
			'language.targetName' => '英语',
			'language.direction' => '语言方向',
			'language.selectLanguage' => '选择语言',
			'language.comingSoonBadge' => '敬请期待...',
			'language.english' => '英语',
			'language.french' => '法语',
			'language.japanese' => '日语',
			'language.spanish' => '西班牙语',
			'language.russian' => '俄语',
			'setup.goalTitle' => '你的目标是什么？',
			'setup.goalCareer' => '职业发展',
			'setup.goalTravel' => '旅行',
			'setup.goalLiving' => '海外生活',
			'setup.goalStudying' => '留学',
			'setup.goalOther' => '其他',
			'setup.levelTitle' => '你目前的语言水平是什么？',
			'setup.levelBeginner' => '初学者 — 我知道一些单词',
			'setup.levelIntermediate' => '中级 — 我能进行简单对话',
			'setup.levelAdvanced' => '高级 — 我会说但想要提高',
			'setup.paceTitle' => '你想多快提高？',
			'setup.paceLight' => '每天5-10分钟（轻松）',
			'setup.paceRecommended' => '每天15-20分钟（推荐）',
			'setup.paceFast' => '每天30分钟以上（快速见效）',
			'accountCreating.title' => '正在创建您的个人账户',
			'accountCreating.stepContent' => '内容正在创建中',
			'accountCreating.stepDialogues' => '对话正在准备中',
			'accountCreating.stepLessons' => '课程正在优化中',
			'accountCreating.stepPlan' => '您的计划正在最终确定',
			'accountCreating.optimization' => '优化中',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => '课程 1：问候',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => '输入消息...',
			'previewChat.incoming1' => '嗨！欢迎来到 Lingola — 我是你的 AI 导师。准备好用英语打个招呼吗？',
			'previewChat.outgoing1' => '嗨！我准备好练习了。',
			'previewChat.incoming2Highlight' => '早上好',
			'previewChat.incoming2Rest' => '，Emrah！我很高兴你准备好了。早上的咖啡总是建立联系的好开始。你想聊些什么？',
			'previewChat.holdToSpeak' => '按住说话',
			'previewChat.recording' => '录音中… 松开发送',
			'previewChat.slideUpToLock' => '上滑锁定',
			'previewChat.slideLeftToCancel' => '左滑取消',
			'previewChat.recordingLockedHint' => '完成后点击发送',
			'paywall.title' => '今天开始说话 — 免费',
			'paywall.subtitle' => '无限学习机会',
			'paywall.noCommitment' => '无任何承诺',
			'paywall.cancelAnytime' => '随时取消',
			'paywall.noPaymentToday' => '今天无需付款',
			'paywall.daysFree' => '免费3天',
			'paywall.thenPrice' => '然后是 \$1.99/月',
			'paywall.trialActive' => '免费试用中',
			'paywall.payableToday' => '今天需付款',
			'paywall.payableValue' => '3天免费 0.00\$',
			'paywall.paymentDate' => '付款日期：2026年3月13日',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => '我们多样化的AI教练',
			'auth.title' => '今天开始说一种新语言',
			'auth.body' => '与AI练习真实对话。\n没有压力，没有评判。',
			'auth.continueGoogle' => '继续使用Google',
			'auth.continueApple' => '继续使用Apple',
			'auth.continueGuest' => '作为访客继续',
			'auth.legal' => '通过注册Lingola，您同意我们的服务条款。了解我们如何处理您的数据，请查看我们的隐私政策和Cookies政策',
			'auth.terms' => '服务条款',
			'auth.privacy' => '隐私政策',
			'auth.cookies' => 'Cookies政策',
			'nav.home' => '首页',
			'nav.tutor' => '导师',
			'nav.lesson' => '课程',
			'nav.rolePlay' => '角色扮演',
			'nav.profile' => '个人资料',
			'home.streakCount' => '2',
			'home.greeting' => '早上好，Jhon',
			'home.todayPractice' => '今天的练习',
			'home.continueConversation' => '继续对话',
			'home.continueWithTutor' => ({required Object name}) => '继续与${name}练习，还是换一位导师？',
			'home.continueSameTutor' => ({required Object name}) => '继续与${name}练习',
			'home.chooseOtherTutor' => '选择其他导师',
			'home.minutesLeft' => ({required Object value}) => '剩余 ${value} 分钟',
			'home.lessonProgress' => '课程 2 — 问候',
			'home.timeCurrent' => '0分钟',
			'home.timeTotal' => '/ 15分钟',
			'home.kContinue' => '继续',
			'home.learningPath' => 'A1 - 入门',
			'home.allLessons' => '所有课程',
			'home.introductions' => '自我介绍 I',
			'home.greetings' => '问候',
			'home.jobs' => '职业',
			'home.favoriteRoom' => '最喜欢的房间',
			'home.dailyRoutine' => '日常活动',
			'home.scroll' => '滚动',
			'home.liveLesson' => '直播课程',
			'home.liveLessonSubtitle' => '与我们的导师视频通话',
			'home.moreTutor' => '更多导师',
			'home.startTalkNow' => '立即开始对话',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => '梅琳',
			'home.tutorKate' => '凯特',
			'home.tagAdaptive' => '适应性',
			'home.tagCalm' => '冷静',
			'home.tagPatient' => '耐心',
			'home.tagMethodical' => '有条理',
			'home.tagEncouraging' => '鼓励',
			'home.tagMore' => '+5',
			'home.moreFeatures' => '更多功能',
			'home.practiceLabel' => '练习',
			'home.wordPractice' => '单词练习',
			'home.wordPracticeBody' => '每天在你选择的语言中扩展词汇量',
			'home.immersiveLabel' => '沉浸式',
			'home.quiz' => '测验',
			'home.quizBodyLine1' => '通过真实的',
			'home.quizBodyLine2' => '上下文示例学习',
			'home.getStarted' => '开始',
			'home.library' => '图书馆',
			'home.libraryTitle' => '学习与保存',
			'home.learnMore' => '了解更多',
			'home.premium.titleBefore' => '通往 ',
			'home.premium.titleHighlight' => '流利交流的道路',
			'home.premium.titleAfter' => '，无惧犯错。',
			'home.premium.descriptionBefore' => '加入全球数百万学生。今天就开始打破语言障碍 — ',
			'home.premium.descriptionHighlight' => '前 3 天完全免费。',
			'home.premium.feature1' => '24/7 可访问的 AI 导师',
			'home.premium.feature2' => '无限访问私人导师',
			'home.premium.feature3' => '为你量身定制的每日课程计划',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/月',
			'home.premium.discount' => '年度购买享受 40% 折扣',
			'home.premium.cta' => '开始',
			'libraryPage.title' => '图书馆',
			'libraryPage.searchWord' => '搜索词',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} 个保存的词',
			'libraryPage.savedWordTab' => '保存的词',
			'libraryPage.dictionaryTab' => '词典',
			'libraryPage.dictionaryLabel' => '词典',
			'wordPracticePage.title' => '单词练习',
			'wordPracticePage.turkish' => '土耳其语',
			'wordPracticePage.save' => '保存',
			'wordPracticePage.saved' => '已保存',
			'wordPracticePage.listen' => '听',
			'wordPracticePage.hint' => '提示',
			'wordPracticePage.previous' => '上一个',
			'wordPracticePage.next' => '下一个',
			'quizPage.title' => '测验',
			'quizPage.headline' => '你今天想提高什么？',
			'quizPage.subtitle' => '选择你的训练 — 不到 3 分钟 🚀',
			'quizPage.readingTitle' => '阅读',
			'quizPage.readingBody' => '通过文章和故事理解',
			'quizPage.writingTitle' => '写作',
			'quizPage.writingBody' => '语法和词汇练习',
			'quizPage.speakingTitle' => '口语',
			'quizPage.speakingBody' => '通过 AI 语音引擎发音',
			'quizPage.readingTestTitle' => '阅读测试',
			'quizPage.read' => '阅读',
			'quizPage.listeningHint' => '清晰地说出英文单词……',
			'quizPage.micPermissionDenied' => '麦克风或语音识别不可用。',
			'quizPage.matchSuccess' => '太棒了！这和单词匹配。',
			'quizPage.matchFail' => ({required Object heard}) => '听到 "${heard}"。再试一次。',
			'quizPage.successfulTitle' => '成功！',
			'quizPage.successfulBody' => '发音像母语者一样！',
			'quizPage.failedTitle' => '失败',
			'quizPage.failedBody' => '差一点就成功了，再给它一次机会',
			'quizPage.tryAgain' => '再试一次',
			'quizPage.writingTestTitle' => '写作测试',
			'quizPage.sourceLanguage' => '源语言',
			'quizPage.answer' => '答案',
			'quizPage.writeAnswerHint' => '在这里写下你的答案……',
			'quizPage.submit' => '提交',
			'quizPage.speakingTestTitle' => '口语测试',
			'quizPage.speakingProficiency' => '口语水平',
			'quizPage.speakClearlyHint' => '清晰地对着麦克风说：',
			'quizPage.speakUp' => '大声说',
			'quizPage.recording' => '录音中……',
			'quizPage.questionOf' => ({required Object current, required Object total}) => '第 ${current} 题，共 ${total} 题',
			'placeholder.title' => ({required Object tab}) => '${tab} 正在路上',
			'placeholder.body' => ({required Object tab}) => '我们正在为你准备一个专注的 ${tab} 体验。',
			'tutorPage.title' => '导师',
			'tutorPage.chatWithLingola' => '与Lingola聊天',
			'tutorPage.chatWithTutor' => ({required Object name}) => '与${name}聊天',
			'tutorPage.chatHistory' => '聊天记录',
			'tutorPage.history' => '历史',
			'tutorPage.filter' => '筛选',
			'tutorPage.country' => '国家',
			'tutorPage.focus' => '重点',
			'tutorPage.moreCountries' => '还有8个+',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => '保存',
			'tutorPage.startTalkNow' => '立即开始聊天',
			'tutorPage.typeMessage' => '输入消息...',
			'tutorPage.speaker' => '发言者',
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
			'tutorPage.tutors.santa' => '圣诞老人',
			'tutorPage.tags.adaptive' => '适应性强',
			'tutorPage.tags.calm' => '冷静',
			'tutorPage.tags.patient' => '耐心',
			'tutorPage.tags.organized' => '有条理',
			'tutorPage.tags.relaxed' => '放松',
			'tutorPage.tags.methodical' => '有方法',
			'tutorPage.tags.attentive' => '专注',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => '好奇',
			'tutorPage.tags.observer' => '观察者',
			'tutorPage.tags.ancientKnowledge' => '古老的知识',
			'tutorPage.tags.wise' => '智慧',
			'tutorPage.tags.clear' => '清晰',
			'tutorPage.tags.decisive' => '果断',
			'tutorPage.tags.disciplined' => '自律',
			'tutorPage.tags.smart' => '聪明',
			'tutorPage.tags.analytic' => '分析型',
			'tutorPage.tags.cheerful' => '愉快',
			'tutorPage.tags.generous' => '慷慨',
			'tutorPage.historyPreview1' => '嘿！我快无聊死了...',
			'tutorPage.historyPreview2' => '今天我们来练习点餐吧？',
			'tutorPage.time1' => '上午11:00',
			'tutorPage.time2' => '昨天',
			'tutorPage.chat.incoming1' => '早上好！我很高兴你今天准备好练习了。',
			'tutorPage.chat.outgoing1' => '是的，我们先从问候开始。',
			'tutorPage.chat.incoming2' => '太好了。你会怎么跟同事打招呼？',
			'tutorPage.chat.typing' => '输入中',
			'tutorPage.calling.lessonBadge' => '课程 1 : 问候',
			'tutorPage.calling.nativeLine' => '你无聊吗？',
			'tutorPage.calling.englishLine' => '无聊？我把那个词从我的词汇中删除了。起来吧，计划已经定了：我们去卡迪柯伊的新游戏酒吧。',
			'tutorPage.calling.highlight' => '无聊吗？',
			'tutorPage.calling.close' => '结束通话',
			'tutorPage.calling.toggleCaptions' => '切换字幕',
			'tutorPage.calling.toggleHints' => '切换提示',
			'tutorPage.calling.toggleMic' => '切换麦克风',
			'lessonPage.title' => '继续学习',
			'lessonPage.profile' => '个人资料',
			'lessonPage.language' => '目标语言',
			'lessonPage.completed' => '已完成',
			'lessonPage.locked' => '已锁定',
			'lessonPage.pickTutorTitle' => '选择你的导师',
			'lessonPage.startTalk' => '开始课程',
			'lessonPage.chatInstead' => '改为聊天',
			'lessonPage.lockedHint' => '完成上一节课以解锁这一节。',
			'lessonPage.levelLockedTitle' => '等级锁定',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => '你的英语水平是${userLevel}，因此在完成前面的路径之前无法打开${lessonLevel}课程。',
			'lessonPage.levelLockedOk' => '知道了',
			'lessonPage.notesTitle' => '课程笔记',
			'lessonPage.whatWeLearned' => '我们今天学到了什么',
			'lessonPage.deleteNotes' => '删除我的课程笔记',
			'lessonPage.deleteNotesConfirm' => '确定要删除这些笔记吗？此操作无法撤销。',
			'lessonPage.delete' => '删除',
			'lessonPage.cancel' => '取消',
			'lessonPage.practiceCta' => '如果觉得太难，可以再练习一次相同的话题。',
			'lessonPage.practiceNow' => '练习这个话题',
			'lessonPage.openChat' => '与导师打开聊天',
			'lessonPage.yourScore' => '你的分数',
			'lessonPage.bestScore' => ({required Object score}) => '最佳 ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => '被动参与者',
			'lessonPage.participationSilentBody' => '这次你保持沉默。我觉得你应该重修这节课。',
			'lessonPage.participationPassive' => '参与度低',
			'lessonPage.participationPassiveBody' => '你几乎没有发言。再试一次这节课，多说几句。',
			'lessonPage.participationActive' => '参与度良好',
			'lessonPage.participationActiveBody' => '你参与了对话。继续保持！',
			'lessonPage.participationStrong' => '参与度强',
			'lessonPage.participationStrongBody' => '你说了很多。干得好！',
			'lessonPage.retakeLesson' => '重修这节课',
			'lessonPage.finishLesson' => '完成课程',
			'lessonPage.savingNotes' => '你的导师正在写今天的笔记……',
			'lessonPage.noNotes' => '完成这节课以获取导师的笔记。',
			'lessonPage.notesDeleted' => '课程笔记已删除',
			'lessonPage.levels.a1.title' => 'A1 - 入门',
			'lessonPage.levels.a1.lessons.0' => '问候',
			'lessonPage.levels.a1.lessons.1' => '自我介绍 I',
			'lessonPage.levels.a1.lessons.2' => '职业',
			'lessonPage.levels.a1.lessons.3' => '最喜欢的房间',
			'lessonPage.levels.a1.lessons.4' => '日常生活',
			'lessonPage.levels.a1.lessons.5' => '水果',
			'lessonPage.levels.a1.lessons.6' => '建议 1',
			'lessonPage.levels.a1.lessons.7' => '家庭 1',
			'lessonPage.levels.a1.lessons.8' => '日常物品',
			'lessonPage.levels.a1.lessons.9' => '家乡',
			'lessonPage.levels.a1.lessons.10' => '房子',
			'lessonPage.levels.a1.lessons.11' => '饮食偏好',
			'lessonPage.levels.a1.lessons.12' => '爱好 1',
			'lessonPage.levels.a1.lessons.13' => '成功的人',
			'lessonPage.levels.a1.lessons.14' => '食物和饮料',
			'lessonPage.levels.a1.lessons.15' => '在餐厅点餐',
			'lessonPage.levels.a1.lessons.16' => '宠物',
			'lessonPage.levels.a1.lessons.17' => '健康与健身',
			'lessonPage.levels.a1.lessons.18' => '天气',
			'lessonPage.levels.a1.lessons.19' => '新生活方式',
			'lessonPage.levels.a1.lessons.20' => '变得更好',
			'lessonPage.levels.a1.lessons.21' => '爱好 2',
			'lessonPage.levels.a1.lessons.22' => '关于地方的问题',
			'lessonPage.levels.a1.lessons.23' => '拥有',
			'lessonPage.levels.a1.lessons.24' => '购物 1',
			'lessonPage.levels.a1.lessons.25' => '报时',
			'lessonPage.levels.a1.lessons.26' => '方向 1',
			'lessonPage.levels.a1.lessons.27' => '购物 2',
			'lessonPage.levels.a1.lessons.28' => '了解你',
			'lessonPage.levels.a1.lessons.29' => '物品的位置',
			'lessonPage.levels.a1.lessons.30' => '外貌',
			'lessonPage.levels.a1.lessons.31' => '方向 2',
			'lessonPage.levels.a2.title' => 'A2 - 基础',
			'lessonPage.levels.a2.lessons.0' => '家庭 2',
			'lessonPage.levels.a2.lessons.1' => '人和地方',
			'lessonPage.levels.a2.lessons.2' => '家庭 3',
			'lessonPage.levels.a2.lessons.3' => '描述物品',
			'lessonPage.levels.a2.lessons.4' => '城市',
			'lessonPage.levels.a2.lessons.5' => '建筑项目',
			'lessonPage.levels.a2.lessons.6' => '温馨的家',
			'lessonPage.levels.a2.lessons.7' => '现在几点了',
			'lessonPage.levels.a2.lessons.8' => '日常生活 2',
			'lessonPage.levels.a2.lessons.9' => '闲暇时间',
			'lessonPage.levels.a2.lessons.10' => '食物与营养',
			'lessonPage.levels.a2.lessons.11' => '购物与消费',
			'lessonPage.levels.a2.lessons.12' => '假期',
			'lessonPage.levels.a2.lessons.13' => '周末计划',
			'lessonPage.levels.a2.lessons.14' => '正式或休闲',
			'lessonPage.levels.a2.lessons.15' => '时尚',
			'lessonPage.levels.a2.lessons.16' => '购物 3',
			'lessonPage.levels.a2.lessons.17' => '建议 2',
			'lessonPage.levels.a2.lessons.18' => '你可以做到',
			'lessonPage.levels.a2.lessons.19' => '购物 4',
			'lessonPage.levels.a2.lessons.20' => '闲聊',
			'lessonPage.levels.a2.lessons.21' => '请来一杯拿铁',
			'lessonPage.levels.a2.lessons.22' => '食物',
			'lessonPage.levels.a2.lessons.23' => '出行',
			'lessonPage.levels.a2.lessons.24' => '准备旅行',
			'lessonPage.levels.a2.lessons.25' => '旅行 1',
			'lessonPage.levels.a2.lessons.26' => '城市逃离',
			'lessonPage.levels.a2.lessons.27' => '旅行 2',
			'lessonPage.levels.a2.lessons.28' => '住宿地点',
			'lessonPage.levels.a2.lessons.29' => '太兴奋了',
			'lessonPage.levels.a2.lessons.30' => '合适的人',
			'lessonPage.levels.a2.lessons.31' => '学校',
			'lessonPage.levels.a2.lessons.32' => '音乐偏好',
			'lessonPage.levels.a2.lessons.33' => '运动',
			'lessonPage.levels.a2.lessons.34' => '比赛规则',
			'lessonPage.levels.a2.lessons.35' => '留言',
			'lessonPage.levels.a2.lessons.36' => '请求',
			'lessonPage.levels.a2.lessons.37' => '邀请',
			'lessonPage.levels.a2.lessons.38' => '旅行经历',
			'lessonPage.levels.a2.lessons.39' => '过去时 1',
			'lessonPage.levels.a2.lessons.40' => '过去时 2',
			'lessonPage.levels.a2.lessons.41' => '过去时 3',
			'lessonPage.levels.a2.lessons.42' => '关于过去的问题',
			'lessonPage.levels.a2.lessons.43' => '你永远不会太老',
			'lessonPage.levels.a2.lessons.44' => '童年回忆',
			'lessonPage.levels.a2.lessons.45' => '赞美',
			'lessonPage.levels.a2.lessons.46' => '借口',
			'lessonPage.levels.a2.lessons.47' => '真烦人！',
			'lessonPage.levels.a2.lessons.48' => '数字世界',
			'lessonPage.levels.a2.lessons.49' => '工作生活',
			'lessonPage.levels.a2.lessons.50' => '我没听懂',
			'lessonPage.levels.a2.lessons.51' => '存还是花？',
			'lessonPage.levels.a2.lessons.52' => '说声对不起',
			'lessonPage.levels.b1.title' => 'B1 - 中级',
			'lessonPage.levels.b1.lessons.0' => '文化传统',
			'lessonPage.levels.b1.lessons.1' => '名人',
			'lessonPage.levels.b1.lessons.2' => '艺术与创造力',
			'lessonPage.levels.b1.lessons.3' => '未来计划',
			'lessonPage.levels.b1.lessons.4' => '活动策划',
			'lessonPage.levels.b1.lessons.5' => '目标与计划',
			'lessonPage.levels.b1.lessons.6' => '历史事件',
			'lessonPage.levels.b1.lessons.7' => '科技',
			'lessonPage.levels.b1.lessons.8' => '从未',
			'lessonPage.levels.b1.lessons.9' => '现在有什么',
			'lessonPage.levels.b1.lessons.10' => '梦想假期',
			'lessonPage.levels.b1.lessons.11' => '社交媒体',
			'lessonPage.levels.b1.lessons.12' => '书籍推荐',
			'lessonPage.levels.b1.lessons.13' => '这样的日子',
			'lessonPage.levels.b1.lessons.14' => '特别的照片',
			'lessonPage.levels.b1.lessons.15' => '个人成就',
			'lessonPage.levels.b1.lessons.16' => '最喜欢的电影',
			'lessonPage.levels.b1.lessons.17' => '新闻快讯',
			'lessonPage.levels.b1.lessons.18' => '幸福',
			'lessonPage.levels.b1.lessons.19' => '忙碌的一周',
			'lessonPage.levels.b1.lessons.20' => '我成长的地方',
			'lessonPage.levels.b1.lessons.21' => '学校时光',
			'lessonPage.levels.b1.lessons.22' => '个人简介',
			'lessonPage.levels.b1.lessons.23' => '生活地图',
			'lessonPage.levels.b1.lessons.24' => '日常',
			'lessonPage.levels.b1.lessons.25' => '接下来是什么',
			'lessonPage.levels.b1.lessons.26' => '提出建议',
			'lessonPage.levels.b1.lessons.27' => '发生了什么',
			'lessonPage.levels.b1.lessons.28' => '回忆',
			'lessonPage.levels.b1.lessons.29' => '文化冲击',
			'lessonPage.levels.b1.lessons.30' => '兴趣短语',
			'lessonPage.levels.b1.lessons.31' => '工作面试',
			'lessonPage.levels.b1.lessons.32' => '愿望清单',
			'lessonPage.levels.b1.lessons.33' => '我喜欢的城镇',
			'lessonPage.levels.b1.lessons.34' => '互联网一代',
			'lessonPage.levels.b1.lessons.35' => '流行品牌',
			'lessonPage.levels.b1.lessons.36' => '观点短语',
			'lessonPage.levels.b1.lessons.37' => '看起来怎么样',
			'lessonPage.levels.b1.lessons.38' => '居住空间',
			'lessonPage.levels.b1.lessons.39' => '健康饮食',
			'lessonPage.levels.b1.lessons.40' => '不寻常的爱好',
			'lessonPage.levels.b1.lessons.41' => '艰难的选择',
			'lessonPage.levels.b1.lessons.42' => '采取行动',
			'lessonPage.levels.b1.lessons.43' => '新技能',
			'lessonPage.levels.b1.lessons.44' => '投诉',
			'lessonPage.levels.b1.lessons.45' => '教育',
			'lessonPage.levels.b1.lessons.46' => '绿色城市',
			'lessonPage.levels.b1.lessons.47' => '工作内容',
			'lessonPage.levels.b1.lessons.48' => '个人挑战',
			'lessonPage.levels.b1.lessons.49' => '面试短语',
			'lessonPage.levels.b1.lessons.50' => '礼貌的结束语',
			'lessonPage.levels.b1.lessons.51' => '头条新闻',
			'lessonPage.levels.b1.lessons.52' => '小改变',
			'lessonPage.levels.b1.lessons.53' => '道歉与借口',
			'lessonPage.levels.b1.lessons.54' => '电话礼仪',
			'lessonPage.levels.b1.lessons.55' => '抱歉打扰…',
			'lessonPage.levels.b1.lessons.56' => '投诉回复',
			'lessonPage.levels.b2.title' => 'B2 - 中高级',
			'lessonPage.levels.b2.lessons.0' => '个性',
			'lessonPage.levels.b2.lessons.1' => '优秀的引导',
			'lessonPage.levels.b2.lessons.2' => '健康生活方式',
			'lessonPage.levels.b2.lessons.3' => '真相是什么？',
			'lessonPage.levels.b2.lessons.4' => '个人成长',
			'lessonPage.levels.b2.lessons.5' => '大胆表达',
			'lessonPage.levels.b2.lessons.6' => '表演出来？',
			'lessonPage.levels.b2.lessons.7' => '我记得...',
			'lessonPage.levels.b2.lessons.8' => '社交反馈',
			'lessonPage.levels.b2.lessons.9' => '犯罪现场',
			'lessonPage.levels.b2.lessons.10' => '礼貌的麻烦',
			'lessonPage.levels.b2.lessons.11' => '冲突解决',
			'lessonPage.levels.b2.lessons.12' => '爱它还是恨它？',
			'lessonPage.levels.b2.lessons.13' => '环境问题',
			'lessonPage.levels.b2.lessons.14' => '我们可以解决',
			'lessonPage.levels.b2.lessons.15' => '神秘与犯罪',
			'lessonPage.levels.b2.lessons.16' => '可能的未来',
			'lessonPage.levels.b2.lessons.17' => '商业计划',
			'lessonPage.levels.b2.lessons.18' => '会议决策',
			'lessonPage.levels.b2.lessons.19' => '太可预测了...',
			'lessonPage.levels.b2.lessons.20' => '在工作中',
			'lessonPage.levels.b2.lessons.21' => '科学与技术',
			'lessonPage.levels.b2.lessons.22' => '时间管理',
			'lessonPage.levels.b2.lessons.23' => '人权',
			'lessonPage.levels.c1.title' => 'C1 - 高级',
			'lessonPage.levels.c1.lessons.0' => '文化规范',
			'lessonPage.levels.c1.lessons.1' => '社交媒体的影响',
			'lessonPage.levels.c1.lessons.2' => '职业选择',
			'lessonPage.levels.c1.lessons.3' => '加速表现',
			'lessonPage.levels.c1.lessons.4' => '发明',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.c1.lessons.5' => '时间旅行',
			'lessonPage.levels.c1.lessons.6' => '财物',
			'lessonPage.levels.c1.lessons.7' => '工作技能',
			'lessonPage.levels.c1.lessons.8' => '历史变迁',
			'lessonPage.levels.c1.lessons.9' => '写作复习',
			'lessonPage.levels.c1.lessons.10' => '神秘事件',
			'lessonPage.levels.c1.lessons.11' => '奇怪的理论',
			'lessonPage.levels.c1.lessons.12' => '名人',
			'lessonPage.levels.c1.lessons.13' => '全球政治',
			'lessonPage.levels.c1.lessons.14' => '产品热潮',
			'lessonPage.levels.c1.lessons.15' => '会快乐吗？',
			'lessonPage.levels.c1.lessons.16' => '也许稍后...',
			'lessonPage.levels.c1.lessons.17' => '新解决方案',
			'lessonPage.levels.c1.lessons.18' => '情境影响',
			'lessonPage.levels.c1.lessons.19' => '一个失落的标志',
			'lessonPage.levels.c1.lessons.20' => '善举',
			'lessonPage.levels.c1.lessons.21' => '多么精彩的电影',
			'lessonPage.levels.c1.lessons.22' => '真烦人',
			'lessonPage.levels.c1.lessons.23' => '新闻中',
			'lessonPage.levels.c2.title' => 'C2 - 专家',
			'lessonPage.levels.c2.lessons.0' => '全球化',
			'lessonPage.levels.c2.lessons.1' => '自然灾害',
			'lessonPage.levels.c2.lessons.2' => '对信息的反应',
			'lessonPage.levels.c2.lessons.3' => '工作与生活的平衡',
			'lessonPage.levels.c2.lessons.4' => '远程工作',
			'lessonPage.levels.c2.lessons.5' => '家庭问题',
			'lessonPage.levels.c2.lessons.6' => '基本人体解剖学',
			'lessonPage.levels.c2.lessons.7' => '健康预测',
			'lessonPage.levels.c2.lessons.8' => '医疗保健获取',
			'lessonPage.levels.c2.lessons.9' => '全球旅行体验',
			'lessonPage.levels.c2.lessons.10' => '超能力',
			'lessonPage.levels.c2.lessons.11' => '团队建设',
			'lessonPage.levels.c2.lessons.12' => '生物荧光',
			'lessonPage.levels.c2.lessons.13' => '困境',
			'lessonPage.levels.c2.lessons.14' => '社会热情',
			'lessonPage.levels.c2.lessons.15' => '变化',
			'lessonPage.levels.c2.lessons.16' => '工作，工作，工作',
			'lessonPage.levels.c2.lessons.17' => '地方问题',
			'lessonPage.levels.c2.lessons.18' => '问题，问题',
			'lessonPage.levels.c2.lessons.19' => '事实还是虚构？',
			'lessonPage.levels.c2.lessons.20' => '观光',
			'lessonPage.levels.c2.lessons.21' => '志愿服务',
			'lessonPage.levels.c2.lessons.22' => '心灵之眼',
			'lessonPage.levels.c2.lessons.23' => '媒体消费',
			'rolePlayPage.title' => '角色扮演',
			'rolePlayPage.subtitle' => '选择你的角色 — 体验真实场景 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} 完成',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} 分钟',
			'rolePlayPage.beginner' => '初学者',
			'rolePlayPage.screenplay' => '剧本',
			'rolePlayPage.dailyInteractions' => '日常互动',
			'rolePlayPage.business' => '商务',
			'rolePlayPage.coffee.title' => '在咖啡店点单',
			'rolePlayPage.coffee.screenplay' => '点你最喜欢的饮料，询问尺寸和附加选项，确认总价，然后在柜台取咖啡。',
			'rolePlayPage.coffee.chat.briefing' => '嗨！今天我们将练习在咖啡店点单 — 打招呼、尺寸、附加选项。我会先简单解释一下，然后我们来演练。听起来不错吧？',
			'rolePlayPage.coffee.chat.incoming1' => '欢迎！今天我能为你准备什么？',
			'rolePlayPage.coffee.chat.outgoing1' => '嗨！我想要一杯中杯拿铁，谢谢。',
			'rolePlayPage.coffee.chat.incoming2Highlight' => '当然',
			'rolePlayPage.coffee.chat.incoming2Rest' => '！你想要热的还是冰的，还有其他附加选项吗？',
			'rolePlayPage.coffee.chat.botReply' => '好选择。还有其他需要加的吗？',
			'rolePlayPage.directions.title' => '在街上问路',
			'rolePlayPage.directions.screenplay' => '询问去某个地方的方向，了解如何到达地铁或公交车站，获取票务信息，并听取餐厅推荐。',
			'rolePlayPage.directions.chat.briefing' => '嗨！今天我们将练习在街上问路。我会先简单解释一下，然后我们来演练。听起来不错吧？',
			'rolePlayPage.directions.chat.incoming1' => '你好！你看起来有点迷路 — 需要帮忙找什么吗？',
			'rolePlayPage.directions.chat.outgoing1' => '是的，我在找最近的地铁站。',
			'rolePlayPage.directions.chat.incoming2Highlight' => '当然',
			'rolePlayPage.directions.chat.incoming2Rest' => '！往那边走两个街区，然后左转。你会看到入口。',
			'rolePlayPage.directions.chat.botReply' => '不客气！想要在车站附近的餐厅推荐吗？',
			'rolePlayPage.interview.title' => '工作面试',
			'rolePlayPage.interview.screenplay' => '介绍自己，回答常见的面试问题，谈谈你的经历，并询问关于职位和下一步的事项。',
			'rolePlayPage.interview.chat.briefing' => '嗨！今天我们将练习工作面试。我会先简单解释一下，然后我们来演练 — 我来面试你，然后我们换角色。听起来不错吧？',
			'rolePlayPage.interview.chat.incoming1' => '感谢你今天来面试。你能简单介绍一下自己吗？',
			'rolePlayPage.interview.chat.outgoing1' => '当然。我很高兴来到这里分享我的经历。',
			'rolePlayPage.interview.chat.incoming2Highlight' => '太好了',
			'rolePlayPage.interview.chat.incoming2Rest' => '。告诉我一个你引以为豪的最近项目。',
			'rolePlayPage.interview.chat.botReply' => '那真令人印象深刻。你对这个职位有什么问题吗？',
			'notificationsPage.title' => '通知',
			'notificationsPage.deleteConfirmTitle' => '确定吗？',
			'notificationsPage.deleteConfirmBody' => '此通知将被删除。',
			'notificationsPage.delete' => '删除',
			'notificationsPage.cancel' => '取消',
			'notificationsPage.translation.title' => '新的翻译已准备好',
			'notificationsPage.translation.body' => '您的音频翻译文件已成功转换为文本并翻译。',
			'notificationsPage.offer.title' => '特别优惠等着你',
			'notificationsPage.offer.body' => '升级到Premium享受无限照片翻译，立减50%。',
			'notificationsPage.stories.title' => '发现新故事',
			'notificationsPage.stories.body' => '通过故事学习新单词',
			'profilePage.title' => '个人资料',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => '免费版',
			'profilePage.dayStreak' => '连续学习天数！',
			'profilePage.accountSettings' => '账户设置',
			'profilePage.general' => '常规',
			'profilePage.profileSettings' => '个人资料设置',
			'profilePage.fullName' => '全名',
			'profilePage.email' => '电子邮件',
			'profilePage.deleteAccount' => '删除账户',
			'profilePage.save' => '保存',
			'profilePage.deleteTitle' => '我们不想失去你，但我们理解。',
			'profilePage.deleteBody' => '能告诉我们你为什么想要离开，以帮助我们改善Lingola的体验吗？',
			'profilePage.deleteReasons.aiCharacters' => '我觉得人工智能角色不够真实。',
			'profilePage.deleteReasons.videoIssues' => '我在视频聊天中遇到技术问题。',
			'profilePage.deleteReasons.pricing' => '订阅价格超出了我的预期。',
			'profilePage.deleteReasons.noMatch' => '我没有找到我想要的角色风格。',
			'profilePage.deleteReasons.shortTrial' => '我只是想短暂试用一下。',
			'profilePage.deleteReasons.other' => '其他',
			'profilePage.messageOptional' => '留言（可选）',
			'profilePage.messageHint' => '如果你有留言，请写下来。',
			'profilePage.next' => '下一步',
			'profilePage.specialOfferTitle' => '特别优惠',
			'profilePage.specialOfferBody' => '在离开之前，看看我们为你准备的优惠。',
			'profilePage.monthlyPlanTitle' => '切换到1个月计划',
			'profilePage.monthlyPlanPrice' => '\$79/月，随时取消',
			'profilePage.monthlyPlanDesc' => '没有长期承诺。按月与我们的社区保持联系。',
			'profilePage.whatYoullKeep' => '你将保留的内容：',
			'profilePage.keepCharacters' => '访问所有角色',
			'profilePage.keepVideo' => '无限视频通话',
			'profilePage.keepCourses' => '访问所有课程',
			'profilePage.switchMonthlyCta' => '切换到月度计划',
			'profilePage.confirmTitle' => '你确定吗？',
			'profilePage.confirmBody' => '我们真的不想看到你离开。你将失去以下内容：',
			'profilePage.loseCharacters' => '无限角色访问',
			'profilePage.loseVideo' => '无限视频通话访问',
			'profilePage.loseCourses' => '访问所有课程',
			'profilePage.discountTitle' => '留下来并享受1个月60%的折扣',
			'profilePage.discountSubtitle' => '我们有史以来最好的优惠。仅需\$27.60/月',
			'profilePage.acceptDiscountCta' => '接受60%折扣并继续使用',
			'profilePage.farewellTitle' => '我们很遗憾看到你离开',
			'profilePage.farewellBody' => ({required Object date}) => '你的会员已被取消。你将可以使用到${date}的账单周期结束。',
			'profilePage.changeMindTitle' => '✨ 改变主意了吗？',
			'profilePage.changeMindBody' => ({required Object date}) => '你可以在${date}之前随时重新激活你的会员以保留你的权益。',
			'profilePage.reactivateCta' => '等一下，我想重新激活',
			'profilePage.done' => '完成',
			'profilePage.notifications' => '通知',
			'profilePage.appLanguage' => '应用语言',
			'profilePage.selectLanguageTitle' => '选择语言',
			'profilePage.premium' => '高级版',
			'profilePage.passive' => '被动',
			'profilePage.active' => '已开通',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => '分享给朋友',
			'profilePage.shareWithFriendTitle' => '与朋友分享',
			'profilePage.shareInviteBody' => '邀请你的朋友，一起享受翻译的乐趣',
			'profilePage.rateUs' => '评价我们',
			'profilePage.faq' => 'Lingola 常见问题',
			'profilePage.faqItems.supportedLanguages.question' => '应用支持哪些语言？',
			'profilePage.faqItems.supportedLanguages.answer' => '该应用目前支持英语、土耳其语和德语。新语言会定期添加。',
			'profilePage.faqItems.howAiWorks.question' => '人工智能是如何工作的？',
			'profilePage.faqItems.howAiWorks.answer' => '人工智能像真正的导师一样与你互动。它分析你的对话，检测错误，并根据你的进度提供个性化反馈。',
			'profilePage.faqItems.offlineUse.question' => '我可以离线使用应用吗？',
			'profilePage.faqItems.offlineUse.answer' => '可以。你可以提前下载某些课程和对话场景并离线使用。但是，实时聊天需要互联网连接。',
			'profilePage.faqItems.isFree.question' => '这个应用是免费的吗？',
			'profilePage.faqItems.isFree.answer' => '基础版本是免费的。通过高级版，你可以获得高级聊天场景、发音分析和个人导师模式。',
			'profilePage.faqItems.pronunciationEval.question' => '我的发音是如何评估的？',
			'profilePage.faqItems.pronunciationEval.answer' => '该应用分析你的声音，并使用人工智能驱动的语音识别来评分你的口音和发音。需要改进的单词会被突出显示。',
			'profilePage.faqItems.dailyPractice.question' => '我需要每天练习吗？',
			'profilePage.faqItems.dailyPractice.answer' => '是的。系统每天跟踪你的进度。每天只需10-15分钟的口语练习就能显著加快你的语言学习。',
			'profilePage.faqItems.levelDetermination.question' => '我的学习水平是如何确定的？',
			'profilePage.faqItems.levelDetermination.answer' => '首次登录时会进行一次短暂的水平检查，分析你的当前知识。之后，人工智能会自动推荐适合你水平的课程。',
			'profilePage.faqItems.realPeopleChat.question' => '我可以和真实的人聊天吗？',
			'profilePage.faqItems.realPeopleChat.answer' => '可以。高级用户可以安排与真实导师的短期练习课程。',
			'profilePage.faqItems.dataSecurity.question' => '我的数据安全吗？',
			'profilePage.faqItems.dataSecurity.answer' => '绝对安全。所有对话和用户数据都以加密形式存储。你的个人信息从不与第三方共享。',
			'profilePage.faqItems.disableReminders.question' => '我如何关闭每日提醒？',
			'profilePage.faqItems.disableReminders.answer' => '前往个人资料设置，打开通知，修改提醒频率或完全关闭通知。',
			'profilePage.support' => '支持',
			'profilePage.feedback' => '反馈',
			'profilePage.progression' => '进度',
			'profilePage.progressTitle' => '进度',
			'profilePage.goodMorning' => '早上好，',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => '英语',
			'profilePage.past7Days' => '过去7天',
			'profilePage.past7DaysBody' => '每天学习以建立你的连续学习记录，培养强大的学习习惯。',
			'profilePage.currentLevel' => '当前等级',
			'profilePage.xpLeft' => ({required Object level, required Object xp}) => '距离达到 ${level} 还差 ${xp} XP！',
			'profilePage.toNextLevel' => '前往下一个等级',
			'profilePage.dayStreakLabel' => '连续学习天数',
			'profilePage.totalPoints' => '总积分',
			'profilePage.savedWords' => '已保存单词',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} 个项目待复习',
			'profilePage.logout' => '登出',
			'profilePage.logoutTitle' => '你即将登出',
			'profilePage.logoutBody' => '期待很快再见！我们会想念你的呼吸练习。',
			'profilePage.logoutConfirm' => '登出',
			'profilePage.logoutCancel' => '取消',
			'profilePage.days.mon' => '周一',
			'profilePage.days.tue' => '周二',
			'profilePage.days.wed' => '周三',
			'profilePage.days.thu' => '周四',
			'profilePage.days.fri' => '周五',
			'profilePage.days.sat' => '周六',
			'profilePage.days.sun' => '周日',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => '看起来你休息了一会儿。',
			'pushNotifications.h2.1' => '有时间来学习一个单词吗？',
			'pushNotifications.h2.2' => '我们在这里 — 不着急。',
			'pushNotifications.h2.3' => '你的学习节奏暂停了一下。',
			'pushNotifications.h2.4' => '小小的复习可能会让你感觉不错。',
			'pushNotifications.h4.0' => '今天可能有一个新单词在等着你 👀',
			'pushNotifications.h4.1' => '你可能错过了一个快速练习。',
			'pushNotifications.h4.2' => '你可能跳过了一个有用的短语。',
			'pushNotifications.h4.3' => '今天的进展依然开放。',
			'pushNotifications.h4.4' => '一个单词，一个句子…也许两个都来。',
			'pushNotifications.h8.0' => '你不必每天都有进展。',
			'pushNotifications.h8.1' => '即使是小小的复习也很重要。',
			'pushNotifications.h8.2' => '今天没有学习也没有损失。',
			'pushNotifications.h8.3' => '我们随时准备好。',
			'pushNotifications.h8.4' => '语言学习是马拉松，而不是短跑。',
			'pushNotifications.h24.0' => '一天过去了。你的单词依然在这里。',
			'pushNotifications.h24.1' => '休息是很正常的。',
			'pushNotifications.h24.2' => '你的学习进度就在你离开的地方。',
			'pushNotifications.h24.3' => '随时继续学习。',
			'pushNotifications.h24.4' => '语言不会跑掉 — 我们也不会。',
			_ => null,
		};
	}
}
