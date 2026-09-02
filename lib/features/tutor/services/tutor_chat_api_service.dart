import '../../../core/auth/api_client.dart';

class TutorChatSessionDto {
  const TutorChatSessionDto({
    required this.id,
    required this.tutorId,
    this.title,
    this.lastMessageAt,
    this.createdAt,
    this.preview = '',
    this.tutor,
  });

  final String id;
  final String tutorId;
  final String? title;
  final String? lastMessageAt;
  final String? createdAt;
  final String preview;
  final TutorChatTutorDto? tutor;

  factory TutorChatSessionDto.fromJson(Map<String, dynamic> json) {
    return TutorChatSessionDto(
      id: json['id'] as String? ?? '',
      tutorId: json['tutorId'] as String? ?? '',
      title: json['title'] as String?,
      lastMessageAt: json['lastMessageAt']?.toString(),
      createdAt: json['createdAt']?.toString(),
      preview: json['preview'] as String? ?? '',
      tutor: json['tutor'] is Map<String, dynamic>
          ? TutorChatTutorDto.fromJson(json['tutor'] as Map<String, dynamic>)
          : null,
    );
  }
}

class TutorChatOpenSessionResult {
  const TutorChatOpenSessionResult({
    required this.session,
    required this.created,
  });

  final TutorChatSessionDto session;
  final bool created;
}

class TutorChatTutorDto {
  const TutorChatTutorDto({
    required this.id,
    required this.slug,
    required this.nameKey,
    this.voiceId,
    this.imageCdnUrl,
    this.localImagePath,
  });

  final String id;
  final String slug;
  final String nameKey;
  final String? voiceId;
  final String? imageCdnUrl;
  final String? localImagePath;

  factory TutorChatTutorDto.fromJson(Map<String, dynamic> json) {
    return TutorChatTutorDto(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      nameKey: json['nameKey'] as String? ?? '',
      voiceId: json['voiceId'] as String?,
      imageCdnUrl: json['imageCdnUrl'] as String?,
      localImagePath: json['localImagePath'] as String?,
    );
  }

  String? get imagePath {
    if (imageCdnUrl != null && imageCdnUrl!.isNotEmpty) return imageCdnUrl;
    return localImagePath;
  }
}

class TutorChatMessageDto {
  const TutorChatMessageDto({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    this.createdAt,
  });

  final String id;
  final String sessionId;
  final String role;
  final String content;
  final String? createdAt;

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';

  factory TutorChatMessageDto.fromJson(Map<String, dynamic> json) {
    return TutorChatMessageDto(
      id: json['id'] as String? ?? '',
      sessionId: json['sessionId'] as String? ?? '',
      role: json['role'] as String? ?? 'assistant',
      content: json['content'] as String? ?? '',
      createdAt: json['createdAt']?.toString(),
    );
  }
}

