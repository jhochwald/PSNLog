function New-NLogRule
{
	<#
         .SYNOPSIS
         Creates a new NLog logging rule.

         .DESCRIPTION
         The New-NLogRule Cmdlet returns a new NLog logging rule.

         .PARAMETER LoggerNamePattern
         It may include the '*' wildcard at the beginning, at the end or at both ends.
         Specifies the Logger name pattern

         .PARAMETER Disabled
         Specifies if the rule should be disabled by default.

         .PARAMETER MinimumLevel
         Specifies the minimum log level needed to trigger this rule.

         .PARAMETER MaximumLevel
         Specifies the maximum log level needed to trigger this rule.

         .PARAMETER Target
         Specifies the target to be written to when the rule matches.

         .EXAMPLE
         PS C:>$Rule = New-NLogRule -MinimumLevel Info -Target $FileTarget

         Create a new rule to log all messages above and including the Info level.

         .EXAMPLE
         PS C:>$Rule = New-NLogRule -MinimumLevel Warn -MaximumLevel Warn -Target $FileTarget

         Create a new rule to log all Warn level messages.

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/jhochwald/PSNLog

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>
	[CmdletBinding(DefaultParameterSetName = 'MinLevel',
		ConfirmImpact = 'None')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
	[OutputType([NLog.Config.LoggingRule])]
	param
	(
		[Parameter(ParameterSetName = 'DisabledRule',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[Parameter(ParameterSetName = 'MinLevel')]
		[Parameter(ParameterSetName = 'MinMaxLevel')]
		[string]
		$LoggerNamePattern = '*',
		[Parameter(ParameterSetName = 'DisabledRule',
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			HelpMessage = 'Specifies if the rule should be disabled by default.')]
		[switch]
		$Disabled,
		[Parameter(ParameterSetName = 'MinLevel',
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			HelpMessage = 'Specifies the minimum log level needed to trigger this rule.')]
		[Parameter(ParameterSetName = 'MinMaxLevel',
			Mandatory)]
		[ValidateSet('Debug', 'Error', 'Fatal', 'Info', 'Off', 'Trace', 'Warn')]
		[ValidateNotNullOrEmpty()]
		[Alias('MinLevel')]
		[string]
		$MinimumLevel,
		[Parameter(ParameterSetName = 'MinMaxLevel',
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			HelpMessage = 'Specifies the maximum log level needed to trigger this rule.')]
		[ValidateSet('Debug', 'Error', 'Fatal', 'Info', 'Off', 'Trace', 'Warn')]
		[ValidateNotNullOrEmpty()]
		[Alias('MaxLevel')]
		[string]
		$MaximumLevel,
		[Parameter(ParameterSetName = 'DisabledRule',
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			HelpMessage = 'Specifies the target to be written to when the rule matches.')]
		[Parameter(ParameterSetName = 'MinLevel',
			Mandatory)]
		[Parameter(ParameterSetName = 'MinMaxLevel',
			Mandatory)]
		[ValidateNotNullOrEmpty()]
		[NLog.Targets.Target]
		$Target
	)

	process
 {
		switch ($PSCmdlet.ParameterSetName)
		{
			'DisabledRule'
			{
				(New-Object -TypeName NLog.Config.LoggingRule -ArgumentList ($LoggerNamePattern, $Target))

				break
			}
			'MinLevel'
			{
				(New-Object -TypeName NLog.Config.LoggingRule -ArgumentList ($LoggerNamePattern, [NLog.LogLevel]::FromString($MinimumLevel), $Target))

				break
			}
			'MinMaxLevel'
			{
				(New-Object -TypeName NLog.Config.LoggingRule -ArgumentList ($LoggerNamePattern, [NLog.LogLevel]::FromString($MinimumLevel), [NLog.LogLevel]::FromString($MaximumLevel), $Target))

				break
			}
		}
	}
}
