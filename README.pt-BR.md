<div align="center">

← [English](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

# browser-agent-cli

**Automação de navegador real para agentes de IA — inicie o Chrome Beta com um perfil dedicado ao agente e controle via Chrome DevTools Protocol.**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli` fornece aos agentes de IA um navegador real e visível com um perfil dedicado — isolado do Chrome pessoal do usuário. Sem modo headless. Sem reautenticação. Sem interferência nas sessões do usuário.

## Stack completo

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <comando>
```

## Início rápido (60 segundos)

**Passo 1 — Clone e instale:**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**Passo 2 — Instale a camada de controle CDP:**
```bash
npm install -g chrome-devtools-mcp
```

**Passo 3 — Inicie o navegador:**
```bash
chrome-beta-agent https://example.com
```

**Passo 4 — Controle:**
```bash
chrome-devtools take_snapshot           # leia a página, obtenha UIDs dos elementos
chrome-devtools click "uid=1_5"         # clique em um elemento
chrome-devtools fill "uid=1_8" "texto"  # preencha um campo
chrome-devtools take_screenshot         # captura de tela
chrome-beta-agent-stop                  # pare o navegador
```

## Requisitos

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/) em `/Applications/Google Chrome Beta.app`
- `curl` e `python3` (pré-instalados no macOS)

## Comandos

| Comando | O que faz |
|---|---|
| `chrome-beta-agent [url]` | Inicia o Chrome Beta com perfil do agente e CDP na porta 9222. Se já estiver rodando, abre `url` em nova aba. |
| `chrome-beta-agent-stop` | Para o navegador do agente de forma limpa. |
| `chrome-devtools <cmd>` | Controla o navegador via CDP (pacote `chrome-devtools-mcp`). |

## Variáveis de ambiente

| Variável | Padrão | Descrição |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | Porta CDP |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | Diretório do perfil do agente |

## Skill para Claude Code / Codex

O `install.sh` instala automaticamente `skills/SKILL.md` em `~/.claude/skills/chrome-devtools-cli/` e `~/.codex/skills/chrome-devtools-cli/` caso esses diretórios existam.

## Segurança

O agente solicita confirmação antes de: enviar formulários, enviar mensagens, alterar configurações, excluir dados, realizar pagamentos. Para em login, CAPTCHA ou MFA e transfere o controle ao usuário.

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
