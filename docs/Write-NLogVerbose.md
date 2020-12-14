---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/jhochwald/PSNLog
schema: 2.0.0
---

# Write-NLogVerbose

## SYNOPSIS
Writes a message on 'Debug' log level and to the Verbose Message stream.

## SYNTAX

```
Write-NLogVerbose [-Message] <String> [<CommonParameters>]
```

## DESCRIPTION
Writes a message on 'Debug' log level and to the Verbose Message stream.
Can be used to override the native Write-Verbose CmdLet.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Message
Specifies the message to display.
This parameter is required.
You can also pipe a message string to Write-NLogVerbose.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Msg

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

## NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster.
All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

## RELATED LINKS

[https://github.com/jhochwald/PSNLog](https://github.com/jhochwald/PSNLog)

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

[Write-Verbose]()

