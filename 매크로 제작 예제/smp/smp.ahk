
Gui, Add, Button, x22 y50 w80 h30 , �� ģ�е�
Gui, Add, Button, x22 y90 w80 h30 , ä��
Gui, Add, Button, x22 y130 w80 h30 , ���� Ŭ��(F11)
Gui, Add, Button, x112 y130 w80 h30 , Ŭ�� ����(F12)
Gui, Add, Text, x22 y170 w170 h40 +Center, ������ ��α� www.susukkss.com
Gui, Add, Button, x112 y90 w80 h30 , ä�� ����
Gui, Add, Button, x112 y50 w80 h30 , �� ����
Gui, Add, Text, x22 y20 w170 h40 +Center, GOOD LUCK!
; Generated using SmartGUI Creator 4.0
Gui, Show, x1126 y355 h214 w220, 
msgbox, start...!
msgbox, ������ī��:su0507
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
Button����Ŭ��(F11):
SoundBeep
goto, autoclick
return
;###################################################
buttonŬ������(F12):
SoundBeep
Reload
return
;###################################################
Button��ģ�е�:
SoundBeep
goto, petchat
return
;###################################################
button������:
SoundBeep
Reload
return
;###################################################
buttonä��:
SoundBeep
loop
{
send, {space}
sleep, 3000
}
;###################################################
buttonä������:
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

