# Windows Prep
Could make some of this into a script, but honestly I prefer doing this manually and selecting what I do and don't want.

If you have a _completely fresh_ windows install - Follow the [AtlasOS Setup](https://atlasos.net/) to easily disable a lot of the windows bullshit and generally make your pc a bit faster.  

During your install, make sure you select to uninstall microsoft edge, and install your browser of choice in it's place.

# Software
### General
1. [Install Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?hl=en-US&gl=US) via the windows store.
2. [Install Rustup](https://rustup.rs/)
3. Uninstall OneDrive (if still installed).
    - Search OneDrive
    - Right click
    - Click "Uninstall"
    - Find it in the list and uninstall

### Chocolatey
_When using chocolatey (or installing chocolatey itself) you must be in a terminal with admin rights._
1. Run terminal as admin.
2. Install [Chocolatey](https://chocolatey.org/install)
3. Install mingw (We need the c compiler for neovim) `choco install mingw`
4. Install git `choco install git`
5. Install neovim `choco install neovim`
6. Install discord `choco install discord`
7. Install steam `choco install steam`
8. Install love `choco install love`
9. Install dropbox `choco install dropbox`

# Git
1. Run ssh-keygen, press enter until it's complete.  
2. Copy your public key found in /.ssh/
3. Add this to your ssh keys in your github profile.

# Neovim / This repo
_This assumes you have setup git_
1. Clone this repo.
2. Inside of `./config/` run `push-local-nvim.bat` in order to push the repo's neovim settings to your device.

# Terminal & Shell
### WezTerm
1. Install WezTerm `choco install wezterm`
2. Run `config/wezterm/copy-local-wezterm.bat` to deploy the config.

### PowerShell 7
1. Install PowerShell 7 `choco install pwsh`

### Oh My Posh
1. Install Oh My Posh `choco install oh-my-posh`
2. Run `config/omp/copy-local-omp.bat` to deploy the custom theme.

### PowerShell Profile
1. Run `config/powershell/copy-local-powershell.bat` to deploy the profile (loads Oh My Posh with the custom theme).

### Nerd Font
1. Install CaskaydiaCove Nerd Font `choco install nerd-fonts-cascadiacode`

# Claude Code
1. Run `config/claude/copy-local-claude.bat` to deploy Claude Code settings and global instructions.
