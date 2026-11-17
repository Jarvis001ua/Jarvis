"""Веб-сервер Джарвиса для телефона: только stdlib, интерфейс в браузере.

Запуск: python -m jarvis_atmosphere.mobile
Затем открыть на телефоне: http://127.0.0.1:8080
"""

from __future__ import annotations

import json
import threading
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

from .. import actions
from ..__main__ import handle_phrase
from ..jobs.drafts import generate_draft, save_draft
from ..jobs.monitor import Monitor
from ..jobs.settings import Account, Settings
from ..jobs.tasks import STATUS_LABELS, TEMPLATE_LABELS, TaskStore, template_text

HOST = "127.0.0.1"
PORT = 8080


class AppState:
    def __init__(self) -> None:
        self.settings = Settings.load()
        self.atmosphere = actions.Atmosphere()
        self.monitor = Monitor(self.settings)
        self.tasks = TaskStore()
        self.log: list[str] = []
        self.auto_running = False
        self.lock = threading.Lock()

    def append_log(self, text: str) -> None:
        with self.lock:
            self.log.append(text)
            self.log[:] = self.log[-200:]

    def check_now(self) -> None:
        new_orders, errors = self.monitor.poll()
        for order in new_orders:
            draft = generate_draft(order, self.settings)
            path = save_draft(order, draft)
            budget = f", бюджет {order.budget:g} руб." if order.budget else ""
            self.append_log(f"Заказ: [{order.source}] {order.title}{budget}")
            self.append_log(f"  {order.url}")
            self.append_log(f"  Черновик: {path}")
        for message in errors:
            self.append_log(f"Ошибка источника: {message}")
        if not new_orders and not errors:
            self.append_log("Новых подходящих заказов нет.")

    def auto_loop(self) -> None:
        import time

        interval = max(1, self.settings.poll_interval_minutes) * 60
        while self.auto_running:
            try:
                self.check_now()
            except Exception as exc:
                self.append_log(f"Ошибка опроса: {exc}")
            for _ in range(interval):
                if not self.auto_running:
                    return
                time.sleep(1)


STATE = AppState()


def apply_settings(data: dict) -> None:
    s = STATE.settings
    s.wallet_address = str(data.get("wallet_address", "")).strip()
    s.keywords = [
        k.strip() for k in str(data.get("keywords", "")).split(",") if k.strip()
    ]
    s.skills = [
        k.strip() for k in str(data.get("skills", "")).split(",") if k.strip()
    ]
    for field in ("budget_min", "budget_max"):
        raw = str(data.get(field, "")).strip().replace(",", ".")
        setattr(s, field, float(raw) if raw else None)
    raw_interval = str(data.get("poll_interval_minutes", "")).strip()
    if raw_interval.isdigit() and int(raw_interval) >= 1:
        s.poll_interval_minutes = int(raw_interval)
    raw_time = str(data.get("auto_start_time", "")).strip()
    s.auto_start_time = raw_time
    s.accounts = []
    for line in str(data.get("accounts", "")).splitlines():
        parts = [p.strip() for p in line.split(",", 1)]
        if len(parts) == 2 and all(parts):
            s.accounts.append(Account(platform=parts[0], login=parts[1]))
    s.save()
    STATE.monitor = Monitor(s)
    STATE.append_log("Настройки сохранены.")


def state_json() -> dict:
    s = STATE.settings
    return {
        "wallet_address": s.wallet_address,
        "keywords": ", ".join(s.keywords),
        "skills": ", ".join(s.skills),
        "budget_min": "" if s.budget_min is None else s.budget_min,
        "budget_max": "" if s.budget_max is None else s.budget_max,
        "poll_interval_minutes": s.poll_interval_minutes,
        "auto_start_time": s.auto_start_time,
        "accounts": "\n".join(f"{a.platform},{a.login}" for a in s.accounts),
        "auto_running": STATE.auto_running,
        "templates": list(TEMPLATE_LABELS.values()),
        "atmosphere": STATE.atmosphere.status,
        "log": STATE.log,
        "tasks": [
            {
                "id": t.task_id,
                "title": t.title,
                "status": t.status,
                "status_label": STATUS_LABELS[t.status],
                "work": t.work,
            }
            for t in STATE.tasks.list_tasks()
        ],
    }


