#requires -Version 2.0

<#
.SYNOPSIS
PSNlog.Initialize.ps1

.DESCRIPTION
PSNlog.Initialize.ps1

.EXAMPLE
PS C:\> .\PSNlog.Initialize.ps1

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
	# Create a logger instance in module scope
	$Script:Logger = (Get-NLogLogger -LoggerName 'PSNLog')
	
	# Create a 'scriptroot' variable based on the script file importing the module or the current location
	# This eases defining a proper log path
	Set-ScriptRoot
	
	# Add CMTrace Layout renderer
	Add-CMTraceLayoutRenderer
}
	