---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/jhochwald/PSNLog
schema: 2.0.0
---

# Read-NLogConfiguration

## SYNOPSIS
Returns a NLog configuration based on a configuration file.

## SYNTAX

```
Read-NLogConfiguration [-Filename] <String> [<CommonParameters>]
```

## DESCRIPTION
The Read-NLogConfiguration Cmdlet returns the specified NLog logging configuration

## EXAMPLES

### EXAMPLE 1
```
$Config = Read-NLogConfiguration '.\Sample.config'
```

Read configuration from config file

### EXAMPLE 2
```
Read-NLogConfiguration '.\Sample.config' | Set-NLogConfiguration
```

Read configuration from config file and set as configuration for all logging.

## PARAMETERS

### -Filename
Specifies the name and path to the NLog configuration file

```yaml
Type: String
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### NLog.Config.LoggingConfiguration
## NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster.
All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

## RELATED LINKS

[https://github.com/jhochwald/PSNLog](https://github.com/jhochwald/PSNLog)

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

