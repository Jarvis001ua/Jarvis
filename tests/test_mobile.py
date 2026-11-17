"""Тесты мобильного веб-интерфейса (реальный HTTP-сервер на localhost)."""

import json
import threading
import urllib.request

import pytest

from jarvis_atmosphere.jobs.tasks import TaskStore
from jarvis_atmosphere.mobile import server


@pytest.fixture()
def http_server():
    srv = server.ThreadingHTTPServer(("127.0.0.1", 0), server.Handler)
    thread = threading.Thread(target=srv.serve_forever, daemon=True)
    thread.start()
    base = f"http://127.0.0.1:{srv.server_address[1]}"
    yield base
    srv.shutdown()


def get(base, path):
    with urllib.request.urlopen(base + path, timeout=5) as r:
        return r.status, r.read()


def post_json(base, path, data):
    req = urllib.request.Request(
        base + path,
        data=json.dumps(data).encode(),
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    with urllib.request.urlopen(req, timeout=5) as r:
        return json.loads(r.read().decode())


def get_json(base, path):
    with urllib.request.urlopen(base + path, timeout=5) as r:
        return json.loads(r.read().decode())


def test_page_served(http_server):
    status, body = get(http_server, "/")
    assert status == 200
    assert "Джарвис Атмосфера".encode() in body


def test_state_endpoint(http_server):
    data = get_json(http_server, "/api/state")
    assert "atmosphere" in data
    assert "log" in data
    assert "wallet_address" in data


def test_command_endpoint(http_server):
    data = post_json(http_server, "/api/command", {"phrase": "статус"})
    assert "Режим" in data["atmosphere"]
    assert any("Джарвис:" in line for line in data["log"])


def test_settings_roundtrip(http_server, tmp_path, monkeypatch):
    monkeypatch.setattr(
        server.Settings, "save", lambda self, path=None: tmp_path / "settings.json"
    )
    data = post_json(
        http_server,
        "/api/settings",
        {
            "wallet_address": "TRX-test",
            "keywords": "бот, python",
            "skills": "Python",
            "budget_min": "1000",
            "budget_max": "",
            "poll_interval_minutes": "15",
            "auto_start_time": "08:00",
            "accounts": "fl.ru, ivan\nkwork, peter",
        },
    )
    assert data["wallet_address"] == "TRX-test"
    assert data["poll_interval_minutes"] == 15
    assert data["accounts"] == "fl.ru,ivan\nkwork,peter"


def test_auto_toggle(http_server):
    before = get_json(http_server, "/api/state")["auto_running"]
    data = post_json(http_server, "/api/auto", {})
    assert data["auto_running"] is not before
    post_json(http_server, "/api/auto", {})
    assert get_json(http_server, "/api/state")["auto_running"] is before


def test_404(http_server):
    import urllib.error

    with pytest.raises(urllib.error.HTTPError):
        get(http_server, "/no-such-page")


@pytest.fixture()
def task_store(tmp_path, monkeypatch):
    store = TaskStore(path=tmp_path / "tasks.json")
    monkeypatch.setattr(server.STATE, "tasks", store)
    return store


def test_task_lifecycle(http_server, task_store):
    data = post_json(http_server, "/api/task/new", {"title": "Статья про гаджеты"})
    assert len(data["tasks"]) == 1
    task = data["tasks"][0]
    assert task["title"] == "Статья про гаджеты"
    assert task["status_label"] == "новая"

    data = post_json(
        http_server, "/api/task/save", {"id": task["id"], "work": "Текст работы"}
    )
    assert data["tasks"][0]["work"] == "Текст работы"

    data = post_json(
        http_server, "/api/task/status", {"id": task["id"], "status": "done"}
    )
    assert data["tasks"][0]["status_label"] == "выполнено"


def test_task_bad_status_ignored(http_server, task_store):
    data = post_json(http_server, "/api/task/new", {"title": "Задача"})
    task_id = data["tasks"][0]["id"]
    data = post_json(
        http_server, "/api/task/status", {"id": task_id, "status": "sent"}
    )
    assert data["tasks"][0]["status"] == "new"


def test_task_export(http_server, task_store, tmp_path, monkeypatch):
    from jarvis_atmosphere.jobs import tasks as tasks_module

    monkeypatch.setattr(tasks_module, "RESULTS_DIR", tmp_path / "results")
    data = post_json(http_server, "/api/task/new", {"title": "Отчёт"})
    task_id = data["tasks"][0]["id"]
    post_json(http_server, "/api/task/save", {"id": task_id, "work": "Готово."})
    data = post_json(http_server, "/api/task/export", {"id": task_id})
    assert any("Результат сохранён" in line for line in data["log"])
    assert list((tmp_path / "results").iterdir())


def test_task_new_with_template(http_server, task_store):
    data = post_json(
        http_server, "/api/task/new", {"title": "Программа", "template": "code"}
    )
    assert data["tasks"][0]["work"].startswith("# Что делает программа")
    assert data["templates"]
