@echo off
echo Deploying PowerShell profile from repo to system...
if not exist "%USERPROFILE%\Documents\PowerShell" mkdir "%USERPROFILE%\Documents\PowerShell"
copy /Y "%~dp0Microsoft.PowerShell_profile.ps1" "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
echo Done!
