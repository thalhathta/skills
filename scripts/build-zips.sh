#!/usr/bin/env bash
# Build one zip per skill for upload to claude.ai (Settings > Capabilities > Skills).
# Output: dist/<skill-name>.zip
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for dir in skills/*/; do
  name="$(basename "$dir")"
  (cd skills && zip -qr "../dist/${name}.zip" "$name")
  echo "built dist/${name}.zip"
done
