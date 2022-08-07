#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x22 y129 w110 h20 , 초 동안 이동합니다
Gui, Add, Button, x152 y129 w60 h60 gLEFT, ←
Gui, Add, Button, x292 y129 w60 h60 gRIGHT, →
Gui, Add, Button, x222 y129 w60 h60 gDOWN, ↓
Gui, Add, Button, x222 y59 w60 h60 gUP, ↑
Gui, Add, Slider, x12 y59 w150 h30 v슬라이더 gSLIDER range0-20000 tickinterval100,
Gui, Add, Edit, x22 y99 w100 h20 v에딧 gEDIT left limit6
; Generated using SmartGUI Creator for SciTE

winget, list, list,
winget, count, count,
loop, %count%
{
   ID=% list%a_index%
   wingettitle, title, ahk_id %ID%
   if(title="MapleStory")
		break
   else
		ID:=
}
Gui, Show, w372 h237, 이동 시간 측정기
return



    
GuiClose:
ExitApp

LEFT:
winactivate, ahk_id %ID%
sleep,100
초:=에딧*1000
send,{left down}
sleep, %초%
send,{left up}
return


RIGHT:
winactivate, ahk_id %ID%
sleep,100
초:=에딧*1000
send,{right down}
sleep, %초%
send,{right up}
return

DOWN:
winactivate, ahk_id %ID%
sleep,100
초:=에딧*1000
send,{Down down}
sleep, %초%
send,{down up}
return
											
UP:
winactivate, ahk_id %ID%
sleep,100
초:=에딧*1000
send,{up Down}
sleep, %초%
send,{up up}
return

SLIDER:
winactivate, ahk_id %ID%
sleep,100
gui, submit, NoHide
에딧:=슬라이더/1000
guicontrol,, 에딧, %에딧%
return

EDIT:
gui,submit, Nohide
round(에딧,3)
슬라이더:=에딧*1000
guicontrol,, 슬라이더, %슬라이더%