#!/data/data/com.termux/files/usr/bin/bash
# Установка Джарвис Атмосфера на Android (Termux).
# Запуск: bash termux_setup.sh

set -e
cd "$(dirname "$0")"

echo "=== Jarvis Atmosphere: установка на Android ==="

command -v python >/dev/null 2>&1 || {
  echo "[1/3] Устанавливаю Python (Termux)..."
  pkg update -y
  pkg install python -y
}

echo "[2/3] Устанавливаю зависимости..."
pip install --upgrade pip
pip install SpeechRecognition keyring 2>/dev/null || \
  echo "NOTE: некоторые модули пропущены — это не мешает работе."

echo "[3/3] Готово!"
echo ""
echo "Запуск программы:  python -m jarvis_atmosphere.mobile"
echo "Затем откройте в браузере: http://127.0.0.1:8080"
