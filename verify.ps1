# Ruvaa Platform Extended Local Verification Script with Localization
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Dhivehi Localization & Thaana Formatting API..." -ForegroundColor Cyan
$locBody = @{
    text = "Addu City development updates"
    targetDialect = "Southern Addu"
} | ConvertTo-Json
$locRes = Invoke-RestMethod -Uri "$baseUrl/api/localize" -Method Post -Body $locBody -ContentType "application/json"
Write-Host "Success: Localized Output -> $($locRes.localization.thaanaScript)" -ForegroundColor Green
