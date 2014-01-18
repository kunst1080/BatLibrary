@echo off

call %LOCAL_SETUP%

call %LOCAL%\etc\fstab.bat
call logging.bat PC‚ð‹N“®‚µ‚Ü‚µ‚½

taskkill /f /im explorer.exe & start explorer

REM RC_INIT
set FOLD=%LOCAL%\sched\rc.init
if exist %FOLD% (
	CD /d %FOLD%\
	for /f "usebackq" %%i in (`dir /b /a-d`) do (
		call start cmd /c "%%i"
		call wait 3
	)
)
REM RC_INIT2
set FOLD=%LOCAL%\sched\rc.init2
if exist %FOLD% (
	CD /d %FOLD%\
	for /f "usebackq" %%i in (`dir /b /a-d`) do (
		call start cmd /c "%%i"
		call wait 3
	)
)
call wait 3
cd /d C:
if exist %LOCAL%\sched\rc.init2 REN %LOCAL%\sched\rc.init2 _rc.init2
