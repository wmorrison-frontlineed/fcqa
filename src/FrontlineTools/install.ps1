[CmdletBinding()]
param (
    [Parameter(HelpMessage="Junction the install folder to this repo instead of copying, so edits apply immediately.")]
    [switch]$Link
)

$ModuleName = 'FrontlineTools'
$Source = $PSScriptRoot

$UserModules = Join-Path ([Environment]::GetFolderPath('MyDocuments')) (
    $(if ($PSVersionTable.PSEdition -eq 'Core') { 'PowerShell' } else { 'WindowsPowerShell' }) + '\Modules')
$Target = Join-Path $UserModules $ModuleName

if (-not (Test-Path $UserModules)) {
    New-Item -ItemType Directory -Path $UserModules | Out-Null
}

Test-ModuleManifest (Join-Path $Source "$ModuleName.psd1") | Out-Null

Remove-Module $ModuleName -ErrorAction SilentlyContinue

if (Test-Path $Target) {
    # A junction is removed without touching the repo; a copied folder is deleted outright.
    if ((Get-Item $Target).LinkType) { (Get-Item $Target).Delete() } else { Remove-Item $Target -Recurse -Force }
}

if ($Link) {
    New-Item -ItemType Junction -Path $Target -Target $Source | Out-Null
    Write-Host "Linked $Target -> $Source"
} else {
    New-Item -ItemType Directory -Path $Target | Out-Null
    Copy-Item (Join-Path $Source '*') $Target -Recurse -Exclude 'install.ps1', 'create-powershell-manifest.ps1'
    Write-Host "Copied module to $Target"
}

Import-Module $ModuleName -Force
Get-Command -Module $ModuleName | Select-Object Name, Version | Format-Table -AutoSize
