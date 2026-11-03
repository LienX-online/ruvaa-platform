# Ruvaa Platform Extended Local Verification Script with Rate Limiting
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Traffic Spike & Rate Limiting API..." -ForegroundColor Cyan
$rlRes = Invoke-RestMethod -Uri "$baseUrl/api/security/ratelimit/status" -Method Get
Write-Host "Success: Rate Limit Status -> $($rlRes.rateLimit.status) (Current Load: $($rlRes.rateLimit.currentLoad))" -ForegroundColor Green
