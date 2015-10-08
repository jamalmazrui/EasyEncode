@echo off
cls
echo Compiling
if exist utf8b.exe del utf8b.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe.exe" /in utf8b.au3 /console
if exist utf8b.exe echo Done
