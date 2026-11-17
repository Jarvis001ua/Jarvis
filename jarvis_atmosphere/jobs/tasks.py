"""Рабочее место выполнения принятых заказов.

Программа не отправляет работы сама: она хранит очередь задач,
текст работы и готовит файл результата, который пользователь
отправляет заказчику вручную через биржу.
"""

from __future__ import annotations

import json
import re
import time
import uuid
from dataclasses import asdict, dataclass, field
from pathlib import Path

from .sources import Order

TASKS_FILE = Path.home() / ".jarvis_atmosphere" / "tasks.json"
RESULTS_DIR = Path.home() / ".jarvis_atmosphere" / "results"

STATUS_LABELS = {
    "new": "новая",
    "in_progress": "в работе",
    "review": "на проверке",
    "done": "выполнено",
}
STATUS_ORDER = ("new", "in_progress", "review", "done")

TEMPLATES = {
    "text": (
        "# Название работы\n\n\n"
        "## Введение\n(о чём работа, 2-3 предложения)\n\n"
        "## Основная часть\n(главные мысли по пунктам)\n\n"
        "## Вывод\n(итог для заказчика)\n"
    ),
    "code": (
        "# Что делает программа\n\n\n"
        "## Как запустить\n1. …\n2. …\n\n"
        "## Код\n(вставьте код здесь)\n\n"
        "## Что проверено\n- …\n"
    ),
    "report": (
        "# Отчёт\n\n\n"
        "## Задача\n(что было нужно заказчику)\n\n"
        "## Что сделано\n1. …\n2. …\n\n"
        "## Результат и рекомендации\n- …\n"
    ),
    "other": (
        "# Название работы\n\n\n"
        "## Что сделано\n1. …\n2. …\n\n"
        "## Как пользоваться результатом\n- …\n"
    ),
}
TEMPLATE_LABELS = {
    "text": "Текст / статья",
    "code": "Код / программа",
    "report": "Отчёт",
    "other": "Другое",
}


def template_text(kind: str) -> str:
    return TEMPLATES.get(kind, TEMPLATES["other"])


@dataclass
class Task:
    task_id: str
    title: str
    source: str = ""
    url: str = ""
    budget: float | None = None
    status: str = "new"
    work: str = ""
    updated: float = field(default_factory=time.time)


class TaskStore:
    def __init__(self, path: Path | None = None) -> None:
        self.path = path or TASKS_FILE
        self._tasks: dict[str, Task] = {}
        self._load()

    def _load(self) -> None:
        if not self.path.exists():
            return
        try:
            data = json.loads(self.path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            return
        for item in data.get("tasks", []):
            known = {f for f in Task.__dataclass_fields__ if f in item}
            task = Task(**{f: item[f] for f in known})
            if task.status not in STATUS_ORDER:
                task.status = "new"
            self._tasks[task.task_id] = task

    def _save(self) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        payload = {"tasks": [asdict(t) for t in self.list_tasks()]}
        self.path.write_text(
            json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8"
        )

    def list_tasks(self, status: str | None = None) -> list[Task]:
        tasks = sorted(self._tasks.values(), key=lambda t: t.updated, reverse=True)
        if status:
            return [t for t in tasks if t.status == status]
        return tasks

    def get(self, task_id: str) -> Task | None:
        return self._tasks.get(task_id)

    def add(
        self,
        title: str,
        source: str = "",
        url: str = "",
        budget: float | None = None,
    ) -> Task:
        title = title.strip()
        if not title:
            raise ValueError("title")
        task_id = uuid.uuid4().hex[:12]
        task = Task(task_id=task_id, title=title, source=source, url=url, budget=budget)
        self._tasks[task_id] = task
        self._save()
        return task

    def add_from_order(self, order: Order) -> Task:
        return self.add(
            title=order.title, source=order.source, url=order.url, budget=order.budget
        )

    def set_status(self, task_id: str, status: str) -> Task:
        if status not in STATUS_ORDER:
            raise ValueError("status")
        task = self._tasks[task_id]
        task.status = status
        task.updated = time.time()
        self._save()
        return task

    def save_work(self, task_id: str, text: str) -> Task:
        task = self._tasks[task_id]
        task.work = text
        task.updated = time.time()
        self._save()
        return task

    def remove(self, task_id: str) -> None:
        self._tasks.pop(task_id, None)
        self._save()

    def export_result(self, task_id: str, directory: Path | None = None) -> Path:
        task = self._tasks[task_id]
        if not task.work.strip():
            raise ValueError("work")
        directory = directory or RESULTS_DIR
        directory.mkdir(parents=True, exist_ok=True)
        safe = re.sub(r"[^\w.-]", "_", task.title)[:50] or "task"
        path = directory / f"{safe}_{task.task_id}.md"
        body = (
            f"# {task.title}\n\n"
            f"Статус: {STATUS_LABELS[task.status]}\n\n"
            f"---\n\n{task.work.strip()}\n"
        )
        path.write_text(body, encoding="utf-8")
        return path
