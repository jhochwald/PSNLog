function Write-NLogVerbose
{
   <#
         .SYNOPSIS
         Writes a message on 'Debug' log level and to the Verbose Message stream.

         .DESCRIPTION
         Writes a message on 'Debug' log level and to the Verbose Message stream.
         Can be used to override the native Write-Verbose CmdLet.

         .PARAMETER Message
         Specifies the message to display. This parameter is required. You can also pipe a message string to Write-NLogVerbose.

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/MaikKoster/PSNLog

         .LINK
         Write-Verbose
   #>

   [CmdletBinding(ConfirmImpact = 'None')]
   param
   (
      [Parameter(Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0,
      HelpMessage = 'Specifies the message to display.')]
      [AllowEmptyString()]
      [Alias('Msg')]
      [string]
      $Message
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
         $Logger.Debug($Message)
      }

      # Write to original Message Stream
      Microsoft.PowerShell.Utility\Write-Verbose @PSBoundParameters
   }
}
