# Ruvaa Platform Extended Local Verification Script with RSS Sourcing
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing External News RSS Sourcing API..." -ForegroundColor Cyan
$rssRes = Invoke-RestMethod -Uri "$baseUrl/api/sources/fetch" -Method Get
Write-Host "Success: Ingested $($rssRes.count) external headlines. Top headline: '$($rssRes.sources[0].title)'" -ForegroundColor Green
