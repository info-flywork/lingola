import 'dart:io';

/// Dudaklar sesten hafif önde bitsin (kuyrukta ağız açık kalmasın).
const kVisemeLatencySec = -0.02;

/// Ses zamanına hizalı Rive `visemeNum` değeri.
class VisemeCue {
  const VisemeCue({
    required this.startSec,
    required this.endSec,
    required this.visemeNum,
  });

  final double startSec;
  final double endSec;
  final double visemeNum;
}

class TutorSpeechAudio {
  const TutorSpeechAudio({
    required this.file,
    this.visemes = const [],
  });

  final File file;
  final List<VisemeCue> visemes;
}

/// Harf → Rive viseme id (mevcut riv seti: 0, 2, 6, 10, 14).
double visemeForChar(String raw) {
  if (raw.isEmpty) return 0;
  final c = raw.toLowerCase();
  if (c == ' ' || c == '\n' || c == '\t') return 0;
  if ('.,!?;:\'"-—…'.contains(c)) return 0;

  if ('bmp'.contains(c)) return 2;
  if ('fv'.contains(c)) return 10;
  if ('eéê'.contains(c)) return 10;
  if ('aáàâä'.contains(c)) return 6;
  if ('oóòôöuúùûüw'.contains(c)) return 14;
  if ('iíìîıy'.contains(c)) return 14;
  if ('tdnl'.contains(c)) return 6;
  if ('szcj'.contains(c)) return 10;
  if ('kgqh'.contains(c)) return 6;
  if (c == 'r') return 6;

  return 6;
}

List<VisemeCue> visemesFromAlignment({
  required List<String> characters,
  required List<num> starts,
  required List<num> ends,
}) {
  final n = characters.length;
  if (n == 0 || starts.length != n || ends.length != n) return const [];

  final cues = <VisemeCue>[];
  VisemeCue? pending;

  void flush() {
    final p = pending;
    if (p != null) cues.add(p);
    pending = null;
  }

  for (var i = 0; i < n; i++) {
    final start = starts[i].toDouble();
    final end = ends[i].toDouble();
    if (end <= start) continue;
    final v = visemeForChar(characters[i]);

    final p = pending;
    if (p != null && p.visemeNum == v && start - p.endSec < 0.08) {
      pending = VisemeCue(
        startSec: p.startSec,
        endSec: end,
        visemeNum: v,
      );
    } else {
      flush();
      pending = VisemeCue(startSec: start, endSec: end, visemeNum: v);
    }
  }
  flush();
  return cues;
}

double visemeAt(
  List<VisemeCue> cues,
  double tSec, {
  double? cutOffSec,
  double latencySec = kVisemeLatencySec,
}) {
  final t = (tSec - latencySec).clamp(0.0, double.infinity);
  if (cutOffSec != null && t >= cutOffSec) return 0;
  if (cues.isEmpty) return 0;
  for (final cue in cues) {
    if (t >= cue.startSec && t < cue.endSec) return cue.visemeNum;
  }
  return 0;
}

/// Dudaklar ses bitmeden ~0.35–0.45 sn önce dursun (TTS kuyruk sessizliği).
double effectiveSpeechEndSec({
  required List<VisemeCue> visemes,
  double? audioDurationSec,
}) {
  var lastMouth = 0.0;
  for (final cue in visemes) {
    if (cue.visemeNum != 0) lastMouth = cue.endSec;
  }

  var end = lastMouth;
  if (audioDurationSec != null && audioDurationSec > 0) {
    final lipStop =
        (audioDurationSec - 0.2).clamp(0.0, audioDurationSec).toDouble();
    end = lastMouth > 0 ? (lastMouth < lipStop ? lastMouth : lipStop) : lipStop;
  }
  if (end > 0) {
    // Son heceden kısa süre sonra kapat (çok agresif kesme ağızı hiç oynatmaz).
    end = (end - 0.12).clamp(0.0, end).toDouble();
  }
  return end;
}

/// Bu andan sonra açılacak ağız var mı?
bool hasUpcomingMouth(List<VisemeCue> cues, double tSec) {
  for (final cue in cues) {
    if (cue.visemeNum == 0) continue;
    if (cue.endSec > tSec + 0.04) return true;
  }
  return false;
}

/// Alignment yokken metinden yaklaşık viseme timeline (Rive: 0/2/6/10/14).
List<VisemeCue> heuristicVisemesFromText(
  String text, {
  double? durationSec,
}) {
  final chars = text.replaceAll('\r', '').split('');
  if (chars.isEmpty) return const [];

  final estimated =
      (durationSec != null && durationSec > 0.2)
          ? durationSec
          : (chars.length * 0.055).clamp(0.8, 60.0);
  final step = estimated / chars.length;
  final cues = <VisemeCue>[];
  VisemeCue? pending;

  void flush() {
    final p = pending;
    if (p != null) cues.add(p);
    pending = null;
  }

  for (var i = 0; i < chars.length; i++) {
    final start = i * step;
    final end = (i + 1) * step;
    final v = visemeForChar(chars[i]);
    final p = pending;
    if (p != null && p.visemeNum == v && start - p.endSec < 0.08) {
      pending = VisemeCue(
        startSec: p.startSec,
        endSec: end,
        visemeNum: v,
      );
    } else {
      flush();
      pending = VisemeCue(startSec: start, endSec: end, visemeNum: v);
    }
  }
  flush();
  return cues;
}
