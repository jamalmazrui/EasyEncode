@echo off
cls
echo Compiling
if exist enc64.exe del enc64.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\aut2exe_x64.exe" /in enc.au3 /out enc64.exe /console
if exist enc64.exe echo Done
