function Write-NLogOutput
{
<#
.SYNOPSIS
Writes a message on 'Info' log level and to the Output.

.DESCRIPTION
Writes a message on 'Info' log level and to the Output.
Can be used to override the native Write-Host CmdLet.

.PARAMETER InputObject
Specifies the objects to send down the pipeline. Enter a variable that contains the objects, or type a command or expression that gets the objects.

.PARAMETER NoEnumerate
By default, the `Write-Output` cmdlet always enumerates its output.
The NoEnumerate parameter suppresses the default behavior, and prevents `Write-Output` from enumerating output.
The NoEnumerate parameter has no effect on collections that were created by wrapping commands in parentheses, because the parentheses force enumeration.

> [!IMPORTANT] > There is an issue with this switch in Windows PowerShell that is fixed in PowerShell 6.2 and above. > When using NoEnumerate

.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
	
	.LINK
	Write-Output
#>
	
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true,
					  ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 0,
					  HelpMessage = 'Specifies the objects to send down the pipeline.')]
		[AllowEmptyString()]
		[Alias('Msg', 'Message')]
		[System.Management.Automation.PSObject[]]
		$InputObject,
		[Parameter(ValueFromPipeline = $true,
					  ValueFromPipelineByPropertyName = $true,
					  Position = 1)]
		[switch]
		$NoEnumerate
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
			$Logger.Debug($InputObject)
		}
		
		# Write to original Message Stream
		Microsoft.PowerShell.Utility\Write-Output @PSBoundParameters
	}
}
