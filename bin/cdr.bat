@echo off
setlocal ENABLEDELAYEDEXPANSION
set CONF=%LOCAL%\etc\%USERNAME%\pathenv.txt
set CD_COMMAND=pushd

REM �p�X�ݒ�t�@�C���̓ǂݍ���
for /f "usebackq tokens=*" %%i in ("%CONF%") do @%%i

if "%1"=="/?" (
	call :HELP
	goto :eof
)

if "%~1"=="--setting" (
	start "" "%CONF%"
	goto :eof
)

REM �������ݒ肳��Ă���p�X�̏ꍇ�A���ϐ���W�J����
if defined cdr_%~1 (
	for /f "usebackq tokens=*" %%i in (`echo %%cdr_%~1%%`) do set local_cdr=%%i
	for /f "usebackq tokens=*" %%i in (`echo !local_cdr!`) do set local_cdr=%%i
)
REM �������ʏ�̃p�X�̏ꍇ�A���ʂɊJ��
if not defined cdr_%~1 set local_cdr=%~1

rem ���ϐ��������z����CD����
endlocal & %CD_COMMAND% "%local_cdr%"

goto :eof

:HELP
	echo �g�p�\�ȃp�����[�^
	for /f "usebackq tokens=*" %%i in (`set cdr`) do (
		set line=%%i
		echo   !line:~4!
	)
	echo.
	echo �I�v�V���� --setting
	echo   �p�X�ݒ�t�@�C�����J���܂�
exit /b
