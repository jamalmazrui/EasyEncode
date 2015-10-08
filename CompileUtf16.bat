@echo off
cls
echo Compiling
if exist utf16.exe del utf16.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2Exe.exe" /in utf16.au3 /console
if exist utf16.exe echo Done
