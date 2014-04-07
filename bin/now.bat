@echo off

REM 表示形式のオプション
if "%~1"=="-d" echo %DATE:/=%
if "%~1"=="-t" echo %TIME: =0%
if "%~1"=="" echo %DATE% %TIME%
