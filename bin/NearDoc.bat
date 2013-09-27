@if (1==1) /*
@if "%~2"=="" goto :USAGE
@if "%~1"=="/?" goto :USAGE

@rem ---------------------------
:MAIN
@CScript //nologo //E:JScript "%~f0" "%~1" "%~2"
@exit /b

@rem ---------------------------
:USAGE
@echo USAGE:Call NearDoc.bat "%%~0" ヒアドキュメントの区切り文字
@exit /b 9

@rem ---------------------------
@rem */
@end
(function outHereDoc(file, tag){
	var sr = (WScript.CreateObject("Scripting.FileSystemObject")).OpenTextFile(file, 1, false);
	var outFlg = false;
	while(!sr.AtEndOfStream){
		var s = sr.ReadLine();
		if(s==("<" + tag)) outFlg = false;
		//if(outFlg) WScript.Echo(s);
		if(outFlg) WScript.StdOut.WriteLine(s);
		if(s==(tag + ">")) outFlg = true;
	}
	sr.Close();
	delete sr;
})(WScript.Arguments(0), WScript.Arguments(1));
