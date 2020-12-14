function Write-NLogWarning
{
   <#
         .SYNOPSIS
         Writes a message on 'Warn' log level and to the Warning Message stream.

         .DESCRIPTION
         Writes a message on 'Warn' log level and to the Warning Message stream.
         Can be used to override the native Write-Warning CmdLet.

         .PARAMETER Message
         Specifies the warning message.

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/MaikKoster/PSNLog

         .LINK
         Write-Warning
   #>

   [CmdletBinding(ConfirmImpact = 'None')]
   param
   (
      [Parameter(Mandatory,
            ValueFromPipeline,
            Position = 0,
      HelpMessage = 'Specifies the warning message.')]
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
         $Logger.Warn($Message)
      }

      # Write to original Message Stream
      Microsoft.PowerShell.Utility\Write-Warning @PSBoundParameters
   }
}
