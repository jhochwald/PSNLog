function Set-ScriptRoot
{
	<#
         .SYNOPSIS
         Sets the 'scriptroot' variable.

         .DESCRIPTION
         Sets the NLog 'scriptroot' variable to the location of the calling script.
         This variable can be used to automatically create log files at the same location as the script.

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/jhochwald/PSNLog

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>
	[CmdletBinding(ConfirmImpact = 'None')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
	[CmdLetBinding()]
	param()

	process
 {
		if (-not ([NLog.LogManager]::Configuration))
		{
			[NLog.LogManager]::Configuration = (New-Object -TypeName NLog.Config.LoggingConfiguration)
		}

		$ScriptName = (Get-PSCallStack | Select-Object -Last 1 -ExpandProperty 'ScriptName')

		if ([string]::IsNullOrEmpty($ScriptName))
		{
			$ScriptLocation = ((Get-Location).ToString())
		}
		else
		{
			$ScriptLocation = (Split-Path -Path $ScriptName -Parent)
		}
		[NLog.LogManager]::Configuration.Variables['scriptroot'] = $ScriptLocation
	}
}
