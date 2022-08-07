#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





F1:: ;직접얻은 id로 시도하기 
winget, list, list,
winget, count, count,
loop, %count%
{
   ID=% list%a_index%
   wingettitle, title, ahk_id %ID%
   if (title="MapleStory")
   {
      msgbox, 찾았다 id는 %ID%
      msgbox, id는 역시나 %ID%
      break
   }
   else
      ID:=
}
msgbox, 이거 타이틀로 될라나
sleep,1000
postmessage, 0x100,0x11,0x2A0001,, 이건 타이틀로
msgbox, 이건 ID로도 될라나
sleep,1000
postmessage, 0x100,0x11,0x2A0001,, ahk_id %ID%
return

F2::
msgbox, id는 역시나 %ID%
winsettitle, ahk_id %ID%, , 이번엔 아이디로
winget, PID, pid, ahk_id %ID%
msgbox, pid는 %PID%입니다
msgbox, 첫번째 시도(pid로)
sleep,1000
postmessage, 0x100,0x11,0x2A0001,, ahk_pid %PID%
msgbox, 두번째 시도(id로)
sleep,1000
postmessage, 0x100,0x11,0x2A0001,, ahk_id %ID%
return


F4::
WinGetTitle, title, A
winget, id,, %title%
iniwrite, %title%, %a_scriptdir%\text.ini, TITLE
iniwrite, %id%, %a_scriptdir%\text.ini, ID
return

F5::
winsettitle, 새 텍스트 문서 (4).txt - 메모장, , 윈도우
sleep, 1000
ID := WinExist("윈도우")
PostMessage_한글전송("안녕하세요","윈도우의 가호","")
return

F6::
postmessage, 0x102, 83, 2031617, edit1, 새 텍스트 문서 (4).txt - 메모장
PostMessage_한글전송("안녕하세요","새 텍스트 문서 (4).txt - 메모장","")

return




;---------------함수----------------

PostMessageh(string,title,control)
{
count:=StrLen(string)/2
loop,%count%
{
pos1:=A_Index*2-1
pos2:=A_Index*2
StringMid,chr1,string,%pos1%,1
StringMid,chr2,string,%pos2%,1
asc1:=Asc(chr1)
asc2:=Asc(chr2)
PostMessage,0x100,%asc1%,0x00000001,%control%,%title%
PostMessage,0x100,%asc2%,0x00000001,%control%,%title%
}
}
;[Reference] : 디케, 「PostMessage로 한글 사용하기」 http://urin79.com/?mid=blog&document_srl=541716.

PostMessage_한글전송(입력,타이틀,컨트롤) 
{ 
SetFormat, IntegerFast, hex 
Loop { 
StringLeft,아스키,입력,1 
StringTrimLeft, 입력, 입력, 1 
if 아스키= 
break 
PostMessage,0x102,% ASC(아스키),0x00000001,% 컨트롤,% 타이틀 
} 
SetFormat, IntegerFast, d 
}
