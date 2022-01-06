#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Opt("MouseClickDelay", 0) ;10 milliseconds
#include <MsgBoxConstants.au3>

HotKeySet("{END}","quit")
HotKeySet("{HOME}","home")
HotKeySet("{INS}","go")


Local $hWnd = WinActivate("Roblox")
Local $sControl = ControlGetFocus($hWnd)
$home = False
$pause = False
$status = False
$go = False
$down = True
$timer = 0
$s = 0

ToolTip($hWnd,0,0)
Sleep(2000)

Func quit()
	Exit
EndFunc

Func home()
$status = $pause
if($pause) Then
$pause = False
Else
$pause = True
EndIf
EndFunc

Func go()
if($go) Then
$go = False
Else
$go = True
EndIf
EndFunc

Func tic()
$timer= $timer +1
if $timer >= 100 Then
$s = $s + 1
$timer=0
EndIf
return $s & " | " & $status
EndFunc

While 1
ToolTip(tic(),0,0)
if($pause) Then
	if($down) Then
		MouseUp("left")
		$down = False
	Else
	EndIf
Else
	if($go) Then
		send("{w}")
	EndIf

	$down = True
	MouseDown("left")
EndIf

WEnd