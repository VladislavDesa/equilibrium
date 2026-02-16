# init-houdini.ps1 - ASCII-only, no encoding issues

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $ScriptDir

$Base = "Projects\03-Houdini-Learning"

# Create folders
$Folders = @("$Base\Theory", "$Base\Resources", "$Base\Progress")
$PracticeDirs = @(
    "01-Procedural-Box", "02-Scatter-and-Copy", "03-RBD-Fracture",
    "04-Particles-Snow", "05-VEX-Attribute-Edit", "06-CNC-Toolpath-Vis", "07-3DPrint-Preview"
)

foreach ($f in $Folders) { New-Item -ItemType Directory -Path $f -Force | Out-Null }
foreach ($d in $PracticeDirs) { New-Item -ItemType Directory -Path "$Base\Practice\$d" -Force | Out-Null }

# Helper: write UTF-8 without BOM
function Write-UTF8File {
    param([string]$Path, [string]$Content)
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines($Path, ($Content -split "`r?`n"), $utf8NoBom)
}

# Theory
Write-UTF8File "$PWD\$Base\Theory\01-Interface-Basics.md" "# Interface Basics`n`n(To be filled)"
Write-UTF8File "$PWD\$Base\Theory\02-Nodes-and-Networks.md" "# Nodes and Networks`n`n(To be filled)"
Write-UTF8File "$PWD\$Base\Theory\03-Geometry-Types.md" "# Geometry Types`n`n(To be filled)"
Write-UTF8File "$PWD\$Base\Theory\04-VEX-Fundamentals.md" "# VEX Fundamentals`n`n(To be filled)"

# Practice
foreach ($dir in $PracticeDirs) {
    Write-UTF8File "$PWD\$Base\Practice\$dir\task.md" "# Task: $dir`n`nGoal: `nSteps: `nResult: .hipnc file"
    Set-Content -Path "$PWD\$Base\Practice\$dir\notes.md" -Value "" -Encoding UTF8
}

# Resources
Write-UTF8File "$PWD\$Base\Resources\Free-Courses.md" "# Free Courses`n`n- Applied Houdini`n- Entagma`n- SideFX Learn"
Write-UTF8File "$PWD\$Base\Resources\YouTube-Playlists.md" "# YouTube Playlists`n`n(To be expanded)"
Write-UTF8File "$PWD\$Base\Resources\Glossary-RU.md" "# Glossary (RU/EN)`n`n| Term | English |`n|------|---------|`n| Node | Node |`n| Geometry | Geometry |"

# Progress
Write-UTF8File "$PWD\$Base\Progress\vlad-progress.md" "# Vlad Progress`n`n- [ ] Level 1: Basics"
Write-UTF8File "$PWD\$Base\Progress\alexander-progress.md" "# Alexander Progress`n`n- [ ] Level 1: Basics"

# Canvas (ASCII-safe JSON)
$CanvasContent = @"
{
  "nodes": [
    {
      "id": "header",
      "type": "text",
      "text": "## Equilibrium: Houdini Learning Map\nProcedural Thinking • Simulation • VEX • Integration\nValid for Houdini 20.5-21.0 (2025-2026)",
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
      "label": "Foundations",
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
      "label": "Procedural Modeling",
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
      "label": "Dynamics & Simulation",
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
      "label": "VEX & Automation",
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
      "label": "Integration with Equilibrium",
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
}
"@

Write-UTF8File "$PWD\$Base\Roadmap.canvas" $CanvasContent

Write-Host "SUCCESS: Houdini base created!" -ForegroundColor Green
Write-Host "Path: $PWD\$Base" -ForegroundColor Cyan
Write-Host "Next:" -ForegroundColor Yellow
Write-Host "  git add Projects/03-Houdini-Learning"
Write-Host "  git commit -m ""feat: init Houdini learning base"""
Write-Host "  git push"