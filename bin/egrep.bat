@echo off
setlocal

if "%1"=="--help" (
	echo usage^: egrep ^<option^> �������� �����Ώ�
	echo     option^: -n �s�ԍ���\�����܂�
	goto :EOF
)

set egrep_OPT=
if "%1"=="-n" (
	set egrep_OPT=/n
	shift
)

findstr %egrep_OPT% /i "%1" %2
