<div align="center">

← [English](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md)

# browser-agent-cli

**AI 코딩 에이전트를 위한 실제 브라우저 자동화 — 전용 에이전트 프로필로 Chrome Beta를 실행하고 Chrome DevTools Protocol로 제어한다.**

[![License: MIT](https://img.shields.io/badge/license-MIT-0ea5e9.svg)](LICENSE)
[![Platform: macOS](https://img.shields.io/badge/platform-macOS-0ea5e9.svg)](https://www.apple.com/macos/)

</div>

---

`browser-agent-cli`는 AI 에이전트에게 사용자의 개인 Chrome과 완전히 분리된 전용 프로필을 가진 실제 가시적 브라우저를 제공합니다. 헤드리스 모드 없음. 재인증 없음. 사용자 세션 방해 없음.

## 전체 스택

```
chrome-beta-agent <url>  →  http://127.0.0.1:9222  →  chrome-devtools <명령>
```

## 60초 빠른 시작

**1단계 — 클론 및 설치:**
```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli && bash install.sh
```

**2단계 — CDP 제어 레이어 설치:**
```bash
npm install -g chrome-devtools-mcp
```

**3단계 — 브라우저 실행:**
```bash
chrome-beta-agent https://example.com
```

**4단계 — 제어:**
```bash
chrome-devtools take_snapshot           # 페이지 읽기, 요소 UID 획득
chrome-devtools click "uid=1_5"         # 요소 클릭
chrome-devtools fill "uid=1_8" "텍스트" # 필드 입력
chrome-devtools take_screenshot         # 스크린샷
chrome-beta-agent-stop                  # 브라우저 종료
```

## 요구 사항

- macOS
- [Google Chrome Beta](https://www.google.com/chrome/beta/)(`/Applications/Google Chrome Beta.app`)
- `curl` 및 `python3`(macOS 기본 설치)
- [`jq`](https://jqlang.org) (`brew install jq`)

## 명령어

| 명령어 | 기능 |
|---|---|
| `chrome-beta-agent [url]` | 에이전트 프로필로 Chrome Beta 실행, CDP 포트 9222 활성화. 이미 실행 중이면 `url`을 새 탭에서 열기. |
| `chrome-beta-agent-stop` | 에이전트 브라우저를 정상 종료. |
| `chrome-devtools <cmd>` | CDP를 통해 브라우저 제어(`chrome-devtools-mcp` npm 패키지). |

## 환경 변수

| 변수 | 기본값 | 설명 |
|---|---|---|
| `CHROME_AGENT_PORT` | `9222` | CDP 포트 |
| `CHROME_AGENT_PROFILE` | `~/.chrome-beta-agent-research` | 에이전트 프로필 디렉토리 |

## Claude Code / Codex 스킬

`install.sh`는 `~/.claude/skills/` 또는 `~/.codex/skills/` 디렉토리가 존재하면 `skills/SKILL.md`를 자동으로 설치합니다.

## 안전 규칙

에이전트는 폼 제출, 메시지 전송, 설정 변경, 데이터 삭제, 결제 전에 사용자 확인을 요청합니다. 로그인, CAPTCHA, MFA 등장 시 자동 정지하고 사용자에게 제어를 넘깁니다.

---

Built by [Nolan Vale](https://github.com/nolan-vale)  
Part of **Nolan Vale Tools** — practical open-source utilities for search, automation, AI agents, and developer workflows.
