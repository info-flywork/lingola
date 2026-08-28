import '../auth/api_client.dart';
import '../constants/app_text.dart';

/// Maps backend [ApiException.code] values to localized user-facing text.
abstract final class ApiErrorLocalizer {
  static String message(Object? error) {
    if (error is ApiException) {
      final code = error.code?.trim();
      if (code != null && code.isNotEmpty) {
        final localized = _fromCode(code);
        if (localized != null) return localized;
      }
    }
    return AppText.current.common.genericError;
  }

  static String? _fromCode(String code) {
    final errors = AppText.current.apiErrors;
    switch (code) {
      case 'UNAUTHORIZED':
        return errors.unauthorized;
      case 'NOT_FOUND':
        return errors.notFound;
      case 'NAME_REQUIRED':
        return errors.nameRequired;
      case 'IMAGE_REQUIRED':
        return errors.imageRequired;
      case 'AVATAR_INVALID_TYPE':
        return errors.avatarInvalidType;
      case 'AVATAR_EMPTY':
        return errors.avatarEmpty;
      case 'AVATAR_TOO_LARGE':
        return errors.avatarTooLarge;
      case 'NOTIFICATIONS_REQUIRED':
        return errors.notificationsRequired;
      case 'PREMIUM_REQUIRED':
        return errors.premiumRequired;
      case 'LEVEL_REQUIRED':
        return errors.levelRequired;
      case 'VALIDATION_FAILED':
        return errors.validationFailed;
      case 'INTERNAL_ERROR':
        return errors.internalError;
      default:
        return null;
    }
  }
}
