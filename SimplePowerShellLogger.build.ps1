#Install-Module Pester -Force
#Install-Module PSScriptAnalyzer -Force

Import-Module PSScriptAnalyzer
Import-Module Pester

#Analyze
$scriptAnalyzerParams = @{
    Path = ".\Functions\New-Logger.ps1"
    Severity = @('Error', 'Warning')
    Recurse = $true
    Verbose = $false
    ExcludeRule = 'PSUseDeclaredVarsMoreThanAssignments'
}
$saResults = Invoke-ScriptAnalyzer @scriptAnalyzerParams

if ($saResults) {
    $saResults | Format-Table
    Write-Host "One or more PSScriptAnalyzer errors/warnings where found." -ForegroundColor Red
}


#Test
$invokePesterParams = @{
    Strict = $true
    PassThru = $true
    Verbose = $false
    EnableExit = $false
}

# Invoke Pester Tests
$testResults = Invoke-Pester @invokePesterParams;

$numberFails = $testResults.FailedCount
if ($numberFailes -ne 0) {
    Write-Host 'Failed "{0}" unit tests.' -f $numberFails
}

