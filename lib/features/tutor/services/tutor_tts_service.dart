import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/config/app_env.dart';
import 'viseme_cue.dart';

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

  static final _pendingLipsync = <String, Future<TutorSpeechAudio>>{};

  /// Low-latency model, good enough for short prompts like single words.
  static const flashModel = 'eleven_flash_v2_5';

  Future<File> synthesizeToFile(
    String text, {
    String? voiceId,
    String modelId = 'eleven_multilingual_v2',
  }) async {
    final result = await synthesizeForLipsync(
      text,
      voiceId: voiceId,
      modelId: modelId,
    );
    return result.file;
  }

  /// Ses + character-level alignment → viseme timeline (lipsync).
  Future<TutorSpeechAudio> synthesizeForLipsync(
    String text, {
    String? voiceId,
    String modelId = 'eleven_multilingual_v2',
  }) async {
    final key = _cacheKey(text, voiceId: voiceId, modelId: modelId);
    final inFlight = _pendingLipsync[key];
    if (inFlight != null) return inFlight;

    final future = _synthesizeLipsync(
      text,
      voiceId: voiceId,
      modelId: modelId,
      key: key,
    );
    _pendingLipsync[key] = future;
    try {
      return await future;
    } finally {
      _pendingLipsync.remove(key);
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

  Future<TutorSpeechAudio> _synthesizeLipsync(
    String text, {
    required String key,
    String? voiceId,
    required String modelId,
  }) async {
    if (AppEnv.hasElevenLabs) {
      try {
        return await _elevenLabsWithTimestamps(
          text,
          voiceId: voiceId,
          modelId: modelId,
          key: key,
        );
      } catch (_) {
        // Fallback: düz ses, lipsync yok → avatar yavaş fake cycle kullanır.
      }
    }

    final bytes = await _synthesizeBytes(
      text,
      voiceId: voiceId,
      modelId: modelId,
    );
    final file = File(await _cachePath(key));
    await file.writeAsBytes(bytes, flush: true);
    return TutorSpeechAudio(file: file);
  }

  Future<Uint8List> _synthesizeBytes(
    String text, {
    String? voiceId,
    required String modelId,
  }) async {
    if (AppEnv.hasElevenLabs) {
      try {
        return await _elevenLabs(text, voiceId: voiceId, modelId: modelId);
      } catch (err) {
        if (AppEnv.hasOpenAi) {
          return _openAiTts(text);
        }
        rethrow;
      }
    }
    return _openAiTts(text);
  }

  String _cacheKey(String text, {String? voiceId, required String modelId}) {
    final voice = (voiceId?.trim().isNotEmpty ?? false)
        ? voiceId!.trim()
        : AppEnv.elevenLabsVoiceId;
    final raw = 'lipsync|$voice|$modelId|${text.trim()}';
    return sha1.convert(utf8.encode(raw)).toString();
  }

  Future<String> _cachePath(String key) async {
    final dir = Directory('${(await getTemporaryDirectory()).path}/lingola_tts');
    if (!dir.existsSync()) await dir.create(recursive: true);
    return '${dir.path}/$key.mp3';
  }

  Future<String> _visemeCachePath(String key) async {
    final dir = Directory('${(await getTemporaryDirectory()).path}/lingola_tts');
    if (!dir.existsSync()) await dir.create(recursive: true);
    return '${dir.path}/$key.visemes.json';
  }

  static String _dioErrorBody(Object? data) {
    if (data == null) return '';
    if (data is String) return data;
    if (data is List<int>) {
      try {
        return utf8.decode(data, allowMalformed: true);
      } catch (_) {
        return data.toString();
      }
    }
    return data.toString();
  }

  Future<TutorSpeechAudio> _elevenLabsWithTimestamps(
    String text, {
    required String key,
    String? voiceId,
    required String modelId,
  }) async {
    final id = (voiceId != null && voiceId.trim().isNotEmpty)
        ? voiceId.trim()
        : AppEnv.elevenLabsVoiceId;

    final audioPath = await _cachePath(key);
    final visemePath = await _visemeCachePath(key);
    final audioFile = File(audioPath);
    final visemeFile = File(visemePath);

    if (audioFile.existsSync() &&
        await audioFile.length() > 0 &&
        visemeFile.existsSync()) {
      try {
        final raw = jsonDecode(await visemeFile.readAsString());
        if (raw is List) {
          final cues = raw
              .whereType<Map>()
              .map(
                (m) => VisemeCue(
                  startSec: (m['s'] as num).toDouble(),
                  endSec: (m['e'] as num).toDouble(),
                  visemeNum: (m['v'] as num).toDouble(),
                ),
              )
              .toList(growable: false);
          return TutorSpeechAudio(file: audioFile, visemes: cues);
        }
      } catch (_) {}
    }

    try {
      final res = await _dio.post<Map<String, dynamic>>(
        'https://api.elevenlabs.io/v1/text-to-speech/$id/with-timestamps',
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
            'Accept': 'application/json',
          },
          responseType: ResponseType.json,
        ),
      );

      final data = res.data;
      if (data == null) throw StateError('ElevenLabs timestamps empty');

      final b64 = data['audio_base64'] as String?;
      if (b64 == null || b64.isEmpty) {
        throw StateError('ElevenLabs audio_base64 missing');
      }
      final bytes = base64Decode(b64);
      await audioFile.writeAsBytes(bytes, flush: true);

      final alignment = (data['normalized_alignment'] ?? data['alignment'])
          as Map<String, dynamic>?;
      var cues = const <VisemeCue>[];
      if (alignment != null) {
        final chars = (alignment['characters'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            const <String>[];
        final starts =
            (alignment['character_start_times_seconds'] as List?)
                    ?.whereType<num>()
                    .toList() ??
                const <num>[];
        final ends = (alignment['character_end_times_seconds'] as List?)
                ?.whereType<num>()
                .toList() ??
            const <num>[];
        cues = visemesFromAlignment(
          characters: chars,
          starts: starts,
          ends: ends,
        );
      }

      await visemeFile.writeAsString(
        jsonEncode([
          for (final c in cues)
            {'s': c.startSec, 'e': c.endSec, 'v': c.visemeNum},
        ]),
        flush: true,
      );

      return TutorSpeechAudio(file: audioFile, visemes: cues);
    } on DioException catch (err) {
      throw StateError(
        'ElevenLabs ${err.response?.statusCode}: '
        '${_dioErrorBody(err.response?.data).isEmpty ? err.message : _dioErrorBody(err.response?.data)}',
      );
    }
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
        'ElevenLabs ${err.response?.statusCode}: '
        '${_dioErrorBody(err.response?.data).isEmpty ? err.message : _dioErrorBody(err.response?.data)}',
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
