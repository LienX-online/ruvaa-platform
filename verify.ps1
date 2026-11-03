# Ruvaa Platform Extended Local Verification Script with Engagement Analytics
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Reader Engagement Analytics & Heatmap API..." -ForegroundColor Cyan
$engBody = @{
    articleId = "art_9988"
    readerAtoll = "Addu City (Hithadhoo)"
    readDurationSeconds = 185
} | ConvertTo-Json
$engRes = Invoke-RestMethod -Uri "$baseUrl/api/analytics/engagement" -Method Post -Body $engBody -ContentType "application/json"
Write-Host "Success: $($engRes.message) -> Atoll: $($engRes.engagement.readerAtoll), Duration: $($engRes.engagement.readDurationSeconds)s" -ForegroundColor Green
