# 🧠 Equilibrium

<<<<<<< HEAD
> [!quote] Vision
> «Единая система знаний — основа инженерного мастерства»
> — *В. & А.*

---

## 🕹️ Control Center

> [!tip] **Active Context**
> Перед началом работы и перед закрытием — сверься с контекстом:
> 👉 **[[Docs/SESSION_CONTEXT|🟢 SESSION CONTEXT]]**

### Быстрые действия

```button
name 💡 Новая идея
type command
action Templater: Create new note from template
class primary
=======
> «Единая система знаний — основа инженерного мастерства»
> — В. & А.

---

## 🚀 Быстрые действия

```button
name ➕ Новая идея
type command
action Templater: Create new note from template
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
```

```button
name 📝 Новый проект
type command
action Templater: Create new note from template
<<<<<<< HEAD
class primary
=======
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
```

```button
name ✅ Задачи
type link
action obsidian://open?file=Tasks
<<<<<<< HEAD
class secondary
=======
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
```

```button
name ♻️ Синхронизировать
type command
action Git: Commit-and-sync
<<<<<<< HEAD
class secondary
=======
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
```

---

<<<<<<< HEAD
## 🔭 Обзор системы

### Активные проекты

> [!example]- Список проектов (развернуть)
> ```dataview
> TABLE WITHOUT ID
> 	file.link as "Проект",
> 	status AS "Статус",
> 	priority AS "Приоритет",
> 	team AS "Команда"
> FROM "Projects"
> WHERE status != "done" AND status != "on-hold"
> SORT priority ASC
> ```

### 🎓 Houdini — Прогресс обучения

> [!example]- Детали прогресса (развернуть)
> ```dataview
> TABLE WITHOUT ID
>   file.link AS "Модуль",
>   length(filter(file.tasks, (t) => t.completed)) + " / " + length(file.tasks) AS "Прогресс"
> FROM "Houdini-Learning/Progress"
> SORT file.name ASC
> ```
---

## 🔥 Горящие задачи (Top 5)
=======
## 📊 Проекты

```dataview
TABLE status AS "Статус", priority AS "Приоритет", team AS "Ответственные"
FROM "Projects"
WHERE priority AND status
SORT priority ASC
```

---

## 📚 Houdini — Прогресс

```dataview
TABLE WITHOUT ID
  file.link AS "Участник",
  length(filter(file.tasks, (t) => t.completed)) AS "✅ Выполнено",
  length(filter(file.tasks, (t) => !t.completed)) AS "⬜ Осталось"
FROM "Houdini-Learning/Progress"
SORT file.name ASC
```

---

## 🔴 Активные задачи
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d

```tasks
not done
priority is highest
<<<<<<< HEAD
priority is high
=======
OR priority is high
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
limit 5
sort by priority
```

---

<<<<<<< HEAD
## 🗺️ Навигация

> [!abstract] Карты и структуры
> *   [[Docs/Pathregist|🛣️ Pathregist (Роадмап)]]
> *   [[WTF.canvas|🗺️ Карта связей (Canvas)]]
> *   [[Inbox|📥 Inbox (Входящие)]]
> *   [[Tasks|📋 Глобальный список задач]]
=======
## 🗺️ Карта проекта

[[WTF.canvas]]
>>>>>>> 53265070ff5d362fb38377424e7448472008f56d
