"""Точка входа: python -m jarvis_atmosphere [--text]"""

from __future__ import annotations

import argparse
import sys

from . import actions, speech_input, speech_output
from .intents import detect_intent


def handle_phrase(phrase: str, atmosphere: actions.Atmosphere) -> tuple[str, bool]:
    intent = detect_intent(phrase)
    if intent is None:
        intent = actions.Intent("unknown")
    reply = actions.execute(intent, atmosphere)
    return reply, intent.name == "exit"


def run_text_loop(use_voice: bool) -> int:
    atmosphere = actions.Atmosphere()
    print("Текстовый режим. «Помощь» — список команд, «отбой» — выход.")
    while True:
        try:
            phrase = input("Вы: ")
        except (EOFError, KeyboardInterrupt):
            print()
            return 0
        reply, should_exit = handle_phrase(phrase, atmosphere)
        speech_output.speak(reply, use_voice=use_voice)
        if should_exit:
            return 0


def run_voice_loop(use_voice: bool) -> int:
    atmosphere = actions.Atmosphere()
    print("Голосовой режим. Скажите «Джарвис» и команду. «Отбой» — выход.")
    while True:
        try:
            phrase = speech_input.listen()
        except speech_input.SpeechInputError as exc:
            print(f"Ошибка: {exc}", file=sys.stderr)
            print("Переключаюсь в текстовый режим.")
            return run_text_loop(use_voice)
        if not phrase:
            continue
        print(f"Вы: {phrase}")
        reply, should_exit = handle_phrase(phrase, atmosphere)
        speech_output.speak(reply, use_voice=use_voice)
        if should_exit:
            return 0


def main() -> int:
    parser = argparse.ArgumentParser(prog="jarvis_atmosphere")
    parser.add_argument(
        "--text",
        action="store_true",
        help="текстовый режим (без микрофона)",
    )
    parser.add_argument(
        "--no-voice",
        action="store_true",
        help="не озвучивать ответы",
    )
    parser.add_argument("phrase", nargs="*", help="одна команда без запуска цикла")
    args = parser.parse_args()

    if args.phrase:
        atmosphere = actions.Atmosphere()
        reply, _ = handle_phrase(" ".join(args.phrase), atmosphere)
        speech_output.speak(reply, use_voice=False)
        return 0

    use_voice = not args.no_voice
    if args.text:
        return run_text_loop(use_voice)
    return run_voice_loop(use_voice)


if __name__ == "__main__":
    sys.exit(main())
