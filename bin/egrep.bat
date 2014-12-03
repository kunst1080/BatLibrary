@echo off
setlocal

if "%1"=="--help" (
	echo usage^: egrep ^<option^> ŒŸõ•¶š ŒŸõ‘ÎÛ
	echo     option^: -n s”Ô†‚ğ•\¦‚µ‚Ü‚·
	goto :EOF
)

set egrep_OPT=
if "%1"=="-n" (
	set egrep_OPT=/n
	shift
)

findstr %egrep_OPT% /i "%1" %2
