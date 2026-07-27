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
class TranslationsTr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$tr app = _Translations$app$tr._(_root);
	@override late final _Translations$common$tr common = _Translations$common$tr._(_root);
	@override late final _Translations$onboarding$tr onboarding = _Translations$onboarding$tr._(_root);
	@override late final _Translations$targetLanguage$tr targetLanguage = _Translations$targetLanguage$tr._(_root);
	@override late final _Translations$language$tr language = _Translations$language$tr._(_root);
	@override late final _Translations$setup$tr setup = _Translations$setup$tr._(_root);
	@override late final _Translations$accountCreating$tr accountCreating = _Translations$accountCreating$tr._(_root);
	@override late final _Translations$previewChat$tr previewChat = _Translations$previewChat$tr._(_root);
	@override late final _Translations$paywall$tr paywall = _Translations$paywall$tr._(_root);
	@override late final _Translations$auth$tr auth = _Translations$auth$tr._(_root);
	@override late final _Translations$nav$tr nav = _Translations$nav$tr._(_root);
	@override late final _Translations$home$tr home = _Translations$home$tr._(_root);
	@override late final _Translations$libraryPage$tr libraryPage = _Translations$libraryPage$tr._(_root);
	@override late final _Translations$wordPracticePage$tr wordPracticePage = _Translations$wordPracticePage$tr._(_root);
	@override late final _Translations$quizPage$tr quizPage = _Translations$quizPage$tr._(_root);
	@override late final _Translations$placeholder$tr placeholder = _Translations$placeholder$tr._(_root);
	@override late final _Translations$tutorPage$tr tutorPage = _Translations$tutorPage$tr._(_root);
	@override late final _Translations$lessonPage$tr lessonPage = _Translations$lessonPage$tr._(_root);
	@override late final _Translations$rolePlayPage$tr rolePlayPage = _Translations$rolePlayPage$tr._(_root);
	@override late final _Translations$notificationsPage$tr notificationsPage = _Translations$notificationsPage$tr._(_root);
	@override late final _Translations$profilePage$tr profilePage = _Translations$profilePage$tr._(_root);
}

// Path: app
class _Translations$app$tr implements Translations$app$en {
	_Translations$app$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMİUM';
	@override String get notifications => 'Bildirimler';
	@override String get streak => 'Öğrenme serisi';
	@override String get profile => 'Profil';
}

// Path: common
class _Translations$common$tr implements Translations$common$en {
	_Translations$common$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get continueLabel => 'DEVAM ET';
	@override String get back => 'GERİ';
	@override String get locked => 'Kilitli';
	@override String minutes({required Object value}) => '${value} dk';
	@override String get close => 'Kapat';
	@override String get getStarted => 'BAŞLA';
}

