#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


명단위치=%a_workingdir%\세팅파일\전체명단db.ini
전체명단넣을곳1=%a_workingdir%\서울시서비스(서비스입력)\세팅파일
전체명단넣을곳2=%a_workingdir%\서울시서비스(후원물품입력)\세팅파일
전체명단넣을곳3=%a_workingdir%\현황조사\세팅파일
global 명단위
Gui, Add, ListBox, x12 y29 w120 h440 v리스트박스1 glistbox1, 명단목록
Gui, Add, Button, x142 y29 w140 h100 gbutton1, 서울시시스템에`n 없는 사람 찾기
Gui, Add, GroupBox, x2 y9 w140 h470 , 없는 명단
Gui, Add, Button, x142 y179 w140 h120 gbutton2, 전체명단db 만들기`n`n(서울시시스템 전체명단)
Gui, Add, Progress, x142 y139 w140 h30 v진행률 -smooth, 0
Gui, Add, Picture, x142 y309 w140 h160 v그림, 
; Generated using SmartGUI Creator 4.0
Gui, Show, x701 y255 h492 w293, 서울시 명단
Return



listbox1:
	return

button1:
    guicontrol,, 리스트박스1,|
    Guicontrol,, 그림, 
    guicontrol,, 진행률, 0
    gui, submit, nohide
	sort(clipboard,명단위치)
    return

sort(a,명단위치) 
{   
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
        iniread, b, %명단위치%, %a_loopfield%
        iniread, 전체, %명단위치%, 전체명단
        if(b="ERROR")   ;값이 존재하나 틀린 경우
        {
            guicontrol,,리스트박스1, %a_loopfield%
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
            count++
            percentage:=(count+failcount+nothing)/lines*100
            guicontrol,, 진행률, %percentage%
        }
    }
    msgbox, %count%명은 서울시 전체명단에 있음 (실패:%failcount%명)
    global 카운트
    카운트:=count
    filedelete, %a_workingdir%\임시파일.txt
    if (percentage:=100)
        Guicontrol,, 그림, *w140 *h160 %a_workingdir%\세팅파일\빠박2.jpg
}

button2:

FilePath:="C:\Users\" a_username "\Downloads\대상자_" a_yyyy A_MM a_dd ".xls"
ifexist, %filepath%
    filedelete, %filepath%
wb:=comobjcreate("internetexplorer.application"), wb.visible:=true, wb.navigate("https://seniorcare.eseoul.go.kr/seniors/senior_list.jsp")
While wb.readyState!=4 || wb.document.readyState!="complete" || wb.busy
	Sleep 50
wb.document.frm.action:="/seniors/senior_list.jsp"
wb.document.frm.submit()
While wb.readyState!=4 || wb.document.readyState!="complete" || wb.busy
	Sleep 50
wb.document.excelForm.action:="/seniors/senior_excel.jsp"
wb.document.excelForm.submit()
msgbox, 저장화면이 나오면 확인을 눌러주세요
sleep,1000
send,!s


기호="="

msgbox, 다 저장되었으면 확인을 눌러주세요
xcel:=comobjcreate("Excel.application")
xcel.workbooks.open(FilePath)
xcel.Visible := True
excel:=xcel.worksheets(1)
excel.select
loop    ;여기서 두가지 방법으로 loop를 돌려 보았다(전체 명단이 몇명인지 알아내는 것임)
{   
    이름값:=excel.range("B" a_index*1000).value
    if(이름값="")
    {
        줄수:=1000*(a_index-1)
        break
    }
}

Loop
{
    이름값:=excel.range("B" 줄수).value
    if(이름값="")
    {
        줄수-=100
        break
    }
    else
        줄수+=100
}

Loop
{
    이름값:=excel.range("B" 줄수).value
    if(이름값="")
    {
        줄수-=10
        break
    }
    else
        줄수+=10
}

Loop
{
    이름값:=excel.range("B" 줄수).value
    if(이름값="")
    {
        줄수-=1
        break
    }
    else
        줄수+=1
}


excel.Range("B:B").Select
xcel.Selection.insert(Shift:=1)
excel.range("B2:B" 줄수).numberformat:=general ;셀서식 일반으로 바꿔줌
excel.range("B2").select
excel.range("B2").formula:="=concatenate(C2,G2," 기호 ",A2)"
excel.range("B2").copy ;셀렉 안 하고 그냥 카피해도되는지 실험
excel.range("B2:B" 줄수).select
xcel.activesheet.paste
xcel.selection.copy ;복사하고 바로카피해도 되는지 실험
excel.range("B2:B" 줄수).select
excel.range("B2:B" 줄수).PasteSpecial(-4163) ;함수 걸린 것 없애줌
excel.range("B2:B" 줄수).select
xcel.selection.copy

fileappend,, %명단위치%
iniwrite, %clipboard%, %명단위치%, 전체명단

;지우기
ifexist, %전체명단넣을곳1%\전체명단db.ini
    filedelete, %전체명단넣을곳1%\전체명단db.ini
ifexist, %전체명단넣을곳2%\전체명단db.ini
    filedelete, %전체명단넣을곳2%\전체명단db.ini
ifexist, %전체명단넣을곳3%\전체명단db.ini
    filedelete, %전체명단넣을곳3%\전체명단db.ini

;명단 만든거 각각의 폴더에 붙여넣기
filecopy, %명단위치%, %전체명단넣을곳1%
filecopy, %명단위치%, %전체명단넣을곳2%
filecopy, %명단위치%, %전체명단넣을곳3%

excel.range("B2:B" 줄수).delete
xcel.ActiveWorkbook.Save
xcel.Activeworkbook.Close
xcel.quit
msgbox,db저장완료
Guicontrol,, 그림, *w140 *h160 %a_workingdir%\세팅파일\빠박2.jpg
return
;마지막으로는 전체명단.ini를 확인할 수 있으면 빠박2 사진 나오게끔 한다

GuiClose:
ExitApp