"""Точка входа модуля заказов: python -m jarvis_atmosphere.jobs [опции]"""

from __future__ import annotations

import argparse
import getpass
import sys
import time as time_module

from .drafts import generate_draft, save_draft
from .keystore import KeystoreError, bind_accounts, save_password
from .monitor import Monitor
from .schedule import seconds_until
from .settings import Account, Settings
from .sources import Order


def on_new_order(order: Order, settings: Settings) -> None:
    draft = generate_draft(order, settings)
    path = save_draft(order, draft)
    budget = f", бюджет {order.budget:g} руб." if order.budget else ""
    print(f"Новый заказ: [{order.source}] {order.title}{budget}")
    print(f"  {order.url}")
    print(f"  Черновик: {path}\n")


def _report_binding(settings: Settings) -> None:
    for (platform, login), is_bound in bind_accounts(settings.accounts).items():
        state = "пароль привязан" if is_bound else "пароль не задан"
        print(f"Аккаунт {platform} ({login}): {state}.")


def run_once(settings: Settings) -> int:
    _report_binding(settings)
    monitor = Monitor(settings)
    new_orders, errors = monitor.poll()
    for order in new_orders:
        on_new_order(order, settings)
    for message in errors:
        print(f"Ошибка источника: {message}", file=sys.stderr)
    if not new_orders:
        print("Новых подходящих заказов нет.")
    return 0


def run_auto(settings: Settings) -> int:
    _report_binding(settings)
    if settings.auto_start_time:
        wait = seconds_until(settings.auto_start_time)
        print(
            f"Автозапуск по расписанию в {settings.auto_start_time} "
            f"(через {wait / 3600:.1f} ч.). Ctrl+C — отмена."
        )
        time_module.sleep(wait)
    monitor = Monitor(settings)
    print(
        f"Авто-режим: опрос каждые {settings.poll_interval_minutes} мин., "
        f"источники: {', '.join(settings.sources)}. Ctrl+C — остановка."
    )
    if not settings.keywords:
        print("Ключевые слова не заданы — будут показываться все заказы.")

    def on_error(message: str) -> None:
        print(f"Ошибка источника: {message}", file=sys.stderr)

    try:
        monitor.run_auto(
            lambda order: on_new_order(order, settings),
            on_error=on_error,
        )
    except KeyboardInterrupt:
        print("\nАвто-режим остановлен.")
    return 0


def input_list(prompt: str, current: list[str]) -> list[str]:
    shown = ", ".join(current) if current else "пусто"
    raw = input(f"{prompt} [{shown}]: ").strip()
    if not raw:
        return current
    return [item.strip() for item in raw.split(",") if item.strip()]


def input_float(prompt: str, current: float | None) -> float | None:
    shown = current if current is not None else "нет"
    raw = input(f"{prompt} [{shown}]: ").strip().replace(",", ".")
    if not raw:
        return current
    try:
        return float(raw)
    except ValueError:
        print("  Не число — значение не изменено.")
        return current


def run_settings() -> int:
    settings = Settings.load()
    print("Настройки Джарвиса. Пароли хранятся в системном хранилище ОС.\n")
    settings.wallet_address = (
        input(f"Адрес кошелька [{settings.wallet_address or 'пусто'}]: ").strip()
        or settings.wallet_address
    )
    settings.keywords = input_list("Ключевые слова через запятую", settings.keywords)
    settings.skills = input_list("Навыки через запятую", settings.skills)
    settings.budget_min = input_float("Минимальный бюджет", settings.budget_min)
    settings.budget_max = input_float("Максимальный бюджет", settings.budget_max)
    raw = input(
        f"Автозапуск по времени ЧЧ:ММ [{settings.auto_start_time or 'выкл'}]: "
    ).strip()
    if raw:
        from .schedule import is_valid_time

        if is_valid_time(raw):
            settings.auto_start_time = raw
        else:
            print("  Неверный формат — расписание не изменено.")

    while True:
        raw = input(
            "Добавить аккаунт (платформа,логин) или Enter чтобы закончить: "
        ).strip()
        if not raw:
            break
        parts = [p.strip() for p in raw.split(",", 1)]
        if len(parts) != 2 or not all(parts):
            print("  Формат: платформа,логин")
            continue
        account = Account(platform=parts[0], login=parts[1])
        settings.accounts.append(account)
        password = getpass.getpass(
            f"  Пароль для {account.platform} (Enter — пропустить): "
        )
        if password:
            try:
                save_password(account.platform, account.login, password)
                print("  Пароль сохранён в системное хранилище.")
            except KeystoreError as exc:
                print(f"  {exc}")

    path = settings.save()
    print(f"\nСохранено: {path}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(prog="jarvis_atmosphere.jobs")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--once", action="store_true", help="один опрос источников")
    modes.add_argument("--auto", action="store_true", help="автоматический режим")
    modes.add_argument("--settings", action="store_true", help="настройки в терминале")
    modes.add_argument("--gui", action="store_true", help="окно настроек и монитора")
    args = parser.parse_args()

    if args.gui:
        from .gui import run_gui

        return run_gui()

    settings = Settings.load()
    if args.settings:
        return run_settings()
    if args.auto:
        return run_auto(settings)
    return run_once(settings)


if __name__ == "__main__":
    sys.exit(main())
