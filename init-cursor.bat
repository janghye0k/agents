@echo off
REM init-cursor.bat - .cursor 초기화 (PowerShell 스크립트 실행)
setlocal
set "SCRIPT_DIR=%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%init-cursor.ps1"
endlocal
