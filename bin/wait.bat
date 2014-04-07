@echo off
setlocal

if "%~1"=="" goto :USAGE

:MAIN
SET /a WAIT_TIME="%~1"
ping localhost -n %WAIT_TIME% > nul
goto :eof

:USAGE
echo Usage：
echo    wait time
echo     time(秒)の間、処理を停止します
goto :eof
