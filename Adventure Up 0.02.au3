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

Local $hWnd = WinActivate("Roblox")
Local $sControl = ControlGetFocus($hWnd)
$home = False
$pause = True
$status = null
$down = True
$timer = 0
$s = 0
$left = False
$mined = 0

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

Func left()
if($left) Then
$left = False
Else
$left = True
EndIf
EndFunc


Func go()
EndFunc

Func tic()
$timer= $timer +1
if ($timer > 99) Then
$s = $s + 1
$timer=0
EndIf
if($pause) Then
	$status = "pause"
Else
if($left) Then
	$status = "left"
Else
	$status = "right"
EndIf
EndIf

return $s & "." &$timer& " | " &  $status
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


Func scan(); 0xFF8786
	Local $fastScan = PixelSearch(650, 260,1130, 750,0xFFFFFF,0,25); top 718, 329,1104, 452
	If Not @error Then
		if(PixelGetColor($fastScan[0]+5,$fastScan[1]) == 0xFFFFFF) Then
		Return True
		Else
			Return False
		EndIf
	else
	Local $fastScan = PixelSearch(650, 260,1130, 750,0xFF0000,0,5)
		If Not @error Then
			if(PixelGetColor($fastScan[0]-1,$fastScan[1]) == 0xFF0000) Then
			MouseClick("Left",$fastScan[0],$fastScan[1])
			Return True
			Else
			Return False
			EndIf
		Else
			Return False
		EndIf
	EndIf
EndFunc

While 1
ToolTip(tic(),0,0)

if($pause) Then
Else
if(scan()) Then
	Send("{F}")
	Sleep(3000)
	$s = $s +3
	$mined = $mined +1
Else
Send("{UP DOWN}")
$mPost =  MouseGetPos()
MouseClickDrag("Right",$mPost[0],$mPost[1],$mPost[0]+3,$mPost[1]+1,0)
EndIf
EndIf
WEnd