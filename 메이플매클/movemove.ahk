
^1::
;���� ������ id�� �������� �ڸ� 0,0 ���� �ű�
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
;�ű��
WinGetPos, Xpos, Ypos, X_size, Y_size, ahk_id %ID%
WinMove, ahk_id %ID%,,0,0
return


/*
��� ������ esc ������ ������ ��� �� ������
i������ ������ â �ø���
������ Ŭ���ϰ� ������ ����� ��â �ڸ� ���
*/
esc::
Pause
return

^2::
winactivate, ahk_id %ID%
postmessage, 0x100, 0x49, 0x170001, control, ahk_id %ID%