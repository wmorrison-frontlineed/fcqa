Function Assert-AwsLogin {
    param ([Parameter(Mandatory=$true)][string]$AwsProfile)

    aws sts get-caller-identity --profile $AwsProfile *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Not logged into $AwsProfile, running SSO login"
        aws sso login --profile $AwsProfile
        if ($LASTEXITCODE -ne 0) {
            throw "AWS SSO login failed for profile $AwsProfile"
        }
    }
}

Function Start-Module {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, Position=0, HelpMessage="Module alias or name from modules.json.")]
        [string]$Name
    )
    $SelectedModule = Resolve-FrontlineModule $Name

    Write-Host "Starting $($SelectedModule.name)"
    if (-not [string]::IsNullOrWhitespace($SelectedModule.awsProfile)) {
        Assert-AwsLogin $SelectedModule.awsProfile
    }
    Set-Location $SelectedModule.path
    if (-not [string]::IsNullOrWhitespace($SelectedModule.script)) {
        Invoke-Expression $SelectedModule.script
    }
}
