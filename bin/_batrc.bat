@rem BATŠÂ‹«‰Šúİ’è
@pushd .
@cd /d "%~dp0.."
@set LOCAL=%CD%
@popd

@rem ŠÂ‹«•Ï”‚Ì’Ç‰Á
@set PATH=%PATH%;%LOCAL%\bin
@set PATH=%PATH%;%LOCAL%\bin-scripts
@set PATH=%PATH%;%LOCAL%\bin-UNIX
@set PATH=%PATH%;%LOCAL%\tools
@rem set PATH=%PATH%;%LOCAL%\lnk
@set PATHEXT=%PATHEXT%;.URL
@set EDITOR=sakura

@if "%~1" == "--terminal" (
	rem ’[––‰Šúİ’è
	shift
	title BAT-Term
	prompt [$S$P$S]$_$$$S
	if exist "%LOCAL%\etc\%USERNAME%\batrc.bat" call "%LOCAL%\etc\%USERNAME%\batrc.bat"
	cd /d "%HOME%"
)
