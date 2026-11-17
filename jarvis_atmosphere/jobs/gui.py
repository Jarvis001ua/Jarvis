"""Окно настроек и монитора заказов (Tkinter, требуется рабочий стол)."""

from __future__ import annotations

import threading
import time
import tkinter as tk
from tkinter import messagebox, scrolledtext, ttk

from .drafts import generate_draft, save_draft
from .keystore import KeystoreError, bind_accounts, save_password
from .monitor import Monitor
from .schedule import is_valid_time, seconds_until
from .settings import Account, Settings


class JobsApp:
    def __init__(self) -> None:
        self.settings = Settings.load()
        self.monitor = Monitor(self.settings)
        self.root = tk.Tk()
        self.root.title("Джарвис Атмосфера — Заказы")
        self.root.geometry("860x640")
        self.auto_running = False
        self._build()

    def _build(self) -> None:
        notebook = ttk.Notebook(self.root)
        notebook.pack(fill="both", expand=True, padx=8, pady=8)

        settings_frame = ttk.Frame(notebook)
        notebook.add(settings_frame, text="Настройки")
        self._build_settings(settings_frame)

        monitor_frame = ttk.Frame(notebook)
        notebook.add(monitor_frame, text="Монитор заказов")
        self._build_monitor(monitor_frame)

    def _build_settings(self, frame: ttk.Frame) -> None:
        pad = {"padx": 8, "pady": 4}
        ttk.Label(frame, text="Адрес кошелька (для получения оплаты):").grid(
            row=0, column=0, sticky="w", **pad
        )
        self.wallet_entry = ttk.Entry(frame, width=60)
        self.wallet_entry.insert(0, self.settings.wallet_address)
        self.wallet_entry.grid(row=0, column=1, sticky="we", **pad)

        ttk.Label(frame, text="Ключевые слова (через запятую):").grid(
            row=1, column=0, sticky="w", **pad
        )
        self.keywords_entry = ttk.Entry(frame, width=60)
        self.keywords_entry.insert(0, ", ".join(self.settings.keywords))
        self.keywords_entry.grid(row=1, column=1, sticky="we", **pad)

        ttk.Label(frame, text="Навыки (через запятую):").grid(
            row=2, column=0, sticky="w", **pad
        )
        self.skills_entry = ttk.Entry(frame, width=60)
        self.skills_entry.insert(0, ", ".join(self.settings.skills))
        self.skills_entry.grid(row=2, column=1, sticky="we", **pad)

        ttk.Label(frame, text="Бюджет от / до (руб.):").grid(
            row=3, column=0, sticky="w", **pad
        )
        budget_frame = ttk.Frame(frame)
        budget_frame.grid(row=3, column=1, sticky="w", **pad)
        self.budget_min_entry = ttk.Entry(budget_frame, width=12)
        self.budget_min_entry.insert(
            0, "" if self.settings.budget_min is None else str(self.settings.budget_min)
        )
        self.budget_max_entry = ttk.Entry(budget_frame, width=12)
        self.budget_max_entry.insert(
            0, "" if self.settings.budget_max is None else str(self.settings.budget_max)
        )
        self.budget_min_entry.pack(side="left", padx=(0, 6))
        self.budget_max_entry.pack(side="left")

        ttk.Label(frame, text="Автозапуск по времени (ЧЧ:ММ):").grid(
            row=4, column=0, sticky="w", **pad
        )
        self.schedule_entry = ttk.Entry(frame, width=12)
        self.schedule_entry.insert(0, self.settings.auto_start_time)
        self.schedule_entry.grid(row=4, column=1, sticky="w", **pad)

        ttk.Label(
            frame,
            text=(
                "Аккаунты (пароли хранятся в системном хранилище ОС, "
                "в файлах проекта их нет):"
            ),
        ).grid(row=5, column=0, columnspan=2, sticky="w", **pad)

        accounts_frame = ttk.Frame(frame)
        accounts_frame.grid(row=6, column=0, columnspan=2, sticky="we", **pad)
        self.accounts_tree = ttk.Treeview(
            accounts_frame,
            columns=("platform", "login", "status"),
            show="headings",
            height=4,
        )
        self.accounts_tree.heading("platform", text="Платформа")
        self.accounts_tree.heading("login", text="Логин")
        self.accounts_tree.heading("status", text="Пароль")
        self.accounts_tree.pack(side="left", fill="x", expand=True)
        bound = bind_accounts(self.settings.accounts)
        for account in self.settings.accounts:
            status = (
                "привязан"
                if bound.get((account.platform, account.login))
                else "не задан"
            )
            self.accounts_tree.insert(
                "", "end", values=(account.platform, account.login, status)
            )
        buttons = ttk.Frame(accounts_frame)
        buttons.pack(side="left", padx=6)
        ttk.Button(buttons, text="Добавить", command=self._add_account).pack(fill="x")
        ttk.Button(buttons, text="Удалить", command=self._remove_account).pack(
            fill="x", pady=2
        )

        ttk.Button(frame, text="Сохранить настройки", command=self._save).grid(
            row=7, column=1, sticky="e", **pad
        )
        frame.columnconfigure(1, weight=1)

    def _build_monitor(self, frame: ttk.Frame) -> None:
        bar = ttk.Frame(frame)
        bar.pack(fill="x", padx=8, pady=6)
        ttk.Button(bar, text="Проверить сейчас", command=self._poll).pack(side="left")
        self.auto_button = ttk.Button(
            bar, text="Запустить авто-режим", command=self._toggle_auto
        )
        self.auto_button.pack(side="left", padx=6)
        self.log = scrolledtext.ScrolledText(frame, height=24, width=110)
        self.log.pack(fill="both", expand=True, padx=8, pady=6)

    def _add_account(self) -> None:
        dialog = tk.Toplevel(self.root)
        dialog.title("Новый аккаунт")
        ttk.Label(dialog, text="Платформа:").grid(row=0, column=0, padx=6, pady=4)
        platform_entry = ttk.Entry(dialog, width=30)
        platform_entry.grid(row=0, column=1, padx=6, pady=4)
        ttk.Label(dialog, text="Логин:").grid(row=1, column=0, padx=6, pady=4)
        login_entry = ttk.Entry(dialog, width=30)
        login_entry.grid(row=1, column=1, padx=6, pady=4)
        ttk.Label(
            dialog, text="Пароль (в системное хранилище, не в файлы):"
        ).grid(row=2, column=0, padx=6, pady=4)
        password_entry = tk.Entry(dialog, width=30, show="*")
        password_entry.grid(row=2, column=1, padx=6, pady=4)

        def confirm() -> None:
            platform = platform_entry.get().strip()
            login = login_entry.get().strip()
            password = password_entry.get()
            if not platform or not login:
                messagebox.showinfo("Джарвис", "Заполните платформу и логин.")
                return
            status = "не задан"
            if password:
                try:
                    save_password(platform, login, password)
                    status = "привязан"
                except KeystoreError as exc:
                    messagebox.showwarning("Джарвис", str(exc))
            self.accounts_tree.insert("", "end", values=(platform, login, status))
            dialog.destroy()

        ttk.Button(dialog, text="OK", command=confirm).grid(row=3, column=1, sticky="e")

    def _remove_account(self) -> None:
        for item in self.accounts_tree.selection():
            self.accounts_tree.delete(item)

    def _collect_settings(self) -> None:
        self.settings.wallet_address = self.wallet_entry.get().strip()
        self.settings.keywords = [
            k.strip() for k in self.keywords_entry.get().split(",") if k.strip()
        ]
        self.settings.skills = [
            s.strip() for s in self.skills_entry.get().split(",") if s.strip()
        ]
        for field_name, entry in (
            ("budget_min", self.budget_min_entry),
            ("budget_max", self.budget_max_entry),
        ):
            raw = entry.get().strip().replace(",", ".")
            setattr(self.settings, field_name, float(raw) if raw else None)
        raw_schedule = self.schedule_entry.get().strip()
        if raw_schedule and not is_valid_time(raw_schedule):
            raise ValueError("schedule")
        self.settings.auto_start_time = raw_schedule
        self.settings.accounts = [
            Account(platform=row["values"][0], login=row["values"][1])
            for row in (
                self.accounts_tree.item(item)
                for item in self.accounts_tree.get_children()
            )
        ]

    def _save(self) -> None:
        try:
            self._collect_settings()
        except ValueError:
            messagebox.showerror(
                "Джарвис", "Бюджет должен быть числом, время — в формате ЧЧ:ММ."
            )
            return
        path = self.settings.save()
        self.monitor = Monitor(self.settings)
        messagebox.showinfo("Джарвис", f"Настройки сохранены:\n{path}")

    def _log(self, text: str) -> None:
        self.log.insert("end", text + "\n")
        self.log.see("end")

    def _poll(self) -> None:
        try:
            self._collect_settings()
        except ValueError:
            messagebox.showerror("Джарвис", "Время автозапуска — в формате ЧЧ:ММ.")
            return
        self.monitor = Monitor(self.settings)
        new_orders, errors = self.monitor.poll()
        for order in new_orders:
            self._announce(order)
        for message in errors:
            self._log(f"Ошибка источника: {message}")
        if not new_orders and not errors:
            self._log("Новых подходящих заказов нет.")

    def _announce(self, order) -> None:
        draft = generate_draft(order, self.settings)
        path = save_draft(order, draft)
        budget = f", бюджет {order.budget:g} руб." if order.budget else ""
        self._log(f"[{order.source}] {order.title}{budget}")
        self._log(f"  {order.url}")
        self._log(f"  Черновик: {path}")

    def _toggle_auto(self) -> None:
        if self.auto_running:
            self.auto_running = False
            self.auto_button.config(text="Запустить авто-режим")
            return
        try:
            self._collect_settings()
        except ValueError:
            messagebox.showerror("Джарвис", "Время автозапуска — в формате ЧЧ:ММ.")
            return
        self.monitor = Monitor(self.settings)
        self.auto_running = True
        self.auto_button.config(text="Остановить авто-режим")
        if self.settings.auto_start_time:
            self._log(f"Автозапуск по расписанию в {self.settings.auto_start_time}.")
        else:
            self._log(
                f"Авто-режим запущен: опрос каждые "
                f"{self.settings.poll_interval_minutes} мин."
            )
        threading.Thread(target=self._auto_loop, daemon=True).start()

    def _auto_loop(self) -> None:
        if self.settings.auto_start_time:
            wait = seconds_until(self.settings.auto_start_time)
            for _ in range(int(wait)):
                if not self.auto_running:
                    return
                time.sleep(1)
        interval = max(1, self.settings.poll_interval_minutes) * 60
        while self.auto_running:
            try:
                new_orders, errors = self.monitor.poll()
            except Exception as exc:
                self._log(f"Ошибка опроса: {exc}")
                new_orders, errors = [], []
            for order in new_orders:
                self._announce(order)
            for message in errors:
                self._log(f"Ошибка источника: {message}")
            for _ in range(interval):
                if not self.auto_running:
                    return
                time.sleep(1)

    def run(self) -> int:
        self.root.mainloop()
        return 0


def run_gui() -> int:
    return JobsApp().run()
