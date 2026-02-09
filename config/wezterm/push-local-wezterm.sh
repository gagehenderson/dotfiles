#!/bin/bash
echo "Syncing WezTerm config from system to repo..."
cp "$HOME/.wezterm.lua" "$(dirname "$0")/.wezterm.lua"
echo "Done!"
