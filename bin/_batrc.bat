@rem BAT環境初期設定
@pushd .
@cd /d "%~dp0.."
@set LOCAL=%CD%
@popd

@rem ユーザ別設定
@set USERCONF=%LOCAL%\etc\%USERNAME%\user.init.bat
@if exist "%USERCONF%" Call "%USERCONF%"

@rem 作業フォルダの設定
@if "%WORK%" == "" set WORK=%HOME%

@if "%~1" == "--terminal" (
	rem 端末初期設定
	shift
	title BAT-Term
	prompt [$S$P$S]$_$$$S
	if exist "%LOCAL%\etc\%USERNAME%\batrc.bat" call "%LOCAL%\etc\%USERNAME%\batrc.bat"
	call alias --load
	cd /d "%WORK%"
)
