
#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SERVER="$ROOT/server"
WEB="$ROOT/web"

echo "=== JARVIS PRO BUILD ==="
echo "Root: $ROOT"

command -v unzip >/dev/null 2>&1 || {
  echo "HATA: unzip bulunamadı."
  exit 1
}

command -v node >/dev/null 2>&1 || {
  echo "HATA: Node.js bulunamadı."
  exit 1
}

extract_project() {
  ARCHIVE="$1"
  DEST="$2"
  NAME="$3"

  if [ ! -f "$ARCHIVE" ]; then
    echo "HATA: $ARCHIVE bulunamadı."
    exit 1
  fi

  TEMP="$(mktemp -d)"
  echo "==> $NAME arşivi açılıyor..."

  unzip -oq "$ARCHIVE" -d "$TEMP"

  PACKAGE="$(find "$TEMP" -maxdepth 6 -type f -name package.json -print -quit)"

  if [ -z "$PACKAGE" ]; then
    echo "HATA: $NAME arşivinde package.json bulunamadı."
    rm -rf "$TEMP"
    exit 1
  fi

  SOURCE="$(dirname "$PACKAGE")"

  mkdir -p "$DEST"
  cp -a "$SOURCE/." "$DEST/"

  rm -rf "$TEMP"

  if [ ! -f "$DEST/package.json" ]; then
    echo "HATA: $DEST/package.json oluşturulamadı."
    exit 1
  fi

  echo "==> $NAME hazır."
}

extract_project "$ROOT/server.zip" "$SERVER" "SERVER"
extract_project "$ROOT/web.zip" "$WEB" "WEB"

echo "==> Server bağımlılıkları kuruluyor..."
npm --prefix "$SERVER" install --include=dev --no-audit --no-fund

echo "==> Web bağımlılıkları kuruluyor..."
npm --prefix "$WEB" install --include=dev --no-audit --no-fund

echo "==> Web derleniyor..."
npm --prefix "$WEB" run build

echo "==> Başlatma betiği kontrol ediliyor..."
node --input-type=module -e '
import fs from "node:fs";
const p = JSON.parse(fs.readFileSync("server/package.json", "utf8"));
if (!p.scripts?.start) {
  console.error("HATA: server/package.json içinde start betiği yok.");
  process.exit(1);
}
console.log("Server start:", p.scripts.start);
'

echo "=== JARVIS BUILD BAŞARILI ==="
