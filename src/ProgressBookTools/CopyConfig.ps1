Function Copy-Config {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, HelpMessage="Path to repository.")]
        [string]$SourceRepo = (Get-Item .).FullName
    )
    BEGIN {
        Set-Location $SourceRepo
    }
    PROCESS {
        $sampleFiles = Get-ChildItem -filter *.sample -Recurse | Select-Object FullName

        $sampleFiles | ForEach-Object{
            Copy-Item $_.FullName -Destination ($_.FullName -replace '.sample', '')
        }
    }
    END {
        Write-Host "Configuration Files Generated Successfully" -ForegroundColor Blue
    }
}