// Path: onboarding
class _Translations$onboarding$tr implements Translations$onboarding$en {
	_Translations$onboarding$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Tanıtım sayfası ${current} / ${total}';
	@override late final _Translations$onboarding$slide1$tr slide1 = _Translations$onboarding$slide1$tr._(_root);
	@override late final _Translations$onboarding$slide2$tr slide2 = _Translations$onboarding$slide2$tr._(_root);
	@override late final _Translations$onboarding$slide3$tr slide3 = _Translations$onboarding$slide3$tr._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$tr implements Translations$targetLanguage$en {
	_Translations$targetLanguage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Öğrenmek istediğiniz dili seçiniz';
	@override String get comingSoon => 'Daha fazla dil yakında geliyor';
	@override String get korean => 'Korece';
	@override String get portuguese => 'Portekizce';
	@override String get portugueseBrazil => 'Portekizce (Brezilya)';
	@override String get german => 'Almanca';
	@override String get italian => 'İtalyanca';
	@override String get simplifiedChinese => 'Basitleştirilmiş Çince';
	@override String get arabic => 'Arapça';
	@override String get turkish => 'Türkçe';
	@override String get hindi => 'Hintçe';
}

// Path: language
class _Translations$language$tr implements Translations$language$en {
	_Translations$language$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String step({required Object total, required Object current}) => '${total} adımdan ${current}.';
	@override String get title => 'Hangi dili konuşmak istiyorsun?';
	@override String get nativeSection => 'Konuştuğum dil';
	@override String get nativeField => 'Ana dil';
	@override String get nativeName => 'Türkçe';
	@override String get targetSection => 'Öğrenmek istediğim dil';
	@override String get targetField => 'Hedef dil';
	@override String get targetName => 'İngilizce';
	@override String get direction => 'Dil yönü';
	@override String get selectLanguage => 'Dil seçin';
	@override String get comingSoonBadge => 'Yakında geliyor...';
	@override String get english => 'İngilizce';
	@override String get french => 'Fransızca';
	@override String get japanese => 'Japonca';
	@override String get spanish => 'İspanyolca';
	@override String get russian => 'Rusça';
}

// Path: setup
class _Translations$setup$tr implements Translations$setup$en {
	_Translations$setup$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get goalTitle => 'Hedefin nedir?';
	@override String get goalCareer => 'Kariyer Gelişimi';
	@override String get goalTravel => 'Seyahat';
	@override String get goalLiving => 'Yurt dışında yaşamak';
	@override String get goalStudying => 'Yurt dışında okumak';
	@override String get goalOther => 'Diğer';
	@override String get levelTitle => 'Mevcut dil seviyen nedir?';
	@override String get levelBeginner => 'Başlangıç — Birkaç kelime biliyorum';
	@override String get levelIntermediate => 'Orta — Basit sohbetler yapabiliyorum';
	@override String get levelAdvanced => 'İleri — Konuşuyorum ama geliştirmek istiyorum';
	@override String get paceTitle => 'Ne kadar hızlı ilerlemek istiyorsun?';
	@override String get paceLight => 'Günde 5-10 dk (hafif)';
	@override String get paceRecommended => 'Günde 15-20 dk (önerilen)';
	@override String get paceFast => 'Günde 30+ dk (hızlı sonuç)';
}

// Path: accountCreating
class _Translations$accountCreating$tr implements Translations$accountCreating$en {
	_Translations$accountCreating$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kişisel Hesabın Oluşturuluyor';
	@override String get stepContent => 'İçerik oluşturuluyor';
	@override String get stepDialogues => 'Diyaloglar hazırlanıyor';
	@override String get stepLessons => 'Dersler optimize ediliyor';
	@override String get stepPlan => 'Planın tamamlanıyor';
	@override String get optimization => 'Optimizasyon';
	@override String progress({required Object value}) => '%${value}';
}

// Path: previewChat
class _Translations$previewChat$tr implements Translations$previewChat$en {
	_Translations$previewChat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Ders 1: Selamlaşma';
	@override String get speed => '1x';
	@override String get typeMessage => 'Bir mesaj yaz...';
	@override String get incoming1 => 'Merhaba Emrah, tanıştığımıza memnun oldum. Bana biraz kendinden bahseder misin?';
	@override String get outgoing1 => 'Selam! Sabah kahvemi içtim ve bahsettiğin bağlantıyı kurmaya hazırım.';
	@override String get incoming2Highlight => 'Günaydın';
	@override String get incoming2Rest => ', Emrah! Hazır hissetmene sevindim. Sabah kahvesi bağlantı kurmak için harika bir başlangıç. Ne hakkında konuşmak istersin?';
	@override String get botReply => 'Harika! Selamlaşmaları birlikte pratik etmeye devam edelim.';
}

// Path: paywall
class _Translations$paywall$tr implements Translations$paywall$en {
	_Translations$paywall$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bugün Konuşmaya Başla — Ücretsiz';
	@override String get subtitle => 'Sınırsız öğrenme fırsatı';
	@override String get noCommitment => 'Taahhüt yok';
	@override String get cancelAnytime => 'İstediğin zaman iptal';
	@override String get noPaymentToday => 'Bugün ödeme yok';
	@override String get daysFree => '3 Gün Ücretsiz';
	@override String get thenPrice => 'Sonra \$1,99/ay';
	@override String get trialActive => 'Ücretsiz Deneme Aktif';
	@override String get payableToday => 'Bugün Ödenecek';
	@override String get payableValue => '3 Gün Ücretsiz 0,00\$';
	@override String get paymentDate => 'Ödeme tarihi: 13 Mart 2026';
	@override String get paymentAmount => '9,99\$';
}

// Path: auth
class _Translations$auth$tr implements Translations$auth$en {
	_Translations$auth$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Çeşitli AI eğitmenlerimiz';
	@override String get title => 'Bugün Yeni Bir Dil Konuşmaya Başla';
	@override String get body => 'Yapay zekâ ile gerçek konuşmalar yap.\nBaskı yok. Yargı yok.';
	@override String get continueGoogle => 'Google ile devam et';
	@override String get continueApple => 'Apple ile devam et';
	@override String get continueGuest => 'Misafir olarak devam et';
	@override String get legal => 'Lingola’ya kaydolarak Hizmet Şartlarımızı kabul etmiş olursun. Verilerini nasıl işlediğimizi Gizlilik Politikası ve Çerez Politikası’nda öğrenebilirsin';
	@override String get terms => 'Hizmet Şartları';
	@override String get privacy => 'Gizlilik Politikası';
	@override String get cookies => 'Çerez Politikası';
}

// Path: nav
class _Translations$nav$tr implements Translations$nav$en {
	_Translations$nav$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ana Sayfa';
	@override String get tutor => 'Eğitmen';
	@override String get lesson => 'Ders';
	@override String get rolePlay => 'Rol Yapma';
	@override String get profile => 'Profil';
}

// Path: home
class _Translations$home$tr implements Translations$home$en {
	_Translations$home$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get streakCount => '2';
	@override String get greeting => 'Günaydın, Jhon';
	@override String get todayPractice => 'Bugünkü Pratik';
	@override String get continueConversation => 'Konuşmaya Devam Et';
	@override String get lessonProgress => 'Ders 2 — Selamlaşma';
	@override String get timeCurrent => '46dk';
	@override String get timeTotal => '/ 60dk';
	@override String get kContinue => 'Devam Et';
	@override String get learningPath => 'A1 - Başlangıç';
	@override String get allLessons => 'Tüm Dersler';
	@override String get introductions => 'Tanışma I';
	@override String get greetings => 'Selamlaşma';
	@override String get jobs => 'Meslekler';
	@override String get favoriteRoom => 'Favori Oda';
	@override String get dailyRoutine => 'Günlük Rutin';
	@override String get scroll => 'Kaydır';
	@override String get liveLesson => 'Canlı Ders';
	@override String get liveLessonSubtitle => 'Eğitmenimizle görüntülü görüşme yap';
	@override String get moreTutor => 'Daha Fazla Eğitmen';
	@override String get startTalkNow => 'Hemen Konuş';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Uyarlanabilir';
	@override String get tagCalm => 'Sakin';
	@override String get tagPatient => 'Sabırlı';
	@override String get tagMethodical => 'Metodolojik';
	@override String get tagEncouraging => 'Cesaretlendirici';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Diğer Özellikler';
	@override String get practiceLabel => 'PRATİK';
	@override String get wordPractice => 'Kelime Pratiği';
	@override String get wordPracticeBody => 'Seçtiğin dilde kelime dağarcığını her gün geliştir';
	@override String get immersiveLabel => 'SÜRÜKLEYİCİ';
	@override String get quiz => 'Test';
	@override String get quizBodyLine1 => 'Gerçek örneklerle';
	@override String get quizBodyLine2 => 'bağlam içinde öğren';
	@override String get getStarted => 'Başla';
	@override String get library => 'Kütüphane';
	@override String get libraryTitle => 'Öğren ve Kaydet';
	@override String get learnMore => 'Daha Fazla';
	@override late final _Translations$home$premium$tr premium = _Translations$home$premium$tr._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$tr implements Translations$libraryPage$en {
	_Translations$libraryPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kütüphane';
	@override String get searchWord => 'Kelime Ara';
	@override String savedWordCount({required Object count}) => '${count} Kayıtlı Kelime';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$tr implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kelime Pratiği';
	@override String get turkish => 'TÜRKÇE';
	@override String get save => 'Kaydet';
	@override String get listen => 'Dinle';
	@override String get hint => 'İpucu';
	@override String get previous => 'ÖNCEKİ';
	@override String get next => 'SONRAKİ';
}

// Path: quizPage
class _Translations$quizPage$tr implements Translations$quizPage$en {
	_Translations$quizPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quiz';
	@override String get headline => 'Bugün neyi geliştirmek istiyorsun?';
	@override String get subtitle => 'Eğitimini seç — 3 dakikadan az sürer 🚀';
	@override String get readingTitle => 'Okuma';
	@override String get readingBody => 'Makale ve hikayelerle anlama';
	@override String get writingTitle => 'Yazma';
	@override String get writingBody => 'Dil bilgisi ve kelime egzersizleri';
	@override String get speakingTitle => 'Konuşma';
	@override String get speakingBody => 'AI konuşma motoruyla telaffuz';
	@override String get readingTestTitle => 'Okuma Testi';
	@override String get read => 'Oku';
	@override String get listeningHint => 'İngilizce kelimeyi net oku…';
	@override String get micPermissionDenied => 'Mikrofon veya konuşma tanıma kullanılamıyor.';
	@override String get matchSuccess => 'Harika! Kelimeyle eşleşti.';
	@override String matchFail({required Object heard}) => 'Duyulan: "${heard}". Tekrar dene.';
	@override String get successfulTitle => 'Successful!';
	@override String get successfulBody => 'Ana dili gibi bir telaffuz!';
	@override String get failedTitle => 'Failed';
	@override String get failedBody => 'Neredeyse oluyordu, bir şans daha ver';
	@override String get tryAgain => 'TEKRAR DENE';
	@override String get writingTestTitle => 'Writing Test';
	@override String get sourceLanguage => 'SOURCE LANGUAGE';
	@override String get answer => 'ANSWER';
	@override String get writeAnswerHint => 'Cevabını buraya yaz...';
	@override String get submit => 'Submit';
	@override String get speakingTestTitle => 'Speaking Test';
	@override String get speakingProficiency => 'Speaking Proficiency';
	@override String get speakClearlyHint => 'Speak clearly into your microphone:';
	@override String get speakUp => 'Speak Up';
	@override String get recording => 'Recording...';
	@override String questionOf({required Object current, required Object total}) => 'QUESTION ${current} OF ${total}';
}

// Path: placeholder
class _Translations$placeholder$tr implements Translations$placeholder$en {
	_Translations$placeholder$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} yakında burada';
	@override String body({required Object tab}) => 'Senin için odaklı bir ${tab} deneyimi hazırlıyoruz.';
}

// Path: tutorPage
class _Translations$tutorPage$tr implements Translations$tutorPage$en {
	_Translations$tutorPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eğitmen';
	@override String get chatWithLingola => 'Lingola ile Sohbet';
	@override String get chatHistory => 'Sohbet Geçmişi';
	@override String get history => 'Geçmiş';
	@override String get filter => 'Filtre';
	@override String get country => 'Ülke';
	@override String get focus => 'Odak';
	@override String get moreCountries => '8+ daha';
	@override String get moreFocus => '+8';
	@override String get save => 'KAYDET';
	@override String get startTalkNow => 'Hemen Konuş';
	@override String get typeMessage => 'Mesaj yaz...';
	@override String get speaker => 'Hoparlör';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$tr tutors = _Translations$tutorPage$tutors$tr._(_root);
	@override late final _Translations$tutorPage$tags$tr tags = _Translations$tutorPage$tags$tr._(_root);
	@override String get historyPreview1 => 'Hey! Can sıkıntısından patlamak üzereydim...';
	@override String get historyPreview2 => 'Bugün yemek siparişi pratiği yapalım mı?';
	@override String get time1 => '11:00';
	@override String get time2 => 'Dün';
	@override late final _Translations$tutorPage$chat$tr chat = _Translations$tutorPage$chat$tr._(_root);
	@override late final _Translations$tutorPage$calling$tr calling = _Translations$tutorPage$calling$tr._(_root);
}

// Path: lessonPage
class _Translations$lessonPage$tr implements Translations$lessonPage$en {
	_Translations$lessonPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Öğrenmeye Devam Et';
	@override String get profile => 'Profil';
	@override String get language => 'Hedef dil';
	@override String get completed => 'Tamamlandı';
	@override String get locked => 'Kilitli';
	@override late final _Translations$lessonPage$levels$tr levels = _Translations$lessonPage$levels$tr._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$tr implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rol Yapma';
	@override String get subtitle => 'Rolünü seç — gerçek bir senaryoyu deneyimle 🎭';
	@override String progressCompleted({required Object value}) => '%${value} tamamlandı';
	@override String minutes({required Object value}) => '${value} Dk';
	@override String get beginner => 'Başlangıç';
	@override String get screenplay => 'SENARYO';
	@override String get dailyInteractions => 'Günlük Etkileşimler';
	@override String get business => 'İş';
	@override late final _Translations$rolePlayPage$coffee$tr coffee = _Translations$rolePlayPage$coffee$tr._(_root);
	@override late final _Translations$rolePlayPage$directions$tr directions = _Translations$rolePlayPage$directions$tr._(_root);
	@override late final _Translations$rolePlayPage$interview$tr interview = _Translations$rolePlayPage$interview$tr._(_root);
}

// Path: notificationsPage
class _Translations$notificationsPage$tr implements Translations$notificationsPage$en {
	_Translations$notificationsPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildirimler';
	@override late final _Translations$notificationsPage$translation$tr translation = _Translations$notificationsPage$translation$tr._(_root);
	@override late final _Translations$notificationsPage$offer$tr offer = _Translations$notificationsPage$offer$tr._(_root);
	@override late final _Translations$notificationsPage$stories$tr stories = _Translations$notificationsPage$stories$tr._(_root);
}

// Path: profilePage
class _Translations$profilePage$tr implements Translations$profilePage$en {
	_Translations$profilePage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profile';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Free Version';
	@override String get dayStreak => 'Day Streak!';
	@override String get accountSettings => 'Account Settings';
	@override String get general => 'General';
	@override String get profileSettings => 'Profile Settings';
	@override String get fullName => 'Full Name';
	@override String get email => 'E-mail';
	@override String get deleteAccount => 'Delete Account';
	@override String get save => 'SAVE';
	@override String get deleteTitle => 'Gitmeni istemiyoruz ama seni anlıyoruz.';
	@override String get deleteBody => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?';
	@override late final _Translations$profilePage$deleteReasons$tr deleteReasons = _Translations$profilePage$deleteReasons$tr._(_root);
	@override String get messageOptional => 'Mesaj (opsiyonel)';
	@override String get messageHint => 'Mesajınız varsa lütfen yazın.';
	@override String get next => 'NEXT';
	@override String get specialOfferTitle => 'Özel teklif';
	@override String get specialOfferBody => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.';
	@override String get monthlyPlanTitle => 'Switch to 1-Month Plan';
	@override String get monthlyPlanPrice => '\$79/month, cancel anytime';
	@override String get monthlyPlanDesc => 'No long-term commitment. Stay connected with our community on a month-to-month basis.';
	@override String get whatYoullKeep => 'What you\'ll keep:';
	@override String get keepCharacters => 'Access all characters';
	@override String get keepVideo => 'Unlimited video calls';
	@override String get keepCourses => 'Access to all courses';
	@override String get switchMonthlyCta => 'Switch to Monthly Plan';
	@override String get confirmTitle => 'Are you sure?';
	@override String get confirmBody => 'We really don\'t want to see you go. Here\'s what you\'ll lose:';
	@override String get loseCharacters => 'Unlimited character access';
	@override String get loseVideo => 'Unlimited video call access';
	@override String get loseCourses => 'Access to all courses';
	@override String get discountTitle => 'Stay and get 60% off for 1 month';
	@override String get discountSubtitle => 'Our best offer ever. Just \$27.60/month';
	@override String get acceptDiscountCta => 'Accept 60% Off & Stay';
	@override String get farewellTitle => 'We\'re sad to see you go';
	@override String farewellBody({required Object date}) => 'Your membership has been cancelled. You\'ll have access until the end of your current billing period on ${date}.';
	@override String get changeMindTitle => '✨ Change your mind?';
	@override String changeMindBody({required Object date}) => 'You can reactivate your membership anytime before ${date} to keep your benefits.';
	@override String get reactivateCta => 'Wait, I want to reactivate';
	@override String get done => 'DONE';
	@override String get notifications => 'Notifications';
	@override String get appLanguage => 'App Language';
	@override String get selectLanguageTitle => 'Select Language';
	@override String get premium => 'Premium';
	@override String get passive => 'Passive';
	@override String get shareFriend => 'Share Friend';
	@override String get shareWithFriendTitle => 'Share with Friend';
	@override String get shareInviteBody => 'Invite your friends and enjoy translate together';
	@override String get rateUs => 'Rate Us';
	@override String get faq => 'F.A.Q.';
	@override late final _Translations$profilePage$faqItems$tr faqItems = _Translations$profilePage$faqItems$tr._(_root);
	@override String get support => 'Support';
	@override String get feedback => 'Feedback';
	@override String get progression => 'Progression';
	@override String get progressTitle => 'Progress';
	@override String get goodMorning => 'Good Morning,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'English';
	@override String get past7Days => 'Past 7 Days';
	@override String get past7DaysBody => 'Study every day to build your streak and create a powerful learning habit.';
	@override String get currentLevel => 'Current Level';
	@override String xpLeft({required Object xp, required Object level}) => 'Just ${xp} XP left to reach ${level}!';
	@override String get toNextLevel => 'TO NEXT LEVEL';
	@override String get dayStreakLabel => 'Day Streak';
	@override String get totalPoints => 'Total Points';
	@override String get savedWords => 'Saved Words';
	@override String itemsToReview({required Object count}) => '${count} items to review';
	@override String get logout => 'Log Out';
	@override String get logoutTitle => 'You are about to log out';
	@override String get logoutBody => 'See you again soon! We\'ll miss your breathing exercises.';
	@override String get logoutConfirm => 'LOGOUT';
	@override String get logoutCancel => 'CANCEL';
	@override late final _Translations$profilePage$days$tr days = _Translations$profilePage$days$tr._(_root);
}

// Path: onboarding.slide1
class _Translations$onboarding$slide1$tr implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aylar Değil, Haftalar İçinde Özgüvenle Konuş';
	@override String get body => 'Yapay zekâ ile gerçek konuşmalar yap. Aksanını, özgüvenini ve akıcılığını her gün geliştir.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Daha önce İngilizce konuşamıyordum. Artık işte her gün konuşuyorum.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$tr implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yüksek Ücret Olmadan Özel Eğitmen';
	@override String get body => 'Gerçek konuşmalar. Anında geri bildirim.\nProgram yok. Baskı yok.';
	@override String get realTutor => 'Gerçek Eğitmen';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / saat';
	@override String get priceLingola => '\$9,99 / yıl';
	@override String get versus => 'VS';
	@override String get scheduled => 'Planlı';
	@override String get anytime => 'Her zaman';
	@override String get stressful => 'Stresli';
	@override String get noPressure => 'Baskısız';
	@override String get price => 'Ücret';
	@override String get availability => 'Uygunluk';
	@override String get feeling => 'His';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$tr implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sana Göre Hazırlanan Öğrenme Planı';
	@override String get body => 'Hedeflerin, hızın, seviyen.\nBaşlangıçtan akıcılığa — adım adım.';
	@override String get goal => 'Hedef';
	@override String get practice => 'Pratik';
	@override String get progress => 'İlerleme';
}

