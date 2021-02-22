$modules = @(
        [PSCustomObject]@{
            Name = "SuperSuit-Framework-Angular";
            Alias = "ang";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-Framework-Angularjs";
            Script = "yarn develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-Jarvis";
            Alias = "jar";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-Jarvis";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-Plugin-FluidStyles";
            Alias = "pfs";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-Plugin-FluidStyles";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-Sidekick";
            Alias = "sk";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-Sidekick";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-EC-Dashboard";
            Alias = "dash";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-EC-Dashboard";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-Universal-Employee";
            Alias = "emp";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-Universal-Employee";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-EC-Forms";
            Alias = "forms";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-EC-Forms";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-EC-Settings";
            Alias = "set";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-EC-Settings";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-Universal-Overview";
            Alias = "ov";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-Universal-Overview";
            Script = "npm run develop";
        }
        [PSCustomObject]@{
            Name = "SuperSuit-UI-Module-Universal-Overview";
            Alias = "bff";
            Path = "C:\Users\wmorrison\source\frontline\SuperSuit-UI-Module-Universal-Overview";
            Script = "npm run mock-bff";
        }
    )

Function Start-Module {
    [CmdletBinding()]
    
    param (
        [Parameter(Mandatory=$false, HelpMessage="Path to working repository.")]
        [string]$Name
    )
    BEGIN {
        [PSCustomObject]$SelectedModule = $modules[0]

        if ( !([string]::IsNullOrWhitespace($Name))) {
            $SelectedModule = $modules | Where-Object {$_.Alias -eq $Name -or $_.Name -eq $Name}
        }
    }
    PROCESS {     
        Write-Host "Starting ${$SelectedModule.Name}"
        Set-Location $SelectedModule.Path
    }
    END {
        Invoke-Expression $SelectedModule.Script
    }
}

Function Start-AngularJs {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name ang
    }
    END {
    }
}

Function Start-Jarvis {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name jar
    }
    END {
    }
}

Function Start-FluidStyles {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name pfs
    }
    END {
    }
}

Function Start-Sidekick {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name sk
    }
    END {
    }
}

Function Start-Dashboard {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name dash
    }
    END {
    }
}

Function Start-Employee {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name emp
    }
    END {
    }
}

Function Start-Forms {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name forms
    }
    END {
    }
}

Function Start-Settings {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name set
    }
    END {
    }
}

Function Start-Overview {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name ov
    }
    END {
    }
}

Function Start-Bff {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name bff
    }
    END {
    }
}