# PSNLog Module Release History

## [0.3.0] - Unreleased

Started a fork of "PSNLog" Version 0.2.5, a Wrapper for NLog to easily use NLog logging capabilities in PowerShell, by Maik Koster.

### Added

- Output, Info

### Changed

- Header of all Files
- Syntax
- Document the parameters

### Fixed

- a few minor glitches
- Add missing parameter descriptions

---

This is from the original Repository: [https://github.com/MaikKoster/PSNLog](https://github.com/MaikKoster/PSNLog)

## [0.2.5] - Unreleased

[Full Changelog](https://github.com/MaikKoster/PSNLog/compare/v0.2.4...v0.2.5)

### Changed

- Updated the behaviour of Enable-NLogLogging, so that it requires as minimal information as possible to get started with logging.
- Enable-NLogLogging will now redirect all calls to Write-Verbose, Write-Host, Write-Warning and Write-Error on default. One has to explicitly disable this functionality

### Fixed

- Fixed the module initialization code before built.

## [0.2.4] - 2018-03-21

[Full Changelog](https://github.com/MaikKoster/PSNLog/compare/v0.2.3...v0.2.4)

### Added

- Added CmdLet New-NLogFileTarget, as writing log messages to files is a very common task. Having a dedicated CmdLet makes it easier.

### Fixed

- Fixed build process to properly handle code that needs to be executed to properly initialize the module.
- Fixed a few typos.

## [0.2.3] - 2018-03-21

[Full Changelog](https://github.com/MaikKoster/PSNlog/compare/v0.2.2...v0.2.3)

### Added

- Added tests for the module.

### Changed

- Updated the ReadMe with details on how to make use of the cmtrace Layout Renderer

### Fixed

- Fixed typo in the Write-NlogVerbose, Write-NLogHost, Write-NLogWarning, and Write-NLogError, which prevented them to properly foward the original message.
- Fixed the New-NLogTarget CmdLet to properly use the supplied name.

## [0.2.2] - 2018-03-21

Initial public release, supporting the following actions:

- Reference NLog.dll
- Create Logger
- Create Rules
- Create Target
- Read and apply config file
- Support SimpleConfiguration
- Redirect existing Write-Verbose, Write-Warning, Write-Error calls
