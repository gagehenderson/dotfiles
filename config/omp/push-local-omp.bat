@echo off
echo Syncing Oh My Posh theme from system to repo...
copy /Y "%USERPROFILE%\.config\omp\phosphor.omp.json" "%~dp0phosphor.omp.json"
echo Done!
