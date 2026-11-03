# Ruvaa Platform Extended Local Verification Script with Article Scheduler
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Article Scheduling & Time-Release API..." -ForegroundColor Cyan
$schBody = @{
    title = "Addu Atoll Municipal Budget Release 2027"
    scheduledFor = "2027-01-01T06:00:00Z"
    atollTarget = "Addu City"
} | ConvertTo-Json
$schRes = Invoke-RestMethod -Uri "$baseUrl/api/articles/schedule" -Method Post -Body $schBody -ContentType "application/json"
Write-Host "Success: $($schRes.message) -> ID: $($schRes.schedule.scheduleId), Target: $($schRes.schedule.atollTarget)" -ForegroundColor Green
