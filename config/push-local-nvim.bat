@echo off

:: Get the path to the Neovim config directory
set "NVIM_DEST=%LOCALAPPDATA%\nvim"

:: Get the current directory (assumed to be the repo root)
set "REPO_NVIM_DIR=%CD%\nvim"

:: Ensure the repo nvim directory exists
if not exist "%REPO_NVIM_DIR%" (
    echo Neovim config not found in the repository at %REPO_NVIM_DIR%
    exit /b 1
)

:: Remove existing Neovim config in AppData to prevent stale files
if exist "%NVIM_DEST%" (
    rmdir /s /q "%NVIM_DEST%"
)

:: Copy the config from the repo to the AppData nvim directory
xcopy /e /i /y "%REPO_NVIM_DIR%" "%NVIM_DEST%"

echo Neovim config successfully copied to AppData.
