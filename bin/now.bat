@echo off

REM �\���`���̃I�v�V����
if "%~1"=="-d" echo %DATE:/=%
if "%~1"=="-t" echo %TIME: =0%
if "%~1"=="" echo %DATE% %TIME%
