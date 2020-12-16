<!--
[![Build status](https://ci.appveyor.com/api/projects/status/rrb6quib6y72qjcg/branch/master?svg=true)](https://ci.appveyor.com/project/MKoster/PSNlog/branch/master) [![PS Gallery](https://img.shields.io/badge/install-PS%20Gallery-blue.svg)](https://www.powershellgallery.com/packages/PSNLog)
-->

# PSNLog PowerShell module

The "**PSNLog**" Windows PowerShell and/or PowerShell Core module is a wrapper around the famous, flexible, free, and open source logging for .Net component [NLog](http://nlog-project.org/).

Proper logging is a common requirement within many PowerShell scripts and modules. There are a lot of possibilities to support logging within PowerShell. However, most of them are very limited in their capabilities and/or intrusive to the script/module.

This Module allows to use a lot of capabilities and the flexibility of [NLog](http://nlog-project.org/) with as little as two lines of PowerShell, for basic logging.

This Module version is a fork of "**PSNLog**" Version 0.2.5 by [Maik Koster](https://github.com/MaikKoster/PSNLog).

my next version will drop the fork and I will rename the module to something like "**PSNLog2**" or "**PSNLogNG**". The development will then be moved towards a dedicated directory and this release will then also be published to the PowerShell Gallery!

## Requirements

Windows PowerShell Version 5.0, or newer. It might work on older versions but it was developed on 5.1. and never tested on older versions!

_OR_

PowerShell Core 7.x, or newer. It is tested with PowerShell Core 7.1.0 and 7.2.0-preview.1 on Windows 10 (20H2)

### .NET Framework

.NET Frameworks 4.5 - 4.8. In theory older versions might work, but I use the [NLog](http://nlog-project.org/) net45 64Bit DLL!
.NET Core could/might/should work, the [NLog](http://nlog-project.org/) project provides support for it! I never tried it.

### Plattform

This is a Windows solution. At least for now!

Other platforms (e.g. macOS) are not tested or supported. The [NLog](http://nlog-project.org/) project provides at least a Xamarin build.

## Third party components

[NLog](http://nlog-project.org/) - Copyright (c) Copyright (c) 2004-2020 Jaroslaw Kowalski <jaak@jkowalski.net>, Kim Christensen, Julian Verdurmen.

Please read the [License](https://github.com/NLog/NLog/blob/master/LICENSE.txt) of the [NLog](http://nlog-project.org/) project.

## Install

Will be back soon! See above, this is just a quick fork to get things going.

<!--
### PowerShell Gallery Install (Requires PowerShell v5)

```powershell
Install-Module -Name PSNLog
```

### Manual Install

Download [PSNLog-0.2.5.zip](https://github.com/MaikKoster/PSNLog/releases/download/v0.2.5/PSNLog-0.2.5.zip) and extract the contents into `'C:\Users\[User]\Documents\WindowsPowerShell\Modules\PSNlog'` (you may have to create these directories if they don't exist.). Then run

```powershell
Get-ChildItem 'C:\Users\[User]\Documents\WindowsPowerShell\Modules\PSNLog\' -Recurse | Unblock-File
Import-Module PSNlog
```
-->

## Add logging to scripts/modules

### Quickly add logging capabilities to existing scripts/modules with two lines of PowerShell code

The easiest and quickest way to make use of this requires two easy steps

1. Import the Module
2. Create a simple configuration for [NLog](http://nlog-project.org/) and redirect native functions.

```powershell
Import-Module PSNlog
Enable-NLogLogging
```

This will create a very simple standard configuration, that writes log messages to a log file with the same name as the script file within the %Temp% director. If it is not called from within a script, it will use the name `'PSNLog'` as default.

To allow easy integration for existing scripts and modules, it implements a little trick that basically write the content of every call to **Write-Verbose**, **Write-Debug**, **Write-Output**, **Write-Information**, **Write-Warning** and **Write-Error** into the log file as well. **Write-Host** should work, but i do not use it (no joke)!

Possible Levels are:

- **Debug** = **Write-Verbose** and **Write-Debug** (great for development and troubleshooting)
- **Error** = **Write-Error** (Only Errors)
- **Fatal** = **Write-Error** (Only Errors)
- **Info**  = **Write-Output** and **Write-Information** (plus **Write-Host**)
- **Off** = Nothing
- **Trace** = Nearly everything is logged (might get a huge and noisy)
- **Warn** = **Write-Warning** (Might be a smart selection in production)

The default Level is **Info**. That should be a solid selection in most use-cases. This includes **Write-Warning** and **Write-Error**.
In production you might reduce the logging by using the Level **Warn** or **Error**! You can do this when you create the logger instance!

See in the examples below.

By default this Module use the **[cmtrace](https://docs.microsoft.com/de-de/mem/configmgr/core/support/cmtrace)** format! I selected it because I needed a solid logging solution for all my Microsoft Endpoint Manager (a/k/a Microsoft Intune) scripts and the **[cmtrace](https://docs.microsoft.com/de-de/mem/configmgr/core/support/cmtrace)** format is the perfect match. You can change this when you create the logger instance! See in the examples below.

Please see the [NLog Wiki](https://github.com/NLog/NLog/wiki/Configuration-file#log-levels) for more details about the different log levels and how to apply a format to the logs.

You can now test the behavior by calling

```powershell
Write-Debug ("Some debug message")
Write-Information ("Some info message")
Write-Warning ("Some warn message")
Write-Output ("Some Console message")
Write-Error ("Some error message")
```

The output will look like this:

```
2020-12-14 11:43:44.7900|DEBUG|<ScriptBlock>|Some debug message
2020-12-14 11:43:44.8520|INFO|<ScriptBlock>|Some info message
2020-12-14 11:43:44.8989|WARN|<ScriptBlock>|Some warn message
2020-12-14 11:43:44.9614|INFO|<ScriptBlock>|Some Console message
2020-12-14 11:43:46.4629|ERROR|<ScriptBlock>|Some error message
```

If you decide to execute a script (in this example the script name is `nlogger.ps1`), the name of the script is also logged:

```
2020-12-14 11:42:42.9662|DEBUG|nlogger.ps1|Some debug message
2020-12-14 11:42:43.0123|INFO|nlogger.ps1|Some info message
2020-12-14 11:42:43.0281|WARN|nlogger.ps1|Some warn message
2020-12-14 11:42:43.0436|INFO|nlogger.ps1|Some Console message
```

The Cmdlets will still write proper output as they are supposed to. If you now check the log-file, you should see the messages also being logged to the log file. On default, it's using the '${cmtrace}' layout renderer, to write log messages in a format that is consumable by CMTrace. A real-time log viewer used in Microsoft System Center Configuration Manager. As that's basically what I'm dealing with most of the time ;)

### Quickly add logging to a specific log-file

In case you might want to write to a different location, you can also specify the exact filename or even use other [Layout Renderer](https://github.com/nlog/nlog/wiki/Layout-Renderers) from [NLog](http://nlog-project.org/). E.g. to write every log level to a different file, you could use the following

```powershell
Import-Module PSNlog
Enable-NLogLogging -FileName '${env:temp}/${level}.log'
```

or you might want to use a different layout. E.g. the one used on default by NLog:

```powershell
Enable-NLogLogging -FileName '${env:scriptroot}/${level}.log' -Layout '${longdate}|${level:uppercase=true}|${logger}|${message}'
```

In case you don't want to have this automatic redirection of the Write-* CmdLets, just supply the parameter **DontRedirectMessages**.

### Customize logging

While using **Write-Verbose**, **Write-Host**, **Write-Warning** and **Write-Error** is a good and easy start, you might want to have a bit more control about the log messages that are created within your script. Especially about the individual levels. e.g. you might want to make proper use of the **Info** level without using Write-Host ([You shouldn't use Write-Host. Really, don't!](http://www.jsnover.com/blog/2013/12/07/write-host-considered-harmful/)).

So lets log to a custom log file and enable daily archiving of this log file

```powershell
$paramNewNLogFileTarget = @{
	Name = 'MyFileTArget'
	Filename = 'C:\scripts\PowerShell\logs\MyLogFile.log'
	ArchiveFileName = 'C:\scripts\PowerShell\logs\archive\MyLog.{#}.log'
	ArchiveNumbering = 'Date'
	ArchiveEvery = 'Day'
	MaxArchiveFiles = 14
	ArchiveDateFormat = 'yyyyMMdd'
	EnableArchiveFileCompression = $true
}
$Target = New-NLogFileTarget @paramNewNLogFileTarget
Enable-NLogLogging -Target $Target -DontRedirectMessages
```

In this example all Log-files are rolled-over daily, all older files are compressed and stored for 14 days. This gives you the flexibility to establish your own logging.

Then write log messages as following

```powershell
$Logger = Get-NLogLogger

$Logger.Debug("Some debug message")
$Logger.Info("Some info message")
$Logger.Warn("Some warn message")
$Logger.Error("Some error message")
$Logger.Trace("Some trace message")

```

The output will look like this:

```
2020-12-14 11:48:16.0241|DEBUG||Some debug message
2020-12-14 11:48:16.0710|INFO||Some info message
2020-12-14 11:48:16.1022|WARN||Some warn message
2020-12-14 11:48:16.1335|ERROR||Some error message
2020-12-14 11:48:17.2136|TRACE||Some trace message
```

Another example with a different logging layout:

```powershell
$Target = New-NLogTarget -Name 'Warnings' -FileTarget
$Target.Filename = 'C:\scripts\PowerShell\logs\MyLogging.log'
$Target.CreateDirs = $true
Enable-NLogLogging -FileName 'C:\scripts\PowerShell\logs\MyLogging.log' -MinLevel Info -Layout '${longdate} | ${machinename} | ${processname} (${processid}) | ${level:uppercase=true} | ${logger} | ${message}'
```

The output will look like this, in this case the script `nlogger.ps1` was called on the computer with the name **HAL-9000**:

```
2020-12-14 15:10:37.4358 | HAL-9000 | powershell (1912) | INFO | nlogger.ps1 | Some info message
2020-12-14 15:10:37.4358 | HAL-9000 | powershell (1912) | WARN | nlogger.ps1 | Some warn message
2020-12-14 15:10:37.4529 | HAL-9000 | powershell (1912) | INFO | nlogger.ps1 | Some Console message
2020-12-14 15:10:37.4656 | HAL-9000 | powershell (1912) | ERROR | nlogger.ps1 | Some error message
```

PowerShell had the PID 1912 in this example above! Add the Hostname to the logging might be useful if you want to do any central logging!

The same example with PowerShell Core, in this case Version 7.1.0):

```
2020-12-14 15:18:56.2251 | HAL-9000 | pwsh (1208) | INFO | nlogger.ps1 | Some info message
2020-12-14 15:18:56.2539 | HAL-9000 | pwsh (1208) | WARN | nlogger.ps1 | Some warn message
2020-12-14 15:18:56.2633 | HAL-9000 | pwsh (1208) | INFO | nlogger.ps1 | Some Console message
2020-12-14 15:18:56.2734 | HAL-9000 | pwsh (1208) | ERROR | nlogger.ps1 | Some error message
```

You can mix and match the logging! for instance: You can log with the level **Error**, rollover daily and keep the Files for 30 days. If you want to observe you system/scripts (e.g. after a bigger change), just create an additional logger instance with the level **Warn** or **Debug** and keep these files for 7 days on a separate disk.

You could also use the [NLog](http://nlog-project.org/) **WebServiceTarget** for the level **Error** or **Fatal**, this can call any Web-Service or Web-Hook with *HttpGet* or *HttpPost*. I also tried *JsonPost* with some Web-Hooks and it worked just fine.

There is Proxy support by the .Net components of [NLog](http://nlog-project.org/), I never tested it.

_Please keep in mind:_

**PSNLog** and [NLog](http://nlog-project.org/) are not created as a monitoring system or for native observation purposes! It's a logging component, not more.

If you want a real Monitoring that can observe your logs, **PSNLog** and [NLog](http://nlog-project.org/) can help you to establish that. But you should monitor the Logs with something like [NXLog](https://nxlog.co) and establish a central logging instance, like [Graylog](https://www.graylog.org) or [Azure Monitor](https://azure.microsoft.com/en-us/services/monitor/) (Azure Log Analytics). Other vendors also have great solutions in that area.

If you want a rock solid solution, you might want to pump your critical logs into a Security Information and Event Management (**SIEM**) system, like [Azure Sentinel](https://azure.microsoft.com/en-us/services/azure-sentinel/). Other vendors also have great solutions in that area.

Please see the [NLog Wiki](https://github.com/nlog/nlog/wiki/WebService-target) for more details about **WebServiceTarget** configuration and capabilities.


## Contributors

* [Joerg Hochwald](https://github.com/jhochwald)
* [Maik Koster](https://github.com/MaikKoster)

## License

* Please read our [LICENSE](LICENSE) file (Should come with the distribution or in out GitHub repository)

