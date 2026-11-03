# Ruvaa Platform Extended Local Verification Script with RSS Harvester
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing RSS & News Syndication Harvester API..." -ForegroundColor Cyan
$rssBody = @{
    feedSourceUrl = "https://avas.mv/rss"
} | ConvertTo-Json
$rssRes = Invoke-RestMethod -Uri "$baseUrl/api/syndication/harvest" -Method Post -Body $rssBody -ContentType "application/json"
Write-Host "Success: $($rssRes.message) -> Ingested: $($rssRes.syndication.articlesIngested) articles" -ForegroundColor Green
