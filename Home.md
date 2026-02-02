
# 🧠 Equilibrium

> «Единая система знаний — основа инженерного мастерства» 
> — В. & А.

[[WTF.canvas]]



## 📊 Статус проектов

```dataview
TABLE status AS "Статус", priority AS "Приоритет", team AS "Ответсвенные"
FROM "Projects"
WHERE priority AND status
SORT priority ASC
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
