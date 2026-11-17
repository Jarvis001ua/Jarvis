"""Локальные настройки профиля.

Файл хранится вне репозитория: ~/.jarvis_atmosphere/settings.json.
Пароли не сохраняются никогда — только публичные данные: адрес кошелька,
логины аккаунтов, ключевые слова, бюджет и навыки.
"""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass, field
from pathlib import Path

DEFAULT_SOURCES: dict[str, str] = {
    "fl.ru": "https://www.fl.ru/rss/all.xml",
    "habr": "https://freelance.habr.com/rss/projects",
}

DEFAULT_DIR = Path.home() / ".jarvis_atmosphere"
DEFAULT_PATH = DEFAULT_DIR / "settings.json"


@dataclass
class Account:
    platform: str
    login: str


@dataclass
class Settings:
    wallet_address: str = ""
    accounts: list[Account] = field(default_factory=list)
    keywords: list[str] = field(default_factory=list)
    skills: list[str] = field(default_factory=list)
    budget_min: float | None = None
    budget_max: float | None = None
    sources: dict[str, str] = field(default_factory=lambda: dict(DEFAULT_SOURCES))
    poll_interval_minutes: int = 30
    auto_start_time: str = ""

    @classmethod
    def load(cls, path: Path | None = None) -> "Settings":
        path = path or DEFAULT_PATH
        if not path.exists():
            return cls()
        data = json.loads(path.read_text(encoding="utf-8"))
        data["accounts"] = [Account(**a) for a in data.get("accounts", [])]
        known = set(cls.__dataclass_fields__)
        return cls(**{k: v for k, v in data.items() if k in known})

    def save(self, path: Path | None = None) -> Path:
        path = path or DEFAULT_PATH
        path.parent.mkdir(parents=True, exist_ok=True)
        data = asdict(self)
        data["accounts"] = [asdict(a) for a in self.accounts]
        path.write_text(
            json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        return path
