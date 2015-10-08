@echo off
cls
echo Compiling
if exist enc.exe del enc.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\aut2exe.exe" /in enc.au3 /console
if exist enc.exe echo Done
