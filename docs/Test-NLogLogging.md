---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/jhochwald/PSNLog
schema: 2.0.0
---

# Test-NLogLogging

## SYNOPSIS
Verifies if logging is enabled.

## SYNTAX

```
Test-NLogLogging [<CommonParameters>]
```

## DESCRIPTION
The Test-NLogLogging Cmdlet verifies if logging is enabled.
Returns $true if enabled.
$false if not.

## EXAMPLES

### EXAMPLE 1
```
$Enabled = Test-NLogLogging
```

Test if logging is currently enabled

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster.
All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

## RELATED LINKS

[https://github.com/jhochwald/PSNLog](https://github.com/jhochwald/PSNLog)

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

