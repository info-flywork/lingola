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
	@override late final _Translations$apiErrors$tr apiErrors = _Translations$apiErrors$tr._(_root);
	@override late final _Translations$onboarding$tr onboarding = _Translations$onboarding$tr._(_root);
	@override late final _Translations$targetLanguage$tr targetLanguage = _Translations$targetLanguage$tr._(_root);
	@override late final _Translations$language$tr language = _Translations$language$tr._(_root);
	@override late final _Translations$setup$tr setup = _Translations$setup$tr._(_root);
	@override late final _Translations$accountCreating$tr accountCreating = _Translations$accountCreating$tr._(_root);
	@override late final _Translations$planReady$tr planReady = _Translations$planReady$tr._(_root);
	@override late final _Translations$demoChat$tr demoChat = _Translations$demoChat$tr._(_root);
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
	@override late final _Translations$pushNotifications$tr pushNotifications = _Translations$pushNotifications$tr._(_root);
	@override late final _Translations$notificationsPage$tr notificationsPage = _Translations$notificationsPage$tr._(_root);
	@override late final _Translations$profilePage$tr profilePage = _Translations$profilePage$tr._(_root);
}

// Path: app
class _Translations$app$tr implements Translations$app$en {
	_Translations$app$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Lingola';
	@override String get premium => 'PREMIUM';
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
	@override String get locked => 'Kilidi Açık Değil';
	@override String minutes({required Object value}) => '${value} dk';
	@override String get close => 'Kapat';
	@override String get getStarted => 'BAŞLA';
	@override String get connectionError => 'Bağlantı yok. İnternetini kontrol et ve tekrar dene.';
	@override String get genericError => 'Bir şeyler ters gitti. Lütfen tekrar dene.';
	@override String get tryAgain => 'Tekrar dene';
}

// Path: apiErrors
class _Translations$apiErrors$tr implements Translations$apiErrors$en {
	_Translations$apiErrors$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unauthorized => 'Lütfen tekrar giriş yap.';
	@override String get notFound => 'Aradığın içerik bulunamadı.';
	@override String get validationFailed => 'Lütfen bilgilerini kontrol edip tekrar dene.';
	@override String get nameRequired => 'İsim boş olamaz.';
	@override String get imageRequired => 'Lütfen yüklenecek bir fotoğraf seç.';
	@override String get avatarInvalidType => 'Yalnızca JPEG, PNG veya WebP fotoğraflar kabul edilir.';
	@override String get avatarEmpty => 'Seçilen fotoğraf boş.';
	@override String get avatarTooLarge => 'Fotoğraf çok büyük (en fazla 5 MB).';
	@override String get notificationsRequired => 'Bildirim tercihi gerekli.';
	@override String get premiumRequired => 'Bu ders için Premium gerekli.';
	@override String get levelRequired => 'Bu seviyeyi açmak için önceki dersleri tamamla.';
	@override String get internalError => 'Bir şeyler ters gitti. Lütfen tekrar dene.';
}

// Path: onboarding
class _Translations$onboarding$tr implements Translations$onboarding$en {
	_Translations$onboarding$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String pageA11y({required Object current, required Object total}) => 'Eğitim sayfası ${current} / ${total}';
	@override String get letsStart => 'Hadi Başlayalım';
	@override late final _Translations$onboarding$slide1$tr slide1 = _Translations$onboarding$slide1$tr._(_root);
	@override late final _Translations$onboarding$slide2$tr slide2 = _Translations$onboarding$slide2$tr._(_root);
	@override late final _Translations$onboarding$slide3$tr slide3 = _Translations$onboarding$slide3$tr._(_root);
}

// Path: targetLanguage
class _Translations$targetLanguage$tr implements Translations$targetLanguage$en {
	_Translations$targetLanguage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Öğrenmek istediğin dili seç';
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
	@override String step({required Object current, required Object total}) => 'Adım ${current} / ${total}';
	@override String get title => 'Hangi dili öğrenmek istiyorsun?';
	@override String get nativeSection => 'Anadilim';
	@override String get nativeField => 'Ana dil';
	@override String get nativeName => 'Türkçe';
	@override String get targetSection => 'Öğrenmek istiyorum';
	@override String get targetField => 'Hedef Dil';
	@override String get targetName => 'İngilizce';
	@override String get direction => 'Dil yönü';
	@override String get selectLanguage => 'Dil seç';
	@override String get comingSoonBadge => 'Yakında...';
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
	@override String get goalTitle => 'Neden yeni bir dil öğrenmek istiyorsunuz?';
	@override String get goalHint => 'Hedefine tam uyan kişisel bir çalışma planı hazırlayacağız';
	@override String get goalCareer => 'Kariyer Gelişimi';
	@override String get goalTravel => 'Seyahat';
	@override String get goalLiving => 'Yurt Dışında Yaşamak';
	@override String get goalStudying => 'Eğitim';
	@override String get goalOther => 'Kişisel gelişim';
	@override String get interestsTitle => 'Lütfen ilgi alanlarınızı seçiniz';
	@override String get interestsHint => 'İlgini çeken konularla sana özel bir öğrenme deneyimi oluşturacağız.';
	@override String get seeMoreEllipsis => 'Daha fazla...';
	@override String get levelTitle => 'Mevcut seviyeni nasıl tanımlarsın?';
	@override String get levelA1 => 'Bu dili sıfırdan öğreniyorum';
	@override String get levelA2 => 'Temel sohbetlere katılabilirim';
	@override String get levelB1 => 'Aşina olduğum konularda kısa sohbetleri idare edebilirim';
	@override String get levelB2 => 'Günlük konular hakkında detaylı konuşabilirim';
	@override String get levelC1 => 'Ana dili konuşanlarla akıcı bir şekilde konuşabilirim';
	@override String get levelC2 => 'Her konuda kendimi net bir şekilde ifade edebiliyorum';
	@override String get paceTitle => 'Kayda değer bir ilerleme görmeyi ne kadar yakında istiyorsun?';
	@override String get explanationTitle => 'Kendi dilinde sorduğun sorulara nasıl açıklama yapalım?';
	@override String get explanationHint => 'Bunu istediğin zaman profil ayarlarından değiştirebilirsin.';
	@override String get explanationNative => 'Anadilimde açıkla';
	@override String get explanationEnglish => 'İngilizce açıkla';
	@override String get paceHint => 'Planın temposunu ayarlamamıza yardımcı olur';
	@override String get paceMonth1 => '1 ay';
	@override String get paceMonth2_3 => '2-3 ay';
	@override String get paceMonth6 => '6 ay';
	@override String get paceYear1 => '1 yıl';
	@override String get paceRelaxed => 'Acele etmiyorum';
	@override String get progressInsightTitle => 'Sadece 2 haftada gerçek ilerleme gör!';
	@override String get progressInsightBody => 'Lingola kullanıcıları genelde daha en baştan konuşma özgüvenlerinde büyük bir artış fark ediyor.';
	@override String get progressInsightConfidence => 'Konuşma özgüveni';
	@override String get progressInsightToday => 'Today';
	@override String get progressInsightWeek2 => '2. hafta';
	@override String get progressInsightWithLingola => 'Lingola ile';
	@override String get progressInsightWithoutApp => 'Uygulama olmadan';
	@override String get levelHint => 'Lingola, her seviyeden dil öğrencisine yardımcı olmak için tasarlandı';
	@override String get dailyPracticeTitle => 'Günde ne kadar pratik yapmak istiyorsun?';
	@override String get dailyPracticeHint => 'Kendi hızında ilerle, her gün bir adım daha yaklaş.';
	@override String dailyPracticeMonthlyHours({required Object hours}) => '${hours} / month';
	@override String dailyPracticeOnlyMinutes({required Object minutes}) => 'Günde sadece ${minutes} dk';
	@override String dailyPracticeMinutesOption({required Object minutes}) => '${minutes} dk';
	@override String get dailyPracticeToday => 'Bugün';
	@override String get practiceTimeTitle => 'Günün hangi saati pratik yapmak istersin?';
	@override String get practiceTimeHint => 'Hatırlatmalar serini korumana yardımcı olur, her gün hedefine bir adım daha yaklaşmanı sağlar.';
	@override String get practiceTimeMorning => 'Sabah';
	@override String get practiceTimeAfternoon => 'Öğleden sonra';
	@override String get practiceTimeEvening => 'Akşam';
	@override String get practiceTimeFlexible => 'Esneğim';
	@override String get practiceTimeSave => 'Kaydet';
	@override String get setPracticeTimeTitle => 'Zamanını ayarla';
	@override String get setPracticeTimeHint => 'Hangi zaman aralığında pratik yapmak istersin?';
	@override String get promiseTitle => 'Ben, her gün konuşma pratiği yapacağıma söz veriyorum';
	@override String get promiseBody => 'Ve yapay zeka eğitmenleri ile dil öğrenme hedeflerime mümkün olan en hızlı şekilde ulaş';
	@override String get promiseHoldHint => 'Onaylamak için Lingola logosuna dokunup basılı tut';
	@override String get aiTutorsIntroTitle => 'Lingola’da 20+ yapay zeka\neğitmeninden dilediğini seçebilirsin';
	@override String get aiTutorsIntroBody => 'Hepsinin derin kişilikleri ve farklı aksanları var';
	@override String get aiTutorsIntroCta => 'Biraz Seni Tanıyalım';
}

// Path: accountCreating
class _Translations$accountCreating$tr implements Translations$accountCreating$en {
	_Translations$accountCreating$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kişisel Hesabın Oluşturuluyor';
	@override String get titleLine1 => 'Building your';
	@override String get titleLine2 => 'Account';
	@override String get testimonialQuote => 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I\'m not stopping now.';
	@override String get testimonialAuthor => 'Maria, 29 — 3 months in';
	@override String get stepContent => 'İçerik oluşturuluyor';
	@override String get stepDialogues => 'Diyaloglar hazırlanıyor';
	@override String get stepLessons => 'Dersler optimize ediliyor';
	@override String get stepPlan => 'Planın son şekli veriliyor';
	@override String get optimization => 'Optimizasyon';
	@override String progress({required Object value}) => '${value}%';
	@override String get comparisonPitch => 'Lingola ile kendi başınıza öğrenmekten 30 kat daha hızlı bir şekilde 600 fazla ifadeyi öğrenin';
	@override String get comparisonAloneCount => '400';
	@override String get comparisonLingolaCount => '1000';
	@override String get comparisonUnit => 'İFADE';
	@override String get comparisonAloneLabel => 'Tek başına';
	@override String get comparisonLingolaLabel => 'Lingola';
	@override String get fluencyPitch => 'Bugünden akıcılığa, bir sonraki seviyeniz sadece 30 gün uzakta';
	@override String get chartToday => 'Today';
	@override String get chartMid => '15 Sep';
	@override String get chartEnd => '30 Sep';
}

// Path: planReady
class _Translations$planReady$tr implements Translations$planReady$en {
	_Translations$planReady$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get titleLine1 => 'Your plan is';
	@override String get titleLine2 => 'Ready!';
	@override String get statBanner => 'Kullanıcıların %95\'i ilk 7 gün içinde sonuç alıyor';
	@override String planTitle({required Object name}) => '${name}\'İN PLANI';
	@override String get defaultName => 'SENİN';
	@override String get fieldCourse => 'KURS';
	@override String get fieldLevel => 'SEVİYENİZ';
	@override String get fieldFocus => 'ODAK ALANI';
	@override String get fieldDuration => 'SÜRE';
	@override String get fieldInterests => 'İLGİ ALANLARI';
	@override String get startPlan => 'Start my plan →';
	@override String get courseEnglish => 'İngilizce';
	@override String get courseGerman => 'Almanca';
	@override String get courseFrench => 'Fransızca';
	@override String get courseItalian => 'İtalyanca';
	@override String get courseSpanish => 'İspanyolca';
	@override String get courseJapanese => 'Japonca';
	@override String get courseRussian => 'Rusça';
	@override String get courseTurkish => 'Türkçe';
	@override String get goalCareer => 'Kariyer ve İş';
	@override String get goalTravel => 'Seyahat';
	@override String get goalLiving => 'Yurt Dışında Yaşamak';
	@override String get goalStudying => 'Eğitim';
	@override String get goalOther => 'Kişisel gelişim';
	@override String get levelA1 => 'A1';
	@override String get levelA2 => 'A2';
	@override String get levelB1 => 'B1';
	@override String get levelB2 => 'B2';
	@override String get levelC1 => 'C1';
	@override String get levelC2 => 'C2';
	@override String get paceMonth1 => '1 ay';
	@override String get paceMonth2_3 => '2-3 ay';
	@override String get paceMonth6 => '6 ay';
	@override String get paceYear1 => '1 yıl';
	@override String get paceRelaxed => 'Acele etmiyorum';
}

// Path: demoChat
class _Translations$demoChat$tr implements Translations$demoChat$en {
	_Translations$demoChat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Seni tanıyalım';
	@override String get speed => '1x';
	@override String get typeMessage => 'Mesaj yaz...';
	@override String get incoming1 => 'Merhaba! Ben senin AI eğitmeninim. Başlamadan önce — İngilizce devam etmek istemiyorsan veya bir şeyi anlamazsan bana söyle, dilini değiştiririm. Umarım iyisindir! Hadi seninle ilgili birkaç şey konuşalım — şu an çalışıyor musun, yoksa öğrenci misin?';
}

// Path: previewChat
class _Translations$previewChat$tr implements Translations$previewChat$en {
	_Translations$previewChat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get brand => 'Lingola';
	@override String get lessonBadge => 'Ders 1: Selamlaşmalar';
	@override String get speed => '1x';
	@override String get typeMessage => 'Bir mesaj yaz...';
	@override String get incoming1 => 'Merhaba! Lingola\'ya hoş geldin — ben senin AI eğitmeninim. Seviyen ne olursa olsun merak etme; burada kendini güvende hissederek İngilizce öğreneceksin. İngilizcede \'merhaba\' demek için \'Hi\' veya \'Hello\' dersin — hadi dene, bana İngilizce \'Hi!\' yaz!';
	@override String get outgoing1 => 'Merhaba! Pratik yapmaya hazırım.';
	@override String get incoming2Highlight => 'Günaydın';
	@override String get incoming2Rest => ', Emrah! Hazır hissetmene sevindim. Bir sabah kahvesi her zaman bir bağlantı kurmaya harika bir başlangıçtır. Ne hakkında konuşmak istersin?';
	@override String get holdToSpeak => 'Konuşmak için basılı tut';
	@override String get recording => 'Kaydediliyor… göndermek için bırak';
	@override String get slideUpToLock => 'Kilitlemek için yukarı kaydır';
	@override String get slideLeftToCancel => 'İptal için sola kaydır';
	@override String get recordingLockedHint => 'Bitince gönder\'e dokun';
}

// Path: paywall
class _Translations$paywall$tr implements Translations$paywall$en {
	_Translations$paywall$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bugün Konuşmaya Başla — Ücretsiz';
	@override String get subtitle => 'Sınırsız öğrenme fırsatları';
	@override String get noCommitment => 'Taahhüt yok';
	@override String get cancelAnytime => 'İstediğin zaman iptal et';
	@override String get noPaymentToday => 'Bugün ödeme yok';
	@override String get daysFree => '3 Gün Ücretsiz';
	@override String get thenPrice => 'Sonra \$1.99/ay';
	@override String get trialActive => 'Ücretsiz Deneme Aktif';
	@override String get payableToday => 'Bugün Ödenecek';
	@override String get payableValue => '3 Gün Ücretsiz 0.00\$';
	@override String get paymentDate => 'Ödeme tarihi: 13 Mart 2026';
	@override String get paymentAmount => '9.99\$';
}

// Path: auth
class _Translations$auth$tr implements Translations$auth$en {
	_Translations$auth$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get trainersBadge => 'Çeşitli AI eğitmenlerimiz';
	@override String get title => 'Yeni Bir Dile Bugün Başla';
	@override String get body => 'AI ile gerçek konuşmalar pratiği yap.\nBaskı yok. Yargı yok.';
	@override String get continueGoogle => 'Google ile Devam Et';
	@override String get continueApple => 'Apple ile Devam Et';
	@override String get continueGuest => 'Misafir Olarak Devam Et';
	@override String get or => 'veya';
	@override String get alreadyHaveAccount => 'Zaten hesabın var mı?';
	@override String get signIn => 'Giriş Yap';
	@override String get legal => 'Lingola\'ya kaydolarak, Hizmet Şartlarımızı kabul etmiş olursunuz. Verilerinizi nasıl işlediğimizi Gizlilik Politikasında ve Çerez Politikası\'nda öğrenin.';
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
	@override String get rolePlay => 'Rol Oynama';
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
	@override String get continueConversation => 'Sohbete Devam Et';
	@override String continueWithTutor({required Object name}) => '${name} ile devam etmek ister misin, yoksa başka hoca mı?';
	@override String continueSameTutor({required Object name}) => '${name} ile devam et';
	@override String get chooseOtherTutor => 'Başka hoca seç';
	@override String minutesLeft({required Object value}) => '${value} dk kaldı';
	@override String get lessonProgress => 'Ders 2 — Selamlaşmalar';
	@override String get timeCurrent => '0dk';
	@override String get timeTotal => '/ 15dk';
	@override String get kContinue => 'Devam Et';
	@override String get learningPath => 'A1 - Başlangıç';
	@override String get allLessons => 'Tüm Dersler';
	@override String get introductions => 'Tanışmalar I';
	@override String get greetings => 'Selamlaşmalar';
	@override String get jobs => 'Meslekler';
	@override String get favoriteRoom => 'Favori Oda';
	@override String get dailyRoutine => 'Günlük Rutin';
	@override String get scroll => 'Kaydır';
	@override String get liveLesson => 'Canlı Ders';
	@override String get liveLessonSubtitle => 'Eğitmenimizle video görüşmesi yap';
	@override String get moreTutor => 'Daha Fazla Eğitmen';
	@override String get startTalkNow => 'Şimdi Sohbete Başla';
	@override String get tutorLingola => 'Lingola';
	@override String get tutorMei => 'Mei Lin';
	@override String get tutorKate => 'Kate';
	@override String get tagAdaptive => 'Uyumlu';
	@override String get tagCalm => 'Sakin';
	@override String get tagPatient => 'Sabırlı';
	@override String get tagMethodical => 'Metodik';
	@override String get tagEncouraging => 'Teşvik Edici';
	@override String get tagMore => '+5';
	@override String get moreFeatures => 'Daha Fazla Özellik';
	@override String get practiceLabel => 'PRATİK';
	@override String get wordPractice => 'Kelime Pratiği';
	@override String get wordPracticeBody => 'Seçtiğin dilde kelime dağarcığını her gün geliştir';
	@override String get immersiveLabel => 'DAHA DERİN';
	@override String get quiz => 'Sınav';
	@override String get quizBodyLine1 => 'Gerçek';
	@override String get quizBodyLine2 => 'bağlamda örneklerle öğren';
	@override String get getStarted => 'Başla';
	@override String get library => 'Kütüphane';
	@override String get libraryTitle => 'Öğren ve Kaydet';
	@override String get learnMore => 'Daha Fazla Öğren';
	@override late final _Translations$home$premium$tr premium = _Translations$home$premium$tr._(_root);
}

// Path: libraryPage
class _Translations$libraryPage$tr implements Translations$libraryPage$en {
	_Translations$libraryPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kütüphane';
	@override String get searchWord => 'Kelime Ara';
	@override String savedWordCount({required Object count}) => '${count} Kaydedilmiş Kelime';
	@override String get savedWordTab => 'Kaydedilmiş Kelimeler';
	@override String get dictionaryTab => 'Sözlük';
	@override String get dictionaryLabel => 'Sözlük';
}

// Path: wordPracticePage
class _Translations$wordPracticePage$tr implements Translations$wordPracticePage$en {
	_Translations$wordPracticePage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kelime Pratiği';
	@override String get turkish => 'TÜRKÇE';
	@override String get save => 'Kaydet';
	@override String get saved => 'Kaydedildi';
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
	@override String get headline => 'Bugün neyi geliştirmek istersin?';
	@override String get subtitle => 'Eğitiminizi seçin — 3 dakikadan az sürer 🚀';
	@override String get readingTitle => 'Okuma';
	@override String get readingBody => 'Makaleler ve hikayeler aracılığıyla anlama';
	@override String get writingTitle => 'Yazma';
	@override String get writingBody => 'Dilbilgisi ve kelime bilgisi alıştırmaları';
	@override String get speakingTitle => 'Konuşma';
	@override String get speakingBody => 'Yapay zeka konuşma motoru ile telaffuz';
	@override String get readingTestTitle => 'Okuma Testi';
	@override String get read => 'Oku';
	@override String get listeningHint => 'İngilizce kelimeyi net bir şekilde söyle...';
	@override String get micPermissionDenied => 'Mikrofon veya ses tanıma kullanılamıyor.';
	@override String get matchSuccess => 'Harika! Bu kelimeyle eşleşiyor.';
	@override String matchFail({required Object heard}) => '"${heard}" duyuldu. Tekrar dene.';
	@override String get successfulTitle => 'Başarılı!';
	@override String get successfulBody => 'Ana dil gibi telaffuz!';
	@override String get failedTitle => 'Başarısız';
	@override String get failedBody => 'Neredeyse oldu, bir şans daha ver';
	@override String get tryAgain => 'TEKRAR DENE';
	@override String get writingTestTitle => 'Yazma Testi';
	@override String get sourceLanguage => 'KAYNAK DİL';
	@override String get answer => 'CEVAP';
	@override String get writeAnswerHint => 'Cevabını buraya yaz...';
	@override String get submit => 'Gönder';
	@override String get speakingTestTitle => 'Konuşma Testi';
	@override String get speakingProficiency => 'Konuşma Yeterliliği';
	@override String get speakClearlyHint => 'Mikrofonuna net bir şekilde konuş:';
	@override String get speakUp => 'Sesini Yükselt';
	@override String get recording => 'Kaydediliyor...';
	@override String questionOf({required Object current, required Object total}) => 'SORU ${current} / ${total}';
}

// Path: placeholder
class _Translations$placeholder$tr implements Translations$placeholder$en {
	_Translations$placeholder$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String title({required Object tab}) => '${tab} yolda';
	@override String body({required Object tab}) => 'Senin için odaklanmış bir ${tab} deneyimi hazırlıyoruz.';
}

