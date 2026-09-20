param(
    [string]$TexFile = "resume_simple_control_engineer.tex"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw "pdflatex was not found on PATH."
}

$texPath = Join-Path $PSScriptRoot $TexFile
if (-not (Test-Path $texPath)) {
    throw "Could not find TeX file: $texPath"
}

Push-Location $PSScriptRoot
try {
    pdflatex -interaction=nonstopmode -halt-on-error $TexFile | Out-Host
    pdflatex -interaction=nonstopmode -halt-on-error $TexFile | Out-Host
}
finally {
    Pop-Location
}
