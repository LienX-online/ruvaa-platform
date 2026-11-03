# Ruvaa Platform Local Verification Script
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
try {
    $health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
    Write-Host "Success: Service is $($health.status) with $($health.connections) active connections." -ForegroundColor Green
} catch {
    Write-Host "Failed to reach server. Ensure npm start is running." -ForegroundColor Red
    exit
}

Write-Host "
2. Fetching Islands Database..." -ForegroundColor Cyan
$islands = Invoke-RestMethod -Uri "$baseUrl/api/islands" -Method Get
Write-Host "Success: Found $($islands.islands.Count) island hubs." -ForegroundColor Green

Write-Host "
3. Registering Test Editor..." -ForegroundColor Cyan
try {
    $regBody = @{ username = "testeditor"; password = "password123" } | ConvertTo-Json
    Invoke-RestMethod -Uri "$baseUrl/api/auth/register" -Method Post -Body $regBody -ContentType "application/json"
    Write-Host "Success: Editor registered." -ForegroundColor Green
} catch {
    Write-Host "Note: Editor might already exist, continuing..." -ForegroundColor Yellow
}

Write-Host "
4. Logging in..." -ForegroundColor Cyan
$loginBody = @{ username = "testeditor"; password = "password123" } | ConvertTo-Json
$loginRes = Invoke-RestMethod -Uri "$baseUrl/api/auth/login" -Method Post -Body $loginBody -ContentType "application/json"
Write-Host "Success: JWT Token acquired." -ForegroundColor Green

Write-Host "
5. Publishing Test Article & Triggering Video Generation..." -ForegroundColor Cyan
$artBody = @{
    title = "Addu Atoll Sustainable Tourism Initiative Launched"
    islandSlug = "addu"
    content = "A new project focusing on green energy and marine protection has been initiated across Addu City."
    generateVideo = $true
} | ConvertTo-Json
$artRes = Invoke-RestMethod -Uri "$baseUrl/api/articles" -Method Post -Body $artBody -ContentType "application/json"
Write-Host "Success: Article published! ID: $($artRes.article.id), Video Path: $($artRes.article.videoPath || 'None')" -ForegroundColor Green
