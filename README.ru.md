<div align="center">

← [English](README.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

# browser-agent-cli

**Автоматизация реального браузера для AI-агентов — Chrome Beta с отдельным профилем и управление через Chrome DevTools Protocol.**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli` даёт AI-агентам настоящий видимый браузер с отдельным профилем — изолированным от личного Chrome пользователя. Никакого headless-режима. Никакой повторной авторизации. Никакого вмешательства в сессии пользователя.

## Стек

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <команда>
```

## За 60 секунд

**Шаг 1 — Клонируй и установи:**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**Шаг 2 — Установи CDP-слой управления:**
```bash
npm install -g chrome-devtools-mcp
```

**Шаг 3 — Запусти браузер:**
```bash
chrome-beta-agent https://example.com
```

**Шаг 4 — Управляй:**
```bash
chrome-devtools take_snapshot          # прочитать страницу (получить UIDs элементов)
chrome-devtools click "uid=1_5"        # кликнуть элемент
chrome-devtools fill "uid=1_8" "текст" # ввести текст
chrome-devtools take_screenshot        # скриншот
chrome-beta-agent-stop                 # остановить браузер
```

## Требования

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/) в `/Applications/Google Chrome Beta.app`
- `curl` и `python3` (предустановлены на macOS)
- [`jq`](https://jqlang.org) (`brew install jq`)

## Команды

| Команда | Что делает |
|---|---|
| `chrome-beta-agent [url]` | Запускает Chrome Beta с агентским профилем и CDP на порту 9222. Если уже запущен — открывает url в новой вкладке. |
| `chrome-beta-agent-stop` | Корректно останавливает агентский браузер. |
| `chrome-devtools <cmd>` | Управляет браузером через CDP (пакет `chrome-devtools-mcp`). |

## Переменные окружения

| Переменная | По умолчанию | Описание |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP-порт |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Каталог профиля агента |

## Скилл для Claude Code / Codex

`install.sh` автоматически устанавливает `skills/SKILL.md` в `~/.claude/skills/chrome-devtools-cli/` и `~/.codex/skills/chrome-devtools-cli/`, если эти директории существуют.

## Безопасность

Агент спрашивает подтверждение перед: отправкой форм, отправкой сообщений, изменением настроек, удалением данных, оплатой. При логине, CAPTCHA или MFA — останавливается и передаёт управление пользователю.

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