// Path: home.premium
class _Translations$home$premium$tr implements Translations$home$premium$en {
	_Translations$home$premium$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Hata yapmaktan korkmadan, ';
	@override String get titleHighlight => 'akıcı konuşmaya';
	@override String get titleAfter => ' giden yol.';
	@override String get descriptionBefore => 'Dünya genelinde milyonlarca öğrenciye katıl. Dil bariyerini bugün aşmaya başla — ';
	@override String get descriptionHighlight => 'ilk 3 gün tamamen ücretsiz.';
	@override String get feature1 => '7/24 erişilebilir AI Eğitmen';
	@override String get feature2 => 'Özel Eğitmenlere sınırsız erişim';
	@override String get feature3 => 'Sana özel hazırlanmış günlük ders planı';
	@override String get priceAmount => '1,99\$';
	@override String get pricePeriod => '/mo';
	@override String get discount => 'Yıllık alımda %40 indirim';
	@override String get cta => 'Başlayın';
}

// Path: tutorPage.tutors
class _Translations$tutorPage$tutors$tr implements Translations$tutorPage$tutors$en {
	_Translations$tutorPage$tutors$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

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
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$tr implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Uyarlanabilir';
	@override String get calm => 'Sakin';
	@override String get patient => 'Sabırlı';
	@override String get organized => 'Düzenli';
	@override String get relaxed => 'Rahat';
	@override String get methodical => 'Metodikli';
	@override String get attentive => 'Dikkatli';
	@override String get more => '+5';
	@override String get curious => 'Meraklı';
	@override String get observer => 'Gözlemci';
	@override String get ancientKnowledge => 'Kadim Bilgi';
	@override String get wise => 'Bilge';
	@override String get clear => 'Net';
	@override String get decisive => 'Kararlı';
	@override String get disciplined => 'Disiplinli';
	@override String get smart => 'Zeki';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$tr implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Günaydın! Bugün pratik yapmaya hazır olmana sevindim.';
	@override String get outgoing1 => 'Evet, selamlaşmayla başlayalım.';
	@override String get incoming2 => 'Harika. Bir iş arkadaşına merhaba nasıl dersin?';
	@override String get typing => 'Yazıyor';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$tr implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Ders 1 : Selamlaşma';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Bored? I deleted that word from my vocabulary. Get up, the plan\'s already set: we\'re hitting that new arcade bar in Kadıköy.';
	@override String get highlight => 'Bored?';
	@override String get close => 'Görüşmeyi bitir';
	@override String get toggleCaptions => 'Altyazıyı aç/kapat';
	@override String get toggleHints => 'İpuçlarını aç/kapat';
	@override String get toggleMic => 'Mikrofonu aç/kapat';
}

// Path: lessonPage.levels
class _Translations$lessonPage$levels$tr implements Translations$lessonPage$levels$en {
	_Translations$lessonPage$levels$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$lessonPage$levels$a1$tr a1 = _Translations$lessonPage$levels$a1$tr._(_root);
	@override late final _Translations$lessonPage$levels$a2$tr a2 = _Translations$lessonPage$levels$a2$tr._(_root);
	@override late final _Translations$lessonPage$levels$b1$tr b1 = _Translations$lessonPage$levels$b1$tr._(_root);
	@override late final _Translations$lessonPage$levels$b2$tr b2 = _Translations$lessonPage$levels$b2$tr._(_root);
	@override late final _Translations$lessonPage$levels$c1$tr c1 = _Translations$lessonPage$levels$c1$tr._(_root);
	@override late final _Translations$lessonPage$levels$c2$tr c2 = _Translations$lessonPage$levels$c2$tr._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$tr implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kafede Sipariş Verme';
	@override String get screenplay => 'Favori içeceğini sipariş et, boyut ve ekstraları sor, toplamı onayla ve tezgâhtan kahveni al.';
	@override late final _Translations$rolePlayPage$coffee$chat$tr chat = _Translations$rolePlayPage$coffee$chat$tr._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$tr implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sokakta Yol Sorma';
	@override String get screenplay => 'Bir yere yol sor, metro veya otobüse nasıl gideceğini öğren, bilet bilgisi al ve restoran önerilerini dinle.';
	@override late final _Translations$rolePlayPage$directions$chat$tr chat = _Translations$rolePlayPage$directions$chat$tr._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$tr implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'İş Görüşmesi';
	@override String get screenplay => 'Kendini tanıt, sık sorulan soruları yanıtla, deneyiminden bahset ve rol ile sonraki adımları sor.';
	@override late final _Translations$rolePlayPage$interview$chat$tr chat = _Translations$rolePlayPage$interview$chat$tr._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$tr implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yeni Çeviri Hazır';
	@override String get body => 'Ses çeviri dosyan başarıyla metne dönüştürüldü ve çevrildi.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$tr implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Seni Özel Bir Teklif Bekliyor';
	@override String get body => 'Sınırsız fotoğraf çevirisi için Premium’a yükselt — %50 indirim.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$tr implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yeni Hikayeleri Keşfet';
	@override String get body => 'Hikayelerle yeni kelimeler öğren';
}

// Path: profilePage.deleteReasons
class _Translations$profilePage$deleteReasons$tr implements Translations$profilePage$deleteReasons$en {
	_Translations$profilePage$deleteReasons$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get aiCharacters => 'Yapay zeka karakterlerini gerçekçi bulmadım.';
	@override String get videoIssues => 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.';
	@override String get pricing => 'Abonelik fiyatları beklentimin üzerinde.';
	@override String get noMatch => 'Aradığım tarzda karakterler bulamadım.';
	@override String get shortTrial => 'Sadece kısa bir süreliğine denemek istemiştim.';
	@override String get other => 'Diğer';
}

