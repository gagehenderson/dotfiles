@echo off

:: Get the path to the Neovim config directory
set "NVIM_SOURCE=%LOCALAPPDATA%\nvim"

:: Ensure the source directory exists
if not exist "%NVIM_SOURCE%" (
    echo Neovim config not found at %NVIM_SOURCE%
    exit /b 1
)

:: Get the current directory (assumed to be the repo root)
set "REPO_NVIM_DIR=%CD%\nvim"

:: Remove existing nvim directory to prevent stale files
if exist "%REPO_NVIM_DIR%" (
    rmdir /s /q "%REPO_NVIM_DIR%"
)

:: Copy the config to the repo's nvim directory
xcopy /e /i /y "%NVIM_SOURCE%" "%REPO_NVIM_DIR%"

echo Neovim config successfully copied to the repository.

