# Ruvaa Platform Extended Local Verification Script with Social Publisher
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Multi-Channel Social Media Auto-Publisher API..." -ForegroundColor Cyan
$socBody = @{
    title = "Addu Atoll Solar Energy Grid Expansion Approved"
    channels = @("Telegram", "Facebook", "Instagram")
    mediaUrl = "addu_solar_news_reel.mp4"
} | ConvertTo-Json
$socRes = Invoke-RestMethod -Uri "$baseUrl/api/social/publish" -Method Post -Body $socBody -ContentType "application/json"
Write-Host "Success: $($socRes.message) -> ID: $($socRes.socialPublish.publishId), Channels: $($socRes.socialPublish.targetChannels.Count)" -ForegroundColor Green
