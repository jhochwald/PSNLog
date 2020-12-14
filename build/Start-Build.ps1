Requires -Version 5
Param( $Task = 'Build')

# Ensure InvokeBuild is installed to drive rest of the build process
if ($null -eq (Get-Module -Name InvokeBuild -ListAvailable)) 
{
   $null = Install-Module -Name InvokeBuild
}

if (Get-Module -Name InvokeBuild -ListAvailable) 
{
   Import-Module -Name InvokeBuild -Force
}
else 
{
   throw 'How did you even get here?'
}

# Kick off the standard build
try 
{
   Invoke-Build -File '.\build\PSNLog.Build.ps1' -Task $Task
}
catch 
{
   Write-Host -ForegroundColor Red -Object 'Build Failed with the following error:'
   Write-Output -InputObject $_
}
