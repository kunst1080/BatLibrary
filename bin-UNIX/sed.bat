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
echo  %~n0 正規表現
echo       標準入力を正規表現で置換し、標準出力へ出力します。
echo       内部処理には、JScriptの「replace」メソッドを使用していますので、
echo       細かい仕様はそちらに依存します。
echo.
echo    ※改行コードはCRLFとして読み込み・出力します。
echo.
echo  【引数】
echo     正規表現
echo       例）s/string/dist/g
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
