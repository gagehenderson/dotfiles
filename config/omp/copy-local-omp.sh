#!/bin/bash
echo "Deploying Oh My Posh theme from repo to system..."
mkdir -p "$HOME/.config/omp"
cp "$(dirname "$0")/phosphor.omp.json" "$HOME/.config/omp/phosphor.omp.json"
echo "Done!"
