#!/bin/bash
echo "Syncing PowerShell profile from system to repo..."
cp "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1" "$(dirname "$0")/Microsoft.PowerShell_profile.ps1" 2>/dev/null || echo "No PowerShell profile found on this system (expected on non-Windows)"
echo "Done!"
