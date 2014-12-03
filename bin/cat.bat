@if (1==1) /*
@echo off
CScript //nologo //E:JScript "%~f0" %*
goto :eof
rem */
@end
args = WScript.Arguments;
sdtin = WScript.StdIn;
out = ""

/* 標準入力を標準出力に出力する */
if (args.length > 0 && args(0) == "-n") {
	for (i = 1 ; !sdtin.AtEndOfStream; i++){
		out += i + ":" + sdtin.ReadLine() + "\n\r";
	}
} else {
	out = sdtin.ReadAll();
};
WScript.Echo(out);
