function Write-NLogHost
{
	<#
	.SYNOPSIS
	Writes a message on 'Info' log level and to the Host.

	.DESCRIPTION
	Writes a message on 'Info' log level and to the Host.
	Can be used to override the native Write-Host CmdLet.

	.PARAMETER Object
	Objects to display in the host.

	.PARAMETER NoNewline
	The string representations of the input objects are concatenated to form the output. No spaces or newlines are inserted between the output strings. No newline is added after the last output string.

	.PARAMETER Separator
	Specifies a separator string to insert between objects displayed by the host.

	.PARAMETER ForegroundColor
	Specifies the text color. There is no default. The acceptable values for this parameter are:
	- Black
	- DarkBlue
	- DarkGreen
	- DarkCyan
	- DarkRed
	- DarkMagenta
	- DarkYellow
	- Gray
	- DarkGray
	- Blue
	- Green
	- Cyan
	- Red
	- Magenta
	- Yellow
	- White

	.PARAMETER BackgroundColor
	Specifies the background color. There is no default. The acceptable values for this parameter are:
	- Black
	- DarkBlue
	- DarkGreen
	- DarkCyan
	- DarkRed
	- DarkMagenta
	- DarkYellow
	- Gray
	- DarkGray
	- Blue
	- Green
	- Cyan
	- Red
	- Magenta
	- Yellow
	- White

	.NOTES
	The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
	(c) 2018 Maik Koster. All rights reserved.

	License: BSD 3-Clause "New" or "Revised" License

	.LINK
	https://github.com/jhochwald/PSNLog

	.LINK
	https://github.com/MaikKoster/PSNLog
	#>

	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName,
			Position = 0)]
		[object]
		$Object,
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[switch]
		$NoNewline,
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[object]
		$Separator,
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[ConsoleColor]
		$ForegroundColor,
		[Parameter(ValueFromPipeline,
			ValueFromPipelineByPropertyName)]
		[ConsoleColor]
		$BackgroundColor
	)

	begin
 {
		$Logger = (Get-NLogLogger)
	}

	process
 {
		# Write to Log if possible
		if ($null -ne $Logger)
		{
			$Logger.Info($Object.ToString())
		}

		# Write to original Message Stream
		Microsoft.PowerShell.Utility\Write-Host @PSBoundParameters
	}
}
