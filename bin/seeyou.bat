@echo off

call "%LOCAL_SETUP%"

call logging シャットダウンします

if exist %LOCAL%\sched\_rc.init2 REN %LOCAL%\sched\_rc.init2 rc.init2

REM RC_SHUTDOWN
set FOLD=%LOCAL%\sched\rc.shutdown
if exist "%FOLD%" (
	CD /d "%FOLD%"
	for /f "usebackq" %%i in (`dir /b /a-d`) do (
		call start cmd /c "%%i"
		call wait 2
	)
)
echo **************************************************
echo シャットダウンの準備が整いました。終了して下さい。
echo **************************************************
pause > nul

REM cls
REM echo ************************************************
REM echo.
REM echo         30秒後にシャットダウンします．．．
REM echo.
REM echo ************************************************
REM echo.
REM echo ！キャンセルする場合は、Cntrl-Cを入力
REM for /L %%j in (10, -1, 1) do @(
REM 	echo %%j
REM 	call wait 2
REM )
REM cscript //nologo %LOCAL%\bin\_shutdown.vbs
