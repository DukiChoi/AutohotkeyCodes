#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

title=후원물품 입력 프로그램
ifexist, 임시파일.ini
	FileDelete, 임시파일.ini
Gui, Add, Edit, x22 y9 w250 h20 v파일명, 
Gui, Add, Button, x282 y9 w80 h20 gFINDEXCEL, 엑셀 찾기
Gui, Add, ListBox, x22 y59 w250 h220 v목록 gLISTBOX, 시트목록
Gui, Add, GroupBox, x12 y39 w270 h250 v시트이름, 시트 이름을 더블 클릭 하세요
Gui, Add, Button, x282 y59 w90 h60 gNEWROW, 신규 어르신`n '행' 삽입
Gui, Add, Button, x282 y129 w90 h60 gNEWCOLUMN, 후원물품`n'열' 삽입
Gui, Add, Button, x282 y199 w90 h70 gCONCATENATE, 이름생년줄 만들기
Gui, Add, Text, x17 y299 w120 h20 , 기존시트 마지막 행:
Gui, Add, Edit, x132 y295 w35 h20 v끝행, 
Gui, Add, Text, x17 y329 w120 h20 , 기존시트 마지막 열:
Gui, Add, Edit, x132 y325 w35 h20 v끝열, 
gui, add, text, x182 y299, 후원물품 개수:
gui, add, Edit, x222 y325 w35 h20 v후원물품수, 
Gui, Add, Picture, x282 y279 w90 h80 , %a_scriptdir%\settings\untitled.png
Gui, Show, x697 y250 h364 w386, % title
Return

FINDEXCEL:
FileSelectFile, FileName 
GuiControl,,파일명,%FileName% 
;------------------------------------------
gui, submit, nohide
FilePath=%파일명%
xcel := ComObjGet(FilePath)
sheetCount := xcel.Sheets.Count, allsheetname := "", sheetName := "" 
Loop, %sheetCount% 
{ 
	sheetName := xcel.Sheets(A_Index).Name
	If A_Index > %sheetCount% 
	Break 
	allsheetName.=sheetName "|"
}
StringTrimright, allsheetname,allsheetname,1
guicontrol,,목록,|%allsheetname%
return


LISTBOX:
ifEqual, a_guievent, doubleclick
{
	controlget, 입력시트, choice,, listbox1, % title ;리스트박스1에서 고른걸 가져온다
	guicontrol,,시트이름,시트이름: %입력시트%
}
return


NEWROW:
gui, submit, nohide
if(끝행="" or 끝열="")
	msgbox, 끝행`,끝열 입력하세요
if(후원물품수="")
	msgbox, 후원물품 개수 적으세요
else
{
	FilePath=%파일명%
	xcel:=comobjcreate("Excel.application")
	xcel.workbooks.open(FilePath)
	xcel.Visible := True
	excel:=xcel.worksheets(1)
	excel.select
	함수넣을범위:="A7:A" 끝행
	기호= "="
	excel.range("A7").formula:= "=concatenate(B7,D7," 기호 ",row(B7))"
	excel.range("A7").copy
	excel.range(함수넣을범위).select
	xcel.activesheet.paste
	excel.range(함수넣을범위).select
	xcel.selection.copy
	excel.range(함수넣을범위).select
	excel.range(함수넣을범위).PasteSpecial(-4163)
	excel.range(함수넣을범위).Select	;첫번째열(이름생년묶여있는)선택
	xcel.selection.copy
	
	;전체명단ini파일만들기
	fileappend,,임시파일.ini
	iniwrite, %clipboard%, 임시파일.ini, 임시파일
	
	열값:=1
	Loop, %후원물품수%
	{
		Loop
		{
			이름:=xcel.worksheets(입력시트).range(columns(열값) a_index+1).value
			생년:=xcel.worksheets(입력시트).range(columns(열값+1) a_index+1).value
			생년:=floor(생년)
			이름생년:=이름 생년
			
			rpt:=sort(이름생년)	;이름생년으로 신규인지확인하는것
			
			if(rpt=0)
			{
				break
			}
			
			else if(rpt=1)
			{
				끝행++
				excel.range("B" 끝행).value:=이름	;이름넣기
				excel.range("D" 끝행).value:=생년	;생년넣기
				iniwrite, %끝행%, 임시파일.ini, 임시파일, %이름생년% ;이런식으로 현재 열에 넣어주는 사람을 계속 임시파일ini에 갱신해줘야 중복이름 방지가능
			}
			
			else if(rpt=2)
			{
				continue
			}
		}
		열값:=열값+3
	}
	msgbox, 완료
	ifexist, %a_workingdir%\임시파일.txt
		filedelete, %a_workingdir%\임시파일.txt
	excel.range("A7").formula:="=row(B7)-6"
	excel.range("A7").copy
	
	guicontrol,,끝행, %끝행%
	
	함수넣을범위:="A7:A" 끝행
	excel.range(함수넣을범위).select
	xcel.activesheet.paste
	xcel.selection.copy
	excel.range(함수넣을범위).PasteSpecial(-4163)
	xcel.ActiveWorkbook.Save
	xcel.Activeworkbook.Close
	xcel.quit
}
return



NEWCOLUMN:
gui, submit, nohide
if(끝행="" or 끝열="")
	msgbox, 끝행`,끝열 입력하세요
