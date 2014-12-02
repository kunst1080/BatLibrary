@echo off
setlocal
if "%~1"=="" call :USAGE & goto :eof

rem ÉpÉCÉvèàóùîªíË
if "%~1"=="\o" (
	for /f "usebackq tokens=*" %%i in (`findstr .*`) do (
		call :MAIN "%%i" "%~2" "%~3"
	)
) else (
	call :MAIN "%~1" "%~2" "%~3"
)

goto :eof

rem ********************************************************************************
:USAGE
echo USAGE:
echo  SUBSTR str start [len]
echo  SUBSTR \o start [len] ^< stdIn
exit /b

:MAIN
set str=%~1
set start=%~2
if not "%~3"=="" set len=^^,%~3
for /f "usebackq tokens=*" %%i in (`echo %%str:~%start%%len%%%`) do @echo %%i
exit /b
