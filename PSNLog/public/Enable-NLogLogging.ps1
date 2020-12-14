function Enable-NLogLogging
{
<#
.SYNOPSIS
Enables simple logging for trivial logging cases.

.DESCRIPTION
The Enable-NLogLogging Cmdlet allows to quickly enable some simple logging
for trivial logging cases.

.PARAMETER Filename
Specifies the Filename to write log messages to.

.PARAMETER Target
Specifies the Target to write log messages to.

.PARAMETER MinimumLevel
Specifies the minimum log level.

.PARAMETER Layout
Specifies the log message layout used to write to the file target

.PARAMETER DontRedirectMessages
Write-Error -> Log message on 'Error' level
Write-Warning -> Log message on 'Warning' level
Write-Host -> Log message on 'Info' level
Write-Verbose -> Log message on 'Debug' level
If set, the following configuration will be applied
redirected to the logging Target automagically.
Specifies, if Messages written to Write-Verbose/Write-Host/Write-Warning/Write-Error should be

.EXAMPLE
PS C:\>Enable-NLogLogging -FilePath 'C:\Temp\MyLogging.log'

Quickly configure NLog so that all messages above and including the Debug level are written to a file.
It automatically logs all existing Write-Verbose messages to Debug, Write-Host to Info, Write-Warning
to Warn and Write-Error to Error.

.EXAMPLE
PS C:\>Enable-NLogLogging -FilePath 'C:\Temp\MyLogging.log' -MinimumLevel Warn -DontRedirectMessages

Quickly configure NLog so that all messages above and including the Warn level are written to a file.
But it does not redirect the calls to Write-Verbose, Write-Host, Write-Warning or Write-Error.

.EXAMPLE
PS C:\>$Target = New-NLogTarget -Name 'Warnings' -FileTarget
PS C:\>$Target.Filename = 'C:\Temp\MyLogging.log'
PS C:\>$Target.CreateDirs = $true
PS C:\>Enable-NLogLogging -Target $Target -MinLevel Warn

Quickly configure NLog so that all messages above and including the Warn level are written to target.

.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(DefaultParameterSetName = 'ByFilename',
						ConfirmImpact = 'None')]
	param
	(
		[Parameter(ParameterSetName = 'ByFilename',
					  Position = 0)]
		[Alias('FilePath', 'FullName')]
		[string]
		$Filename,
		[Parameter(ParameterSetName = 'ByTarget',
					  Mandatory = $true,
					  ValueFromPipeline = $true,
					  HelpMessage = 'Add help message for user')]
		[ValidateNotNullOrEmpty()]
		[NLog.Targets.Target]
		$Target,
		[ValidateSet('Debug', 'Error', 'Fatal', 'Info', 'Off', 'Trace', 'Warn')]
		[Alias('MinLevel')]
		[string]
		$MinimumLevel = 'Debug',
		[Parameter(ParameterSetName = 'ByFilename')]
		[string]
		$Layout = '${cmtrace}',
		[switch]
		$DontRedirectMessages
	)
	
	process
	{
		if ($PSCmdlet.ParameterSetName -eq 'ByTarget')
		{
			if ([string]::IsNullOrEmpty($MinimumLevel))
			{
				[NLog.Config.SimpleConfigurator]::ConfigureForTargetLogging($Target)
			}
			else
			{
				[NLog.Config.SimpleConfigurator]::ConfigureForTargetLogging($Target, [NLog.LogLevel]::FromString($MinimumLevel))
			}
		}
		else
		{
			$Target = New-NLogFileTarget -Filename $Filename -Layout $Layout
			$Config = New-Object -TypeName NLog.Config.LoggingConfiguration
			$Config.AddTarget($Target)
			$Config.AddRule([NLog.LogLevel]::FromString($MinimumLevel), [NLog.LogLevel]::Fatal, $Target, '*')
			Set-NLogConfiguration -Configuration $Config
		}
		
		if (-Not ([NLog.LogManager]::IsLoggingEnabled()))
		{
			[NLog.LogManager]::EnableLogging()
		}
		
		if (-Not ($DontRedirectMessages.IsPresent))
		{
			Set-MessageStreams -WriteVerbose -WriteWarning -WriteError
		}
	}
}
