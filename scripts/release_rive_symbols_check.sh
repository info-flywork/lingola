#!/bin/bash
# TestFlight'a yüklemeden release IPA'da rive_native sembollerini doğrula.
# Kaynak: lingola-buddy scripts/release_device_test.sh
# Kullanım: ./scripts/release_rive_symbols_check.sh [path/to.ipa]
set -e
cd "$(dirname "$0")/.."

IPA="${1:-}"
if [ -z "$IPA" ]; then
  echo "▸ IPA üretiliyor (archive — TestFlight ile aynı süreç)…"
  flutter build ipa --export-method development
  IPA=$(ls build/ios/ipa/*.ipa | head -1)
fi

echo "▸ IPA: $IPA"
echo "▸ Kritik FFI sembolleri (riv yükleme)…"
WORK=$(mktemp -d)
unzip -q "$IPA" -d "$WORK"
APP="$WORK/Payload/Runner.app"
if [ -f "$APP/Frameworks/rive_native.framework/rive_native" ]; then
  BIN="$APP/Frameworks/rive_native.framework/rive_native"
  echo "  rive_native.framework (dinamik) mevcut"
else
  BIN="$APP/Runner"
  echo "  rive_native statik gömülü — Runner binary'si kontrol ediliyor"
fi
COUNT=0
for SYM in _init _loadRiveFile _makeFlutterFactory; do
  if nm -gU "$BIN" | awk '{print $3}' | grep -qx "$SYM"; then
    COUNT=$((COUNT + 1))
  else
    echo "  ⚠️  eksik sembol: $SYM"
  fi
done
rm -rf "$WORK"
if [ "$COUNT" -lt 3 ]; then
  echo "❌ Semboller eksik ($COUNT/3) — bu IPA TestFlight'ta riv yüklemeyebilir!"
  exit 1
fi
echo "✅ Kritik semboller tam (3/3) — riv yükleme bu binary'de çalışır."
