#!/bin/bash
echo "Deploying PowerShell profile from repo to system..."
mkdir -p "$HOME/.config/powershell"
cp "$(dirname "$0")/Microsoft.PowerShell_profile.ps1" "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
echo "Done!"
