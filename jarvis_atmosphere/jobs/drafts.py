"""Автогенерация черновиков откликов."""

from __future__ import annotations

import re
from pathlib import Path

from .settings import Settings
from .sources import Order

DRAFTS_DIR = Path.home() / ".jarvis_atmosphere" / "drafts"


def _clean(text: str) -> str:
    text = re.sub(r"<[^>]+>", " ", text)
    return " ".join(text.split())


def _account_for(order: Order, settings: Settings) -> str | None:
    for account in settings.accounts:
        platform = account.platform.lower().removesuffix(".ru").removesuffix(".com")
        if platform and platform in order.source.lower():
            return account.login
    return None


def generate_draft(order: Order, settings: Settings) -> str:
    title = _clean(order.title)
    topic = _clean(order.description) or title
    skills = ", ".join(settings.skills) if settings.skills else "готов разобрать задачу"
    name = _account_for(order, settings) or "Джарвис Атмосфера"
    budget = f"Бюджет в объявлении: {order.budget:g} руб. " if order.budget else ""
    return (
        f"Здравствуйте!\n\n"
        f"Увидел ваше задание «{title}».\n"
        f"Как я понял задачу: {topic[:300]}.\n"
        f"{budget}Мои навыки: {skills}.\n"
        f"Готов начать сразу, сроки и детали обсудим в чате.\n\n"
        f"С уважением,\n{name}"
    )


def save_draft(order: Order, text: str, directory: Path | None = None) -> Path:
    directory = directory or DRAFTS_DIR
    directory.mkdir(parents=True, exist_ok=True)
    safe_source = re.sub(r"[^\w.-]", "_", order.source)
    safe_id = re.sub(r"[^\w.-]", "_", order.order_id)[-60:]
    path = directory / f"{safe_source}_{safe_id}.md"
    body = (
        f"# {order.title}\n\n"
        f"Источник: {order.source}\nСсылка: {order.url}\n\n"
        f"---\n\n{text}\n"
    )
    path.write_text(body, encoding="utf-8")
    return path
