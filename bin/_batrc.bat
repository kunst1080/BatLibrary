@rem BAT�������ݒ�
@pushd .
@cd /d "%~dp0.."
@set LOCAL=%CD%
@popd

@rem ���ϐ��̒ǉ�
@set PATH=%PATH%;%LOCAL%\batlib\bin
@set PATH=%PATH%;%LOCAL%\batlib\bin-UNIX
@set PATH=%PATH%;%LOCAL%\batlib\bin-scripts
@set PATH=%PATH%;%LOCAL%\batlib\bin-tukubai
@set PATH=%PATH%;%LOCAL%\batlib\tools
@set PATHEXT=%PATHEXT%;.LNK;.URL;
@set EDITOR=sakura

@if "%~1" == "--terminal" (
	rem �[�������ݒ�
	shift
	title BAT-Term
	prompt [$S$P$S]$_$$$S
	if exist "%LOCAL%\etc\%USERNAME%\batrc.bat" call "%LOCAL%\etc\%USERNAME%\batrc.bat"
	cd /d "%HOME%"
)
