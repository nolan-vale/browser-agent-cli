# AGENTS.md — browser-agent-cli for AI Coding Agents

This file is for AI agents (Claude Code, Codex, Cursor, Windsurf, etc.) that need to install and use `browser-agent-cli` on behalf of a user.

## Install

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
npm install -g chrome-devtools-mcp
```

Requires: macOS, Google Chrome Beta at `/Applications/Google Chrome Beta.app`, `curl`, `python3` (pre-installed), and `jq` (`brew install jq`).

## Commands

| Command | What it does |
|---|---|
| `chrome-beta-agent [url]` | Launch Chrome Beta with agent profile + CDP on port 9222. If already running, opens `url` in a new tab. |
| `chrome-beta-agent-stop` | Gracefully shut down the agent browser. |
| `chrome-devtools <cmd>` | Control the browser via CDP (separate package: `chrome-devtools-mcp`). |

## Full workflow

```bash
# 1. Launch
chrome-beta-agent https://target.com

# 2. Snapshot page (get element UIDs)
chrome-devtools take_snapshot

# 3. Interact
chrome-devtools fill "uid=1_3" "input text"
chrome-devtools click "uid=1_5"
chrome-devtools navigate_page --url "https://target.com/next"

# 4. Observe
chrome-devtools take_screenshot
chrome-devtools list_console_messages --types error
chrome-devtools list_network_requests

# 5. Stop
chrome-beta-agent-stop
```

## CDP endpoint

```
http://127.0.0.1:9222
```

Health check:

```bash
curl -s http://127.0.0.1:9222/json/version | jq .
```

## Recovery

If CDP is unhealthy but Chrome Beta is running:

```bash
chrome-beta-agent-stop
chrome-devtools stop 2>/dev/null || true
chrome-beta-agent https://target.com
chrome-devtools start --browserUrl http://127.0.0.1:9222
```

## Environment variables

| Variable | Default | Description |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP port |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Agent browser profile |

## Safety rules

Always ask the user before:
- Submitting any form
- Sending messages, emails, or notifications
- Changing account or profile settings
- Deleting or uploading data
- Accepting legal terms or billing actions

Always stop and ask the user to act manually when:
- Login, CAPTCHA, MFA, passkey, SMS or email verification is required

## Key files

- `README.md` — overview, install, usage
- `AGENTS.md` — this file, for AI agents
- `bin/chrome-beta-agent` — launcher script
- `bin/chrome-beta-agent-stop` — stop script
- `skills/SKILL.md` — Claude Code / Codex skill
- `llms.txt` — machine-readable summary

## Links

- GitHub: https://github.com/nolan-vale/browser-agent-cli
- chrome-devtools CLI (control layer): https://www.npmjs.com/package/chrome-devtools-mcp
- Chrome DevTools Protocol reference: https://chromedevtools.github.io/devtools-protocol/
