@prompt $T$g
set baseDir=%~dp0
echo baseDir is %baseDir%
set "binRoot=%baseDir%win"
set "AppendRandomName=%1"
set "PrependHostName=%2"
set "AppendHostName=%3"

echo %time%
"%baseDir%win\rrBin\baConvertEnvFile.exe"  "%baseDir%test-CPU_singleCore.rrEnv" "%TEMP%\rrBench-CPUSingle.bat"
call  %TEMP%\rrBench-CPUSingle.bat
echo %time%
del %TEMP%\rrBench-CPUSingle.bat

set RandStr=

rem shutdown /s
rem pause