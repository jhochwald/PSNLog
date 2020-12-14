<!--
[![Build status](https://ci.appveyor.com/api/projects/status/rrb6quib6y72qjcg/branch/master?svg=true)](https://ci.appveyor.com/project/MKoster/PSNlog/branch/master) [![PS Gallery](https://img.shields.io/badge/install-PS%20Gallery-blue.svg)](https://www.powershellgallery.com/packages/PSNLog)
-->

# PSNLog PowerShell module

The "PSNLog" PowerShell module is a wrapper around the famous, flexible and free open source logging for .Net component [NLog](http://nlog-project.org/).

This is a fork of "PSNLog" Version 0.2.5 by [Maik Koster](https://github.com/MaikKoster/PSNLog).

Proper logging is a common requirement within most PowerShell scripts and modules. There are a lot of possibilities to support logging within PowerShell. However, most of them are very limited in their capabilities and/or intrusive to the script/module.

This Module allows to use all the capabilities and the flexibility of NLog with as little as two lines of PowerShell.

(c) 2020 Joerg Hochwald

(c) 2018 Maik Koster. All rights reserved.

## Requirements

PowerShell Version 5.0+

## Third party components

NLog - Copyright (c) Copyright (c) 2004-2020 Jaroslaw Kowalski <jaak@jkowalski.net>, Kim Christensen, Julian Verdurmen. Please see [License](https://github.com/NLog/NLog/blob/master/LICENSE.txt).

## Install

Will be back soon!

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
2. Create a simple configuration for NLog and redirect native functions.

```powershell
Import-Module PSNlog
Enable-NLogLogging
```

This will create a very simple standard configuration, that writes log messages to a log file with the same name as the script file within the %Temp% director. If it is not called from within a script, it will use the name `'PSNLog'` as default. To allow easy integration for existing scripts and modules, it implements a little trick that basically write the content of every call to **Write-Verbose**, **Write-Host**, **Write-Warning** and **Write-Error** into the log file as well.

On default, messages written by **Write-Verbose** will have a log level of **Debug**, **Write-Host** a log level of **Info**, **Write-Warning** a log level of **Warn** and **Write-Error** a log level of **Error**. Please see the [NLog Wiki](https://github.com/NLog/NLog/wiki/Configuration-file#log-levels) for more details about the different log levels.

You can now test the behaviour by calling

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
2020-12-14 11:43:44.8520|INFO|<ScriptBlock>|Some info message2020-12-14 11:43:44.8989|WARN|<ScriptBlock>|Some warn message2020-12-14 11:43:44.9614|INFO|<ScriptBlock>|Some Console message2020-12-14 11:43:46.4629|ERROR|<ScriptBlock>|Some error message
```

If you decide to execute a script (in this example the script name is `doit.ps1`), the name of the script is also logged:

```
2020-12-14 11:42:42.9662|DEBUG|doit.ps1|Some debug message2020-12-14 11:42:43.0123|INFO|doit.ps1|Some info message2020-12-14 11:42:43.0281|WARN|doit.ps1|Some warn message2020-12-14 11:42:43.0436|INFO|doit.ps1|Some Console message
```

The Cmdlets will still write proper output as they are supposed to. If you now check the logfile, you should see the messages also being logged to the log file. On default, it's using the '${cmtrace}' layout renderer, to write log messages in a format that is consumable by CMTrace. A real-time log viewer used in Microsoft System Center Configuration Manager. As that's basically what I'm dealing with most of the time ;)

### Quickly add logging to a specific logfile

In case you might want to write to a different location, you can also specify the exact filename or even use other [Layout Renderer](https://github.com/nlog/nlog/wiki/Layout-Renderers) from Nlog. E.g. to write every log level to a different file, you could use the following

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
$paramNewNLogFileTarget = @{	Name = 'MyFileTArget'	Filename = 'C:\scripts\PowerShell\logs\MyLogFile.log'	ArchiveFileName = 'C:\scripts\PowerShell\logs\archive\MyLog.{#}.log'	ArchiveNumbering = 'Date'	ArchiveEvery = 'Day'	MaxArchiveFiles = 14	ArchiveDateFormat = 'yyyyMMdd'	EnableArchiveFileCompression = $true}$Target = New-NLogFileTarget @paramNewNLogFileTarget
Enable-NLogLogging -Target $Target -DontRedirectMessages
```

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
2020-12-14 11:48:16.0241|DEBUG||Some debug message2020-12-14 11:48:16.0710|INFO||Some info message2020-12-14 11:48:16.1022|WARN||Some warn message2020-12-14 11:48:16.1335|ERROR||Some error message2020-12-14 11:48:17.2136|TRACE||Some trace message
```

## Contributors

* [Joerg Hochwald](https://github.com/jhochwald)
* [Maik Koster](https://github.com/MaikKoster)

## License

* see [LICENSE](LICENSE.md) file

<!--
## Contact

* Twitter: [@Maik_Koster](https://twitter.com/Maik_Koster)
* Blog: [MaikKoster.com](http://MaikKoster.com/)
-->