#!/bin/bash

# Define the source and target directories
DOTFILES_REPO_DIR="$(pwd)"  # Current directory (where the script is run)
NVIM_REPO_DIR="$DOTFILES_REPO_DIR/nvim"  # nvim folder in your repo
NVIM_CONFIG_DIR="$HOME/.config/nvim"  # nvim config directory on the system

# Check if the nvim folder exists in the repo
if [ ! -d "$NVIM_REPO_DIR" ]; then
  echo "Error: nvim folder not found in the repository."
  exit 1
fi

# Create the target directory if it doesn't exist
mkdir -p "$NVIM_CONFIG_DIR"

# Copy contents from the repo's nvim folder to the system's nvim directory
cp -r "$NVIM_REPO_DIR/"* "$NVIM_CONFIG_DIR/"

# Confirm success
echo "Successfully copied the nvim configuration to $NVIM_CONFIG_DIR"
