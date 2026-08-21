abstract final class OnboardingPreviewChatStore {
  static String? _sessionId;

  static String? get sessionId => _sessionId;

  static void setSession(String sessionId) {
    final value = sessionId.trim();
    _sessionId = value.isEmpty ? null : value;
  }

  static void clear() {
    _sessionId = null;
  }
}
