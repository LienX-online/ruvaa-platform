# Ruvaa Platform Extended Local Verification Script
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Publishing Test Article with Video..." -ForegroundColor Cyan
$artBody = @{
    title = "Fuvahmulah Tiger Shark Tourism Milestone"
    islandSlug = "fuvahmulah"
    content = "Fuvahmulah sets new records for diving tourism this season."
    generateVideo = $true
} | ConvertTo-Json
$artRes = Invoke-RestMethod -Uri "$baseUrl/api/articles" -Method Post -Body $artBody -ContentType "application/json"
Write-Host "Success: Article ID $($artRes.article.id) published." -ForegroundColor Green

Write-Host "
3. Testing Social Distribution Webhook..." -ForegroundColor Cyan
$distBody = @{
    articleId = $artRes.article.id
    platform = "TikTok"
} | ConvertTo-Json
$distRes = Invoke-RestMethod -Uri "$baseUrl/api/distribute" -Method Post -Body $distBody -ContentType "application/json"
Write-Host "Success: $($distRes.message)" -ForegroundColor Green
