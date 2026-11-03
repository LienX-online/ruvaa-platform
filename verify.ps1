# Ruvaa Platform Extended Local Verification Script with Newsletter
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Newsletter Subscription API..." -ForegroundColor Cyan
$subBody = @{
    email = "citizen@ruvaa.mv"
    atollPreference = "Addu City"
} | ConvertTo-Json
$subRes = Invoke-RestMethod -Uri "$baseUrl/api/newsletter/subscribe" -Method Post -Body $subBody -ContentType "application/json"
Write-Host "Success: $($subRes.message) for $($subRes.subscriber.email) ($($subRes.subscriber.atollPreference))" -ForegroundColor Green
