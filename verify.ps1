# Ruvaa Platform Extended Local Verification Script with Health Sentinel
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Automated Health Sentinel API..." -ForegroundColor Cyan
$sentinelRes = Invoke-RestMethod -Uri "$baseUrl/api/sentinel/status" -Method Get
Write-Host "Success: Sentinel Status -> $($sentinelRes.sentinel.status) (Monitored Routes: $($sentinelRes.sentinel.monitoredRoutesCount))" -ForegroundColor Green
