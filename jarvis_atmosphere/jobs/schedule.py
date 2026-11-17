"""Автозапуск по времени: расчёт задержки до назначенного часа."""

from __future__ import annotations

from datetime import datetime, timedelta


def is_valid_time(hhmm: str) -> bool:
    try:
        datetime.strptime(hhmm, "%H:%M")
    except (ValueError, TypeError):
        return False
    return True


def seconds_until(hhmm: str, now: datetime | None = None) -> float:
    if not is_valid_time(hhmm):
        raise ValueError(f"Неверное время: {hhmm!r} (формат ЧЧ:ММ)")
    target = datetime.strptime(hhmm, "%H:%M").time()
    now = now or datetime.now()
    candidate = now.replace(
        hour=target.hour, minute=target.minute, second=0, microsecond=0
    )
    if candidate <= now:
        candidate += timedelta(days=1)
    return (candidate - now).total_seconds()
