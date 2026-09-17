# browser-agent-cli

**Uma sessão visível do Chrome Beta para tarefas assistidas por IA com supervisão humana no macOS.**

[English — documentação completa](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

## Objetivo e contribuição

Um pequeno conjunto de scripts de inicialização e instruções para tarefas repetíveis no navegador. O perfil dedicado organiza o trabalho do agente; a janela visível permite observar e intervir.

Criado com agentes de programação de IA como parte do trabalho independente de [Nolan Vale](https://github.com/nolan-vale): definir requisitos, orientar a implementação, verificar resultados e iterar. O navegador e seu controle são fornecidos pelo Chrome e por ferramentas CDP externas; este repositório não implementa uma plataforma de navegador própria.

## Instalação e início

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
chrome-beta-agent https://example.com
```

Requer macOS, Chrome Beta em `/Applications/Google Chrome Beta.app`, `curl`, `python3` e `jq`. O controle das páginas requer ferramentas CDP separadas. A configuração documentada usa `chrome-devtools-mcp`; consulte a documentação da versão instalada.

```bash
npm install -g chrome-devtools-mcp
# Exemplos para a camada de controle documentada:
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

## Comandos e configuração

| Comando | Objetivo |
|---|---|
| `chrome-beta-agent [url]` | Iniciar ou reutilizar uma sessão do Chrome Beta com perfil de agente |
| `chrome-beta-agent-stop` | Encerrar o aplicativo Chrome Beta e os processos correspondentes |

O padrão de `CHROME_AGENT_PORT` é `9222`; o de `CHROME_AGENT_PROFILE` é `~/.chrome-beta-agent-research`. O instalador copia `skills/SKILL.md` para diretórios compatíveis do Claude Code e Codex quando eles existem.

## Limites e supervisão

Sessões podem expirar: login, CAPTCHA e MFA são concluídos pelo usuário. Um navegador visível não garante evitar detecção de automação. Um perfil separado não é uma sandbox de segurança.

**O comando de parada atua sobre o Chrome Beta como aplicativo, não apenas sobre o perfil do agente.** Pode fechar outras janelas e encerrar processos à força. Salve o trabalho primeiro.

As instruções exigem autorização antes de enviar formulários ou mensagens, alterar configurações, excluir dados, enviar arquivos ou fazer pagamentos. São orientações de comportamento, não barreiras técnicas de aprovação. Mantenha supervisão humana, permissões adequadas, o endpoint CDP local e os dados de sessão protegidos.

A referência completa está em [README.md](README.md).

MIT — Nolan Vale. **Nolan Vale Tools** é o nome usado para seus projetos públicos independentes.
