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
         Specifies if Write-Error calls should be redirects to Write-NLogError

         .PARAMETER WriteDebug
         Specifies if Write-Debug calls should be redirects to Write-NLogDebug

         .PARAMETER WriteInfo
         Specifies if Write-Information calls should be redirects to Write-NLogInfo

         .PARAMETER WriteOutput
         Specifies if Write-Output calls should be redirects to Write-NLogOutput

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
         https://github.com/jhochwald/PSNLog

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>

	[CmdletBinding(DefaultParameterSetName = 'Remove',
		ConfirmImpact = 'None',
		SupportsShouldProcess)]
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
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteDebug,
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteInfo,
		[Parameter(ParameterSetName = 'Add')]
		[switch]
		$WriteOutput,
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
				$null = (New-Alias -Name 'Write-Verbose' -Value 'Write-NLogVerbose' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Verbose' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Verbose' -Value 'Write-NLogVerbose' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteHost.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Host'))
			{
				$null = (New-Alias -Name 'Write-Host' -Value 'Write-NLogHost' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Host' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Host' -Value 'Write-NLogHost' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteWarning.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Warning'))
			{
				$null = (New-Alias -Name 'Write-Warning' -Value 'Write-NLogWarning' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Warning' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Warning' -Value 'Write-NLogWarning' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteError.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Error'))
			{
				$null = (New-Alias -Name 'Write-Error' -Value 'Write-NLogError' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Error' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Error' -Value 'Write-NLogError' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteDebug.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Debug'))
			{
				$null = (New-Alias -Name 'Write-Debug' -Value 'Write-NLogDebug' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Debug' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Verbose' -Value 'Write-NLogDebug' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteInfo.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Information'))
			{
				$null = (New-Alias -Name 'Write-Information' -Value 'Write-NLogInfo' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Information' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Verbose' -Value 'Write-NLogVerbose' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($WriteOutput.IsPresent)
		{
			if (-Not (Test-Path -Path 'Alias:\Write-Output'))
			{
				$null = (New-Alias -Name 'Write-Output' -Value 'Write-NLogOutput' -Scope Global -Force -Confirm:$false)
			}
			else
			{
				$null = (Remove-Item -Path 'Alias:\Write-Output' -Force -Confirm:$false -ErrorAction SilentlyContinue)
				$null = (New-Alias -Name 'Write-Output' -Value 'Write-NLogOutput' -Scope Global -Force -Confirm:$false)
			}
		}

		if ($Remove.IsPresent)
		{
			if (Test-Path -Path 'Alias:\Write-Verbose')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Verbose' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Warning')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Warning' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Error')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Error' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Host')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Host' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Debug')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Debug' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Information')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Information' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}

			if (Test-Path -Path 'Alias:\Write-Output')
			{
				$null = (Remove-Item -Path 'Alias:\Write-Output' -Force -Confirm:$false -ErrorAction SilentlyContinue)
			}
		}
	}
}
