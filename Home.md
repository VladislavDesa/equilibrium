
# 🧠 Equilibrium

> «Единая система знаний — основа инженерного мастерства»  
> — Владислав & Александр

[[WTF.canvas]]

---

## 📊 Статус проектов

```dataview
TABLE status AS "Статус", priority AS "Приоритет"
FROM "Projects"
WHERE file.name != "README"
SORT file.name ASC
```

```button
name ➕ Новая идея
type command
action Templater: Insert template in new file from cursor
```

```button
name 📝 Новый проект
type command
action Templater: Insert template in new file from cursor
```

```button
name ♻️ Синхронизировать
type command
action Git: Commit and push
```
