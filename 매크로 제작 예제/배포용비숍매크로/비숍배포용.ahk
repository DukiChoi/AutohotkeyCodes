; <COMPILER: v1.1.22.04>
Gui, Add, Button, x22 y10 w120 h20 , 비숍매크로 시작(F5)
Gui, Add, Button, x22 y40 w120 h20 , 비숍매크로 종료(F6)
Gui, Show, x771 y200 h107 w169,
run, www.susukkss.com
msgbox, welcome!
return
num1:
SoundBeep
msgbox, start on...(ok)
WinActivate,MapleStory
Loop
{
send, {F1}
sleep, 4500
loop 4
{
send, {delete}
sleep, 500
loop 4
{
Loop 8
{
send, {right down}
sleep, 300
send, a
Sleep, 500
send, {right up}
sleep, 100
send, c
sleep, 600
}
Loop 8
{
send, {Left down}
sleep, 300
send, a
Sleep, 500
send, {Left up}
sleep, 100
send, c
sleep, 600
}
}
}
}
return
num2:
SoundBeep
msgbox, exit...
ExitApp
return
num3:
msgbox, 환영합니다!
run,www.susukkss.com
return
button비숍매크로시작(F5):
goto, num1
return
button비숍매크로종료(F6):
goto, num2
return
guiclose:
exitapp