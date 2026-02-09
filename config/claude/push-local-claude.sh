#!/bin/bash
echo "Syncing Claude Code config from system to repo..."
cp "$HOME/.claude/CLAUDE.md" "$(dirname "$0")/CLAUDE.md"
cp "$HOME/.claude/settings.json" "$(dirname "$0")/settings.json"
echo "Done!"
