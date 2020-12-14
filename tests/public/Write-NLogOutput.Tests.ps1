$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = $here -replace "\\public|\\private|\\tests", ""
$ModuleName = 'PSNLog'

# Import our module to use InModuleScope
if (-Not(Get-Module -Name "$ModuleName"))
{
	Import-Module (Resolve-Path "$root\$ModuleName\$ModuleName.psd1") -Force
}

InModuleScope "$ModuleName" {
	Describe 'Write-NLogOutput' {
		It "Forward message to Write-Output" {
			if (Test-Path 'Alias:\Write-Output')
			{
				Remove-Item 'Alias:\Write-Output'
			}
			Mock Get-NLogLogger {
				$Result = [PSCustomObject]@{ }
				$Result | Add-Member -MemberType ScriptMethod -Name 'Info' -Value { param([string]$Message) }
				$Result
			}
			Mock Write-Output { }
			Write-NLogOutput 'InformationTest'
			Assert-MockCalled 'Write-Output'
		}
	}
}