// Path: tutorPage
class _Translations$tutorPage$tr implements Translations$tutorPage$en {
	_Translations$tutorPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eğitmen';
	@override String get chatWithLingola => 'Lingola ile Sohbet Et';
	@override String get startChat => 'Sohbet et';
	@override String chatWithTutor({required Object name}) => '${name} ile Sohbet Et';
	@override String get chatHistory => 'Sohbet Geçmişi';
	@override String get history => 'Geçmiş';
	@override String get filter => 'Filtre';
	@override String get country => 'Ülke';
	@override String get focus => 'Odak';
	@override String get moreCountries => '8+ daha';
	@override String get moreFocus => '+8';
	@override String get save => 'KAYDET';
	@override String get clearFilter => 'Filtreyi kaldır';
	@override String get startTalkNow => 'Sohbete Başla';
	@override String get typeMessage => 'Bir mesaj yaz...';
	@override String get speaker => 'Konuşmacı';
	@override String get messagesCount => '12';
	@override late final _Translations$tutorPage$tutors$tr tutors = _Translations$tutorPage$tutors$tr._(_root);
	@override late final _Translations$tutorPage$tags$tr tags = _Translations$tutorPage$tags$tr._(_root);
	@override String get historyPreview1 => 'Hey! Sıkıntıdan patlamak üzereydim...';
	@override String get historyPreview2 => 'Bugün yemek siparişi vermeyi mi pratik edelim?';
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
	@override String get locked => 'Kilitlendi';
	@override String get pickTutorTitle => 'Öğretmeninizi seçin';
	@override String get startTalk => 'Derse başla';
	@override String get chatInstead => 'Sohbet et';
	@override String get lockedHint => 'Bu dersi açmak için önceki dersi tamamlayın.';
	@override String get levelLockedTitle => 'Seviye kilitli';
	@override String levelLockedBody({required Object userLevel, required Object lessonLevel}) => 'İngilizce seviyeniz ${userLevel} olduğu için ${lessonLevel} derslerini önceki yolu tamamlamadan açamazsınız.';
	@override String get levelLockedOk => 'Anladım';
	@override String get notesTitle => 'Ders notları';
	@override String get whatWeLearned => 'Bugün neler öğrendik';
	@override String get deleteNotes => 'Ders notlarımı sil';
	@override String get deleteNotesConfirm => 'Bu notları silmek istiyor musun? Bu işlem geri alınamaz.';
	@override String get delete => 'Sil';
	@override String get cancel => 'İptal';
	@override String get practiceCta => 'Eğer bu çok zor geldiyse, aynı konuyu tekrar pratik yapabilirsin.';
	@override String get practiceNow => 'Bu konuyu pratik yap';
	@override String get openChat => 'Öğretmenle sohbeti aç';
	@override String get yourScore => 'Senin puanın';
	@override String bestScore({required Object score}) => 'En iyi ${score}/100';
	@override String scoreChanged({required Object prev, required Object now}) => '${prev} → ${now}';
	@override String get participationSilent => 'Pasif katılımcı';
	@override String get participationSilentBody => 'Bu sefer sessiz kaldın. Bu dersi tekrar almanı öneririm.';
	@override String get participationPassive => 'Düşük katılım';
	@override String get participationPassiveBody => 'Neredeyse hiç konuşmadın. Dersi tekrar dene ve daha fazla konuş.';
	@override String get participationActive => 'İyi katılım';
	@override String get participationActiveBody => 'Sohbete katıldın. Devam et!';
	@override String get participationStrong => 'Güçlü katılım';
	@override String get participationStrongBody => 'Çok konuştun. Harika iş!';
	@override String get retakeLesson => 'Bu dersi tekrar al';
	@override String get finishLesson => 'Dersi bitir';
	@override String get savingNotes => 'Öğretmenin bugünkü notları yazıyor...';
	@override String get noNotes => 'Öğretmenden not almak için bu dersi bitir.';
	@override String get notesDeleted => 'Ders notları silindi';
	@override late final _Translations$lessonPage$levels$tr levels = _Translations$lessonPage$levels$tr._(_root);
}

// Path: rolePlayPage
class _Translations$rolePlayPage$tr implements Translations$rolePlayPage$en {
	_Translations$rolePlayPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rol Oynama';
	@override String get subtitle => 'Rolünü seç — gerçek bir senaryoyu deneyimle 🎭';
	@override String progressCompleted({required Object value}) => '%${value} tamamlandı';
	@override String minutes({required Object value}) => '${value} Dak';
	@override String get beginner => 'Başlangıç';
	@override String get easy => 'Kolay';
	@override String get medium => 'Orta';
	@override String get hard => 'Zor';
	@override String get intermediate => 'Orta';
	@override String get beginnerIntermediate => 'Başlangıç–Orta';
	@override String get screenplay => 'SENARYO';
	@override String get filterAll => 'Tümü';
	@override String get seeAll => 'Tümünü Gör';
	@override String get lingolaRolePlay => 'Lingola RolePlay';
	@override String get shopping => 'Alışveriş';
	@override String get flirting => 'Flört';
	@override String get lifeInTheUs => 'ABD\'de Yaşam';
	@override String get freeDiscussion => 'Serbest Sohbet';
	@override String get jobInterview => 'İş Mülakatı';
	@override String get dailyInteractions => 'Günlük Etkileşimler';
	@override String get socialDynamics => 'Sosyal Dinamikler';
	@override String get restaurant => 'Restoran';
	@override String get travel => 'Seyahat';
	@override String get business => 'İş';
	@override String get customScenarios => 'Senaryoların';
	@override String get createOwnScenario => 'Kendi senaryonu oluştur!';
	@override String get createOwnScenarioTitle => 'Kendi senaryonu oluştur';
	@override String get createFieldScenario => 'Senaryo';
	@override String get createFieldScenarioHint => 'örn. iş toplantısı';
	@override String get createFieldTutorRole => 'Eğitmen Rolü';
	@override String get createFieldTutorRoleHint => 'örn. mülakat yapan';
	@override String get createFieldYourRole => 'Senin Rolün';
	@override String get createFieldYourRoleHint => 'örn. aday';
	@override String get createFieldExtraInfo => 'Ek Bilgiler (İsteğe bağlı)';
	@override String get createFieldExtraInfoHint => 'örn. bir teknoloji şirketinde kıdemli yazılımcı pozisyonu için mülakat';
	@override String get createFieldDifficulty => 'Zorluk';
	@override String get createOwnScenarioContinue => 'Devam Et';
	@override String get createFieldsRequired => 'Lütfen senaryo ve her iki rol alanını doldur.';
	@override String get creatingScenario => 'Rol oyunun oluşturuluyor';
	@override String get creatingScenarioSubtitle => 'Lingola senaryonu ve görselini hazırlıyor...';
	@override String get createFailed => 'Senaryo oluşturulamadı. Lütfen tekrar dene.';
	@override String get deleteFailed => 'Senaryo silinemedi. Lütfen tekrar dene.';
	@override late final _Translations$rolePlayPage$flirtingMeet$tr flirtingMeet = _Translations$rolePlayPage$flirtingMeet$tr._(_root);
	@override late final _Translations$rolePlayPage$freeTalkHobby$tr freeTalkHobby = _Translations$rolePlayPage$freeTalkHobby$tr._(_root);
	@override late final _Translations$rolePlayPage$coffee$tr coffee = _Translations$rolePlayPage$coffee$tr._(_root);
	@override late final _Translations$rolePlayPage$directions$tr directions = _Translations$rolePlayPage$directions$tr._(_root);
	@override late final _Translations$rolePlayPage$interview$tr interview = _Translations$rolePlayPage$interview$tr._(_root);
	@override late final _Translations$rolePlayPage$missedTrain$tr missedTrain = _Translations$rolePlayPage$missedTrain$tr._(_root);
	@override late final _Translations$rolePlayPage$flightAttendant$tr flightAttendant = _Translations$rolePlayPage$flightAttendant$tr._(_root);
	@override late final _Translations$rolePlayPage$trainTicket$tr trainTicket = _Translations$rolePlayPage$trainTicket$tr._(_root);
	@override late final _Translations$rolePlayPage$restaurantReservation$tr restaurantReservation = _Translations$rolePlayPage$restaurantReservation$tr._(_root);
	@override late final _Translations$rolePlayPage$doctorAppointment$tr doctorAppointment = _Translations$rolePlayPage$doctorAppointment$tr._(_root);
	@override late final _Translations$rolePlayPage$shoppingClothes$tr shoppingClothes = _Translations$rolePlayPage$shoppingClothes$tr._(_root);
	@override late final _Translations$rolePlayPage$takingTaxi$tr takingTaxi = _Translations$rolePlayPage$takingTaxi$tr._(_root);
	@override late final _Translations$rolePlayPage$rentingApartment$tr rentingApartment = _Translations$rolePlayPage$rentingApartment$tr._(_root);
	@override late final _Translations$rolePlayPage$birthdayParty$tr birthdayParty = _Translations$rolePlayPage$birthdayParty$tr._(_root);
}

// Path: pushNotifications
class _Translations$pushNotifications$tr implements Translations$pushNotifications$en {
	_Translations$pushNotifications$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lingola';
	@override List<String> get h2 => [
		'Kısa bir ara verdin galiba.',
		'Bir kelime kadar vaktin var mı?',
		'Buradayız, acele yok.',
		'Dil öğrenme modu biraz durdu.',
		'Mini bir tekrar iyi gelebilir.',
	];
	@override List<String> get h4 => [
		'Bugün yeni bir kelime seni bekliyor olabilir 👀',
		'Kısa bir pratik kaçırılıyor olabilir.',
		'Bir ifadeyi atlamış olabilirsin.',
		'Bugünkü ilerleme yarım kaldı.',
		'Bir kelime, bir cümle… belki ikisi.',
	];
	@override List<String> get h8 => [
		'Her gün ilerlemek zorunda değilsin.',
		'Az da olsa tekrar sayılır.',
		'Bugün öğrenmedin diye hiçbir şey kaybetmedin.',
		'Hazırsan devam edebiliriz.',
		'Dil öğrenmek maraton, sprint değil.',
	];
	@override List<String> get h24 => [
		'Bir gün geçti. Kelimeler hâlâ burada.',
		'Ara vermen normal.',
		'Kaldığın yer duruyor.',
		'Ne zaman istersen devam edebilirsin.',
		'Dil kaçmaz, biz de.',
	];
	@override String get lessonReminderTitle => 'Bugünün dersi seni bekliyor';
	@override List<String> get lessonReminder => [
		'Bugün henüz derse girmedin — 5 dakika bile yeter.',
		'Hocan hazır. Kaldığın yerden devam et.',
		'Kısa bir ders bugün ritmini korur.',
		'Bugünkü ders hâlâ açık — başlamak ister misin?',
	];
	@override String get quizReminderTitle => 'Kısa bir quiz yapalım mı?';
	@override String quizReminderWords({required Object count, required Object savedCount}) => 'Son zamanlarda ${count} kelime öğrendin — quiz yapmak ister misin? ${savedCount} kayıtlı kelime seni bekliyor.';
	@override String quizReminderSaved({required Object savedCount}) => '${savedCount} kayıtlı kelime gözden geçirmeyi bekliyor.';
	@override List<String> get quizReminder => [
		'Bir süredir quiz yapmadın — 3 dakikalık tekrar iyi gelir.',
		'Kayıtlı kelimelerin seni özledi. Hızlı bir quiz?',
		'Ne kadar hatırladığını test et — sadece birkaç dakika.',
		'Şimdi kısa bir quiz, yarını kolaylaştırır.',
	];
	@override String get eveningLessonTitle => 'Bugünkü pratiği kaçırma';
	@override List<String> get eveningLesson => [
		'Bugün henüz çalışmadın. Kısa bir ders alışkanlığı korur.',
		'Gün bitmeden — hocanla hızlı bir ders?',
		'Bugün hâlâ 5 dakikalık bir İngilizce seansı için vakit var.',
		'Günlük dersin bekliyor. Başlayalım mı?',
	];
	@override String get streakReminderTitle => 'Serini koru';
	@override String streakReminder({required Object streak}) => '${streak} günlük seridesin — bugün kısa bir ders serini canlı tutar.';
}

// Path: notificationsPage
class _Translations$notificationsPage$tr implements Translations$notificationsPage$en {
	_Translations$notificationsPage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildirimler';
	@override String get deleteConfirmTitle => 'Emin misiniz?';
	@override String get deleteConfirmBody => 'Bu bildirim silinecek.';
	@override String get delete => 'Sil';
	@override String get cancel => 'İptal';
	@override late final _Translations$notificationsPage$translation$tr translation = _Translations$notificationsPage$translation$tr._(_root);
	@override late final _Translations$notificationsPage$offer$tr offer = _Translations$notificationsPage$offer$tr._(_root);
	@override late final _Translations$notificationsPage$stories$tr stories = _Translations$notificationsPage$stories$tr._(_root);
	@override late final _Translations$notificationsPage$practice$tr practice = _Translations$notificationsPage$practice$tr._(_root);
	@override late final _Translations$notificationsPage$streak$tr streak = _Translations$notificationsPage$streak$tr._(_root);
	@override late final _Translations$notificationsPage$premium$tr premium = _Translations$notificationsPage$premium$tr._(_root);
	@override String get emptyTitle => 'Henüz bildirim yok';
	@override String get emptySubtitle => 'Bildirim aldığında tekrar kontrol etmeyi unutma.';
}

// Path: profilePage
class _Translations$profilePage$tr implements Translations$profilePage$en {
	_Translations$profilePage$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get userName => 'Jhon Doe';
	@override String get freeVersion => 'Ücretsiz Versiyon';
	@override String get dayStreak => 'Gün Serisi!';
	@override String get accountSettings => 'Hesap Ayarları';
	@override String get general => 'Genel';
	@override String get settingsShare => 'Paylaş';
	@override String get settingsSupport => 'Destek';
	@override String get settingsAbout => 'Hakkında';
	@override String get settingsAccount => 'Hesap';
	@override String get followInstagram => 'Instagram\'da Takip Et';
	@override String get followTikTok => 'TikTok\'ta Takip Et';
	@override String get settings => 'Ayarlar';
	@override String get profileSettings => 'Profil Ayarları';
	@override String get fullName => 'Tam İsim';
	@override String get email => 'E-posta';
	@override String get deleteAccount => 'Hesabı Sil';
	@override String get save => 'KAYDET';
	@override String get profileSaved => 'Profil kaydedildi';
	@override String get profilePhotoUpdated => 'Profil fotoğrafı güncellendi';
	@override String get nameCannotBeEmpty => 'İsim boş olamaz';
	@override String get profileSaveFailed => 'Profil kaydedilemedi';
	@override String get photoUploadFailed => 'Fotoğraf yüklenemedi';
	@override String get notificationsUpdateFailed => 'Bildirimler güncellenemedi';
	@override String get notificationsPermissionDenied => 'Hatırlatıcı almak için cihaz ayarlarından bildirimlere izin ver.';
	@override String get deleteTitle => 'Gitmeni istemiyoruz ama seni anlıyoruz.';
	@override String get deleteBody => 'Lingola deneyimini iyileştirmemiz için bize neden ayrılmak istediğini söyler misin?';
	@override late final _Translations$profilePage$deleteReasons$tr deleteReasons = _Translations$profilePage$deleteReasons$tr._(_root);
	@override String get messageOptional => 'Mesaj (opsiyonel)';
	@override String get messageHint => 'Mesajınız varsa lütfen yazın.';
	@override String get next => 'SONRAKİ';
	@override String get specialOfferTitle => 'Özel teklif';
	@override String get specialOfferBody => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.';
	@override String get monthlyPlanTitle => '1 Aylık Plana Geç';
	@override String get monthlyPlanPrice => '\$79/ay, istediğin zaman iptal et';
	@override String get monthlyPlanDesc => 'Uzun vadeli taahhüt yok. Topluluğumuzla ay ay bağlantıda kal.';
	@override String get whatYoullKeep => 'Sahip olacağın şeyler:';
	@override String get keepCharacters => 'Tüm karakterlere erişim';
	@override String get keepVideo => 'Sınırsız görüntülü arama';
	@override String get keepCourses => 'Tüm kurslara erişim';
	@override String get switchMonthlyCta => 'Aylık Plana Geç';
	@override String get confirmTitle => 'Emin misin?';
	@override String get confirmBody => 'Gerçekten gitmeni istemiyoruz. İşte kaybedeceklerin:';
	@override String get loseCharacters => 'Sınırsız karakter erişimi';
	@override String get loseVideo => 'Sınırsız görüntülü arama erişimi';
	@override String get loseCourses => 'Tüm kurslara erişim';
	@override String get discountTitle => 'Kal ve 1 ay için %60 indirim al';
	@override String get discountSubtitle => 'Şimdiye kadarki en iyi teklifimiz. Sadece \$27.60/ay';
	@override String get acceptDiscountCta => '%60 İndirim Al & Kal';
	@override String get farewellTitle => 'Gitmene üzüldük';
	@override String farewellBody({required Object date}) => 'Üyeliğin iptal edildi. ${date} tarihine kadar erişimin olacak.';
	@override String get changeMindTitle => '✨ Fikrini değiştir?';
	@override String changeMindBody({required Object date}) => '${date} tarihinden önce üyeliğini yeniden etkinleştirebilirsin.';
	@override String get reactivateCta => 'Bekle, yeniden etkinleştirmek istiyorum';
	@override String get done => 'TAMAM';
	@override String get notifications => 'Bildirimler';
	@override String get appLanguage => 'Uygulama Dili';
	@override String get explanationLanguage => 'Açıklama Dili';
	@override String get explanationNative => 'Anadil';
	@override String get explanationEnglish => 'İngilizce';
	@override String get explanationUpdateFailed => 'Açıklama dili güncellenemedi';
	@override String get learnInNativeLanguage => 'Ana Dilinde Öğren';
	@override String get targetLanguageLabel => 'Hedef Dil';
	@override String get languageLevel => 'Dil Seviyesi';
	@override String get nativeLanguage => 'Ana Dilim';
	@override String get chineseShort => 'Çince';
	@override String get seeMore => 'Daha Fazla...';
	@override String get searchLanguages => 'Search';
	@override String get interests => 'İlgi Alanları';
	@override String get goalChipCareer => 'Kariyer';
	@override String get goalChipTravel => 'Seyahat';
	@override String get goalChipLiving => 'Yaşam';
	@override String get goalChipStudying => 'Eğitim';
	@override String get goalChipOther => 'Diğer';
	@override String get dailyGoal => 'Günlük Hedef';
	@override String get dailyGoalValueLight => 'Günlük 5-10 dk';
	@override String get dailyGoalValueRecommended => 'Günlük 15-20 dk';
	@override String get dailyGoalValueFast => 'Günlük 30+ dk';
	@override String get dailyReminder => 'Günlük Hatırlatma';
	@override String get selectNativeLanguageTitle => 'Ana dilini seç';
	@override String get reminderOn => 'Açık';
	@override String get reminderOff => 'Kapalı';
	@override String get remindMe => 'Bana Hatırlat';
	@override String get reminderSave => 'Kaydet';
	@override String get reminderSaved => 'Hatırlatma kaydedildi';
	@override String get selectLanguageTitle => 'Dil Seç';
	@override String get premium => 'Premium';
	@override String get passive => 'Pasif';
	@override String get active => 'Aktif';
	@override String get premiumVersion => 'Premium';
	@override String get shareFriend => 'Arkadaşla Paylaş';
	@override String get shareLingola => 'Lingola\'yı Paylaş';
	@override String get shareWithFriendTitle => 'Arkadaşla Paylaş';
	@override String get shareInviteBody => 'Arkadaşlarını davet et ve birlikte çeviri yapmanın tadını çıkar.';
	@override String get rateUs => 'Bizi Beğendin mi? Puan Ver';
	@override String get settingsCertificates => 'Certificates';
	@override String get restorePurchases => 'Satın Alımları Geri Yükle';
	@override String get aboutFlywork => 'Flywork Hakkında';
	@override String get faqHelp => 'SSS ve Yardım';
	@override String get deleteAccountAndData => 'Hesabı ve Verileri Sil';
	@override String get faq => 'Lingola SSS';
	@override late final _Translations$profilePage$faqItems$tr faqItems = _Translations$profilePage$faqItems$tr._(_root);
	@override String get support => 'Destek';
	@override String get feedback => 'Geri Bildirim';
	@override String get progression => 'İlerleme';
	@override String get progressTitle => 'İlerleme';
	@override String get goodMorning => 'Günaydın,';
	@override String get progressUserName => 'Jhon';
	@override String get progressLanguage => 'İngilizce';
	@override String get past7Days => 'Son 7 Gün';
	@override String get past7DaysBody => 'Günlük çalışarak serini oluştur ve güçlü bir öğrenme alışkanlığı yarat.';
	@override String get currentLevel => 'Mevcut Seviye';
	@override String xpLeft({required Object xp, required Object level}) => 'Sadece ${xp} XP kaldı, ${level} seviyesine ulaşmak için!';
	@override String get toNextLevel => 'SONRAKİ SEVİYEYE';
	@override String get dayStreakLabel => 'Gün Serisi';
	@override String get totalPoints => 'Toplam Puan';
	@override String get savedWords => 'Kaydedilen Kelimeler';
	@override String itemsToReview({required Object count}) => '${count} gözden geçirilecek öğe';
	@override String get logout => 'Çıkış Yap';
	@override String get logoutTitle => 'Çıkış yapmak istediğine emin misiniz?';
	@override String get logoutBody => 'Görüşmek üzere! Nefes egzersizlerini özleyeceğiz.';
	@override String get logoutConfirm => 'LOGOUT';
	@override String get logoutCancel => 'CANCEL';
	@override late final _Translations$profilePage$days$tr days = _Translations$profilePage$days$tr._(_root);
	@override String get certificateTitle => 'Sertifikanız';
	@override String certificateLevelTitle({required Object level}) => '${level} Sertifikası';
	@override String get certificateOf => 'Başarı Sertifikası';
	@override String get certificatePresentedTo => 'This certificate is proudly presented to';
	@override String certificateAchievementBody({required Object level}) => 'This achievement recognizes the successful completion of all ${level}-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.';
	@override String certificateLevelCompleted({required Object levelName}) => 'Level Completed: ${levelName}';
	@override String certificateDateCompleted({required Object date}) => 'Date of Completion: ${date}';
	@override String certificateIdDisplay({required Object id}) => 'Certificate ID: ${id}';
	@override String get certificateBrandTagline => 'Learn. Speak. Connect.';
	@override String get certificateCertifiesThat => 'Bu belge, aşağıda adı geçen kişinin';
	@override String get certificatePathway => 'Lingola İngilizce Yolu';
	@override String get certificateAwardedTo => 'Verilen kişi';
	@override String get certificateCompleted => 'başarıyla tamamlamıştır';
	@override String get certificateCompletedDetail => 'Lingola İngilizce Yeterlilik Programını başarıyla tamamlamış ve aşağıdaki seviyede sertifika almaya hak kazanmıştır:';
	@override String certificateLevelLine({required Object level}) => 'İngilizce Seviyesi — CEFR ${level}';
	@override String certificateIssued({required Object date}) => 'Veriliş tarihi: ${date}';
	@override String get certificateDateOfCompletion => 'Tamamlanma Tarihi';
	@override String get certificateIdLabel => 'Sertifika No';
	@override String get certificateVerify => 'Sertifikayı doğrulamak için tarayın';
	@override String get certificateVerifyAuthenticity => 'DOĞRULAMA';
	@override String get certificateScanOrVisit => 'QR kodu tarayın veya bağlantıyı ziyaret ederek doğrulayın.';
	@override String get certificateVerifyHint => 'QR kodu tarayan herkes başarınızı doğrulayabilir.';
	@override String get certificateShare => 'Sertifikayı Paylaş';
	@override String get certificateDownload => 'İndir';
	@override String get certificateDownloadSaved => 'Sertifika galeriye kaydedildi';
	@override String get certificateDownloadFailed => 'Sertifika kaydedilemedi. Lütfen tekrar deneyin.';
	@override String get certificateCreateQr => 'QR Oluştur';
	@override String get certificateNotAvailableTitle => 'Sertifika kilitli';
	@override String certificateNotAvailable({required Object level}) => 'Henüz ${level} derslerinizi tamamlamadığınız için bu belgeyi kullanamazsınız.';
	@override String get certificateNotAvailableOk => 'Anladım';
	@override String get certificateShareQr => 'QR Kodunu Paylaş';
	@override String certificateShareBody({required Object level}) => 'Lingola ${level} sertifikamı kazandım!';
	@override String certificateShareSubject({required Object level}) => 'Lingola ${level} Sertifikası';
	@override String get certificateProvidedBy => 'Sertifika sağlayıcı';
	@override String get certificatePreviewBody => 'Lingola\'da bir CEFR seviyesini tamamladığınızda sertifikanız burada görünecek — adınız, seviyeniz ve doğrulanabilir QR kodu ile.';
	@override String get certificatePreviewHint => 'Sertifikanızı açmak için bir seviye yolunu tamamlayın';
	@override String get certificateTapToView => 'Sertifikanızı görüntülemek ve paylaşmak için dokunun';
	@override String get interestShopping => 'Alışveriş';
	@override String get interestFood => 'Yemek';
	@override String get interestPopCulture => 'Popüler Kültür';
	@override String get interestFilm => 'Film';
	@override String get interestMusic => 'Müzik';
	@override String get interestSport => 'Spor';
	@override String get interestTechnology => 'Teknoloji';
	@override String get interestScience => 'Bilim';
	@override String get interestHealth => 'Sağlık';
	@override String get interestFashion => 'Moda';
	@override String get interestArt => 'Sanat';
	@override String get interestLiterature => 'Edebiyat';
	@override String get interestHistory => 'Tarih';
	@override String get interestCulture => 'Kültür';
	@override String get interestAstronomy => 'Astronomi';
	@override String get interestPet => 'Evcil Hayvan';
	@override String get interestSocialMedia => 'Sosyal Medya';
	@override String get interestEntrepreneur => 'Girişimcilik';
	@override String get confirmDeleteWarning => 'Hesabınız ve tüm ilerlemeniz kalıcı olarak silinecek. Bu işlemi geri almak mümkün değil.';
	@override String get confirmKeepGoing => 'İlerlemeden Vazgeçme';
	@override String get myCertificates => 'Sertifikalarım';
	@override String get certificatesEmptyTitle => 'Henüz sertifika yok';
	@override String get certificatesEmptySubtitle => 'Bir seviye tamamladığında tekrar kontrol etmeyi unutma.';
	@override String get restorePurchasesSuccess => 'Satın alımların geri yüklendi.';
	@override String get restorePurchasesEmpty => 'Bu hesap için aktif satın alma bulunamadı.';
}

