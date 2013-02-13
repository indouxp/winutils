@echo off
set CWD=%~dp0
set JS=%CWD%\%~n0.wsf
set RESULT=%CWD%\%~n0.bs
set AFTERSORT=%CWD%\%~n0.as

echo start
echo %1
cscript //nologo %JS% %1 > %RESULT%
set rc=%errorlevel%
sort /r %RESULT% > %AFTERSORT%
echo %rc%
echo done
