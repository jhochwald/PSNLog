function Get-NLogConfiguration
{
   <#
         .SYNOPSIS
         Returns the current NLog configuration.

         .DESCRIPTION
         The Get-NLogConfiguration Cmdlet returns the current NLog configuration.
         If there is no current configuration yet, a new LoggingConfiguration will be returned.

         .EXAMPLE
         PS C:\>$Config = Get-NLogConfiguration

         Get the current logging configuration

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>
   [CmdletBinding(ConfirmImpact = 'None')]
   [OutputType([NLog.Config.LoggingConfiguration])]
   param ()

   process
   {
      if ($null -eq [NLog.LogManager]::Configuration)
      {
         (New-Object -TypeName NLog.Config.LoggingConfiguration)
      }
      else
      {
         [NLog.LogManager]::Configuration
      }
   }
}
