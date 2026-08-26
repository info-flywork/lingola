import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/auth/api_client.dart';
import '../../../core/config/app_env.dart';
import 'viseme_cue.dart';

/// Tutor TTS — backend üzerinden ElevenLabs / OpenAI proxy.
class TutorTtsService {
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
    final audioPath = await _cachePath(key);
    final visemePath = await _visemeCachePath(key);
    final audioFile = File(audioPath);
    final visemeFile = File(visemePath);

    if (audioFile.existsSync() &&
        await audioFile.length() > 0 &&
        visemeFile.existsSync()) {
      try {
        final raw = jsonDecode(await visemeFile.readAsString());
        if (raw is List && raw.isNotEmpty) {
          final cues = raw
              .whereType<Map>()
              .map(_parseVisemeCue)
              .toList(growable: false);
          if (cues.isNotEmpty) {
            return TutorSpeechAudio(file: audioFile, visemes: cues);
          }
        }
      } catch (_) {}
      // Boş/bozuk viseme cache — yeniden üret.
      try {
        await visemeFile.delete();
      } catch (_) {}
    }

    final json = await ApiClient.post(
      '/ai/tts/lipsync',
      body: {
        'text': text.trim(),
        'voiceId': _resolveVoiceId(voiceId),
        'modelId': modelId,
      },
    );

    final b64 = json['audioBase64'] as String?;
    if (b64 == null || b64.isEmpty) {
      throw StateError('TTS audio missing');
    }

    final bytes = base64Decode(b64);
    await audioFile.writeAsBytes(bytes, flush: true);

    final visemeRaw = json['visemes'];
    var cues = const <VisemeCue>[];
    if (visemeRaw is List) {
      cues = visemeRaw
          .whereType<Map>()
          .map(_parseVisemeCue)
          .toList(growable: false);
    }
    if (cues.isEmpty) {
      cues = heuristicVisemesFromText(text.trim());
    }

    // Boş track cache'leme — bir sonraki sefer heuristic/API denensin.
    if (cues.isNotEmpty) {
      await visemeFile.writeAsString(
        jsonEncode([
          for (final c in cues)
            {'s': c.startSec, 'e': c.endSec, 'v': c.visemeNum},
        ]),
        flush: true,
      );
    }

    return TutorSpeechAudio(file: audioFile, visemes: cues);
  }

  String _resolveVoiceId(String? voiceId) {
    if (voiceId != null && voiceId.trim().isNotEmpty) return voiceId.trim();
    return TutorVoiceIds.female;
  }

  double _normalizeVisemeNum(num raw) {
    final v = raw.toDouble();
    if ({0.0, 2.0, 6.0, 10.0, 14.0}.contains(v)) return v;
    const legacy = <int, double>{
      1: 6,
      2: 10,
      3: 14,
      4: 14,
      5: 14,
      6: 2,
      7: 10,
      8: 6,
      9: 6,
      10: 10,
    };
    return legacy[v.round()] ?? 6;
  }

  VisemeCue _parseVisemeCue(Map<dynamic, dynamic> m) {
    return VisemeCue(
      startSec: (m['s'] as num).toDouble(),
      endSec: (m['e'] as num).toDouble(),
      visemeNum: _normalizeVisemeNum(m['v'] as num),
    );
  }

  String _cacheKey(String text, {String? voiceId, required String modelId}) {
    final voice = _resolveVoiceId(voiceId);
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

  void dispose() {}
}
