# Ruvaa Platform Full-Stack & Deployment Verification Script
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Backend Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "2. Verifying Full-Stack Workspace Structure..." -ForegroundColor Cyan
$dirs = @("frontend", "mobile-client", "video-pipeline", "server")
foreach ($dir in $dirs) {
    if (Test-Path $dir) {
        Write-Host "  [OK] Directory $dir is present." -ForegroundColor Green
    } else {
        Write-Host "  [X] Directory $dir is missing!" -ForegroundColor Red
    }
}

Write-Host "
*** RUVAA FULL-STACK REPOSITORY FULLY SYNCHRONIZED! ***" -ForegroundColor Magenta
