"""Распознавание намерений по основам слов (ru/en)."""

from dataclasses import dataclass


@dataclass(frozen=True)
class Intent:
    name: str
    slot: str | None = None


KEYWORDS: dict[str, tuple[str, ...]] = {
    "greeting": ("привет", "здравств", "доброе утро", "добрый день", "hello"),
    "time": ("время", "который час", "time"),
    "date": ("дат", "какое сегодня число", "день недели", "date"),
    "scene": ("режим", "сцен", "атмосфер", "scene", "mode"),
    "music_on": ("включи музык", "запусти музык", "play music"),
    "music_off": ("выключи музык", "останови музык", "stop music"),
    "light_up": ("светле", "ярче", "light up", "brighter"),
    "light_down": ("темне", "приглуши свет", "dim", "darker"),
    "weather": ("погод", "weather"),
    "status": ("статус", "как дел", "status", "how are you"),
    "help": ("помощ", "что ты умеешь", "команд", "help", "commands"),
    "exit": ("выход", "стоп", "заверш", "отбой", "exit", "quit", "stop"),
}

SCENE_WORDS: dict[str, tuple[str, ...]] = {
    "focus": ("фокус", "работ", "focus", "work"),
    "relax": ("релакс", "отдых", "relax", "rest"),
    "night": ("ноч", "сон", "night", "sleep"),
    "party": ("вечеринк", "тусовк", "party"),
}


def normalize(text: str) -> str:
    return " ".join(text.lower().strip().split())


def detect_intent(text: str) -> Intent | None:
    phrase = normalize(text)
    if not phrase:
        return None

    for scene, words in SCENE_WORDS.items():
        if any(w in phrase for w in words) and any(
            k in phrase for k in KEYWORDS["scene"]
        ):
            return Intent("scene", scene)

    for name, words in KEYWORDS.items():
        if any(w in phrase for w in words):
            slot = None
            if name == "scene":
                slot = _scene_from_phrase(phrase)
            return Intent(name, slot)
    return None


def _scene_from_phrase(phrase: str) -> str | None:
    for scene, words in SCENE_WORDS.items():
        if any(w in phrase for w in words):
            return scene
    return None
