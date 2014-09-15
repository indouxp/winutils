@echo off
set CWD=%~dp0
set JS=%CWD%\%~n0.wsf
set RESULT=%~n0.bs
set AFTERSORT=%~n0.as

echo start
echo %1
cscript //nologo %JS% %1 > %RESULT%
set rc=%errorlevel%
echo %rc%
if %rc% neq 0 goto :abnormal

sort /r %RESULT% > %AFTERSORT%
set rc=%errorlevel%
echo %rc%
if %rc% neq 0 goto :abnormal

echo %AFTERSORT%‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
echo done

:success
exit /b 0

:abnormal
exit /b 1
