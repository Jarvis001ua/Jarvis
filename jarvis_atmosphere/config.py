"""Настройки ассистента."""

WAKE_WORDS = ("джарвис", "jarvis")

LANGUAGE = "ru-RU"

SCENES = {
    "focus": {
        "name": "Фокус",
        "light": 0.8,
        "music": "lo-fi",
        "volume": 0.5,
        "sounds": [],
    },
    "relax": {
        "name": "Релакс",
        "light": 0.4,
        "music": "ambient",
        "volume": 0.4,
        "sounds": ["дождь"],
    },
    "night": {
        "name": "Ночь",
        "light": 0.1,
        "music": None,
        "volume": 0.2,
        "sounds": ["белый шум"],
    },
    "party": {
        "name": "Вечеринка",
        "light": 1.0,
        "music": "dance",
        "volume": 0.9,
        "sounds": [],
    },
}

DEFAULT_SCENE = "focus"
