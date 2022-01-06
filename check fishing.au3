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

Func quit()
	Exit
EndFunc
While 1
ToolTip(PixelGetColor(460, 434),0,0)
ClipPut(PixelGetColor(460, 434))
if( PixelGetColor(460, 434) == 16609368) Then
EndIf
WEnd