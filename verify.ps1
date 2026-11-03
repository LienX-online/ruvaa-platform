# Ruvaa Platform Extended Local Verification Script with Release Version
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Platform Version & Release Management API..." -ForegroundColor Cyan
$relRes = Invoke-RestMethod -Uri "$baseUrl/api/release/version" -Method Get
Write-Host "Success: Platform Version $($relRes.release.version) active with $($relRes.release.activeModules.Count) integrated modules!" -ForegroundColor Green
