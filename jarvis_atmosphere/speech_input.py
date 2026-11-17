"""Ввод речи через микрофон (опционально, требует SpeechRecognition)."""

from __future__ import annotations


class SpeechInputError(RuntimeError):
    pass


def listen(timeout: int = 5, phrase_limit: int = 5) -> str:
    try:
        import speech_recognition
    except ImportError as exc:
        raise SpeechInputError(
            "Модуль speech_recognition не установлен. "
            "Установите зависимости: pip install -r requirements.txt"
        ) from exc

    recognizer = speech_recognition.Recognizer()
    try:
        with speech_recognition.Microphone() as source:
            recognizer.adjust_for_ambient_noise(source, duration=0.5)
            audio = recognizer.listen(
                source, timeout=timeout, phrase_time_limit=phrase_limit
            )
    except Exception as exc:
        raise SpeechInputError(
            f"Микрофон недоступен (проверьте, что установлен PyAudio): {exc}"
        ) from exc

    try:
        return recognizer.recognize_google(audio, language="ru-RU")
    except speech_recognition.UnknownValueError:
        return ""
    except speech_recognition.RequestError as exc:
        raise SpeechInputError(f"Сервис распознавания недоступен: {exc}") from exc
