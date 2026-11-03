# Ruvaa Platform Extended Local Verification Script with Feedback
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Citizen Feedback & Comments API..." -ForegroundColor Cyan
$fbBody = @{
    articleId = "12345"
    citizenName = "Addu Resident"
    comment = "Great initiative for the southern atolls development!"
} | ConvertTo-Json
$fbRes = Invoke-RestMethod -Uri "$baseUrl/api/feedback" -Method Post -Body $fbBody -ContentType "application/json"
Write-Host "Success: $($fbRes.message) from $($fbRes.feedback.citizenName)" -ForegroundColor Green