PAGE = """<!DOCTYPE html>
<html lang="ru"><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Джарвис Атмосфера</title>
<style>
  body{font-family:sans-serif;background:#101418;color:#e8eaed;margin:0;padding:12px}
  h1{font-size:20px;text-align:center}
  h2{font-size:16px;border-bottom:1px solid #2c333a;padding-bottom:4px;margin-top:22px}
  label{display:block;font-size:13px;color:#9aa0a6;margin:10px 0 4px}
  input,textarea{width:100%;box-sizing:border-box;background:#1b2127;color:#e8eaed;
    border:1px solid #2c333a;border-radius:8px;padding:10px;font-size:15px}
  textarea{height:70px;resize:vertical}
  button{width:100%;margin-top:10px;padding:12px;font-size:16px;border:0;border-radius:10px;
    background:#1a73e8;color:#fff;font-weight:bold}
  button.secondary{background:#2c333a}
  button.stop{background:#b3261e}
  #log{background:#0b0e11;border:1px solid #2c333a;border-radius:8px;padding:8px;
    font-size:12px;white-space:pre-wrap;word-break:break-all;min-height:120px}
  .status{font-size:13px;color:#81c995;margin-top:6px}
  .taskrow{display:flex;align-items:center;gap:8px;background:#1b2127;border:1px solid
    #2c333a;border-radius:8px;padding:8px;margin-top:6px;font-size:14px}
  .taskrow span{flex:1;word-break:break-word}
  .taskrow em{font-style:normal;font-size:12px;color:#9aa0a6;white-space:nowrap}
  .taskrow.sel{border-color:#1a73e8}
  .taskrow button{width:auto;margin:0;padding:6px 10px;font-size:13px;background:#2c333a}
</style></head><body>
<h1>🤖 Джарвис Атмосфера</h1>
<div class="status" id="atmosphere"></div>

<h2>Ассистент</h2>
<input id="phrase" placeholder="Например: включи режим ночь">
<button onclick="command()">Отправить</button>

<h2>Монитор заказов</h2>
<button onclick="check()">Проверить сейчас</button>
<button id="autobtn" class="secondary" onclick="toggleAuto()">Запустить авто-режим</button>

<h2>Настройки</h2>
<label>Адрес кошелька (для получения оплаты)</label>
<input id="wallet_address">
<label>Ключевые слова (через запятую)</label>
<input id="keywords">
<label>Навыки (через запятую)</label>
<input id="skills">
<label>Бюджет от / до (руб.)</label>
<input id="budget_min" inputmode="decimal" placeholder="от">
<input id="budget_max" inputmode="decimal" placeholder="до" style="margin-top:6px">
<label>Интервал опроса (минут)</label>
<input id="poll_interval_minutes" inputmode="numeric">
<label>Автозапуск по времени (ЧЧ:ММ, пусто — выкл.)</label>
<input id="auto_start_time" placeholder="09:30">
<label>Аккаунты (по строке: платформа,логин; пароли не хранятся)</label>
<textarea id="accounts"></textarea>
<button class="secondary" onclick="save()">Сохранить настройки</button>

<h2>Задачи (выполнение)</h2>
<label>Название новой задачи</label>
<input id="task_title" placeholder="Например: Статья про гаджеты">
<label>Шаблон работы</label>
<select id="task_kind" style="width:100%;padding:10px;background:#1b2127;color:#e8eaed;
  border:1px solid #2c333a;border-radius:8px;font-size:15px"></select>
<button onclick="taskNew()">Добавить задачу</button>
<label>Список задач</label>
<div id="tasklist"></div>
<label>Текст работы (выполняю сам, затем \"Сохранить работу\")</label>
<textarea id="task_work" style="height:140px"></textarea>
<button class="secondary" onclick="taskSave()">Сохранить работу</button>
<button class="secondary" onclick="taskStatus('in_progress')">Взять в работу</button>
<button class="secondary" onclick="taskStatus('review')">На проверку</button>
<button class="secondary" onclick="taskStatus('done')">Выполнено</button>
<button class="secondary" onclick="taskExport()">Экспорт результата</button>

<h2>Журнал</h2>
<div id="log"></div>

<script>
async function post(url, body) {
  const r = await fetch(url, {method:'POST',
    headers:{'Content-Type':'application/json'},
    body: body ? JSON.stringify(body) : '{}'});
  return r.json();
}
function collect() {
  return {
    wallet_address: v('wallet_address'), keywords: v('keywords'),
    skills: v('skills'), budget_min: v('budget_min'),
    budget_max: v('budget_max'), poll_interval_minutes: v('poll_interval_minutes'),
    auto_start_time: v('auto_start_time'), accounts: v('accounts')
  };
}
function v(id){return document.getElementById(id).value}
function render(s) {
  document.getElementById('log').textContent = s.log.join('\\n') || '— пусто —';
  document.getElementById('atmosphere').textContent = s.atmosphere;
  const b = document.getElementById('autobtn');
  b.textContent = s.auto_running ? 'Остановить авто-режим' : 'Запустить авто-режим';
  b.className = s.auto_running ? 'stop' : 'secondary';
  renderTasks(s.tasks || []);
  const sel = document.getElementById('task_kind');
  if (!sel.options.length && (s.templates || []).length)
    for (const t of s.templates) { const o = document.createElement('option');
      o.textContent = t; sel.appendChild(o); }
}
let selectedTask = null;
function renderTasks(tasks) {
  const box = document.getElementById('tasklist');
  box.innerHTML = '';
  if (!tasks.length) { box.innerHTML = '<em style="color:#9aa0a6;font-size:13px">— задач нет —</em>'; return; }
  for (const t of tasks) {
    const row = document.createElement('div');
    row.className = 'taskrow' + (selectedTask === t.id ? ' sel' : '');
    const name = document.createElement('span');
    name.textContent = t.title;
    const st = document.createElement('em');
    st.textContent = t.status_label;
    const btn = document.createElement('button');
    btn.textContent = 'открыть';
    btn.onclick = () => { selectedTask = t.id;
      document.getElementById('task_work').value = t.work || ''; renderTasks(tasks); };
    row.append(name, st, btn);
    box.appendChild(row);
  }
}
const KIND_KEYS = ['text','code','report','other'];
async function taskNew(){
  const sel = document.getElementById('task_kind');
  const kind = KIND_KEYS[sel.selectedIndex] || 'other';
  const d = await post('/api/task/new',{title:v('task_title'),template:kind});
  document.getElementById('task_title').value=''; render(d);
  if (d.tasks && d.tasks.length) { selectedTask = d.tasks[0].id;
    document.getElementById('task_work').value = d.tasks[0].work || ''; }}
async function taskSave(){if(!selectedTask){alert('Сначала откройте задачу (кнопка \'открыть\')');return}
  render(await post('/api/task/save',{id:selectedTask,work:v('task_work')}))}
async function taskStatus(st){if(!selectedTask){alert('Сначала откройте задачу');return}
  render(await post('/api/task/status',{id:selectedTask,status:st}))}
async function taskExport(){if(!selectedTask){alert('Сначала откройте задачу');return}
  render(await post('/api/task/export',{id:selectedTask}))}
function fill(s) {
  for (const k of ['wallet_address','keywords','skills','budget_min','budget_max',
    'poll_interval_minutes','auto_start_time','accounts'])
    document.getElementById(k).value = String(s[k] ?? '');
}
async function refresh(){render(await (await fetch('/api/state')).json())}
async function command(){const d=await post('/api/command',{phrase:v('phrase')});
  document.getElementById('phrase').value=''; render(d)}
async function check(){render(await post('/api/check'))}
async function save(){const d=await post('/api/settings',collect());render(d)}
async function toggleAuto(){const d=await post('/api/auto');fill(d);render(d)}
refresh();
</script>
</body></html>"""


