#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


title=서비스명단만들기
명단위치=%a_workingdir%\세팅파일\서비스명단db.ini
ifexist, %a_workingdir%\세팅파일\서비스명단db.ini
    iniread, 명단목록, %a_workingdir%\세팅파일\서비스명단db.ini, 명단목록
Gui, Add, ListBox, x2 y10 w130 h200 v리스트박스1 glistbox1, %명단목록%
Gui, Add, GroupBox, x132 y5 w90 h210 , 명단명
Gui, Add, Progress, x2 y230 w220 h20 v진행률 -smooth, 0
Gui, Add, Text, x12 y210 w90 h20, 진행률
Gui, Add, Text, x2 y250 w220 h20 ,  완료되면 아래에 그림이 뜹니다.
gui, add, edit, x132 y20 w90 h20 v입력값,
Gui, Add, Button, x132 y45 w90 h50 gbutton1, 명단 검사,저장
Gui, Add, Button, x132 y100 w90 h50 gbutton2, 명단삭제
Gui, Add, Button, x132 y155 w90 h50 gbutton3, 도움말
Gui, Add, Picture, x2 y270 w220 h230 v그림,

; Generated using SmartGUI Creator 4.0
Gui, Show, x470 y115 h499 w227, % title
Return
;----------------------------------------------------------------------------

listbox1:
;더블클릭시 이벤트발생
	return
button1:
    Guicontrol,, 그림, 
    guicontrol,, 진행률, 0
    ifexist, %명단위치%                              ;
        iniread, 명단목록, %명단위치%, 명단목록       ;중요한두줄이당
    gui, submit, nohide
    if(입력값="") ;입력칸이 빈칸이면
        msgbox 명단명을 적으세요.
    else
    {
        loop, parse, 명단목록, |							 ;명단에 같은이름 있나없나 체크하고 명단에 있으면 msgbox 없으면 컨티뉴
        {
            if(a_loopfield=입력값)
            {
                msgbox, 목록에 %입력값%이(가) 이미 있습니다.
                return
            }
            else
                continue
        }
		;여기서부터 section 세개만들어줘야됨(명단목록, html,  그리고 없는것들명단)
		sort(clipboard,입력값,명단위치) ;실패명단저장 성공한거html로 저장하기
        IfNotEqual, 카운트, 0
        {
            iniread,x, %명단위치%, 명단목록        ;gui변수 바꿔주기 일단 그 목록값 x에 읽어내서 첨인지 아닌지 알아내야함(목록 gui 다시 만들기)
            if(x="")
            {
                iniwrite, %입력값%, %명단위치%, 명단목록
                Y:=입력값
            }
            else
            {
                Y=%x%|%입력값%
                inidelete, %명단위치%, 명단목록
                iniwrite, %Y%, %명단위치%, 명단목록
            }
            guicontrol,,리스트박스1,|%Y%          ;gui 계산한대로 바꿔주기     새로넣어줄땐 이렇게 |넣고 하는거더라
        }
    }
    guicontrol,,입력값,
    return

button2:
	controlget, getITEM, choice,, listbox1, % title ;클릭되어있는거 얻어옴
    sendmessage,0x188,,,listbox1, % title           ;선택한 것의 번호
    LB_GETCURSEL := errorlevel+1                    
    sendmessage,0x182,LB_GETCURSEL-1,,listbox1, % title ;리스트에서 선택한거 없앰
    controlget, 나열, list,, listbox1, % title   ;다시 리스트에 있는걸 얻어옴
    A=  ;여러개 연속으로 삭제할때 마지막꺼 삭제할떄 나열이라는 변수에 아무것도없어서 loop 안돌고 전에쓰던 A를 이용해버림..그래서문제생기니까 해주는거
    if (getITEM="")
        msgbox 목록에서 삭제할 것을 지정해주세요
    else
    {
        loop, parse, 나열, `r`n, `r`n ;  일단 그 남은것들을 꺼내서 `n로 나눠봄
        {
            if(a_index=1)
            {
                A=%a_loopfield%
            }
            else
            {
                A=%A%|%a_loopfield%
            }
        }
        inidelete, %명단위치%, 명단목록
        iniwrite, %A%, %명단위치%, 명단목록
        inidelete, %명단위치%, %getITEM% ;해당section지우기
    }
    return
    
button3:
    msgbox, 최병근作
    return

;---------------fuction------------------------------------------------------------------------------------------------------------
/*몇십줄짜리 이름생년 리스트를loop,parse로 나눈 뒤 한개한개씩 [8000명 명단이 있는 inifile]과 비교하여 써내린다
특히 이 8000명명단은 이름생년=관리등급 이런식으로 만들어놔야된다 이걸만드려면 어케해야할지!!=>명단 excel 바탕화면으로 받아와서 열고 8000명 모두 엑셀오브젝트로 될까?or 그냥 할까..?
어쨋든 큰 명단은 그냥 내가 엑셀이용해서 임시로 만든다고 치고  이건 어케만들까
*/
sort(a,c,명단위치) 
{   
    ifexist, %a_workingdir%\실패명단.ini
        inidelete, 실패명단.ini, 실패명단
    count=0
    
    fileappend, %a%, 임시파일.txt
    failcount:=0
    count:=0
    nothing:=0
    loop, read, %a_workingdir%\임시파일.txt
    {
        lines++
    }
    
    
    loop, parse, a, `r, `n
    {
        iniread, b, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단, %a_loopfield%
        iniread, 전체, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단
        if(b="ERROR")   ;값이 존재하나 틀린 경우
        {
            iniwrite, %a_loopfield%, 실패명단.ini, 실패명단
            failcount++
            percentage:=(count+failcount+nothing)/lines*100
            guicontrol,, 진행률, %percentage%
        }
        else if(b=전체)   ;아무것도 없는값을 넣을경우
        {
            nothing++
            percentage:=(count+failcount+nothing)/lines*100
            guicontrol,, 진행률, %percentage%
            continue
        }
        else            ;값이 존재하고 맞은 경우
        {
            http뽑기=% http뽑기 "&senior.senior_id=" b
            count++
            percentage:=(count+failcount+nothing)/lines*100
            guicontrol,, 진행률, %percentage%
        }
    }
    IfNotEqual, count, 0
        iniwrite, %http뽑기%, %명단위치%, %c%
    msgbox, %count%명 만큼 명단 저장했습니다.(실패:%failcount%명)
    global 카운트
    카운트:=count
    filedelete, %a_workingdir%\임시파일.txt
    if (percentage:=100)
        Guicontrol,, 그림,*w220 *h230 %a_workingdir%\세팅파일\빠박.jpg
}


/*  깨달은점
1) iniread하고 loopparse할떄  iniread한게 세가지로 나올수있다는걸 알았다. 이것떄문에 상당히 애먹음
2) loop, read와 a_loopreadline으로 라인 trim 해서 읽어오는걸 배웠따 loop,read하면 라인 수대로만 루프를 돈다. 
*/
GuiClose:
ExitApp