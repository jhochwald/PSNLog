$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = $here -replace "\\public|\\private|\\tests", ""
$ModuleName = 'PSNLog'

# Import our module to use InModuleScope
if (-Not(Get-Module -Name "$ModuleName"))
{
	Import-Module (Resolve-Path "$root\$ModuleName\$ModuleName.psd1") -Force
}

InModuleScope "$ModuleName" {
	Describe 'Write-NLogInfo' {
		It "Forward message to Write-Information" {
			if (Test-Path 'Alias:\Write-Information')
			{
				Remove-Item 'Alias:\Write-Information'
			}
			Mock Get-NLogLogger {
				$Result = [PSCustomObject]@{ }
				$Result | Add-Member -MemberType ScriptMethod -Name 'Info' -Value { param([string]$Message) }
				$Result
			}
			Mock Write-Information { }
			Write-NLogInfo 'InformationTest'
			Assert-MockCalled 'Write-Information'
		}
	}
}
