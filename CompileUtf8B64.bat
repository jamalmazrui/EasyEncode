@echo off
cls
echo Compiling
if exist utf8b64.exe del utf8b64.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2Exe_x64.exe" /in utf8b.au3 /out utf8b64.exe /console
if exist utf8b64.exe echo Done
