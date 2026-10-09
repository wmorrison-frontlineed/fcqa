Function Set-Module {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, Position=0, HelpMessage="Module alias or name from modules.json.")]
        [string]$Name
    )
    $SelectedModule = Resolve-FrontlineModule $Name

    Write-Host "Changing working directory to $($SelectedModule.name)"
    Set-Location $SelectedModule.path
}
