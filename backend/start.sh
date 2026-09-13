#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

if command -v python3 >/dev/null 2>&1; then
    python_command=python3
else
    python_command=python
fi

if [[ ! -d ".venv" ]]; then
    echo "Creating virtual environment..."
    "$python_command" -m venv .venv
fi

venv_python=".venv/bin/python"

echo "Installing backend dependencies..."
"$venv_python" -m pip install -r requirements.txt

if [[ ! -f ".env" ]]; then
    echo "Creating .env from .env.example..."
    cp .env.example .env
fi

echo "Starting FastAPI at http://127.0.0.1:8000"
exec "$venv_python" -m uvicorn app.main:app --reload
