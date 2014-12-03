@echo off
setlocal

rem /*
rem  *           cal.bat
rem  * 
rem  * �J�����_�[��\������R�}���h
rem  * �@(UNIX��cal�R�}���h�̃N���[��)
rem  */


rem 
rem ========== �w���v�̕\�� ==========
if "%1"=="-h" goto Help
if "%1"=="--help" goto Help
if "%1"=="/?" goto Help
goto noHelp
rem ---------------------
:Help
echo  ============ �R�}���h���C���I�v�V���� ============
echo �@-h, --help, /?�@�c�c�@�w���v�̕\��
echo.
echo �@[-Opt] [[Month] Year]
echo �@�@-3�@�c�c�@�R�����J�����_�[�̕\��(�O���A�����A�����)
echo �@�@-y�@�c�c�@�P�N�J�����_�[�̕\��
echo �@�@Month�@�����p��œ���(��FApril)
echo �@�@Year �@�N���S���œ���(yyyy)
echo �@�@�@�@�@�@�@�@�@�@�@1752�N�ȑO�͕\������܂���
echo.
echo  �I�v�V���������Ŏ��s����ƁA���N������̃J�����_�[��\�����܂�
goto :EOF
rem ---------------------
:noHelp


rem ============ ���t�̐ݒ� ============
rem ���t�f�[�^�̒��o
 rem Mn�c����
set /a thisMn=%date:~5,2%
 rem Yr�c���N
set /a thisYr=%date:~0,4%

rem �����̃V�t�g�Ȃ�
set Opt=0
if "%1"=="-3" set Opt=-3
if "%1"=="-y" set Opt=-y
:hikisu
 rem �����̓���
 if /i "%1"=="January" set Mn=1
 if /i "%1"=="February" set Mn=2
 if /i "%1"=="March" set Mn=3
 if /i "%1"=="April" set Mn=4
 if /i "%1"=="May" set Mn=5
 if /i "%1"=="June" set Mn=6
 if /i "%1"=="July" set Mn=7
 if /i "%1"=="August" set Mn=8
 if /i "%1"=="September" set Mn=9
 if /i "%1"=="October" set Mn=10
 if /i "%1"=="November" set Mn=11
 if /i "%1"=="December" set Mn=12
 rem �N�̓���
 set /a Yr=%1+0
 shift
if not "%1"=="" goto hikisu

rem �l�̒���
if %Yr% LEQ 1752 set /a Yr=thisYr

rem ---�����ɓ��t���܂܂�Ȃ��Ƃ�
if not defined Yr set Yr=%thisYr%
if not defined Mn set Mn=%thisMn%



rem ========== ���C���̏��� ========
rem 1�N�I�v�V����
if %Opt%==-y goto 1nen

rem 3�����I�v�V����
if %Opt%==-3 (
	rem �挎
	set /a Yr1=Yr
	set /a Mn1=Mn-1
	rem ����
	set /a Yr2=Yr
	set /a Mn2=Mn
	rem ����
	set /a Yr3=Yr
	set /a Mn3=Mn+1
	rem ----------
	goto 3kagetu
)

rem 1�����I�v�V����
goto 1kagetu



rem ========== �I�v�V�����ʂ̓��� ==========
rem -----1�N�J�����_�[�̕\��
:1nen
echo                                 %Yr%
echo.
set Mn=0

:1nenCal
 set /a Mn=%Mn%+1
 set /a Mn1=%Mn%
 set /a Mn2=%Mn%+1
 set /a Mn3=%Mn%+2
 call :subDate %Yr% %Mn1% 1
 call :subDate %Yr% %Mn2% 2
 call :subDate %Yr% %Mn3% 3
 rem �`��
 echo       %Month1%              %Month2%              %Month3%
 call :sub3calender
 echo.
 rem --------
if %Mn% LSS 12 goto 1nenCal

rem ---�I��
goto :EOF



rem -----3�����J�����_�[�̕\��
:3kagetu
 rem �N�z���̏���
if %Mn1%==0 (
	set /a Yr1=%Yr1%-1
	set Mn1=12
)
if %Mn3%==13 (
	set /a Yr3=%Yr3%+1
	set Mn3=1
)
call :subDate %Yr1% %Mn1% 1
call :subDate %Yr2% %Mn2% 2
call :subDate %Yr3% %Mn3% 3

rem 3�����\���̏���
echo    %Month1% %Yr1%         %Month2% %Yr2%         %Month3% %Yr3%
rem �`��
call :sub3calender

rem ---�I��
goto :EOF



rem -----1�����J�����_�[�̕\��
:1kagetu
call :subDate %Yr% %Mn%
call :sub1calender
rem ---�I��
goto :EOF



rem ===========================================================================
rem =======================                          ==========================
rem =======================       �T�u���[�`��       ==========================
rem ======================= ������������������������ ==========================


rem ===========================================================================
rem ================== �`��̂��߂̓��t�f�[�^�̐ݒ� ===========================
:subDate
rem ===========================================================================
rem �����̎󂯎��
set Yr=%1
set Mn=%2
 rem 3�����\���̍ۂɗ��p
 set Number=%3

rem ���̖��O�̕\���ɂ���(��������Month�Ɋi�[)
if %Mn%==1 set Month= January 
if %Mn%==2 set Month=February 
if %Mn%==3 set Month=  March  
if %Mn%==4 set Month=  April  
if %Mn%==5 set Month=   May   
if %Mn%==6 set Month=  June   
if %Mn%==7 set Month=  July   
if %Mn%==8 set Month= August  
if %Mn%==9 set Month=September
if %Mn%==10 set Month= October 
if %Mn%==11 set Month=Noveember
if %Mn%==12 set Month=December 


rem =========== �����������߂� ============
if %Mn%==1 set Getumatu=31

rem 2���v�Z�̏���(if�̊O�ɏ����Ȃ��ƃG���[�ɂȂ�)
 set Urr=Yes
 set /a UrrAmari = %Yr% %%4
 set /a UrrAmari2 = %Yr% %%400
if %Mn%==2 (
	rem �N��4�Ŋ���؂��ƁA���邤�N�B
	if %UrrAmari% NEQ 0 set Urr=No
	rem �N��100�Ŋ���؂�āA����400�Ŋ���؂�Ȃ��ƁA���邤�N�ł͂Ȃ��B
	if %Yr:~-2%==00 (
		if %UrrAmari2% NEQ 0 set Urr=No
	)
)
if %Mn%==2 (
	if %Urr%==Yes set Getumatu=29
	if %Urr%==No set Getumatu=28
)
if %Mn%==3 set Getumatu=31
if %Mn%==4 set Getumatu=30
if %Mn%==5 set Getumatu=31
if %Mn%==6 set Getumatu=30
if %Mn%==7 set Getumatu=31
if %Mn%==8 set Getumatu=31
if %Mn%==9 set Getumatu=30
if %Mn%==10 set Getumatu=31
if %Mn%==11 set Getumatu=30
if %Mn%==12 set Getumatu=31

rem =========== 1���ڂ̗j���𔻒� ===========
rem 1����2���́A���ꂼ��13�A14�Ōv�Z����
set Yr1=%Yr%
if %Mn%==1 (
	set M=13
	set /a Yr1=Yr-1
) else if %Mn%==2 (
	set /a Yr1=Yr-1
	set M=14
) else (
	set M=%Mn%
)
rem C=�N�̏�2���AY=�N�̉�2��
set /a C=%Yr1:~0,2%
set /a Y=%Yr1% - C*100

rem �j���̌v�Z��(Zeller�̌����𗘗p)
set /a Wk= (( 21 * %C% / 4 ) + ( 5 * %Y% / 4 ) + ( 26 * ( %M% + 1 ) / 10 )) %%7 + 1



if not defined Number exit /b
  rem ========== �߂�l�̐ݒ� ==========
  set Month%Number%=%Month%
  set Wk%Number%=%Wk%
  set Getumatu%Number%=%Getumatu%
  
  

rem ===== �߂�
exit /b



rem ===========================================================================
rem ====================== 1�����`��̃T�u���[�`�� ============================
:sub1Calender
rem ===========================================================================
rem 1�����\��
echo    %Month% %Yr%
echo  Su Mo Tu We Th Fr Sa

rem ---1�T��
set i=1
rem 1�s�ڂ̋󔒕�����\��
:LoopBlank
if %i% LSS %Wk% (
	set WeekStr=%WeekStr%   
	set /a i=i+1
	goto LoopBlank
)
rem 1�s�ڂ̐����������쐬
set Dy=1
:LoopNumber
set WeekStr=%WeekStr%  %Dy%
set /a Dy=Dy+1
set /a i=i+1
if %i% LEQ 7 goto LoopNumber

echo %WeekStr%

rem ---2�T�ڈȍ~
:LoopMonth
set WeekStr=
set i=1
:LoopWeek
if %Dy% LSS 10 (
	set WeekStr=%WeekStr%  %Dy%
) else (
	set WeekStr=%WeekStr% %Dy%
)
set /a Dy=Dy+1
rem �������������z����ƁA�T�\�����s���A���[�v���o��
if %Dy% GTR %Getumatu% (
	echo %WeekStr%
	goto Break
	)
set /a i=i+1
if %i% LEQ 7 goto LoopWeek
echo %WeekStr%

rem ---3�T�ڈȍ~
rem %Dy%�̒l�݈̂����p�����
if %Dy% LEQ %Getumatu% goto LoopMonth


:Break


rem ===== �߂�
exit /b



rem ===========================================================================
rem ====================== 3�����`��̃T�u���[�`�� ============================
:sub3Calender
rem ===========================================================================
rem 3�����\��
echo  Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
set WeekStr=

rem ------1�T��
 rem ����̃J�E���g
set j=0
:Week1
set /a j=j+1
 rem �j���̃J�E���g
set i=1

rem 1�s�ڂ̋󔒕������쐬
:LoopBlank3
 set /a Wk=Wk%j%
 if %i% LSS %Wk% (
	set WeekStr=%WeekStr%   
	set /a i=i+1
	goto LoopBlank3
)
rem 1�s�ڂ̐����������쐬
set Dy=1
:LoopNumber3
 set WeekStr=%WeekStr%  %Dy%
 set /a Dy=Dy+1
 set /a i=i+1
if %i% LEQ 7 goto LoopNumber3

rem �R������ 
set /a Dy%j%=Dy
if %j% LSS 3 (
	set WeekStr=%WeekStr%  
	goto Week1
)

echo %WeekStr%
set WeekStr=


rem ------2�T�ڈȍ~
set j=1
 rem ����̃J�E���g
:LoopMonth3
 rem ���[�v���I����Ă���Ƃ��̏���
set /a Dy=Dy%j%
set /a Getumatu=Getumatu%j%
if %Dy% GTR %Getumatu% (
	set WeekStr=%WeekStr%                     
	goto :Break3
)

set i=1

set /a Dy=Dy%j%
set /a Getumatu=Getumatu%j%

:LoopDay3
if %Dy% LSS 10 (
	set WeekStr=%WeekStr%  %Dy%
) else (
	set WeekStr=%WeekStr% %Dy%
)
set /a Dy=Dy+1
rem �������������z����ƁA�c��𖄂߁A���[�v���o��
if %Dy% GTR %Getumatu% goto LoopLast3
set /a i=i+1
if %i% LEQ 7 (
	goto LoopDay3
)
goto Break3
rem �c������̖��ߗ���
:LoopLast3
 set /a i=i+1
 if %i% GEQ 8 goto Break3
 set WeekStr=%WeekStr%   
goto LoopLast3

:Break3

rem ���ʃ��[�v
set WeekStr=%WeekStr%  
set /a Dy%j%=Dy
set /a j=j+1
if %j% LEQ 3 goto LoopMonth3

echo %WeekStr%
set WeekStr=


rem �T�̃��[�v
set j=1

if %Dy1% LEQ %Getumatu1% goto LoopMonth3
if %Dy2% LEQ %Getumatu2% goto LoopMonth3
if %Dy3% LEQ %Getumatu3% goto LoopMonth3



rem ===== �߂�
exit /b


