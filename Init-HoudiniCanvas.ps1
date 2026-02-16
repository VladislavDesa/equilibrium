# Init-HoudiniCanvas.ps1 — работает из ЛЮБОГО места

# Автоматически переходим в папку скрипта
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $ScriptDir

$ErrorActionPreference = "Stop"

$Base = "Projects\03-Houdini-Learning"

# Создаём папки
$Folders = @(
    "$Base\Theory",
    "$Base\Resources",
    "$Base\Progress"
)

$PracticeDirs = @(
    "01-Procedural-Box",
    "02-Scatter-and-Copy",
    "03-RBD-Fracture",
    "04-Particles-Snow",
    "05-VEX-Attribute-Edit",
    "06-CNC-Toolpath-Vis",
    "07-3DPrint-Preview"
)

foreach ($folder in $Folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
}

foreach ($dir in $PracticeDirs) {
    New-Item -ItemType Directory -Path "$Base\Practice\$dir" -Force | Out-Null
}

# Функция записи UTF-8 без BOM
function Write-UTF8File {
    param([string]$Path, [string]$Content)
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines((Resolve-Path -Relative $Path).Replace('.\', ''), $Content -split "`r?`n", $utf8NoBom)
}

# Но проще — использовать абсолютный путь:
function Write-UTF8FileAbs {
    param([string]$Path, [string]$Content)
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines($Path, $Content -split "`r?`n", $utf8NoBom)
}

# Теория
Write-UTF8FileAbs "$PWD\$Base\Theory\01-Interface-Basics.md" "# Интерфейс Houdini: основы`n`n(Будет заполнено)"
Write-UTF8FileAbs "$PWD\$Base\Theory\02-Nodes-and-Networks.md" "# Ноды и сети`n`n(Будет заполнено)"
Write-UTF8FileAbs "$PWD\$Base\Theory\03-Geometry-Types.md" "# Типы геометрии`n`n(Будет заполнено)"
Write-UTF8FileAbs "$PWD\$Base\Theory\04-VEX-Fundamentals.md" "# Основы VEX`n`n(Будет заполнено)"

# Практика
foreach ($dir in $PracticeDirs) {
    Write-UTF8FileAbs "$PWD\$Base\Practice\$dir\task.md" "# Задача: $dir`n`n**Цель**: `n**Шаги**: `n**Результат**: .hipnc файл"
    Set-Content -Path "$PWD\$Base\Practice\$dir\notes.md" -Value "" -Encoding UTF8
}

# Ресурсы
Write-UTF8FileAbs "$PWD\$Base\Resources\Free-Courses.md" "# Бесплатные курсы`n`n- Applied Houdini`n- Entagma`n- SideFX Learn"
Write-UTF8FileAbs "$PWD\$Base\Resources\YouTube-Playlists.md" "# YouTube-плейлисты`n`n(Будет расширено)"
Write-UTF8FileAbs "$PWD\$Base\Resources\Glossary-RU.md" "# Глоссарий (RU/EN)`n`n| Русский | Английский |`n|--------|------------|`n| Нода | Node |`n| Геометрия | Geometry |"

# Прогресс
Write-UTF8FileAbs "$PWD\$Base\Progress\vlad-progress.md" "# Прогресс — Владислав`n`n- [ ] Уровень 1: Основы"
Write-UTF8FileAbs "$PWD\$Base\Progress\alexander-progress.md" "# Прогресс — Александр`n`n- [ ] Уровень 1: Основы"

# Canvas
$CanvasContent = '{
  "nodes": [
    {
      "id": "header",
      "type": "text",
      "text": "## Equilibrium: Houdini Learning Map\nProcedural Thinking • Simulation • VEX • Integration\nАктуально для Houdini 20.5–21.0 (2025–2026)",
      "x": -300,
      "y": -400,
      "width": 600,
      "height": 100,
      "color": "#2D2D2D",
      "font": "bold"
    },
    {
      "id": "foundations",
      "type": "group",
      "label": "🛠️ Основы",
      "x": -500,
      "y": -200,
      "width": 300,
      "height": 300,
      "color": "#FFD700"
    },
    {
      "id": "n1",
      "type": "file",
      "file": "Theory/01-Interface-Basics.md",
      "x": -450,
      "y": -150,
      "width": 200,
      "height": 60
    },
    {
      "id": "modeling",
      "type": "group",
      "label": "📐 Процедурное моделирование",
      "x": -100,
      "y": -200,
      "width": 300,
      "height": 200,
      "color": "#90EE90"
    },
    {
      "id": "n4",
      "type": "file",
      "file": "Practice/01-Procedural-Box/task.md",
      "x": -50,
      "y": -150,
      "width": 200,
      "height": 60
    },
    {
      "id": "simulation",
      "type": "group",
      "label": "💥 Динамика и симуляции",
      "x": 300,
      "y": -200,
      "width": 300,
      "height": 200,
      "color": "#87CEFA"
    },
    {
      "id": "n6",
      "type": "file",
      "file": "Practice/03-RBD-Fracture/task.md",
      "x": 350,
      "y": -150,
      "width": 200,
      "height": 60
    },
    {
      "id": "coding",
      "type": "group",
      "label": "💻 VEX и автоматизация",
      "x": -300,
      "y": 150,
      "width": 300,
      "height": 150,
      "color": "#DDA0DD"
    },
    {
      "id": "n8",
      "type": "file",
      "file": "Theory/04-VEX-Fundamentals.md",
      "x": -250,
      "y": 180,
      "width": 200,
      "height": 60
    },
    {
      "id": "integration",
      "type": "group",
      "label": "🔗 Интеграция с Equilibrium",
      "x": 100,
      "y": 150,
      "width": 350,
      "height": 150,
      "color": "#FFB6C1"
    },
    {
      "id": "n10",
      "type": "file",
      "file": "Practice/06-CNC-Toolpath-Vis/task.md",
      "x": 150,
      "y": 180,
      "width": 250,
      "height": 60
    }
  ],
  "edges": [
    { "fromNode": "n1", "toNode": "n4", "fromSide": "right", "toSide": "left" },
    { "fromNode": "n4", "toNode": "n6", "fromSide": "right", "toSide": "left" },
    { "fromNode": "n4", "toNode": "n8", "fromSide": "bottom", "toSide": "top" },
    { "fromNode": "n6", "toNode": "n10", "fromSide": "bottom", "toSide": "top" }
  ]
}'

Write-UTF8FileAbs "$PWD\$Base\Roadmap.canvas" $CanvasContent

Write-Host "✅ База Houdini создана!" -ForegroundColor Green
Write-Host "📁 Путь: $PWD\$Base" -ForegroundColor Cyan
Write-Host "🚀 Выполните:" -ForegroundColor Yellow
Write-Host "   git add Projects/03-Houdini-Learning"
Write-Host "   git commit -m ""feat: init Houdini learning base with canvas"""
Write-Host "   git push"