if(후원물품수="")
	msgbox, 후원물품 개수 적으세요
else
{
	FilePath=%파일명%
	xcel:=comobjcreate("Excel.application")
	xcel.workbooks.open(FilePath)
	xcel.Visible := True
	excel:=xcel.worksheets(1)
	excel.select
	함수넣을범위:="A7:A" 끝행
	기호= "="
	excel.range("A7").formula:= "=concatenate(B7,D7," 기호 ",row(B7))"	;ini 결과값이 행이 나오게끔 만들어 줌
	excel.range("A7").copy
	excel.range(함수넣을범위).select
	xcel.activesheet.paste
	xcel.selection.copy
	excel.range(함수넣을범위).select
	excel.range(함수넣을범위).PasteSpecial(-4163) ;함수 걸린 것 없애줌
	excel.range(함수넣을범위).Select	;첫번째열(이름생년묶여있는)선택
	xcel.selection.copy
	
	;전체명단ini파일만들기
	a:="[임시파일] `n" clipboard
    fileappend,, 임시파일.ini
	iniwrite, %clipboard%, 임시파일.ini, 임시파일
	excel.range("A7").formula:="=row(B7)-6"
	excel.range("A7").copy
	excel.range(함수넣을범위).select
	xcel.activesheet.paste
	xcel.selection.copy
	excel.range(함수넣을범위).select
	excel.range(함수넣을범위).PasteSpecial(-4163)
	
	;여기까지가 엑셀column이용해서 전체명단ini파일 만들고 다시 순번으로 만드는 작업
	
	열범위:= 끝열 ":" 끝열
	xcel.Visible := True
	xcel.worksheets(1).Range(열범위).Select
	xcel.selection.copy
	xcel.Selection.insert(Shift:=1)
	;끝에 내용 넣어줄 empty column 한개 추가하기
	
	
	
	;이제 후원풀품 입력한 개수대로 
	열값:=1
	loop, %후원물품수%
	{
		xcel.worksheets(입력시트).range(columns(열값) 1).copy
		excel.range(끝열 3).select
		xcel.activesheet.paste
		가격:=xcel.worksheets(입력시트).range(columns(열값+2) 1).value
		excel.range(끝열 4).formula:= "=count(" 끝열 "7:" 끝열 끝행 ")"
		excel.range(끝열 5).formula:= "=sum(" 끝열 "7:" 끝열 끝행 ")"
		Loop
		{
			이름:=xcel.worksheets(입력시트).range(columns(열값) a_index+1).value
			생년:=xcel.worksheets(입력시트).range(columns(열값+2) a_index+1).value
			개수:=xcel.worksheets(입력시트).range(columns(열값+3) a_index+1).value
			생년:=floor(생년)
			이름생년:=이름 생년
			
			rpt:=sort(이름생년)	;이름생년으로 신규인지확인하는것
			
			if(rpt=0) ;넣을 값이 없을 시
			{
				break
			}
			
			else if(rpt=1) ;없을 시
			{
				msgbox, 없는 값이 있습니다. 사람 전부 추가하고 다시 해주세요
				열범위:=끝열 ":" 끝열
				excel.range(열범위).delete
				return
			}
			
			else if(rpt=2) ;있을 시
			{
				iniread, 찾은행, %a_scriptdir%\임시파일.ini, 임시파일, %이름생년%
				excel.range(끝열 찾은행).value:=개수*가격/1000
				continue
			}
		}			
		끝열:=columns(columnsnum(끝열)+1)
		열범위:=끝열 ":" 끝열
		xcel.worksheets(1).Range(열범위).Select
		xcel.Selection.insert(Shift:=1)
		열값:=열값+4	;후원물품 각각 4줄씩
	}
	;끝열:=columns(columnsnum(끝열))  ;음...이거 뺴줘도 되지 않나
	열범위:=끝열 ":" 끝열
	msgbox, 완료
	excel.range(열범위).delete
	ifexist, %a_workingdir%\임시파일.txt
		filedelete, %a_workingdir%\임시파일.txt
	xcel.ActiveWorkbook.Save
	xcel.Activeworkbook.Close
	xcel.quit
	
}
return






