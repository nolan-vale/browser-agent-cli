# browser-agent-cli

**Una sesión visible de Chrome Beta para tareas asistidas por IA y supervisadas por una persona en macOS.**

[English — documentación completa](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

## Propósito y contribución

Un pequeño conjunto de scripts de inicio e instrucciones para tareas repetibles en el navegador. El perfil dedicado organiza el trabajo del agente; la ventana visible permite observarlo e intervenir.

Proyecto creado con agentes de programación de IA como parte del trabajo independiente de [Nolan Vale](https://github.com/nolan-vale): definir requisitos, dirigir la implementación, comprobar resultados e iterar. Chrome y herramientas CDP externas proporcionan el navegador y su control; este repositorio no implementa una plataforma de navegador propia.

## Instalación e inicio

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
chrome-beta-agent https://example.com
```

Requiere macOS, Chrome Beta en `/Applications/Google Chrome Beta.app`, `curl`, `python3` y `jq`. El control de páginas requiere herramientas CDP aparte. La configuración documentada utiliza `chrome-devtools-mcp`; consulta la documentación de la versión instalada.

```bash
npm install -g chrome-devtools-mcp
# Ejemplos para la capa de control documentada:
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

## Comandos y configuración

| Comando | Propósito |
|---|---|
| `chrome-beta-agent [url]` | Iniciar o reutilizar una sesión de Chrome Beta con perfil de agente |
| `chrome-beta-agent-stop` | Detener la aplicación Chrome Beta y los procesos correspondientes |

`CHROME_AGENT_PORT` tiene el valor predeterminado `9222`; `CHROME_AGENT_PROFILE`, `~/.chrome-beta-agent-research`. El instalador copia `skills/SKILL.md` a los directorios compatibles de Claude Code y Codex cuando existen.

## Límites y supervisión

Las sesiones pueden caducar: el usuario completa el inicio de sesión, CAPTCHA y MFA. Un navegador visible no garantiza evitar la detección de automatización. Un perfil separado no es un entorno aislado de seguridad.

**El comando de parada actúa sobre Chrome Beta en su conjunto, no solo sobre el perfil del agente.** Puede cerrar otras ventanas y terminar procesos por la fuerza. Guarda el trabajo primero.

Las instrucciones exigen autorización antes de enviar formularios o mensajes, cambiar ajustes, eliminar datos, subir archivos o realizar pagos. Son instrucciones de comportamiento, no controles de aprobación impuestos técnicamente. Mantén supervisión humana, permisos adecuados, el endpoint CDP local y los datos de sesión protegidos.

Consulta [README.md](README.md) para obtener la referencia completa.

MIT — Nolan Vale. **Nolan Vale Tools** identifica sus proyectos públicos independientes.
