
Gui, Add, Button, x22 y50 w80 h30 , 펫 친밀도
Gui, Add, Button, x22 y90 w80 h30 , 채집
Gui, Add, Button, x22 y130 w80 h30 , 오토 클릭(F11)
Gui, Add, Button, x112 y130 w80 h30 , 클릭 정지(F12)
Gui, Add, Text, x22 y170 w170 h40 +Center, 개발자 블로그 www.susukkss.com
Gui, Add, Button, x112 y90 w80 h30 , 채집 정지
Gui, Add, Button, x112 y50 w80 h30 , 펫 정지
Gui, Add, Text, x22 y20 w170 h40 +Center, GOOD LUCK!
; Generated using SmartGUI Creator 4.0
Gui, Show, x1126 y355 h214 w220, 
msgbox, start...!
msgbox, 개발자카톡:su0507
run, www.susukkss.com
return
;##################################################
;##################################################
;##################################################
;##################################################




petchat:
SoundBeep
msgbox, start...!
WinActivate, MapleStory
Loop
{
send, {enter}
sleep, 500
send, tkfkdgo
sleep, 1000
send, {enter}
sleep, 500
send, EoWl
sleep, 1000
}
return
;###################################################
clickstop:
SoundBeep
Reload
return
;###################################################
autoclick:
SoundBeep
Loop
{
	send, {Click}
}
return
;###################################################
collect:
SoundBeep
msgbox, start...!
WinActivate, MapleStory
loop
{
send, {space}
sleep, 3000
}
;###################################################




;###################################################
;###################################################
;###################################################
;###################################################



;###################################################
Button오토클릭(F11):
SoundBeep
goto, autoclick
return
;###################################################
button클릭정지(F12):
SoundBeep
Reload
return
;###################################################
Button펫친밀도:
SoundBeep
goto, petchat
return
;###################################################
button펫정지:
SoundBeep
Reload
return
;###################################################
button채집:
SoundBeep
loop
{
send, {space}
sleep, 3000
}
;###################################################
button채집정지:
SoundBeep
Reload
return
;###################################################





;###################################################
;###################################################
;###################################################
;###################################################
F11::
SoundBeep
goto, autoclick
return
F12::
SoundBeep
Reload
return
GuiClose:
ExitApp

