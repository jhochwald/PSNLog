function Write-NLogInfo
{
<#
	.SYNOPSIS
		Writes a message on 'Info' log level and to the Info Message stream.
	
	.DESCRIPTION
		Writes a message on 'Info' log level and to the Info Message stream.
		Can be used to override the native Write-Verbose CmdLet.
	
	.PARAMETER MessageData
		Specifies an informational message that you want to display to users as they run a script or command. For best results, enclose the informational message in quotation marks.
		An example is "Test complete."
	
	.PARAMETER Tags
		Specifies a simple string that you can use to sort and filter messages that you have added to the information stream with `Write-Information`.
		
		This parameter works similarly to the Tags parameter in `New-ModuleManifest`.
	
.NOTES
Inspired by PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
	
	.LINK
	Write-Information
#>
	
	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 0,
					  HelpMessage = 'Specifies an informational message that you want to display to users as they run a script or command.')]
		[AllowEmptyString()]
		[Alias('Msg', 'Message')]
		[object]
		$MessageData,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 1)]
		[string]
		$Tags
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
			$Logger.Info($MessageData)
		}
		
		# Write to original Message Stream
		Microsoft.PowerShell.Utility\Write-Information @PSBoundParameters
	}
}
