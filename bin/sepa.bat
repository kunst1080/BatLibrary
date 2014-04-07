@if (1==1) /*
@echo off

if "%~1"=="" goto :USAGE
if "%~1"=="/?" goto :USAGE

:MAIN
CScript //nologo //E:JScript "%~f0" %*
If ERRORLEVEL 1 goto :USAGE
goto :eof

:USAGE
echo USAGE:
echo  %~n0 セパレータ
echo       標準入力を指定されたセパレータで分割し改行します。
echo.
goto :eof
rem */
@end
//----------------------------------------------------------
if (WScript.Arguments.Lrngth == 0)
  WScript.Quit(9);

var re = new RegExp(WScript.Arguments(0), "g");
var s = WScript.StdIn.ReadAll();
WScript.StdOut.Write(s.replace(re,"\r\n"));

WScript.Quit(0);
