@rem BAT�������ݒ�
@pushd .
@cd /d "%~dp0.."
@set LOCAL=%CD%
@popd

@rem ���[�U�ʐݒ�
@set USERCONF=%LOCAL%\etc\%USERNAME%\user.init.bat
@if exist "%USERCONF%" Call "%USERCONF%"

@rem ��ƃt�H���_�̐ݒ�
@if "%WORK%" == "" set WORK=%HOME%

@if "%~1" == "--terminal" (
	rem �[�������ݒ�
	shift
	title BAT-Term
	prompt [$S$P$S]$_$$$S
	if exist "%LOCAL%\etc\%USERNAME%\batrc.bat" call "%LOCAL%\etc\%USERNAME%\batrc.bat"
	call alias --load
	cd /d "%WORK%"
)
