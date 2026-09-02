import 'dart:io';
import 'dart:math' as math;

/// Playback pozisyonu ile viseme timeline hizası (0 = birebir).
const kVisemeLatencySec = 0.0;

/// 1.0 = dudaklar ses ile aynı hızda; >1 dudakları erken bitirir.
const kLipsyncTimelineBoost = 1.0;

/// Aynı ağız şekli en az bu kadar tutulsun — harf-harf titreme olmasın.
const kMinVisemeHoldSec = 0.11;

/// Sessizlik (kelime arası) bu süreden uzunsa ağız kapalı kalsın.
const kMinSilenceHoldSec = 0.07;

/// Ardışık viseme değişimleri arası min süre (1x wall-clock; rate'e bölünür).
const kMinVisemeGapMs = 92;

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

    // Sessizlik: açık ağızla birleştirme — kelime arası ağız kapansın.
    if (v == 0) {
      flush();
      if (end - start >= kMinSilenceHoldSec) {
        cues.add(VisemeCue(startSec: start, endSec: end, visemeNum: 0));
      }
      continue;
    }

    final p = pending;
    if (p != null && p.visemeNum == v) {
      pending = VisemeCue(startSec: p.startSec, endSec: end, visemeNum: v);
    } else if (p != null &&
        p.visemeNum != 0 &&
        start - p.startSec < kMinVisemeHoldSec) {
      pending = VisemeCue(
        startSec: p.startSec,
        endSec: end,
        visemeNum: p.visemeNum,
      );
    } else {
      flush();
      pending = VisemeCue(startSec: start, endSec: end, visemeNum: v);
    }
  }
  flush();
  return coalesceVisemes(cues);
}

/// Kısa/sık cue'ları birleştir — sessizlik (0) korunur.
List<VisemeCue> coalesceVisemes(
  List<VisemeCue> cues, {
  double minHoldSec = kMinVisemeHoldSec,
}) {
  if (cues.isEmpty) return const [];
  final out = <VisemeCue>[];
  var cur = cues.first;

  for (var i = 1; i < cues.length; i++) {
    final next = cues[i];

    // Anlamlı sessizlik: açık ağızı uzatma, kapat.
    if (next.visemeNum == 0 &&
        (next.endSec - next.startSec) >= kMinSilenceHoldSec) {
      if (cur.visemeNum != 0) {
        out.add(
          VisemeCue(
            startSec: cur.startSec,
            endSec: math.min(cur.endSec, next.startSec),
            visemeNum: cur.visemeNum,
          ),
        );
      } else {
        out.add(cur);
      }
      cur = next;
      continue;
    }

    if (cur.visemeNum == 0) {
      out.add(cur);
      cur = next;
      continue;
    }

    final same = next.visemeNum == cur.visemeNum;
    final hold = cur.endSec - cur.startSec;
    final tooSoon = (next.startSec - cur.startSec) < minHoldSec;

    if (same || (tooSoon && next.visemeNum != 0) || hold < minHoldSec) {
      cur = VisemeCue(
        startSec: cur.startSec,
        endSec: math.max(cur.endSec, next.endSec),
        visemeNum: cur.visemeNum,
      );
    } else {
      final end = math.max(cur.endSec, cur.startSec + minHoldSec);
      out.add(
        VisemeCue(
          startSec: cur.startSec,
          endSec: end,
          visemeNum: cur.visemeNum,
        ),
      );
      cur = VisemeCue(
        startSec: math.max(next.startSec, end),
        endSec: math.max(
          next.endSec,
          math.max(next.startSec, end) + minHoldSec * 0.5,
        ),
        visemeNum: next.visemeNum,
      );
    }
  }
  out.add(cur);
  return out;
}

/// Timeline'ı gerçek ses süresine yay (heuristic kısa kalırsa ağız koşmasın).
List<VisemeCue> scaleVisemesToAudioDuration(
  List<VisemeCue> cues,
  double audioDurationSec,
) {
  if (cues.isEmpty || audioDurationSec <= 0.2) return cues;
  var trackEnd = 0.0;
  for (final c in cues) {
    if (c.endSec > trackEnd) trackEnd = c.endSec;
  }
  if (trackEnd < 0.05) return cues;
  final target = audioDurationSec.clamp(0.2, audioDurationSec);
  final scale = target / trackEnd;
  if (scale >= 0.92 && scale <= 1.12) return coalesceVisemes(cues);
  return coalesceVisemes([
    for (final c in cues)
      VisemeCue(
        startSec: c.startSec * scale,
        endSec: c.endSec * scale,
        visemeNum: c.visemeNum,
      ),
  ]);
}

double visemeAt(
  List<VisemeCue> cues,
  double tSec, {
  double? cutOffSec,
  double latencySec = kVisemeLatencySec,
}) {
  final t = ((tSec - latencySec) * kLipsyncTimelineBoost).clamp(
    0.0,
    double.infinity,
  );
  if (cutOffSec != null && t >= cutOffSec) return 0;
  if (cues.isEmpty) return 0;
  for (final cue in cues) {
    if (t >= cue.startSec && t < cue.endSec) return cue.visemeNum;
  }
  // Cue'lar arası boşluk = sessizlik → ağız kapalı.
  return 0;
}

/// Dudak timeline bitişi — mümkünse ses süresiyle aynı.
double effectiveSpeechEndSec({
  required List<VisemeCue> visemes,
  double? audioDurationSec,
}) {
  if (audioDurationSec != null && audioDurationSec > 0) {
    return audioDurationSec;
  }
  var lastMouth = 0.0;
  for (final cue in visemes) {
    if (cue.visemeNum != 0) lastMouth = cue.endSec;
  }
  return lastMouth;
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
          : (chars.length * 0.12).clamp(1.0, 90.0);
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

    if (v == 0) {
      flush();
      if (end - start >= kMinSilenceHoldSec) {
        cues.add(VisemeCue(startSec: start, endSec: end, visemeNum: 0));
      }
      continue;
    }

    final p = pending;
    if (p != null && p.visemeNum == v) {
      pending = VisemeCue(startSec: p.startSec, endSec: end, visemeNum: v);
    } else if (p != null && start - p.startSec < kMinVisemeHoldSec) {
      pending = VisemeCue(
        startSec: p.startSec,
        endSec: end,
        visemeNum: p.visemeNum,
      );
    } else {
      flush();
      pending = VisemeCue(startSec: start, endSec: end, visemeNum: v);
    }
  }
  flush();
  return coalesceVisemes(cues);
}
