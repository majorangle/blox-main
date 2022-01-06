#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Opt("MouseClickDelay", 0) ;10 milliseconds

WinMove("Roblox","",0,0)
HotKeySet("{END}","quit")
HotKeySet("{home}","home")

$cast = True
$pause = False
Func home()
if($pause) Then
$pause = False
$cast = True
Else
$pause = True
EndIf
EndFunc

Func quit()
	Exit
EndFunc

While 1
if($pause) Then
Else
ToolTip($cast,0,0)
If($cast == True) Then
Local $aCoord = PixelSearch(520, 200, 631, 278, 0x44FCEA,5)
If Not @error Then
    MouseClick("left",$aCoord[0],$aCoord[1],3,0)
	$cast = False
EndIf
Else
if( PixelGetColor(442, 506) == 16609368) Then
Local $aCoord = PixelSearch(470, 500, 550, 501, 0x000000,0,Random(0,10,1))
If Not @error Then
		MouseClick("left")
EndIf
Else
		Sleep(500)
		MouseClick("left",565, 218)
		Sleep(Random(250,5000,1))
		$cast = True
	EndIf

EndIf

if( PixelGetColor(525, 476) == 0xFD9DA5) Then
	send("{f}")
	MouseClick("left",700, 291)
		Sleep(500)
	MouseClick("left",754, 565)
		Sleep(250)
	MouseClick("left",754, 565)
	Sleep(Random(3000,5000,1))
	MouseClick("left",565, 218)
	$cast = True

EndIf
EndIf
Sleep(10)
WEnd