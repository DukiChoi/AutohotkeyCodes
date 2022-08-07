~f1::
while getkeystate("F1")
{
coordmode, mouse, Screen
MouseGetPos, wpos, xpos
coordmode, mouse, window
MouseGetPos, ypos, zpos
ToolTip,ScX:%wpos%  ScY:%xpos%`nreX:%ypos%  reY:%zpos%
sleep,100
}
return


~f2::
while getkeystate("F2")
{
MouseGetPos, xpos, ypos
pixelgetcolor, vcolor, %xpos%, %ypos%
tooltip, %vcolor%
sleep,100
}
return


~f3::
while getkeystate("F3")
{
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
ToolTip, ahk_id:%id%`nahk_class:%class%`n title:%title%`nControl:%control%
sleep,100
}
return


~f5::  ;액티브창의 컨트롤리스트 얻기 (클립보드에 저장됨)
tooltip,
while getkeystate("F5")
{
WinGet, ActiveControlList, ControlList, A
SLEEP, 1000
Loop, Parse, ActiveControlList, `n
{
   AC=%AC%`n%a_index%[%A_LoopField%]
}
tooltip, 액티브 창의 ClassNN(컨트롤)목록`n%AC%
clipboard=액티브 창의 ClassNN(컨트롤)목록`n%AC%
}
AC:=
return


~f6:: ;모든 창들의 title:id 값들 얻기
tooltip,
while getkeystate("F6")
{
winget, list, list,
winget, count, count,
msgbox,찾은 ID 값은 %count% 개 입니다
loop, %count%
{
   ID=% list%a_index%
   wingettitle, title, ahk_id %ID%
   IDs:= IDs "`n" title ":" ID
}
tooltip, Title:id `n %IDs%
}
IDs:=
return

Esc::
tooltip,
return
