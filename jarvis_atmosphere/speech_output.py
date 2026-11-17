"""Вывод речи (pyttsx3) с резервным текстовым режимом."""

from __future__ import annotations

import sys


def speak(text: str, use_voice: bool = True) -> None:
    print(f"Джарвис: {text}")
    if use_voice:
        _say(text)


def _say(text: str) -> None:
    try:
        import pyttsx3
    except ImportError:
        return
    try:
        engine = pyttsx3.init()
        engine.say(text)
        engine.runAndWait()
    except Exception as exc:
        print(f"[голос недоступен: {exc}]", file=sys.stderr)
