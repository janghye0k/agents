# agents

Cursor / Claude용 에이전트·스킬·룰과 Memory Bank 워크플로를 한곳에서 관리하는 모노레포입니다.  
`packages` 아래에 설정과 스킬을 두고, 루트에서 `init-cursor` 스크립트로 `.cursor`를 한 번에 구성할 수 있습니다.

---

## 프로젝트 구조

```
agents/
├── .cursor/          # init-cursor 실행 후 생성 (packages 내용 병합)
├── packages/         # 소스 패키지
├── init-cursor.ps1   # .cursor 초기화 스크립트
├── init-cursor.bat   # 배치 래퍼
└── README.md
```

---

## packages 하위 폴더 설명

| 폴더 | 설명 |
|------|------|
| **`.claude`** | Claude용 에이전트 정의(`agents/`)와 스킬(`skills/`). 문서·프론트엔드·React·Postgres·MCP 등 다양한 도메인 스킬과 AGENTS_OVERVIEW 등이 포함됩니다. |
| **`.cursor`** | Cursor 전용 룰. 에이전트/스킬 사용 규칙, 날짜·보안·문서(README 생성/개선) 관련 `.mdc` 룰이 들어 있습니다. |
| **`cursor-memory-bank`** | [Memory Bank System](packages/cursor-memory-bank/README.md) v0.8. `/van`, `/plan`, `/creative`, `/build`, `/reflect`, `/archive` 등 Cursor 2.0 커맨드 기반의 토큰 최적화 태스크·워크플로와 계층적 룰 로딩을 제공합니다. |
| **`cursor-memory-bank-serena-extend`** | [cursor-memory-bank](packages/cursor-memory-bank)와 [Serena MCP](https://github.com/oraios/serena) 연동 확장. Memory Bank 경로를 `.serena/memories/memory-bank`로 오버라이드하고, 메모리 뱅크 파일 읽기/수정 시 Serena MCP 도구를 우선 사용합니다. |
| **`mcp`** | MCP 서버 설정(`mcp.json`) 모음. sequential-thinking, context7, rtfmbro, serena, filesystem 등 사용할 MCP 서버 구성을 정의합니다. |

---

## 스크립트 사용법 (init-cursor)

루트에 `.cursor` 폴더를 만들고, `packages` 내 지정 경로들의 **내용**을 `.cursor`로 병합합니다.

### 복사되는 경로

- `packages/.claude` → `.cursor`
- `packages/.cursor` → `.cursor`
- `packages/cursor-memory-bank/.cursor` → `.cursor`
- `packages/cursor-memory-bank-serena-extend/.cursor` → `.cursor`

동일한 이름의 파일이 있으면 **나중에 복사되는 쪽**으로 덮어씌워집니다.

### 실행 방법

**PowerShell (권장)**

```powershell
# 프로젝트 루트에서
.\init-cursor.ps1
```

실행 정책 오류가 나면:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
.\init-cursor.ps1
```

또는 정책 없이 한 번만 실행:

```powershell
powershell -ExecutionPolicy Bypass -File .\init-cursor.ps1
```

**배치 파일**

```cmd
init-cursor.bat
```

파일 탐색기에서 `init-cursor.bat`을 더블클릭해도 됩니다.

### 주의사항

- 스크립트는 **스크립트 파일이 있는 디렉터리**를 기준으로 동작합니다. 반드시 프로젝트 루트(`agents/`)에서 실행하세요.
- 이미 `.cursor`가 있어도 그대로 사용하며, 위 네 경로의 내용을 덮어쓰기로 병합합니다.

---

## 요약

- **agents**: Cursor/Claude 설정·스킬·Memory Bank·MCP 구성을 모아 두는 레포.
- **packages**: `.claude`, `.cursor`, `cursor-memory-bank`, `cursor-memory-bank-serena-extend`, `mcp`로 구성.
- **init-cursor**: 루트에서 실행하면 위 네 경로를 루트 `.cursor`로 병합해 한 번에 설정을 적용합니다.
