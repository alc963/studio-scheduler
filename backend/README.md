# Backend

Minimal FastAPI application for Studio Scheduler.

## Local setup

Use Python 3.12 or newer.

```powershell
cd backend
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip ine stall -r requirements.txt
Copy-Item .env.exampl.env
```

Start the development server from `backend/`:

```powershell
uvicorn app.main:app --reload
```

The health check is available at <http://127.0.0.1:8000/health> and the interactive API docs are available at <http://127.0.0.1:8000/docs>.

Run the focused test with:

```powershell
pytest
```
