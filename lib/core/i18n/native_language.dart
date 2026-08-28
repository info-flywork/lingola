import '../auth/session_store.dart';

/// Anadil / içerik çevirisi hedef dili (backend `resolveContentNativeLang` ile uyumlu).
abstract final class NativeLanguageResolver {
  static String normalize(String? code, {String fallback = 'tr'}) {
    if (code == null || code.trim().isEmpty) return fallback;
    var normalized = code.trim().toLowerCase().split(RegExp(r'[-_]')).first;
    if (normalized == 'jp') normalized = 'ja';
    return normalized.isEmpty ? fallback : normalized;
  }

  /// Oturum kullanıcısından çöz; yoksa [fallbackCode] veya `tr`.
  static String resolve({String? fallbackCode}) {
    final user = SessionStore.currentUser;
    final app = normalize(user?.appLocale, fallback: 'en');
    final native = normalize(
      user?.onboarding?.nativeLanguageCode,
      fallback: normalize(fallbackCode, fallback: 'tr'),
    );
    if (app.isNotEmpty && app != 'en') return app;
    return native;
  }
}
