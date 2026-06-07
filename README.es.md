<div align="center">

← [English](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

# browser-agent-cli

**Automatización de navegador real para agentes de IA — lanza Chrome Beta con un perfil dedicado al agente y contrólalo mediante Chrome DevTools Protocol.**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli` proporciona a los agentes de IA un navegador real y visible con un perfil dedicado, aislado del Chrome personal del usuario. Sin modo sin cabeza. Sin reautenticación. Sin interferencia en las sesiones del usuario.

## Stack completo

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <comando>
```

## Inicio rápido (60 segundos)

**Paso 1 — Clona e instala:**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**Paso 2 — Instala la capa de control CDP:**
```bash
npm install -g chrome-devtools-mcp
```

**Paso 3 — Lanza el navegador:**
```bash
chrome-beta-agent https://example.com
```

**Paso 4 — Controla:**
```bash
chrome-devtools take_snapshot            # lee la página, obtén UIDs de elementos
chrome-devtools click "uid=1_5"          # haz clic en un elemento
chrome-devtools fill "uid=1_8" "texto"   # rellena un campo
chrome-devtools take_screenshot          # captura de pantalla
chrome-beta-agent-stop                   # detén el navegador
```

## Requisitos

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/) en `/Applications/Google Chrome Beta.app`
- `curl` y `python3` (preinstalados en macOS)

## Comandos

| Comando | Qué hace |
|---|---|
| `chrome-beta-agent [url]` | Lanza Chrome Beta con perfil de agente y CDP en el puerto 9222. Si ya está en ejecución, abre `url` en una nueva pestaña. |
| `chrome-beta-agent-stop` | Detiene el navegador del agente de forma limpia. |
| `chrome-devtools <cmd>` | Controla el navegador vía CDP (paquete `chrome-devtools-mcp`). |

## Variables de entorno

| Variable | Por defecto | Descripción |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | Puerto CDP |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Directorio del perfil del agente |

## Skill para Claude Code / Codex

`install.sh` instala automáticamente `skills/SKILL.md` en `~/.claude/skills/chrome-devtools-cli/` y `~/.codex/skills/chrome-devtools-cli/` si esos directorios existen.

## Seguridad

El agente solicita confirmación antes de: enviar formularios, enviar mensajes, cambiar configuraciones, eliminar datos, realizar pagos. Se detiene ante login, CAPTCHA o MFA y cede el control al usuario.

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
