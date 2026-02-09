#!/bin/bash
echo "Deploying WezTerm config from repo to system..."
cp "$(dirname "$0")/.wezterm.lua" "$HOME/.wezterm.lua"
echo "Done!"
