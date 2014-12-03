@echo off
setlocal
set /a local_math=%*
if %ERRORLEVEL%==0 echo %local_math%
