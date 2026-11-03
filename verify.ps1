# Ruvaa Platform Extended Local Verification Script with Advisories
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Atoll Weather & Tourism Advisory API (Addu City)..." -ForegroundColor Cyan
$advisoryRes = Invoke-RestMethod -Uri "$baseUrl/api/advisories/addu" -Method Get
Write-Host "Success: Advisory loaded for $($advisoryRes.advisory.island) ($($advisoryRes.advisory.weather.condition), $($advisoryRes.advisory.weather.temperature))" -ForegroundColor Green
