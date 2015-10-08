@echo off
cls
echo Compiling
if exist Utf8n.exe del Utf8n.exe
"c:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe.exe" /in Utf8n.au3 /console
if exist Utf8n.exe echo Done
