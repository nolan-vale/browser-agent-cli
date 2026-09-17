# browser-agent-cli

**macOS에서 사람이 감독하는 AI 지원 작업을 위한 가시적인 Chrome Beta 세션입니다.**

[English — 전체 문서](README.md) · [Русский](README.ru.md) · [中文](README.zh-CN.md) · [Português](README.pt-BR.md) · [Español](README.es.md) · [日本語](README.ja.md)

## 목적과 기여

반복적인 브라우저 작업을 위한 작은 실행 스크립트와 작업 지침 모음입니다. 전용 프로필로 에이전트 작업을 정리하고, 보이는 창을 통해 결과를 관찰하고 개입할 수 있습니다.

[Nolan Vale](https://github.com/nolan-vale)의 독립적인 AI 지원 프로젝트로 만들었습니다. 담당 역할은 요구사항 정의, 코딩 에이전트의 구현 지시, 결과 확인, 반복 개선입니다. 브라우저와 제어 기능은 Chrome 및 외부 CDP 도구가 제공하며, 이 저장소가 자체 브라우저 플랫폼을 구현한 것은 아닙니다.

## 설치와 실행

```bash
git clone https://github.com/nolan-vale/browser-agent-cli.git
cd browser-agent-cli
bash install.sh
chrome-beta-agent https://example.com
```

macOS, `/Applications/Google Chrome Beta.app`의 Chrome Beta, `curl`, `python3`, `jq`가 필요합니다. 페이지 제어에는 별도의 CDP 도구가 필요합니다. 프로젝트 문서는 `chrome-devtools-mcp` 구성을 사용합니다. 호출 방법은 설치된 버전의 문서에서 확인하세요.

```bash
npm install -g chrome-devtools-mcp
# 문서에 설명된 제어 계층의 예:
chrome-devtools take_snapshot
chrome-devtools take_screenshot
```

## 명령과 설정

| 명령 | 목적 |
|---|---|
| `chrome-beta-agent [url]` | 에이전트 프로필을 사용하는 Chrome Beta 세션 실행 또는 재사용 |
| `chrome-beta-agent-stop` | Chrome Beta 앱과 해당 프로세스 종료 |

`CHROME_AGENT_PORT` 기본값은 `9222`, `CHROME_AGENT_PROFILE` 기본값은 `~/.chrome-beta-agent-research`입니다. 설치 프로그램은 호환되는 디렉터리가 있을 때 `skills/SKILL.md`를 Claude Code와 Codex의 스킬 디렉터리에 복사합니다.

## 제한과 사람의 감독

세션은 만료될 수 있으며 로그인, CAPTCHA, MFA는 사용자가 처리합니다. 보이는 브라우저도 자동화 탐지를 피한다고 보장하지 않습니다. 별도 프로필은 보안 샌드박스가 아닙니다.

**종료 명령은 에이전트 프로필뿐 아니라 Chrome Beta 앱 전체를 대상으로 합니다.** 다른 창이 닫히거나 프로세스가 강제 종료될 수 있으므로 작업을 먼저 저장하세요.

지침은 폼 제출, 메시지 전송, 설정 변경, 데이터 삭제, 업로드, 결제 전에 사용자 승인을 요구합니다. 이는 행동 지침이며 기술적으로 강제되는 승인 장치가 아닙니다. 사람의 감독과 적절한 권한이 필요합니다. CDP 엔드포인트는 로컬에서만 사용하고 세션 데이터를 보호하세요.

자세한 내용은 [README.md](README.md)를 참고하세요.

MIT — Nolan Vale. **Nolan Vale Tools**는 독립적인 공개 프로젝트에 사용하는 이름입니다.
