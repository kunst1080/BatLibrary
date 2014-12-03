@echo off
if "%1"=="--help" (
	echo taskkill /IM 以外のオプションを使用するときは、taskkillコマンドを使用してください。
	echo taskkill /?
	taskkill /?
	goto :EOF
)
taskkill /IM %1 /T
