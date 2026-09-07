import '../../i18n/strings.g.dart';
import 'role_play_catalog.dart';

/// rolePlayPage altındaki senaryo bloğu (title / screenplay / chat).
dynamic rolePlayScenarioBlock(dynamic page, String titleKey) {
  return switch (titleKey) {
    'coffee' => page.coffee,
    'coffeeQueue' => page.coffeeQueue,
    'coffeeRecommendation' => page.coffeeRecommendation,
    'coffeeWrongOrder' => page.coffeeWrongOrder,
    'shoppingClothes' => page.shoppingClothes,
    'shoppingFittingRoom' => page.shoppingFittingRoom,
    'shoppingReturn' => page.shoppingReturn,
    'shoppingDiscount' => page.shoppingDiscount,
    'flirtingMeet' => page.flirtingMeet,
    'flirtingCompliment' => page.flirtingCompliment,
    'flirtingAskOut' => page.flirtingAskOut,
    'flirtingAwkward' => page.flirtingAwkward,
    'directions' => page.directions,
    'directionsLost' => page.directionsLost,
    'directionsTransit' => page.directionsTransit,
    'directionsWrongWay' => page.directionsWrongWay,
    'takingTaxi' => page.takingTaxi,
    'taxiFare' => page.taxiFare,
    'taxiTraffic' => page.taxiTraffic,
    'taxiComplaint' => page.taxiComplaint,
    'missedTrain' => page.missedTrain,
    'missedTrainNext' => page.missedTrainNext,
    'missedTrainTicket' => page.missedTrainTicket,
    'missedTrainRefund' => page.missedTrainRefund,
    'freeTalkHobby' => page.freeTalkHobby,
    'freeTalkWeekend' => page.freeTalkWeekend,
    'freeTalkMovies' => page.freeTalkMovies,
    'freeTalkDisagree' => page.freeTalkDisagree,
    'interview' => page.interview,
    'interviewStrengths' => page.interviewStrengths,
    'interviewExperience' => page.interviewExperience,
    'interviewSalary' => page.interviewSalary,
    'doctorAppointment' => page.doctorAppointment,
    'doctorSymptoms' => page.doctorSymptoms,
    'doctorPrescription' => page.doctorPrescription,
    'doctorFollowUp' => page.doctorFollowUp,
    'birthdayParty' => page.birthdayParty,
    'birthdayInvite' => page.birthdayInvite,
    'birthdayGifts' => page.birthdayGifts,
    'birthdaySurprise' => page.birthdaySurprise,
    'rentingApartment' => page.rentingApartment,
    'rentingApartmentTour' => page.rentingApartmentTour,
    'rentingApartmentAgent' => page.rentingApartmentAgent,
    'rentingApartmentNegotiate' => page.rentingApartmentNegotiate,
    'restaurantReservation' => page.restaurantReservation,
    'restaurantChange' => page.restaurantChange,
    'restaurantAllergy' => page.restaurantAllergy,
    'restaurantComplaint' => page.restaurantComplaint,
    'flightAttendant' => page.flightAttendant,
    'flightSeat' => page.flightSeat,
    'flightSpecialMeal' => page.flightSpecialMeal,
    'flightDelay' => page.flightDelay,
    'trainTicket' => page.trainTicket,
    'trainTicketChange' => page.trainTicketChange,
    'trainTicketPlatform' => page.trainTicketPlatform,
    'trainTicketUpgrade' => page.trainTicketUpgrade,
    _ => null,
  };
}

String? rolePlayTitleForKey(dynamic page, String titleKey) {
  final block = rolePlayScenarioBlock(page, titleKey);
  return block?.title as String?;
}

String? rolePlayScreenplayForKey(dynamic page, String titleKey) {
  final block = rolePlayScenarioBlock(page, titleKey);
  return block?.screenplay as String?;
}

({String titleEn, String openingEn, String badge}) rolePlayEnglishContent({
  required String scenarioId,
  String? title,
  String? openingMessage,
}) {
  final page = AppLocale.en.buildSync().rolePlayPage;
  final titleKey = rolePlayTitleKeyForScenarioId(scenarioId);
  final block = rolePlayScenarioBlock(page, titleKey);
  if (block != null) {
    final t = block.title as String;
    final opening = block.chat.briefing as String;
    return (titleEn: t, openingEn: opening, badge: t);
  }
  return (
    titleEn: title?.trim().isNotEmpty == true ? title!.trim() : 'Role Play',
    openingEn: openingMessage?.trim().isNotEmpty == true
        ? openingMessage!.trim()
        : 'Hi! Ready to practice this scene together?',
    badge: title?.trim().isNotEmpty == true ? title!.trim() : 'Role Play',
  );
}
