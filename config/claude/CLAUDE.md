# Global Claude Code Instructions

## User Preferences

- Always run implementation work in background sub-agents so the user can keep chatting during execution. Use sub-agents as often as possible for any non-trivial task.

## System Tools

- `gsudo` is installed and available. Always use `gsudo <command>` when a command needs admin/elevated privileges (e.g., installing software, creating symlinks, modifying system files).
- `chocolatey` (choco) is installed as the package manager. Use `gsudo choco install <package>` for installing software.
