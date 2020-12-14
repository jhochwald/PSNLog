function Write-NLogDebug
{
<#
.SYNOPSIS
Writes a message on 'Debug' log level and to the Debug Message stream.

.DESCRIPTION
Writes a message on 'Debug' log level and to the Debug Message stream.
Can be used to override the native Write-Debug CmdLet.

.PARAMETER Message
Specifies the debug message to send to the console.

.NOTES
Inspired by PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster

.LINK
Write-Debug
#>
	
	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 0,
					  HelpMessage = 'Specifies the debug message to send to the console.')]
		[AllowEmptyString()]
		[Alias('Msg')]
		[string]
		$Message
	)
	
	begin
	{
		$Logger = (Get-NLogLogger)
	}
	
	process
	{
		# Write to Log if possible
		if ($null -ne $Logger)
		{
			$Logger.Debug($Message)
		}
		
		# Write to original Message Stream
		Microsoft.PowerShell.Utility\Write-Debug @PSBoundParameters
	}
}
