@echo off
if "%1"=="--help" (
	echo taskkill /IM �ȊO�̃I�v�V�������g�p����Ƃ��́Ataskkill�R�}���h���g�p���Ă��������B
	echo taskkill /?
	taskkill /?
	goto :EOF
)
taskkill /IM %1 /T
