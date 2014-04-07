@echo off
setlocal ENABLEDELAYEDEXPANSION
set CONF=%LOCAL%\etc\%USERNAME%\pathenv.txt
set CD_COMMAND=pushd

REM パス設定ファイルの読み込み
for /f "usebackq tokens=*" %%i in ("%CONF%") do @%%i

if "%1"=="/?" (
	call :HELP
	goto :eof
)

if "%~1"=="--setting" (
	start "" "%CONF%"
	goto :eof
)

REM 引数が設定されているパスの場合、環境変数を展開する
if defined cdr_%~1 (
	for /f "usebackq tokens=*" %%i in (`echo %%cdr_%~1%%`) do set local_cdr=%%i
	for /f "usebackq tokens=*" %%i in (`echo !local_cdr!`) do set local_cdr=%%i
)
REM 引数が通常のパスの場合、普通に開く
if not defined cdr_%~1 set local_cdr=%~1

rem 環境変数を持ち越してCDする
endlocal & %CD_COMMAND% "%local_cdr%"

goto :eof

:HELP
	echo 使用可能なパラメータ
	for /f "usebackq tokens=*" %%i in (`set cdr`) do (
		set line=%%i
		echo   !line:~4!
	)
	echo.
	echo オプション --setting
	echo   パス設定ファイルを開きます
exit /b
