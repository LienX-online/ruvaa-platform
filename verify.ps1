# Ruvaa Platform Extended Local Verification Script with Diagnostics
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing System Diagnostics & Telemetry API..." -ForegroundColor Cyan
$diagRes = Invoke-RestMethod -Uri "$baseUrl/api/diagnostics" -Method Get
Write-Host "Success: Status -> $($diagRes.diagnostics.systemStatus), Uptime: $($diagRes.diagnostics.uptimeSeconds)s, Memory Used: $($diagRes.diagnostics.memoryUsageMB.heapUsed)MB" -ForegroundColor Green
