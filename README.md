# Simple PowerShell Logger Module
This is a simple Module I have to be created to handle with logging inside of my scripts and modules.

## Installation
To install the Module form the PowerShell Gallery please use the below command:

``` PowerShell
Install-Module -Name SimplePowerShellLogger
```

[PowerShell Gallery Page](https://www.powershellgallery.com/packages/SimplePowerShellLogger/0.1)

## Examples

1. Create a New Log Called 'DeploymentLog' in the default location.
``` PowerShell
 $Logger = New-Logger -Name 'DeploymentLog'
 $Logger.Log('Create a New Log Entry')
```

This will create the log file at ` C:\PSLogging\Log.`**$LogName**`.dd.mm.yyyy.log` and add a new entry with the specified text e.g.:
```
[2018.04.21-15.19.00]:[DeploymentLog] Create a New Log Entry
```

2. Create a New Log at the Specified Path
``` PowerShell
#Prepare the Path Variable
$LogPath = 'D:\Logs\Deployment.' + $(get-date -Format 'yyyy.MM.dd').ToString() + '.log'
#Create the Logger Class
$Logger = New-Logger -Name 'DeploymentLog' -FilePath $LogPath
#Write to the Log file and console.
$Logger.Log('Deployment Script Started')
```

## PowerShell Help Files
The help documents for this module are created using PlatyPS which converts markdown to PowerShell help files.

The Documentation can be found in the `.\docs` folder.

If updating the help files please run the following commands to update the PowerShell help files aswell.

``` PowerShell
#If necessary istall the PlatyPS module
#Install-Module PlatyPS
Import-Module PlatyPS
Import-Module .\Logger.psd1 -Force

Update-MarkdownHelp .\docs
```

## To Do
1. Add Pester Tests

# License


### MIT License

Copyright (c) 2018 Liam Townsend

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.