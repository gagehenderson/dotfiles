@echo off
echo Deploying WezTerm config from repo to system...
copy /Y "%~dp0.wezterm.lua" "%USERPROFILE%\.wezterm.lua"
echo Done!
