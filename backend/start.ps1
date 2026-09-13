$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

Write-Host "Starting PostgreSQL container..."
docker compose -f (Join-Path $PSScriptRoot "../docker-compose.yml") up -d postgres

if (-not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment..."
    python -m venv .venv
}

$venvPython = Join-Path $PSScriptRoot ".venv/Scripts/python.exe"

Write-Host "Installing backend dependencies..."
& $venvPython -m pip install -r requirements.txt
if ($LASTEXITCODE -ne 0) {
    throw "Dependency installation failed. FastAPI was not started."
}

if (-not (Test-Path ".env")) {
    Write-Host "Creating .env from .env.example..."
    Copy-Item ".env.example" ".env"
}

Write-Host "Starting FastAPI at http://127.0.0.1:8000"
& $venvPython -m uvicorn app.main:app --reload
