# 🧠 Equilibrium

> «Единая система знаний — основа инженерного мастерства»  
> — Владислав & Александр

---

## 📊 Статус проектов

```dataviewjs
const projects = dv.pages('"Projects"')
  .where(p => p.file.name != "README")
  .sort(p => p.file.name, 'asc');

dv.table(["Проект", "Статус", "Приоритет"], 
  projects.map(p => [
    `[${p.file.name}](Projects/${p.file.name})`,
    p.status ? p.status.replace("#status/", "") : "—",
    p.priority ? p.priority.replace("#priority/", "") : "medium"
  ])
);
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