function Test-NLogLogging
{
<#
	.SYNOPSIS
		Verifies if logging is enabled.
	
	.DESCRIPTION
		The Test-NLogLogging Cmdlet verifies if logging is enabled.
		Returns $true if enabled. $false if not.
	
	.EXAMPLE
		PS C:>$Enabled = Test-NLogLogging
		
		Test if logging is currently enabled
	
.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(ConfirmImpact = 'None')]
	[OutputType([bool])]
	param ()
	
	process
	{
		[NLog.Logmanager]::IsLoggingEnabled()
	}
}
