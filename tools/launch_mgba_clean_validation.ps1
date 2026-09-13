[CmdletBinding()]
param(
    [string]$RomPath,
    [string]$MgbaPath
)

$ErrorActionPreference = 'Stop'
$expectedSha256 = 'A648A984D5A112AAEF3D67462EC3E6708AA6AD5ACD7E31E53263AF7247B6A27A'

if (-not $RomPath) {
    $RomPath = Join-Path $PSScriptRoot '..\poc\output\exe2_rev1_semantic_translation_playtest_fix_v2.gba'
}
if (-not $MgbaPath) {
    $MgbaPath = Join-Path $PSScriptRoot '..\..\mGBA-0.10.5-win64\mGBA.exe'
}

$resolvedRom = (Resolve-Path -LiteralPath $RomPath).Path
$resolvedMgba = (Resolve-Path -LiteralPath $MgbaPath).Path
$sha256 = [System.Security.Cryptography.SHA256]::Create()
$romStream = [System.IO.File]::OpenRead($resolvedRom)
try {
    $actualSha256 = [System.BitConverter]::ToString($sha256.ComputeHash($romStream)).Replace('-', '')
}
finally {
    $romStream.Dispose()
    $sha256.Dispose()
}

if ($actualSha256 -ne $expectedSha256) {
    throw "ROM hash mismatch. expected=$expectedSha256 actual=$actualSha256 path=$resolvedRom"
}

Write-Host 'Launching the Rockman EXE 2 Rev 1 Korean validation ROM.'
Write-Host "ROM: $resolvedRom"
Write-Host "SHA-256: $actualSha256"
Write-Host 'Options: muted, state autoload disabled, state autosave disabled.'
Write-Host 'Do not manually load .ss1/.ss2 states made by older ROM builds.'

$romArgument = '"' + $resolvedRom + '"'
$process = Start-Process `
    -FilePath $resolvedMgba `
    -ArgumentList @('-C', 'mute=1', '-C', 'autoload=0', '-C', 'autosave=0', $romArgument) `
    -WorkingDirectory (Split-Path -Parent $resolvedMgba) `
    -PassThru

Write-Host "mGBA PID: $($process.Id)"
