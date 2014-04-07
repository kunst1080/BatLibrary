@rem BAT環境初期設定
@pushd .
@cd /d "%~dp0.."
@set LOCAL=%CD%
@popd

@rem 環境変数の追加
@set PATH=%PATH%;%LOCAL%\bin
@set PATH=%PATH%;%LOCAL%\bin-scripts
@set PATH=%PATH%;%LOCAL%\bin-UNIX
@set PATH=%PATH%;%LOCAL%\tools
@rem set PATH=%PATH%;%LOCAL%\lnk
@set PATHEXT=%PATHEXT%;.URL
@set EDITOR=sakura

@if "%~1" == "--terminal" (
	rem 端末初期設定
	shift
	title BAT-Term
	prompt [$S$P$S]$_$$$S
	if exist "%LOCAL%\etc\%USERNAME%\batrc.bat" call "%LOCAL%\etc\%USERNAME%\batrc.bat"
	cd /d "%HOME%"
)
