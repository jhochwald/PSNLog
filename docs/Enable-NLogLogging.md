---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/jhochwald/PSNLog
schema: 2.0.0
---

# Enable-NLogLogging

## SYNOPSIS
Enables simple logging for trivial logging cases.

## SYNTAX

### ByFilename (Default)
```
Enable-NLogLogging [[-Filename] <String>] [-MinimumLevel <String>] [-Layout <String>] [-DontRedirectMessages]
 [<CommonParameters>]
```

### ByTarget
```
Enable-NLogLogging -Target <Target> [-MinimumLevel <String>] [-DontRedirectMessages] [<CommonParameters>]
```

## DESCRIPTION
The Enable-NLogLogging Cmdlet allows to quickly enable some simple logging
for trivial logging cases.

## EXAMPLES

### EXAMPLE 1
```
Enable-NLogLogging -FilePath 'C:\Temp\MyLogging.log'
```

Quickly configure NLog so that all messages above and including the Debug level are written to a file.
It automatically logs all existing Write-Verbose messages to Debug, Write-Host to Info, Write-Warning
to Warn and Write-Error to Error.

### EXAMPLE 2
```
Enable-NLogLogging -FilePath 'C:\Temp\MyLogging.log' -MinimumLevel Warn -DontRedirectMessages
```

Quickly configure NLog so that all messages above and including the Warn level are written to a file.
But it does not redirect the calls to Write-Verbose, Write-Host, Write-Warning or Write-Error.

### EXAMPLE 3
```
$Target = New-NLogTarget -Name 'Warnings' -FileTarget
```

PS C:\\\>$Target.Filename = 'C:\Temp\MyLogging.log'
PS C:\\\>$Target.CreateDirs = $true
PS C:\\\>Enable-NLogLogging -Target $Target -MinLevel Warn

Quickly configure NLog so that all messages above and including the Warn level are written to target.

## PARAMETERS

### -Filename
Specifies the Filename to write log messages to.

```yaml
Type: String
Parameter Sets: ByFilename
Aliases: FilePath, FullName

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Target
Specifies the Target to write log messages to.

```yaml
Type: Target
Parameter Sets: ByTarget
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MinimumLevel
Specifies the minimum log level.

```yaml
Type: String
Parameter Sets: (All)
Aliases: MinLevel

Required: False
Position: Named
Default value: Info
Accept pipeline input: False
Accept wildcard characters: False
```

### -Layout
Specifies the log message layout used to write to the file target

```yaml
Type: String
Parameter Sets: ByFilename
Aliases:

Required: False
Position: Named
Default value: ${cmtrace}
Accept pipeline input: False
Accept wildcard characters: False
```

### -DontRedirectMessages
Write-Error -\> Log message on 'Error' level
Write-Warning -\> Log message on 'Warning' level
Write-Host -\> Log message on 'Info' level
Write-Verbose -\> Log message on 'Debug' level
If set, the following configuration will be applied
redirected to the logging Target automagically.
Specifies, if Messages written to Write-Verbose/Write-Host/Write-Warning/Write-Error should be

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster.
All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

## RELATED LINKS

[https://github.com/jhochwald/PSNLog](https://github.com/jhochwald/PSNLog)

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

