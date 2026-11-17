@echo off
cd /d "%~dp0"
if exist ".venv\Scripts\python.exe" goto venvpython
python -m jarvis_atmosphere.jobs --gui
goto finish
:venvpython
".venv\Scripts\python.exe" -m jarvis_atmosphere.jobs --gui
:finish
if errorlevel 1 pause
