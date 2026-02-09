@echo off
echo Syncing PowerShell profile from system to repo...
copy /Y "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" "%~dp0Microsoft.PowerShell_profile.ps1"
echo Done!
