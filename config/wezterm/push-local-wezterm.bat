@echo off
echo Syncing WezTerm config from system to repo...
copy /Y "%USERPROFILE%\.wezterm.lua" "%~dp0.wezterm.lua"
echo Done!
