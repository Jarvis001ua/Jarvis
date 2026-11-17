"""Тесты распознавания намерений."""

import pytest

from jarvis_atmosphere.intents import detect_intent


@pytest.mark.parametrize(
    "phrase,name",
    [
        ("привет, Джарвис", "greeting"),
        ("Джарвис, который час?", "time"),
        ("сколько время", "time"),
        ("какое сегодня число", "date"),
        ("включи музыку", "music_on"),
        ("выключи музыку", "music_off"),
        ("сделай светлее", "light_up"),
        ("приглуши свет", "light_down"),
        ("какая погода", "weather"),
        ("как дела", "status"),
        ("что ты умеешь", "help"),
        ("отбой", "exit"),
        ("hello jarvis", "greeting"),
        ("what time is it", "time"),
    ],
)
def test_detects_intents(phrase, name):
    intent = detect_intent(phrase)
    assert intent is not None
    assert intent.name == name


@pytest.mark.parametrize(
    "phrase,slot",
    [
        ("включи режим фокус", "focus"),
        ("режим ночь", "night"),
        ("атмосфера релакс", "relax"),
        ("включи сцену вечеринка", "party"),
        ("режим работы", "focus"),
    ],
)
def test_detects_scene_with_slot(phrase, slot):
    intent = detect_intent(phrase)
    assert intent is not None
    assert intent.name == "scene"
    assert intent.slot == slot


@pytest.mark.parametrize("phrase", ["", "   ", "абракадабра", "12345"])
def test_unknown_phrase_returns_none(phrase):
    assert detect_intent(phrase) is None


def test_scene_without_scene_keyword_is_not_scene():
    intent = detect_intent("отдых")
    assert intent is None or intent.name != "scene"
