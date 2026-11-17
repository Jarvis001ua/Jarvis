"""Тесты действий и состояния атмосферы."""

from jarvis_atmosphere import actions
from jarvis_atmosphere.intents import Intent


def test_scene_changes_state():
    atmosphere = actions.Atmosphere()
    reply = actions.execute(Intent("scene", "night"), atmosphere)
    assert "Ночь" in reply
    assert atmosphere.scene == "night"
    assert atmosphere.music_on is False
    assert atmosphere.light == 0.1


def test_scene_party_enables_music():
    atmosphere = actions.Atmosphere()
    actions.execute(Intent("scene", "party"), atmosphere)
    assert atmosphere.music_on is True
    assert atmosphere.volume == 0.9


def test_unknown_scene_rejected():
    atmosphere = actions.Atmosphere()
    reply = atmosphere.apply_scene("космос")
    assert "Неизвестный режим" in reply
    assert atmosphere.scene == "focus"


def test_light_clamped():
    atmosphere = actions.Atmosphere()
    atmosphere.light = 1.0
    assert "100%" in atmosphere.adjust_light(+0.5)
    atmosphere.light = 0.0
    assert "0%" in atmosphere.adjust_light(-0.5)


def test_music_toggle():
    atmosphere = actions.Atmosphere()
    actions.execute(Intent("music_on"), atmosphere)
    assert atmosphere.music_on is True
    actions.execute(Intent("music_off"), atmosphere)
    assert atmosphere.music_on is False


def test_time_and_date_replies():
    assert "Сейчас" in actions.current_time()
    assert "Сегодня" in actions.current_date()


def test_status_format():
    atmosphere = actions.Atmosphere()
    assert "Режим" in atmosphere.status
    assert "Свет" in atmosphere.status


def test_unknown_intent_reply():
    reply = actions.execute(Intent("unknown"), actions.Atmosphere())
    assert "Не расслышал" in reply


def test_exit_reply():
    reply = actions.execute(Intent("exit"), actions.Atmosphere())
    assert "Завершаю" in reply
