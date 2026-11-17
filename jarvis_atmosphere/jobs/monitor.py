"""Автоматический монитор заказов: опрос источников и фильтрация."""

from __future__ import annotations

import time
from collections.abc import Callable, Iterable

from .sources import Order, SourceError, fetch_rss
from .settings import Settings


class Monitor:
    def __init__(
        self,
        settings: Settings,
        fetcher: Callable[[str, str], list[Order]] = fetch_rss,
        seen_ids: set[str] | None = None,
    ) -> None:
        self.settings = settings
        self.fetcher = fetcher
        self.seen_ids: set[str] = seen_ids if seen_ids is not None else set()

    def poll(self) -> tuple[list[Order], list[str]]:
        new_orders: list[Order] = []
        errors: list[str] = []
        for source, url in self.settings.sources.items():
            try:
                orders = self.fetcher(url, source)
            except SourceError as exc:
                errors.append(str(exc))
                continue
            for order in orders:
                if order.order_id in self.seen_ids:
                    continue
                self.seen_ids.add(order.order_id)
                if self.matches(order):
                    new_orders.append(order)
        return new_orders, errors

    def matches(self, order: Order) -> bool:
        haystack = f"{order.title} {order.description}".lower()
        if self.settings.keywords:
            if not any(k.lower() in haystack for k in self.settings.keywords):
                return False
        if order.budget is None:
            return True
        if self.settings.budget_min is not None and order.budget < self.settings.budget_min:
            return False
        if self.settings.budget_max is not None and order.budget > self.settings.budget_max:
            return False
        return True

    def run_auto(
        self,
        on_new: Callable[[Order], None],
        on_error: Callable[[str], None] | None = None,
        iterations: int | None = None,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        interval = max(1, self.settings.poll_interval_minutes) * 60
        count = 0
        while True:
            new_orders, errors = self.poll()
            for order in new_orders:
                on_new(order)
            if on_error is not None:
                for message in errors:
                    on_error(message)
            count += 1
            if iterations is not None and count >= iterations:
                return
            sleep(interval)


def merge_seen(orders: Iterable[Order]) -> set[str]:
    return {order.order_id for order in orders}
