# Ruvaa Platform Extended Local Verification Script with Search Engine
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Full-Text Search & Tag Indexing API..." -ForegroundColor Cyan
$searchRes = Invoke-RestMethod -Uri "$baseUrl/api/search?q=Addu&atoll=Addu" -Method Get
Write-Host "Success: Search Results Found -> $($searchRes.search.resultsCount) matches for query '$($searchRes.search.query)'" -ForegroundColor Green
