# Backend

Minimal FastAPI application for Studio Scheduler.

## Requirements

- Python 3.12 or newer
- PowerShell on Windows, or Bash on macOS/Linux
- Docker Desktop with Docker Compose

## Start local backend

The startup scripts start PostgreSQL, create the virtual environment if
needed, install dependencies, create `.env` from `.env.example` if needed, and
start FastAPI with reload enabled.

From the repository root, run one command for your shell:

### Windows PowerShell

```powershell
./backend/start.ps1
```

### Bash

```bash
bash ./backend/start.sh
```

You can also run either script from inside `backend/`.

The API is available at <http://127.0.0.1:8000>, with the health check at
<http://127.0.0.1:8000/health> and interactive docs at
<http://127.0.0.1:8000/docs>.

When PostgreSQL is ready, `/health` returns HTTP 200 with
`{"status":"ok","database":"ok"}`. If the database is unavailable, it
returns HTTP 503.

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

To stop PostgreSQL without deleting its data, run this from the repository
root:

```text
docker compose stop postgres
```

To remove the container while keeping the named `postgres_data` volume:

```text
docker compose down
```

Do not use `docker compose down -v` unless you intentionally want to delete
the local database data.

Docker Desktop's WSL2 virtual machine can be fully shut down with:

```text
wsl --shutdown
```

## Tests

Run the focused health-check test from `backend/`:

```text
python -m pytest
```
