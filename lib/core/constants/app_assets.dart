/// Merkezi asset yolları — yeni ikon indirmeden önce buraya bak.
abstract final class AppAssets {
  // —— Genel ——
  static const backArrow = 'assets/images/generalArrowIcon.svg';
  static const heart = 'assets/images/heart.svg';
  static const microphone = 'assets/images/microphone.svg';
  static const speaker = 'assets/images/speaker.svg';
  static const whiteSpeaker = 'assets/images/whiteSpeaker.svg';
  static const translate = 'assets/images/translate.svg';
  static const hint = 'assets/images/noHint.svg';
  /// İpucu açık (çizgisiz ampul).
  static const hintOn = 'assets/images/hintOn.svg';
  static const lightbulb = 'assets/images/ampul.svg';
  static const send = 'assets/images/oksign.svg';
  static const success = 'assets/images/quizSection/succesfull.svg';
  static const failed = 'assets/images/onboarding/unseccesfull.svg';

  // —— Flags ——
  static const flagEn = 'assets/images/flags/en.svg';
  static const flagJp = 'assets/images/flags/jp.svg';
  static const flagCn = 'assets/images/home/flag_cn.svg';
  static const flagEs = 'assets/images/flags/spanish_icon.svg';
  static const flagIt = 'assets/images/flags/italian.svg';
  static const flagDe = 'assets/images/flags/german.svg';
  static const flagFr = 'assets/images/flags/french.svg';
  static const flagPt = 'assets/images/flags/po.svg';
  static const flagRu = 'assets/images/flags/russian.svg';
  static const flagTr = 'assets/images/flags/tr.svg';
  static const flagHi = 'assets/images/flags/hi.svg';
  static const flagGeneric = 'assets/images/home/flag_icon.svg';

  /// Tutor slug → bayrak (API null olsa bile).
  static String? flagForTutorSlug(String? slug) {
    switch (slug?.toLowerCase()) {
      case 'lingola':
        return flagGeneric;
      case 'elena':
        return flagEn;
      case 'kenji':
        return flagJp;
      case 'freya':
        return flagDe;
      case 'camila':
        return flagEs;
      case 'marco':
        return flagIt;
      case 'julian':
        return flagFr;
      case 'ines':
        return flagPt;
      case 'felix':
        return flagDe;
      case 'diego':
        return flagEs;
      case 'amara':
        return flagHi;
      case 'erik':
        return flagDe;
      case 'katie':
      case 'morgan':
        return flagEn;
      default:
        // Fantasy / özel karakterlerde bayrak yok.
        return null;
    }
  }

  // —— Quiz ——
  static const quizBook = 'assets/images/quizIcons/book.svg';
  static const quizWriting = 'assets/images/quizIcons/writing.svg';
  static const quizSpeaking = 'assets/images/quizIcons/microphoneSpeaking.svg';
  static const quizArrow = 'assets/images/quizIcons/arrow.svg';

  // —— Writing Test ——
  static const writingCopy = 'assets/images/writingTestIcons/copyIcon.svg';
  static const writingTranslate =
      'assets/images/writingTestIcons/translateIconWritingTest.svg';
  static const writingSubmit = 'assets/images/writingTestIcons/submit.svg';

  // —— Speaking Test ——
  static const speakingHead =
      'assets/images/speakingTestIcons/userSpeakingIcon.png';

  // —— Profile ——
  static const profileAvatar = 'assets/images/home/profile_avatar.svg';
  static const profileSettings =
      'assets/images/profilIcons/profilesettings.svg';
  static const profileLangFlag =
      'assets/images/profilIcons/profileLangFlag.svg';
  static const profileCrown = 'assets/images/profilIcons/crownProfile.svg';
  static const profileShareFriends =
      'assets/images/profilIcons/shareFriends.svg';
  static const shareFriendsBanner =
      'assets/images/profilIcons/shareWitFriendsBanner.png';
  static const profileRateUs = 'assets/images/profilIcons/rateUs.svg';
  static const profileFaq = 'assets/images/profilIcons/faq.svg';
  static const profileTopArrow = 'assets/images/profilIcons/topArrow.svg';
  static const profileBottomArrow =
      'assets/images/profilIcons/bottomArrow.svg';
  static const profileSupport = 'assets/images/profilIcons/support.svg';
  static const profileFeedback = 'assets/images/profilIcons/feedback.svg';
  static const profileProgression =
      'assets/images/profilIcons/progression.svg';
  static const profileSaveButton =
      'assets/images/profilIcons/saveButton.svg';
  static const profileLogout = 'assets/images/profilIcons/logout.svg';
  static const profileCamera = 'assets/images/profilIcons/camera.svg';
  static const profileDeleteAccount =
      'assets/images/profilIcons/deleteAccount.svg';
  static const profileDeleteAccountTik =
      'assets/images/profilIcons/deleteaccounttik.svg';
  static const profileStarsGroup =
      'assets/images/profilIcons/starsgroup.svg';
  static const profilePremiumIconDeleteAccount =
      'assets/images/profilIcons/premiumIconDeleteAccounts.svg';
  static const profileCornesTik = 'assets/images/profilIcons/cornesTik.svg';
  static const profileUnlimitedCharacter =
      'assets/images/profilIcons/unlimitedCharacter.svg';
  static const profileUnlimitedVideo =
      'assets/images/profilIcons/unlimitedVideo.svg';
  static const profileAccessAll = 'assets/images/profilIcons/accessAll.svg';
  static const profileDiscount = 'assets/images/profilIcons/discount.svg';
  static const profileChain = 'assets/images/profilIcons/chain.svg';
  static const profileLock = 'assets/images/profilIcons/lock.svg';
  static const profileNotification =
      'assets/images/home/notification_icon.svg';
  static const notificationTrash =
      'assets/images/notifications/trash.svg';
  static const profileStreakFlame = 'assets/images/home/streak_icon.svg';
  static const profileFireOrange =
      'assets/images/profilIcons/fireOrange.svg';
  static const profileStreak = 'assets/images/profilIcons/streak.svg';
  static const premiumCheck = 'assets/images/home/premium_check.svg';
  static const homePremiumCrown = 'assets/images/home/premium_crown.svg';
  /// Premium rozeti elmas (kırpılmış, fazla boşluksuz).
  static const premiumDiamond = 'assets/images/home/premium_diamond.png';
  static const homeStar = 'assets/images/home/star_small.svg';
  static const homeArrowCircle = 'assets/images/home/arrow_circle.svg';

