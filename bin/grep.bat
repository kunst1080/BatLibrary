@echo off
setlocal

if "%1"=="--help" (
	echo usage^: grep ^<option^> �������� �����Ώ�
	echo     option^: -n �s�ԍ���\�����܂�
	goto :EOF
)

set grep_OPT=
if "%1"=="-n" (
	set grep_OPT=/n
	shift 0
)

find %grep_OPT% /i "%1" %2
