/// Merkezi asset yolları — yeni ikon indirmeden önce buraya bak.
abstract final class AppAssets {
  // —— Genel ——
  static const backArrow = 'assets/images/generalArrowIcon.svg';
  static const heart = 'assets/images/heart.svg';
  /// Figma silme ikonu — 36×36.
  static const deleteIcon = 'assets/images/deleteIcon.png';
  static const deleteIconSize = 36.0;
  static const microphone = 'assets/images/microphone.svg';
  static const speaker = 'assets/images/speaker.svg';
  static const whiteSpeaker = 'assets/images/whiteSpeaker.svg';
  static const translate = 'assets/images/translate.svg';
  static const hint = 'assets/images/noHint.svg';
  /// İpucu açık (çizgisiz ampul).
  static const hintOn = 'assets/images/hintOn.svg';
  static const lightbulb = 'assets/images/ampul.svg';
  static const send = 'assets/images/oksign.svg';
  static const chatMic = 'assets/images/chat_mic.svg';
  static const chatVideo = 'assets/images/chat_video.svg';
  static const chatActionMessage = 'assets/images/chat_action_message.svg';
  static const chatActionMic = 'assets/images/chat_action_mic.svg';
  static const success = 'assets/images/quizSection/successful.png';
  static const failed = 'assets/images/quizSection/failed.png';
  static const homePractice = 'assets/images/quizSection/practice.png';
  static const homeImmersive = 'assets/images/quizSection/immersive.png';
  /// Onboarding seçim tik — 19.5×19.5.
  static const selectionTick = 'assets/images/onboarding/tik.png';
  static const selectionTickSize = 19.5;

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
        // Lingola: bayrak yok — UI 🌎 gösterir.
        return null;
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
  static const quizReading = 'assets/images/quizIcons/reading.png';
  static const quizWriting = 'assets/images/quizIcons/writing.png';
  static const quizSpeaking = 'assets/images/quizIcons/speaking.png';
  static const quizArrow = 'assets/images/quizIcons/arrow.svg';
  /// Eski SVG yolları (geriye dönük referanslar).
  static const quizBook = quizReading;

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
  static const profileSettingsGear =
      'assets/images/profilIcons/newProfileIcons/settings.png';
  static const profileEditPen =
      'assets/images/profilIcons/newProfileIcons/editPen.png';
  static const profileLangFlag =
      'assets/images/profilIcons/profileLangFlag.svg';
  static const profileCrown = 'assets/images/profilIcons/crownProfile.svg';
  static const profileShareFriends =
      'assets/images/profilIcons/shareFriends.svg';
  static const profileShare = 'assets/images/profilIcons/share.png';
  static const shareFriendsBanner =
      'assets/images/profilIcons/shareWitFriendsBanner.png';
  static const profileRateUs = 'assets/images/profilIcons/rateUs.svg';
  static const profileRateHeart = 'assets/images/profilIcons/rateHeart.png';
  static const profileSearch = 'assets/images/profilIcons/search.png';
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
  static const profileLogout = 'assets/images/profilIcons/logout.png';
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
  static const profileInstagram = 'assets/images/profilIcons/instagram.png';
  static const profileTiktok = 'assets/images/profilIcons/tiktok.png';
  static const profileDiscount = 'assets/images/profilIcons/discount.svg';
  static const profileChain = 'assets/images/profilIcons/chain.svg';
  static const profileLock = 'assets/images/profilIcons/lock.svg';
  static const profileTargetLang =
      'assets/images/profilIcons/newProfileIcons/targetLang.png';
  static const profileLangLevel =
      'assets/images/profilIcons/newProfileIcons/langLevel.png';
  static const profileMotherTongue =
      'assets/images/profilIcons/newProfileIcons/motherTongue.png';
  static const profileHobbies =
      'assets/images/profilIcons/newProfileIcons/hobbies.png';
  static const profileDailyTarget =
      'assets/images/profilIcons/newProfileIcons/dailyTarget.png';
  static const profileDailyReminder =
      'assets/images/profilIcons/newProfileIcons/dailyReminder.png';

