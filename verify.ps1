# Ruvaa Platform Extended Local Verification Script with Webhook Dispatcher
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Webhook Dispatcher & Notification Relay API..." -ForegroundColor Cyan
$whBody = @{
    eventType = "ARTICLE_PUBLISHED"
    payload = @{ title = "Addu Atoll Marine Park Expansion"; id = "9988" }
    targetUrl = "https://webhook.site/test-ruvaa"
} | ConvertTo-Json
$whRes = Invoke-RestMethod -Uri "$baseUrl/api/webhooks/dispatch" -Method Post -Body $whBody -ContentType "application/json"
Write-Host "Success: $($whRes.message) -> ID: $($whRes.dispatch.dispatchId), Status: $($whRes.dispatch.deliveryStatus)" -ForegroundColor Green
