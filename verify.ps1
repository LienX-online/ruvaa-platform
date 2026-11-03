# Ruvaa Platform Extended Local Verification Script with Analytics
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Atoll Analytics & Readership API..." -ForegroundColor Cyan
$analyticsRes = Invoke-RestMethod -Uri "$baseUrl/api/analytics" -Method Get
Write-Host "Success: Analytics Loaded -> Total Articles: $($analyticsRes.analytics.totalArticles), Daily Views: $($analyticsRes.analytics.platformMetrics.dailyPageviews)" -ForegroundColor Green
