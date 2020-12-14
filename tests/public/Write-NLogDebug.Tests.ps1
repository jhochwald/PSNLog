$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = $here -replace "\\public|\\private|\\tests", ""
$ModuleName = 'PSNLog'

# Import our module to use InModuleScope
if (-Not(Get-Module -Name "$ModuleName"))
{
	Import-Module (Resolve-Path "$root\$ModuleName\$ModuleName.psd1") -Force
}

InModuleScope "$ModuleName" {
	Describe 'Write-NLogDebug' {
		It "Forward message to Write-Debug" {
			if (Test-Path 'Alias:\Write-Debug')
			{
				Remove-Item 'Alias:\Write-Debug'
			}
			Mock Get-NLogLogger {
				$Result = [PSCustomObject]@{ }
				$Result | Add-Member -MemberType ScriptMethod -Name 'Debug' -Value { param([string]$Message) }
				$Result
			}
			Mock Write-Debug { }
			Write-NLogDebug 'DebugTest'
			Assert-MockCalled 'Write-Debug'
		}
	}
}
