@echo off
setlocal

if "%1"=="--help" (
	echo usage^: egrep ^<option^> 検索文字 検索対象
	echo     option^: -n 行番号を表示します
	goto :EOF
)

set egrep_OPT=
if "%1"=="-n" (
	set egrep_OPT=/n
	shift
)

findstr %egrep_OPT% /i "%1" %2
