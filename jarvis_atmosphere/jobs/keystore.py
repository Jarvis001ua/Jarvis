"""Безопасное хранение паролей в системном хранилище (keyring).

Пароли никогда не пишутся в файлы проекта и не попадают в настройки:
settings.json содержит только логины. Сами пароли лежат в системном
хранилище ОС (Windows Credential Manager / macOS Keychain / Secret Service)
и подхватываются при каждом запуске.
"""

from __future__ import annotations

from .settings import Account

SERVICE = "jarvis-atmosphere"


class KeystoreError(RuntimeError):
    pass


def _key(platform: str, login: str) -> str:
    return f"{platform}:{login}"


def save_password(platform: str, login: str, password: str) -> None:
    try:
        import keyring
    except ImportError as exc:
        raise KeystoreError(
            "Модуль keyring не установлен: pip install keyring"
        ) from exc
    keyring.set_password(SERVICE, _key(platform, login), password)


def load_password(platform: str, login: str) -> str | None:
    try:
        import keyring
    except ImportError:
        return None
    return keyring.get_password(SERVICE, _key(platform, login))


def delete_password(platform: str, login: str) -> None:
    try:
        import keyring
    except ImportError:
        return
    try:
        keyring.delete_password(SERVICE, _key(platform, login))
    except Exception:
        pass


def bind_accounts(accounts: list[Account]) -> dict[tuple[str, str], bool]:
    """При запуске: какие аккаунты имеют сохранённый пароль в хранилище."""
    return {
        (account.platform, account.login): load_password(
            account.platform, account.login
        )
        is not None
        for account in accounts
    }