CONCATENATE:
gui, submit, nohide
if(후원물품수="")
	msgbox, 후원물품 개수 적으세요
else
{
	FilePath=%파일명%
	xcel:=comobjcreate("Excel.application")
	xcel.workbooks.open(FilePath)
	xcel.Visible := True
	excel:=xcel.worksheets(입력시트)
	excel.select
	
	;이제 후원풀품 입력한 개수대로 
	열값:=1
	loop, %후원물품수%
	{
		기준열값:=(a_index-1)*4
		열범위:=columns(기준열값+2) ":" columns(기준열값+2)
		xcel.worksheets(입력시트).range(열범위).select
		xcel.selection.insert(shift:=1)
		xcel.worksheets(입력시트).range(columns(기준열값+2) 2).formula:= "=concatenate(" columns(기준열값+1) 2 "," columns(기준열값+3) 2 ")"
		xcel.worksheets(입력시트).range(columns(기준열값+2) 2).select
		xcel.selection.copy
		한줄카운트:=1
		Loop
		{
			이름:=xcel.worksheets(입력시트).range(columns(기준열값+1) a_index+2).value
			생년:=xcel.worksheets(입력시트).range(columns(기준열값+3) a_index+2).value
			이름생년:=이름 생년
		    if(이름생년="")
				break
			xcel.worksheets(입력시트).range(columns(기준열값+2) a_index+2).select
			xcel.activesheet.paste
		}
	}
	msgbox, 완료
	xcel.ActiveWorkbook.Save
	xcel.Activeworkbook.Close
	xcel.quit
}

return
;------------------------------------------------------------------------------------------


columns(x) ;숫자넣으면 알파벳나오게끔
{
	뒤 := Object(0,"Z",1,"A",2,"B",3,"C",4,"D",5,"E",6,"F",7,"G",8,"H",9,"I",10,"J",11,"K",12,"L",13,"M",14,"N",15,"O",16,"P",17,"Q",18,"R",19,"S",20,"T",21,"U",22,"V",23,"W",24,"X",25,"Y",26,"Z")
	앞 := object(0,"",1,"A",2,"B",3,"C",4,"D",5,"E",6,"F",7,"G",8,"H",9,"I",10,"J",11,"K",12,"L",13,"M",14,"N",15,"O",16,"P",17,"Q",18,"R",19,"S",20,"T",21,"U",22,"V",23,"W",24,"X",25,"Y",26,"Z")
	a:=뒤[mod(x,26)] ;나머지값
	b:=앞[(x-1)//26]			;해
	c:=b a
	return c
}

columnsnum(x)
{
	숫자 := object("A",1,"B",2,"C",3,"D",4,"E",5,"F",6,"G",7,"H",8,"I",9,"J",10,"K",11,"L",12,"M",13,"N",14,"O",15,"P",16,"Q",17,"R",18,"S",19,"T",20,"U",21,"V",22,"W",23,"X",24,"Y",25,"Z",26)
	stringlen, len, x
	if(len=2)
	{
		StringLeft, 앞, x, 1
		stringright, 뒤, x, 1
		y:=숫자[앞]*26+숫자[뒤]
	}
	else if(len=1)
		y:=숫자[x]
	else
		msgbox, 입력한 열이 이상합니다.
	return y
}


sort(a) 
{   
	iniread, c, %a_scriptdir%\임시파일.ini, 임시파일, %a%
	iniread, 전체, %a_scriptdir%\임시파일.ini, 임시파일
	if(c=전체 or a=0) ;아예 입력값이 없음
		return 0
		
	else if(c="ERROR") ;ini에 없는것
		return 1

	else ;ini에 있음
		return 2
}



신규(x)
{
	gui, submit, nohide
	FilePath=%파일명%
	xcel:=comobjcreate("Excel.application")
	xcel.workbooks.open(FilePath)
	행범위:= 끝행 ":" 끝행
	msgbox,% 입력 "," 행범위
	xcel.Visible := True
	xcel.worksheets(입력).Range(열범위).Select
	xcel.Selection.insert(Shift:=1)
	xcel.ActiveWorkbook.Save
	xcel.Activeworkbook.Close
	xcel.quit
}


F1::
msgbox, 끝 열은 항상 빈 칸으로 비워두고, 후원물품 줄은 세 칸씩, '기령당 경로당'은 셀 B7로 맞춰주세요.
return

GuiClose:
ExitApp

