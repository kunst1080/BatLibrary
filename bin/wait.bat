@echo off
setlocal

if "%~1"=="" goto :USAGE

:MAIN
SET /a WAIT_TIME="%~1"
ping localhost -n %WAIT_TIME% > nul
goto :eof

:USAGE
echo Usage�F
echo    wait time
echo     time(�b)�̊ԁA�������~���܂�
goto :eof
