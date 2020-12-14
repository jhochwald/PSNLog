#Requires -Version 5

<#
	.SYNOPSIS
		Simple Build Wrapper

	.DESCRIPTION
		Simple Build Wrapper

	.PARAMETER Task
		Build Task

	.EXAMPLE
		PS C:\> .\Build.ps1

	.NOTES
		Additional information about the file.
#>
[CmdletBinding(ConfirmImpact = 'None')]
param
(
	[Parameter(ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		Position = 0)]
	[ValidateSet('.', 'BuildAndPush', 'BuildAndRelease', 'BuildAndSkipTests', IgnoreCase = $true)]
	[Alias('BuildTask')]
	[string]
	$Task = 'BuildAndSkipTests'
)

if ($null -eq (Get-Module InvokeBuild -ListAvailable))
{
	Write-Host -NoNewLine "      Installing InvokeBuild module"
	$null = Install-Module InvokeBuild
	Write-Host -ForegroundColor Green '...Installed!'
}

if (Get-Module InvokeBuild -ListAvailable)
{
	Write-Host -NoNewLine "      Importing InvokeBuild module"
	Import-Module InvokeBuild -Force
	Write-Host -ForegroundColor Green '...Loaded!'
}
else
{
	throw 'How did you even get here?'
}

# Kick off the standard build
try
{
	Invoke-Build -Task $Task
}
catch
{
	# If it fails then show the error and try to clean up the environment
	Write-Host -ForegroundColor Red 'Build Failed with the following error:'
	Write-Output $_
}
finally
{
	Write-Host ''
	Write-Host 'Attempting to clean up the session (loaded modules and such)...'
	Invoke-Build -Task BuildSessionCleanup
	Remove-Module -Name InvokeBuild -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
}
