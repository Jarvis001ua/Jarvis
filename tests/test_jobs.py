"""Тесты модуля заказов: настройки, RSS, монитор, черновики, расписание."""

import json
from datetime import datetime

import pytest

from jarvis_atmosphere.jobs import drafts, keystore, monitor, schedule, sources
from jarvis_atmosphere.jobs.settings import Account, Settings

SAMPLE_RSS = """<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0"><channel>
<item>
  <title>Разработка бота на Python</title>
  <link>https://example.com/order/1</link>
  <description>Нужен бот. Бюджет 5000 руб.</description>
  <guid>order-1</guid>
</item>
<item>
  <title>Дизайн лендинга</title>
  <link>https://example.com/order/2</link>
  <description>Срочно, бюджет 20000 руб.</description>
</item>
</channel></rss>"""


def make_settings(**overrides) -> Settings:
    settings = Settings(sources={"fl.ru": "https://example.com/fl.xml"})
    for key, value in overrides.items():
        setattr(settings, key, value)
    return settings


def make_order(**overrides) -> sources.Order:
    defaults = dict(
        source="fl.ru",
        order_id="order-1",
        title="Разработка бота на Python",
        url="https://example.com/order/1",
        description="Нужен бот. Бюджет 5000 руб.",
        budget=5000.0,
    )
    defaults.update(overrides)
    return sources.Order(**defaults)


def test_settings_roundtrip(tmp_path):
    path = tmp_path / "settings.json"
    settings = Settings(
        wallet_address="TRX123",
        accounts=[Account(platform="fl.ru", login="ivan")],
        keywords=["бот", "python"],
        skills=["Python", "aiogram"],
        budget_min=1000,
        budget_max=50000,
        auto_start_time="09:30",
    )
    settings.save(path)
    loaded = Settings.load(path)
    assert loaded.wallet_address == "TRX123"
    assert loaded.accounts == [Account(platform="fl.ru", login="ivan")]
    assert loaded.keywords == ["бот", "python"]
    assert loaded.auto_start_time == "09:30"


def test_settings_file_has_no_password_field(tmp_path):
    path = tmp_path / "settings.json"
    make_settings(wallet_address="X").save(path)
    assert "password" not in json.loads(path.read_text(encoding="utf-8"))


def test_settings_missing_file_returns_defaults(tmp_path):
    loaded = Settings.load(tmp_path / "absent.json")
    assert loaded.wallet_address == ""
    assert loaded.poll_interval_minutes == 30


def test_parse_rss():
    orders = sources.parse_rss(SAMPLE_RSS, "fl.ru")
    assert len(orders) == 2
    assert orders[0].title == "Разработка бота на Python"
    assert orders[0].budget == 5000.0
    assert orders[1].order_id == "https://example.com/order/2"


def test_parse_budget_variants():
    assert sources.parse_budget("10 000 руб.") == 10000.0
    assert sources.parse_budget("1 500₽") == 1500.0
    assert sources.parse_budget("без бюджета") is None


def test_monitor_filters_by_keyword_and_budget():
    settings = make_settings(keywords=["бот"], budget_min=1000, budget_max=10000)
    mon = monitor.Monitor(settings)
    assert mon.matches(make_order())
    assert not mon.matches(make_order(title="Дизайн", description="лендинг"))
    assert not mon.matches(make_order(budget=99999.0))


def test_monitor_deduplicates_and_reports_errors():
    seen = monitor.merge_seen([make_order()])
    fetched: dict[str, list[sources.Order]] = {"fl.ru": [make_order()]}
    mon = monitor.Monitor(make_settings(), fetcher=lambda url, s: fetched[s], seen_ids=seen)
    new_orders, errors = mon.poll()
    assert new_orders == []

    def broken(url, source):
        raise sources.SourceError("сеть недоступна")

    mon2 = monitor.Monitor(make_settings(), fetcher=broken)
    new_orders, errors = mon2.poll()
    assert new_orders == []
    assert errors == ["сеть недоступна"]


def test_monitor_run_auto_calls_callback():
    orders = [make_order(), make_order(order_id="order-2")]
    iterator = iter([orders, []])
    mon = monitor.Monitor(
        make_settings(), fetcher=lambda url, s: next(iterator)
    )
    received = []
    sleeps = []
    mon.run_auto(received.append, iterations=2, sleep=sleeps.append)
    assert len(received) == 2
    assert sleeps == [1800]


def test_generate_draft_uses_profile():
    settings = make_settings(
        skills=["Python", "aiogram"],
        accounts=[Account(platform="fl.ru", login="ivan")],
    )
    text = drafts.generate_draft(make_order(), settings)
    assert "Разработка бота на Python" in text
    assert "Python, aiogram" in text
    assert "ivan" in text
    assert "5000" in text


def test_draft_saved_to_file(tmp_path):
    path = drafts.save_draft(make_order(), "текст черновика", tmp_path)
    content = path.read_text(encoding="utf-8")
    assert "текст черновика" in content
    assert "https://example.com/order/1" in content


def test_keystore_roundtrip(monkeypatch):
    class FakeKeyring:
        store = {}

        def set_password(self, service, key, password):
            self.store[(service, key)] = password

        def get_password(self, service, key):
            return self.store.get((service, key))

    fake = FakeKeyring()
    monkeypatch.setitem(__import__("sys").modules, "keyring", fake)
    keystore.save_password("fl.ru", "ivan", "secret")
    assert keystore.load_password("fl.ru", "ivan") == "secret"
    bound = keystore.bind_accounts([Account(platform="fl.ru", login="ivan")])
    assert bound == {("fl.ru", "ivan"): True}
    assert keystore.load_password("fl.ru", "other") is None


def test_schedule():
    now = datetime(2026, 11, 17, 10, 0)
    assert schedule.seconds_until("11:00", now) == 3600.0
    assert schedule.seconds_until("09:00", now) == 23 * 3600.0
    assert schedule.is_valid_time("09:30")
    assert not schedule.is_valid_time("25:00")
    assert not schedule.is_valid_time("завтра")
    with pytest.raises(ValueError):
        schedule.seconds_until("99:99", now)
