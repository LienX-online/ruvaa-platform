# Ruvaa Platform Extended Local Verification Script with Backups
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Data Backup Snapshot Exporter API..." -ForegroundColor Cyan
$bkRes = Invoke-RestMethod -Uri "$baseUrl/api/backup/snapshot" -Method Post -ContentType "application/json"
Write-Host "Success: $($bkRes.message) -> File: $($bkRes.backup.filename) (Articles: $($bkRes.backup.articlesCount))" -ForegroundColor Green
