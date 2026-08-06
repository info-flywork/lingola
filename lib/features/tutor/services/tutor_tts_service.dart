import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/config/app_env.dart';

/// ElevenLabs TTS — voice [voiceId] veya [AppEnv.elevenLabsVoiceId].
/// Key yoksa OpenAI TTS fallback (demo için).
class TutorTtsService {
  TutorTtsService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 60),
                sendTimeout: const Duration(seconds: 60),
                responseType: ResponseType.bytes,
              ),
            );

  final Dio _dio;

  /// In-flight requests keyed by cache id, so a prefetch and a tap on the same
  /// text share one network call.
  static final _pending = <String, Future<File>>{};

  /// Low-latency model, good enough for short prompts like single words.
  static const flashModel = 'eleven_flash_v2_5';

  Future<File> synthesizeToFile(
    String text, {
    String? voiceId,
    String modelId = 'eleven_multilingual_v2',
  }) async {
    final key = _cacheKey(text, voiceId: voiceId, modelId: modelId);
    final cached = await _cachedFile(key);
    if (cached != null) return cached;

    final inFlight = _pending[key];
    if (inFlight != null) return inFlight;

    final future = _synthesize(text, voiceId: voiceId, modelId: modelId, key: key);
    _pending[key] = future;
    try {
      return await future;
    } finally {
      _pending.remove(key);
    }
  }

  /// Warms the cache without playing anything. Failures are ignored on purpose:
  /// the real request on tap will surface the error.
  Future<void> prefetch(
    String text, {
    String? voiceId,
    String modelId = 'eleven_multilingual_v2',
  }) async {
    try {
      await synthesizeToFile(text, voiceId: voiceId, modelId: modelId);
    } catch (_) {}
  }

  Future<File> _synthesize(
    String text, {
    required String key,
    String? voiceId,
    required String modelId,
  }) async {
    final bytes = AppEnv.hasElevenLabs
        ? await _elevenLabs(text, voiceId: voiceId, modelId: modelId)
        : await _openAiTts(text);

    final file = File(await _cachePath(key));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  String _cacheKey(String text, {String? voiceId, required String modelId}) {
    final voice = (voiceId?.trim().isNotEmpty ?? false)
        ? voiceId!.trim()
        : AppEnv.elevenLabsVoiceId;
    final raw = '$voice|$modelId|${text.trim()}';
    return sha1.convert(utf8.encode(raw)).toString();
  }

  Future<String> _cachePath(String key) async {
    final dir = Directory('${(await getTemporaryDirectory()).path}/lingola_tts');
    if (!dir.existsSync()) await dir.create(recursive: true);
    return '${dir.path}/$key.mp3';
  }

  Future<File?> _cachedFile(String key) async {
    final file = File(await _cachePath(key));
    if (file.existsSync() && await file.length() > 0) return file;
    return null;
  }

  Future<Uint8List> _elevenLabs(
    String text, {
    String? voiceId,
    String modelId = 'eleven_multilingual_v2',
  }) async {
    final id = (voiceId != null && voiceId.trim().isNotEmpty)
        ? voiceId.trim()
        : AppEnv.elevenLabsVoiceId;
    try {
      final res = await _dio.post<List<int>>(
        'https://api.elevenlabs.io/v1/text-to-speech/$id'
        '?output_format=mp3_44100_128',
        data: {
          'text': text,
          'model_id': modelId,
          'voice_settings': {
            'stability': 0.45,
            'similarity_boost': 0.8,
          },
        },
        options: Options(
          headers: {
            'xi-api-key': AppEnv.elevenLabsApiKey,
            'Content-Type': 'application/json',
            'Accept': 'audio/mpeg',
          },
          responseType: ResponseType.bytes,
        ),
      );
      return Uint8List.fromList(res.data ?? const []);
    } on DioException catch (err) {
      throw StateError(
        'ElevenLabs ${err.response?.statusCode}: ${err.response?.data ?? err.message}',
      );
    }
  }

  Future<Uint8List> _openAiTts(String text) async {
    if (!AppEnv.hasOpenAi) {
      throw StateError(
        'TTS için OPENAI_API_KEY veya ELEVENLABS_API_KEY gerekli',
      );
    }
    try {
      final res = await _dio.post<List<int>>(
        'https://api.openai.com/v1/audio/speech',
        data: {
          'model': 'tts-1',
          'voice': 'nova',
          'input': text,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppEnv.openAiApiKey}',
            'Content-Type': 'application/json',
          },
          responseType: ResponseType.bytes,
        ),
      );
      return Uint8List.fromList(res.data ?? const []);
    } on DioException catch (err) {
      throw StateError(
        'OpenAI TTS ${err.response?.statusCode}: ${err.response?.data ?? err.message}',
      );
    }
  }

  void dispose() => _dio.close(force: true);
}
