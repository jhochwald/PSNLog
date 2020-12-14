function New-NLogTarget
{
	<#
.SYNOPSIS
Creates a new NLog logging target.

.DESCRIPTION
The New-NLogTarget Cmdlet returns a new NLog logging target.

.PARAMETER Name
If no name is supplied, a random string will be used
Specifies the Name of the target

.PARAMETER TargetType
Can be used to create targets not explicitly covered by any switch
Specifies the type name of the target.

.PARAMETER NullTarget
NullTargets discards any log messages. Used mainly for debugging and benchmarking.
Specifies to create a new NullTarget

.PARAMETER ConsoleTarget
Writes log messages to the console.
Specifies to create a new ConsoleTarget

.PARAMETER DatabaseTarget
Writes log messages to the database using an ADO.NET provider.
Specifies to create a new DatabaseTarget

.PARAMETER DebugTarget
Mock target - useful for testing.
Specifies to create a new DebugTarget

.PARAMETER EventLogTarget
Writes log message to the Event Log.
Specifies to create a new EventLogTarget

.PARAMETER FileTarget
Writes log messages to one or more files.
Specifies to create a new FileTarget

.PARAMETER MailTarget
Sends log messages by email using SMTP protocol.
Specifies to create a new MailTarget

.PARAMETER MemoryTarget
Writes log messages to an ArrayList in memory for programmatic retrieval.
Specifies to create a new MemoryTarget

.PARAMETER NetworkTarget
Sends log messages over the network.
Specifies to create a new NetworkTarget

.PARAMETER NLogViewerTarget
Sends log messages to the remote instance of NLog Viewer.
Specifies to create a new NLogViewerTarget

.PARAMETER PerformanceCounterTarget
Increments specified performance counter on each write.
Specifies to create a new PerformanceCounterTarget

.PARAMETER WebServiceTarget
Calls the specified web service on each log message.
Specifies to create a new WebServiceTarget

.EXAMPLE
PS C:\>$FileTarget = New-NLogTarget -Name 'AllWarnings' -FileTarget
PS C:\>$FileTarget.FileName = 'C:\Temp\AllWarnings.log'

Create a new file target

.NOTES
The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
(c) 2018 Maik Koster. All rights reserved.

License: BSD 3-Clause "New" or "Revised" License

.LINK
https://github.com/MaikKoster/PSNLog
#>

	[CmdletBinding(DefaultParameterSetName = 'ByTypeName',
		ConfirmImpact = 'None')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
	[OutputType([NLog.Targets.Target])]
	param
	(
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			Position = 0)]
		[string]
		$Name,
		[Parameter(ParameterSetName = 'ByTypeName',
			Mandatory,
			ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			Position = 1,
			HelpMessage = 'Can be used to create targets not explicitly covered by any switch Specifies the type name of the target.')]
		[ValidateNotNullOrEmpty()]
		[string]
		$TargetType,
		[Parameter(ParameterSetName = 'NullTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$NullTarget,
		[Parameter(ParameterSetName = 'ConsoleTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$ConsoleTarget,
		[Parameter(ParameterSetName = 'DatabaseTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$DatabaseTarget,
		[Parameter(ParameterSetName = 'DebugTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$DebugTarget,
		[Parameter(ParameterSetName = 'EventLogTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$EventLogTarget,
		[Parameter(ParameterSetName = 'FileTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$FileTarget,
		[Parameter(ParameterSetName = 'MailTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$MailTarget,
		[Parameter(ParameterSetName = 'MemoryTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$MemoryTarget,
		[Parameter(ParameterSetName = 'NetworkTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$NetworkTarget,
		[Parameter(ParameterSetName = 'NLogViewerTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$NLogViewerTarget,
		[Parameter(ParameterSetName = 'PerformanceCounterTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$PerformanceCounterTarget,
		[Parameter(ParameterSetName = 'WebServiceTarget',
			ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$WebServiceTarget
	)

	process
	{
		$Target = $null
		switch ($PSCmdlet.ParameterSetName)
		{
			'ByTypeName'
			{
				if ($TargetType -like 'NLog.Targets.*')
				{
					$Target = (New-Object -TypeName $TargetType)
				}
				elseif ($TargetType -like 'Targets.*')
				{
					$Target = (New-Object -TypeName NLog.$TargetType)
				}
				else
				{
					$Target = (New-Object -TypeName NLog.Targets.$TargetType)
				}
				break
			}
			'NullTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.NullTarget)
				break
			}
			'ConsoleTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.ConsoleTarget)
				break
			}
			'DatabaseTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.DatabaseTarget)
				break
			}
			'DebugTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.DebugTarget)
				break
			}
			'EventLogTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.EventLogTarget)
				break
			}
			'FileTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.FileTarget)
				break
			}
			'MailTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.MailTarget)
				break
			}
			'MemoryTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.MemoryTarget)
				break
			}
			'NetworkTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.NetworkTarget)
				break
			}
			'NLogViewerTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.NLogViewerTarget)
				break
			}
			'PerformanceCounterTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.PerformanceCounterTarget)
				break
			}
			'WebServiceTarget'
			{
				$Target = (New-Object -TypeName NLog.Targets.WebServiceTarget)
				break
			}
		}

      if ($null -ne $Target)
      {
         if ([string]::IsNullOrEmpty($Name))
         {
            # Generate random string
            $Name = -join ((65 .. 90) | Get-Random -Count 6 | ForEach-Object -Process {
                  [char]$_
               })
         }

         $Target.Name = $Name

         $Target
      }
	}
}
