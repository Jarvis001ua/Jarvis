"""Выполнение действий ассистента."""

from __future__ import annotations

import datetime
import random

from . import config
from .intents import Intent

RESPONSES = {
    "greeting": (
        "Слушаю вас, сэр.",
        "К вашим услугам.",
        "Я на связи.",
    ),
    "music_on": ("Включаю музыку.", "Запускаю воспроизведение."),
    "music_off": ("Музыка выключена.", "Останавливаю воспроизведение."),
    "light_up": ("Делаю ярче.", "Увеличиваю освещение."),
    "light_down": ("Приглушаю свет.", "Уменьшаю освещение."),
    "unknown": ("Не расслышал команду. Скажите «помощь».",),
    "exit": ("Завершаю работу. До встречи, сэр.",),
}


class Atmosphere:
    def __init__(self) -> None:
        self.scene: str = config.DEFAULT_SCENE
        self.light: float = config.SCENES[self.scene]["light"]
        self.volume: float = config.SCENES[self.scene]["volume"]
        self.music_on: bool = False

    def apply_scene(self, scene: str) -> str:
        if scene not in config.SCENES:
            return f"Неизвестный режим: {scene}."
        self.scene = scene
        preset = config.SCENES[scene]
        self.light = preset["light"]
        self.volume = preset["volume"]
        self.music_on = preset["music"] is not None
        return f"Режим «{preset['name']}» активирован."

    def adjust_light(self, delta: float) -> str:
        self.light = min(1.0, max(0.0, self.light + delta))
        level = int(self.light * 100)
        return f"Освещение: {level}%."

    @property
    def status(self) -> str:
        preset = config.SCENES[self.scene]
        music = "включена" if self.music_on else "выключена"
        return (
            f"Режим: {preset['name']}. Свет: {int(self.light * 100)}%. "
            f"Громкость: {int(self.volume * 100)}%. Музыка: {music}."
        )


def current_time() -> str:
    now = datetime.datetime.now()
    return f"Сейчас {now.strftime('%H:%M')}."


def current_date() -> str:
    months = (
        "января", "февраля", "марта", "апреля", "мая", "июня",
        "июля", "августа", "сентября", "октября", "ноября", "декабря",
    )
    weekdays = (
        "понедельник", "вторник", "среда", "четверг",
        "пятница", "суббота", "воскресенье",
    )
    now = datetime.date.today()
    return f"Сегодня {now.day} {months[now.month - 1]} {now.year} года, {weekdays[now.weekday()]}."


def weather() -> str:
    return (
        "Для прогноза погоды нужен доступ к сети. "
        "Добавьте API-ключ погодного сервиса в настройки."
    )


def help_text() -> str:
    return (
        "Я умею: говорить время и дату, включать режимы атмосферы "
        "(фокус, релакс, ночь, вечеринка), управлять светом и музыкой, "
        "показывать статус. Для выхода скажите «отбой»."
    )


def execute(intent: Intent, atmosphere: Atmosphere) -> str:
    if intent.name == "greeting":
        return random.choice(RESPONSES["greeting"])
    if intent.name == "time":
        return current_time()
    if intent.name == "date":
        return current_date()
    if intent.name == "scene":
        return atmosphere.apply_scene(intent.slot or config.DEFAULT_SCENE)
    if intent.name == "music_on":
        atmosphere.music_on = True
        return random.choice(RESPONSES["music_on"])
    if intent.name == "music_off":
        atmosphere.music_on = False
        return random.choice(RESPONSES["music_off"])
    if intent.name == "light_up":
        return atmosphere.adjust_light(+0.2)
    if intent.name == "light_down":
        return atmosphere.adjust_light(-0.2)
    if intent.name == "weather":
        return weather()
    if intent.name == "status":
        return atmosphere.status
    if intent.name == "help":
        return help_text()
    if intent.name == "exit":
        return random.choice(RESPONSES["exit"])
    return random.choice(RESPONSES["unknown"])
