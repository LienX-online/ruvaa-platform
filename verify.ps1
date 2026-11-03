# Ruvaa Platform Extended Local Verification Script with RBAC
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing RBAC & Editorial Permissions API..." -ForegroundColor Cyan
$rbacBody = @{
    username = "editor_ahusan"
    requestedRole = "Chief Editor"
    action = "PUBLISH"
} | ConvertTo-Json
$rbacRes = Invoke-RestMethod -Uri "$baseUrl/api/auth/permissions/verify" -Method Post -Body $rbacBody -ContentType "application/json"
Write-Host "Success: RBAC Verified -> User: $($rbacRes.rbac.username) [Role: $($rbacRes.rbac.assignedRole)], Authorized: $($rbacRes.rbac.authorized)" -ForegroundColor Green
