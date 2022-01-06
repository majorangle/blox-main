#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Opt("MouseClickDelay", 0) ;10 milliseconds

WinMove("Roblox","",0,0,816, 638)
HotKeySet("{END}","quit")
HotKeySet("{home}","home")


$cast = True
$pause = False
$timer = 59

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
ToolTip($cast +" :"+ $timer,0,0)
If($cast == True) Then
$timer=$timer+1
if ( $timer > 60 ) Then
	MouseClickDrag("right",400, 175,400, 200,0)
	$timer=0
	MouseClickDrag("right",400, 200,400, 197,50)
	MouseClick("left",400, 275)
EndIf
Local $aCoord = PixelSearch(330, 150, 500, 275, 0x44FCEA,5); bubles
If Not @error Then
    MouseClick("left",$aCoord[0],$aCoord[1],3,0)
	$cast = False
EndIf
Else
if( PixelGetColor(300,470) == 16609368) Then
Local $aCoord = PixelSearch(330, 470, 420, 470, 0x000000,0,Random(0,10,1))
If Not @error Then
		MouseClick("left")
EndIf
Else
		Sleep(500)
		MouseClick("left",400, 275)
		Sleep(Random(250,1000,1))
		$timer=0
		$cast = True
	EndIf

EndIf

if( PixelGetColor(460, 434) == 16620965) Then
	send("{f}")
	MouseClick("left",521, 262)
		Sleep(500)
	MouseClick("left",574, 505)
		Sleep(250)
	MouseClick("left",574, 505)
	Sleep(Random(3000,5000,1))
	MouseClick("left",400, 275)
	$cast = True

EndIf
EndIf
Sleep(100)
WEnd