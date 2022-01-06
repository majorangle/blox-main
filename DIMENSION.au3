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
HotKeySet("{1}","strength")
HotKeySet("{2}","durability")
HotKeySet("{3}","chakra")
HotKeySet("{4}","sword")

Local $hWnd = WinActivate("Roblox")
Local $sControl = ControlGetFocus($hWnd)
$home = False
$pause = False
$status = null
$down = True
$timer = 0
$s = 0

ToolTip($hWnd,0,0)
Sleep(2000)

Func strength()
	$status = "strength"
	$mPos = MouseGetPos()
	MouseClick("Left",693, 950)
	MouseMove($mPos[0],$mPos[1])
EndFunc
Func durability()
	$status = "durability"
	$mPos = MouseGetPos()
	MouseClick("Left",870, 950)
	MouseMove($mPos[0],$mPos[1])
EndFunc
Func chakra()
	$status = "chakra"
	$mPos = MouseGetPos()
	MouseClick("Left",1050, 950)
	MouseMove($mPos[0],$mPos[1])
EndFunc
Func sword()
	$status = "sword"
	$mPos = MouseGetPos()
	MouseClick("Left",1225, 950)
	MouseMove($mPos[0],$mPos[1])
EndFunc

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
EndFunc

Func tic()
$timer= $timer +1
if $timer >= 100 Then
$s = $s + 1
$timer=0
EndIf
return $s & " | " & $status
EndFunc

Func click($click = True)
if($click == 1) Then
	MouseClick("left")
ElseIf($click == 2) Then
if($pause) Then
	if($down) Then
		MouseUp("left")
		$down = False
	Else
	EndIf
Else
	$down = True
	MouseDown("left")
EndIf
Else
EndIf
EndFunc

While 1
ToolTip(tic(),0,0)
Switch $status
	Case "strength"
		click(1)
    Case "durability"
		click(1)
    Case "chakra"
		click(0)
    Case "sword"
		click(1)
    Case Else
		click(3)
EndSwitch
WEnd