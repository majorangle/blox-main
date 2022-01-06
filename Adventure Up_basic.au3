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
$wait = 0

ToolTip($hWnd,0,0)
Sleep(2000)

Func quit()
	Exit
EndFunc

Func home()
$status = $pause
if($pause) Then
$pause = False
left()
Else
$pause = True
Send("{a UP}")
Send("{d UP}")
EndIf
EndFunc

Func left()
if($left) Then
$left = False
Send("{a UP}")
Send("{d DOWN}")
Else
$left = True
Send("{d UP}")
Send("{a DOWN}")
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



Func scan(); 0xFF8786
	Local $fastScan = PixelSearch(700, 300,1100, 660,0xFFFFFF,0,10); top 718, 329,1104, 452
	If Not @error Then
		if(PixelGetColor($fastScan[0]+5,$fastScan[1]) == 0xFFFFFF) Then
		Return True
		Else
			Return False
		EndIf
	else
	Local $fastScan = PixelSearch(700, 300,1100, 660,0xFF0000,0,5)
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

Func oreScan()
	Local $fastScan = PixelSearch(781, 324,1099, 660,0xA96E50,0,10); top 718, 329,1104, 452
	If Not @error Then
		if(PixelGetColor($fastScan[0]+5,$fastScan[1]) == 0xFFFFFF) Then
		MouseMove($fastScan[0],$fastScan[1])
		Return True
		Else
			Return False
		EndIf
	EndIf
EndFunc


func wait()
if($wait < $s) Then

EndIf
EndFunc

While 1
ToolTip(tic(),0,0)
wait()

if($pause) Then
Else
if(scan()) Then
	Send("{F}")
	$wait = $s +1
	$mined = $mined +1
	if($mined == 7) Then
	left()
	Sleep(6000)
	Send("{a UP}")
	Send("{d UP}")
	Sleep(40000)
	ElseIf($mined == 8) Then
	$mined = 0
	left()
	EndIf
	Else

EndIf
EndIf
WEnd