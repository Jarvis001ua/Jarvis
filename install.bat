@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo === Установка Джарвис Атмосфера ===

where python >nul 2>nul
if errorlevel 1 (
  echo Python не найден. Установите его с https://www.python.org/downloads/
  echo и при установке отметьте галочку "Add Python to PATH", затем запустите install.bat снова.
  pause
  exit /b 1
)

echo [1/3] Создание виртуального окружения...
python -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip >nul

echo [2/3] Установка зависимостей...
pip install -r requirements.txt

echo [3/3] Создание ярлыка на рабочем столе...
set "TARGET=%USERPROFILE%\Desktop\Jarvis Atmosphere.lnk"
set "LAUNCHER=%~dp0jarvis_gui.bat"
powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%TARGET%');$s.TargetPath='%LAUNCHER%';$s.WorkingDirectory='%~dp0';$s.Description='Джарвис Атмосфера';$s.Save()"

echo.
echo Готово! Ярлык "Jarvis Atmosphere" на рабочем столе запускает программу.
pause
