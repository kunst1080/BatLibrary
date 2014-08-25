@if "%1"=="--load" (
    doskey /macrofile="%~dp0\alias.txt"

) else if "%1"=="--save" (
    doskey /macros > "%~dp0\alias.txt"

) else if "%1"=="" (
    doskey /macros
    
) else (
    for /f "delims== tokens=1,*" %%i in ("%*") do @if "%%j" neq "" (
        doskey %*
    ) else (
        doskey /macros | findstr /b /c:"%%i="
    )
)
