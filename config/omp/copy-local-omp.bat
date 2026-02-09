@echo off
echo Deploying Oh My Posh theme from repo to system...
if not exist "%USERPROFILE%\.config\omp" mkdir "%USERPROFILE%\.config\omp"
copy /Y "%~dp0phosphor.omp.json" "%USERPROFILE%\.config\omp\phosphor.omp.json"
echo Done!
