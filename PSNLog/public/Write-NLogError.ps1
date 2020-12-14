function Write-NLogError
{
<#
.SYNOPSIS
Writes a message on 'Error' log leve and to the Error Message stream.

.DESCRIPTION
Writes a message on 'Error' log leve and to the Error Message stream.
Can be used to override the native Write-Error CmdLet.

.PARAMETER Exception
Specifies an exception object that represents the error. Use the properties of the object to describe the error.

To create an exception object, use a hash table or use the `New-Object` cmdlet.

.PARAMETER Message
Specifies the message text of the error. If the text includes spaces or special characters, enclose it in quotation marks. You can also pipe a message string to `Write-Error`.

.PARAMETER ErrorRecord
Specifies an error record object that represents the error. Use the properties of the object to describe the
error.

To create an error record object, use the `New-Object` cmdlet or get an error record object from the array in the `$Error` automatic variable.

.PARAMETER Category
Specifies the category of the error. The default value is NotSpecified .

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

.PARAMETER ErrorId
Specifies an ID string to identify the error. The string should be unique to the error.

.PARAMETER TargetObject
Specifies the object that was being processed when the error occurred. Enter the object, a variable that contains the object, or a command that gets the object.

.PARAMETER RecommendedAction
Specifies the action that the user should take to resolve or prevent the error.

.PARAMETER CategoryActivity
Specifies the action that caused the error.

.PARAMETER CategoryReason
Specifies how or why the activity caused the error.

.PARAMETER CategoryTargetName
Specifies the name of the object that was being processed when the error occurred.

.PARAMETER CategoryTargetType
Specifies the type of the object that was being processed when the error occurred.

.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(DefaultParameterSetName = 'ErrorRecord',
						ConfirmImpact = 'None')]
	param
	(
		[Parameter(ParameterSetName = 'WithException',
					  Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  HelpMessage = 'Specifies an exception object that represents the error. Use the properties of the object to describe the error.')]
		[Exception]
		$Exception,
		[Parameter(ParameterSetName = 'NoException',
					  Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 0,
					  HelpMessage = 'Specifies the message text of the error. If the text includes spaces or special characters')]
		[Parameter(ParameterSetName = 'WithException')]
		[AllowEmptyString()]
		[AllowNull()]
		[Alias('Msg')]
		[string]
		$Message,
		[Parameter(ParameterSetName = 'ErrorRecord',
					  Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  HelpMessage = 'Specifies an error record object that represents the error.')]
		[Management.Automation.ErrorRecord]
		$ErrorRecord,
		[Parameter(ParameterSetName = 'NoException',
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Parameter(ParameterSetName = 'WithException')]
		[Management.Automation.ErrorCategory]
		$Category,
		[Parameter(ParameterSetName = 'NoException',
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Parameter(ParameterSetName = 'WithException')]
		[String]
		$ErrorId,
		[Parameter(ParameterSetName = 'NoException',
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Parameter(ParameterSetName = 'WithException')]
		[Object]
		$TargetObject,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[string]
		$RecommendedAction,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Alias('Activity')]
		[string]
		$CategoryActivity,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Alias('Reason')]
		[string]
		$CategoryReason,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Alias('TargetName')]
		[string]
		$CategoryTargetName,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true)]
		[Alias('TargetType')]
		[string]
		$CategoryTargetType
	)
	
	begin
	{
		$Logger = Get-NLogLogger
	}
	
	process
	{
		# Write to Log if possible
		if ($null -ne $Logger)
		{
			$Logger.Error($Message)
		}
		
		# Write to original Message Stream
		Microsoft.PowerShell.Utility\Write-Error @PSBoundParameters
	}
}