// Path: profilePage.faqItems
class _Translations$profilePage$faqItems$tr implements Translations$profilePage$faqItems$en {
	_Translations$profilePage$faqItems$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profilePage$faqItems$howItWorks$tr howItWorks = _Translations$profilePage$faqItems$howItWorks$tr._(_root);
	@override late final _Translations$profilePage$faqItems$replacePsychologist$tr replacePsychologist = _Translations$profilePage$faqItems$replacePsychologist$tr._(_root);
	@override late final _Translations$profilePage$faqItems$dataPrivate$tr dataPrivate = _Translations$profilePage$faqItems$dataPrivate$tr._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$tr implements Translations$profilePage$days$en {
	_Translations$profilePage$days$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get mon => 'MON';
	@override String get tue => 'TUE';
	@override String get wed => 'WED';
	@override String get thu => 'THU';
	@override String get fri => 'FRI';
	@override String get sat => 'SAT';
	@override String get sun => 'SUN';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$tr implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Başlangıç';
	@override List<String> get lessons => [
		'Selamlaşma',
		'Tanışma I',
		'Meslekler',
		'Favori Oda',
		'Günlük Rutin',
		'Meyveler',
		'Tavsiye 1',
		'Aile 1',
		'Günlük eşyalar',
		'Memleket',
		'Ev',
		'Yemek tercihleri',
		'Hobiler 1',
		'Başarılı insanlar',
		'Yiyecek ve içecekler',
		'Restoranda sipariş',
		'Evcil hayvanlar',
		'Sağlık ve fitness',
		'Hava durumu',
		'Yeni yaşam tarzı',
		'İyileşmek',
		'Hobiler 2',
		'Yerler hakkında sorular',
		'Sahiplik',
		'Alışveriş 1',
		'Saati söylemek',
		'Yol tarifi 1',
		'Alışveriş 2',
		'Seni tanımak',
		'Nesnelerin yerleri',
		'Görünüş',
		'Yol tarifi 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$tr implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Temel';
	@override List<String> get lessons => [
		'Family 2',
		'People and places',
		'Family 3',
		'Describing objects',
		'City',
		'The building project',
		'Home sweet home',
		'What time is it',
		'Daily routine 2',
		'Free time',
		'Food and nutrition',
		'Shopping and consumer',
		'Holidays',
		'Weekend plans',
		'Formal or casual',
		'Fashion',
		'Shopping 3',
		'Advice 2',
		'You can do it',
		'Shopping 4',
		'Small talk',
		'One latte please',
		'Food',
		'Getting around',
		'Ready for a trip',
		'Travel 1',
		'Urban escapes',
		'Travel 2',
		'A place to stay',
		'So exciting',
		'The right person',
		'School',
		'Music preferences',
		'Sports',
		'Rules of the race',
		'Leave a message',
		'Requests',
		'Invitations',
		'Travel experiences',
		'Past tense 1',
		'Past tense 2',
		'Past tense 3',
		'Questions about the past',
		'You are never too old',
		'Childhood memories',
		'Compliments',
		'Excuses',
		'It\'s so annoying!',
		'A digital world',
		'Work life',
		'I did not get that',
		'Save or spend?',
		'Say sorry',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$tr implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Orta';
	@override List<String> get lessons => [
		'Cultural traditions',
		'Celebrities',
		'Art and creativity',
		'Future plans',
		'Planning events',
		'Goals and plans',
		'Historical events',
		'Technology',
		'Never ever',
		'What is on',
		'Dream vacation',
		'Social media',
		'Book recommendations',
		'One of those days',
		'Special photos',
		'Personal achievements',
		'Favourite movies',
		'News flash',
		'Happiness',
		'A busy week',
		'Where I grew up',
		'School days',
		'Profiles',
		'Life maps',
		'Everyday',
		'What is next',
		'Suggestion making',
		'What happened',
		'Memories',
		'Culture shock',
		'Interest phrases',
		'Job interviews',
		'Bucket lists',
		'My kind of town',
		'The internet generation',
		'Popular brands',
		'Opinion phrases',
		'How does it look',
		'Living space',
		'Eating well',
		'Unusual hobbies',
		'A difficult choice',
		'Take action',
		'New skills',
		'Making a complaint',
		'Education',
		'Green cities',
		'What is in a job',
		'Personal challenges',
		'Interview phrases',
		'Polite endings',
		'Headline news',
		'Small changes',
		'Apologies excuses',
		'Phone etiquette',
		'Sorry to interrupt…',
		'Complaint responses',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$tr implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Orta Üstü';
	@override List<String> get lessons => [
		'Personalities',
		'Great leads',
		'Healthy lifestyle',
		'What is the truth?',
		'Personal growth',
		'Speaking out',
		'Acting out?',
		'I remember...',
		'Social feedback',
		'Crime scene',
		'Polite trouble',
		'Conflict resolution',
		'Love it or loathe it?',
		'Environmental issues',
		'We can work it out',
		'Mysteries and crimes',
		'Possible futures',
		'Business plans',
		'Meeting decisions',
		'It\'s so predictable...',
		'On the job',
		'Science and technology',
		'Time management',
		'Human rights',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$tr implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - İleri';
	@override List<String> get lessons => [
		'Cultural norms',
		'Social media influence',
		'Career choices',
		'Accelerate performance',
		'Inventions',
		'Time travel',
		'Possessions',
		'Job skills',
		'Historical changes',
		'Review writing',
		'Mysteries',
		'Strange theories',
		'Celebrity',
		'Global politics',
		'Product boom',
		'Will be happy?',
		'Maybe later...',
		'New solutions',
		'Contextual influence',
		'A lost logo',
		'Kind acts',
		'What a movie',
		'How annoying',
		'In the news',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$tr implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Uzman';
	@override List<String> get lessons => [
		'Globalization',
		'Natural disasters',
		'Reacting to information',
		'Work-life balance',
		'Remote work',
		'Family issues',
		'Basic human anatomy',
		'Health predictions',
		'Healthcare access',
		'Global travel experience',
		'Superpowers',
		'Team building',
		'Biofluorescence',
		'Dilemmas',
		'Social enthusiasm',
		'Changes',
		'Work, work, work',
		'Local issues',
		'Problems, problems',
		'Fact or fiction?',
		'Sightseeing',
		'Volunteering',
		'The mind\'s eye',
		'Media consumption',
	];
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$tr implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Hoş geldiniz! Bugün ne alırsınız?';
	@override String get outgoing1 => 'Merhaba! Orta boy bir latte istiyorum lütfen.';
	@override String get incoming2Highlight => 'Tabii';
	@override String get incoming2Rest => '! Sıcak mı buzlu mu olsun, ekstra ister misiniz?';
	@override String get botReply => 'Harika tercih. Siparişinize başka bir şey ekleyelim mi?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$tr implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Merhaba! Biraz kaybolmuş görünüyorsunuz — bir yere mi bakıyorsunuz?';
	@override String get outgoing1 => 'Evet, en yakın metro istasyonunu arıyorum.';
	@override String get incoming2Highlight => 'Tabii ki';
	@override String get incoming2Rest => '! İki blok o tarafa yürüyün, sonra sola dönün. Girişi göreceksiniz.';
	@override String get botReply => 'Rica ederim! İstasyonun yanında bir restoran önerisi de ister misiniz?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$tr implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Bugün geldiğiniz için teşekkürler. Kendinizi kısaca tanıtır mısınız?';
	@override String get outgoing1 => 'Tabii. Burada olmaktan mutluyum ve deneyimimi paylaşmak istiyorum.';
	@override String get incoming2Highlight => 'Harika';
	@override String get incoming2Rest => '. Gurur duyduğunuz yakın bir projeden bahseder misiniz?';
	@override String get botReply => 'Çok etkileyici. Rol hakkında ne sormak istersiniz?';
}

// Path: profilePage.faqItems.howItWorks
class _Translations$profilePage$faqItems$howItWorks$tr implements Translations$profilePage$faqItems$howItWorks$en {
	_Translations$profilePage$faqItems$howItWorks$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'How does this app work?';
	@override String get answer => 'Our app uses artificial intelligence to analyze your emotional state through your written or spoken inputs. It provides personalized insights, mood tracking, and mental-wellness exercises designed to help you better understand and manage your emotions.';
}

// Path: profilePage.faqItems.replacePsychologist
class _Translations$profilePage$faqItems$replacePsychologist$tr implements Translations$profilePage$faqItems$replacePsychologist$en {
	_Translations$profilePage$faqItems$replacePsychologist$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Can this app replace a real psychologist?';
	@override String get answer => 'No. This app is designed to support your wellbeing and learning journey, but it does not replace professional mental health care. If you need clinical support, please consult a licensed specialist.';
}

// Path: profilePage.faqItems.dataPrivate
class _Translations$profilePage$faqItems$dataPrivate$tr implements Translations$profilePage$faqItems$dataPrivate$en {
	_Translations$profilePage$faqItems$dataPrivate$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Are my conversations and data private?';
	@override String get answer => 'Yes. Your conversations and personal data are kept private and handled according to our privacy policy. We do not sell your data to third parties.';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Lingola',
			'app.premium' => 'PREMİUM',
			'app.notifications' => 'Bildirimler',
			'app.streak' => 'Öğrenme serisi',
			'app.profile' => 'Profil',
			'common.continueLabel' => 'DEVAM ET',
			'common.back' => 'GERİ',
			'common.locked' => 'Kilitli',
			'common.minutes' => ({required Object value}) => '${value} dk',
			'common.close' => 'Kapat',
			'common.getStarted' => 'BAŞLA',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Tanıtım sayfası ${current} / ${total}',
			'onboarding.slide1.title' => 'Aylar Değil, Haftalar İçinde Özgüvenle Konuş',
			'onboarding.slide1.body' => 'Yapay zekâ ile gerçek konuşmalar yap. Aksanını, özgüvenini ve akıcılığını her gün geliştir.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Daha önce İngilizce konuşamıyordum. Artık işte her gün konuşuyorum.',
			'onboarding.slide2.title' => 'Yüksek Ücret Olmadan Özel Eğitmen',
			'onboarding.slide2.body' => 'Gerçek konuşmalar. Anında geri bildirim.\nProgram yok. Baskı yok.',
			'onboarding.slide2.realTutor' => 'Gerçek Eğitmen',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / saat',
			'onboarding.slide2.priceLingola' => '\$9,99 / yıl',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Planlı',
			'onboarding.slide2.anytime' => 'Her zaman',
			'onboarding.slide2.stressful' => 'Stresli',
			'onboarding.slide2.noPressure' => 'Baskısız',
			'onboarding.slide2.price' => 'Ücret',
			'onboarding.slide2.availability' => 'Uygunluk',
			'onboarding.slide2.feeling' => 'His',
			'onboarding.slide3.title' => 'Sana Göre Hazırlanan Öğrenme Planı',
			'onboarding.slide3.body' => 'Hedeflerin, hızın, seviyen.\nBaşlangıçtan akıcılığa — adım adım.',
			'onboarding.slide3.goal' => 'Hedef',
			'onboarding.slide3.practice' => 'Pratik',
			'onboarding.slide3.progress' => 'İlerleme',
			'targetLanguage.title' => 'Öğrenmek istediğiniz dili seçiniz',
			'targetLanguage.comingSoon' => 'Daha fazla dil yakında geliyor',
			'targetLanguage.korean' => 'Korece',
			'targetLanguage.portuguese' => 'Portekizce',
			'targetLanguage.portugueseBrazil' => 'Portekizce (Brezilya)',
			'targetLanguage.german' => 'Almanca',
			'targetLanguage.italian' => 'İtalyanca',
			'targetLanguage.simplifiedChinese' => 'Basitleştirilmiş Çince',
			'targetLanguage.arabic' => 'Arapça',
			'targetLanguage.turkish' => 'Türkçe',
			'targetLanguage.hindi' => 'Hintçe',
			'language.step' => ({required Object total, required Object current}) => '${total} adımdan ${current}.',
			'language.title' => 'Hangi dili konuşmak istiyorsun?',
			'language.nativeSection' => 'Konuştuğum dil',
			'language.nativeField' => 'Ana dil',
			'language.nativeName' => 'Türkçe',
			'language.targetSection' => 'Öğrenmek istediğim dil',
			'language.targetField' => 'Hedef dil',
			'language.targetName' => 'İngilizce',
			'language.direction' => 'Dil yönü',
			'language.selectLanguage' => 'Dil seçin',
			'language.comingSoonBadge' => 'Yakında geliyor...',
			'language.english' => 'İngilizce',
			'language.french' => 'Fransızca',
			'language.japanese' => 'Japonca',
			'language.spanish' => 'İspanyolca',
			'language.russian' => 'Rusça',
			'setup.goalTitle' => 'Hedefin nedir?',
			'setup.goalCareer' => 'Kariyer Gelişimi',
			'setup.goalTravel' => 'Seyahat',
			'setup.goalLiving' => 'Yurt dışında yaşamak',
			'setup.goalStudying' => 'Yurt dışında okumak',
			'setup.goalOther' => 'Diğer',
			'setup.levelTitle' => 'Mevcut dil seviyen nedir?',
			'setup.levelBeginner' => 'Başlangıç — Birkaç kelime biliyorum',
			'setup.levelIntermediate' => 'Orta — Basit sohbetler yapabiliyorum',
			'setup.levelAdvanced' => 'İleri — Konuşuyorum ama geliştirmek istiyorum',
			'setup.paceTitle' => 'Ne kadar hızlı ilerlemek istiyorsun?',
			'setup.paceLight' => 'Günde 5-10 dk (hafif)',
			'setup.paceRecommended' => 'Günde 15-20 dk (önerilen)',
			'setup.paceFast' => 'Günde 30+ dk (hızlı sonuç)',
			'accountCreating.title' => 'Kişisel Hesabın Oluşturuluyor',
			'accountCreating.stepContent' => 'İçerik oluşturuluyor',
			'accountCreating.stepDialogues' => 'Diyaloglar hazırlanıyor',
			'accountCreating.stepLessons' => 'Dersler optimize ediliyor',
			'accountCreating.stepPlan' => 'Planın tamamlanıyor',
			'accountCreating.optimization' => 'Optimizasyon',
			'accountCreating.progress' => ({required Object value}) => '%${value}',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Ders 1: Selamlaşma',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Bir mesaj yaz...',
			'previewChat.incoming1' => 'Merhaba Emrah, tanıştığımıza memnun oldum. Bana biraz kendinden bahseder misin?',
			'previewChat.outgoing1' => 'Selam! Sabah kahvemi içtim ve bahsettiğin bağlantıyı kurmaya hazırım.',
			'previewChat.incoming2Highlight' => 'Günaydın',
			'previewChat.incoming2Rest' => ', Emrah! Hazır hissetmene sevindim. Sabah kahvesi bağlantı kurmak için harika bir başlangıç. Ne hakkında konuşmak istersin?',
			'previewChat.botReply' => 'Harika! Selamlaşmaları birlikte pratik etmeye devam edelim.',
			'paywall.title' => 'Bugün Konuşmaya Başla — Ücretsiz',
			'paywall.subtitle' => 'Sınırsız öğrenme fırsatı',
			'paywall.noCommitment' => 'Taahhüt yok',
			'paywall.cancelAnytime' => 'İstediğin zaman iptal',
			'paywall.noPaymentToday' => 'Bugün ödeme yok',
			'paywall.daysFree' => '3 Gün Ücretsiz',
			'paywall.thenPrice' => 'Sonra \$1,99/ay',
			'paywall.trialActive' => 'Ücretsiz Deneme Aktif',
			'paywall.payableToday' => 'Bugün Ödenecek',
			'paywall.payableValue' => '3 Gün Ücretsiz 0,00\$',
			'paywall.paymentDate' => 'Ödeme tarihi: 13 Mart 2026',
			'paywall.paymentAmount' => '9,99\$',
			'auth.trainersBadge' => 'Çeşitli AI eğitmenlerimiz',
			'auth.title' => 'Bugün Yeni Bir Dil Konuşmaya Başla',
			'auth.body' => 'Yapay zekâ ile gerçek konuşmalar yap.\nBaskı yok. Yargı yok.',
			'auth.continueGoogle' => 'Google ile devam et',
			'auth.continueApple' => 'Apple ile devam et',
			'auth.continueGuest' => 'Misafir olarak devam et',
			'auth.legal' => 'Lingola’ya kaydolarak Hizmet Şartlarımızı kabul etmiş olursun. Verilerini nasıl işlediğimizi Gizlilik Politikası ve Çerez Politikası’nda öğrenebilirsin',
			'auth.terms' => 'Hizmet Şartları',
			'auth.privacy' => 'Gizlilik Politikası',
			'auth.cookies' => 'Çerez Politikası',
			'nav.home' => 'Ana Sayfa',
			'nav.tutor' => 'Eğitmen',
			'nav.lesson' => 'Ders',
			'nav.rolePlay' => 'Rol Yapma',
			'nav.profile' => 'Profil',
			'home.streakCount' => '2',
			'home.greeting' => 'Günaydın, Jhon',
			'home.todayPractice' => 'Bugünkü Pratik',
			'home.continueConversation' => 'Konuşmaya Devam Et',
			'home.lessonProgress' => 'Ders 2 — Selamlaşma',
			'home.timeCurrent' => '46dk',
			'home.timeTotal' => '/ 60dk',
			'home.kContinue' => 'Devam Et',
			'home.learningPath' => 'A1 - Başlangıç',
			'home.allLessons' => 'Tüm Dersler',
			'home.introductions' => 'Tanışma I',
			'home.greetings' => 'Selamlaşma',
			'home.jobs' => 'Meslekler',
			'home.favoriteRoom' => 'Favori Oda',
			'home.dailyRoutine' => 'Günlük Rutin',
			'home.scroll' => 'Kaydır',
			'home.liveLesson' => 'Canlı Ders',
			'home.liveLessonSubtitle' => 'Eğitmenimizle görüntülü görüşme yap',
			'home.moreTutor' => 'Daha Fazla Eğitmen',
			'home.startTalkNow' => 'Hemen Konuş',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Uyarlanabilir',
			'home.tagCalm' => 'Sakin',
			'home.tagPatient' => 'Sabırlı',
			'home.tagMethodical' => 'Metodolojik',
			'home.tagEncouraging' => 'Cesaretlendirici',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Diğer Özellikler',
			'home.practiceLabel' => 'PRATİK',
			'home.wordPractice' => 'Kelime Pratiği',
			'home.wordPracticeBody' => 'Seçtiğin dilde kelime dağarcığını her gün geliştir',
			'home.immersiveLabel' => 'SÜRÜKLEYİCİ',
			'home.quiz' => 'Test',
			'home.quizBodyLine1' => 'Gerçek örneklerle',
			'home.quizBodyLine2' => 'bağlam içinde öğren',
			'home.getStarted' => 'Başla',
			'home.library' => 'Kütüphane',
			'home.libraryTitle' => 'Öğren ve Kaydet',
			'home.learnMore' => 'Daha Fazla',
			'home.premium.titleBefore' => 'Hata yapmaktan korkmadan, ',
			'home.premium.titleHighlight' => 'akıcı konuşmaya',
			'home.premium.titleAfter' => ' giden yol.',
			'home.premium.descriptionBefore' => 'Dünya genelinde milyonlarca öğrenciye katıl. Dil bariyerini bugün aşmaya başla — ',
			'home.premium.descriptionHighlight' => 'ilk 3 gün tamamen ücretsiz.',
			'home.premium.feature1' => '7/24 erişilebilir AI Eğitmen',
			'home.premium.feature2' => 'Özel Eğitmenlere sınırsız erişim',
			'home.premium.feature3' => 'Sana özel hazırlanmış günlük ders planı',
			'home.premium.priceAmount' => '1,99\$',
			'home.premium.pricePeriod' => '/mo',
			'home.premium.discount' => 'Yıllık alımda %40 indirim',
			'home.premium.cta' => 'Başlayın',
			'libraryPage.title' => 'Kütüphane',
			'libraryPage.searchWord' => 'Kelime Ara',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Kayıtlı Kelime',
			'wordPracticePage.title' => 'Kelime Pratiği',
			'wordPracticePage.turkish' => 'TÜRKÇE',
			'wordPracticePage.save' => 'Kaydet',
			'wordPracticePage.listen' => 'Dinle',
			'wordPracticePage.hint' => 'İpucu',
			'wordPracticePage.previous' => 'ÖNCEKİ',
			'wordPracticePage.next' => 'SONRAKİ',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'Bugün neyi geliştirmek istiyorsun?',
			'quizPage.subtitle' => 'Eğitimini seç — 3 dakikadan az sürer 🚀',
			'quizPage.readingTitle' => 'Okuma',
			'quizPage.readingBody' => 'Makale ve hikayelerle anlama',
			'quizPage.writingTitle' => 'Yazma',
			'quizPage.writingBody' => 'Dil bilgisi ve kelime egzersizleri',
			'quizPage.speakingTitle' => 'Konuşma',
			'quizPage.speakingBody' => 'AI konuşma motoruyla telaffuz',
			'quizPage.readingTestTitle' => 'Okuma Testi',
			'quizPage.read' => 'Oku',
			'quizPage.listeningHint' => 'İngilizce kelimeyi net oku…',
			'quizPage.micPermissionDenied' => 'Mikrofon veya konuşma tanıma kullanılamıyor.',
			'quizPage.matchSuccess' => 'Harika! Kelimeyle eşleşti.',
			'quizPage.matchFail' => ({required Object heard}) => 'Duyulan: "${heard}". Tekrar dene.',
			'quizPage.successfulTitle' => 'Successful!',
			'quizPage.successfulBody' => 'Ana dili gibi bir telaffuz!',
			'quizPage.failedTitle' => 'Failed',
			'quizPage.failedBody' => 'Neredeyse oluyordu, bir şans daha ver',
			'quizPage.tryAgain' => 'TEKRAR DENE',
			'quizPage.writingTestTitle' => 'Writing Test',
			'quizPage.sourceLanguage' => 'SOURCE LANGUAGE',
			'quizPage.answer' => 'ANSWER',
			'quizPage.writeAnswerHint' => 'Cevabını buraya yaz...',
			'quizPage.submit' => 'Submit',
			'quizPage.speakingTestTitle' => 'Speaking Test',
			'quizPage.speakingProficiency' => 'Speaking Proficiency',
			'quizPage.speakClearlyHint' => 'Speak clearly into your microphone:',
			'quizPage.speakUp' => 'Speak Up',
			'quizPage.recording' => 'Recording...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'QUESTION ${current} OF ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} yakında burada',
			'placeholder.body' => ({required Object tab}) => 'Senin için odaklı bir ${tab} deneyimi hazırlıyoruz.',
			'tutorPage.title' => 'Eğitmen',
			'tutorPage.chatWithLingola' => 'Lingola ile Sohbet',
			'tutorPage.chatHistory' => 'Sohbet Geçmişi',
			'tutorPage.history' => 'Geçmiş',
			'tutorPage.filter' => 'Filtre',
			'tutorPage.country' => 'Ülke',
			'tutorPage.focus' => 'Odak',
			'tutorPage.moreCountries' => '8+ daha',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'KAYDET',
			'tutorPage.startTalkNow' => 'Hemen Konuş',
			'tutorPage.typeMessage' => 'Mesaj yaz...',
			'tutorPage.speaker' => 'Hoparlör',
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
			'tutorPage.tags.adaptive' => 'Uyarlanabilir',
			'tutorPage.tags.calm' => 'Sakin',
			'tutorPage.tags.patient' => 'Sabırlı',
			'tutorPage.tags.organized' => 'Düzenli',
			'tutorPage.tags.relaxed' => 'Rahat',
			'tutorPage.tags.methodical' => 'Metodikli',
			'tutorPage.tags.attentive' => 'Dikkatli',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Meraklı',
			'tutorPage.tags.observer' => 'Gözlemci',
			'tutorPage.tags.ancientKnowledge' => 'Kadim Bilgi',
			'tutorPage.tags.wise' => 'Bilge',
			'tutorPage.tags.clear' => 'Net',
			'tutorPage.tags.decisive' => 'Kararlı',
			'tutorPage.tags.disciplined' => 'Disiplinli',
			'tutorPage.tags.smart' => 'Zeki',
			'tutorPage.historyPreview1' => 'Hey! Can sıkıntısından patlamak üzereydim...',
			'tutorPage.historyPreview2' => 'Bugün yemek siparişi pratiği yapalım mı?',
			'tutorPage.time1' => '11:00',
			'tutorPage.time2' => 'Dün',
			'tutorPage.chat.incoming1' => 'Günaydın! Bugün pratik yapmaya hazır olmana sevindim.',
			'tutorPage.chat.outgoing1' => 'Evet, selamlaşmayla başlayalım.',
			'tutorPage.chat.incoming2' => 'Harika. Bir iş arkadaşına merhaba nasıl dersin?',
			'tutorPage.chat.typing' => 'Yazıyor',
			'tutorPage.calling.lessonBadge' => 'Ders 1 : Selamlaşma',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Bored? I deleted that word from my vocabulary. Get up, the plan\'s already set: we\'re hitting that new arcade bar in Kadıköy.',
			'tutorPage.calling.highlight' => 'Bored?',
			'tutorPage.calling.close' => 'Görüşmeyi bitir',
			'tutorPage.calling.toggleCaptions' => 'Altyazıyı aç/kapat',
			'tutorPage.calling.toggleHints' => 'İpuçlarını aç/kapat',
			'tutorPage.calling.toggleMic' => 'Mikrofonu aç/kapat',
			'lessonPage.title' => 'Öğrenmeye Devam Et',
			'lessonPage.profile' => 'Profil',
			'lessonPage.language' => 'Hedef dil',
			'lessonPage.completed' => 'Tamamlandı',
			'lessonPage.locked' => 'Kilitli',
			'lessonPage.levels.a1.title' => 'A1 - Başlangıç',
			'lessonPage.levels.a1.lessons.0' => 'Selamlaşma',
			'lessonPage.levels.a1.lessons.1' => 'Tanışma I',
			'lessonPage.levels.a1.lessons.2' => 'Meslekler',
			'lessonPage.levels.a1.lessons.3' => 'Favori Oda',
			'lessonPage.levels.a1.lessons.4' => 'Günlük Rutin',
			'lessonPage.levels.a1.lessons.5' => 'Meyveler',
			'lessonPage.levels.a1.lessons.6' => 'Tavsiye 1',
			'lessonPage.levels.a1.lessons.7' => 'Aile 1',
			'lessonPage.levels.a1.lessons.8' => 'Günlük eşyalar',
			'lessonPage.levels.a1.lessons.9' => 'Memleket',
			'lessonPage.levels.a1.lessons.10' => 'Ev',
			'lessonPage.levels.a1.lessons.11' => 'Yemek tercihleri',
			'lessonPage.levels.a1.lessons.12' => 'Hobiler 1',
			'lessonPage.levels.a1.lessons.13' => 'Başarılı insanlar',
			'lessonPage.levels.a1.lessons.14' => 'Yiyecek ve içecekler',
			'lessonPage.levels.a1.lessons.15' => 'Restoranda sipariş',
			'lessonPage.levels.a1.lessons.16' => 'Evcil hayvanlar',
			'lessonPage.levels.a1.lessons.17' => 'Sağlık ve fitness',
			'lessonPage.levels.a1.lessons.18' => 'Hava durumu',
			'lessonPage.levels.a1.lessons.19' => 'Yeni yaşam tarzı',
			'lessonPage.levels.a1.lessons.20' => 'İyileşmek',
			'lessonPage.levels.a1.lessons.21' => 'Hobiler 2',
			'lessonPage.levels.a1.lessons.22' => 'Yerler hakkında sorular',
			'lessonPage.levels.a1.lessons.23' => 'Sahiplik',
			'lessonPage.levels.a1.lessons.24' => 'Alışveriş 1',
			'lessonPage.levels.a1.lessons.25' => 'Saati söylemek',
			'lessonPage.levels.a1.lessons.26' => 'Yol tarifi 1',
			'lessonPage.levels.a1.lessons.27' => 'Alışveriş 2',
			'lessonPage.levels.a1.lessons.28' => 'Seni tanımak',
			'lessonPage.levels.a1.lessons.29' => 'Nesnelerin yerleri',
			'lessonPage.levels.a1.lessons.30' => 'Görünüş',
			'lessonPage.levels.a1.lessons.31' => 'Yol tarifi 2',
			'lessonPage.levels.a2.title' => 'A2 - Temel',
			'lessonPage.levels.a2.lessons.0' => 'Family 2',
			'lessonPage.levels.a2.lessons.1' => 'People and places',
			'lessonPage.levels.a2.lessons.2' => 'Family 3',
			'lessonPage.levels.a2.lessons.3' => 'Describing objects',
			'lessonPage.levels.a2.lessons.4' => 'City',
			'lessonPage.levels.a2.lessons.5' => 'The building project',
			'lessonPage.levels.a2.lessons.6' => 'Home sweet home',
			'lessonPage.levels.a2.lessons.7' => 'What time is it',
			'lessonPage.levels.a2.lessons.8' => 'Daily routine 2',
			'lessonPage.levels.a2.lessons.9' => 'Free time',
			'lessonPage.levels.a2.lessons.10' => 'Food and nutrition',
			'lessonPage.levels.a2.lessons.11' => 'Shopping and consumer',
			'lessonPage.levels.a2.lessons.12' => 'Holidays',
			'lessonPage.levels.a2.lessons.13' => 'Weekend plans',
			'lessonPage.levels.a2.lessons.14' => 'Formal or casual',
			'lessonPage.levels.a2.lessons.15' => 'Fashion',
			'lessonPage.levels.a2.lessons.16' => 'Shopping 3',
			'lessonPage.levels.a2.lessons.17' => 'Advice 2',
			'lessonPage.levels.a2.lessons.18' => 'You can do it',
			'lessonPage.levels.a2.lessons.19' => 'Shopping 4',
			'lessonPage.levels.a2.lessons.20' => 'Small talk',
			'lessonPage.levels.a2.lessons.21' => 'One latte please',
			'lessonPage.levels.a2.lessons.22' => 'Food',
			'lessonPage.levels.a2.lessons.23' => 'Getting around',
			'lessonPage.levels.a2.lessons.24' => 'Ready for a trip',
			'lessonPage.levels.a2.lessons.25' => 'Travel 1',
			'lessonPage.levels.a2.lessons.26' => 'Urban escapes',
			'lessonPage.levels.a2.lessons.27' => 'Travel 2',
			'lessonPage.levels.a2.lessons.28' => 'A place to stay',
			'lessonPage.levels.a2.lessons.29' => 'So exciting',
			'lessonPage.levels.a2.lessons.30' => 'The right person',
			'lessonPage.levels.a2.lessons.31' => 'School',
			'lessonPage.levels.a2.lessons.32' => 'Music preferences',
			'lessonPage.levels.a2.lessons.33' => 'Sports',
			'lessonPage.levels.a2.lessons.34' => 'Rules of the race',
			'lessonPage.levels.a2.lessons.35' => 'Leave a message',
			'lessonPage.levels.a2.lessons.36' => 'Requests',
			'lessonPage.levels.a2.lessons.37' => 'Invitations',
			'lessonPage.levels.a2.lessons.38' => 'Travel experiences',
			'lessonPage.levels.a2.lessons.39' => 'Past tense 1',
			'lessonPage.levels.a2.lessons.40' => 'Past tense 2',
			'lessonPage.levels.a2.lessons.41' => 'Past tense 3',
			'lessonPage.levels.a2.lessons.42' => 'Questions about the past',
			'lessonPage.levels.a2.lessons.43' => 'You are never too old',
			'lessonPage.levels.a2.lessons.44' => 'Childhood memories',
			'lessonPage.levels.a2.lessons.45' => 'Compliments',
			'lessonPage.levels.a2.lessons.46' => 'Excuses',
			'lessonPage.levels.a2.lessons.47' => 'It\'s so annoying!',
			'lessonPage.levels.a2.lessons.48' => 'A digital world',
			'lessonPage.levels.a2.lessons.49' => 'Work life',
			'lessonPage.levels.a2.lessons.50' => 'I did not get that',
			'lessonPage.levels.a2.lessons.51' => 'Save or spend?',
			'lessonPage.levels.a2.lessons.52' => 'Say sorry',
			'lessonPage.levels.b1.title' => 'B1 - Orta',
			'lessonPage.levels.b1.lessons.0' => 'Cultural traditions',
			'lessonPage.levels.b1.lessons.1' => 'Celebrities',
			'lessonPage.levels.b1.lessons.2' => 'Art and creativity',
			'lessonPage.levels.b1.lessons.3' => 'Future plans',
			'lessonPage.levels.b1.lessons.4' => 'Planning events',
			'lessonPage.levels.b1.lessons.5' => 'Goals and plans',
			'lessonPage.levels.b1.lessons.6' => 'Historical events',
			'lessonPage.levels.b1.lessons.7' => 'Technology',
			'lessonPage.levels.b1.lessons.8' => 'Never ever',
			'lessonPage.levels.b1.lessons.9' => 'What is on',
			'lessonPage.levels.b1.lessons.10' => 'Dream vacation',
			'lessonPage.levels.b1.lessons.11' => 'Social media',
			'lessonPage.levels.b1.lessons.12' => 'Book recommendations',
			'lessonPage.levels.b1.lessons.13' => 'One of those days',
			'lessonPage.levels.b1.lessons.14' => 'Special photos',
			'lessonPage.levels.b1.lessons.15' => 'Personal achievements',
			'lessonPage.levels.b1.lessons.16' => 'Favourite movies',
			'lessonPage.levels.b1.lessons.17' => 'News flash',
			'lessonPage.levels.b1.lessons.18' => 'Happiness',
			'lessonPage.levels.b1.lessons.19' => 'A busy week',
			'lessonPage.levels.b1.lessons.20' => 'Where I grew up',
			'lessonPage.levels.b1.lessons.21' => 'School days',
			'lessonPage.levels.b1.lessons.22' => 'Profiles',
			'lessonPage.levels.b1.lessons.23' => 'Life maps',
			'lessonPage.levels.b1.lessons.24' => 'Everyday',
			'lessonPage.levels.b1.lessons.25' => 'What is next',
			'lessonPage.levels.b1.lessons.26' => 'Suggestion making',
			'lessonPage.levels.b1.lessons.27' => 'What happened',
			'lessonPage.levels.b1.lessons.28' => 'Memories',
			'lessonPage.levels.b1.lessons.29' => 'Culture shock',
			'lessonPage.levels.b1.lessons.30' => 'Interest phrases',
			'lessonPage.levels.b1.lessons.31' => 'Job interviews',
			'lessonPage.levels.b1.lessons.32' => 'Bucket lists',
			'lessonPage.levels.b1.lessons.33' => 'My kind of town',
			'lessonPage.levels.b1.lessons.34' => 'The internet generation',
			'lessonPage.levels.b1.lessons.35' => 'Popular brands',
			'lessonPage.levels.b1.lessons.36' => 'Opinion phrases',
			'lessonPage.levels.b1.lessons.37' => 'How does it look',
			'lessonPage.levels.b1.lessons.38' => 'Living space',
			'lessonPage.levels.b1.lessons.39' => 'Eating well',
			'lessonPage.levels.b1.lessons.40' => 'Unusual hobbies',
			'lessonPage.levels.b1.lessons.41' => 'A difficult choice',
			'lessonPage.levels.b1.lessons.42' => 'Take action',
			'lessonPage.levels.b1.lessons.43' => 'New skills',
			'lessonPage.levels.b1.lessons.44' => 'Making a complaint',
			'lessonPage.levels.b1.lessons.45' => 'Education',
			'lessonPage.levels.b1.lessons.46' => 'Green cities',
			'lessonPage.levels.b1.lessons.47' => 'What is in a job',
			'lessonPage.levels.b1.lessons.48' => 'Personal challenges',
			'lessonPage.levels.b1.lessons.49' => 'Interview phrases',
			'lessonPage.levels.b1.lessons.50' => 'Polite endings',
			'lessonPage.levels.b1.lessons.51' => 'Headline news',
			'lessonPage.levels.b1.lessons.52' => 'Small changes',
			'lessonPage.levels.b1.lessons.53' => 'Apologies excuses',
			'lessonPage.levels.b1.lessons.54' => 'Phone etiquette',
			'lessonPage.levels.b1.lessons.55' => 'Sorry to interrupt…',
			'lessonPage.levels.b1.lessons.56' => 'Complaint responses',
			'lessonPage.levels.b2.title' => 'B2 - Orta Üstü',
			'lessonPage.levels.b2.lessons.0' => 'Personalities',
			'lessonPage.levels.b2.lessons.1' => 'Great leads',
			'lessonPage.levels.b2.lessons.2' => 'Healthy lifestyle',
			'lessonPage.levels.b2.lessons.3' => 'What is the truth?',
			'lessonPage.levels.b2.lessons.4' => 'Personal growth',
			'lessonPage.levels.b2.lessons.5' => 'Speaking out',
			'lessonPage.levels.b2.lessons.6' => 'Acting out?',
			'lessonPage.levels.b2.lessons.7' => 'I remember...',
			'lessonPage.levels.b2.lessons.8' => 'Social feedback',
			'lessonPage.levels.b2.lessons.9' => 'Crime scene',
			'lessonPage.levels.b2.lessons.10' => 'Polite trouble',
			'lessonPage.levels.b2.lessons.11' => 'Conflict resolution',
			'lessonPage.levels.b2.lessons.12' => 'Love it or loathe it?',
			'lessonPage.levels.b2.lessons.13' => 'Environmental issues',
			'lessonPage.levels.b2.lessons.14' => 'We can work it out',
			'lessonPage.levels.b2.lessons.15' => 'Mysteries and crimes',
			'lessonPage.levels.b2.lessons.16' => 'Possible futures',
			'lessonPage.levels.b2.lessons.17' => 'Business plans',
			'lessonPage.levels.b2.lessons.18' => 'Meeting decisions',
			'lessonPage.levels.b2.lessons.19' => 'It\'s so predictable...',
			'lessonPage.levels.b2.lessons.20' => 'On the job',
			'lessonPage.levels.b2.lessons.21' => 'Science and technology',
			'lessonPage.levels.b2.lessons.22' => 'Time management',
			'lessonPage.levels.b2.lessons.23' => 'Human rights',
			'lessonPage.levels.c1.title' => 'C1 - İleri',
			'lessonPage.levels.c1.lessons.0' => 'Cultural norms',
			'lessonPage.levels.c1.lessons.1' => 'Social media influence',
			'lessonPage.levels.c1.lessons.2' => 'Career choices',
			'lessonPage.levels.c1.lessons.3' => 'Accelerate performance',
			'lessonPage.levels.c1.lessons.4' => 'Inventions',
			'lessonPage.levels.c1.lessons.5' => 'Time travel',
			'lessonPage.levels.c1.lessons.6' => 'Possessions',
			'lessonPage.levels.c1.lessons.7' => 'Job skills',
			'lessonPage.levels.c1.lessons.8' => 'Historical changes',
			'lessonPage.levels.c1.lessons.9' => 'Review writing',
			'lessonPage.levels.c1.lessons.10' => 'Mysteries',
			'lessonPage.levels.c1.lessons.11' => 'Strange theories',
			'lessonPage.levels.c1.lessons.12' => 'Celebrity',
			'lessonPage.levels.c1.lessons.13' => 'Global politics',
			'lessonPage.levels.c1.lessons.14' => 'Product boom',
			'lessonPage.levels.c1.lessons.15' => 'Will be happy?',
			'lessonPage.levels.c1.lessons.16' => 'Maybe later...',
			'lessonPage.levels.c1.lessons.17' => 'New solutions',
			'lessonPage.levels.c1.lessons.18' => 'Contextual influence',
			'lessonPage.levels.c1.lessons.19' => 'A lost logo',
			'lessonPage.levels.c1.lessons.20' => 'Kind acts',
			'lessonPage.levels.c1.lessons.21' => 'What a movie',
			'lessonPage.levels.c1.lessons.22' => 'How annoying',
			'lessonPage.levels.c1.lessons.23' => 'In the news',
			'lessonPage.levels.c2.title' => 'C2 - Uzman',
			'lessonPage.levels.c2.lessons.0' => 'Globalization',
			'lessonPage.levels.c2.lessons.1' => 'Natural disasters',
			'lessonPage.levels.c2.lessons.2' => 'Reacting to information',
			'lessonPage.levels.c2.lessons.3' => 'Work-life balance',
			'lessonPage.levels.c2.lessons.4' => 'Remote work',
			'lessonPage.levels.c2.lessons.5' => 'Family issues',
			'lessonPage.levels.c2.lessons.6' => 'Basic human anatomy',
			'lessonPage.levels.c2.lessons.7' => 'Health predictions',
			'lessonPage.levels.c2.lessons.8' => 'Healthcare access',
			'lessonPage.levels.c2.lessons.9' => 'Global travel experience',
			'lessonPage.levels.c2.lessons.10' => 'Superpowers',
			'lessonPage.levels.c2.lessons.11' => 'Team building',
			'lessonPage.levels.c2.lessons.12' => 'Biofluorescence',
			'lessonPage.levels.c2.lessons.13' => 'Dilemmas',
			'lessonPage.levels.c2.lessons.14' => 'Social enthusiasm',
			'lessonPage.levels.c2.lessons.15' => 'Changes',
			'lessonPage.levels.c2.lessons.16' => 'Work, work, work',
			'lessonPage.levels.c2.lessons.17' => 'Local issues',
			'lessonPage.levels.c2.lessons.18' => 'Problems, problems',
			'lessonPage.levels.c2.lessons.19' => 'Fact or fiction?',
			'lessonPage.levels.c2.lessons.20' => 'Sightseeing',
			'lessonPage.levels.c2.lessons.21' => 'Volunteering',
			'lessonPage.levels.c2.lessons.22' => 'The mind\'s eye',
			'lessonPage.levels.c2.lessons.23' => 'Media consumption',
			'rolePlayPage.title' => 'Rol Yapma',
			'rolePlayPage.subtitle' => 'Rolünü seç — gerçek bir senaryoyu deneyimle 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} tamamlandı',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Dk',
			'rolePlayPage.beginner' => 'Başlangıç',
			'rolePlayPage.screenplay' => 'SENARYO',
			'rolePlayPage.dailyInteractions' => 'Günlük Etkileşimler',
			'rolePlayPage.business' => 'İş',
			_ => null,
		} ?? switch (path) {
			'rolePlayPage.coffee.title' => 'Kafede Sipariş Verme',
			'rolePlayPage.coffee.screenplay' => 'Favori içeceğini sipariş et, boyut ve ekstraları sor, toplamı onayla ve tezgâhtan kahveni al.',
			'rolePlayPage.coffee.chat.incoming1' => 'Hoş geldiniz! Bugün ne alırsınız?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Merhaba! Orta boy bir latte istiyorum lütfen.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Tabii',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Sıcak mı buzlu mu olsun, ekstra ister misiniz?',
			'rolePlayPage.coffee.chat.botReply' => 'Harika tercih. Siparişinize başka bir şey ekleyelim mi?',
			'rolePlayPage.directions.title' => 'Sokakta Yol Sorma',
			'rolePlayPage.directions.screenplay' => 'Bir yere yol sor, metro veya otobüse nasıl gideceğini öğren, bilet bilgisi al ve restoran önerilerini dinle.',
			'rolePlayPage.directions.chat.incoming1' => 'Merhaba! Biraz kaybolmuş görünüyorsunuz — bir yere mi bakıyorsunuz?',
			'rolePlayPage.directions.chat.outgoing1' => 'Evet, en yakın metro istasyonunu arıyorum.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Tabii ki',
			'rolePlayPage.directions.chat.incoming2Rest' => '! İki blok o tarafa yürüyün, sonra sola dönün. Girişi göreceksiniz.',
			'rolePlayPage.directions.chat.botReply' => 'Rica ederim! İstasyonun yanında bir restoran önerisi de ister misiniz?',
			'rolePlayPage.interview.title' => 'İş Görüşmesi',
			'rolePlayPage.interview.screenplay' => 'Kendini tanıt, sık sorulan soruları yanıtla, deneyiminden bahset ve rol ile sonraki adımları sor.',
			'rolePlayPage.interview.chat.incoming1' => 'Bugün geldiğiniz için teşekkürler. Kendinizi kısaca tanıtır mısınız?',
			'rolePlayPage.interview.chat.outgoing1' => 'Tabii. Burada olmaktan mutluyum ve deneyimimi paylaşmak istiyorum.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Harika',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Gurur duyduğunuz yakın bir projeden bahseder misiniz?',
			'rolePlayPage.interview.chat.botReply' => 'Çok etkileyici. Rol hakkında ne sormak istersiniz?',
			'notificationsPage.title' => 'Bildirimler',
			'notificationsPage.translation.title' => 'Yeni Çeviri Hazır',
			'notificationsPage.translation.body' => 'Ses çeviri dosyan başarıyla metne dönüştürüldü ve çevrildi.',
			'notificationsPage.offer.title' => 'Seni Özel Bir Teklif Bekliyor',
			'notificationsPage.offer.body' => 'Sınırsız fotoğraf çevirisi için Premium’a yükselt — %50 indirim.',
			'notificationsPage.stories.title' => 'Yeni Hikayeleri Keşfet',
			'notificationsPage.stories.body' => 'Hikayelerle yeni kelimeler öğren',
			'profilePage.title' => 'Profile',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Free Version',
			'profilePage.dayStreak' => 'Day Streak!',
			'profilePage.accountSettings' => 'Account Settings',
			'profilePage.general' => 'General',
			'profilePage.profileSettings' => 'Profile Settings',
			'profilePage.fullName' => 'Full Name',
			'profilePage.email' => 'E-mail',
			'profilePage.deleteAccount' => 'Delete Account',
			'profilePage.save' => 'SAVE',
			'profilePage.deleteTitle' => 'Gitmeni istemiyoruz ama seni anlıyoruz.',
			'profilePage.deleteBody' => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?',
			'profilePage.deleteReasons.aiCharacters' => 'Yapay zeka karakterlerini gerçekçi bulmadım.',
			'profilePage.deleteReasons.videoIssues' => 'Görüntülü sohbetlerde teknik sorunlar yaşıyorum.',
			'profilePage.deleteReasons.pricing' => 'Abonelik fiyatları beklentimin üzerinde.',
			'profilePage.deleteReasons.noMatch' => 'Aradığım tarzda karakterler bulamadım.',
			'profilePage.deleteReasons.shortTrial' => 'Sadece kısa bir süreliğine denemek istemiştim.',
			'profilePage.deleteReasons.other' => 'Diğer',
			'profilePage.messageOptional' => 'Mesaj (opsiyonel)',
			'profilePage.messageHint' => 'Mesajınız varsa lütfen yazın.',
			'profilePage.next' => 'NEXT',
			'profilePage.specialOfferTitle' => 'Özel teklif',
			'profilePage.specialOfferBody' => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.',
			'profilePage.monthlyPlanTitle' => 'Switch to 1-Month Plan',
			'profilePage.monthlyPlanPrice' => '\$79/month, cancel anytime',
			'profilePage.monthlyPlanDesc' => 'No long-term commitment. Stay connected with our community on a month-to-month basis.',
			'profilePage.whatYoullKeep' => 'What you\'ll keep:',
			'profilePage.keepCharacters' => 'Access all characters',
			'profilePage.keepVideo' => 'Unlimited video calls',
			'profilePage.keepCourses' => 'Access to all courses',
			'profilePage.switchMonthlyCta' => 'Switch to Monthly Plan',
			'profilePage.confirmTitle' => 'Are you sure?',
			'profilePage.confirmBody' => 'We really don\'t want to see you go. Here\'s what you\'ll lose:',
			'profilePage.loseCharacters' => 'Unlimited character access',
			'profilePage.loseVideo' => 'Unlimited video call access',
			'profilePage.loseCourses' => 'Access to all courses',
			'profilePage.discountTitle' => 'Stay and get 60% off for 1 month',
			'profilePage.discountSubtitle' => 'Our best offer ever. Just \$27.60/month',
			'profilePage.acceptDiscountCta' => 'Accept 60% Off & Stay',
			'profilePage.farewellTitle' => 'We\'re sad to see you go',
			'profilePage.farewellBody' => ({required Object date}) => 'Your membership has been cancelled. You\'ll have access until the end of your current billing period on ${date}.',
			'profilePage.changeMindTitle' => '✨ Change your mind?',
			'profilePage.changeMindBody' => ({required Object date}) => 'You can reactivate your membership anytime before ${date} to keep your benefits.',
			'profilePage.reactivateCta' => 'Wait, I want to reactivate',
			'profilePage.done' => 'DONE',
			'profilePage.notifications' => 'Notifications',
			'profilePage.appLanguage' => 'App Language',
			'profilePage.selectLanguageTitle' => 'Select Language',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Passive',
			'profilePage.shareFriend' => 'Share Friend',
			'profilePage.shareWithFriendTitle' => 'Share with Friend',
			'profilePage.shareInviteBody' => 'Invite your friends and enjoy translate together',
			'profilePage.rateUs' => 'Rate Us',
			'profilePage.faq' => 'F.A.Q.',
			'profilePage.faqItems.howItWorks.question' => 'How does this app work?',
			'profilePage.faqItems.howItWorks.answer' => 'Our app uses artificial intelligence to analyze your emotional state through your written or spoken inputs. It provides personalized insights, mood tracking, and mental-wellness exercises designed to help you better understand and manage your emotions.',
			'profilePage.faqItems.replacePsychologist.question' => 'Can this app replace a real psychologist?',
			'profilePage.faqItems.replacePsychologist.answer' => 'No. This app is designed to support your wellbeing and learning journey, but it does not replace professional mental health care. If you need clinical support, please consult a licensed specialist.',
			'profilePage.faqItems.dataPrivate.question' => 'Are my conversations and data private?',
			'profilePage.faqItems.dataPrivate.answer' => 'Yes. Your conversations and personal data are kept private and handled according to our privacy policy. We do not sell your data to third parties.',
			'profilePage.support' => 'Support',
			'profilePage.feedback' => 'Feedback',
			'profilePage.progression' => 'Progression',
			'profilePage.progressTitle' => 'Progress',
			'profilePage.goodMorning' => 'Good Morning,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'English',
			'profilePage.past7Days' => 'Past 7 Days',
			'profilePage.past7DaysBody' => 'Study every day to build your streak and create a powerful learning habit.',
			'profilePage.currentLevel' => 'Current Level',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Just ${xp} XP left to reach ${level}!',
			'profilePage.toNextLevel' => 'TO NEXT LEVEL',
			'profilePage.dayStreakLabel' => 'Day Streak',
			'profilePage.totalPoints' => 'Total Points',
			'profilePage.savedWords' => 'Saved Words',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} items to review',
			'profilePage.logout' => 'Log Out',
			'profilePage.logoutTitle' => 'You are about to log out',
			'profilePage.logoutBody' => 'See you again soon! We\'ll miss your breathing exercises.',
			'profilePage.logoutConfirm' => 'LOGOUT',
			'profilePage.logoutCancel' => 'CANCEL',
			'profilePage.days.mon' => 'MON',
			'profilePage.days.tue' => 'TUE',
			'profilePage.days.wed' => 'WED',
			'profilePage.days.thu' => 'THU',
			'profilePage.days.fri' => 'FRI',
			'profilePage.days.sat' => 'SAT',
			'profilePage.days.sun' => 'SUN',
			_ => null,
		};
	}
}
