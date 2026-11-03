# Ruvaa Platform Extended Local Verification Script with Emergency Alerts
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Emergency Warning Broadcast API..." -ForegroundColor Cyan
$emBody = @{
    alertLevel = "ORANGE (Severe Weather Warning)"
    title = "Strong Winds and Rough Seas Advisory for Southern Atolls"
    message = "All vessels and maritime operators in Addu and Fuvahmulah are advised to exercise extreme caution."
    atollTarget = "Seenu and Gnaviyani Atolls"
} | ConvertTo-Json
$emRes = Invoke-RestMethod -Uri "$baseUrl/api/emergency/broadcast" -Method Post -Body $emBody -ContentType "application/json"
Write-Host "Success: $($emRes.message) -> Level: $($emRes.emergencyAlert.alertLevel)" -ForegroundColor Green
