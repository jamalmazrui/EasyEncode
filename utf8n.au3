; utf8n
; Version 1.1
; September 13, 2015
; Copyright 2011 by Jamal Mazrui
; GNU Lesser General Public License (LGPL)

Opt("MustDeclareVars", True)

Dim $iEncoding, $iReadMode, $iWriteMode, $f, $oEncodings, $sEncoding, $sBody, $sFile

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

Func _FileRead($sFile)
Dim $iReadMode = 0 + 16384  
Dim $f = FileOpen($sFile, $iReadMode)
Dim $sBody = FileRead($f)
FileClose($f)
Return $sBody
EndFunc

Func _FileWriteAnsi($sFile, $sBody)
Dim $iWriteMode = 2 + 0
FileDelete($sFile)
Dim $f = FileOpen($sFile, $iWriteMode)
Dim $iReturn = FileWrite($f, $sBody)
FileClose($f)
Return $iReturn
EndFunc

Func _FileWriteUtf16($sFile, $sBody)
Dim $iWriteMode = 2 + 32
FileDelete($sFile)
Dim $f = FileOpen($sFile, $iWriteMode)
Dim $iReturn = FileWrite($f, $sBody)
FileClose($f)
Return $iReturn
EndFunc

Func _FileWriteUtf8n($sFile, $sBody)
Dim $iWriteMode = 2 + 256
FileDelete($sFile)
Dim $f = FileOpen($sFile, $iWriteMode)
Dim $iReturn = FileWrite($f, $sBody)
FileClose($f)
Return $iReturn
EndFunc

Func _FileWriteUtf8b($sFile, $sBody)
Dim $iWriteMode = 2 + 128
FileDelete($sFile)
Dim $f = FileOpen($sFile, $iWriteMode)
Dim $iReturn = FileWrite($f, $sBody)
FileClose($f)
Return $iReturn
EndFunc

Func _ConsoleExit($sText)
ConsoleWrite($sText)
Exit
EndFunc

; Main program
$oEncodings = _CreateEncodings()
If not $CmdLine[0] Then _ConsoleExit("Syntax:" & @CrLf & "utf8n FilePath")

$sFile = $CmdLine[1]
; $sFile = "test.txt"

; 0 = read
; 1 = append
; 2  = Write mode (erase previous contents)
; 32 = Use Unicode UTF16 Little Endian reading and writing mode. Reading does not override existing BOM.
; 64 = Use Unicode UTF16 Big Endian reading and writing mode. Reading does not override existing BOM.
; 128 = Use Unicode UTF8 (with BOM) reading and writing mode. Reading does not override existing BOM.
; 256 = Use Unicode UTF8 (without BOM) reading and writing mode.
; 16384 = When opening for reading and no BOM is present, use full file UTF8 detection. If this is not used then only the initial part of the file is checked for UTF8.

$iEncoding = FileGetEncoding($sFile)
$sEncoding = $oEncodings($iEncoding)
; MsgBox(0, $sEncoding, $iEncoding)
; If $sEncoding = "error" Then
If $iEncoding = -1 Then
_ConsoleExit("Cannot detect encoding")
ElseIf $sEncoding = "utf8n" Then
_ConsoleExit("Already utf8n encoding")
EndIf

$sBody = _FileRead($sFile)
FileDelete($sFile)
_FileWriteUtf8n($sFile, $sBody)

ConsoleWrite("Done")
