# Ruvaa Platform Extended Local Verification Script with Scheduler
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Automated News Scheduler API..." -ForegroundColor Cyan
$schBody = @{
    title = "Hithadhoo Regional Development Broadcast"
    islandSlug = "addu"
    publishAt = "2026-11-05T08:00:00Z"
} | ConvertTo-Json
$schRes = Invoke-RestMethod -Uri "$baseUrl/api/scheduler/schedule" -Method Post -Body $schBody -ContentType "application/json"
Write-Host "Success: Task scheduled -> ID: $($schRes.task.taskId), Status: $($schRes.task.status)" -ForegroundColor Green
