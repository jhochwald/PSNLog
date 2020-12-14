---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/MaikKoster/PSNLog
schema: 2.0.0
---

# Write-NLogOutput

## SYNOPSIS
Writes a message on 'Info' log level and to the Output.

## SYNTAX

```
Write-NLogOutput [-InputObject] <String> [-NoEnumerate] [<CommonParameters>]
```

## DESCRIPTION
Writes a message on 'Info' log level and to the Output.
Can be used to override the native Write-Host CmdLet.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -InputObject
Specifies the objects to send down the pipeline.
Enter a variable that contains the objects, or type a command or expression that gets the objects.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Msg, Message

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -NoEnumerate
By default, the \`Write-Output\` cmdlet always enumerates its output.
The NoEnumerate parameter suppresses the default behavior, and prevents \`Write-Output\` from enumerating output.
The NoEnumerate parameter has no effect on collections that were created by wrapping commands in parentheses, because the parentheses force enumeration.

\> \[!IMPORTANT\] \> There is an issue with this switch in Windows PowerShell that is fixed in PowerShell 6.2 and above.
\> When using NoEnumerate

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
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

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

[Write-Output]()