// Path: onboarding.slide1
class _Translations$onboarding$slide1$tr implements Translations$onboarding$slide1$en {
	_Translations$onboarding$slide1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Haftalar İçinde Kendine Güvenle Konuş';
	@override String get body => 'AI ile gerçek konuşmalar pratiği yap. Aksanını, özgüvenini ve akıcılığını her gün geliştir.';
	@override String get testimonialName => 'Sarah Williams, 24';
	@override String get testimonialBody => 'Önceden İngilizce konuşamıyordum. Şimdi işte her gün konuşuyorum.';
}

// Path: onboarding.slide2
class _Translations$onboarding$slide2$tr implements Translations$onboarding$slide2$en {
	_Translations$onboarding$slide2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fiyatı Olmadan Özel Eğitmen';
	@override String get body => 'Gerçek konuşmalar. Anlık geri bildirim.\nPlanlama yok. Baskı yok.';
	@override String get realTutor => 'Gerçek Eğitmen';
	@override String get lingola => 'Lingola';
	@override String get priceReal => '\$30 / saat';
	@override String get priceLingola => '\$9.99 / yıl';
	@override String get versus => 'VS';
	@override String get scheduled => 'Planlı';
	@override String get anytime => 'Her Zaman';
	@override String get stressful => 'Stresli';
	@override String get noPressure => 'Baskı Yok';
	@override String get price => 'Fiyat';
	@override String get availability => 'Uygunluk';
	@override String get feeling => 'Duygu';
}

// Path: onboarding.slide3
class _Translations$onboarding$slide3$tr implements Translations$onboarding$slide3$en {
	_Translations$onboarding$slide3$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Senin İçin Oluşturulmuş Bir Öğrenme Planı';
	@override String get body => 'Hedeflerin, Hızın, Seviyen. Başlangıçtan Akıcıya — Adım Adım.';
	@override String get goal => 'Hedef';
	@override String get practice => 'Pratik';
	@override String get progress => 'İlerleme';
}

// Path: home.premium
class _Translations$home$premium$tr implements Translations$home$premium$en {
	_Translations$home$premium$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get titleBefore => 'Akıcı bir şekilde ';
	@override String get titleHighlight => 'konuşmanın yolu';
	@override String get titleAfter => ' hata yapma korkusu olmadan.';
	@override String get descriptionBefore => 'Dünyada milyonlarca öğrenciye katıl. Dil engelini aşmaya bugün başla — ';
	@override String get descriptionHighlight => 'ilk 3 gün tamamen ücretsiz.';
	@override String get feature1 => '7/24 erişilebilir AI Eğitmeni';
	@override String get feature2 => 'Özel Eğitmenlere sınırsız erişim';
	@override String get feature3 => 'Senin için özel olarak hazırlanmış günlük ders planı';
	@override String get priceAmount => '1.99\$';
	@override String get pricePeriod => '/ay';
	@override String get discount => 'Yıllık satın alımlarda %40 indirim';
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
	@override String get santa => 'Noel Baba';
}

// Path: tutorPage.tags
class _Translations$tutorPage$tags$tr implements Translations$tutorPage$tags$en {
	_Translations$tutorPage$tags$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get adaptive => 'Uyumlu';
	@override String get calm => 'Sakin';
	@override String get patient => 'Sabırlı';
	@override String get organized => 'Düzenli';
	@override String get relaxed => 'Rahat';
	@override String get methodical => 'Metodik';
	@override String get attentive => 'Dikkatli';
	@override String get more => '+5';
	@override String get curious => 'Meraklı';
	@override String get observer => 'Gözlemci';
	@override String get ancientKnowledge => 'Eski Bilgi';
	@override String get wise => 'Bilge';
	@override String get clear => 'Açık';
	@override String get decisive => 'Kararlı';
	@override String get disciplined => 'Disiplinli';
	@override String get smart => 'Akıllı';
	@override String get analytic => 'Analitik';
	@override String get cheerful => 'Neşeli';
	@override String get generous => 'Cömert';
}

// Path: tutorPage.chat
class _Translations$tutorPage$chat$tr implements Translations$tutorPage$chat$en {
	_Translations$tutorPage$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get incoming1 => 'Günaydın! Bugün pratik yapmaya hazır hissetmene sevindim.';
	@override String get outgoing1 => 'Evet, selamlaşma ile başlayalım.';
	@override String get incoming2 => 'Harika. Bir meslektaşına merhaba derken ne dersin?';
	@override String get typing => 'Yazıyor';
}

