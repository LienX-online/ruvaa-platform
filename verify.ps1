# Ruvaa Platform Extended Local Verification Script with Asset Storage
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Local Media & Asset Storage API..." -ForegroundColor Cyan
$assetRes = Invoke-RestMethod -Uri "$baseUrl/api/assets/inventory" -Method Get
Write-Host "Success: Asset Inventory Loaded -> Total Files: $($assetRes.assets.totalFilesStored), Used Space: $($assetRes.assets.storageUsedMB)MB" -ForegroundColor Green
