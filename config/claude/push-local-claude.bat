@echo off
echo Syncing Claude Code config from system to repo...
copy /Y "%USERPROFILE%\.claude\CLAUDE.md" "%~dp0CLAUDE.md"
copy /Y "%USERPROFILE%\.claude\settings.json" "%~dp0settings.json"
echo Done!
