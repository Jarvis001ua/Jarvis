"""Тесты цикла обработки фраз."""

from jarvis_atmosphere import actions
from jarvis_atmosphere.__main__ import handle_phrase


def make():
    return actions.Atmosphere()


def test_greeting_does_not_exit():
    reply, should_exit = handle_phrase("привет джарвис", make())
    assert should_exit is False
    assert reply


def test_exit_signals_shutdown():
    reply, should_exit = handle_phrase("отбой", make())
    assert should_exit is True
    assert "Завершаю" in reply


def test_unknown_phrase_replies_but_keeps_running():
    reply, should_exit = handle_phrase("абракадабра", make())
    assert should_exit is False
    assert "Не расслышал" in reply


def test_scene_applied_once():
    atmosphere = make()
    handle_phrase("включи режим ночь", atmosphere)
    assert atmosphere.light == 0.1
    handle_phrase("приглуши свет", atmosphere)
    assert atmosphere.light == 0.0
