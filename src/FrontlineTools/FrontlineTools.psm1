$script:Config = Get-Content (Join-Path $PSScriptRoot 'modules.json') -Raw | ConvertFrom-Json

function Resolve-FrontlineModule {
    param ([string]$Name)

    if ([string]::IsNullOrWhitespace($Name)) {
        return $script:Config.modules[0]
    }

    $match = $script:Config.modules | Where-Object { $_.alias -eq $Name } | Select-Object -First 1
    if (-not $match) {
        $match = $script:Config.modules | Where-Object { $_.name -eq $Name } | Select-Object -First 1
    }
    if (-not $match) {
        throw "Unknown module '$Name'. Known aliases: $(($script:Config.modules.alias) -join ', ')"
    }
    return $match
}

. $PSScriptRoot\SetModule.ps1
. $PSScriptRoot\StartModule.ps1

Register-ArgumentCompleter -CommandName Set-Module, Start-Module -ParameterName Name -ScriptBlock {
    param ($commandName, $parameterName, $wordToComplete)
    $script:Config.modules.alias |
        Where-Object { $_ -like "$wordToComplete*" } |
        ForEach-Object { [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_) }
}

Set-Alias -Name cwd -Value Set-Module
Set-Alias -Name launch -Value Start-Module

Export-ModuleMember -Function Set-Module, Start-Module -Alias cwd, launch
