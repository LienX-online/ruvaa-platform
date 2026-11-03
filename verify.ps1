# Ruvaa Platform Extended Local Verification Script with Tourism Directory
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Atoll Tourism & Dive Points API (Addu City)..." -ForegroundColor Cyan
$tourRes = Invoke-RestMethod -Uri "$baseUrl/api/tourism/addu" -Method Get
Write-Host "Success: Loaded $($tourRes.tourism.highlights.Count) tourism attractions for $($tourRes.tourism.island)." -ForegroundColor Green
