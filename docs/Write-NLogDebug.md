---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version:
schema: 2.0.0
---

# Write-NLogDebug

## SYNOPSIS
Writes a message on 'Debug' log level and to the Debug Message stream.

## SYNTAX

```
Write-NLogDebug [-Message] <String> [<CommonParameters>]
```

## DESCRIPTION
Writes a message on 'Debug' log level and to the Debug Message stream.
Can be used to override the native Write-Debug CmdLet.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Message
Specifies the debug message to send to the console.

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
Inspired by PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster

## RELATED LINKS

[Write-Debug]()