  // —— Onboarding goal icons ——
  static const goalCareer =
      'assets/images/onboarding/whyDoYouWantToLearn/careerDevelopment.png';
  static const goalTravel =
      'assets/images/onboarding/whyDoYouWantToLearn/travel.png';
  static const goalEducation =
      'assets/images/onboarding/whyDoYouWantToLearn/education.png';
  static const goalLivingAbroad =
      'assets/images/onboarding/whyDoYouWantToLearn/abroad.png';
  static const goalPersonalDevelopment =
      'assets/images/onboarding/whyDoYouWantToLearn/personalDevelopment.png';
  static const paceMonth1 =
      'assets/images/onboarding/significant_progress/amonth.png';
  static const paceMonth2_3 =
      'assets/images/onboarding/significant_progress/twoOrThreeMonth.png';
  static const paceMonth6 =
      'assets/images/onboarding/significant_progress/sixMonth.png';
  static const paceYear1 =
      'assets/images/onboarding/significant_progress/ayear.png';
  static const paceRelaxed =
      'assets/images/onboarding/significant_progress/easy.png';
  static const levelA1 = 'assets/images/onboarding/levels/a1.png';
  static const levelA2 = 'assets/images/onboarding/levels/a2level.png';
  static const levelB1 = 'assets/images/onboarding/levels/b1level.png';
  static const levelB2 = 'assets/images/onboarding/levels/b2level.png';
  static const levelC1 = 'assets/images/onboarding/levels/c1.png';
  static const levelC2 = 'assets/images/onboarding/levels/c2.png';
  static const levelIconWidth = 32.0;
  static const levelIconHeight = 22.0;
  // Legacy SVG paths (profile / older screens)
  static const goalCareerSvg = 'assets/images/onboardingGoals/career.svg';
  static const goalTravelSvg = 'assets/images/onboardingGoals/plane.svg';
  static const goalLivingAbroadSvg =
      'assets/images/onboardingGoals/livingabroad.svg';
  static const goalStudyingAbroadSvg =
      'assets/images/onboardingGoals/studyingAbroad.svg';
  static const goalOtherSvg = 'assets/images/onboardingGoals/other.svg';
  static const interestTravel =
      'assets/images/profilIcons/interests/travel.png';
  static const interestShopping =
      'assets/images/profilIcons/interests/shopping.png';
  static const interestFood = 'assets/images/profilIcons/interests/food.png';
  static const interestPopCulture =
      'assets/images/profilIcons/interests/popCulture.png';
  static const interestFilm = 'assets/images/profilIcons/interests/film.png';
  static const interestMusic = 'assets/images/profilIcons/interests/music.png';
  static const interestSport = 'assets/images/interests/sport.png';
  static const interestTechnology = 'assets/images/interests/technology.png';
  static const interestScience = 'assets/images/interests/science.png';
  static const interestHealth = 'assets/images/interests/health.png';
  static const interestFashion = 'assets/images/interests/fashion.png';
  static const interestArt = 'assets/images/interests/art.png';
  static const interestLiterature = 'assets/images/interests/literature.png';
  static const interestHistory = 'assets/images/interests/history.png';
  static const interestCulture = 'assets/images/interests/culture.png';
  static const interestAstronomy = 'assets/images/interests/astronomy.png';
  static const interestPet = 'assets/images/interests/pet.png';
  static const interestSocialMedia = 'assets/images/interests/socailMedia.png';
  static const interestEntrepreneur =
      'assets/images/interests/entrepreneur.png';
  static const logoutWarning =
      'assets/images/profilIcons/logoutWarning.png';

  // —— Certificate ——
  static const flyworkLogo = 'assets/images/certificate/flywork_logo.png';
  static const certificateDownload = 'assets/images/certificate/download.svg';
  static const certificateA1Starter = 'assets/images/certificate/a1_starter.png';
  static const certificateA2Basic = 'assets/images/certificate/a2_basic.png';
  static const certificateB1Intermediate =
      'assets/images/certificate/b1_intermediate.png';
  static const certificateB2UpperIntermediate =
      'assets/images/certificate/b2_upper_intermediate.png';
  static const certificateC1Advanced =
      'assets/images/certificate/c1_advanced.png';
  static const certificateC2Expert = 'assets/images/certificate/c2_expert.png';
  /// Boş sertifika durumu — Figma 129×129.
  static const certificatesEmpty =
      'assets/images/certificate/no_certificate.png';
  static const profileNotification =
      'assets/images/home/notification_icon.svg';
  static const notificationTrash = deleteIcon;
  static const notificationsEmptyBell =
      'assets/images/notifications/empty_bell.png';
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
  static const homeArrowDown = 'assets/images/home/arrow_down.svg';
  static const pathScrollArrow = 'assets/images/home/path_scroll_arrow.svg';

  // —— Role Play ——
  static const rolePlayCoffee = 'assets/images/roleplay/orderingcoffe.png';
  static const rolePlayDirections =
      'assets/images/roleplay/askingdirection.png';
  static const rolePlayInterview = 'assets/images/roleplay/jobinterview.png';
  static const rolePlayMissedTrain = 'assets/images/roleplay/missedtrain.png';
  static const rolePlayFlightAttendant =
      'assets/images/roleplay/flightattendant.png';
  static const rolePlayTrainTicket = 'assets/images/roleplay/trainticket.png';
  static const rolePlayRestaurantReservation =
      'assets/images/roleplay/restaurantreservation.png';
  static const rolePlayDoctorAppointment =
      'assets/images/roleplay/doctorappointment.png';
  static const rolePlayShoppingClothes =
      'assets/images/roleplay/shoppingclothes.png';
  static const rolePlayTakingTaxi = 'assets/images/roleplay/takingtaxi.png';
  static const rolePlayRentingApartment =
      'assets/images/roleplay/rentingapartment.png';
  static const rolePlayBirthdayParty =
      'assets/images/roleplay/birthdayparty.png';
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
  /// Figma: mesaj balonu yanı — çeviri / hoparlör (calling + tutor sohbet).
  static const callingChatTranslate =
      'assets/images/callinScreen/chat_translate.png';
  static const callingChatSpeaker =
      'assets/images/callinScreen/chat_speaker.png';
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
  static const tutorMorganRiv = 'assets/riv/morgan.riv';
}
