# init-cursor.ps1
# 스크립트와 같은 위치에 .cursor 폴더를 만들고
# packages 내 지정 경로들의 하위 폴더 및 파일을 .cursor로 복사합니다.

$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot
$CursorDir = Join-Path $ScriptDir ".cursor"
$PackagesDir = Join-Path $ScriptDir "packages"

$Sources = @(
    (Join-Path $PackagesDir ".claude"),
    (Join-Path $PackagesDir ".cursor"),
    (Join-Path $PackagesDir "cursor-memory-bank\.cursor"),
    (Join-Path $PackagesDir "cursor-memory-bank-serena-extend\.cursor")
)

# .cursor 폴더 생성
if (-not (Test-Path $CursorDir)) {
    New-Item -ItemType Directory -Path $CursorDir -Force | Out-Null
    Write-Host "Created: $CursorDir" -ForegroundColor Green
} else {
    Write-Host "Using existing: $CursorDir" -ForegroundColor Cyan
}

foreach ($Src in $Sources) {
    if (-not (Test-Path $Src)) {
        Write-Warning "Skip (not found): $Src"
        continue
    }
    Write-Host "Copying: $Src -> .cursor\" -ForegroundColor Yellow
    Copy-Item -Path "$Src\*" -Destination $CursorDir -Recurse -Force
}

Write-Host "Done. .cursor is ready at: $CursorDir" -ForegroundColor Green
