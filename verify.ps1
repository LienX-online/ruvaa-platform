# Ruvaa Platform Extended Local Verification Script with Weather Advisories
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Atoll Weather & Marine Alert API..." -ForegroundColor Cyan
$weatherRes = Invoke-RestMethod -Uri "$baseUrl/api/weather/advisory/addu" -Method Get
Write-Host "Success: Weather Advisory -> Atoll: $($weatherRes.weatherAdvisory.targetAtoll), Wind: $($weatherRes.weatherAdvisory.windSpeedKnots) knots" -ForegroundColor Green
