
function Get-NLogLogger
{
<#
	.SYNOPSIS
		Gets a NLog Logger instance
	
	.DESCRIPTION
		The Get-NLogLogger Cmdlet gets the specified NLog logger.
		On default, the LoggerName will have the name of the calling PowerShell CmdLet\Function.
	
	.PARAMETER LoggerName
		 Specifies the name of the NLog logger
	
	.EXAMPLE
		PS C:\>$Logger = Get-NLogLogger
		
		Get a default NLog logger instance
	
	.EXAMPLE
		PS C:\>$Logger = Get-NLogLogger -LoggerName 'MyNlogLogger'
		
		Get a NLog logger instance with a specific name
	
.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(ConfirmImpact = 'None')]
	[OutputType([NLog.Logger])]
	param
	(
		[Parameter(Position = 0)]
		[string]
		$LoggerName = (Get-PSCallStack)[1].Command
	)
	
	process
	{
		[NLog.LogManager]::GetLogger($LoggerName)
	}
}
