[CmdletBinding()]
param([string]$SourceRom, [string]$OutputRom)
$ErrorActionPreference = 'Stop'

function Get-Sha256([string]$Path) {
    $hasher = [Security.Cryptography.SHA256]::Create()
    $stream = [IO.File]::OpenRead($Path)
    try { return [BitConverter]::ToString($hasher.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
    finally { $stream.Dispose(); $hasher.Dispose() }
}

try {
    $manifest = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'manifest.json') -Raw | ConvertFrom-Json
    if (-not $SourceRom) {
        $SourceRom = (Read-Host 'Drag or enter the ORIGINAL Japan Rev 1 ROM path').Trim('"')
    }
    $sourcePath = (Resolve-Path -LiteralPath $SourceRom).Path
    if ((Get-Item -LiteralPath $sourcePath).Length -ne $manifest.source.size -or
        (Get-Sha256 $sourcePath) -ne $manifest.source.sha256) {
        throw 'Wrong source ROM. Use the clean Japan Rev 1 ROM described in INSTALL.md.'
    }
    if (-not $OutputRom) { $OutputRom = Join-Path $PSScriptRoot $manifest.target.filename }
    $outputPath = [IO.Path]::GetFullPath($OutputRom)
    if (Test-Path -LiteralPath $outputPath) { throw 'Output already exists. It will not be overwritten.' }
    $patchPath = Join-Path $PSScriptRoot $manifest.patch.filename
    $flipsPath = Join-Path $PSScriptRoot 'tools\flips.exe'
    if ((Get-Sha256 $patchPath) -ne $manifest.patch.sha256) { throw 'Patch SHA-256 mismatch.' }
    if ((Get-Sha256 $flipsPath) -ne $manifest.tool.sha256) { throw 'Patcher SHA-256 mismatch.' }
    $temporaryPath = $outputPath + '.' + [guid]::NewGuid().ToString('N') + '.tmp'
    $arguments = @('--apply', '--exact', ('"' + $patchPath + '"'), ('"' + $sourcePath + '"'), ('"' + $temporaryPath + '"'))
    $process = Start-Process -FilePath $flipsPath -ArgumentList $arguments -WindowStyle Hidden -Wait -PassThru
    if ($process.ExitCode -ne 0) { throw "BPS application failed. Temporary output, if any: $temporaryPath" }
    if ((Get-Item -LiteralPath $temporaryPath).Length -ne $manifest.target.size -or
        (Get-Sha256 $temporaryPath) -ne $manifest.target.sha256) {
        throw "Patched ROM failed verification. Kept for inspection: $temporaryPath"
    }
    if (Test-Path -LiteralPath $outputPath) { throw 'Output was created by another process; refusing to overwrite.' }
    Move-Item -LiteralPath $temporaryPath -Destination $outputPath
    Write-Host "SUCCESS: $outputPath"
    Write-Host $manifest.messages.success
    Write-Host $manifest.messages.note
    exit 0
} catch {
    Write-Error $_ -ErrorAction Continue
    exit 1
}
