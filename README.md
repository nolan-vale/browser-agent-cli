<div align="center">

<!--
  COVER IMAGE — generate with this prompt, save as docs/cover.png, then uncomment below.

  Prompt (Midjourney / DALL-E 3 / Stable Diffusion XL):
  "A glowing Chrome browser window floating in a dark void, connected by luminous cyan lines
  to a terminal cursor and abstract AI agent nodes, deep space background, neon blue and
  white accent colors, minimalist developer aesthetic, no text, no UI chrome,
  wide cinematic banner, 2:1 aspect ratio"

  <img src="docs/cover.png" alt="browser-agent-cli" width="100%">
-->

# browser-agent-cli

Real browser automation for AI coding agents — launch Chrome with a dedicated agent profile and control it via Chrome DevTools Protocol.

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)
[![Shell: bash](https://img.shields.io/badge/shell-bash-0ea5e9.svg)](https://www.gnu.org/software/bash/)
[![Stars](https://img.shields.io/github/stars/nolan-vale/browser-agent-cli?style=social)](https://github.com/nolan-vale/browser-agent-cli)

</div>

---

## What it does

`browser-agent-cli` gives AI coding agents a real, visible browser with a dedicated profile — separate from the user's personal browser. No headless mode. No re-authentication. No interference with the user's sessions.

`chrome-beta-agent` launches Google Chrome Beta with an isolated agent profile and Chrome DevTools Protocol (CDP) enabled on port 9222. It is idempotent: if Chrome Beta is already running and healthy, it opens a new tab instead of starting a second instance. `chrome-beta-agent-stop` gracefully shuts down the agent browser.

The agent controls the browser through CDP — directly or via the [chrome-devtools CLI](https://www.npmjs.com/package/chrome-devtools-mcp).

## Who it is for

- AI agent developers who need a real browser with persistent logins for automated workflows
- Developers using Claude Code, Codex, Cursor, or Windsurf who want browser automation without Playwright or headless Chrome
- Automation engineers who need an isolated, recoverable browser profile for agent tasks
- Anyone building AI agents that interact with web apps, dashboards, or login-protected content

## Why a real browser instead of headless

| Headless (Playwright / Puppeteer) | browser-agent-cli |
|---|---|
| No persistent logins — re-authenticates every run | Keeps logins across sessions |
| Blocked by anti-bot systems | Indistinguishable from a real user |
| No visible UI — hard to debug | Visible browser — easy to observe and intervene |
| Requires Playwright install + browser download | Uses Chrome Beta already on the machine |
| Separate from the user's Chrome profile | Dedicated agent profile, isolated from personal sessions |

## Full agent stack

```
chrome-beta-agent <url>            ← launch / open tab (this repo)
    ↓
http://127.0.0.1:9222              ← Chrome DevTools Protocol endpoint
    ↓
chrome-devtools <command>          ← control: snapshot, click, fill, navigate
    (npm install -g chrome-devtools-mcp)
```

The skill file in `skills/SKILL.md` teaches Claude Code and Codex how to use this stack.

## Installation

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
```

`install.sh` copies `chrome-beta-agent` and `chrome-beta-agent-stop` to `~/.local/bin/` and installs the skill to `~/.claude/skills/` and `~/.codex/skills/` if those directories exist.

Make sure `~/.local/bin` is in your `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"   # add to ~/.zshrc or ~/.bashrc
```

Also install the CDP control layer:

```bash
npm install -g chrome-devtools-mcp
```

### Requirements

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/) installed at `/Applications/Google Chrome Beta.app`
- `curl` and `python3` (pre-installed on macOS)

## Quick start

```bash
# Launch Chrome Beta with agent profile and CDP on port 9222
chrome-beta-agent https://example.com

# Snapshot the page to get element UIDs
chrome-devtools take_snapshot

# Click an element
chrome-devtools click "uid=1_5"

# Fill a form field
chrome-devtools fill "uid=1_8" "search query"

# Navigate
chrome-devtools navigate_page --url "https://example.com/page"

# Take a screenshot
chrome-devtools take_screenshot

# Stop the agent browser
chrome-beta-agent-stop
```

## Usage

### `chrome-beta-agent [url]`

Launches Chrome Beta with a dedicated agent profile and CDP enabled.

```bash
chrome-beta-agent                         # open blank tab
chrome-beta-agent https://example.com     # open URL in new tab
```

**Environment variables:**

| Variable | Default | Description |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP port |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Agent browser profile directory |

**Behavior:**
- If Chrome Beta is already running with a healthy CDP endpoint → opens `url` in a new tab and exits
- If the agent profile is running but CDP is unhealthy → restarts only the agent profile
- If port 9222 is occupied by a non-Chrome process → exits with an error message

### `chrome-beta-agent-stop`

Gracefully shuts down Chrome Beta (AppleScript quit → SIGTERM → SIGKILL).

```bash
chrome-beta-agent-stop
```

## Agent workflow patterns

```bash
# Launch and open a page
chrome-beta-agent https://app.example.com/login

# Read the page (get element UIDs)
chrome-devtools take_snapshot

# Fill login form
chrome-devtools fill "uid=1_3" "username@example.com"
chrome-devtools fill "uid=1_5" "password"
chrome-devtools click "uid=1_7"

# Wait and snapshot again after navigation
chrome-devtools take_snapshot

# Collect console errors
chrome-devtools list_console_messages --types error

# Capture network requests
chrome-devtools list_network_requests

# Screenshot for verification
chrome-devtools take_screenshot

# Stop when done
chrome-beta-agent-stop
```

## Skill for AI agents

`skills/SKILL.md` teaches Claude Code and Codex the full workflow: how to start the browser, control it via CDP, recover from errors, and follow safety rules.

Install manually:

```bash
# Claude Code
mkdir -p ~/.claude/skills/chrome-devtools-cli
cp skills/SKILL.md ~/.claude/skills/chrome-devtools-cli/SKILL.md

# Codex
mkdir -p ~/.codex/skills/chrome-devtools-cli
cp skills/SKILL.md ~/.codex/skills/chrome-devtools-cli/SKILL.md
```

Or use `install.sh` — it does this automatically if the skill directories exist.

## Safety

Agents using this stack follow these rules by default (enforced in the skill):

- Open pages, read, snapshot, screenshot → automatic
- Submit forms, send messages, change settings, delete data, upload, pay → ask user first
- CAPTCHA / MFA / login → stop and ask user to complete manually

## Project metadata

- **Author:** Nolan Vale
- **Brand:** Nolan Vale Tools
- **Focus:** browser automation, AI agent tooling, Chrome DevTools Protocol, developer productivity
- **License:** MIT

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
