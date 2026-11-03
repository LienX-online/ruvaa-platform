# Ruvaa Platform Extended Local Verification Script with Caching
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Automated Caching & Performance Optimization API..." -ForegroundColor Cyan
$cacheBody = @{
    cacheKey = "addu_atoll_news_cache"
} | ConvertTo-Json
$cacheRes = Invoke-RestMethod -Uri "$baseUrl/api/cache/purge" -Method Post -Body $cacheBody -ContentType "application/json"
Write-Host "Success: Cache Purge -> $($cacheRes.cache.status) (Time: $($cacheRes.cache.executionTimeMs)ms)" -ForegroundColor Green