// Path: tutorPage.calling
class _Translations$tutorPage$calling$tr implements Translations$tutorPage$calling$en {
	_Translations$tutorPage$calling$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get lessonBadge => 'Ders 1 : Selamlaşmalar';
	@override String lessonBadgeFormat({required Object number, required Object title}) => 'Ders ${number} : ${title}';
	@override String get nativeLine => 'Sıkıldın mı?';
	@override String get englishLine => 'Sıkıldın mı? O kelimeyi kelime dağarcığımdan sildim. Kalk, plan hazır: Kadıköy\'deki o yeni oyun barına gidiyoruz.';
	@override String get highlight => 'Sıkıldın mı?';
	@override String get close => 'Aramayı bitir';
	@override String get toggleCaptions => 'Altyazıları aç/kapat';
	@override String get toggleHints => 'İpuçlarını aç/kapat';
	@override String get toggleMic => 'Mikrofonu aç/kapat';
	@override String get tapToSpeakHint => 'Konuşmak için dokun, bitirmek için tekrar dokun';
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

// Path: rolePlayPage.flirtingMeet
class _Translations$rolePlayPage$flirtingMeet$tr implements Translations$rolePlayPage$flirtingMeet$en {
	_Translations$rolePlayPage$flirtingMeet$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kafede Birini Tanımak';
	@override String get screenplay => 'Samimi bir sohbet başlat, kendinden biraz bahset, ortak ilgi alanları paylaş ve tekrar görüşüp görüşmeyeceğinize karar ver.';
	@override late final _Translations$rolePlayPage$flirtingMeet$chat$tr chat = _Translations$rolePlayPage$flirtingMeet$chat$tr._(_root);
}

// Path: rolePlayPage.freeTalkHobby
class _Translations$rolePlayPage$freeTalkHobby$tr implements Translations$rolePlayPage$freeTalkHobby$en {
	_Translations$rolePlayPage$freeTalkHobby$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hobiler Hakkında Sohbet';
	@override String get screenplay => 'Boş zaman aktiviteleri hakkında serbestçe konuş, takip soruları sor, tercihlerini paylaş ve birlikte yeni bir şey denemeyi öner.';
	@override late final _Translations$rolePlayPage$freeTalkHobby$chat$tr chat = _Translations$rolePlayPage$freeTalkHobby$chat$tr._(_root);
}

// Path: rolePlayPage.coffee
class _Translations$rolePlayPage$coffee$tr implements Translations$rolePlayPage$coffee$en {
	_Translations$rolePlayPage$coffee$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kahve Dükkanında Sipariş Verme';
	@override String get screenplay => 'Favori içeceğini sipariş et, boyutlar ve ekler hakkında sorular sor, toplamını onayla ve kahveni tezgahın üzerinden al.';
	@override late final _Translations$rolePlayPage$coffee$chat$tr chat = _Translations$rolePlayPage$coffee$chat$tr._(_root);
}

// Path: rolePlayPage.directions
class _Translations$rolePlayPage$directions$tr implements Translations$rolePlayPage$directions$en {
	_Translations$rolePlayPage$directions$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sokakta Yön Sorma';
	@override String get screenplay => 'Bir yere nasıl gidileceğini sor, metro veya otobüs hakkında bilgi al, biletler hakkında bilgi edin ve restoran önerilerini dinle.';
	@override late final _Translations$rolePlayPage$directions$chat$tr chat = _Translations$rolePlayPage$directions$chat$tr._(_root);
}

// Path: rolePlayPage.interview
class _Translations$rolePlayPage$interview$tr implements Translations$rolePlayPage$interview$en {
	_Translations$rolePlayPage$interview$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'İş Görüşmesi';
	@override String get screenplay => 'Kendini tanıt, yaygın iş görüşmesi sorularını yanıtla, deneyimlerinden bahset ve rol ile sonraki adımlar hakkında sorular sor.';
	@override late final _Translations$rolePlayPage$interview$chat$tr chat = _Translations$rolePlayPage$interview$chat$tr._(_root);
}

// Path: rolePlayPage.missedTrain
class _Translations$rolePlayPage$missedTrain$tr implements Translations$rolePlayPage$missedTrain$en {
	_Translations$rolePlayPage$missedTrain$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trenini Kaçırdın';
	@override String get screenplay => 'Trenini kaçırdın ve istasyon görevlisinden yardım iste — nereye gideceğini söyle, bir sonraki treni bul ve perona yön tarifi al.';
	@override late final _Translations$rolePlayPage$missedTrain$chat$tr chat = _Translations$rolePlayPage$missedTrain$chat$tr._(_root);
}

// Path: rolePlayPage.flightAttendant
class _Translations$rolePlayPage$flightAttendant$tr implements Translations$rolePlayPage$flightAttendant$en {
	_Translations$rolePlayPage$flightAttendant$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uçuş Hostesiyle Konuşma';
	@override String get screenplay => 'Uçakta yolcusun. Koltuğunu bul, bagajınla ilgili yardım al, yemek ve içecek seç, uçuş sırasında ihtiyaçlarını dile getir.';
	@override late final _Translations$rolePlayPage$flightAttendant$chat$tr chat = _Translations$rolePlayPage$flightAttendant$chat$tr._(_root);
}

// Path: rolePlayPage.trainTicket
class _Translations$rolePlayPage$trainTicket$tr implements Translations$rolePlayPage$trainTicket$en {
	_Translations$rolePlayPage$trainTicket$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tren Bileti Alma';
	@override String get screenplay => 'Tren istasyonunda gişeye git, nereye gideceğini söyle, kalkış saatini seç, bilet türünü ve koltuğunu belirle, bileti öde.';
	@override late final _Translations$rolePlayPage$trainTicket$chat$tr chat = _Translations$rolePlayPage$trainTicket$chat$tr._(_root);
}

// Path: rolePlayPage.restaurantReservation
class _Translations$rolePlayPage$restaurantReservation$tr implements Translations$rolePlayPage$restaurantReservation$en {
	_Translations$rolePlayPage$restaurantReservation$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restoranda Rezervasyon Yapma';
	@override String get screenplay => 'Akşam yemeği için restoranda masa ayırt — tarih, saat, kişi sayısı ve masa tercihini belirle, rezervasyonunu onayla.';
	@override late final _Translations$rolePlayPage$restaurantReservation$chat$tr chat = _Translations$rolePlayPage$restaurantReservation$chat$tr._(_root);
}

// Path: rolePlayPage.doctorAppointment
class _Translations$rolePlayPage$doctorAppointment$tr implements Translations$rolePlayPage$doctorAppointment$en {
	_Translations$rolePlayPage$doctorAppointment$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doktor Randevusu Alma';
	@override String get screenplay => 'Bir kliniği arayarak doktor randevusu al — ziyaret nedenini açıkla, uygun gün ve saati seç, bilgilerini onayla.';
	@override late final _Translations$rolePlayPage$doctorAppointment$chat$tr chat = _Translations$rolePlayPage$doctorAppointment$chat$tr._(_root);
}

// Path: rolePlayPage.shoppingClothes
class _Translations$rolePlayPage$shoppingClothes$tr implements Translations$rolePlayPage$shoppingClothes$en {
	_Translations$rolePlayPage$shoppingClothes$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kıyafet Alışverişi';
	@override String get screenplay => 'Bir mağazada ne aradığını söyle, ürünleri dene, beden ve renk seçeneklerini karşılaştır, alıp almama kararını ver.';
	@override late final _Translations$rolePlayPage$shoppingClothes$chat$tr chat = _Translations$rolePlayPage$shoppingClothes$chat$tr._(_root);
}

// Path: rolePlayPage.takingTaxi
class _Translations$rolePlayPage$takingTaxi$tr implements Translations$rolePlayPage$takingTaxi$en {
	_Translations$rolePlayPage$takingTaxi$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taksiye Binme';
	@override String get screenplay => 'Yeni bir şehirde taksiye bin, gideceğin yeri söyle, rota hakkında konuş, yolculuk sonunda ödeme yap.';
	@override late final _Translations$rolePlayPage$takingTaxi$chat$tr chat = _Translations$rolePlayPage$takingTaxi$chat$tr._(_root);
}

// Path: rolePlayPage.rentingApartment
class _Translations$rolePlayPage$rentingApartment$tr implements Translations$rolePlayPage$rentingApartment$en {
	_Translations$rolePlayPage$rentingApartment$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Daire Kiralama';
	@override String get screenplay => 'Ev sahibiyle kiralık daire hakkında konuş — kira, faturalar, depozito, evcil hayvan, otopark sor ve görüşme ayarla.';
	@override late final _Translations$rolePlayPage$rentingApartment$chat$tr chat = _Translations$rolePlayPage$rentingApartment$chat$tr._(_root);
}

// Path: rolePlayPage.birthdayParty
class _Translations$rolePlayPage$birthdayParty$tr implements Translations$rolePlayPage$birthdayParty$en {
	_Translations$rolePlayPage$birthdayParty$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Doğum Günü Partisi Planlama';
	@override String get screenplay => 'Bir arkadaşınla doğum günü partisi planla — mekan, tarih, davetli listesi, yemek, pasta, müzik ve aktiviteleri birlikte belirle.';
	@override late final _Translations$rolePlayPage$birthdayParty$chat$tr chat = _Translations$rolePlayPage$birthdayParty$chat$tr._(_root);
}

// Path: notificationsPage.translation
class _Translations$notificationsPage$translation$tr implements Translations$notificationsPage$translation$en {
	_Translations$notificationsPage$translation$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yeni Çeviri Hazır';
	@override String get body => 'Sesli çeviri dosyanız başarıyla metne dönüştürüldü ve çevrildi.';
}

// Path: notificationsPage.offer
class _Translations$notificationsPage$offer$tr implements Translations$notificationsPage$offer$en {
	_Translations$notificationsPage$offer$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sizi Bekleyen Özel Bir Teklif Var';
	@override String get body => 'Sınırsız fotoğraf çevirisi için Premium\'a %50 indirimle geçin.';
}

// Path: notificationsPage.stories
class _Translations$notificationsPage$stories$tr implements Translations$notificationsPage$stories$en {
	_Translations$notificationsPage$stories$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yeni Hikayeleri Keşfedin';
	@override String get body => 'Hikayeler aracılığıyla yeni kelimeler öğrenin';
}

// Path: notificationsPage.practice
class _Translations$notificationsPage$practice$tr implements Translations$notificationsPage$practice$en {
	_Translations$notificationsPage$practice$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Günlük pratiğin seni bekliyor';
	@override String get body => '5 dakikada kelime, okuma veya konuşma egzersizi yap.';
}

// Path: notificationsPage.streak
class _Translations$notificationsPage$streak$tr implements Translations$notificationsPage$streak$en {
	_Translations$notificationsPage$streak$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Serini koru';
	@override String get body => 'Bugün kısa bir oturum gün serini korur ve alışkanlığı güçlendirir.';
}

// Path: notificationsPage.premium
class _Translations$notificationsPage$premium$tr implements Translations$notificationsPage$premium$en {
	_Translations$notificationsPage$premium$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tüm hocalar ve dersler açılsın';
	@override String get body => 'Premium ile sınırsız ders, rol oynama ve AI hocalara eriş.';
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
	@override late final _Translations$profilePage$faqItems$supportedLanguages$tr supportedLanguages = _Translations$profilePage$faqItems$supportedLanguages$tr._(_root);
	@override late final _Translations$profilePage$faqItems$howAiWorks$tr howAiWorks = _Translations$profilePage$faqItems$howAiWorks$tr._(_root);
	@override late final _Translations$profilePage$faqItems$offlineUse$tr offlineUse = _Translations$profilePage$faqItems$offlineUse$tr._(_root);
	@override late final _Translations$profilePage$faqItems$isFree$tr isFree = _Translations$profilePage$faqItems$isFree$tr._(_root);
	@override late final _Translations$profilePage$faqItems$pronunciationEval$tr pronunciationEval = _Translations$profilePage$faqItems$pronunciationEval$tr._(_root);
	@override late final _Translations$profilePage$faqItems$dailyPractice$tr dailyPractice = _Translations$profilePage$faqItems$dailyPractice$tr._(_root);
	@override late final _Translations$profilePage$faqItems$levelDetermination$tr levelDetermination = _Translations$profilePage$faqItems$levelDetermination$tr._(_root);
	@override late final _Translations$profilePage$faqItems$realPeopleChat$tr realPeopleChat = _Translations$profilePage$faqItems$realPeopleChat$tr._(_root);
	@override late final _Translations$profilePage$faqItems$dataSecurity$tr dataSecurity = _Translations$profilePage$faqItems$dataSecurity$tr._(_root);
	@override late final _Translations$profilePage$faqItems$disableReminders$tr disableReminders = _Translations$profilePage$faqItems$disableReminders$tr._(_root);
}

// Path: profilePage.days
class _Translations$profilePage$days$tr implements Translations$profilePage$days$en {
	_Translations$profilePage$days$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get mon => 'PZT';
	@override String get tue => 'SAL';
	@override String get wed => 'ÇAR';
	@override String get thu => 'PER';
	@override String get fri => 'CUM';
	@override String get sat => 'CMT';
	@override String get sun => 'PZR';
}

// Path: lessonPage.levels.a1
class _Translations$lessonPage$levels$a1$tr implements Translations$lessonPage$levels$a1$en {
	_Translations$lessonPage$levels$a1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A1 - Başlangıç';
	@override List<String> get lessons => [
		'Selamlaşmalar',
		'Tanışmalar I',
		'Meslekler',
		'Favori Oda',
		'Günlük Rutin',
		'Meyveler',
		'Tavsiyeler 1',
		'Aile 1',
		'Günlük eşyalar',
		'Memleket',
		'Ev',
		'Yiyecek tercihleri',
		'Hobiler 1',
		'Başarılı insanlar',
		'Yiyecek ve içecekler',
		'Restoranda sipariş vermek',
		'Evcil hayvanlar',
		'Sağlık ve fitness',
		'Hava durumu',
		'Yeni yaşam tarzı',
		'Gelişmek',
		'Hobiler 2',
		'Yerler hakkında sorular',
		'Sahiplik',
		'Alışveriş 1',
		'Saati söylemek',
		'Yönler 1',
		'Alışveriş 2',
		'Seni tanımak',
		'Nesnelerin yerleri',
		'Görünüşler',
		'Yönler 2',
	];
}

// Path: lessonPage.levels.a2
class _Translations$lessonPage$levels$a2$tr implements Translations$lessonPage$levels$a2$en {
	_Translations$lessonPage$levels$a2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A2 - Temel';
	@override List<String> get lessons => [
		'Aile 2',
		'İnsanlar ve yerler',
		'Aile 3',
		'Nesneleri tanımlama',
		'Şehir',
		'Bina projesi',
		'Ev tatlı ev',
		'Saat kaç',
		'Günlük rutin 2',
		'Boş zaman',
		'Yemek ve beslenme',
		'Alışveriş ve tüketim',
		'Tatil',
		'Hafta sonu planları',
		'Resmi veya gündelik',
		'Moda',
		'Alışveriş 3',
		'Tavsiyeler 2',
		'Bunu yapabilirsin',
		'Alışveriş 4',
		'Sohbet',
		'Bir latte lütfen',
		'Yemek',
		'Ulaşım',
		'Bir seyahate hazır',
		'Seyahat 1',
		'Şehir kaçamakları',
		'Seyahat 2',
		'Kalacak yer',
		'Çok heyecan verici',
		'Doğru kişi',
		'Okul',
		'Müzik tercihleri',
		'Spor',
		'Yarış kuralları',
		'Mesaj bırak',
		'İstekler',
		'Davetler',
		'Seyahat deneyimleri',
		'Geçmiş zaman 1',
		'Geçmiş zaman 2',
		'Geçmiş zaman 3',
		'Geçmişle ilgili sorular',
		'Asla çok yaşlı değilsin',
		'Çocukluk anıları',
		'İltifatlar',
		'Bahaneler',
		'Bu çok sinir bozucu!',
		'Dijital bir dünya',
		'Çalışma hayatı',
		'Bunu anlamadım',
		'Biriktirmek mi harcamak mı?',
		'Özür dile',
	];
}

// Path: lessonPage.levels.b1
class _Translations$lessonPage$levels$b1$tr implements Translations$lessonPage$levels$b1$en {
	_Translations$lessonPage$levels$b1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B1 - Orta Seviye';
	@override List<String> get lessons => [
		'Kültürel gelenekler',
		'Ünlüler',
		'Sanat ve yaratıcılık',
		'Gelecek planları',
		'Etkinlik planlama',
		'Hedefler ve planlar',
		'Tarihi olaylar',
		'Teknoloji',
		'Asla ama asla',
		'Neler oluyor',
		'Hayal tatili',
		'Sosyal medya',
		'Kitap önerileri',
		'O günlerden biri',
		'Özel fotoğraflar',
		'Kişisel başarılar',
		'Favori filmler',
		'Haber bülteni',
		'Mutluluk',
		'Yoğun bir hafta',
		'Büyüdüğüm yer',
		'Okul günleri',
		'Profiller',
		'Hayat haritaları',
		'Günlük',
		'Sırada ne var',
		'Öneri yapma',
		'Ne oldu',
		'Anılar',
		'Kültür şoku',
		'İlgi cümleleri',
		'İş görüşmeleri',
		'Yapılacaklar listesi',
		'Benim tarzım bir şehir',
		'İnternet nesli',
		'Popüler markalar',
		'Görüş cümleleri',
		'Nasıl görünüyor',
		'Yaşam alanı',
		'İyi beslenme',
		'Sıradışı hobiler',
		'Zor bir seçim',
		'Harekete geç',
		'Yeni beceriler',
		'Şikayet yapma',
		'Eğitim',
		'Yeşil şehirler',
		'Bir işte ne var',
		'Kişisel zorluklar',
		'Görüşme cümleleri',
		'Nazik kapanışlar',
		'Gündem haberleri',
		'Küçük değişiklikler',
		'Özür bahaneleri',
		'Telefon adabı',
		'Sözünü kesmek için özür dilerim…',
		'Şikayet yanıtları',
	];
}

// Path: lessonPage.levels.b2
class _Translations$lessonPage$levels$b2$tr implements Translations$lessonPage$levels$b2$en {
	_Translations$lessonPage$levels$b2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'B2 - Üst Orta Seviye';
	@override List<String> get lessons => [
		'Kişilikler',
		'Harika liderler',
		'Sağlıklı yaşam tarzı',
		'Gerçek nedir?',
		'Kişisel gelişim',
		'Açık konuşmak',
		'Rol yapmak mı?',
		'Hatırlıyorum...',
		'Sosyal geri bildirim',
		'Suç mahalli',
		'Nazik sorunlar',
		'Çatışma çözümü',
		'Sev ya da nefret et?',
		'Çevresel sorunlar',
		'Bunu çözebiliriz',
		'Gizemler ve suçlar',
		'Olası gelecekler',
		'İş planları',
		'Toplantı kararları',
		'O kadar tahmin edilebilir ki...',
		'İşte',
		'Bilim ve teknoloji',
		'Zaman yönetimi',
		'İnsan hakları',
	];
}

// Path: lessonPage.levels.c1
class _Translations$lessonPage$levels$c1$tr implements Translations$lessonPage$levels$c1$en {
	_Translations$lessonPage$levels$c1$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C1 - İleri Düzey';
	@override List<String> get lessons => [
		'Kültürel normlar',
		'Sosyal medya etkisi',
		'Kariyer seçimleri',
		'Performansı hızlandırmak',
		'İcatlar',
		'Zaman yolculuğu',
		'Mülkler',
		'İş becerileri',
		'Tarihsel değişimler',
		'Gözden geçirme yazımı',
		'Gizemler',
		'Garip teoriler',
		'Ünlüler',
		'Küresel politikalar',
		'Ürün patlaması',
		'Mutlu olacak mı?',
		'Belki sonra...',
		'Yeni çözümler',
		'Bağlamsal etki',
		'Kaybolmuş bir logo',
		'Nazik davranışlar',
		'Ne film',
		'Ne kadar sinir bozucu',
		'Haberlerde',
	];
}

// Path: lessonPage.levels.c2
class _Translations$lessonPage$levels$c2$tr implements Translations$lessonPage$levels$c2$en {
	_Translations$lessonPage$levels$c2$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'C2 - Uzman';
	@override List<String> get lessons => [
		'Küreselleşme',
		'Doğal afetler',
		'Bilgilere tepki verme',
		'İş-yaşam dengesi',
		'Uzaktan çalışma',
		'Aile sorunları',
		'Temel insan anatomisi',
		'Sağlık tahminleri',
		'Sağlık hizmetlerine erişim',
		'Küresel seyahat deneyimi',
		'Süper güçler',
		'Takım oluşturma',
		'Biofloresans',
		'İkilemler',
		'Sosyal heyecan',
		'Değişimler',
		'Çalış, çalış, çalış',
		'Yerel sorunlar',
		'Sorunlar, sorunlar',
		'Gerçek mi, kurgu mu?',
		'Gezilecek yerler',
		'Gönüllü çalışma',
		'Zihin gözü',
		'Medya tüketimi',
	];
}

// Path: rolePlayPage.flirtingMeet.chat
class _Translations$rolePlayPage$flirtingMeet$chat$tr implements Translations$rolePlayPage$flirtingMeet$chat$en {
	_Translations$rolePlayPage$flirtingMeet$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün kafede hafif bir flört sohbeti pratik edeceğiz — selam, iltifat, numara isteme. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Bu koltuk dolu mu? Bugün yer kalmamış.';
	@override String get outgoing1 => 'Buyurun! Ben de kahvemi bekliyordum.';
	@override String get incoming2Highlight => 'Teşekkürler';
	@override String get incoming2Rest => '! Bu arada ben Alex. Seni buraya ne getirdi?';
	@override String get botReply => 'Tanıştığımıza memnun oldum. Sık gelir misin buraya?';
}

// Path: rolePlayPage.freeTalkHobby.chat
class _Translations$rolePlayPage$freeTalkHobby$chat$tr implements Translations$rolePlayPage$freeTalkHobby$chat$en {
	_Translations$rolePlayPage$freeTalkHobby$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün hobiler hakkında serbest sohbet pratik edeceğiz — sorma, cevaplama, doğal tepkiler. Önce anlatacağım, sonra konuşacağız. Hazır mısın?';
	@override String get incoming1 => 'Peki, hafta sonları genellikle ne yaparsın?';
	@override String get outgoing1 => 'Yürüyüşü ve film izlemeyi severim. Sen?';
	@override String get incoming2Highlight => 'Güzel';
	@override String get incoming2Rest => '! Ben de daha fazla yürüyüş yapmak istiyordum. Favori bir parkurun var mı?';
	@override String get botReply => 'Kulağa harika geliyor. Bir ara birlikte gidelim mi?';
}

// Path: rolePlayPage.coffee.chat
class _Translations$rolePlayPage$coffee$chat$tr implements Translations$rolePlayPage$coffee$chat$en {
	_Translations$rolePlayPage$coffee$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün bir kahve dükkanında sipariş vermeyi pratik edeceğiz — selam, boyutlar, ekler. Önce biraz açıklama yapacağım, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Hoş geldin! Bugün senin için ne yapabilirim?';
	@override String get outgoing1 => 'Merhaba! Orta boy latte alabilir miyim, lütfen.';
	@override String get incoming2Highlight => 'Tabii';
	@override String get incoming2Rest => '! Sıcak mı yoksa soğuk mu istersin, ek bir şey var mı?';
	@override String get botReply => 'Harika seçim. Siparişinle birlikte başka bir şey ister misin?';
}

// Path: rolePlayPage.directions.chat
class _Translations$rolePlayPage$directions$chat$tr implements Translations$rolePlayPage$directions$chat$en {
	_Translations$rolePlayPage$directions$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün sokakta yön sormayı pratik edeceğiz. Önce biraz açıklama yapacağım, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Merhaba! Biraz kaybolmuş görünüyorsun — bir şey bulmana yardım edebilir miyim?';
	@override String get outgoing1 => 'Evet, en yakın metro istasyonunu arıyorum.';
	@override String get incoming2Highlight => 'Tabii ki';
	@override String get incoming2Rest => '! O yöne iki blok yürü, sonra sola dön. Girişi göreceksin.';
	@override String get botReply => 'Rica ederim! İstasyon yakınında bir restoran önerisi ister misin?';
}

// Path: rolePlayPage.interview.chat
class _Translations$rolePlayPage$interview$chat$tr implements Translations$rolePlayPage$interview$chat$en {
	_Translations$rolePlayPage$interview$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün bir iş görüşmesi pratik edeceğiz. Önce biraz açıklama yapacağım, sonra canlandıracağız — seni ben mülakata alacağım, sonra yer değiştireceğiz. Nasıl, iyi mi?';
	@override String get incoming1 => 'Bugün geldiğin için teşekkürler. Kısaca kendini tanıtır mısın?';
	@override String get outgoing1 => 'Tabii ki. Burada olmaktan ve deneyimlerimi paylaşmaktan heyecan duyuyorum.';
	@override String get incoming2Highlight => 'Harika';
	@override String get incoming2Rest => '. Gurur duyduğun bir projeden bahset.';
	@override String get botReply => 'Bu etkileyici. Rol hakkında ne gibi soruların var?';
}

// Path: rolePlayPage.missedTrain.chat
class _Translations$rolePlayPage$missedTrain$chat$tr implements Translations$rolePlayPage$missedTrain$chat$en {
	_Translations$rolePlayPage$missedTrain$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün istasyonda trenini kaçırdığında ne söyleyeceğini pratik edeceğiz. Önce birkaç ifade öğreteceğim, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Merhaba, nereye gitmeye çalışıyorsunuz?';
	@override String get outgoing1 => 'Manchester\'a gitmem gerekiyor. Sanırım 10:15 trenimi kaçırdım.';
	@override String get incoming2Highlight => 'Sorun değil';
	@override String get incoming2Rest => '. Bir sonraki uygun treni kontrol edeyim.';
	@override String get botReply => 'En hızlı seçeneği mi yoksa en ucuz olanı mı tercih edersiniz?';
}

// Path: rolePlayPage.flightAttendant.chat
class _Translations$rolePlayPage$flightAttendant$chat$tr implements Translations$rolePlayPage$flightAttendant$chat$en {
	_Translations$rolePlayPage$flightAttendant$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün uçakta bir hostesle konuşmayı pratik edeceğiz — koltuk, bagaj, yemek. Önce açıklayacağım, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Merhaba! Biniş kartınızı görebilir miyim, lütfen?';
	@override String get outgoing1 => 'Tabii, buyurun. 14B koltuğundayım.';
	@override String get incoming2Highlight => 'Teşekkürler';
	@override String get incoming2Rest => '. Koltuğunuzu bulmanıza yardım ister misiniz?';
	@override String get botReply => 'Bir şeyler içmek ister misiniz — su, meyve suyu, kahve veya çay?';
}

// Path: rolePlayPage.trainTicket.chat
class _Translations$rolePlayPage$trainTicket$chat$tr implements Translations$rolePlayPage$trainTicket$chat$en {
	_Translations$rolePlayPage$trainTicket$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün gişeden tren bileti almayı pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Merhaba! Nereye gitmek istersiniz?';
	@override String get outgoing1 => 'Edinburgh\'a gitmek istiyorum, lütfen.';
	@override String get incoming2Highlight => 'Harika';
	@override String get incoming2Rest => '. Ne zaman seyahat etmek istersiniz?';
	@override String get botReply => 'Tek yön mü yoksa gidiş-dönüş mü istersiniz?';
}

// Path: rolePlayPage.restaurantReservation.chat
class _Translations$rolePlayPage$restaurantReservation$chat$tr implements Translations$rolePlayPage$restaurantReservation$chat$en {
	_Translations$rolePlayPage$restaurantReservation$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün restoranda rezervasyon yapmayı pratik edeceğiz. Önce birkaç ifade öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Merhaba! Size nasıl yardımcı olabilirim?';
	@override String get outgoing1 => 'Merhaba, akşam yemeği için rezervasyon yapmak istiyorum.';
	@override String get incoming2Highlight => 'Tabii ki';
	@override String get incoming2Rest => '. Hangi gün gelmek istersiniz?';
	@override String get botReply => 'Kaç kişi olacaksınız?';
}

// Path: rolePlayPage.doctorAppointment.chat
class _Translations$rolePlayPage$doctorAppointment$chat$tr implements Translations$rolePlayPage$doctorAppointment$chat$en {
	_Translations$rolePlayPage$doctorAppointment$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün telefonla doktor randevusu almayı pratik edeceğiz. Önce anahtar ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Merhaba! Bugün size nasıl yardımcı olabilirim?';
	@override String get outgoing1 => 'Merhaba, bir doktor randevusu almak istiyorum.';
	@override String get incoming2Highlight => 'Tabii';
	@override String get incoming2Rest => '. Daha önce kliniğimize gelmiş miydiniz?';
	@override String get botReply => 'Doktora ne için gelmek istiyorsunuz?';
}

// Path: rolePlayPage.shoppingClothes.chat
class _Translations$rolePlayPage$shoppingClothes$chat$tr implements Translations$rolePlayPage$shoppingClothes$chat$en {
	_Translations$rolePlayPage$shoppingClothes$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün bir mağazada kıyafet alışverişini pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Merhaba! Bir şey bulmanıza yardım edebilir miyim?';
	@override String get outgoing1 => 'Evet, günlük giyim için rahat bir gömlek arıyorum.';
	@override String get incoming2Highlight => 'Tabii';
	@override String get incoming2Rest => '. Genelde hangi bedeni giyiyorsunuz?';
	@override String get botReply => 'Gündelik mi yoksa daha resmi bir şey mi tercih edersiniz?';
}

// Path: rolePlayPage.takingTaxi.chat
class _Translations$rolePlayPage$takingTaxi$chat$tr implements Translations$rolePlayPage$takingTaxi$chat$en {
	_Translations$rolePlayPage$takingTaxi$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün taksiye binmeyi pratik edeceğiz — varış noktası, şoförle sohbet ve ödeme. Önce öğreteceğim, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Merhaba! Nereye gitmek istersiniz?';
	@override String get outgoing1 => 'Park Caddesi\'ndeki Grand Hotel, lütfen.';
	@override String get incoming2Highlight => 'Anladım';
	@override String get incoming2Rest => '. Tam adresiniz var mı?';
	@override String get botReply => 'En hızlı rotayı mı tercih edersiniz?';
}

// Path: rolePlayPage.rentingApartment.chat
class _Translations$rolePlayPage$rentingApartment$chat$tr implements Translations$rolePlayPage$rentingApartment$chat$en {
	_Translations$rolePlayPage$rentingApartment$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün ev sahibiyle daire kiralama hakkında konuşmayı pratik edeceğiz. Önce anahtar ifadeleri öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?';
	@override String get incoming1 => 'Merhaba! Daireyi kiralamakla ilgileniyor musunuz?';
	@override String get outgoing1 => 'Evet, hakkında daha fazla bilgi almak istiyorum.';
	@override String get incoming2Highlight => 'Harika';
	@override String get incoming2Rest => '. Ne zaman taşınmayı düşünüyorsunuz?';
	@override String get botReply => 'Eşyalı mı yoksa eşyasız bir daire mi arıyorsunuz?';
}

// Path: rolePlayPage.birthdayParty.chat
class _Translations$rolePlayPage$birthdayParty$chat$tr implements Translations$rolePlayPage$birthdayParty$chat$en {
	_Translations$rolePlayPage$birthdayParty$chat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get briefing => 'Merhaba! Bugün bir arkadaşınla doğum günü partisi planlamayı pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?';
	@override String get incoming1 => 'Peki, kimin doğum gününü planlıyoruz?';
	@override String get outgoing1 => 'Arkadaşım Emma için — doğum günü gelecek ay.';
	@override String get incoming2Highlight => 'Güzel';
	@override String get incoming2Rest => '! Partiyi ne zaman yapalım?';
	@override String get botReply => 'Evde mi yoksa restoranda mı yapmayı tercih edersin?';
}

// Path: profilePage.faqItems.supportedLanguages
class _Translations$profilePage$faqItems$supportedLanguages$tr implements Translations$profilePage$faqItems$supportedLanguages$en {
	_Translations$profilePage$faqItems$supportedLanguages$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Uygulama hangi dilleri destekliyor?';
	@override String get answer => 'Lingola arayüzü İngilizce, Almanca, İtalyanca, Fransızca, Türkçe, Japonca, İspanyolca, Rusça, Hintçe, Portekizce ve Basitleştirilmiş Çince dillerinde kullanılabilir.';
}

// Path: profilePage.faqItems.howAiWorks
class _Translations$profilePage$faqItems$howAiWorks$tr implements Translations$profilePage$faqItems$howAiWorks$en {
	_Translations$profilePage$faqItems$howAiWorks$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Yapay zeka nasıl çalışıyor?';
	@override String get answer => 'Yapay zeka seninle gerçek bir eğitmen gibi etkileşimde bulunuyor. Konuşmalarını analiz ediyor, hataları tespit ediyor ve ilerlemene göre kişiselleştirilmiş geri bildirim sunuyor.';
}

// Path: profilePage.faqItems.offlineUse
class _Translations$profilePage$faqItems$offlineUse$tr implements Translations$profilePage$faqItems$offlineUse$en {
	_Translations$profilePage$faqItems$offlineUse$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Uygulamayı çevrimdışı kullanabilir miyim?';
	@override String get answer => 'Evet. Belirli dersleri ve konuşma senaryolarını önceden indirip çevrimdışı kullanabilirsin. Ancak, canlı sohbet için internet bağlantısı gereklidir.';
}

// Path: profilePage.faqItems.isFree
class _Translations$profilePage$faqItems$isFree$tr implements Translations$profilePage$faqItems$isFree$en {
	_Translations$profilePage$faqItems$isFree$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Uygulama ücretsiz mi?';
	@override String get answer => 'Temel versiyon ücretsizdir. Premium ile gelişmiş sohbet senaryoları, telaffuz analizi ve kişisel eğitmen modu alırsın.';
}

// Path: profilePage.faqItems.pronunciationEval
class _Translations$profilePage$faqItems$pronunciationEval$tr implements Translations$profilePage$faqItems$pronunciationEval$en {
	_Translations$profilePage$faqItems$pronunciationEval$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Telaffuzum nasıl değerlendirilir?';
	@override String get answer => 'Uygulama sesini analiz eder ve yapay zeka destekli ses tanıma kullanarak aksanını ve telaffuzunu puanlar. Geliştirmen gereken kelimeler vurgulanır.';
}

// Path: profilePage.faqItems.dailyPractice
class _Translations$profilePage$faqItems$dailyPractice$tr implements Translations$profilePage$faqItems$dailyPractice$en {
	_Translations$profilePage$faqItems$dailyPractice$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Günlük pratik yapmam gerekiyor mu?';
	@override String get answer => 'Evet. Sistem her gün ilerlemeni takip eder. Günde sadece 10-15 dakika konuşma pratiği yapmak dil öğrenimini belirgin şekilde hızlandırabilir.';
}

// Path: profilePage.faqItems.levelDetermination
class _Translations$profilePage$faqItems$levelDetermination$tr implements Translations$profilePage$faqItems$levelDetermination$en {
	_Translations$profilePage$faqItems$levelDetermination$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Öğrenme seviyem nasıl belirleniyor?';
	@override String get answer => 'İlk giriş yaptığında yapılan kısa bir seviye kontrolü mevcut bilginizi analiz eder. Sonrasında yapay zeka otomatik olarak seviyene uygun dersleri önerir.';
}

// Path: profilePage.faqItems.realPeopleChat
class _Translations$profilePage$faqItems$realPeopleChat$tr implements Translations$profilePage$faqItems$realPeopleChat$en {
	_Translations$profilePage$faqItems$realPeopleChat$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Gerçek insanlarla konuşabilir miyim?';
	@override String get answer => 'Evet. Premium kullanıcılar gerçek eğitmenlerle kısa pratik seansları planlayabilir.';
}

// Path: profilePage.faqItems.dataSecurity
class _Translations$profilePage$faqItems$dataSecurity$tr implements Translations$profilePage$faqItems$dataSecurity$en {
	_Translations$profilePage$faqItems$dataSecurity$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Verilerim güvende mi?';
	@override String get answer => 'Kesinlikle. Tüm konuşmalar ve kullanıcı verileri şifreli olarak saklanır. Kişisel bilgileriniz asla üçüncü şahıslarla paylaşılmaz.';
}

// Path: profilePage.faqItems.disableReminders
class _Translations$profilePage$faqItems$disableReminders$tr implements Translations$profilePage$faqItems$disableReminders$en {
	_Translations$profilePage$faqItems$disableReminders$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Günlük hatırlatmaları nasıl kapatabilirim?';
	@override String get answer => 'Profil ayarlarına git, Bildirimleri aç ve hatırlatma sıklığını değiştir veya bildirimleri tamamen kapat.';
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
			'app.premium' => 'PREMIUM',
			'app.notifications' => 'Bildirimler',
			'app.streak' => 'Öğrenme serisi',
			'app.profile' => 'Profil',
			'common.continueLabel' => 'DEVAM ET',
			'common.back' => 'GERİ',
			'common.locked' => 'Kilidi Açık Değil',
			'common.minutes' => ({required Object value}) => '${value} dk',
			'common.close' => 'Kapat',
			'common.getStarted' => 'BAŞLA',
			'common.connectionError' => 'Bağlantı yok. İnternetini kontrol et ve tekrar dene.',
			'common.genericError' => 'Bir şeyler ters gitti. Lütfen tekrar dene.',
			'common.tryAgain' => 'Tekrar dene',
			'apiErrors.unauthorized' => 'Lütfen tekrar giriş yap.',
			'apiErrors.notFound' => 'Aradığın içerik bulunamadı.',
			'apiErrors.validationFailed' => 'Lütfen bilgilerini kontrol edip tekrar dene.',
			'apiErrors.nameRequired' => 'İsim boş olamaz.',
			'apiErrors.imageRequired' => 'Lütfen yüklenecek bir fotoğraf seç.',
			'apiErrors.avatarInvalidType' => 'Yalnızca JPEG, PNG veya WebP fotoğraflar kabul edilir.',
			'apiErrors.avatarEmpty' => 'Seçilen fotoğraf boş.',
			'apiErrors.avatarTooLarge' => 'Fotoğraf çok büyük (en fazla 5 MB).',
			'apiErrors.notificationsRequired' => 'Bildirim tercihi gerekli.',
			'apiErrors.premiumRequired' => 'Bu ders için Premium gerekli.',
			'apiErrors.levelRequired' => 'Bu seviyeyi açmak için önceki dersleri tamamla.',
			'apiErrors.internalError' => 'Bir şeyler ters gitti. Lütfen tekrar dene.',
			'onboarding.pageA11y' => ({required Object current, required Object total}) => 'Eğitim sayfası ${current} / ${total}',
			'onboarding.letsStart' => 'Hadi Başlayalım',
			'onboarding.slide1.title' => 'Haftalar İçinde Kendine Güvenle Konuş',
			'onboarding.slide1.body' => 'AI ile gerçek konuşmalar pratiği yap. Aksanını, özgüvenini ve akıcılığını her gün geliştir.',
			'onboarding.slide1.testimonialName' => 'Sarah Williams, 24',
			'onboarding.slide1.testimonialBody' => 'Önceden İngilizce konuşamıyordum. Şimdi işte her gün konuşuyorum.',
			'onboarding.slide2.title' => 'Fiyatı Olmadan Özel Eğitmen',
			'onboarding.slide2.body' => 'Gerçek konuşmalar. Anlık geri bildirim.\nPlanlama yok. Baskı yok.',
			'onboarding.slide2.realTutor' => 'Gerçek Eğitmen',
			'onboarding.slide2.lingola' => 'Lingola',
			'onboarding.slide2.priceReal' => '\$30 / saat',
			'onboarding.slide2.priceLingola' => '\$9.99 / yıl',
			'onboarding.slide2.versus' => 'VS',
			'onboarding.slide2.scheduled' => 'Planlı',
			'onboarding.slide2.anytime' => 'Her Zaman',
			'onboarding.slide2.stressful' => 'Stresli',
			'onboarding.slide2.noPressure' => 'Baskı Yok',
			'onboarding.slide2.price' => 'Fiyat',
			'onboarding.slide2.availability' => 'Uygunluk',
			'onboarding.slide2.feeling' => 'Duygu',
			'onboarding.slide3.title' => 'Senin İçin Oluşturulmuş Bir Öğrenme Planı',
			'onboarding.slide3.body' => 'Hedeflerin, Hızın, Seviyen. Başlangıçtan Akıcıya — Adım Adım.',
			'onboarding.slide3.goal' => 'Hedef',
			'onboarding.slide3.practice' => 'Pratik',
			'onboarding.slide3.progress' => 'İlerleme',
			'targetLanguage.title' => 'Öğrenmek istediğin dili seç',
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
			'language.step' => ({required Object current, required Object total}) => 'Adım ${current} / ${total}',
			'language.title' => 'Hangi dili öğrenmek istiyorsun?',
			'language.nativeSection' => 'Anadilim',
			'language.nativeField' => 'Ana dil',
			'language.nativeName' => 'Türkçe',
			'language.targetSection' => 'Öğrenmek istiyorum',
			'language.targetField' => 'Hedef Dil',
			'language.targetName' => 'İngilizce',
			'language.direction' => 'Dil yönü',
			'language.selectLanguage' => 'Dil seç',
			'language.comingSoonBadge' => 'Yakında...',
			'language.english' => 'İngilizce',
			'language.french' => 'Fransızca',
			'language.japanese' => 'Japonca',
			'language.spanish' => 'İspanyolca',
			'language.russian' => 'Rusça',
			'setup.goalTitle' => 'Neden yeni bir dil öğrenmek istiyorsunuz?',
			'setup.goalHint' => 'Hedefine tam uyan kişisel bir çalışma planı hazırlayacağız',
			'setup.goalCareer' => 'Kariyer Gelişimi',
			'setup.goalTravel' => 'Seyahat',
			'setup.goalLiving' => 'Yurt Dışında Yaşamak',
			'setup.goalStudying' => 'Eğitim',
			'setup.goalOther' => 'Kişisel gelişim',
			'setup.interestsTitle' => 'Lütfen ilgi alanlarınızı seçiniz',
			'setup.interestsHint' => 'İlgini çeken konularla sana özel bir öğrenme deneyimi oluşturacağız.',
			'setup.seeMoreEllipsis' => 'Daha fazla...',
			'setup.levelTitle' => 'Mevcut seviyeni nasıl tanımlarsın?',
			'setup.levelA1' => 'Bu dili sıfırdan öğreniyorum',
			'setup.levelA2' => 'Temel sohbetlere katılabilirim',
			'setup.levelB1' => 'Aşina olduğum konularda kısa sohbetleri idare edebilirim',
			'setup.levelB2' => 'Günlük konular hakkında detaylı konuşabilirim',
			'setup.levelC1' => 'Ana dili konuşanlarla akıcı bir şekilde konuşabilirim',
			'setup.levelC2' => 'Her konuda kendimi net bir şekilde ifade edebiliyorum',
			'setup.paceTitle' => 'Kayda değer bir ilerleme görmeyi ne kadar yakında istiyorsun?',
			'setup.explanationTitle' => 'Kendi dilinde sorduğun sorulara nasıl açıklama yapalım?',
			'setup.explanationHint' => 'Bunu istediğin zaman profil ayarlarından değiştirebilirsin.',
			'setup.explanationNative' => 'Anadilimde açıkla',
			'setup.explanationEnglish' => 'İngilizce açıkla',
			'setup.paceHint' => 'Planın temposunu ayarlamamıza yardımcı olur',
			'setup.paceMonth1' => '1 ay',
			'setup.paceMonth2_3' => '2-3 ay',
			'setup.paceMonth6' => '6 ay',
			'setup.paceYear1' => '1 yıl',
			'setup.paceRelaxed' => 'Acele etmiyorum',
			'setup.progressInsightTitle' => 'Sadece 2 haftada gerçek ilerleme gör!',
			'setup.progressInsightBody' => 'Lingola kullanıcıları genelde daha en baştan konuşma özgüvenlerinde büyük bir artış fark ediyor.',
			'setup.progressInsightConfidence' => 'Konuşma özgüveni',
			'setup.progressInsightToday' => 'Today',
			'setup.progressInsightWeek2' => '2. hafta',
			'setup.progressInsightWithLingola' => 'Lingola ile',
			'setup.progressInsightWithoutApp' => 'Uygulama olmadan',
			'setup.levelHint' => 'Lingola, her seviyeden dil öğrencisine yardımcı olmak için tasarlandı',
			'setup.dailyPracticeTitle' => 'Günde ne kadar pratik yapmak istiyorsun?',
			'setup.dailyPracticeHint' => 'Kendi hızında ilerle, her gün bir adım daha yaklaş.',
			'setup.dailyPracticeMonthlyHours' => ({required Object hours}) => '${hours} / month',
			'setup.dailyPracticeOnlyMinutes' => ({required Object minutes}) => 'Günde sadece ${minutes} dk',
			'setup.dailyPracticeMinutesOption' => ({required Object minutes}) => '${minutes} dk',
			'setup.dailyPracticeToday' => 'Bugün',
			'setup.practiceTimeTitle' => 'Günün hangi saati pratik yapmak istersin?',
			'setup.practiceTimeHint' => 'Hatırlatmalar serini korumana yardımcı olur, her gün hedefine bir adım daha yaklaşmanı sağlar.',
			'setup.practiceTimeMorning' => 'Sabah',
			'setup.practiceTimeAfternoon' => 'Öğleden sonra',
			'setup.practiceTimeEvening' => 'Akşam',
			'setup.practiceTimeFlexible' => 'Esneğim',
			'setup.practiceTimeSave' => 'Kaydet',
			'setup.setPracticeTimeTitle' => 'Zamanını ayarla',
			'setup.setPracticeTimeHint' => 'Hangi zaman aralığında pratik yapmak istersin?',
			'setup.promiseTitle' => 'Ben, her gün konuşma pratiği yapacağıma söz veriyorum',
			'setup.promiseBody' => 'Ve yapay zeka eğitmenleri ile dil öğrenme hedeflerime mümkün olan en hızlı şekilde ulaş',
			'setup.promiseHoldHint' => 'Onaylamak için Lingola logosuna dokunup basılı tut',
			'setup.aiTutorsIntroTitle' => 'Lingola’da 20+ yapay zeka\neğitmeninden dilediğini seçebilirsin',
			'setup.aiTutorsIntroBody' => 'Hepsinin derin kişilikleri ve farklı aksanları var',
			'setup.aiTutorsIntroCta' => 'Biraz Seni Tanıyalım',
			'accountCreating.title' => 'Kişisel Hesabın Oluşturuluyor',
			'accountCreating.titleLine1' => 'Building your',
			'accountCreating.titleLine2' => 'Account',
			'accountCreating.testimonialQuote' => 'Week one I could barely say hello. Week three I was having full conversations with my AI tutor. I\'m not stopping now.',
			'accountCreating.testimonialAuthor' => 'Maria, 29 — 3 months in',
			'accountCreating.stepContent' => 'İçerik oluşturuluyor',
			'accountCreating.stepDialogues' => 'Diyaloglar hazırlanıyor',
			'accountCreating.stepLessons' => 'Dersler optimize ediliyor',
			'accountCreating.stepPlan' => 'Planın son şekli veriliyor',
			'accountCreating.optimization' => 'Optimizasyon',
			'accountCreating.progress' => ({required Object value}) => '${value}%',
			'accountCreating.comparisonPitch' => 'Lingola ile kendi başınıza öğrenmekten 30 kat daha hızlı bir şekilde 600 fazla ifadeyi öğrenin',
			'accountCreating.comparisonAloneCount' => '400',
			'accountCreating.comparisonLingolaCount' => '1000',
			'accountCreating.comparisonUnit' => 'İFADE',
			'accountCreating.comparisonAloneLabel' => 'Tek başına',
			'accountCreating.comparisonLingolaLabel' => 'Lingola',
			'accountCreating.fluencyPitch' => 'Bugünden akıcılığa, bir sonraki seviyeniz sadece 30 gün uzakta',
			'accountCreating.chartToday' => 'Today',
			'accountCreating.chartMid' => '15 Sep',
			'accountCreating.chartEnd' => '30 Sep',
			'planReady.titleLine1' => 'Your plan is',
			'planReady.titleLine2' => 'Ready!',
			'planReady.statBanner' => 'Kullanıcıların %95\'i ilk 7 gün içinde sonuç alıyor',
			'planReady.planTitle' => ({required Object name}) => '${name}\'İN PLANI',
			'planReady.defaultName' => 'SENİN',
			'planReady.fieldCourse' => 'KURS',
			'planReady.fieldLevel' => 'SEVİYENİZ',
			'planReady.fieldFocus' => 'ODAK ALANI',
			'planReady.fieldDuration' => 'SÜRE',
			'planReady.fieldInterests' => 'İLGİ ALANLARI',
			'planReady.startPlan' => 'Start my plan →',
			'planReady.courseEnglish' => 'İngilizce',
			'planReady.courseGerman' => 'Almanca',
			'planReady.courseFrench' => 'Fransızca',
			'planReady.courseItalian' => 'İtalyanca',
			'planReady.courseSpanish' => 'İspanyolca',
			'planReady.courseJapanese' => 'Japonca',
			'planReady.courseRussian' => 'Rusça',
			'planReady.courseTurkish' => 'Türkçe',
			'planReady.goalCareer' => 'Kariyer ve İş',
			'planReady.goalTravel' => 'Seyahat',
			'planReady.goalLiving' => 'Yurt Dışında Yaşamak',
			'planReady.goalStudying' => 'Eğitim',
			'planReady.goalOther' => 'Kişisel gelişim',
			'planReady.levelA1' => 'A1',
			'planReady.levelA2' => 'A2',
			'planReady.levelB1' => 'B1',
			'planReady.levelB2' => 'B2',
			'planReady.levelC1' => 'C1',
			'planReady.levelC2' => 'C2',
			'planReady.paceMonth1' => '1 ay',
			'planReady.paceMonth2_3' => '2-3 ay',
			'planReady.paceMonth6' => '6 ay',
			'planReady.paceYear1' => '1 yıl',
			'planReady.paceRelaxed' => 'Acele etmiyorum',
			'demoChat.brand' => 'Lingola',
			'demoChat.lessonBadge' => 'Seni tanıyalım',
			'demoChat.speed' => '1x',
			'demoChat.typeMessage' => 'Mesaj yaz...',
			'demoChat.incoming1' => 'Merhaba! Ben senin AI eğitmeninim. Başlamadan önce — İngilizce devam etmek istemiyorsan veya bir şeyi anlamazsan bana söyle, dilini değiştiririm. Umarım iyisindir! Hadi seninle ilgili birkaç şey konuşalım — şu an çalışıyor musun, yoksa öğrenci misin?',
			'previewChat.brand' => 'Lingola',
			'previewChat.lessonBadge' => 'Ders 1: Selamlaşmalar',
			'previewChat.speed' => '1x',
			'previewChat.typeMessage' => 'Bir mesaj yaz...',
			'previewChat.incoming1' => 'Merhaba! Lingola\'ya hoş geldin — ben senin AI eğitmeninim. Seviyen ne olursa olsun merak etme; burada kendini güvende hissederek İngilizce öğreneceksin. İngilizcede \'merhaba\' demek için \'Hi\' veya \'Hello\' dersin — hadi dene, bana İngilizce \'Hi!\' yaz!',
			'previewChat.outgoing1' => 'Merhaba! Pratik yapmaya hazırım.',
			'previewChat.incoming2Highlight' => 'Günaydın',
			'previewChat.incoming2Rest' => ', Emrah! Hazır hissetmene sevindim. Bir sabah kahvesi her zaman bir bağlantı kurmaya harika bir başlangıçtır. Ne hakkında konuşmak istersin?',
			'previewChat.holdToSpeak' => 'Konuşmak için basılı tut',
			'previewChat.recording' => 'Kaydediliyor… göndermek için bırak',
			'previewChat.slideUpToLock' => 'Kilitlemek için yukarı kaydır',
			'previewChat.slideLeftToCancel' => 'İptal için sola kaydır',
			'previewChat.recordingLockedHint' => 'Bitince gönder\'e dokun',
			'paywall.title' => 'Bugün Konuşmaya Başla — Ücretsiz',
			'paywall.subtitle' => 'Sınırsız öğrenme fırsatları',
			'paywall.noCommitment' => 'Taahhüt yok',
			'paywall.cancelAnytime' => 'İstediğin zaman iptal et',
			'paywall.noPaymentToday' => 'Bugün ödeme yok',
			'paywall.daysFree' => '3 Gün Ücretsiz',
			'paywall.thenPrice' => 'Sonra \$1.99/ay',
			'paywall.trialActive' => 'Ücretsiz Deneme Aktif',
			'paywall.payableToday' => 'Bugün Ödenecek',
			'paywall.payableValue' => '3 Gün Ücretsiz 0.00\$',
			'paywall.paymentDate' => 'Ödeme tarihi: 13 Mart 2026',
			'paywall.paymentAmount' => '9.99\$',
			'auth.trainersBadge' => 'Çeşitli AI eğitmenlerimiz',
			'auth.title' => 'Yeni Bir Dile Bugün Başla',
			'auth.body' => 'AI ile gerçek konuşmalar pratiği yap.\nBaskı yok. Yargı yok.',
			'auth.continueGoogle' => 'Google ile Devam Et',
			'auth.continueApple' => 'Apple ile Devam Et',
			'auth.continueGuest' => 'Misafir Olarak Devam Et',
			'auth.or' => 'veya',
			'auth.alreadyHaveAccount' => 'Zaten hesabın var mı?',
			'auth.signIn' => 'Giriş Yap',
			'auth.legal' => 'Lingola\'ya kaydolarak, Hizmet Şartlarımızı kabul etmiş olursunuz. Verilerinizi nasıl işlediğimizi Gizlilik Politikasında ve Çerez Politikası\'nda öğrenin.',
			'auth.terms' => 'Hizmet Şartları',
			'auth.privacy' => 'Gizlilik Politikası',
			'auth.cookies' => 'Çerez Politikası',
			'nav.home' => 'Ana Sayfa',
			'nav.tutor' => 'Eğitmen',
			'nav.lesson' => 'Ders',
			'nav.rolePlay' => 'Rol Oynama',
			'nav.profile' => 'Profil',
			'home.streakCount' => '2',
			'home.greeting' => 'Günaydın, Jhon',
			'home.todayPractice' => 'Bugünkü Pratik',
			'home.continueConversation' => 'Sohbete Devam Et',
			'home.continueWithTutor' => ({required Object name}) => '${name} ile devam etmek ister misin, yoksa başka hoca mı?',
			'home.continueSameTutor' => ({required Object name}) => '${name} ile devam et',
			'home.chooseOtherTutor' => 'Başka hoca seç',
			'home.minutesLeft' => ({required Object value}) => '${value} dk kaldı',
			'home.lessonProgress' => 'Ders 2 — Selamlaşmalar',
			'home.timeCurrent' => '0dk',
			'home.timeTotal' => '/ 15dk',
			'home.kContinue' => 'Devam Et',
			'home.learningPath' => 'A1 - Başlangıç',
			'home.allLessons' => 'Tüm Dersler',
			'home.introductions' => 'Tanışmalar I',
			'home.greetings' => 'Selamlaşmalar',
			'home.jobs' => 'Meslekler',
			'home.favoriteRoom' => 'Favori Oda',
			'home.dailyRoutine' => 'Günlük Rutin',
			'home.scroll' => 'Kaydır',
			'home.liveLesson' => 'Canlı Ders',
			'home.liveLessonSubtitle' => 'Eğitmenimizle video görüşmesi yap',
			'home.moreTutor' => 'Daha Fazla Eğitmen',
			'home.startTalkNow' => 'Şimdi Sohbete Başla',
			'home.tutorLingola' => 'Lingola',
			'home.tutorMei' => 'Mei Lin',
			'home.tutorKate' => 'Kate',
			'home.tagAdaptive' => 'Uyumlu',
			'home.tagCalm' => 'Sakin',
			'home.tagPatient' => 'Sabırlı',
			'home.tagMethodical' => 'Metodik',
			'home.tagEncouraging' => 'Teşvik Edici',
			'home.tagMore' => '+5',
			'home.moreFeatures' => 'Daha Fazla Özellik',
			'home.practiceLabel' => 'PRATİK',
			'home.wordPractice' => 'Kelime Pratiği',
			'home.wordPracticeBody' => 'Seçtiğin dilde kelime dağarcığını her gün geliştir',
			'home.immersiveLabel' => 'DAHA DERİN',
			'home.quiz' => 'Sınav',
			'home.quizBodyLine1' => 'Gerçek',
			'home.quizBodyLine2' => 'bağlamda örneklerle öğren',
			'home.getStarted' => 'Başla',
			'home.library' => 'Kütüphane',
			'home.libraryTitle' => 'Öğren ve Kaydet',
			'home.learnMore' => 'Daha Fazla Öğren',
			'home.premium.titleBefore' => 'Akıcı bir şekilde ',
			'home.premium.titleHighlight' => 'konuşmanın yolu',
			'home.premium.titleAfter' => ' hata yapma korkusu olmadan.',
			'home.premium.descriptionBefore' => 'Dünyada milyonlarca öğrenciye katıl. Dil engelini aşmaya bugün başla — ',
			'home.premium.descriptionHighlight' => 'ilk 3 gün tamamen ücretsiz.',
			'home.premium.feature1' => '7/24 erişilebilir AI Eğitmeni',
			'home.premium.feature2' => 'Özel Eğitmenlere sınırsız erişim',
			'home.premium.feature3' => 'Senin için özel olarak hazırlanmış günlük ders planı',
			'home.premium.priceAmount' => '1.99\$',
			'home.premium.pricePeriod' => '/ay',
			'home.premium.discount' => 'Yıllık satın alımlarda %40 indirim',
			'home.premium.cta' => 'Başlayın',
			'libraryPage.title' => 'Kütüphane',
			'libraryPage.searchWord' => 'Kelime Ara',
			'libraryPage.savedWordCount' => ({required Object count}) => '${count} Kaydedilmiş Kelime',
			'libraryPage.savedWordTab' => 'Kaydedilmiş Kelimeler',
			'libraryPage.dictionaryTab' => 'Sözlük',
			'libraryPage.dictionaryLabel' => 'Sözlük',
			'wordPracticePage.title' => 'Kelime Pratiği',
			'wordPracticePage.turkish' => 'TÜRKÇE',
			'wordPracticePage.save' => 'Kaydet',
			'wordPracticePage.saved' => 'Kaydedildi',
			'wordPracticePage.listen' => 'Dinle',
			'wordPracticePage.hint' => 'İpucu',
			'wordPracticePage.previous' => 'ÖNCEKİ',
			'wordPracticePage.next' => 'SONRAKİ',
			'quizPage.title' => 'Quiz',
			'quizPage.headline' => 'Bugün neyi geliştirmek istersin?',
			'quizPage.subtitle' => 'Eğitiminizi seçin — 3 dakikadan az sürer 🚀',
			'quizPage.readingTitle' => 'Okuma',
			'quizPage.readingBody' => 'Makaleler ve hikayeler aracılığıyla anlama',
			'quizPage.writingTitle' => 'Yazma',
			'quizPage.writingBody' => 'Dilbilgisi ve kelime bilgisi alıştırmaları',
			'quizPage.speakingTitle' => 'Konuşma',
			'quizPage.speakingBody' => 'Yapay zeka konuşma motoru ile telaffuz',
			'quizPage.readingTestTitle' => 'Okuma Testi',
			'quizPage.read' => 'Oku',
			'quizPage.listeningHint' => 'İngilizce kelimeyi net bir şekilde söyle...',
			'quizPage.micPermissionDenied' => 'Mikrofon veya ses tanıma kullanılamıyor.',
			'quizPage.matchSuccess' => 'Harika! Bu kelimeyle eşleşiyor.',
			'quizPage.matchFail' => ({required Object heard}) => '"${heard}" duyuldu. Tekrar dene.',
			'quizPage.successfulTitle' => 'Başarılı!',
			'quizPage.successfulBody' => 'Ana dil gibi telaffuz!',
			'quizPage.failedTitle' => 'Başarısız',
			'quizPage.failedBody' => 'Neredeyse oldu, bir şans daha ver',
			'quizPage.tryAgain' => 'TEKRAR DENE',
			'quizPage.writingTestTitle' => 'Yazma Testi',
			'quizPage.sourceLanguage' => 'KAYNAK DİL',
			'quizPage.answer' => 'CEVAP',
			'quizPage.writeAnswerHint' => 'Cevabını buraya yaz...',
			'quizPage.submit' => 'Gönder',
			'quizPage.speakingTestTitle' => 'Konuşma Testi',
			'quizPage.speakingProficiency' => 'Konuşma Yeterliliği',
			'quizPage.speakClearlyHint' => 'Mikrofonuna net bir şekilde konuş:',
			'quizPage.speakUp' => 'Sesini Yükselt',
			'quizPage.recording' => 'Kaydediliyor...',
			'quizPage.questionOf' => ({required Object current, required Object total}) => 'SORU ${current} / ${total}',
			'placeholder.title' => ({required Object tab}) => '${tab} yolda',
			'placeholder.body' => ({required Object tab}) => 'Senin için odaklanmış bir ${tab} deneyimi hazırlıyoruz.',
			'tutorPage.title' => 'Eğitmen',
			'tutorPage.chatWithLingola' => 'Lingola ile Sohbet Et',
			'tutorPage.startChat' => 'Sohbet et',
			'tutorPage.chatWithTutor' => ({required Object name}) => '${name} ile Sohbet Et',
			'tutorPage.chatHistory' => 'Sohbet Geçmişi',
			'tutorPage.history' => 'Geçmiş',
			'tutorPage.filter' => 'Filtre',
			'tutorPage.country' => 'Ülke',
			'tutorPage.focus' => 'Odak',
			'tutorPage.moreCountries' => '8+ daha',
			'tutorPage.moreFocus' => '+8',
			'tutorPage.save' => 'KAYDET',
			'tutorPage.clearFilter' => 'Filtreyi kaldır',
			'tutorPage.startTalkNow' => 'Sohbete Başla',
			'tutorPage.typeMessage' => 'Bir mesaj yaz...',
			'tutorPage.speaker' => 'Konuşmacı',
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
			'tutorPage.tutors.santa' => 'Noel Baba',
			'tutorPage.tags.adaptive' => 'Uyumlu',
			'tutorPage.tags.calm' => 'Sakin',
			'tutorPage.tags.patient' => 'Sabırlı',
			'tutorPage.tags.organized' => 'Düzenli',
			'tutorPage.tags.relaxed' => 'Rahat',
			'tutorPage.tags.methodical' => 'Metodik',
			'tutorPage.tags.attentive' => 'Dikkatli',
			'tutorPage.tags.more' => '+5',
			'tutorPage.tags.curious' => 'Meraklı',
			'tutorPage.tags.observer' => 'Gözlemci',
			'tutorPage.tags.ancientKnowledge' => 'Eski Bilgi',
			'tutorPage.tags.wise' => 'Bilge',
			'tutorPage.tags.clear' => 'Açık',
			'tutorPage.tags.decisive' => 'Kararlı',
			'tutorPage.tags.disciplined' => 'Disiplinli',
			'tutorPage.tags.smart' => 'Akıllı',
			'tutorPage.tags.analytic' => 'Analitik',
			'tutorPage.tags.cheerful' => 'Neşeli',
			'tutorPage.tags.generous' => 'Cömert',
			'tutorPage.historyPreview1' => 'Hey! Sıkıntıdan patlamak üzereydim...',
			'tutorPage.historyPreview2' => 'Bugün yemek siparişi vermeyi mi pratik edelim?',
			'tutorPage.time1' => '11:00',
			'tutorPage.time2' => 'Dün',
			'tutorPage.chat.incoming1' => 'Günaydın! Bugün pratik yapmaya hazır hissetmene sevindim.',
			'tutorPage.chat.outgoing1' => 'Evet, selamlaşma ile başlayalım.',
			'tutorPage.chat.incoming2' => 'Harika. Bir meslektaşına merhaba derken ne dersin?',
			'tutorPage.chat.typing' => 'Yazıyor',
			'tutorPage.calling.lessonBadge' => 'Ders 1 : Selamlaşmalar',
			'tutorPage.calling.lessonBadgeFormat' => ({required Object number, required Object title}) => 'Ders ${number} : ${title}',
			'tutorPage.calling.nativeLine' => 'Sıkıldın mı?',
			'tutorPage.calling.englishLine' => 'Sıkıldın mı? O kelimeyi kelime dağarcığımdan sildim. Kalk, plan hazır: Kadıköy\'deki o yeni oyun barına gidiyoruz.',
			'tutorPage.calling.highlight' => 'Sıkıldın mı?',
			'tutorPage.calling.close' => 'Aramayı bitir',
			'tutorPage.calling.toggleCaptions' => 'Altyazıları aç/kapat',
			'tutorPage.calling.toggleHints' => 'İpuçlarını aç/kapat',
			'tutorPage.calling.toggleMic' => 'Mikrofonu aç/kapat',
			'tutorPage.calling.tapToSpeakHint' => 'Konuşmak için dokun, bitirmek için tekrar dokun',
			'lessonPage.title' => 'Öğrenmeye Devam Et',
			'lessonPage.profile' => 'Profil',
			'lessonPage.language' => 'Hedef dil',
			'lessonPage.completed' => 'Tamamlandı',
			'lessonPage.locked' => 'Kilitlendi',
			'lessonPage.pickTutorTitle' => 'Öğretmeninizi seçin',
			'lessonPage.startTalk' => 'Derse başla',
			'lessonPage.chatInstead' => 'Sohbet et',
			'lessonPage.lockedHint' => 'Bu dersi açmak için önceki dersi tamamlayın.',
			'lessonPage.levelLockedTitle' => 'Seviye kilitli',
			'lessonPage.levelLockedBody' => ({required Object userLevel, required Object lessonLevel}) => 'İngilizce seviyeniz ${userLevel} olduğu için ${lessonLevel} derslerini önceki yolu tamamlamadan açamazsınız.',
			'lessonPage.levelLockedOk' => 'Anladım',
			'lessonPage.notesTitle' => 'Ders notları',
			'lessonPage.whatWeLearned' => 'Bugün neler öğrendik',
			'lessonPage.deleteNotes' => 'Ders notlarımı sil',
			'lessonPage.deleteNotesConfirm' => 'Bu notları silmek istiyor musun? Bu işlem geri alınamaz.',
			'lessonPage.delete' => 'Sil',
			'lessonPage.cancel' => 'İptal',
			'lessonPage.practiceCta' => 'Eğer bu çok zor geldiyse, aynı konuyu tekrar pratik yapabilirsin.',
			'lessonPage.practiceNow' => 'Bu konuyu pratik yap',
			'lessonPage.openChat' => 'Öğretmenle sohbeti aç',
			'lessonPage.yourScore' => 'Senin puanın',
			'lessonPage.bestScore' => ({required Object score}) => 'En iyi ${score}/100',
			'lessonPage.scoreChanged' => ({required Object prev, required Object now}) => '${prev} → ${now}',
			'lessonPage.participationSilent' => 'Pasif katılımcı',
			'lessonPage.participationSilentBody' => 'Bu sefer sessiz kaldın. Bu dersi tekrar almanı öneririm.',
			'lessonPage.participationPassive' => 'Düşük katılım',
			'lessonPage.participationPassiveBody' => 'Neredeyse hiç konuşmadın. Dersi tekrar dene ve daha fazla konuş.',
			'lessonPage.participationActive' => 'İyi katılım',
			'lessonPage.participationActiveBody' => 'Sohbete katıldın. Devam et!',
			'lessonPage.participationStrong' => 'Güçlü katılım',
			'lessonPage.participationStrongBody' => 'Çok konuştun. Harika iş!',
			'lessonPage.retakeLesson' => 'Bu dersi tekrar al',
			'lessonPage.finishLesson' => 'Dersi bitir',
			'lessonPage.savingNotes' => 'Öğretmenin bugünkü notları yazıyor...',
			'lessonPage.noNotes' => 'Öğretmenden not almak için bu dersi bitir.',
			'lessonPage.notesDeleted' => 'Ders notları silindi',
			'lessonPage.levels.a1.title' => 'A1 - Başlangıç',
			'lessonPage.levels.a1.lessons.0' => 'Selamlaşmalar',
			'lessonPage.levels.a1.lessons.1' => 'Tanışmalar I',
			'lessonPage.levels.a1.lessons.2' => 'Meslekler',
			'lessonPage.levels.a1.lessons.3' => 'Favori Oda',
			'lessonPage.levels.a1.lessons.4' => 'Günlük Rutin',
			'lessonPage.levels.a1.lessons.5' => 'Meyveler',
			'lessonPage.levels.a1.lessons.6' => 'Tavsiyeler 1',
			'lessonPage.levels.a1.lessons.7' => 'Aile 1',
			'lessonPage.levels.a1.lessons.8' => 'Günlük eşyalar',
			'lessonPage.levels.a1.lessons.9' => 'Memleket',
			'lessonPage.levels.a1.lessons.10' => 'Ev',
			'lessonPage.levels.a1.lessons.11' => 'Yiyecek tercihleri',
			'lessonPage.levels.a1.lessons.12' => 'Hobiler 1',
			'lessonPage.levels.a1.lessons.13' => 'Başarılı insanlar',
			'lessonPage.levels.a1.lessons.14' => 'Yiyecek ve içecekler',
			'lessonPage.levels.a1.lessons.15' => 'Restoranda sipariş vermek',
			'lessonPage.levels.a1.lessons.16' => 'Evcil hayvanlar',
			'lessonPage.levels.a1.lessons.17' => 'Sağlık ve fitness',
			'lessonPage.levels.a1.lessons.18' => 'Hava durumu',
			'lessonPage.levels.a1.lessons.19' => 'Yeni yaşam tarzı',
			'lessonPage.levels.a1.lessons.20' => 'Gelişmek',
			'lessonPage.levels.a1.lessons.21' => 'Hobiler 2',
			'lessonPage.levels.a1.lessons.22' => 'Yerler hakkında sorular',
			'lessonPage.levels.a1.lessons.23' => 'Sahiplik',
			'lessonPage.levels.a1.lessons.24' => 'Alışveriş 1',
			'lessonPage.levels.a1.lessons.25' => 'Saati söylemek',
			'lessonPage.levels.a1.lessons.26' => 'Yönler 1',
			'lessonPage.levels.a1.lessons.27' => 'Alışveriş 2',
			'lessonPage.levels.a1.lessons.28' => 'Seni tanımak',
			'lessonPage.levels.a1.lessons.29' => 'Nesnelerin yerleri',
			'lessonPage.levels.a1.lessons.30' => 'Görünüşler',
			'lessonPage.levels.a1.lessons.31' => 'Yönler 2',
			'lessonPage.levels.a2.title' => 'A2 - Temel',
			'lessonPage.levels.a2.lessons.0' => 'Aile 2',
			'lessonPage.levels.a2.lessons.1' => 'İnsanlar ve yerler',
			'lessonPage.levels.a2.lessons.2' => 'Aile 3',
			'lessonPage.levels.a2.lessons.3' => 'Nesneleri tanımlama',
			'lessonPage.levels.a2.lessons.4' => 'Şehir',
			'lessonPage.levels.a2.lessons.5' => 'Bina projesi',
			'lessonPage.levels.a2.lessons.6' => 'Ev tatlı ev',
			'lessonPage.levels.a2.lessons.7' => 'Saat kaç',
			'lessonPage.levels.a2.lessons.8' => 'Günlük rutin 2',
			'lessonPage.levels.a2.lessons.9' => 'Boş zaman',
			'lessonPage.levels.a2.lessons.10' => 'Yemek ve beslenme',
			'lessonPage.levels.a2.lessons.11' => 'Alışveriş ve tüketim',
			'lessonPage.levels.a2.lessons.12' => 'Tatil',
			'lessonPage.levels.a2.lessons.13' => 'Hafta sonu planları',
			'lessonPage.levels.a2.lessons.14' => 'Resmi veya gündelik',
			'lessonPage.levels.a2.lessons.15' => 'Moda',
			'lessonPage.levels.a2.lessons.16' => 'Alışveriş 3',
			'lessonPage.levels.a2.lessons.17' => 'Tavsiyeler 2',
			'lessonPage.levels.a2.lessons.18' => 'Bunu yapabilirsin',
			'lessonPage.levels.a2.lessons.19' => 'Alışveriş 4',
			'lessonPage.levels.a2.lessons.20' => 'Sohbet',
			'lessonPage.levels.a2.lessons.21' => 'Bir latte lütfen',
			'lessonPage.levels.a2.lessons.22' => 'Yemek',
			'lessonPage.levels.a2.lessons.23' => 'Ulaşım',
			'lessonPage.levels.a2.lessons.24' => 'Bir seyahate hazır',
			_ => null,
		} ?? switch (path) {
			'lessonPage.levels.a2.lessons.25' => 'Seyahat 1',
			'lessonPage.levels.a2.lessons.26' => 'Şehir kaçamakları',
			'lessonPage.levels.a2.lessons.27' => 'Seyahat 2',
			'lessonPage.levels.a2.lessons.28' => 'Kalacak yer',
			'lessonPage.levels.a2.lessons.29' => 'Çok heyecan verici',
			'lessonPage.levels.a2.lessons.30' => 'Doğru kişi',
			'lessonPage.levels.a2.lessons.31' => 'Okul',
			'lessonPage.levels.a2.lessons.32' => 'Müzik tercihleri',
			'lessonPage.levels.a2.lessons.33' => 'Spor',
			'lessonPage.levels.a2.lessons.34' => 'Yarış kuralları',
			'lessonPage.levels.a2.lessons.35' => 'Mesaj bırak',
			'lessonPage.levels.a2.lessons.36' => 'İstekler',
			'lessonPage.levels.a2.lessons.37' => 'Davetler',
			'lessonPage.levels.a2.lessons.38' => 'Seyahat deneyimleri',
			'lessonPage.levels.a2.lessons.39' => 'Geçmiş zaman 1',
			'lessonPage.levels.a2.lessons.40' => 'Geçmiş zaman 2',
			'lessonPage.levels.a2.lessons.41' => 'Geçmiş zaman 3',
			'lessonPage.levels.a2.lessons.42' => 'Geçmişle ilgili sorular',
			'lessonPage.levels.a2.lessons.43' => 'Asla çok yaşlı değilsin',
			'lessonPage.levels.a2.lessons.44' => 'Çocukluk anıları',
			'lessonPage.levels.a2.lessons.45' => 'İltifatlar',
			'lessonPage.levels.a2.lessons.46' => 'Bahaneler',
			'lessonPage.levels.a2.lessons.47' => 'Bu çok sinir bozucu!',
			'lessonPage.levels.a2.lessons.48' => 'Dijital bir dünya',
			'lessonPage.levels.a2.lessons.49' => 'Çalışma hayatı',
			'lessonPage.levels.a2.lessons.50' => 'Bunu anlamadım',
			'lessonPage.levels.a2.lessons.51' => 'Biriktirmek mi harcamak mı?',
			'lessonPage.levels.a2.lessons.52' => 'Özür dile',
			'lessonPage.levels.b1.title' => 'B1 - Orta Seviye',
			'lessonPage.levels.b1.lessons.0' => 'Kültürel gelenekler',
			'lessonPage.levels.b1.lessons.1' => 'Ünlüler',
			'lessonPage.levels.b1.lessons.2' => 'Sanat ve yaratıcılık',
			'lessonPage.levels.b1.lessons.3' => 'Gelecek planları',
			'lessonPage.levels.b1.lessons.4' => 'Etkinlik planlama',
			'lessonPage.levels.b1.lessons.5' => 'Hedefler ve planlar',
			'lessonPage.levels.b1.lessons.6' => 'Tarihi olaylar',
			'lessonPage.levels.b1.lessons.7' => 'Teknoloji',
			'lessonPage.levels.b1.lessons.8' => 'Asla ama asla',
			'lessonPage.levels.b1.lessons.9' => 'Neler oluyor',
			'lessonPage.levels.b1.lessons.10' => 'Hayal tatili',
			'lessonPage.levels.b1.lessons.11' => 'Sosyal medya',
			'lessonPage.levels.b1.lessons.12' => 'Kitap önerileri',
			'lessonPage.levels.b1.lessons.13' => 'O günlerden biri',
			'lessonPage.levels.b1.lessons.14' => 'Özel fotoğraflar',
			'lessonPage.levels.b1.lessons.15' => 'Kişisel başarılar',
			'lessonPage.levels.b1.lessons.16' => 'Favori filmler',
			'lessonPage.levels.b1.lessons.17' => 'Haber bülteni',
			'lessonPage.levels.b1.lessons.18' => 'Mutluluk',
			'lessonPage.levels.b1.lessons.19' => 'Yoğun bir hafta',
			'lessonPage.levels.b1.lessons.20' => 'Büyüdüğüm yer',
			'lessonPage.levels.b1.lessons.21' => 'Okul günleri',
			'lessonPage.levels.b1.lessons.22' => 'Profiller',
			'lessonPage.levels.b1.lessons.23' => 'Hayat haritaları',
			'lessonPage.levels.b1.lessons.24' => 'Günlük',
			'lessonPage.levels.b1.lessons.25' => 'Sırada ne var',
			'lessonPage.levels.b1.lessons.26' => 'Öneri yapma',
			'lessonPage.levels.b1.lessons.27' => 'Ne oldu',
			'lessonPage.levels.b1.lessons.28' => 'Anılar',
			'lessonPage.levels.b1.lessons.29' => 'Kültür şoku',
			'lessonPage.levels.b1.lessons.30' => 'İlgi cümleleri',
			'lessonPage.levels.b1.lessons.31' => 'İş görüşmeleri',
			'lessonPage.levels.b1.lessons.32' => 'Yapılacaklar listesi',
			'lessonPage.levels.b1.lessons.33' => 'Benim tarzım bir şehir',
			'lessonPage.levels.b1.lessons.34' => 'İnternet nesli',
			'lessonPage.levels.b1.lessons.35' => 'Popüler markalar',
			'lessonPage.levels.b1.lessons.36' => 'Görüş cümleleri',
			'lessonPage.levels.b1.lessons.37' => 'Nasıl görünüyor',
			'lessonPage.levels.b1.lessons.38' => 'Yaşam alanı',
			'lessonPage.levels.b1.lessons.39' => 'İyi beslenme',
			'lessonPage.levels.b1.lessons.40' => 'Sıradışı hobiler',
			'lessonPage.levels.b1.lessons.41' => 'Zor bir seçim',
			'lessonPage.levels.b1.lessons.42' => 'Harekete geç',
			'lessonPage.levels.b1.lessons.43' => 'Yeni beceriler',
			'lessonPage.levels.b1.lessons.44' => 'Şikayet yapma',
			'lessonPage.levels.b1.lessons.45' => 'Eğitim',
			'lessonPage.levels.b1.lessons.46' => 'Yeşil şehirler',
			'lessonPage.levels.b1.lessons.47' => 'Bir işte ne var',
			'lessonPage.levels.b1.lessons.48' => 'Kişisel zorluklar',
			'lessonPage.levels.b1.lessons.49' => 'Görüşme cümleleri',
			'lessonPage.levels.b1.lessons.50' => 'Nazik kapanışlar',
			'lessonPage.levels.b1.lessons.51' => 'Gündem haberleri',
			'lessonPage.levels.b1.lessons.52' => 'Küçük değişiklikler',
			'lessonPage.levels.b1.lessons.53' => 'Özür bahaneleri',
			'lessonPage.levels.b1.lessons.54' => 'Telefon adabı',
			'lessonPage.levels.b1.lessons.55' => 'Sözünü kesmek için özür dilerim…',
			'lessonPage.levels.b1.lessons.56' => 'Şikayet yanıtları',
			'lessonPage.levels.b2.title' => 'B2 - Üst Orta Seviye',
			'lessonPage.levels.b2.lessons.0' => 'Kişilikler',
			'lessonPage.levels.b2.lessons.1' => 'Harika liderler',
			'lessonPage.levels.b2.lessons.2' => 'Sağlıklı yaşam tarzı',
			'lessonPage.levels.b2.lessons.3' => 'Gerçek nedir?',
			'lessonPage.levels.b2.lessons.4' => 'Kişisel gelişim',
			'lessonPage.levels.b2.lessons.5' => 'Açık konuşmak',
			'lessonPage.levels.b2.lessons.6' => 'Rol yapmak mı?',
			'lessonPage.levels.b2.lessons.7' => 'Hatırlıyorum...',
			'lessonPage.levels.b2.lessons.8' => 'Sosyal geri bildirim',
			'lessonPage.levels.b2.lessons.9' => 'Suç mahalli',
			'lessonPage.levels.b2.lessons.10' => 'Nazik sorunlar',
			'lessonPage.levels.b2.lessons.11' => 'Çatışma çözümü',
			'lessonPage.levels.b2.lessons.12' => 'Sev ya da nefret et?',
			'lessonPage.levels.b2.lessons.13' => 'Çevresel sorunlar',
			'lessonPage.levels.b2.lessons.14' => 'Bunu çözebiliriz',
			'lessonPage.levels.b2.lessons.15' => 'Gizemler ve suçlar',
			'lessonPage.levels.b2.lessons.16' => 'Olası gelecekler',
			'lessonPage.levels.b2.lessons.17' => 'İş planları',
			'lessonPage.levels.b2.lessons.18' => 'Toplantı kararları',
			'lessonPage.levels.b2.lessons.19' => 'O kadar tahmin edilebilir ki...',
			'lessonPage.levels.b2.lessons.20' => 'İşte',
			'lessonPage.levels.b2.lessons.21' => 'Bilim ve teknoloji',
			'lessonPage.levels.b2.lessons.22' => 'Zaman yönetimi',
			'lessonPage.levels.b2.lessons.23' => 'İnsan hakları',
			'lessonPage.levels.c1.title' => 'C1 - İleri Düzey',
			'lessonPage.levels.c1.lessons.0' => 'Kültürel normlar',
			'lessonPage.levels.c1.lessons.1' => 'Sosyal medya etkisi',
			'lessonPage.levels.c1.lessons.2' => 'Kariyer seçimleri',
			'lessonPage.levels.c1.lessons.3' => 'Performansı hızlandırmak',
			'lessonPage.levels.c1.lessons.4' => 'İcatlar',
			'lessonPage.levels.c1.lessons.5' => 'Zaman yolculuğu',
			'lessonPage.levels.c1.lessons.6' => 'Mülkler',
			'lessonPage.levels.c1.lessons.7' => 'İş becerileri',
			'lessonPage.levels.c1.lessons.8' => 'Tarihsel değişimler',
			'lessonPage.levels.c1.lessons.9' => 'Gözden geçirme yazımı',
			'lessonPage.levels.c1.lessons.10' => 'Gizemler',
			'lessonPage.levels.c1.lessons.11' => 'Garip teoriler',
			'lessonPage.levels.c1.lessons.12' => 'Ünlüler',
			'lessonPage.levels.c1.lessons.13' => 'Küresel politikalar',
			'lessonPage.levels.c1.lessons.14' => 'Ürün patlaması',
			'lessonPage.levels.c1.lessons.15' => 'Mutlu olacak mı?',
			'lessonPage.levels.c1.lessons.16' => 'Belki sonra...',
			'lessonPage.levels.c1.lessons.17' => 'Yeni çözümler',
			'lessonPage.levels.c1.lessons.18' => 'Bağlamsal etki',
			'lessonPage.levels.c1.lessons.19' => 'Kaybolmuş bir logo',
			'lessonPage.levels.c1.lessons.20' => 'Nazik davranışlar',
			'lessonPage.levels.c1.lessons.21' => 'Ne film',
			'lessonPage.levels.c1.lessons.22' => 'Ne kadar sinir bozucu',
			'lessonPage.levels.c1.lessons.23' => 'Haberlerde',
			'lessonPage.levels.c2.title' => 'C2 - Uzman',
			'lessonPage.levels.c2.lessons.0' => 'Küreselleşme',
			'lessonPage.levels.c2.lessons.1' => 'Doğal afetler',
			'lessonPage.levels.c2.lessons.2' => 'Bilgilere tepki verme',
			'lessonPage.levels.c2.lessons.3' => 'İş-yaşam dengesi',
			'lessonPage.levels.c2.lessons.4' => 'Uzaktan çalışma',
			'lessonPage.levels.c2.lessons.5' => 'Aile sorunları',
			'lessonPage.levels.c2.lessons.6' => 'Temel insan anatomisi',
			'lessonPage.levels.c2.lessons.7' => 'Sağlık tahminleri',
			'lessonPage.levels.c2.lessons.8' => 'Sağlık hizmetlerine erişim',
			'lessonPage.levels.c2.lessons.9' => 'Küresel seyahat deneyimi',
			'lessonPage.levels.c2.lessons.10' => 'Süper güçler',
			'lessonPage.levels.c2.lessons.11' => 'Takım oluşturma',
			'lessonPage.levels.c2.lessons.12' => 'Biofloresans',
			'lessonPage.levels.c2.lessons.13' => 'İkilemler',
			'lessonPage.levels.c2.lessons.14' => 'Sosyal heyecan',
			'lessonPage.levels.c2.lessons.15' => 'Değişimler',
			'lessonPage.levels.c2.lessons.16' => 'Çalış, çalış, çalış',
			'lessonPage.levels.c2.lessons.17' => 'Yerel sorunlar',
			'lessonPage.levels.c2.lessons.18' => 'Sorunlar, sorunlar',
			'lessonPage.levels.c2.lessons.19' => 'Gerçek mi, kurgu mu?',
			'lessonPage.levels.c2.lessons.20' => 'Gezilecek yerler',
			'lessonPage.levels.c2.lessons.21' => 'Gönüllü çalışma',
			'lessonPage.levels.c2.lessons.22' => 'Zihin gözü',
			'lessonPage.levels.c2.lessons.23' => 'Medya tüketimi',
			'rolePlayPage.title' => 'Rol Oynama',
			'rolePlayPage.subtitle' => 'Rolünü seç — gerçek bir senaryoyu deneyimle 🎭',
			'rolePlayPage.progressCompleted' => ({required Object value}) => '%${value} tamamlandı',
			'rolePlayPage.minutes' => ({required Object value}) => '${value} Dak',
			'rolePlayPage.beginner' => 'Başlangıç',
			'rolePlayPage.easy' => 'Kolay',
			'rolePlayPage.medium' => 'Orta',
			'rolePlayPage.hard' => 'Zor',
			'rolePlayPage.intermediate' => 'Orta',
			'rolePlayPage.beginnerIntermediate' => 'Başlangıç–Orta',
			'rolePlayPage.screenplay' => 'SENARYO',
			'rolePlayPage.filterAll' => 'Tümü',
			'rolePlayPage.seeAll' => 'Tümünü Gör',
			'rolePlayPage.lingolaRolePlay' => 'Lingola RolePlay',
			'rolePlayPage.shopping' => 'Alışveriş',
			'rolePlayPage.flirting' => 'Flört',
			'rolePlayPage.lifeInTheUs' => 'ABD\'de Yaşam',
			'rolePlayPage.freeDiscussion' => 'Serbest Sohbet',
			'rolePlayPage.jobInterview' => 'İş Mülakatı',
			'rolePlayPage.dailyInteractions' => 'Günlük Etkileşimler',
			'rolePlayPage.socialDynamics' => 'Sosyal Dinamikler',
			'rolePlayPage.restaurant' => 'Restoran',
			'rolePlayPage.travel' => 'Seyahat',
			'rolePlayPage.business' => 'İş',
			'rolePlayPage.customScenarios' => 'Senaryoların',
			'rolePlayPage.createOwnScenario' => 'Kendi senaryonu oluştur!',
			'rolePlayPage.createOwnScenarioTitle' => 'Kendi senaryonu oluştur',
			'rolePlayPage.createFieldScenario' => 'Senaryo',
			'rolePlayPage.createFieldScenarioHint' => 'örn. iş toplantısı',
			'rolePlayPage.createFieldTutorRole' => 'Eğitmen Rolü',
			'rolePlayPage.createFieldTutorRoleHint' => 'örn. mülakat yapan',
			'rolePlayPage.createFieldYourRole' => 'Senin Rolün',
			'rolePlayPage.createFieldYourRoleHint' => 'örn. aday',
			'rolePlayPage.createFieldExtraInfo' => 'Ek Bilgiler (İsteğe bağlı)',
			'rolePlayPage.createFieldExtraInfoHint' => 'örn. bir teknoloji şirketinde kıdemli yazılımcı pozisyonu için mülakat',
			'rolePlayPage.createFieldDifficulty' => 'Zorluk',
			'rolePlayPage.createOwnScenarioContinue' => 'Devam Et',
			'rolePlayPage.createFieldsRequired' => 'Lütfen senaryo ve her iki rol alanını doldur.',
			'rolePlayPage.creatingScenario' => 'Rol oyunun oluşturuluyor',
			'rolePlayPage.creatingScenarioSubtitle' => 'Lingola senaryonu ve görselini hazırlıyor...',
			'rolePlayPage.createFailed' => 'Senaryo oluşturulamadı. Lütfen tekrar dene.',
			'rolePlayPage.deleteFailed' => 'Senaryo silinemedi. Lütfen tekrar dene.',
			'rolePlayPage.flirtingMeet.title' => 'Kafede Birini Tanımak',
			'rolePlayPage.flirtingMeet.screenplay' => 'Samimi bir sohbet başlat, kendinden biraz bahset, ortak ilgi alanları paylaş ve tekrar görüşüp görüşmeyeceğinize karar ver.',
			'rolePlayPage.flirtingMeet.chat.briefing' => 'Merhaba! Bugün kafede hafif bir flört sohbeti pratik edeceğiz — selam, iltifat, numara isteme. Önce açıklayacağım, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.flirtingMeet.chat.incoming1' => 'Bu koltuk dolu mu? Bugün yer kalmamış.',
			'rolePlayPage.flirtingMeet.chat.outgoing1' => 'Buyurun! Ben de kahvemi bekliyordum.',
			'rolePlayPage.flirtingMeet.chat.incoming2Highlight' => 'Teşekkürler',
			'rolePlayPage.flirtingMeet.chat.incoming2Rest' => '! Bu arada ben Alex. Seni buraya ne getirdi?',
			'rolePlayPage.flirtingMeet.chat.botReply' => 'Tanıştığımıza memnun oldum. Sık gelir misin buraya?',
			'rolePlayPage.freeTalkHobby.title' => 'Hobiler Hakkında Sohbet',
			'rolePlayPage.freeTalkHobby.screenplay' => 'Boş zaman aktiviteleri hakkında serbestçe konuş, takip soruları sor, tercihlerini paylaş ve birlikte yeni bir şey denemeyi öner.',
			'rolePlayPage.freeTalkHobby.chat.briefing' => 'Merhaba! Bugün hobiler hakkında serbest sohbet pratik edeceğiz — sorma, cevaplama, doğal tepkiler. Önce anlatacağım, sonra konuşacağız. Hazır mısın?',
			'rolePlayPage.freeTalkHobby.chat.incoming1' => 'Peki, hafta sonları genellikle ne yaparsın?',
			'rolePlayPage.freeTalkHobby.chat.outgoing1' => 'Yürüyüşü ve film izlemeyi severim. Sen?',
			'rolePlayPage.freeTalkHobby.chat.incoming2Highlight' => 'Güzel',
			'rolePlayPage.freeTalkHobby.chat.incoming2Rest' => '! Ben de daha fazla yürüyüş yapmak istiyordum. Favori bir parkurun var mı?',
			'rolePlayPage.freeTalkHobby.chat.botReply' => 'Kulağa harika geliyor. Bir ara birlikte gidelim mi?',
			'rolePlayPage.coffee.title' => 'Kahve Dükkanında Sipariş Verme',
			'rolePlayPage.coffee.screenplay' => 'Favori içeceğini sipariş et, boyutlar ve ekler hakkında sorular sor, toplamını onayla ve kahveni tezgahın üzerinden al.',
			'rolePlayPage.coffee.chat.briefing' => 'Merhaba! Bugün bir kahve dükkanında sipariş vermeyi pratik edeceğiz — selam, boyutlar, ekler. Önce biraz açıklama yapacağım, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.coffee.chat.incoming1' => 'Hoş geldin! Bugün senin için ne yapabilirim?',
			'rolePlayPage.coffee.chat.outgoing1' => 'Merhaba! Orta boy latte alabilir miyim, lütfen.',
			'rolePlayPage.coffee.chat.incoming2Highlight' => 'Tabii',
			'rolePlayPage.coffee.chat.incoming2Rest' => '! Sıcak mı yoksa soğuk mu istersin, ek bir şey var mı?',
			'rolePlayPage.coffee.chat.botReply' => 'Harika seçim. Siparişinle birlikte başka bir şey ister misin?',
			'rolePlayPage.directions.title' => 'Sokakta Yön Sorma',
			'rolePlayPage.directions.screenplay' => 'Bir yere nasıl gidileceğini sor, metro veya otobüs hakkında bilgi al, biletler hakkında bilgi edin ve restoran önerilerini dinle.',
			'rolePlayPage.directions.chat.briefing' => 'Merhaba! Bugün sokakta yön sormayı pratik edeceğiz. Önce biraz açıklama yapacağım, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.directions.chat.incoming1' => 'Merhaba! Biraz kaybolmuş görünüyorsun — bir şey bulmana yardım edebilir miyim?',
			'rolePlayPage.directions.chat.outgoing1' => 'Evet, en yakın metro istasyonunu arıyorum.',
			'rolePlayPage.directions.chat.incoming2Highlight' => 'Tabii ki',
			'rolePlayPage.directions.chat.incoming2Rest' => '! O yöne iki blok yürü, sonra sola dön. Girişi göreceksin.',
			'rolePlayPage.directions.chat.botReply' => 'Rica ederim! İstasyon yakınında bir restoran önerisi ister misin?',
			'rolePlayPage.interview.title' => 'İş Görüşmesi',
			'rolePlayPage.interview.screenplay' => 'Kendini tanıt, yaygın iş görüşmesi sorularını yanıtla, deneyimlerinden bahset ve rol ile sonraki adımlar hakkında sorular sor.',
			'rolePlayPage.interview.chat.briefing' => 'Merhaba! Bugün bir iş görüşmesi pratik edeceğiz. Önce biraz açıklama yapacağım, sonra canlandıracağız — seni ben mülakata alacağım, sonra yer değiştireceğiz. Nasıl, iyi mi?',
			'rolePlayPage.interview.chat.incoming1' => 'Bugün geldiğin için teşekkürler. Kısaca kendini tanıtır mısın?',
			'rolePlayPage.interview.chat.outgoing1' => 'Tabii ki. Burada olmaktan ve deneyimlerimi paylaşmaktan heyecan duyuyorum.',
			'rolePlayPage.interview.chat.incoming2Highlight' => 'Harika',
			'rolePlayPage.interview.chat.incoming2Rest' => '. Gurur duyduğun bir projeden bahset.',
			'rolePlayPage.interview.chat.botReply' => 'Bu etkileyici. Rol hakkında ne gibi soruların var?',
			'rolePlayPage.missedTrain.title' => 'Trenini Kaçırdın',
			'rolePlayPage.missedTrain.screenplay' => 'Trenini kaçırdın ve istasyon görevlisinden yardım iste — nereye gideceğini söyle, bir sonraki treni bul ve perona yön tarifi al.',
			'rolePlayPage.missedTrain.chat.briefing' => 'Merhaba! Bugün istasyonda trenini kaçırdığında ne söyleyeceğini pratik edeceğiz. Önce birkaç ifade öğreteceğim, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.missedTrain.chat.incoming1' => 'Merhaba, nereye gitmeye çalışıyorsunuz?',
			'rolePlayPage.missedTrain.chat.outgoing1' => 'Manchester\'a gitmem gerekiyor. Sanırım 10:15 trenimi kaçırdım.',
			'rolePlayPage.missedTrain.chat.incoming2Highlight' => 'Sorun değil',
			'rolePlayPage.missedTrain.chat.incoming2Rest' => '. Bir sonraki uygun treni kontrol edeyim.',
			'rolePlayPage.missedTrain.chat.botReply' => 'En hızlı seçeneği mi yoksa en ucuz olanı mı tercih edersiniz?',
			'rolePlayPage.flightAttendant.title' => 'Uçuş Hostesiyle Konuşma',
			'rolePlayPage.flightAttendant.screenplay' => 'Uçakta yolcusun. Koltuğunu bul, bagajınla ilgili yardım al, yemek ve içecek seç, uçuş sırasında ihtiyaçlarını dile getir.',
			'rolePlayPage.flightAttendant.chat.briefing' => 'Merhaba! Bugün uçakta bir hostesle konuşmayı pratik edeceğiz — koltuk, bagaj, yemek. Önce açıklayacağım, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.flightAttendant.chat.incoming1' => 'Merhaba! Biniş kartınızı görebilir miyim, lütfen?',
			'rolePlayPage.flightAttendant.chat.outgoing1' => 'Tabii, buyurun. 14B koltuğundayım.',
			'rolePlayPage.flightAttendant.chat.incoming2Highlight' => 'Teşekkürler',
			'rolePlayPage.flightAttendant.chat.incoming2Rest' => '. Koltuğunuzu bulmanıza yardım ister misiniz?',
			'rolePlayPage.flightAttendant.chat.botReply' => 'Bir şeyler içmek ister misiniz — su, meyve suyu, kahve veya çay?',
			'rolePlayPage.trainTicket.title' => 'Tren Bileti Alma',
			'rolePlayPage.trainTicket.screenplay' => 'Tren istasyonunda gişeye git, nereye gideceğini söyle, kalkış saatini seç, bilet türünü ve koltuğunu belirle, bileti öde.',
			'rolePlayPage.trainTicket.chat.briefing' => 'Merhaba! Bugün gişeden tren bileti almayı pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.trainTicket.chat.incoming1' => 'Merhaba! Nereye gitmek istersiniz?',
			'rolePlayPage.trainTicket.chat.outgoing1' => 'Edinburgh\'a gitmek istiyorum, lütfen.',
			'rolePlayPage.trainTicket.chat.incoming2Highlight' => 'Harika',
			'rolePlayPage.trainTicket.chat.incoming2Rest' => '. Ne zaman seyahat etmek istersiniz?',
			'rolePlayPage.trainTicket.chat.botReply' => 'Tek yön mü yoksa gidiş-dönüş mü istersiniz?',
			'rolePlayPage.restaurantReservation.title' => 'Restoranda Rezervasyon Yapma',
			'rolePlayPage.restaurantReservation.screenplay' => 'Akşam yemeği için restoranda masa ayırt — tarih, saat, kişi sayısı ve masa tercihini belirle, rezervasyonunu onayla.',
			'rolePlayPage.restaurantReservation.chat.briefing' => 'Merhaba! Bugün restoranda rezervasyon yapmayı pratik edeceğiz. Önce birkaç ifade öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.restaurantReservation.chat.incoming1' => 'Merhaba! Size nasıl yardımcı olabilirim?',
			'rolePlayPage.restaurantReservation.chat.outgoing1' => 'Merhaba, akşam yemeği için rezervasyon yapmak istiyorum.',
			'rolePlayPage.restaurantReservation.chat.incoming2Highlight' => 'Tabii ki',
			'rolePlayPage.restaurantReservation.chat.incoming2Rest' => '. Hangi gün gelmek istersiniz?',
			'rolePlayPage.restaurantReservation.chat.botReply' => 'Kaç kişi olacaksınız?',
			'rolePlayPage.doctorAppointment.title' => 'Doktor Randevusu Alma',
			'rolePlayPage.doctorAppointment.screenplay' => 'Bir kliniği arayarak doktor randevusu al — ziyaret nedenini açıkla, uygun gün ve saati seç, bilgilerini onayla.',
			'rolePlayPage.doctorAppointment.chat.briefing' => 'Merhaba! Bugün telefonla doktor randevusu almayı pratik edeceğiz. Önce anahtar ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.doctorAppointment.chat.incoming1' => 'Merhaba! Bugün size nasıl yardımcı olabilirim?',
			'rolePlayPage.doctorAppointment.chat.outgoing1' => 'Merhaba, bir doktor randevusu almak istiyorum.',
			'rolePlayPage.doctorAppointment.chat.incoming2Highlight' => 'Tabii',
			'rolePlayPage.doctorAppointment.chat.incoming2Rest' => '. Daha önce kliniğimize gelmiş miydiniz?',
			'rolePlayPage.doctorAppointment.chat.botReply' => 'Doktora ne için gelmek istiyorsunuz?',
			'rolePlayPage.shoppingClothes.title' => 'Kıyafet Alışverişi',
			'rolePlayPage.shoppingClothes.screenplay' => 'Bir mağazada ne aradığını söyle, ürünleri dene, beden ve renk seçeneklerini karşılaştır, alıp almama kararını ver.',
			'rolePlayPage.shoppingClothes.chat.briefing' => 'Merhaba! Bugün bir mağazada kıyafet alışverişini pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.shoppingClothes.chat.incoming1' => 'Merhaba! Bir şey bulmanıza yardım edebilir miyim?',
			'rolePlayPage.shoppingClothes.chat.outgoing1' => 'Evet, günlük giyim için rahat bir gömlek arıyorum.',
			'rolePlayPage.shoppingClothes.chat.incoming2Highlight' => 'Tabii',
			'rolePlayPage.shoppingClothes.chat.incoming2Rest' => '. Genelde hangi bedeni giyiyorsunuz?',
			'rolePlayPage.shoppingClothes.chat.botReply' => 'Gündelik mi yoksa daha resmi bir şey mi tercih edersiniz?',
			'rolePlayPage.takingTaxi.title' => 'Taksiye Binme',
			'rolePlayPage.takingTaxi.screenplay' => 'Yeni bir şehirde taksiye bin, gideceğin yeri söyle, rota hakkında konuş, yolculuk sonunda ödeme yap.',
			'rolePlayPage.takingTaxi.chat.briefing' => 'Merhaba! Bugün taksiye binmeyi pratik edeceğiz — varış noktası, şoförle sohbet ve ödeme. Önce öğreteceğim, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.takingTaxi.chat.incoming1' => 'Merhaba! Nereye gitmek istersiniz?',
			'rolePlayPage.takingTaxi.chat.outgoing1' => 'Park Caddesi\'ndeki Grand Hotel, lütfen.',
			'rolePlayPage.takingTaxi.chat.incoming2Highlight' => 'Anladım',
			'rolePlayPage.takingTaxi.chat.incoming2Rest' => '. Tam adresiniz var mı?',
			'rolePlayPage.takingTaxi.chat.botReply' => 'En hızlı rotayı mı tercih edersiniz?',
			'rolePlayPage.rentingApartment.title' => 'Daire Kiralama',
			'rolePlayPage.rentingApartment.screenplay' => 'Ev sahibiyle kiralık daire hakkında konuş — kira, faturalar, depozito, evcil hayvan, otopark sor ve görüşme ayarla.',
			'rolePlayPage.rentingApartment.chat.briefing' => 'Merhaba! Bugün ev sahibiyle daire kiralama hakkında konuşmayı pratik edeceğiz. Önce anahtar ifadeleri öğreteceğim, sonra canlandıracağız. Nasıl, iyi mi?',
			'rolePlayPage.rentingApartment.chat.incoming1' => 'Merhaba! Daireyi kiralamakla ilgileniyor musunuz?',
			'rolePlayPage.rentingApartment.chat.outgoing1' => 'Evet, hakkında daha fazla bilgi almak istiyorum.',
			'rolePlayPage.rentingApartment.chat.incoming2Highlight' => 'Harika',
			'rolePlayPage.rentingApartment.chat.incoming2Rest' => '. Ne zaman taşınmayı düşünüyorsunuz?',
			'rolePlayPage.rentingApartment.chat.botReply' => 'Eşyalı mı yoksa eşyasız bir daire mi arıyorsunuz?',
			'rolePlayPage.birthdayParty.title' => 'Doğum Günü Partisi Planlama',
			'rolePlayPage.birthdayParty.screenplay' => 'Bir arkadaşınla doğum günü partisi planla — mekan, tarih, davetli listesi, yemek, pasta, müzik ve aktiviteleri birlikte belirle.',
			'rolePlayPage.birthdayParty.chat.briefing' => 'Merhaba! Bugün bir arkadaşınla doğum günü partisi planlamayı pratik edeceğiz. Önce faydalı ifadeleri öğreteceğim, sonra canlandıracağız. Hazır mısın?',
			'rolePlayPage.birthdayParty.chat.incoming1' => 'Peki, kimin doğum gününü planlıyoruz?',
			'rolePlayPage.birthdayParty.chat.outgoing1' => 'Arkadaşım Emma için — doğum günü gelecek ay.',
			'rolePlayPage.birthdayParty.chat.incoming2Highlight' => 'Güzel',
			'rolePlayPage.birthdayParty.chat.incoming2Rest' => '! Partiyi ne zaman yapalım?',
			'rolePlayPage.birthdayParty.chat.botReply' => 'Evde mi yoksa restoranda mı yapmayı tercih edersin?',
			'pushNotifications.title' => 'Lingola',
			'pushNotifications.h2.0' => 'Kısa bir ara verdin galiba.',
			'pushNotifications.h2.1' => 'Bir kelime kadar vaktin var mı?',
			'pushNotifications.h2.2' => 'Buradayız, acele yok.',
			'pushNotifications.h2.3' => 'Dil öğrenme modu biraz durdu.',
			'pushNotifications.h2.4' => 'Mini bir tekrar iyi gelebilir.',
			'pushNotifications.h4.0' => 'Bugün yeni bir kelime seni bekliyor olabilir 👀',
			'pushNotifications.h4.1' => 'Kısa bir pratik kaçırılıyor olabilir.',
			'pushNotifications.h4.2' => 'Bir ifadeyi atlamış olabilirsin.',
			'pushNotifications.h4.3' => 'Bugünkü ilerleme yarım kaldı.',
			'pushNotifications.h4.4' => 'Bir kelime, bir cümle… belki ikisi.',
			'pushNotifications.h8.0' => 'Her gün ilerlemek zorunda değilsin.',
			'pushNotifications.h8.1' => 'Az da olsa tekrar sayılır.',
			'pushNotifications.h8.2' => 'Bugün öğrenmedin diye hiçbir şey kaybetmedin.',
			'pushNotifications.h8.3' => 'Hazırsan devam edebiliriz.',
			'pushNotifications.h8.4' => 'Dil öğrenmek maraton, sprint değil.',
			'pushNotifications.h24.0' => 'Bir gün geçti. Kelimeler hâlâ burada.',
			'pushNotifications.h24.1' => 'Ara vermen normal.',
			'pushNotifications.h24.2' => 'Kaldığın yer duruyor.',
			'pushNotifications.h24.3' => 'Ne zaman istersen devam edebilirsin.',
			'pushNotifications.h24.4' => 'Dil kaçmaz, biz de.',
			'pushNotifications.lessonReminderTitle' => 'Bugünün dersi seni bekliyor',
			'pushNotifications.lessonReminder.0' => 'Bugün henüz derse girmedin — 5 dakika bile yeter.',
			'pushNotifications.lessonReminder.1' => 'Hocan hazır. Kaldığın yerden devam et.',
			'pushNotifications.lessonReminder.2' => 'Kısa bir ders bugün ritmini korur.',
			'pushNotifications.lessonReminder.3' => 'Bugünkü ders hâlâ açık — başlamak ister misin?',
			'pushNotifications.quizReminderTitle' => 'Kısa bir quiz yapalım mı?',
			'pushNotifications.quizReminderWords' => ({required Object count, required Object savedCount}) => 'Son zamanlarda ${count} kelime öğrendin — quiz yapmak ister misin? ${savedCount} kayıtlı kelime seni bekliyor.',
			'pushNotifications.quizReminderSaved' => ({required Object savedCount}) => '${savedCount} kayıtlı kelime gözden geçirmeyi bekliyor.',
			'pushNotifications.quizReminder.0' => 'Bir süredir quiz yapmadın — 3 dakikalık tekrar iyi gelir.',
			'pushNotifications.quizReminder.1' => 'Kayıtlı kelimelerin seni özledi. Hızlı bir quiz?',
			'pushNotifications.quizReminder.2' => 'Ne kadar hatırladığını test et — sadece birkaç dakika.',
			'pushNotifications.quizReminder.3' => 'Şimdi kısa bir quiz, yarını kolaylaştırır.',
			'pushNotifications.eveningLessonTitle' => 'Bugünkü pratiği kaçırma',
			'pushNotifications.eveningLesson.0' => 'Bugün henüz çalışmadın. Kısa bir ders alışkanlığı korur.',
			'pushNotifications.eveningLesson.1' => 'Gün bitmeden — hocanla hızlı bir ders?',
			'pushNotifications.eveningLesson.2' => 'Bugün hâlâ 5 dakikalık bir İngilizce seansı için vakit var.',
			'pushNotifications.eveningLesson.3' => 'Günlük dersin bekliyor. Başlayalım mı?',
			'pushNotifications.streakReminderTitle' => 'Serini koru',
			'pushNotifications.streakReminder' => ({required Object streak}) => '${streak} günlük seridesin — bugün kısa bir ders serini canlı tutar.',
			'notificationsPage.title' => 'Bildirimler',
			'notificationsPage.deleteConfirmTitle' => 'Emin misiniz?',
			'notificationsPage.deleteConfirmBody' => 'Bu bildirim silinecek.',
			'notificationsPage.delete' => 'Sil',
			'notificationsPage.cancel' => 'İptal',
			'notificationsPage.translation.title' => 'Yeni Çeviri Hazır',
			'notificationsPage.translation.body' => 'Sesli çeviri dosyanız başarıyla metne dönüştürüldü ve çevrildi.',
			'notificationsPage.offer.title' => 'Sizi Bekleyen Özel Bir Teklif Var',
			'notificationsPage.offer.body' => 'Sınırsız fotoğraf çevirisi için Premium\'a %50 indirimle geçin.',
			'notificationsPage.stories.title' => 'Yeni Hikayeleri Keşfedin',
			'notificationsPage.stories.body' => 'Hikayeler aracılığıyla yeni kelimeler öğrenin',
			'notificationsPage.practice.title' => 'Günlük pratiğin seni bekliyor',
			'notificationsPage.practice.body' => '5 dakikada kelime, okuma veya konuşma egzersizi yap.',
			'notificationsPage.streak.title' => 'Serini koru',
			'notificationsPage.streak.body' => 'Bugün kısa bir oturum gün serini korur ve alışkanlığı güçlendirir.',
			'notificationsPage.premium.title' => 'Tüm hocalar ve dersler açılsın',
			'notificationsPage.premium.body' => 'Premium ile sınırsız ders, rol oynama ve AI hocalara eriş.',
			'notificationsPage.emptyTitle' => 'Henüz bildirim yok',
			'notificationsPage.emptySubtitle' => 'Bildirim aldığında tekrar kontrol etmeyi unutma.',
			'profilePage.title' => 'Profil',
			'profilePage.userName' => 'Jhon Doe',
			'profilePage.freeVersion' => 'Ücretsiz Versiyon',
			'profilePage.dayStreak' => 'Gün Serisi!',
			'profilePage.accountSettings' => 'Hesap Ayarları',
			'profilePage.general' => 'Genel',
			'profilePage.settingsShare' => 'Paylaş',
			'profilePage.settingsSupport' => 'Destek',
			'profilePage.settingsAbout' => 'Hakkında',
			'profilePage.settingsAccount' => 'Hesap',
			'profilePage.followInstagram' => 'Instagram\'da Takip Et',
			'profilePage.followTikTok' => 'TikTok\'ta Takip Et',
			'profilePage.settings' => 'Ayarlar',
			'profilePage.profileSettings' => 'Profil Ayarları',
			'profilePage.fullName' => 'Tam İsim',
			'profilePage.email' => 'E-posta',
			'profilePage.deleteAccount' => 'Hesabı Sil',
			'profilePage.save' => 'KAYDET',
			'profilePage.profileSaved' => 'Profil kaydedildi',
			'profilePage.profilePhotoUpdated' => 'Profil fotoğrafı güncellendi',
			'profilePage.nameCannotBeEmpty' => 'İsim boş olamaz',
			'profilePage.profileSaveFailed' => 'Profil kaydedilemedi',
			'profilePage.photoUploadFailed' => 'Fotoğraf yüklenemedi',
			'profilePage.notificationsUpdateFailed' => 'Bildirimler güncellenemedi',
			'profilePage.notificationsPermissionDenied' => 'Hatırlatıcı almak için cihaz ayarlarından bildirimlere izin ver.',
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
			'profilePage.next' => 'SONRAKİ',
			'profilePage.specialOfferTitle' => 'Özel teklif',
			'profilePage.specialOfferBody' => 'Gitmeden önce senin için hazırlamış olduğumuz teklife göz at.',
			'profilePage.monthlyPlanTitle' => '1 Aylık Plana Geç',
			'profilePage.monthlyPlanPrice' => '\$79/ay, istediğin zaman iptal et',
			'profilePage.monthlyPlanDesc' => 'Uzun vadeli taahhüt yok. Topluluğumuzla ay ay bağlantıda kal.',
			'profilePage.whatYoullKeep' => 'Sahip olacağın şeyler:',
			'profilePage.keepCharacters' => 'Tüm karakterlere erişim',
			'profilePage.keepVideo' => 'Sınırsız görüntülü arama',
			'profilePage.keepCourses' => 'Tüm kurslara erişim',
			'profilePage.switchMonthlyCta' => 'Aylık Plana Geç',
			'profilePage.confirmTitle' => 'Emin misin?',
			'profilePage.confirmBody' => 'Gerçekten gitmeni istemiyoruz. İşte kaybedeceklerin:',
			'profilePage.loseCharacters' => 'Sınırsız karakter erişimi',
			'profilePage.loseVideo' => 'Sınırsız görüntülü arama erişimi',
			'profilePage.loseCourses' => 'Tüm kurslara erişim',
			'profilePage.discountTitle' => 'Kal ve 1 ay için %60 indirim al',
			'profilePage.discountSubtitle' => 'Şimdiye kadarki en iyi teklifimiz. Sadece \$27.60/ay',
			'profilePage.acceptDiscountCta' => '%60 İndirim Al & Kal',
			'profilePage.farewellTitle' => 'Gitmene üzüldük',
			'profilePage.farewellBody' => ({required Object date}) => 'Üyeliğin iptal edildi. ${date} tarihine kadar erişimin olacak.',
			'profilePage.changeMindTitle' => '✨ Fikrini değiştir?',
			'profilePage.changeMindBody' => ({required Object date}) => '${date} tarihinden önce üyeliğini yeniden etkinleştirebilirsin.',
			'profilePage.reactivateCta' => 'Bekle, yeniden etkinleştirmek istiyorum',
			'profilePage.done' => 'TAMAM',
			'profilePage.notifications' => 'Bildirimler',
			'profilePage.appLanguage' => 'Uygulama Dili',
			'profilePage.explanationLanguage' => 'Açıklama Dili',
			'profilePage.explanationNative' => 'Anadil',
			'profilePage.explanationEnglish' => 'İngilizce',
			'profilePage.explanationUpdateFailed' => 'Açıklama dili güncellenemedi',
			'profilePage.learnInNativeLanguage' => 'Ana Dilinde Öğren',
			'profilePage.targetLanguageLabel' => 'Hedef Dil',
			'profilePage.languageLevel' => 'Dil Seviyesi',
			'profilePage.nativeLanguage' => 'Ana Dilim',
			'profilePage.chineseShort' => 'Çince',
			'profilePage.seeMore' => 'Daha Fazla...',
			'profilePage.searchLanguages' => 'Search',
			'profilePage.interests' => 'İlgi Alanları',
			'profilePage.goalChipCareer' => 'Kariyer',
			'profilePage.goalChipTravel' => 'Seyahat',
			'profilePage.goalChipLiving' => 'Yaşam',
			'profilePage.goalChipStudying' => 'Eğitim',
			'profilePage.goalChipOther' => 'Diğer',
			'profilePage.dailyGoal' => 'Günlük Hedef',
			'profilePage.dailyGoalValueLight' => 'Günlük 5-10 dk',
			'profilePage.dailyGoalValueRecommended' => 'Günlük 15-20 dk',
			'profilePage.dailyGoalValueFast' => 'Günlük 30+ dk',
			'profilePage.dailyReminder' => 'Günlük Hatırlatma',
			'profilePage.selectNativeLanguageTitle' => 'Ana dilini seç',
			'profilePage.reminderOn' => 'Açık',
			'profilePage.reminderOff' => 'Kapalı',
			'profilePage.remindMe' => 'Bana Hatırlat',
			'profilePage.reminderSave' => 'Kaydet',
			'profilePage.reminderSaved' => 'Hatırlatma kaydedildi',
			'profilePage.selectLanguageTitle' => 'Dil Seç',
			'profilePage.premium' => 'Premium',
			'profilePage.passive' => 'Pasif',
			'profilePage.active' => 'Aktif',
			'profilePage.premiumVersion' => 'Premium',
			'profilePage.shareFriend' => 'Arkadaşla Paylaş',
			'profilePage.shareLingola' => 'Lingola\'yı Paylaş',
			'profilePage.shareWithFriendTitle' => 'Arkadaşla Paylaş',
			'profilePage.shareInviteBody' => 'Arkadaşlarını davet et ve birlikte çeviri yapmanın tadını çıkar.',
			'profilePage.rateUs' => 'Bizi Beğendin mi? Puan Ver',
			'profilePage.settingsCertificates' => 'Certificates',
			'profilePage.restorePurchases' => 'Satın Alımları Geri Yükle',
			'profilePage.aboutFlywork' => 'Flywork Hakkında',
			'profilePage.faqHelp' => 'SSS ve Yardım',
			'profilePage.deleteAccountAndData' => 'Hesabı ve Verileri Sil',
			'profilePage.faq' => 'Lingola SSS',
			'profilePage.faqItems.supportedLanguages.question' => 'Uygulama hangi dilleri destekliyor?',
			'profilePage.faqItems.supportedLanguages.answer' => 'Lingola arayüzü İngilizce, Almanca, İtalyanca, Fransızca, Türkçe, Japonca, İspanyolca, Rusça, Hintçe, Portekizce ve Basitleştirilmiş Çince dillerinde kullanılabilir.',
			'profilePage.faqItems.howAiWorks.question' => 'Yapay zeka nasıl çalışıyor?',
			'profilePage.faqItems.howAiWorks.answer' => 'Yapay zeka seninle gerçek bir eğitmen gibi etkileşimde bulunuyor. Konuşmalarını analiz ediyor, hataları tespit ediyor ve ilerlemene göre kişiselleştirilmiş geri bildirim sunuyor.',
			'profilePage.faqItems.offlineUse.question' => 'Uygulamayı çevrimdışı kullanabilir miyim?',
			'profilePage.faqItems.offlineUse.answer' => 'Evet. Belirli dersleri ve konuşma senaryolarını önceden indirip çevrimdışı kullanabilirsin. Ancak, canlı sohbet için internet bağlantısı gereklidir.',
			'profilePage.faqItems.isFree.question' => 'Uygulama ücretsiz mi?',
			'profilePage.faqItems.isFree.answer' => 'Temel versiyon ücretsizdir. Premium ile gelişmiş sohbet senaryoları, telaffuz analizi ve kişisel eğitmen modu alırsın.',
			'profilePage.faqItems.pronunciationEval.question' => 'Telaffuzum nasıl değerlendirilir?',
			'profilePage.faqItems.pronunciationEval.answer' => 'Uygulama sesini analiz eder ve yapay zeka destekli ses tanıma kullanarak aksanını ve telaffuzunu puanlar. Geliştirmen gereken kelimeler vurgulanır.',
			'profilePage.faqItems.dailyPractice.question' => 'Günlük pratik yapmam gerekiyor mu?',
			'profilePage.faqItems.dailyPractice.answer' => 'Evet. Sistem her gün ilerlemeni takip eder. Günde sadece 10-15 dakika konuşma pratiği yapmak dil öğrenimini belirgin şekilde hızlandırabilir.',
			'profilePage.faqItems.levelDetermination.question' => 'Öğrenme seviyem nasıl belirleniyor?',
			'profilePage.faqItems.levelDetermination.answer' => 'İlk giriş yaptığında yapılan kısa bir seviye kontrolü mevcut bilginizi analiz eder. Sonrasında yapay zeka otomatik olarak seviyene uygun dersleri önerir.',
			'profilePage.faqItems.realPeopleChat.question' => 'Gerçek insanlarla konuşabilir miyim?',
			'profilePage.faqItems.realPeopleChat.answer' => 'Evet. Premium kullanıcılar gerçek eğitmenlerle kısa pratik seansları planlayabilir.',
			'profilePage.faqItems.dataSecurity.question' => 'Verilerim güvende mi?',
			'profilePage.faqItems.dataSecurity.answer' => 'Kesinlikle. Tüm konuşmalar ve kullanıcı verileri şifreli olarak saklanır. Kişisel bilgileriniz asla üçüncü şahıslarla paylaşılmaz.',
			'profilePage.faqItems.disableReminders.question' => 'Günlük hatırlatmaları nasıl kapatabilirim?',
			'profilePage.faqItems.disableReminders.answer' => 'Profil ayarlarına git, Bildirimleri aç ve hatırlatma sıklığını değiştir veya bildirimleri tamamen kapat.',
			'profilePage.support' => 'Destek',
			'profilePage.feedback' => 'Geri Bildirim',
			'profilePage.progression' => 'İlerleme',
			'profilePage.progressTitle' => 'İlerleme',
			'profilePage.goodMorning' => 'Günaydın,',
			'profilePage.progressUserName' => 'Jhon',
			'profilePage.progressLanguage' => 'İngilizce',
			'profilePage.past7Days' => 'Son 7 Gün',
			'profilePage.past7DaysBody' => 'Günlük çalışarak serini oluştur ve güçlü bir öğrenme alışkanlığı yarat.',
			'profilePage.currentLevel' => 'Mevcut Seviye',
			'profilePage.xpLeft' => ({required Object xp, required Object level}) => 'Sadece ${xp} XP kaldı, ${level} seviyesine ulaşmak için!',
			'profilePage.toNextLevel' => 'SONRAKİ SEVİYEYE',
			_ => null,
		} ?? switch (path) {
			'profilePage.dayStreakLabel' => 'Gün Serisi',
			'profilePage.totalPoints' => 'Toplam Puan',
			'profilePage.savedWords' => 'Kaydedilen Kelimeler',
			'profilePage.itemsToReview' => ({required Object count}) => '${count} gözden geçirilecek öğe',
			'profilePage.logout' => 'Çıkış Yap',
			'profilePage.logoutTitle' => 'Çıkış yapmak istediğine emin misiniz?',
			'profilePage.logoutBody' => 'Görüşmek üzere! Nefes egzersizlerini özleyeceğiz.',
			'profilePage.logoutConfirm' => 'LOGOUT',
			'profilePage.logoutCancel' => 'CANCEL',
			'profilePage.days.mon' => 'PZT',
			'profilePage.days.tue' => 'SAL',
			'profilePage.days.wed' => 'ÇAR',
			'profilePage.days.thu' => 'PER',
			'profilePage.days.fri' => 'CUM',
			'profilePage.days.sat' => 'CMT',
			'profilePage.days.sun' => 'PZR',
			'profilePage.certificateTitle' => 'Sertifikanız',
			'profilePage.certificateLevelTitle' => ({required Object level}) => '${level} Sertifikası',
			'profilePage.certificateOf' => 'Başarı Sertifikası',
			'profilePage.certificatePresentedTo' => 'This certificate is proudly presented to',
			'profilePage.certificateAchievementBody' => ({required Object level}) => 'This achievement recognizes the successful completion of all ${level}-level lessons and learning activities, demonstrating a strong foundation in essential English communication skills.',
			'profilePage.certificateLevelCompleted' => ({required Object levelName}) => 'Level Completed: ${levelName}',
			'profilePage.certificateDateCompleted' => ({required Object date}) => 'Date of Completion: ${date}',
			'profilePage.certificateIdDisplay' => ({required Object id}) => 'Certificate ID: ${id}',
			'profilePage.certificateBrandTagline' => 'Learn. Speak. Connect.',
			'profilePage.certificateCertifiesThat' => 'Bu belge, aşağıda adı geçen kişinin',
			'profilePage.certificatePathway' => 'Lingola İngilizce Yolu',
			'profilePage.certificateAwardedTo' => 'Verilen kişi',
			'profilePage.certificateCompleted' => 'başarıyla tamamlamıştır',
			'profilePage.certificateCompletedDetail' => 'Lingola İngilizce Yeterlilik Programını başarıyla tamamlamış ve aşağıdaki seviyede sertifika almaya hak kazanmıştır:',
			'profilePage.certificateLevelLine' => ({required Object level}) => 'İngilizce Seviyesi — CEFR ${level}',
			'profilePage.certificateIssued' => ({required Object date}) => 'Veriliş tarihi: ${date}',
			'profilePage.certificateDateOfCompletion' => 'Tamamlanma Tarihi',
			'profilePage.certificateIdLabel' => 'Sertifika No',
			'profilePage.certificateVerify' => 'Sertifikayı doğrulamak için tarayın',
			'profilePage.certificateVerifyAuthenticity' => 'DOĞRULAMA',
			'profilePage.certificateScanOrVisit' => 'QR kodu tarayın veya bağlantıyı ziyaret ederek doğrulayın.',
			'profilePage.certificateVerifyHint' => 'QR kodu tarayan herkes başarınızı doğrulayabilir.',
			'profilePage.certificateShare' => 'Sertifikayı Paylaş',
			'profilePage.certificateDownload' => 'İndir',
			'profilePage.certificateDownloadSaved' => 'Sertifika galeriye kaydedildi',
			'profilePage.certificateDownloadFailed' => 'Sertifika kaydedilemedi. Lütfen tekrar deneyin.',
			'profilePage.certificateCreateQr' => 'QR Oluştur',
			'profilePage.certificateNotAvailableTitle' => 'Sertifika kilitli',
			'profilePage.certificateNotAvailable' => ({required Object level}) => 'Henüz ${level} derslerinizi tamamlamadığınız için bu belgeyi kullanamazsınız.',
			'profilePage.certificateNotAvailableOk' => 'Anladım',
			'profilePage.certificateShareQr' => 'QR Kodunu Paylaş',
			'profilePage.certificateShareBody' => ({required Object level}) => 'Lingola ${level} sertifikamı kazandım!',
			'profilePage.certificateShareSubject' => ({required Object level}) => 'Lingola ${level} Sertifikası',
			'profilePage.certificateProvidedBy' => 'Sertifika sağlayıcı',
			'profilePage.certificatePreviewBody' => 'Lingola\'da bir CEFR seviyesini tamamladığınızda sertifikanız burada görünecek — adınız, seviyeniz ve doğrulanabilir QR kodu ile.',
			'profilePage.certificatePreviewHint' => 'Sertifikanızı açmak için bir seviye yolunu tamamlayın',
			'profilePage.certificateTapToView' => 'Sertifikanızı görüntülemek ve paylaşmak için dokunun',
			'profilePage.interestShopping' => 'Alışveriş',
			'profilePage.interestFood' => 'Yemek',
			'profilePage.interestPopCulture' => 'Popüler Kültür',
			'profilePage.interestFilm' => 'Film',
			'profilePage.interestMusic' => 'Müzik',
			'profilePage.interestSport' => 'Spor',
			'profilePage.interestTechnology' => 'Teknoloji',
			'profilePage.interestScience' => 'Bilim',
			'profilePage.interestHealth' => 'Sağlık',
			'profilePage.interestFashion' => 'Moda',
			'profilePage.interestArt' => 'Sanat',
			'profilePage.interestLiterature' => 'Edebiyat',
			'profilePage.interestHistory' => 'Tarih',
			'profilePage.interestCulture' => 'Kültür',
			'profilePage.interestAstronomy' => 'Astronomi',
			'profilePage.interestPet' => 'Evcil Hayvan',
			'profilePage.interestSocialMedia' => 'Sosyal Medya',
			'profilePage.interestEntrepreneur' => 'Girişimcilik',
			'profilePage.confirmDeleteWarning' => 'Hesabınız ve tüm ilerlemeniz kalıcı olarak silinecek. Bu işlemi geri almak mümkün değil.',
			'profilePage.confirmKeepGoing' => 'İlerlemeden Vazgeçme',
			'profilePage.myCertificates' => 'Sertifikalarım',
			'profilePage.certificatesEmptyTitle' => 'Henüz sertifika yok',
			'profilePage.certificatesEmptySubtitle' => 'Bir seviye tamamladığında tekrar kontrol etmeyi unutma.',
			'profilePage.restorePurchasesSuccess' => 'Satın alımların geri yüklendi.',
			'profilePage.restorePurchasesEmpty' => 'Bu hesap için aktif satın alma bulunamadı.',
			_ => null,
		};
	}
}
