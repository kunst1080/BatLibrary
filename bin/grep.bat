@echo off
setlocal

if "%1"=="--help" (
	echo usage^: grep ^<option^> 検索文字 検索対象
	echo     option^: -n 行番号を表示します
	goto :EOF
)

set grep_OPT=
if "%1"=="-n" (
	set grep_OPT=/n
	shift 0
)

find %grep_OPT% /i "%1" %2
