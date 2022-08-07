
^1::
;먼저 메이플 id값 가져오고 자리 0,0 으로 옮김
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
;옮기기
WinGetPos, Xpos, Ypos, X_size, Y_size, ahk_id %ID%
WinMove, ahk_id %ID%,,0,0
return


/*
가운데 누르고 esc 여러번 누르고 가운데 또 누르기
i눌러서 아이템 창 올리기
넓히기 클릭하고 그위에 붙잡고 템창 자리 잡기
*/
esc::
Pause
return

^2::
winactivate, ahk_id %ID%
postmessage, 0x100, 0x49, 0x170001, control, ahk_id %ID%