@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\launch_mgba_clean_validation.ps1"
if errorlevel 1 pause

