function New-NLogFileTarget
{
	<#
         .SYNOPSIS
         Creates a new NLog file logging target.

         .DESCRIPTION
         The New-NLogFileTarget Cmdlet returns a new NLog file logging target.
         In addition to creating a FileTarget using the New-NLogTarget CmdLet, this CmdLet allows to
         supply common parameters.

         .PARAMETER Name
         If no name is supplied, a random string will be used
         Specifies the Name of the target

         .PARAMETER FileName
         current users %Temp% directory. if not called from a script, the name will default to 'PSNLog'
         If no filename is supplied, the name of the calling script will be used and written to the
         You can combine as many of the layout renderers as you want to produce an arbitrary log file name.
         All Debug messages will go to Debug.log, all Info messages will go to Info.log and so on.
         directory where the script runs. ${env:scriptroot}/${level}.log
         The following value makes NLog write logging events to files based on the log level in the
         you use a single target to write to multiple files.
         This FileName string is a layout which may include instances of layout renderers. This lets
         Specifies the name and path to write to.

         .PARAMETER Layout
         Specifies the layout that is used to render the log message

         .PARAMETER ArchiveFileName
         archives should different than the log files.
         warning when deleting archives files is enabled (e.g. maxArchiveFiles ), the folder of the
         of numerical digits to be used for numbering files.
         depending on the archiving strategy. The number of hash characters used determines the number
         It may contain a special placeholder {#####} that will be replaced with a sequence of numbers
         Specifies the name of the file to be used for an archive.

         .PARAMETER ArchiveNumbering
         (in combination with the date). The date is formatted according to the value of archiveDateFormat.
         (Year, Month, Day) datetime. The most recent archive has the highest number
         - DateAndSequence - Combination of Date and Sequence .Archives will be stamped with the prior period
         Warning: combining this mode with archiveAboveSize is not supported. Archive files are not merged.
         - Date     - Date style numbering. The date is formatted according to the value of archiveDateFormat.
         - Sequence - Sequence style numbering. The most recent archive has the highest number.
         - Rolling  - Rolling style numbering (the most recent is always #0 then #1, ..., #N).
         Possible values:
         Specifies the way archives are numbered.

         .PARAMETER ArchiveDateFormat
         This option works only when the "ArchiveNumbering" parameter is set to Date or DateAndSequence
         Specifies the date format used for archive numbering. Default format depends on the archive period.

         .PARAMETER ArchiveEvery
         Saturday - Archive every Saturday. Introduced in NLog 4.4.4.
         Friday - Archive every Friday. Introduced in NLog 4.4.4.
         Thursday - Archive every Thursday. Introduced in NLog 4.4.4.
         Wednesday - Archive every Wednesday. Introduced in NLog 4.4.4.
         Tuesday - Archive every Tuesday. Introduced in NLog 4.4.4.
         Monday - Archive every Monday. Introduced in NLog 4.4.4.
         Sunday - Archive every Sunday. Introduced in NLog 4.4.4.
         Year - Archive every year.
         None - Don't archive based on time.
         Month - Archive every month.
         Minute - Archive every minute.
         Hour - Archive every hour.
         Day - Archive daily.
         Possible values are:
         Specifies wheter to automatically archive log files every time the specified time passes.

         .PARAMETER MaxArchiveFiles
         If MaxArchiveFiles is less or equal to 0, old files aren't deleted
         Specifies the maximum number of archive files that should be kept.

         .PARAMETER EnableArchiveFileCompression
         Specifies whether to compress the archive files into the zip files.

         .EXAMPLE
         PS C:\>$FileTarget = New-NLogFileTarget -Name 'f1' -Filename 'C:\Temp\MyLog.log'

         Create a new file target, that writes log messages to the file C:\Temp\MyLog.log.

         .EXAMPLE
         PS C:\>$FileTarget = New-NLogFileTarget -Name 'f1' -Filename 'C:\Temp\MyLog.log' -Layout '${cmtrace}'

         Create a new file target, that writes log messages to the file C:\Temp\MyLog.log using the CMTrace
         Layout renderer.

         .EXAMPLE
         PS C:\>$FileTarget = New-NLogFileTarget -Name 'f1' -Filename '${env:scriptroot}/${level}.log'

         Creates a new file target, that writes log messages to a log file that corresponds to the log level.

         .EXAMPLE
         PS C:\>$FileTarget = New-NLogFileTarget -Name 'f1' `
         -Filename 'C:\Temp\MyLog.log' `
         -ArchiveFileName 'C:\Temp\MyLog.{#}.log' `
         -ArchiveNumbering Date `
         -ArchiveEvery Day `
         -MaxArchiveFiles 14 `
         -ArchiveDateFormat 'yyyyMMdd'
         -EnableArchiveFileCompression

         Creates a new file target, that writes log messages to the file C:\Temp\MyLog.log and archives the
         compressed log file every day into a subfolder 'archive'. All archived files older than 14 days will
         be removed.

         .NOTES
         The New-NlogFileTarget CmdLet does not support all properties supported by the native NLog FileTarget.
         However those properties can be changed/added later on the returned object.

         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/jhochwald/PSNLog

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>
	[CmdletBinding(DefaultParameterSetName = 'ByTypeName',
		ConfirmImpact = 'None')]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
	[OutputType([NLog.Targets.FileTarget])]
	param
	(
		[Parameter(Position = 0)]
		[string]
		$Name,
		[Parameter(Position = 1)]
		[string]
		$FileName,
		[string]
		$Layout,
		[string]
		$ArchiveFileName,
		[ValidateSet('Rolling', 'Sequence', 'Date', 'DateAndSequence')]
		[string]
		$ArchiveNumbering,
		[string]
		$ArchiveDateFormat,
		[ValidateSet('Day', 'Hour', 'Minute', 'Month', 'None', 'Year', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')]
		[string]
		$ArchiveEvery,
		[int]
		$MaxArchiveFiles = 0,
		[switch]
		$EnableArchiveFileCompression
	)

	process
 {
		$FileTarget = (New-NLogTarget -Name $Name -FileTarget)

		if ([string]::IsNullOrEmpty($FileName))
		{
			$ScriptName = (Get-PSCallStack | Select-Object -Last 1 -ExpandProperty 'ScriptName')

			if ([string]::IsNullOrEmpty($ScriptName))
			{
				# Default to module name if no further information is supplied.
				$ScriptName = 'PSNlog.log'
			}
			else
			{
				$ScriptName = ((Split-Path -Path $ScriptName -Leaf) -replace '.ps1|.psm1', '.log')
			}

			$FileTarget.FileName = ($Env:Temp + '\' + $ScriptName)
		}
		else
		{
			$FileTarget.FileName = $FileName
		}

		if (-Not ([string]::IsNullOrEmpty($Layout)))
		{
			$FileTarget.Layout = $Layout
		}

		# Archive settings
		if (-Not ([string]::IsNullOrEmpty($ArchiveFileName)))
		{
			$FileTarget.ArchiveFileName = $ArchiveFileName
			$FileTarget.MaxArchiveFiles = $MaxArchiveFiles
			$FileTarget.EnableArchiveFileCompression = $EnableArchiveFileCompression.IsPresent

			if (-Not ([string]::IsNullOrEmpty($ArchiveNumbering)))
			{
				$FileTarget.ArchiveNumbering = $ArchiveNumbering

				if (($ArchiveNumbering -eq 'Date') -or ($ArchiveNumbering -eq 'DateAndSequence'))
				{
					if (-Not ([string]::IsNullOrEmpty($ArchiveDateFormat)))
					{
						$FileTarget.ArchiveDateFormat = $ArchiveDateFormat
					}
				}
			}

			if (-Not ([string]::IsNullOrEmpty($ArchiveEvery)))
			{
				$FileTarget.ArchiveEvery = $ArchiveEvery
			}
		}

		$FileTarget
	}
}
