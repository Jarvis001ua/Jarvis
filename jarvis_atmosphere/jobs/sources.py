"""Публичные RSS-источники заказов и их разбор (только stdlib)."""

from __future__ import annotations

import re
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from urllib.error import URLError
from urllib.request import Request, urlopen

BUDGET_RE = re.compile(
    r"(\d[\d\s\u00a0]*(?:[.,]\d+)?)\s*(?:руб|₽|р\.)", re.IGNORECASE
)

USER_AGENT = "JarvisAtmosphere/0.1 (+order monitor)"


class SourceError(RuntimeError):
    pass


@dataclass(frozen=True)
class Order:
    source: str
    order_id: str
    title: str
    url: str
    description: str
    budget: float | None = None


def parse_budget(text: str) -> float | None:
    match = BUDGET_RE.search(text)
    if not match:
        return None
    raw = match.group(1).replace("\u00a0", "").replace(" ", "").replace(",", ".")
    try:
        return float(raw)
    except ValueError:
        return None


def _local(tag: str) -> str:
    return tag.rsplit("}", 1)[-1]


def parse_rss(xml_text: str, source: str) -> list[Order]:
    root = ET.fromstring(xml_text)
    orders: list[Order] = []
    for element in root.iter():
        if _local(element.tag) != "item":
            continue
        fields: dict[str, str] = {}
        for child in element:
            fields[_local(child.tag)] = (child.text or "").strip()
        title = fields.get("title", "")
        link = fields.get("link", "")
        if not title or not link:
            continue
        description = fields.get("description", "")
        order_id = fields.get("guid") or link
        orders.append(
            Order(
                source=source,
                order_id=order_id,
                title=title,
                url=link,
                description=description,
                budget=parse_budget(f"{title} {description}"),
            )
        )
    return orders


def fetch_rss(url: str, source: str, timeout: int = 15) -> list[Order]:
    request = Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urlopen(request, timeout=timeout) as response:
            xml_text = response.read().decode("utf-8", errors="replace")
    except (URLError, TimeoutError, OSError) as exc:
        raise SourceError(f"{source}: {exc}") from exc
    try:
        return parse_rss(xml_text, source)
    except ET.ParseError as exc:
        raise SourceError(f"{source}: некорректный RSS: {exc}") from exc
