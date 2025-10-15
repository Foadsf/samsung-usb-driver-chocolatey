$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installerFile = 'SAMSUNG_USB_Driver_for_Mobile_Phones_v1.9.0.0.exe'

# Try to find the installer in common locations
$searchPaths = @(
    (Join-Path $toolsDir $installerFile)
    (Join-Path $env:TEMP $installerFile)
    (Join-Path $env:USERPROFILE "Downloads\$installerFile")
)

$installerPath = $null
foreach ($path in $searchPaths) {
    if (Test-Path $path) {
        $installerPath = $path
        Write-Host "Found installer at: $installerPath"
        break
    }
}

if (-not $installerPath) {
    Write-Warning @"
Samsung USB Driver installer not found!

Please download the installer manually:
1. Visit: https://developer.samsung.com/android-usb-driver
   OR download from: https://github.com/Foadsf/samsung-usb-driver-chocolatey/releases/download/v1.9.0.0/SAMSUNG_USB_Driver_for_Mobile_Phones_v1.9.0.0.exe
2. Place it in one of these locations:
   - $toolsDir
   - $env:TEMP
   - $env:USERPROFILE\Downloads

Then run: choco install samsung-usb-driver -y
"@
    throw "Installer file not found. Please download manually."
}

# Verify checksum
$expectedChecksum = '4EBFC4E54CB0E3702A7E8BC5048754FDC4D10C3862F6E0DE06746C656DA1A79F'
$actualChecksum = (Get-FileHash -Path $installerPath -Algorithm SHA256).Hash

if ($actualChecksum -ne $expectedChecksum) {
    Write-Warning "Checksum mismatch!"
    Write-Warning "Expected: $expectedChecksum"
    Write-Warning "Actual:   $actualChecksum"
    throw "Checksum verification failed. Please download the correct version."
}

Write-Host "Checksum verified successfully."

$packageArgs = @{
    packageName   = $packageName
    fileType      = 'exe'
    file          = $installerPath
    silentArgs    = '-s'
    validExitCodes= @(0)
    softwareName  = 'SAMSUNG USB Driver for Mobile Phones*'
}

Install-ChocolateyInstallPackage @packageArgs

# Clean up installer if it was in temp locations
$toolsDirFile = Join-Path $toolsDir $installerFile
if ($installerPath -ne $toolsDirFile) {
    Write-Host "Cleaning up installer from: $installerPath"
    Remove-Item $installerPath -Force -ErrorAction SilentlyContinue
}