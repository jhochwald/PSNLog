---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version:
schema: 2.0.0
---

# Write-NLogInfo

## SYNOPSIS
Writes a message on 'Info' log level and to the Info Message stream.

## SYNTAX

```
Write-NLogInfo [-MessageData] <Object> [[-Tags] <String>] [<CommonParameters>]
```

## DESCRIPTION
Writes a message on 'Info' log level and to the Info Message stream.
Can be used to override the native Write-Verbose CmdLet.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -MessageData
Specifies an informational message that you want to display to users as they run a script or command.
For best results, enclose the informational message in quotation marks.
An example is "Test complete."

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Msg, Message

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Tags
Specifies a simple string that you can use to sort and filter messages that you have added to the information stream with \`Write-Information\`.

This parameter works similarly to the Tags parameter in \`New-ModuleManifest\`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[Write-Information]()

