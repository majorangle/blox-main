#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Opt("MouseClickDelay", 0) ;10 milliseconds
#include <MsgBoxConstants.au3>

WinMove("Roblox","",0,0)
HotKeySet("{END}","quit")
HotKeySet("{HOME}","go")

Local $hWnd = WinActivate("Roblox")
Local $sControl = ControlGetFocus($hWnd)

ToolTip($hWnd,0,0)
Sleep(2000)

Func quit()
	Exit
EndFunc

Func go()
ControlSend("", "", "[CLASS:WINDOWSCLIENT;]", "{/}")
;~ 	 ControlFocus($hWnd, "", "")
;~ 	ControlClick($hWnd, "", "","left",1,400, 275)
;~ 	;ControlSend($hWnd, "", "", "{/}")

EndFunc

While 1
ToolTip(PixelGetColor(460, 434),0,0)
ClipPut(PixelGetColor(460, 434))
if( PixelGetColor(460, 434) == 16609368) Then
EndIf
WEnd