import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/app_env.dart';
import '../constants/app_text.dart';
import 'app_user.dart';
import 'session_store.dart';

class ApiException implements Exception {
  ApiException(this.message, {this.statusCode, this.debugDetail, this.code});

  final String message;
  final int? statusCode;

  /// Developer-only context (base URL, Dio error). Never shown to the user.
  final String? debugDetail;

  /// Stable backend error code for localization.
  final String? code;

  @override
  String toString() => message;
}

abstract final class ApiClient {
  static Dio? _dio;
  static String? _boundBaseUrl;
  static Future<bool>? _refreshInFlight;

  static Dio get dio {
    final base = AppEnv.apiBaseUrl.replaceAll(RegExp(r'/+$'), '');
    final existing = _dio;
    if (existing != null && _boundBaseUrl == base) return existing;

    final client = Dio(
      BaseOptions(
        baseUrl: base,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio = client;
    _boundBaseUrl = base;
    return client;
  }

  static Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    bool auth = false,
    bool allowRefresh = true,
  }) async {
    return _request(
      'POST',
      path,
      body: body,
      auth: auth,
      allowRefresh: allowRefresh,
    );
  }

  static Future<Map<String, dynamic>> get(
    String path, {
    bool auth = false,
    bool allowRefresh = true,
  }) async {
    return _request('GET', path, auth: auth, allowRefresh: allowRefresh);
  }

  static Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? body,
    bool auth = false,
    bool allowRefresh = true,
  }) async {
    return _request(
      'PATCH',
      path,
      body: body,
      auth: auth,
      allowRefresh: allowRefresh,
    );
  }

  static Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? body,
    bool auth = false,
    bool allowRefresh = true,
  }) async {
    return _request(
      'DELETE',
      path,
      body: body,
      auth: auth,
      allowRefresh: allowRefresh,
    );
  }

  static Future<Map<String, dynamic>> _request(
    String method,
    String path, {
    Map<String, dynamic>? body,
    bool auth = false,
    bool allowRefresh = true,
  }) async {
    final headers = <String, dynamic>{};

    if (auth) {
      final token = await SessionStore.getToken();
      if (token == null || token.isEmpty) {
        throw ApiException('Not signed in', statusCode: 401);
      }
      headers['Authorization'] = 'Bearer $token';
    }

    final base = AppEnv.apiBaseUrl;
    try {
      final response = await dio.request<dynamic>(
        path,
        data: body,
        options: Options(method: method, headers: headers),
      );

      return _asJson(response.data, response.statusCode);
    } on DioException catch (err) {
      final status = err.response?.statusCode;
      final data = err.response?.data;

      if (auth &&
          allowRefresh &&
          status == 401 &&
          path != '/auth/refresh') {
        final refreshed = await _refreshOnce();
        if (refreshed) {
          return _request(
            method,
            path,
            body: body,
            auth: auth,
            allowRefresh: false,
          );
        }
      }

      if (data is Map<String, dynamic>) {
        throw ApiException(
          data['error'] as String? ?? err.message ?? 'Request failed',
          statusCode: status,
          code: data['code'] as String?,
        );
      }
      final isOffline = err.type == DioExceptionType.connectionError ||
          err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.sendTimeout;

      final detail = 'base=$base type=${err.type} status=$status '
          'message=${err.message}';
      if (kDebugMode) debugPrint('[api] $detail');

      throw ApiException(
        isOffline
            ? AppText.current.common.connectionError
            : AppText.current.common.genericError,
        statusCode: status,
        debugDetail: detail,
      );
    }
  }

  static Future<bool> _refreshOnce() {
    final existing = _refreshInFlight;
    if (existing != null) return existing;
    final future = _doRefresh().whenComplete(() => _refreshInFlight = null);
    _refreshInFlight = future;
    return future;
  }

  static Future<bool> _doRefresh() async {
    final token = await SessionStore.getToken();
    if (token == null || token.isEmpty) return false;
    try {
      final response = await dio.post<dynamic>(
        '/auth/refresh',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final json = _asJson(response.data, response.statusCode);
      final newToken = json['token'] as String?;
      final userJson = json['user'];
      if (newToken == null || userJson is! Map<String, dynamic>) return false;
      final expiresRaw = json['expiresAt'] ?? json['expires_at'];
      DateTime? expiresAt;
      if (expiresRaw is String) {
        expiresAt = DateTime.tryParse(expiresRaw)?.toUtc();
      }
      await SessionStore.saveSession(
        token: newToken,
        user: AppUser.fromJson(userJson),
        expiresAt: expiresAt,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  static Map<String, dynamic> _asJson(dynamic data, int? statusCode) {
    final json = data is Map<String, dynamic>
        ? data
        : <String, dynamic>{'data': data};

    final status = statusCode ?? 0;
    if (status < 200 || status >= 300) {
      throw ApiException(
        json['error'] as String? ?? 'Request failed',
        statusCode: status,
        code: json['code'] as String?,
      );
    }
    return json;
  }
}