  // —— Role Play ——
  static const rolePlayCoffee = 'assets/images/roleplay/orderingcoffe.png';
  static const rolePlayDirections =
      'assets/images/roleplay/askingdirection.png';
  static const rolePlayInterview = 'assets/images/roleplay/jobinterview.png';
  static const rolePlayScreenplay = 'assets/images/roleplay/screenplay.svg';
  static const rolePlayResize =
      'assets/images/roleplay/kucultmebuyutme.svg';
  static const rolePlayRecording = 'assets/images/roleplay/seskaydi.svg';

  // —— Tutor ——
  static const tutorFilter = 'assets/images/profilIcons/tutor/filter.svg';
  static const tutorSpeaker = 'assets/images/profilIcons/tutor/speakerChat.svg';
  static const tutorChatWithLingola =
      'assets/images/profilIcons/tutor/chatwithlingola.svg';
  static const tutorHeroBg =
      'assets/images/profilIcons/tutor/noelbababacground.png';
  static const tutorRobot = 'assets/images/tutors/hero.png';
  static const tutorLingola = 'assets/images/profilIcons/tutor/alien.png';
  static const tutorZephyrion = 'assets/images/profilIcons/tutor/alien.png';
  static const tutorVaelen = 'assets/images/profilIcons/tutor/vaelen.png';
  static const tutorElrion = 'assets/images/profilIcons/tutor/Elrion.png';
  static const tutorUkrath = 'assets/images/profilIcons/tutor/ukrath.png';
  static const tutorElena = 'assets/images/profilIcons/tutor/elena.png';
  static const tutorKenji = 'assets/images/profilIcons/tutor/kenji.png';
  static const tutorFreya = 'assets/images/profilIcons/tutor/freya.png';
  static const tutorCamila = 'assets/images/profilIcons/tutor/camila.png';
  static const tutorMarco = 'assets/images/profilIcons/tutor/marco.png';
  static const tutorJulian = 'assets/images/profilIcons/tutor/julian.png';
  static const tutorInes = 'assets/images/profilIcons/tutor/ines.png';
  static const tutorFelix = 'assets/images/profilIcons/tutor/felix.png';
  static const tutorDiego = 'assets/images/profilIcons/tutor/diego.png';
  static const tutorAmara = 'assets/images/profilIcons/tutor/amara.png';
  static const tutorErik = 'assets/images/profilIcons/tutor/erik.png';
  static const tutorKatie = 'assets/riv/Female/kaite.png';
  static const tutorMorgan = 'assets/images/profilIcons/tutor/morgan.png';

  // —— Calling ——
  static const callingEye = 'assets/images/callinScreen/eye.svg';
  static const callingClosedEye = 'assets/images/callinScreen/closedEye.svg';
  static const callingResize = 'assets/images/roleplay/kucultmebuyutme.svg';
  static const tutorElrionRiv = 'assets/riv/elrion.riv';
  static const tutorVaelenRiv = 'assets/riv/vaelen.riv';
  static const tutorUkrathRiv = 'assets/riv/ukrath.riv';
  static const tutorSantaRiv = 'assets/riv/santa_claus.riv';
  static const tutorZephyrionRiv = 'assets/riv/zephyrion.riv';
  static const tutorLingolaRiv = 'assets/riv/Female/lingola_robot.riv';
  /// Production: Mindcoach gibi CDN birincil kaynak.
  static const tutorLingolaRivCdn =
      'https://lingola.b-cdn.net/tutors/lingola/avatar.riv';
  static String tutorRiveCdn(String slug) =>
      'https://lingola.b-cdn.net/tutors/$slug/avatar.riv';

  // —— Tutor Rive (Female/Male foto eşleştirmesi) ——
  static const tutorElenaRiv = 'assets/riv/Female/avatar3.riv';
  static const tutorKenjiRiv = 'assets/riv/Male/avatar4.riv';
  static const tutorFreyaRiv = 'assets/riv/Female/avatar5.riv';
  static const tutorCamilaRiv = 'assets/riv/Female/avatar6.riv';
  static const tutorMarcoRiv = 'assets/riv/Male/avatar2.riv';
  static const tutorJulianRiv = 'assets/riv/Male/avatar1.riv';
  static const tutorInesRiv = 'assets/riv/Female/avatar2.riv';
  static const tutorFelixRiv = 'assets/riv/Male/avatar7.riv';
  static const tutorDiegoRiv = 'assets/riv/Male/avatar6.riv';
  static const tutorAmaraRiv = 'assets/riv/Female/avatar1.riv';
  static const tutorErikRiv = 'assets/riv/Male/avatar3.riv';
  static const tutorKatieRiv = 'assets/riv/Female/kaite.riv';
  static const tutorMorganRiv = 'assets/riv/Male/morgan.riv';
}
