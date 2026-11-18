# Recreate local junctions so Flutter can read repo content/ + design art without copying.
$ErrorActionPreference = "Stop"
$appRoot = Split-Path $PSScriptRoot -Parent
$repoRoot = Split-Path $appRoot -Parent

$art = Join-Path $appRoot "assets\art"
$content = Join-Path $appRoot "assets\content"
$artTarget = Join-Path $repoRoot "design\current\assets"
$contentTarget = Join-Path $repoRoot "content"

New-Item -ItemType Directory -Force -Path (Join-Path $appRoot "assets") | Out-Null
if (Test-Path $art) { cmd /c "rmdir `"$art`"" }
if (Test-Path $content) { cmd /c "rmdir `"$content`"" }
cmd /c "mklink /J `"$art`" `"$artTarget`""
cmd /c "mklink /J `"$content`" `"$contentTarget`""
Write-Output "Linked assets/art and assets/content"
