Function Push-Preview {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, HelpMessage="Path to working repository.")]
        [string]$SourceRepo = (Get-Item .).FullName,
        [Parameter(Mandatory=$false, HelpMessage="Path to QA repository.")]
        [string]$QaRepo = "C:\Users\wmorrison\source\fcqa",
        [Parameter(Mandatory=$false, HelpMessage="FCQA Deployment Location.")]
        [string]$Destination = (git rev-parse --abbrev-ref HEAD) + "-" + (Split-Path -Path (Get-Location) -Leaf).split("-")[-1]
    )
    BEGIN {
        if  ( !( Test-Path -Path $QaRepo -PathType "Container" ) ) {            
            Write-Verbose "Create QA repository folder in: $QaRepo"
            New-Item -Path $QaRepo -ItemType "Container" -ErrorAction Stop
        
        }
        
        if ( !( Test-Path -Path $QaRepo/$Destination -PathType "Container" ) ) {
            Write-Verbose "Create story folder $Destination"
            New-Item -Path $QaRepo/$Destination -ItemType "Container" -ErrorAction Stop
        }

        # $node = Get-Process node -ErrorAction SilentlyContinue
        # if ( $node ) {
        #     Write-Verbose "Stopping node process"
        #     $node | Stop-Process -Force
        # }
    }
    PROCESS {        
        npm run build
        Copy-Item -Path build/* -Destination $QaRepo/$Destination -Recurse -Force
        Set-Location $QaRepo
        git add .;
        git commit -m "updates for $Destination";
        git push origin master;
        Set-Location $SourceRepo
    }
    END {
        Write-Host "Deployed at https://wmorrison-frontlineed.github.io/fcqa/$Destination" -ForegroundColor Blue
    }
}