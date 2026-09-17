# browser-agent-cli

**在 macOS 上，为人工监督的 AI 辅助任务提供可见的 Chrome Beta 会话。**

[English — 完整文档](README.md) · [Русский](README.ru.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md) · [한국어](README.ko.md)

## 用途与项目贡献

这是一组用于重复性浏览器任务的启动脚本和操作说明。专用配置文件用于组织代理工作，可见窗口便于观察和人工干预。

本项目属于 [Nolan Vale](https://github.com/nolan-vale) 的独立 AI 辅助产品实践：定义需求、指导编码代理实现、检查结果并迭代。浏览器及其控制能力由 Chrome 和外部 CDP 工具提供，本仓库并未自行实现浏览器平台。

## 安装与启动

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
chrome-beta-agent https://example.com
```

需要 macOS、位于 `/Applications/Google Chrome Beta.app` 的 Chrome Beta，以及 `curl`、`python3` 和 `jq`。页面控制需要单独的 CDP 工具。项目文档中的配置使用 `chrome-devtools-mcp`，具体调用方式请查看已安装版本的文档。

```bash
npm install -g chrome-devtools-mcp
# 项目文档中控制层的示例：
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

## 命令与配置

| 命令 | 用途 |
|---|---|
| `chrome-beta-agent [url]` | 启动或复用带代理配置文件的 Chrome Beta 会话 |
| `chrome-beta-agent-stop` | 停止 Chrome Beta 应用及匹配进程 |

`CHROME_AGENT_PORT` 默认为 `9222`；`CHROME_AGENT_PROFILE` 默认为 `~/.chrome-beta-agent-research`。安装程序会在兼容目录存在时，将 `skills/SKILL.md` 复制到 Claude Code 和 Codex 的技能目录。

## 限制与人工监督

会话可能过期，需要用户重新登录并完成 CAPTCHA 或 MFA。可见浏览器不保证避开自动化检测。独立配置文件也不是安全沙箱。

**停止命令针对整个 Chrome Beta 应用，而不只是代理配置文件。** 它可能关闭其他 Chrome Beta 窗口并强制结束进程。请先保存工作。

项目说明要求在提交表单、发送消息、更改设置、删除数据、上传文件或付款之前获得用户授权。这些是行为指令，并非技术上强制执行的审批机制。仍需人工监督和适当权限；调试端点应仅在本机使用，并妥善保护会话数据。

完整说明见 [README.md](README.md)。

MIT — Nolan Vale。**Nolan Vale Tools** 是其独立公开项目所使用的名称。
