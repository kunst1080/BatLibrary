@if (1==1) /*
@echo off
CScript //nologo //E:JScript "%~f0" %*
goto :eof
rem */
@end
for (i = 1 ; !WScript.StdIn.AtEndOfStream; i++){
	WScript.Echo(i + ":" + WScript.StdIn.ReadLine());
}
