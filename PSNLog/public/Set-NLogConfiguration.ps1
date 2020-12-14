function Set-NLogConfiguration
{
	<#
         .SYNOPSIS
         Sets the NLog logging configuration.

         .DESCRIPTION
         The Set-NLogConfiguration Cmdlet sets the logging configuration.

         .PARAMETER Configuration
         Specifies the NLog configuration

         .EXAMPLE
         PS C:\>Read-NLogConfiguration '.\Sample.config' | Set-NLogConfiguration

         Set new logging configuration from configuration file.

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
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
	[OutputType([NLog.Config.LoggingConfiguration])]
	param
	(
		[Parameter(Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			Position = 0,
			HelpMessage = 'Specifies the NLog configuration')]
		[ValidateNotNullOrEmpty()]
		[NLog.Config.LoggingConfiguration]
		$Configuration
	)

	process
 {
		[NLog.LogManager]::Configuration = $Configuration
		Set-ScriptRoot
	}
}
