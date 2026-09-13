from unittest.mock import Mock

from fastapi.testclient import TestClient

from app.api.dependencies import get_db
from app.main import app

client = TestClient(app)


def test_health_check() -> None:
    database = Mock()
    app.dependency_overrides[get_db] = lambda: database

    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok", "database": "ok"}
    database.execute.assert_called_once()

    app.dependency_overrides.clear()
