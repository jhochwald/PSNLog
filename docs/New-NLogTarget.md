---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/MaikKoster/PSNLog
schema: 2.0.0
---

# New-NLogTarget

## SYNOPSIS
Creates a new NLog logging target.

## SYNTAX

### ByTypeName (Default)
```
New-NLogTarget [[-Name] <String>] [-TargetType] <String> [<CommonParameters>]
```

### NullTarget
```
New-NLogTarget [[-Name] <String>] [-NullTarget] [<CommonParameters>]
```

### ConsoleTarget
```
New-NLogTarget [[-Name] <String>] [-ConsoleTarget] [<CommonParameters>]
```

### DatabaseTarget
```
New-NLogTarget [[-Name] <String>] [-DatabaseTarget] [<CommonParameters>]
```

### DebugTarget
```
New-NLogTarget [[-Name] <String>] [-DebugTarget] [<CommonParameters>]
```

### EventLogTarget
```
New-NLogTarget [[-Name] <String>] [-EventLogTarget] [<CommonParameters>]
```

### FileTarget
```
New-NLogTarget [[-Name] <String>] [-FileTarget] [<CommonParameters>]
```

### MailTarget
```
New-NLogTarget [[-Name] <String>] [-MailTarget] [<CommonParameters>]
```

### MemoryTarget
```
New-NLogTarget [[-Name] <String>] [-MemoryTarget] [<CommonParameters>]
```

### NetworkTarget
```
New-NLogTarget [[-Name] <String>] [-NetworkTarget] [<CommonParameters>]
```

### NLogViewerTarget
```
New-NLogTarget [[-Name] <String>] [-NLogViewerTarget] [<CommonParameters>]
```

### PerformanceCounterTarget
```
New-NLogTarget [[-Name] <String>] [-PerformanceCounterTarget] [<CommonParameters>]
```

### WebServiceTarget
```
New-NLogTarget [[-Name] <String>] [-WebServiceTarget] [<CommonParameters>]
```

## DESCRIPTION
The New-NLogTarget Cmdlet returns a new NLog logging target.

## EXAMPLES

### EXAMPLE 1
```
$FileTarget = New-NLogTarget -Name 'AllWarnings' -FileTarget
```

PS C:\\\>$FileTarget.FileName = 'C:\Temp\AllWarnings.log'

Create a new file target

## PARAMETERS

### -Name
If no name is supplied, a random string will be used
Specifies the Name of the target

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -TargetType
Can be used to create targets not explicitly covered by any switch
Specifies the type name of the target.

```yaml
Type: String
Parameter Sets: ByTypeName
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -NullTarget
NullTargets discards any log messages.
Used mainly for debugging and benchmarking.
Specifies to create a new NullTarget

```yaml
Type: SwitchParameter
Parameter Sets: NullTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ConsoleTarget
Writes log messages to the console.
Specifies to create a new ConsoleTarget

```yaml
Type: SwitchParameter
Parameter Sets: ConsoleTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -DatabaseTarget
Writes log messages to the database using an ADO.NET provider.
Specifies to create a new DatabaseTarget

```yaml
Type: SwitchParameter
Parameter Sets: DatabaseTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -DebugTarget
Mock target - useful for testing.
Specifies to create a new DebugTarget

```yaml
Type: SwitchParameter
Parameter Sets: DebugTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -EventLogTarget
Writes log message to the Event Log.
Specifies to create a new EventLogTarget

```yaml
Type: SwitchParameter
Parameter Sets: EventLogTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -FileTarget
Writes log messages to one or more files.
Specifies to create a new FileTarget

```yaml
Type: SwitchParameter
Parameter Sets: FileTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -MailTarget
Sends log messages by email using SMTP protocol.
Specifies to create a new MailTarget

```yaml
Type: SwitchParameter
Parameter Sets: MailTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -MemoryTarget
Writes log messages to an ArrayList in memory for programmatic retrieval.
Specifies to create a new MemoryTarget

```yaml
Type: SwitchParameter
Parameter Sets: MemoryTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -NetworkTarget
Sends log messages over the network.
Specifies to create a new NetworkTarget

```yaml
Type: SwitchParameter
Parameter Sets: NetworkTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -NLogViewerTarget
Sends log messages to the remote instance of NLog Viewer.
Specifies to create a new NLogViewerTarget

```yaml
Type: SwitchParameter
Parameter Sets: NLogViewerTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -PerformanceCounterTarget
Increments specified performance counter on each write.
Specifies to create a new PerformanceCounterTarget

```yaml
Type: SwitchParameter
Parameter Sets: PerformanceCounterTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -WebServiceTarget
Calls the specified web service on each log message.
Specifies to create a new WebServiceTarget

```yaml
Type: SwitchParameter
Parameter Sets: WebServiceTarget
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### NLog.Targets.Target
## NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster.
All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

## RELATED LINKS

[https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

