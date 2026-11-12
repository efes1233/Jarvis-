#!/usr/bin/env bash
# JARVIS PRO + ORBIT ULTRA — Render / local build helper
# Usage: chmod +x render-build.sh && ./render-build.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
WEB="$ROOT/web"
SERVER="$ROOT/server"

echo "==> JARVIS ORBIT ULTRA build starting..."
echo "    Root: $ROOT"

# Node version check
NODE_MAJOR=$(node -v | cut -d. -f1 | tr -d v)
if [ "$NODE_MAJOR" -lt 18 ]; then
  echo "ERROR: Node 18+ required (found $(node -v))"
  exit 1
fi

# Web
if [ -f "$WEB/package.json" ]; then
  echo "==> Installing web dependencies..."
  cd "$WEB"
  npm install --include=dev --no-audit --no-fund
  echo "==> Building web (Vite + TypeScript)..."
  npm run build
  echo "    Web dist ready: $WEB/dist"
else
  echo "WARN: web/package.json missing — skipping web build"
fi

# Server (if present)
if [ -f "$SERVER/package.json" ]; then
  echo "==> Installing server dependencies..."
  cd "$SERVER"
  npm install --include=dev --no-audit --no-fund
  if grep -q '"build"' package.json; then
    npm run build || true
  fi
elif [ -d "$SERVER/src" ]; then
  echo "==> Server source present (no package.json) — assuming ts-node / direct run"
fi

echo "==> Build finished."
echo "    To start locally: cd web && npm run dev"
echo "    Or use Render startCommand from render.yaml"
echo "    ORBIT ULTRA: Three.js solar system + 56 sci-fi effects + HIGH/LITE modes"
