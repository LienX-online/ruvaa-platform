# Ruvaa Platform Extended Local Verification Script with AI Headlines
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing AI Headline Rewriting & DhivehiGPT API..." -ForegroundColor Cyan
$aiBody = @{
    rawHeadline = "Addu City Council Announces New Coastal Development Project"
    targetDialect = "Addu Atoll Dialect"
} | ConvertTo-Json
$aiRes = Invoke-RestMethod -Uri "$baseUrl/api/ai/rewrite" -Method Post -Body $aiBody -ContentType "application/json"
Write-Host "Success: Rewritten Title -> $($aiRes.aiRewrite.rewrittenTitle) (Thaana: $($aiRes.aiRewrite.thaanaScript))" -ForegroundColor Green
