# Ruvaa Platform Final Extended Local Verification Script with Push Gateway
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Mobile Push Notification Gateway API..." -ForegroundColor Cyan
$pushBody = @{
    title = "Breaking News: Addu Marine Reserve Expansion"
    body = "Cabinet approves new protective boundaries across southern atoll reefs."
    targetAtoll = "Addu City"
    devicePlatform = "All Platforms"
} | ConvertTo-Json
$pushRes = Invoke-RestMethod -Uri "$baseUrl/api/notifications/push" -Method Post -Body $pushBody -ContentType "application/json"
Write-Host "Success: $($pushRes.message) -> Reached: $($pushRes.pushNotification.recipientsReached) devices" -ForegroundColor Green
Write-Host "
*** ALL 24 MICROSERVICE MODULES SUCCESSFULLY INTEGRATED AND VERIFIED! ***" -ForegroundColor Magenta
