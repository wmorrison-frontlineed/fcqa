Set-Location 'C:\Users\wmorrison\Documents\WindowsPowerShell\Modules\FCTools'
$config = (Get-Content modules.json | Out-String | ConvertFrom-Json)

Function Set-Module {
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
        Write-Host "Set-Location ${$SelectedModule.name}"
        Set-Location $SelectedModule.path
    }
    END {
    }
}

Function Set-UI {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name ui
    }
    END {
    }
}

Function Set-AngularJs {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name ang
    }
    END {
    }
}

Function Set-Jarvis {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name jar
    }
    END {
    }
}

Function Set-FluidStyles {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name pfs
    }
    END {
    }
}

Function Set-Sidekick {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name sk
    }
    END {
    }
}

Function Set-Dashboard {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name dash
    }
    END {
    }
}

Function Set-Employee {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name emp
    }
    END {
    }
}

Function Set-Forms {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name forms
    }
    END {
    }
}

Function Set-Settings {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name set
    }
    END {
    }
}

Function Set-Overview {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name ov
    }
    END {
    }
}

Function Set-Bff {
    [CmdletBinding()]
    param ()
    BEGIN {
    }
    PROCESS {
        Set-Module -Name bff
    }
    END {
    }
}