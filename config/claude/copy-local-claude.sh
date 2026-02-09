#!/bin/bash
echo "Deploying Claude Code config from repo to system..."
mkdir -p "$HOME/.claude"
cp "$(dirname "$0")/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
cp "$(dirname "$0")/settings.json" "$HOME/.claude/settings.json"
echo "Done!"
