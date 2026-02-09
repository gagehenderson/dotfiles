#!/bin/bash
echo "Syncing Oh My Posh theme from system to repo..."
cp "$HOME/.config/omp/phosphor.omp.json" "$(dirname "$0")/phosphor.omp.json"
echo "Done!"
