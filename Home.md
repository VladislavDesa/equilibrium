# 🧠 Equilibrium

> «Единая система знаний — основа инженерного мастерства»  
> — Владислав & Александр

[[WTF.canvas]]

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
Ctrl+Shift+G
action Git: Commit and push
```
=======
| Проект                | Статус             | Быстрый доступ                         |
| :-------------------- | :----------------- | :------------------------------------- |
| **01-CNC-Laser**      | \#status/active\   | [Открыть](Projects/01-CNC-Laser/)      |
| **02-3D-Printer**     | \#status/planning\ | [Открыть](Projects/02-3D-Printer/)     |
| **03-Data-Analytics** | \#status/active\   | [Открыть](Projects/03-Data-Analytics/) | [[AI-variant]]
| **04-AI-Assistant**   | \#status/research\ | [Открыть](Projects/04-AI-Assistant/)   |

>>>>>>> origin/main
