@echo off
cls
echo Compiling
if exist Ansi.exe del Ansi.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe.exe" /in Ansi.au3 /console
if exist Ansi.exe echo Done
