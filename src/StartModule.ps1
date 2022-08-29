Set-Location 'C:\Users\wmorrison\Documents\WindowsPowerShell\Modules\FCTools'
$config = (Get-Content modules.json | Out-String | ConvertFrom-Json)

Function Start-Module {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$false, HelpMessage="Path to working repository.")]
        [string]$Name
    )
    BEGIN {
        [PSCustomObject]$SelectedModule = $config.modules[0]

        if ( !([string]::IsNullOrWhitespace($Name))) {
            $SelectedModule = $config.modules | Where-Object {$_.alias -eq $Name -or $_.name -eq $Name}
        }
    }
    PROCESS {     
        Write-Host "Starting $($SelectedModule.name)"
        Set-Location $SelectedModule.path
    }
    END {
        Invoke-Expression $SelectedModule.script
    }
}

Function Start-UI-Shared {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name ui-shared
    }
    END {
    }
}

Function Start-UI-Settings {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name ui-settings
    }
    END {
    }
}

Function Start-UI-Staff {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Start-Module -Name ui-staff
    }
    END {
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