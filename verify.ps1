# Ruvaa Platform Extended Local Verification Script with Audit Logs
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Audit Logging & Security Compliance API..." -ForegroundColor Cyan
$auditRes = Invoke-RestMethod -Uri "$baseUrl/api/audit/logs" -Method Get
Write-Host "Success: Audit Logs Loaded -> Total Events: $($auditRes.audit.totalEventsTracked), Status: $($auditRes.audit.complianceStatus)" -ForegroundColor Green
