<div align="center">

← [English](README.md) · [Русский](README.ru.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

# browser-agent-cli

**AI 编码代理的真实浏览器自动化 — 使用专属代理配置文件启动 Chrome Beta，通过 Chrome DevTools Protocol 进行控制。**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli` 为 AI 代理提供一个真实的可见浏览器，使用独立于用户个人 Chrome 的专属配置文件。无无头模式。无需重复登录。不干扰用户会话。

## 完整技术栈

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <命令>
```

## 60 秒快速上手

**第一步 — 克隆并安装：**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**第二步 — 安装 CDP 控制层：**
```bash
npm install -g chrome-devtools-mcp
```

**第三步 — 启动浏览器：**
```bash
chrome-beta-agent https://example.com
```

**第四步 — 控制浏览器：**
```bash
chrome-devtools take_snapshot            # 读取页面，获取元素 UID
chrome-devtools click "uid=1_5"          # 点击元素
chrome-devtools fill "uid=1_8" "文本"    # 输入文本
chrome-devtools take_screenshot          # 截图
chrome-beta-agent-stop                   # 停止浏览器
```

## 系统要求

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/)，安装于 `/Applications/Google Chrome Beta.app`
- `curl` 和 `python3`（macOS 预装）

## 命令

| 命令 | 功能 |
|---|---|
| `chrome-beta-agent [url]` | 以代理配置文件启动 Chrome Beta，CDP 监听端口 9222。若已运行则在新标签页打开 url。 |
| `chrome-beta-agent-stop` | 优雅地停止代理浏览器。 |
| `chrome-devtools <cmd>` | 通过 CDP 控制浏览器（需安装 `chrome-devtools-mcp` npm 包）。 |

## 环境变量

| 变量 | 默认值 | 说明 |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP 端口 |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | 代理浏览器配置文件目录 |

## Claude Code / Codex 技能

`install.sh` 在检测到 `~/.claude/skills/` 或 `~/.codex/skills/` 目录时，自动将 `skills/SKILL.md` 安装至对应位置。

## 安全规则

代理在以下操作前需用户确认：提交表单、发送消息、修改设置、删除数据、付款。遇到登录、CAPTCHA 或 MFA 时自动暂停并移交用户处理。

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
