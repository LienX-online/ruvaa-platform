# Ruvaa Platform Extended Local Verification Script with Multilingual Dialects
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Multilingual & Regional Atoll Dialect API..." -ForegroundColor Cyan
$transBody = @{
    text = "Welcome to the national news portal"
    targetAtoll = "Addu City"
} | ConvertTo-Json
$transRes = Invoke-RestMethod -Uri "$baseUrl/api/translate/dialect" -Method Post -Body $transBody -ContentType "application/json"
Write-Host "Success: Adapted Output -> $($transRes.translation.adaptedText)" -ForegroundColor Green
