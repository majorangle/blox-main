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
$pause = False
$status = False
$down = True
$timer = 0
$s = 0

ToolTip($hWnd,0,0)
Sleep(1000)

Func scan(); 0xFF8786
	Local $fastScan = PixelSearch(400, 430,1300, 470,0xFF8886,2,2)
	If Not @error Then
		Local $aCoord = PixelSearch($fastScan[0]-10, $fastScan[1]-10,$fastScan[0]+10, $fastScan[1]+10,0xFF8886,10,1)
		If Not @error Then
		$mLoc = MouseGetPos() ;960, 530
;~ 		MouseMove($aCoord[0],$aCoord[1],0)

		;; Move right left
		if($aCoord[0] > 940) Then
			$status = "left"
		MouseMove(962 , 530,1)
		ElseIf($aCoord[0] < 980) Then
			$status = "right"
		MouseMove(958 , 530,1)
		Else
		EndIf

;~ 		;; Move up down
;~ 		if($aCoord[1] - $mLoc[1] > 0) Then
;~ 		MouseMove($mLoc[0], $mLoc[1]+1)
;~ 		ElseIf($aCoord[1] - $mLoc[1] < 0) Then
;~ 		MouseMove($mLoc[0] , $mLoc[1]-1)
;~ 		Else
;~ 		EndIf
		EndIf
		EndIf
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

While 1
ToolTip(tic(),0,0)
;~ send("{w}")
if($pause) Then
	if($down) Then
		MouseUp("left")
		$down = False
	Else
	EndIf
Else
	$down = True
	MouseDown("left")
;~ 	scan()
EndIf
WEnd