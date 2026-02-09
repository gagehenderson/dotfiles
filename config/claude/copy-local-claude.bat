@echo off
echo Deploying Claude Code config from repo to system...
if not exist "%USERPROFILE%\.claude" mkdir "%USERPROFILE%\.claude"
copy /Y "%~dp0CLAUDE.md" "%USERPROFILE%\.claude\CLAUDE.md"
copy /Y "%~dp0settings.json" "%USERPROFILE%\.claude\settings.json"
echo Done!
