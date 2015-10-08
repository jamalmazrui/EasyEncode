@echo off
cls
echo Compiling
if exist utf1664.exe del utf1664.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2Exe_x64.exe" /in utf16.au3 /out utf1664.exe /console
if exist utf1664.exe echo Done
