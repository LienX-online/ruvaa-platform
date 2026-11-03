# Ruvaa Platform Extended Local Verification Script with Sponsor Ads
$baseUrl = 'http://localhost:3000'

Write-Host "1. Testing Server Health..." -ForegroundColor Cyan
$health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get
Write-Host "Success: Service is $($health.status)." -ForegroundColor Green

Write-Host "
2. Testing Sponsor & Advertisement Placement API..." -ForegroundColor Cyan
$adRes = Invoke-RestMethod -Uri "$baseUrl/api/ads/addu" -Method Get
Write-Host "Success: Loaded $($adRes.sponsorAd.activeCampaigns.Count) active sponsor campaigns for target atoll: $($adRes.sponsorAd.targetAtoll)." -ForegroundColor Green
