[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$RomPath,
    [Parameter(Mandatory = $true)][string]$StatePath,
    [Parameter(Mandatory = $true)][string]$BeforeScreenshot,
    [Parameter(Mandatory = $true)][string]$AfterScreenshot,
    [Parameter(Mandatory = $true)][string]$ResultPath,
    [string]$MgbaPath = 'D:\Games\Kor Patch\CLude\mGBA-0.10.5-win64\mGBA.exe',
    [int]$InputPulses = 2
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
Add-Type @'
using System;
using System.Text;
using System.Runtime.InteropServices;
public static class MgbaProbeNative {
  public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);
  [StructLayout(LayoutKind.Sequential)] public struct RECT { public int Left, Top, Right, Bottom; }
  [DllImport("user32.dll")] public static extern bool EnumWindows(EnumWindowsProc cb, IntPtr param);
  [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint pid);
  [DllImport("user32.dll", CharSet=CharSet.Unicode)] public static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int max);
  [DllImport("user32.dll")] public static extern bool PostMessage(IntPtr hWnd, uint msg, IntPtr wParam, IntPtr lParam);
  [DllImport("user32.dll")] public static extern bool PrintWindow(IntPtr hWnd, IntPtr hdc, uint flags);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);
}
'@

function Get-ProcessWindows([int]$ProcessId) {
    $items = New-Object System.Collections.Generic.List[object]
    $callback = [MgbaProbeNative+EnumWindowsProc]{
        param($handle, $unused)
        $windowPid = 0
        [MgbaProbeNative]::GetWindowThreadProcessId($handle, [ref]$windowPid) | Out-Null
        if ($windowPid -eq $ProcessId) {
            $text = New-Object System.Text.StringBuilder 512
            [MgbaProbeNative]::GetWindowText($handle, $text, $text.Capacity) | Out-Null
            if ($text.Length) {
                $items.Add([pscustomobject]@{ Handle = $handle; Title = $text.ToString() })
            }
        }
        return $true
    }
    [MgbaProbeNative]::EnumWindows($callback, [IntPtr]::Zero) | Out-Null
    return $items
}

function Save-ProcessWindow([IntPtr]$Handle, [string]$Path) {
    $rect = New-Object MgbaProbeNative+RECT
    [MgbaProbeNative]::GetWindowRect($Handle, [ref]$rect) | Out-Null
    $width = $rect.Right - $rect.Left
    $height = $rect.Bottom - $rect.Top
    $bitmap = New-Object System.Drawing.Bitmap $width, $height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $dc = $graphics.GetHdc()
    [MgbaProbeNative]::PrintWindow($Handle, $dc, 2) | Out-Null
    $graphics.ReleaseHdc($dc)
    $graphics.Dispose()
    $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bitmap.Dispose()
}

$resolvedRom = (Resolve-Path -LiteralPath $RomPath).Path
$resolvedState = (Resolve-Path -LiteralPath $StatePath).Path
$resolvedMgba = (Resolve-Path -LiteralPath $MgbaPath).Path
$process = Start-Process -FilePath $resolvedMgba -ArgumentList @(
    '-C', 'mute=1', '-C', 'autoload=0', '-C', 'autosave=0',
    '-t', ('"' + $resolvedState + '"'), ('"' + $resolvedRom + '"')
) -WorkingDirectory (Split-Path -Parent $resolvedMgba) -PassThru

try {
    Start-Sleep -Seconds 3
    $main = Get-ProcessWindows $process.Id | Where-Object { $_.Title -like 'mGBA - ROCKMAN*' } | Select-Object -First 1
    if (-not $main) {
        throw 'mGBA main window was not found'
    }
    Save-ProcessWindow $main.Handle $BeforeScreenshot
    for ($index = 0; $index -lt $InputPulses; $index++) {
        [MgbaProbeNative]::PostMessage($main.Handle, 0x0100, [IntPtr]0x58, [IntPtr]0x002D0001) | Out-Null
        Start-Sleep -Milliseconds 150
        [MgbaProbeNative]::PostMessage($main.Handle, 0x0101, [IntPtr]0x58, [IntPtr]0xC02D0001) | Out-Null
        Start-Sleep -Seconds 1
    }
    Start-Sleep -Seconds 2
    $windows = Get-ProcessWindows $process.Id
    Save-ProcessWindow $main.Handle $AfterScreenshot
    $fatalTitle = -join @([char]0xCE58, [char]0xBA85, [char]0xC801, [char]0xC778, [char]0x0020, [char]0xC624, [char]0xB958)
    $fatal = @($windows | Where-Object { $_.Title -eq 'Fatal error' -or $_.Title -eq $fatalTitle })
    $result = [ordered]@{
        rom = $resolvedRom
        state = $resolvedState
        mute = $true
        input_key = 'X (GBA A)'
        input_pulses = $InputPulses
        process_alive = -not $process.HasExited
        fatal_window_detected = $fatal.Count -gt 0
        window_titles = @($windows | ForEach-Object { $_.Title })
        before_screenshot = $BeforeScreenshot
        after_screenshot = $AfterScreenshot
    }
    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($ResultPath, (($result | ConvertTo-Json -Depth 4) + "`n"), $encoding)
    $result | ConvertTo-Json -Depth 4
}
finally {
    if (-not $process.HasExited) {
        Stop-Process -Id $process.Id
        $process.WaitForExit()
    }
}
