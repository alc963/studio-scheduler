# Backend

Minimal FastAPI application for Studio Scheduler.

## Requirements

- Python 3.12 or newer
- PowerShell on Windows, or Bash on macOS/Linux

## Automated startup

The startup scripts create the virtual environment if needed, install the
backend dependencies, create `.env` from `.env.example` if needed, and start
the development server with reload enabled.

From the repository root, use the script for your shell:

### Windows PowerShell

```powershell
./backend/start.ps1
```

If PowerShell blocks local scripts, allow scripts for your user account once:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Alternatively, run the script without changing the execution policy:

```powershell
powershell -ExecutionPolicy Bypass -File ./backend/start.ps1
```

### Bash

```bash
bash ./backend/start.sh
```

You can also run either script from inside `backend/`.

## Manual setup

From `backend/`, create and activate a virtual environment, install the
dependencies, and create a local environment file:

### Windows PowerShell

```powershell
python -m venv .venv
./.venv/Scripts/Activate.ps1
python -m pip install -r requirements.txt
Copy-Item .env.example .env
```

### Bash

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
cp .env.example .env
```

Start the development server from `backend/`:

```text
uvicorn app.main:app --reload
```

The health check is available at <http://127.0.0.1:8000/health>, and the
interactive API docs are available at <http://127.0.0.1:8000/docs>.

## Stop the backend

If the development server is running in the current terminal, press `Ctrl+C`
to stop Uvicorn. This stops the server but leaves the virtual environment
active.

To leave the virtual environment, run:

```text
deactivate
```

The `deactivate` command works in both PowerShell and Bash. You can close the
terminal after deactivating; the `.venv` directory remains available for the
next startup.

## Tests

Run the focused health-check test from `backend/`:

```text
python -m pytest
```
