@echo off

call "%LOCAL_SETUP%"

call logging �V���b�g�_�E�����܂�

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
echo �V���b�g�_�E���̏����������܂����B�I�����ĉ������B
echo **************************************************
pause > nul

REM cls
REM echo ************************************************
REM echo.
REM echo         30�b��ɃV���b�g�_�E�����܂��D�D�D
REM echo.
REM echo ************************************************
REM echo.
REM echo �I�L�����Z������ꍇ�́ACntrl-C�����
REM for /L %%j in (10, -1, 1) do @(
REM 	echo %%j
REM 	call wait 2
REM )
REM cscript //nologo %LOCAL%\bin\_shutdown.vbs
