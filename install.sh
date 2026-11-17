#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "=== Установка Джарвис Атмосфера ==="
command -v python3 >/dev/null || { echo "Python 3 не найден. Установите python3 и повторите."; exit 1; }

python3 -m venv .venv
. .venv/bin/activate
pip install --upgrade pip -q
pip install -r requirements.txt

DESKTOP="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
mkdir -p "$DESKTOP"
cat > "$DESKTOP/jarvis-atmosphere.desktop" <<DESK
[Desktop Entry]
Type=Application
Name=Jarvis Atmosphere
Comment=Джарвис Атмосфера
Exec=$(pwd)/.venv/bin/python -m jarvis_atmosphere.jobs --gui
Path=$(pwd)
Terminal=true
DESK
chmod +x "$DESKTOP/jarvis-atmosphere.desktop"

echo "Готово! Ярлык Jarvis Atmosphere создан: $DESKTOP/jarvis-atmosphere.desktop"
