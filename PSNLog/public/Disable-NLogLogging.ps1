function Disable-NLogLogging
{
<#
	.SYNOPSIS
		Disables all logging.
	
	.DESCRIPTION
		The Disable-NLogLogging Cmdlet disables all global logging.
	
	.EXAMPLE
		PS C:>Disable-NLogLogging
		
		Disable all logging
	
.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(ConfirmImpact = 'None')]
	param ()
	
	process
	{
		do
		{
			if ([NLog.Logmanager]::IsLoggingEnabled())
			{
				$null = [NLog.Logmanager]::DisableLogging()
			}
		}
		while ([NLog.Logmanager]::IsLoggingEnabled())
	}
}
