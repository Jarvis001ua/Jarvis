@echo off
setlocal
cd /d "%~dp0"

echo === Jarvis Atmosphere Setup ===

if not exist "requirements.txt" goto nofiles
if not exist "jarvis_atmosphere" goto nofiles

where python >nul 2>nul
if errorlevel 1 goto nopython

echo [1/3] Creating virtual environment...
python -m venv .venv
if errorlevel 1 goto venvfail
call ".venv\Scripts\activate.bat"

echo [2/3] Installing dependencies (may take a few minutes)...
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 goto pipfail

echo [3/3] Creating desktop shortcut...
powershell -NoProfile -Command "$d=[Environment]::GetFolderPath('Desktop');$s=(New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $d 'Jarvis Atmosphere.lnk'));$s.TargetPath='%~dp0jarvis_gui.bat';$s.WorkingDirectory='%~dp0';$s.Description='Jarvis Atmosphere';$s.Save()"
if errorlevel 1 goto shortcutfail

echo.
echo === Done! Shortcut "Jarvis Atmosphere" created on your Desktop ===
echo.
pause
exit /b 0

:nofiles
echo ERROR: requirements.txt not found next to install.bat.
echo.
echo This happens when install.bat is run from INSIDE the ZIP archive,
echo or when the .bat file was copied out of the folder separately.
echo.
echo How to fix:
echo   1. Download the ZIP file.
echo   2. Right-click it - "Extract All..." - extract to a folder.
echo   3. Open THAT folder (it contains requirements.txt, install.bat,
echo      jarvis_atmosphere, tests).
echo   4. Run install.bat from there.
echo.
pause
exit /b 1

:nopython
echo ERROR: Python not found.
echo Install Python from https://www.python.org/downloads/
echo and CHECK the box "Add Python to PATH" during setup,
echo then run install.bat again.
echo.
pause
exit /b 1

:venvfail
echo ERROR: Failed to create virtual environment.
pause
exit /b 1

:pipfail
echo WARNING: Some packages failed to install. The app may still work.
pause
exit /b 0

:shortcutfail
echo WARNING: Shortcut was not created. Run jarvis_gui.bat manually.
pause
exit /b 0
