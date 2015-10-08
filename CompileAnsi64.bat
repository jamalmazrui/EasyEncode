@echo off
cls
echo Compiling
if exist ansi64.exe del ansi64.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\aut2exe_x64.exe" /in ansi.au3 /out ansi64.exe /console
if exist ansi64.exe echo Done
