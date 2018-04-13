
class Logger {
    #Where the Logger Will write to
    [string]$FilePath
    #the Name used in the file
    [string]$Name
    [void]Log([string]$Text) {
        #Format: [2018.01.01-12.00.00]:[LogName] Text
        $str = "[" + $(get-date -Format "yyyy.MM.dd-HH.mm.ss") + "]:[" + $this.Name + "] " + $Text
        #Add to the Log File
        Add-Content -Path $this.FilePath -Value $str
        #Write to the console
        Write-Host $str
    }
    Logger([string]$FilePath, [string]$Name) {
        $this.FilePath = $FilePath
        $this.Name = $Name
        #If the FilePath does not exist
        if (!$(Test-Path $this.FilePath)) {
            #Create the log file and don't return anything
            New-item -Path $this.FilePath -ItemType file -Force | out-null
        }
        #Write to the File
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
        #Check whether filepath has been passed through
        if (($FilePath -eq $null) -or ($FilePath -eq '')) {
            #Format: C:\PSLogging\Log.LogName.01.01.18.log
            $FilePath = "C:\PSLogging\Log." + $Name + "." + $(Get-Date -Format 'dd.MM.yyy') + ".log"
        }
        # create a new instance of the logger class
        $Logger = [Logger]::new($FilePath, $Name)
        #pass the logger back
        return $Logger
    }
}