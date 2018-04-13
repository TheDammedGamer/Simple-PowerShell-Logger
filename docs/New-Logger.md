---
external help file: Logger-help.xml
Module Name: Logger
online version:
schema: 2.0.0
---

# New-Logger

## SYNOPSIS
This Creates an Instance of the Logger Class to enable simple loggging for scripts and modules.

## SYNTAX

```
New-Logger [-Name] <String> [[-FilePath] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> $Logger = New-Logger -Name 'DeploymentLog'
PS C:\> $Logger.Log("Create a New Log Entry")
```
This command will create a new instance of the logger class at the default location with the Name of 'DeploymentLog'.

The default location for a log file is `C:\PSLogging\` and the file name follows this format `Log.$LogName.dd.MM.yyyy.log1`.


### Example 2
```powershell
PS C:\> $LogPath = 'D:\Logs\Deployment.' + $(get-date -Format "yyyy.MM.dd").ToString() + '.log'
PS C:\> $Logger = New-Logger -Name 'DeploymentLog' -FilePath $LogPath
PS C:\> $Logger.Log('Deployment Script Started')
```

This example will create a new instance of the logger class uaing the specifed path with the name of 'DeploymentLog'

## PARAMETERS

### -Name
This is the name of the log used within the log file and in the default file path.

```yaml
Type: String
Parameter Sets: (All)
Aliases: None

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
This is the file path used to overide the default file path.

```yaml
Type: String
Parameter Sets: (All)
Aliases:None

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```



### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None


## OUTPUTS

### Logger
This cmdlet returns a **Logger** object.

This object contains the following parameters and Methods

**Parameters**

`$FilePath`

This Parameter contains the filepath that the Logger Will write to. It is a **string** object.

`$Name`

This Parameter contains the name of thew logger class used when writing to the log. It is a **string** object.

**Methods**

` Log(<string>)`

This method logs the string to the Output window and to the command line.

## NOTES

## RELATED LINKS
