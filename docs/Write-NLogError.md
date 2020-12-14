---
external help file: PSNLog-help.xml
Module Name: PSNLog
online version: https://github.com/jhochwald/PSNLog
schema: 2.0.0
---

# Write-NLogError

## SYNOPSIS
Writes a message on 'Error' log level and to the Error Message stream.

## SYNTAX

### ErrorRecord (Default)
```
Write-NLogError -ErrorRecord <ErrorRecord> [-RecommendedAction <String>] [-CategoryActivity <String>]
 [-CategoryReason <String>] [-CategoryTargetName <String>] [-CategoryTargetType <String>] [<CommonParameters>]
```

### WithException
```
Write-NLogError -Exception <Exception> [-Message <String>] [-Category <ErrorCategory>] [-ErrorId <String>]
 [-TargetObject <Object>] [-RecommendedAction <String>] [-CategoryActivity <String>] [-CategoryReason <String>]
 [-CategoryTargetName <String>] [-CategoryTargetType <String>] [<CommonParameters>]
```

### NoException
```
Write-NLogError -Message <String> [-Category <ErrorCategory>] [-ErrorId <String>] [-TargetObject <Object>]
 [-RecommendedAction <String>] [-CategoryActivity <String>] [-CategoryReason <String>]
 [-CategoryTargetName <String>] [-CategoryTargetType <String>] [<CommonParameters>]
```

## DESCRIPTION
Writes a message on 'Error' log level and to the Error Message stream.
Can be used to override the native Write-Error CmdLet.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Exception
Specifies an exception object that represents the error.
Use the properties of the object to describe the error.

To create an exception object, use a hash table or use the \`New-Object\` cmdlet.

```yaml
Type: Exception
Parameter Sets: WithException
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Message
Specifies the message text of the error.
If the text includes spaces or special characters, enclose it in quotation marks.
You can also pipe a message string to \`Write-Error\`.

```yaml
Type: String
Parameter Sets: WithException
Aliases: Msg

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: NoException
Aliases: Msg

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorRecord
Specifies an error record object that represents the error.
Use the properties of the object to describe the
error.

To create an error record object, use the \`New-Object\` cmdlet or get an error record object from the array in the \`$Error\` automatic variable.

```yaml
Type: ErrorRecord
Parameter Sets: ErrorRecord
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Category
Specifies the category of the error.
The default value is NotSpecified .

The acceptable values for this parameter are:
- NotSpecified
- OpenError
- CloseError
- DeviceError
- DeadlockDetected
- InvalidArgument
- InvalidData
- InvalidOperation
- InvalidResult
- InvalidType
- MetadataError
- NotImplemented
- NotInstalled
- ObjectNotFound

```yaml
Type: ErrorCategory
Parameter Sets: WithException
Aliases:
Accepted values: NotSpecified, OpenError, CloseError, DeviceError, DeadlockDetected, InvalidArgument, InvalidData, InvalidOperation, InvalidResult, InvalidType, MetadataError, NotImplemented, NotInstalled, ObjectNotFound, OperationStopped, OperationTimeout, SyntaxError, ParserError, PermissionDenied, ResourceBusy, ResourceExists, ResourceUnavailable, ReadError, WriteError, FromStdErr, SecurityError, ProtocolError, ConnectionError, AuthenticationError, LimitsExceeded, QuotaExceeded, NotEnabled

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: ErrorCategory
Parameter Sets: NoException
Aliases:
Accepted values: NotSpecified, OpenError, CloseError, DeviceError, DeadlockDetected, InvalidArgument, InvalidData, InvalidOperation, InvalidResult, InvalidType, MetadataError, NotImplemented, NotInstalled, ObjectNotFound, OperationStopped, OperationTimeout, SyntaxError, ParserError, PermissionDenied, ResourceBusy, ResourceExists, ResourceUnavailable, ReadError, WriteError, FromStdErr, SecurityError, ProtocolError, ConnectionError, AuthenticationError, LimitsExceeded, QuotaExceeded, NotEnabled

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorId
Specifies an ID string to identify the error.
The string should be unique to the error.

```yaml
Type: String
Parameter Sets: WithException
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: NoException
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetObject
Specifies the object that was being processed when the error occurred.
Enter the object, a variable that contains the object, or a command that gets the object.

```yaml
Type: Object
Parameter Sets: WithException
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: Object
Parameter Sets: NoException
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RecommendedAction
Specifies the action that the user should take to resolve or prevent the error.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -CategoryActivity
Specifies the action that caused the error.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Activity

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -CategoryReason
Specifies how or why the activity caused the error.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Reason

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -CategoryTargetName
Specifies the name of the object that was being processed when the error occurred.

```yaml
Type: String
Parameter Sets: (All)
Aliases: TargetName

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -CategoryTargetType
Specifies the type of the object that was being processed when the error occurred.

```yaml
Type: String
Parameter Sets: (All)
Aliases: TargetType

Required: False
Position: Named
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

