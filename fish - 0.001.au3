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
;PixelSearch(473, 500,526,500,)
ToolTip(PixelGetColor(475, 510),0,0)
ClipPut(PixelGetColor(475, 510))
if( PixelGetColor(475, 510) == 6291293) Then
	MouseClick("Left",475, 500)
EndIf
if( PixelGetColor(480, 510) == 6291293) Then
	MouseClick("Left",480, 500)
MouseMove(525,525)
EndIf
if( PixelGetColor(485, 510) == 6291293) Then
	MouseClick("Left",485, 500)
MouseMove(525,525)
EndIf
if( PixelGetColor(490, 510) == 6291293) Then
	MouseClick("Left",490, 500)
MouseMove(525,525)
EndIf
if( PixelGetColor(495, 510) == 6291293) Then
	MouseClick("Left",495, 500)
MouseMove(525,525)
EndIf
if( PixelGetColor(500, 510) == 6291293) Then
	MouseClick("Left",500, 500)
MouseMove(525,525)
EndIf
WEnd