@echo off
setlocal

if "%1"=="--help" (
	echo usage^: grep ^<option^> ŒŸõ•¶š ŒŸõ‘ÎÛ
	echo     option^: -n s”Ô†‚ğ•\¦‚µ‚Ü‚·
	goto :EOF
)

set grep_OPT=
if "%1"=="-n" (
	set grep_OPT=/n
	shift 0
)

find %grep_OPT% /i "%1" %2
