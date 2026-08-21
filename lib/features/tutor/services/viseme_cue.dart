import 'dart:io';

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

double visemeAt(List<VisemeCue> cues, double tSec) {
  if (cues.isEmpty) return 0;
  for (final cue in cues) {
    if (tSec >= cue.startSec && tSec < cue.endSec) return cue.visemeNum;
  }
  return 0;
}
