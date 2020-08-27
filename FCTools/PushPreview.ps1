Function Push-Preview {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, HelpMessage="Path to working repository.")]
        [string]$SourceRepo = (Get-Item .).FullName,
        [Parameter(Mandatory=$false, HelpMessage="Path to QA repository.")]
        [string]$QaRepo = "C:\Users\wmorrison\source\fcqa",
        [string]$branch = (git rev-parse --abbrev-ref HEAD)
    )
    BEGIN {        
        if  ( !( Test-Path -Path $QaRepo -PathType "Container" ) ) {
            
            Write-Verbose "Create QA repository folder in: $QaRepo"
            New-Item -Path $QaRepo -ItemType "Container" -ErrorAction Stop -ForegroundColor Green
        
            if ( !( Test-Path -Path $QaRepo/$branch -PathType "Container" ) ) {
                Write-Verbose "Create story folder $branch in $QaRepo"
                New-Item -Path $QaRepo/$branch -ItemType "Container" -ErrorAction Stop -ForegroundColor Green
            }
        }
        $node = Get-Process node -ErrorAction SilentlyContinue
        if ( $node ) {
            Write-Verbose "Stopping node process"
            $node | Stop-Process -Force
        }
    }
    PROCESS {
        npm run build
        cp build/* $QaRepo/$branch
        cd $QaRepo/; git add .; git commit -m "updates"; git push origin master;
        cd $SourceRepo       
    }
    END {
        Write-Host "Deployed at https://wmorrison-frontlineed.github.io/fcqa/$branch" -ForegroundColor Blue
    }
}