abstract final class TutorChatApiService {
  static Future<({
    TutorChatSessionDto session,
    List<TutorChatMessageDto> messages,
    String? tutorVoiceId,
  })> openPreviewSession({
    String? tutorId,
    String? tutorSlug,
    String? title,
    String? openingMessage,
    String? kind,
    String? nativeLanguageCode,
    String? targetLanguageCode,
    String? explanationLanguage,
  }) async {
    final data = await ApiClient.post(
      '/chat/preview/sessions',
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (tutorSlug != null && tutorSlug.isNotEmpty) 'tutorSlug': tutorSlug,
        if (title != null && title.isNotEmpty) 'title': title,
        if (openingMessage != null && openingMessage.isNotEmpty)
          'openingMessage': openingMessage,
        if (kind != null && kind.isNotEmpty) 'kind': kind,
        if (nativeLanguageCode != null && nativeLanguageCode.isNotEmpty)
          'nativeLanguageCode': nativeLanguageCode,
        if (targetLanguageCode != null && targetLanguageCode.isNotEmpty)
          'targetLanguageCode': targetLanguageCode,
        if (explanationLanguage != null && explanationLanguage.isNotEmpty)
          'explanationLanguage': explanationLanguage,
      },
    );
    if (data.isEmpty) {
      throw ApiException('Invalid preview session response');
    }
    final session = data['session'];
    if (session is! Map<String, dynamic>) {
      throw ApiException('Invalid preview session payload');
    }
    final rawMessages = data['messages'];
    final messages = rawMessages is List
        ? rawMessages
            .whereType<Map<String, dynamic>>()
            .map(TutorChatMessageDto.fromJson)
            .toList(growable: false)
        : const <TutorChatMessageDto>[];
    final tutor = data['tutor'];
    final tutorVoiceId = tutor is Map<String, dynamic>
        ? tutor['voiceId'] as String?
        : null;
    return (
      session: TutorChatSessionDto.fromJson(session),
      messages: messages,
      tutorVoiceId: tutorVoiceId,
    );
  }

  static Future<({
    TutorChatMessageDto userMessage,
    TutorChatMessageDto assistantMessage,
  })> sendPreviewMessage({
    required String sessionId,
    required String content,
  }) async {
    final data = await ApiClient.post(
      '/chat/preview/sessions/$sessionId/messages',
      body: {'content': content},
    );
    if (data.isEmpty) {
      throw ApiException('Invalid preview message response');
    }
    final user = data['userMessage'];
    final assistant = data['assistantMessage'];
    if (user is! Map<String, dynamic> || assistant is! Map<String, dynamic>) {
      throw ApiException('Invalid preview message payload');
    }
    return (
      userMessage: TutorChatMessageDto.fromJson(user),
      assistantMessage: TutorChatMessageDto.fromJson(assistant),
    );
  }

  static Future<void> claimPreviewSession(String sessionId) async {
    await ApiClient.post('/chat/preview/sessions/$sessionId/claim', auth: true);
  }

  static Future<TutorChatOpenSessionResult> openSession({
    String? tutorId,
    String? tutorSlug,
    bool forceNew = false,
    String? title,
    String? openingMessage,
    String? lessonSlug,
    String? kind,
  }) async {
    final json = await ApiClient.post(
      '/chat/sessions',
      auth: true,
      body: {
        if (tutorId != null && tutorId.isNotEmpty) 'tutorId': tutorId,
        if (tutorSlug != null && tutorSlug.isNotEmpty) 'tutorSlug': tutorSlug,
        if (forceNew) 'forceNew': true,
        if (title != null && title.isNotEmpty) 'title': title,
        if (openingMessage != null && openingMessage.isNotEmpty)
          'openingMessage': openingMessage,
        if (lessonSlug != null && lessonSlug.isNotEmpty) 'lessonSlug': lessonSlug,
        if (kind != null && kind.isNotEmpty) 'kind': kind,
      },
    );
    final session = json['session'];
    if (session is! Map<String, dynamic>) {
      throw ApiException('Invalid chat session response');
    }
    return TutorChatOpenSessionResult(
      session: TutorChatSessionDto.fromJson(session),
      created: json['created'] == true,
    );
  }

  static Future<List<TutorChatSessionDto>> listSessions({int limit = 30}) async {
    final json = await ApiClient.get(
      '/chat/sessions?limit=$limit',
      auth: true,
    );
    final list = json['sessions'];
    if (list is! List) return const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(TutorChatSessionDto.fromJson)
        .toList();
  }

  static Future<List<TutorChatMessageDto>> listMessages(String sessionId) async {
    final json = await ApiClient.get(
      '/chat/sessions/$sessionId/messages',
      auth: true,
    );
    final list = json['messages'];
    if (list is! List) return const [];
    return list
        .whereType<Map<String, dynamic>>()
        .map(TutorChatMessageDto.fromJson)
        .toList();
  }

  static Future<({
    TutorChatMessageDto userMessage,
    TutorChatMessageDto assistantMessage,
  })> sendMessage({
    required String sessionId,
    required String content,
  }) async {
    final json = await ApiClient.post(
      '/chat/sessions/$sessionId/messages',
      auth: true,
      body: {'content': content},
    );
    final user = json['userMessage'];
    final assistant = json['assistantMessage'];
    if (user is! Map<String, dynamic> || assistant is! Map<String, dynamic>) {
      throw ApiException('Invalid chat message response');
    }
    return (
      userMessage: TutorChatMessageDto.fromJson(user),
      assistantMessage: TutorChatMessageDto.fromJson(assistant),
    );
  }

  static Future<void> deleteSession(String sessionId) async {
    await ApiClient.delete('/chat/sessions/$sessionId', auth: true);
  }
}
