#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/skills/SKILL.md"

echo "==> Installing browser-agent-cli"

# Install scripts
mkdir -p "$BIN_DIR"
cp "$SCRIPT_DIR/bin/chrome-beta-agent" "$BIN_DIR/chrome-beta-agent"
cp "$SCRIPT_DIR/bin/chrome-beta-agent-stop" "$BIN_DIR/chrome-beta-agent-stop"
chmod +x "$BIN_DIR/chrome-beta-agent" "$BIN_DIR/chrome-beta-agent-stop"
echo "    [ok] bin → $BIN_DIR"

# Install skill for Claude Code
if [ -d "$HOME/.claude/skills" ]; then
  mkdir -p "$HOME/.claude/skills/chrome-devtools-cli"
  cp "$SKILL_SRC" "$HOME/.claude/skills/chrome-devtools-cli/SKILL.md"
  echo "    [ok] skill → ~/.claude/skills/chrome-devtools-cli/"
else
  echo "    [--] ~/.claude/skills not found — skipping Claude Code skill"
fi

# Install skill for Codex
if [ -d "$HOME/.codex/skills" ]; then
  mkdir -p "$HOME/.codex/skills/chrome-devtools-cli"
  cp "$SKILL_SRC" "$HOME/.codex/skills/chrome-devtools-cli/SKILL.md"
  echo "    [ok] skill → ~/.codex/skills/chrome-devtools-cli/"
else
  echo "    [--] ~/.codex/skills not found — skipping Codex skill"
fi

echo ""
echo "Done. Make sure $BIN_DIR is in your PATH:"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
echo "Also install the CDP control layer if you haven't:"
echo "  npm install -g chrome-devtools-mcp"
