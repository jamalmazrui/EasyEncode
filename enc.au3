; enc
; Version 1.1
; September 13, 2015
; Copyright 2011 by Jamal Mazrui
; GNU Lesser General Public License (LGPL)

Dim $iEncoding, $oEncodings, $sEncoding

Func _ConsoleExit($sText)
ConsoleWrite($sText)
Exit
EndFunc

Func _CreateEncodings()
Dim $oEncodings = ObjCreate("Scripting.Dictionary")
$oEncodings(0) = "ANSI"
; $oEncodings(32) = "UTF-16 Little Endian"
$oEncodings(32) = "utf16"
; $oEncodings(64) = "UTF-16 Big Endian"
$oEncodings(64) = "utf16be"
; $oEncodings(128) = "UTF- 8 with BOM"
$oEncodings(128) = "utf8b"
; $oEncodings(256) = "UTF-8 without BOM"
$oEncodings(256) = "utf8n"
$oEncodings(-1) = "error"
Return $oEncodings
EndFunc

; Main program

$oEncodings = _CreateEncodings()
If not $CmdLine[0] Then _ConsoleExit("Syntax:" & @CrLf & "enc FilePath")

$sFile = $CmdLine[1]
; $sFile = "test.txt"
$iEncoding = FileGetEncoding($sFile)
$sEncoding = $oEncodings($iEncoding)
ConsoleWrite($sEncoding)
