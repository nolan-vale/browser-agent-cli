# browser-agent-cli

**macOS 上で、人が監督する AI 支援タスクに使う可視 Chrome Beta セッション。**

[English — 完全なドキュメント](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [한국어](README.ko.md)

## 目的と担当範囲

繰り返し行うブラウザ作業のための小さな起動スクリプトと操作手順です。専用プロファイルでエージェントの作業を整理し、可視ウィンドウで結果を観察して介入できます。

[Nolan Vale](https://github.com/nolan-vale) の独立した AI 支援プロジェクトとして作成しました。担当は要件定義、コーディングエージェントへの実装指示、結果確認、改善です。ブラウザと制御機能は Chrome と外部 CDP ツールが提供し、このリポジトリが独自ブラウザ基盤を実装しているわけではありません。

## インストールと起動

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
chrome-beta-agent https://example.com
```

macOS、`/Applications/Google Chrome Beta.app` にある Chrome Beta、`curl`、`python3`、`jq` が必要です。ページ操作には別の CDP ツールが必要です。プロジェクトの手順では `chrome-devtools-mcp` を使用します。呼び出し方はインストールした版のドキュメントで確認してください。

```bash
npm install -g chrome-devtools-mcp
# 記載されている制御レイヤーの例:
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

## コマンドと設定

| コマンド | 目的 |
|---|---|
| `chrome-beta-agent [url]` | 専用プロファイルの Chrome Beta セッションを起動または再利用 |
| `chrome-beta-agent-stop` | Chrome Beta アプリと該当プロセスを停止 |

`CHROME_AGENT_PORT` の初期値は `9222`、`CHROME_AGENT_PROFILE` は `~/.chrome-beta-agent-research` です。対応するディレクトリが存在する場合、インストーラーは `skills/SKILL.md` を Claude Code と Codex のスキルディレクトリにコピーします。

## 制限と人による監督

セッションは期限切れになるため、再ログイン、CAPTCHA、MFA はユーザーが対応します。可視ブラウザでも自動化の検出を回避できる保証はありません。専用プロファイルはセキュリティサンドボックスではありません。

**停止コマンドはエージェントのプロファイルだけでなく、Chrome Beta アプリ全体を対象にします。** ほかのウィンドウを閉じたりプロセスを強制終了したりする可能性があります。先に作業を保存してください。

手順では、フォームやメッセージの送信、設定変更、削除、アップロード、支払いの前にユーザーの許可を求めます。これは行動指示であり、技術的に強制される承認機構ではありません。人の監督と適切な権限が必要です。CDP 接続はローカルに限定し、セッションデータを保護してください。

詳しくは [README.md](README.md) を参照してください。

MIT — Nolan Vale。**Nolan Vale Tools** は独立した公開プロジェクトの名称です。
