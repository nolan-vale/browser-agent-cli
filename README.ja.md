<div align="center">

← [English](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [한국어](README.ko.md)

# browser-agent-cli

**AI コーディングエージェントのためのリアルブラウザ自動化 — 専用エージェントプロファイルで Chrome Beta を起動し、Chrome DevTools Protocol で制御する。**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli` は AI エージェントに、ユーザーの個人 Chrome から独立した専用プロファイルを持つ本物の可視ブラウザを提供します。ヘッドレスモードなし。再認証なし。ユーザーのセッションへの干渉なし。

## フルスタック

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <コマンド>
```

## 60 秒クイックスタート

**ステップ 1 — クローンしてインストール：**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**ステップ 2 — CDP 制御レイヤーをインストール：**
```bash
npm install -g chrome-devtools-mcp
```

**ステップ 3 — ブラウザを起動：**
```bash
chrome-beta-agent https://example.com
```

**ステップ 4 — 制御：**
```bash
chrome-devtools take_snapshot             # ページを読み取り、要素 UID を取得
chrome-devtools click "uid=1_5"           # 要素をクリック
chrome-devtools fill "uid=1_8" "テキスト" # フィールドに入力
chrome-devtools take_screenshot           # スクリーンショット
chrome-beta-agent-stop                    # ブラウザを停止
```

## 動作要件

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/)（`/Applications/Google Chrome Beta.app`）
- `curl` と `python3`（macOS にプリインストール済み）
- [`jq`](https://jqlang.org)（`brew install jq`）

## コマンド

| コマンド | 機能 |
|---|---|
| `chrome-beta-agent [url]` | エージェントプロファイルで Chrome Beta を起動し、CDP をポート 9222 で有効化。すでに起動中の場合は `url` を新しいタブで開く。 |
| `chrome-beta-agent-stop` | エージェントブラウザをクリーンに停止。 |
| `chrome-devtools <cmd>` | CDP 経由でブラウザを制御（`chrome-devtools-mcp` npm パッケージ）。 |

## 環境変数

| 変数 | デフォルト | 説明 |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP ポート |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | エージェントプロファイルディレクトリ |

## Claude Code / Codex スキル

`install.sh` は `~/.claude/skills/` または `~/.codex/skills/` が存在する場合、`skills/SKILL.md` を自動的にインストールします。

## セーフティルール

エージェントはフォーム送信・メッセージ送信・設定変更・データ削除・支払い前にユーザー確認を求めます。ログイン・CAPTCHA・MFA が現れると自動停止し、ユーザーに制御を渡します。

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
