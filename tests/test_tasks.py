"""Тесты модуля выполнения задач."""

import json

import pytest

from jarvis_atmosphere.jobs.sources import Order
from jarvis_atmosphere.jobs.tasks import STATUS_ORDER, TaskStore


@pytest.fixture()
def store(tmp_path):
    return TaskStore(path=tmp_path / "tasks.json")


def test_add_and_persist(tmp_path):
    path = tmp_path / "tasks.json"
    store = TaskStore(path=path)
    task = store.add("Статья про гаджеты")
    assert task.status == "new"
    reloaded = TaskStore(path=path)
    assert reloaded.list_tasks()[0].title == "Статья про гаджеты"


def test_add_requires_title(store):
    with pytest.raises(ValueError):
        store.add("   ")


def test_status_transitions(store):
    task = store.add("Задача")
    for status in ("in_progress", "review", "done"):
        updated = store.set_status(task.task_id, status)
        assert updated.status == status
    assert store.list_tasks(status="done")[0].task_id == task.task_id


def test_invalid_status_rejected(store):
    task = store.add("Задача")
    with pytest.raises(ValueError):
        store.set_status(task.task_id, "sent")


def test_save_work_and_export(store, tmp_path):
    task = store.add("Текст для клиента")
    with pytest.raises(ValueError):
        store.export_result(task.task_id, directory=tmp_path / "out")
    store.save_work(task.task_id, "Готовая работа.")
    path = store.export_result(task.task_id, directory=tmp_path / "out")
    text = path.read_text(encoding="utf-8")
    assert "Текст для клиента" in text
    assert "Готовая работа." in text


def test_add_from_order(store):
    order = Order(
        order_id="42",
        title="Сделать сайт",
        url="https://example.com/42",
        budget=5000.0,
        source="fl.ru",
        description="",
    )
    task = store.add_from_order(order)
    assert task.title == "Сделать сайт"
    assert task.source == "fl.ru"
    assert task.budget == 5000.0


def test_tasks_file_has_no_passwords(store, tmp_path):
    store.add("Задача", source="fl.ru")
    raw = (tmp_path / "tasks.json").read_text(encoding="utf-8")
    data = json.loads(raw)
    assert "password" not in raw.lower()
    assert set(data) == {"tasks"}


def test_corrupt_file_ignored(tmp_path):
    path = tmp_path / "tasks.json"
    path.write_text("{broken", encoding="utf-8")
    store = TaskStore(path=path)
    assert store.list_tasks() == []


def test_status_labels_cover_order():
    assert set(STATUS_ORDER) == set(
        __import__(
            "jarvis_atmosphere.jobs.tasks", fromlist=["STATUS_LABELS"]
        ).STATUS_LABELS
    )


def test_templates_all_kinds():
    from jarvis_atmosphere.jobs.tasks import TEMPLATES, template_text

    for kind in TEMPLATES:
        text = template_text(kind)
        assert text.strip()
    assert template_text("unknown") == TEMPLATES["other"]


def test_task_with_template_workflow(store):
    from jarvis_atmosphere.jobs.tasks import template_text

    task = store.add("Отчёт для клиента")
    store.save_work(task.task_id, template_text("report"))
    loaded = store.get(task.task_id)
    assert "## Что сделано" in loaded.work
    path = store.export_result(loaded.task_id)
    assert "Отчёт для клиента" in path.read_text(encoding="utf-8")
