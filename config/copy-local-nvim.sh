#!/bin/bash

# Set the source and destination directories
NVIM_SOURCE="$HOME/.config/nvim"
REPO_NVIM_DIR="$(pwd)/nvim"

# Ensure the source directory exists
if [ ! -d "$NVIM_SOURCE" ]; then
    echo "Neovim config not found at $NVIM_SOURCE"
    exit 1
fi

# Remove existing nvim directory in the repo to prevent stale files
rm -rf "$REPO_NVIM_DIR"

# Copy the contents of the local Neovim config to the repo's nvim directory
mkdir -p "$REPO_NVIM_DIR"
cp -r "$NVIM_SOURCE"/* "$REPO_NVIM_DIR"/

echo "Neovim config successfully copied to the repository."
