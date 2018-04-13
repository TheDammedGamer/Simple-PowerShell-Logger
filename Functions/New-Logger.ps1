
class Logger {
    [string]$FilePath
    [string]$Name
    [void]Log([string]$Text) {
        $str = "[" + $(get-date -Format "yyyy.MM.dd-HH.mm.ss") + "]:[" + $this.Name + "] " + ": " + $Text
        Add-Content -Path $this.FilePath -Value $str
        Write-Host $str
    }
    Logger([string]$FilePath, [string]$Name) {
        $this.FilePath = $FilePath
        $this.Name = $Name
        #Write-Host $FilePath
        New-item -Path $this.FilePath -ItemType file -Force | out-null
        $this.Log("Starting new log")
    }
}

function New-Logger {
    [CmdletBinding()]
    param(
    [Parameter(Position=0, Mandatory=$true)] [string]$Name,
    [Parameter(Position=1, Mandatory=$false)] [string]$FilePath
    )
    process {
        if (($FilePath -eq $null) -or ($FilePath -eq '')) {
            $FilePath = "C:\PSLogging\Log." + $Name + "." + $(Get-Date -Format 'dd.MM.yyy') + ".log"
        }
        #Write-Host "FilePath: " $FilePath
        $Logger = [Logger]::new($FilePath, $Name)
        return $Logger
    }
}