class Handler(BaseHTTPRequestHandler):
    def _send(self, code: int, body: bytes, ctype: str) -> None:
        self.send_response(code)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _send_json(self, data: dict) -> None:
        self._send(200, json.dumps(data, ensure_ascii=False).encode(), "application/json")

    def _body(self) -> dict:
        length = int(self.headers.get("Content-Length", 0))
        if not length:
            return {}
        try:
            return json.loads(self.rfile.read(length).decode("utf-8"))
        except (ValueError, json.JSONDecodeError):
            return {}

    def do_GET(self) -> None:
        if self.path in ("/", "/index.html"):
            self._send(200, PAGE.encode(), "text/html; charset=utf-8")
        elif self.path == "/api/state":
            self._send_json(state_json())
        else:
            self._send(404, b"not found", "text/plain")

    def do_POST(self) -> None:
        if self.path == "/api/settings":
            apply_settings(self._body())
            self._send_json(state_json())
        elif self.path == "/api/check":
            try:
                STATE.check_now()
            except Exception as exc:
                STATE.append_log(f"Ошибка опроса: {exc}")
            self._send_json(state_json())
        elif self.path == "/api/auto":
            STATE.auto_running = not STATE.auto_running
            if STATE.auto_running:
                threading.Thread(target=STATE.auto_loop, daemon=True).start()
                STATE.append_log("Авто-режим запущен.")
            else:
                STATE.append_log("Авто-режим остановлен.")
            self._send_json(state_json())
        elif self.path == "/api/command":
            phrase = str(self._body().get("phrase", ""))
            reply, _ = handle_phrase(phrase, STATE.atmosphere)
            STATE.append_log(f"Вы: {phrase}")
            STATE.append_log(f"Джарвис: {reply}")
            self._send_json(state_json())
        elif self.path == "/api/task/new":
            body = self._body()
            title = str(body.get("title", "")).strip()
            if title:
                task = STATE.tasks.add(title)
                kind = str(body.get("template", "other"))
                STATE.tasks.save_work(task.task_id, template_text(kind))
                STATE.append_log(f"Новая задача: {title}")
            self._send_json(state_json())
        elif self.path == "/api/task/status":
            body = self._body()
            task_id = str(body.get("id", ""))
            status = str(body.get("status", ""))
            try:
                STATE.tasks.set_status(task_id, status)
            except (KeyError, ValueError):
                pass
            self._send_json(state_json())
        elif self.path == "/api/task/save":
            body = self._body()
            task_id = str(body.get("id", ""))
            work = str(body.get("work", ""))
            try:
                STATE.tasks.save_work(task_id, work)
            except KeyError:
                pass
            self._send_json(state_json())
        elif self.path == "/api/task/export":
            task_id = str(self._body().get("id", ""))
            try:
                path = STATE.tasks.export_result(task_id)
                STATE.append_log(f"Результат сохранён: {path}")
            except (KeyError, ValueError):
                STATE.append_log("Сначала напишите текст работы и сохраните его.")
            self._send_json(state_json())
        else:
            self._send(404, b"not found", "text/plain")

    def log_message(self, *args) -> None:
        pass


def main() -> int:
    server = ThreadingHTTPServer((HOST, PORT), Handler)
    if STATE.settings.keywords or STATE.settings.auto_start_time:
        STATE.auto_running = True
        threading.Thread(target=STATE.auto_loop, daemon=True).start()
        print("Авто-режим включён автоматически.")
    print(f"Джарвис Атмосфера запущена.")
    print(f"Откройте в браузере телефона: http://{HOST}:{PORT}")
    print("Для остановки: Ctrl+C")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nОстановлено.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
