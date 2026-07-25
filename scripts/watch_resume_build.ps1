$workspace = Split-Path -Parent $PSScriptRoot
$texFile = Join-Path $workspace 'resume.tex'
$outputDir = Join-Path $workspace 'output'
$pdflatex = 'C:\Users\anmol\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe'

if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

if (-not (Test-Path $pdflatex)) {
    Write-Host "pdflatex not found at $pdflatex" -ForegroundColor Red
    exit 1
}

function Build-Resume {
    Set-Location $workspace
    & $pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$outputDir $texFile | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Built $outputDir/resume.pdf" -ForegroundColor Green
    } else {
        Write-Host "Build failed for $texFile" -ForegroundColor Red
    }
}

Build-Resume

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $workspace
$watcher.Filter = 'resume.tex'
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

$debounce = [System.Collections.Generic.HashSet[string]]::new()

$changeAction = {
    $fullPath = $Event.SourceEventArgs.FullPath
    if ($debounce.Contains($fullPath)) {
        return
    }
    $debounce.Add($fullPath) | Out-Null
    Start-Sleep -Milliseconds 500
    if ($debounce.Contains($fullPath)) {
        $debounce.Remove($fullPath) | Out-Null
    }
    & $using:workspace\scripts\watch_resume_build.ps1
}

Register-ObjectEvent $watcher -EventName Changed -Action $changeAction | Out-Null
Register-ObjectEvent $watcher -EventName Created -Action $changeAction | Out-Null

Write-Host 'Watching resume.tex for changes. Press Ctrl+C to stop.' -ForegroundColor Yellow
while ($true) {
    Start-Sleep -Seconds 1
}
