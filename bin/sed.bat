@if (1==1) /*
@echo off
 
if "%~1"=="" goto :USAGE
if "%~1"=="/?" goto :USAGE
 
rem ********************************************************************************
:MAIN
CScript //nologo //E:JScript "%~f0" %*
If ERRORLEVEL 1 goto :USAGE
goto :eof
 
rem ********************************************************************************
:USAGE
echo USAGE:
echo  %~n0 ���K�\��
echo       �W�����͂𐳋K�\���Œu�����A�W���o�͂֏o�͂��܂��B
echo       ���������ɂ́AJScript�́ureplace�v���\�b�h���g�p���Ă��܂��̂ŁA
echo       �ׂ����d�l�͂�����Ɉˑ����܂��B
echo.
echo    �����s�R�[�h��CRLF�Ƃ��ēǂݍ��݁E�o�͂��܂��B
echo.
echo  �y�����z
echo     ���K�\��
echo       ��js/string/dist/g
goto :eof
 
rem ********************************************************************************
rem */
@end
//----------------------------------------------------------
if (WScript.Arguments.Lrngth == 0)
  WScript.Quit(9);
 
var re = WScript.Arguments(0).split("/");
var objRe = new RegExp(re[1], re[3]);
 
while (!WScript.StdIn.AtEndOfStream){
	var line = WScript.StdIn.ReadLine() + "\r\n";
	WScript.StdOut.Write(line.replace(objRe, re[2]));
}
WScript.Quit(0);
