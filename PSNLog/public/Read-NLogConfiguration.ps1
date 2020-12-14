function Read-NLogConfiguration
{
   <#
         .SYNOPSIS
         Returns a NLog configuration based on a configuration file.

         .DESCRIPTION
         The Read-NLogConfiguration Cmdlet returns the specified NLog logging configuration

         .PARAMETER Filename
         Specifies the name and path to the NLog configuration file

         .EXAMPLE
         PS C:\>$Config = Read-NLogConfiguration '.\Sample.config'

         Read configuration from config file

         .EXAMPLE
         PS C:\>Read-NLogConfiguration '.\Sample.config' | Set-NLogConfiguration

         Read configuration from config file and set as configuration for all logging.

         .NOTES
         The original is part of PSNLog, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster
         (c) 2018 Maik Koster. All rights reserved.

         License: BSD 3-Clause "New" or "Revised" License

         .LINK
         https://github.com/MaikKoster/PSNLog
   #>
   [CmdletBinding(ConfirmImpact = 'None')]
   [OutputType([NLog.Config.LoggingConfiguration])]
   param
   (
      [Parameter(Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0,
      HelpMessage = ' Specifies the name and path to the NLog configuration file')]
      [ValidateScript( {
               ((Test-Path -Path $_) -and ((Get-Item -Path $_).Extension -match '\.(config|nlog)'))
      })]
      [ValidateNotNullOrEmpty()]
      [Alias('FullName')]
      [string]
      $Filename
   )

   process
   {
      (New-Object -TypeName NLog.Config.XmlLoggingConfiguration -ArgumentList ($Filename, $true))
   }
}
