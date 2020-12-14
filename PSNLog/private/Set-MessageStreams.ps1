function Set-MessageStreams
{
<#
	.SYNOPSIS
		Overrides Write-Verbose, Write-Host, Write-Warning and Write-Error to write to a log file.
	
	.DESCRIPTION
		Overrides Write-Verbose, Write-Host, Write-Warning and Write-Error to write to a log file.
		The native Cmdlets will be called as well.
	
	.PARAMETER WriteVerbose
		 Specifies if Write-Verbose calls should be redirected to Write-NLogVerbose
	
	.PARAMETER WriteHost
		 Specifies if Write-Host calls should be redirected to Write-NLogHost
	
	.PARAMETER WriteWarning
		 Specifies if Write-Warning calls should be redirected to Write-NLogWarning
	
	.PARAMETER WriteError
		 Specifies if Write-Error calls should be redirecte to Write-NLogError
	
	.PARAMETER Remove
		 Specifies if the alias added by this function should be removed
	
	.EXAMPLE
		PS C:>Set-MessageStreams -WriteVerbose -WriteWarning -WriteError
		
		Redirect Write-Verbose, Write-Warning and Write-Error
	
.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>
	
	[CmdletBinding(DefaultParameterSetName = 'Remove',
						ConfirmImpact = 'None',
						SupportsShouldProcess = $true)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalAliases', '')]
	param
	(
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteVerbose,
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteHost,
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteWarning,
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteError,
		[Parameter(ParameterSetName = 'Remove')]
		[switch]
		$Remove
	)
	
	process
	{
		if ($WriteVerbose.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Verbose'))
			{
				New-Alias -Name 'Write-Verbose' -Value 'Write-NLogVerbose' -Scope Global
			}
		}
		if ($WriteHost.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Host'))
			{
				New-Alias -Name 'Write-Host' -Value 'Write-NLogHost' -Scope Global
			}
		}
		if ($WriteWarning.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Warning'))
			{
				New-Alias -Name 'Write-Warning' -Value 'Write-NLogWarning' -Scope Global
			}
		}
		if ($WriteError.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Error'))
			{
				New-Alias -Name 'Write-Error' -Value 'Write-NLogError' -Scope Global
			}
		}
		if ($Remove.IsPresent)
		{
			if (Test-Path -Path 'Alias:\Write-Verbose')
			{
				Remove-Item -Path 'Alias:\Write-Verbose' -Force
			}
			if (Test-Path -Path 'Alias:\Write-Warning')
			{
				Remove-Item -Path 'Alias:\Write-Warning' -Force
			}
			if (Test-Path -Path 'Alias:\Write-Error')
			{
				Remove-Item -Path 'Alias:\Write-Error' -Force
			}
			if (Test-Path -Path 'Alias:\Write-Host')
			{
				Remove-Item -Path 'Alias:\Write-Host' -Force
			}
		}
	}
}
