@echo off
cls
echo Compiling
if exist utf8n64.exe del utf8n64.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2Exe_x64.exe" /in Utf8n.au3 /out utf8n64.exe /console
if exist utf8n64.exe echo Done
