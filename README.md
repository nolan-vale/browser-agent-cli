# browser-agent-cli

**A visible Chrome Beta workspace for supervised AI-assisted browser tasks on macOS.**

[Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

[![License: MIT](https://img.shields.io/badge/license-MIT-6B705C.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-334155.svg)](https://www.apple.com/macos/)
[![Shell: bash](https://img.shields.io/badge/shell-bash-334155.svg)](https://www.gnu.org/software/bash/)

## Practical purpose

Give an AI coding agent a browser session that a person can watch and interrupt. The launcher uses a separate browser profile for tasks involving web applications, dashboards, research, and other authorized browser-based work.

This is a small launcher and workflow-instruction project. Chrome and the connected DevTools tools provide the underlying browser and control capabilities; this repository is not a new browser, a full automation platform, or an access-control system.

## Project contribution

Built with AI coding agents as part of [Nolan Vale's](https://github.com/nolan-vale) independent product and workflow-automation work. My contribution is defining the task and intended behavior, directing AI-assisted implementation, checking the workflow, and iterating. **Nolan Vale Tools** is the label for these independent public projects.

## What it does

- **`chrome-beta-agent`** launches Chrome Beta with a dedicated profile and Chrome DevTools Protocol (CDP) access. When it detects a healthy existing session, it can open another tab instead of starting a new instance.
- **`chrome-beta-agent-stop`** attempts to stop Chrome Beta. See the application-wide shutdown warning below.
- **`skills/SKILL.md`** supplies instructions for browser use, recovery, and human approval of consequential actions.

A saved profile can retain login state, but sessions may expire or require reauthentication. A visible browser helps observation; it does not guarantee undetectable automation, correct agent behavior, or exemption from a website's access rules.

## Workflow structure

```text
chrome-beta-agent <url>      launcher in this repository
    |
http://127.0.0.1:9222        local Chrome DevTools Protocol endpoint
    |
compatible CDP tooling      inspect pages and perform authorized actions
    |
human review                observe results and approve consequential steps
```

The project instructions describe a `chrome-devtools` control workflow. The control layer is a separate dependency, not implemented by these launcher scripts.

## Installation

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
```

`install.sh` copies the launcher and stop helper to `~/.local/bin/`. It also installs the project skill into supported Claude Code and Codex skill directories when those directories exist.

Make sure `~/.local/bin` is in your `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

The existing project instructions use this separately installed control layer:

```bash
npm install -g chrome-devtools-mcp
```

Check the installed control tool's documentation for its supported invocation and options.

### Requirements

- macOS
- Google Chrome Beta installed at `/Applications/Google Chrome Beta.app`
- `curl`, `python3`, and `jq` available
- Compatible CDP control tooling for actions beyond launching the browser

## Quick start

```bash
# Launch the dedicated browser profile
chrome-beta-agent https://example.com

# With the documented control layer available:
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

Observe the session and review the result. Complete login, CAPTCHA, and multifactor steps yourself when required. Only allow agent actions on accounts and systems you are authorized to use.

## Launcher usage

```bash
chrome-beta-agent
chrome-beta-agent https://example.com
```

| Variable | Default | Purpose |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP port |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Browser profile directory |

The launcher checks the browser and CDP endpoint before reuse and includes recovery behavior for an unhealthy agent session. This is a convenience mechanism, not a guarantee that every browser or port condition will recover automatically.

## Shutdown helper

```bash
chrome-beta-agent-stop
```

**The current stop helper targets the Chrome Beta application and matching Chrome Beta processes, not just one agent profile.** It can close other Chrome Beta windows and sessions. Save work first; do not use it as a profile-isolated shutdown command.

The helper attempts an application quit, then SIGTERM, and finally SIGKILL if processes remain. A forced shutdown can interrupt in-progress work.

## Agent workflow examples

With the project's documented control layer available:

```bash
# Observe
chrome-devtools take_snapshot
chrome-devtools list_console_messages --types error
chrome-devtools list_network_requests
chrome-devtools take_screenshot

# After the user authorizes the relevant interaction:
chrome-devtools navigate_page --url "https://example.com/page"
chrome-devtools fill "uid=1_8" "search query"
chrome-devtools click "uid=1_5"
```

Element identifiers are examples; use the current page snapshot rather than assuming an identifier is stable.

## Agent instructions

[skills/SKILL.md](skills/SKILL.md) describes the intended workflow and approval conventions. It can be installed manually:

```bash
# Claude Code
mkdir -p ~/.claude/skills/chrome-devtools-cli
cp skills/SKILL.md ~/.claude/skills/chrome-devtools-cli/SKILL.md

# Codex
mkdir -p ~/.codex/skills/chrome-devtools-cli
cp skills/SKILL.md ~/.codex/skills/chrome-devtools-cli/SKILL.md
```

## Human control and data handling

The project skill instructs agents to ask before submissions, messages, settings changes, deletions, uploads, or payments, and to hand login challenges back to the user. **These are instructions, not technically enforced approval gates.** Human supervision and appropriate permissions are still required.

Keep the debugging endpoint local and protect the profile's session data. A separate profile is useful for organizing agent work but is not a security sandbox. Do not use this setup to bypass access controls or a service's restrictions.

## License

MIT — Nolan Vale. See [LICENSE](LICENSE).
