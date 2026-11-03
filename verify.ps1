# Ruvaa Platform Extended Local Verification Script with Feed Health
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing RSS Feed Health Inspector API..." -ForegroundColor Cyan
$feedRes = Invoke-RestMethod -Uri "$baseUrl/api/feeds/health" -Method Get
Write-Host "Success: Feed Health -> $($feedRes.feedHealth.status) (Monitored: $($feedRes.feedHealth.totalFeedsMonitored) feeds)" -ForegroundColor Green
