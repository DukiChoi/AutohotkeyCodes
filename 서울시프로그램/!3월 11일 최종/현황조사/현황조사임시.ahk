#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, ListBox, x12 y30 w110 h330 v실행완료 , 
Gui, Add, Edit, x142 y10 w200 h20 v파일명 ReadOnly, 엑셀파일명(경로는 변수로저장)
Gui, Add, Text, x152 y120, 실패명단
Gui, Add, Button, x342 y10 w80 h20 gFINDEXCEL, 엑셀파일찾기
Gui, Add, ListBox, x152 y140 w130 h220 v실패목록,
Gui, Add, GroupBox, x2 y10 w130 h360, 실행완료명단
Gui, Add, Button, x342 y130 w120 h70 gPANBYUL, 판별하기
Gui, Add, Progress, x152 y70 w310 h40 v진행률 -smooth, 0
Gui, Add, Button, x342 y210 w120 h70 gSAVE, 저장
Gui, Add, Button, x342 y290 w120 h70 gSERVICE, 서비스 wants
Gui, Add, GroupBox, x142 y50 w330 h320 , 실행하기
gui, add, text, x288 y120, 구를`n고르세요
gui, add, dropdownlist, x285 y150 w55 h100 v구, 선택||종로구|중구|용산구|성동구|광진구|동대문구|중랑구|성북구|강북구|도봉구|노원구|은평구|서대문구|마포구|양천구|강서구|구로구|금천구|영등포구|동작구|관악구|서초구|강남구|송파구|강동구
;여기서 앞에 선택||종로구 하는거랑 선택|종로구 하는거랑 선택| |종로구 하는거랑  다 결과가 다르다
Gui, Show, x236 y99 h397 w486, 서울시 현황조사 저장 프로그램-도움말은 F1
Return

FINDEXCEL:
FileSelectFile, FileName 
GuiControl,,파일명,%FileName% 
return 

F1::
msgbox, --------------도움말-----------------`n  저장버튼을 누르기전에 엑셀에서 `n 1)전체 형식을 <일반>으로 바꿔주고 `n 2)성별을 F,M으로 썼는지 `n 3) 샘플파일과 각 열의 순서가 동일한지(A열엔 성명 B열엔 생년 등등)`n 4)특히 성명을 기입하는 행의 시작은 6번째 행부터 입니다.(형식 바꾸지 말라는 뜻) `n 5)반드시 이름,생년월일,대상자구분,성별,행정동명,주소,연락처,휴대폰,`n 관리등급이 있는 열은 데이터를 다 채워주세요 안그럼 전송실패함. `n`n  그리고 프로그램이 있는 폴더 내의 진행명단.ini에 실패명단과 `n 마지막으로 사이트에 입력한 사람의 이름이 저장이 됩니다. `n 프로그램을 중간에 멈추고 다시 켤 때마다 확인해주세요.
return

;--------------------------------------------------------------------------------------------------------------


PANBYUL:
gui, submit, nohide
if(파일명="" or 파일명="엑셀파일명(경로는 변수로저장)")
	msgbox, 경로를 입력하세요
else
{
	FilePath=%파일명%
	oWorkbook := ComObjGet(FilePath) ; access Workbook object
	gosub, 판별하기
	msgbox,% "신규 명수:" 신규 "기존 명수:" 기존
}
return


SAVE: ;엑셀에서 꺼내오기
gui, submit, nohide
if(파일명="" or 파일명="엑셀파일명(경로는 변수로저장)")
{
	msgbox, 경로를 입력하세요
	return
}
if(구="선택")
{
	msgbox, 구를 선택하세요
	return
}
else
{
	FilePath=%파일명%
	msgbox, %FilePath%
	oWorkbook := ComObjGet(FilePath) ; access Workbook object
	gosub, 엑셀에서불러오기
}
return

SERVICE:
gui, submit, nohide
if(파일명="" or 파일명="엑셀파일명(경로는 변수로저장)")
{
	msgbox, 경로를 입력하세요
	return
}
if(구="선택")
{
	msgbox, 구를 선택하세요
	return
}
else
{
	FilePath=%파일명%
	msgbox, %FilePath%
	oWorkbook := ComObjGet(FilePath) ; access Workbook object
	gosub, 엑셀에서불러오기2
}
return



;값 비교해서 인터넷에 없는 값만 고르거나 
;값 무조건 고르거나
;return하기
;return한 값들

엑셀에서불러오기:
gosub, 판별하기
모두:=신규+기존
count:=0
msgbox,% 모두 "명 저장합니다" "(신규:" 신규 "명 기존:" 기존 "명)"
loop
{
	b_index := a_index+5
	A := "A" b_index, B := "B" b_index, C := "C" b_index, G := "G" b_index, H := "H" b_index, I := "I" b_index, J := "J" b_index, K := "K" b_index, L := "L" b_index, AS := "AS" b_index
	이름:= oWorkbook.Sheets(1).Range(A).Value	; get value from A1 cell in first sheet
	생년월일:= oWorkbook.workSheets(1).Range(B).Value
	대상자구분:= oWorkbook.workSheets(1).Range(C).Value
	성별:= oWorkbook.workSheets(1).Range(G).Value
	행정동명:= oWorkbook.workSheets(1).Range(H).Value
	주소:= oWorkbook.workSheets(1).Range(I).Value
	새주소:= oWorkbook.workSheets(1).Range(J).Value
	연락처:= oWorkbook.workSheets(1).Range(K).Value
	휴대폰:= oWorkbook.workSheets(1).Range(L).Value
	관리등급:= oWorkbook.workSheets(1).Range(AS).Value
	new구:=구
	대상자구분:=floor(대상자구분)
	관리등급:=floor(관리등급)
	
	if(이름="" or 생년월일="")
		break
	결과:=저장함수(이름,생년월일,대상자구분,성별,행정동명,주소,새주소,연락처,휴대폰,관리등급,new구)
	count++
	percentage:= count/모두*100
	guicontrol,, 진행률,%percentage%
; listview 50명 리미트거는 것
	if(mod(a_index,50)=0)
		guicontrol,, 실행완료, |%이름%%생년월일% %결과%
	else
		guicontrol,, 실행완료, %이름%%생년월일% %결과%
}
return

판별하기:
신규:=0
기존:=0
loop
{
	b_index := a_index+5
	A := "A" b_index, B := "B" b_index
	이름:= oWorkbook.Sheets(1).Range(A).Value	; get value from A1 cell in first sheet
	생년월일:= oWorkbook.workSheets(1).Range(B).Value
	
	if(이름="" or 생년월일="")
		break
	;판별하기
	x:=이름 생년월일
	iniread, managenum, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단, %x%
	if(managenum="error")
		신규++
	else
		기존++
}
return

엑셀에서불러오기2:
gosub, 판별하기
모두:=신규+기존
count:=0
msgbox,% "db에 존재하는 " 기존 "명 저장합니다" "(신규:" 신규 "명 기존:" 기존 "명)"
loop
{
	b_index := a_index+5
	A := "A" b_index, B := "B" b_index, AT := "AT" b_index, AU := "AU" b_index, AV := "AV" b_index, AW := "AW" b_index, AX := "AX" b_index, AY := "AY" b_index, AZ := "AZ" b_index, BA := "BA" b_index, BB := "BB" b_index, BC := "BC" b_index, BD := "BD" b_index, BE:= "BE" b_index, BF := "BF" b_index, BG := "BG" b_index, BH := "BH" b_index, BI := "BI" b_index, BJ := "BJ" b_index, BK := "BK" b_index, BL := "BL" b_index, BM := "BM" b_index, BN := "BN" b_index, BO := "BO" b_index, BP := "BP" b_index
	이름:= oWorkbook.Sheets(1).Range(A).Value	; get value from A1 cell in first sheet
	생년월일:= oWorkbook.workSheets(1).Range(B).Value	
	if(이름="" or 생년월일="")
		break
	서비스1:= floor(oWorkbook.workSheets(1).Range(AT).Value)
	서비스2:= floor(oWorkbook.workSheets(1).Range(AU).Value)
	서비스3:= floor(oWorkbook.workSheets(1).Range(AV).Value)
	서비스4:= floor(oWorkbook.workSheets(1).Range(AW).Value)
	서비스5:= floor(oWorkbook.workSheets(1).Range(AX).Value)
	서비스6:= floor(oWorkbook.workSheets(1).Range(AY).Value)
	서비스7:= floor(oWorkbook.workSheets(1).Range(AZ).Value)
	서비스8:= floor(oWorkbook.workSheets(1).Range(BA).Value)
	서비스9:= floor(oWorkbook.workSheets(1).Range(BB).Value)
	서비스10:= floor(oWorkbook.workSheets(1).Range(BC).Value)
	서비스11:= floor(oWorkbook.workSheets(1).Range(BD).Value)
	서비스12:= floor(oWorkbook.workSheets(1).Range(BE).Value)
	서비스13:= floor(oWorkbook.workSheets(1).Range(BF).Value)
	서비스14:= floor(oWorkbook.workSheets(1).Range(BG).Value)
	서비스15:= floor(oWorkbook.workSheets(1).Range(BH).Value)
	서비스16:= floor(oWorkbook.workSheets(1).Range(BI).Value)
	서비스17:= floor(oWorkbook.workSheets(1).Range(BJ).Value)
	서비스18:= floor(oWorkbook.workSheets(1).Range(BK).Value)
	서비스19:= floor(oWorkbook.workSheets(1).Range(BL).Value)
	서비스20:= floor(oWorkbook.workSheets(1).Range(BM).Value)
	서비스21:= floor(oWorkbook.workSheets(1).Range(BN).Value)	
	서비스22:= floor(oWorkbook.workSheets(1).Range(BO).Value)
	서비스23:= floor(oWorkbook.workSheets(1).Range(BP).Value)
	결과:=서비스저장함수(이름,생년월일,서비스1,서비스2,서비스3,서비스4,서비스5,서비스6,서비스7,서비스8,서비스9,서비스10,서비스11,서비스12,서비스13,서비스14,서비스15,서비스16,서비스17,서비스18,서비스19,서비스20,서비스21,서비스22,서비스23)
	count++
	percentage:= count/모두*100
	guicontrol,, 진행률,%percentage%
	; listview 50명 리미트거는 것
	if(mod(a_index,50)=0)
		guicontrol,, 실행완료, |%이름%%생년월일% %결과%
	else
		guicontrol,, 실행완료, %이름%%생년월일% %결과%
}
return

/* 새로 엑셀 저장하는법 적어놓음(반드시 어플리케이션 quit해야한다)  
F3::

exlTBL := ComObjCreate("Excel.Application")
exlTBL.Workbooks.Add
exlTBL.Range("A1").Value := "Customer"
exlTBL.Cells(1, 2) = "Model"
exlTBL.Cells(1, 3) = "Year-Month"
exlTBL.ActiveWorkbook.SaveAs( A_ScriptDir "\" 4 ".xlsx" )
exlTBL.quit

return
*/

;----------------------------------------함수------------------------------------------------------------

저장함수(a,b,c,d,e,f,g,h,i,j,k)
{
	;전체 몇명해야되는지 count
	x:=a b
	iniread, managenum, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단, %x%
	iniread, 전체, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단
	if(managenum="error")
		결과:=신규넣기(a,b,c,d,e,f,g,h,i,j,k,x)
	else if(managenum=전체)
	{
		;빈칸이 있는경우인데..이건 아예 꺼버리지 말고 따로 "실패명단"에 저장해야한다 
		msgbox, 엑셀파일이 제대로 읽힌건지 확인해주세요
		guicontrol,,실패목록, %x% 빈칸이상
		결과:="실패"
	}
	else
	{
		결과:=기존넣기(a,b,c,d,e,f,g,h,i,j,managenum,x)
	}
	return 결과
}

서비스저장함수(이름,생년월일,서비스1,서비스2,서비스3,서비스4,서비스5,서비스6,서비스7,서비스8,서비스9,서비스10,서비스11,서비스12,서비스13,서비스14,서비스15,서비스16,서비스17,서비스18,서비스19,서비스20,서비스21,서비스22,서비스23)
{
	x:=이름 생년월일
	iniread, managenum, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단, %x%
	iniread, 전체, %a_workingdir%\세팅파일\전체명단db.ini, 전체명단
	
	if(managenum="error")
	{
		guicontrol,,실패목록, %x% DB없음
		결과:="실패"
	}
	else if(managenum=전체)
	{
		;빈칸이 있는경우인데..이건 아예 꺼버리지 말고 따로 "실패명단"에 저장해야한다 
		msgbox, 엑셀파일의 이름,생년란에 빈칸이 있습니다
		guicontrol,,실패목록, %x% 엑셀빈칸
		결과:="실패"
	}
	else
	{
		if(서비스1<>0||서비스2<>0||서비스3<>0||서비스4<>0||서비스5<>0||서비스6<>0||서비스7<>0||서비스8<>0||서비스9<>0||서비스10<>0||서비스11<>0||서비스12<>0||서비스13<>0||서비스14<>0||서비스15<>0||서비스16<>0||서비스17<>0||서비스18<>0||서비스19<>0||서비스20<>0||서비스21<>0||서비스22<>0||서비스23<>0)
		{
			;엑셀속이 빈칸이 아니면 엑셀에서 가져온거 넣기(뭐 하나라도 바뀐게 있어야만 넣는 것이다)
			결과:=서비스넣기(이름,생년월일,서비스1,서비스2,서비스3,서비스4,서비스5,서비스6,서비스7,서비스8,서비스9,서비스10,서비스11,서비스12,서비스13,서비스14,서비스15,서비스16,서비스17,서비스18,서비스19,서비스20,서비스21,서비스22,서비스23,managenum,x)
		}
		else
		{
			결과:="패스"
		}
	}
	return 결과
}



신규넣기(이름x,생년월일x,대상자구분x,성별x,행정동명x,주소x,새주소x,연락처x,휴대폰x,관리등급x,new구,이름생년)
{
	;비교하기 ㅎㅎ
	;여기서 오류 안나려면 대상자구분, 행정동명, 관리등급,성별 값을 넣었을때 전부 setting file에 있어서 무조건 유효한 값이어야함 
	
	iniread, 대상자구분html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 대상자구분, %대상자구분x%
	iniread, 행정동명html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 행정동명, %행정동명x%
	iniread, 관리등급html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 관리등급, %관리등급x%
	iniread, 성별html, %A_workingDir%\세팅파일\현황조사세팅.ini, 성별, %성별x%

	
	if(주소x<>0)
		주소html:=주소x
	if(새주소x<>0)
		새주소html:=새주소x
	if(연락처x<>0)
		연락처html:=연락처x
	if(휴대폰x<>0)
		휴대폰html:=휴대폰x
	
	if(대상자구분html="error" or 행정동명html="error" or 관리등급html="error" or 성별html="error") ;값이 ini에 없는 경우
	{
		guicontrol,,실패목록, %이름생년% 엑셀확인
		return "실패"
	}
	
	internetsend1(이름x,생년월일x,대상자구분html,성별html,행정동명html,주소html,새주소html,연락처html,휴대폰html,관리등급html,new구)
	return "신규"
}


기존넣기(이름x,생년월일x,대상자구분x,성별x,행정동명x,주소x,새주소x,연락처x,휴대폰x,관리등급x,관리번호x,이름생년)
{
	;winhttp랑 관리번호 이용해서 인터넷에 저장된거 불러오기
	gethtml:="https://seniorcare.eseoul.go.kr/seniors/senior_card.jsp?senior_id=" 관리번호x
	winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
	winhttp.open("GET",gethtml)
	winhttp.send()
	winhttp.waitforresponse()
	vgethtml:=winhttp.responsetext
	IfnotInString,vgethtml,/seniors/senior_card.jsp?senior_id=
	{
		guicontrol,, 실패목록, %이름생년% 전송실패
		return "실패"
	}
	str:= RegExReplace(vgethtml, "\R", "")		;매우 중요한 구문이다.. regexreplace로 \R인부분 즉 엔터친 부분을 제거한것
	a= id="senior_name" value="(.*?)"
	b= id="birth_date" value="(.*?)"
	c= class="tb_title">성별.*name="gender" value="(.*?)" checked="checked".*?name="senior_type"
	;여기서는 앞의 .* 뒤에 행을 특정할수 있는 "gender"가 이미 있으므로 따로 뒤에 .*? 더 붙일 필요가없다
	d= name="senior_type".*<option value="(.)" selected="selected".*?name="manage_degree"
	e= name="manage_degree".*<option value="(.)" selected="selected".*?name="manage_degree2"
	f= name="manage_degree2".*<option value="(.)" selected="selected".*?name="manage_degree3"
	g= name="manage_degree3".*<option value="(.)" selected="selected".*?name="senior_gubn"
	h= name="senior_gubn".*<option value="(.)" selected="selected".*?name="service_status"
	i= name="service_status".*<option value="(.)" selected="selected".*?name="urgent_tel_no"
	j= name="urgent_tel_no" value="(.*?)"
	k= name="tel_no" value="(.*?)"
	l= name="hp_no" value="(.*?)"
	m= name="addr" value="(.*?)"
	n= name="gu_code".*<option value="(.*?)" selected="selected".*?name="dong_code"
	o= name="dong_code".*<option value="(.*?)" selected="selected".*?name="addr_new"
	p= name="addr_new" value="(.*?)"
	q= name="health_status".*?>(.*?)</textarea>
	r= name="regist_yn".*<option value="(.*?)" selected="selected".*?name="safe_phone_yn"
	s= class="tb_title">사랑의안심폰.*name="safe_phone_yn" value="(.*?)" checked="checked".*?name="agree_yn"
	t= name="agree_yn" value="(.*?)" checked="checked".*?name="close_reason"
	u= name="remarks1" value="(.*?)" 
	v= name="remarks2" value="(.*?)"
	w= name="remarks3" value="(.*?)"
	
	x= name="close_reason".*<option value="(.*?)" selected="selected".*?name="close_reason_etc"
	y= name="close_reason_etc" value="(.*?)"
	z= name="close_date" value="(.*?)"
	
	aa= name="center_code".*<option value="(.*?)"  selected="selected".*?name="service_code"
	bb= name="service_code".*<option value="(.*?)" selected="selected".*?name="manager_name"
	cc= name="manager_name" readonly="readonly" value="(.*?)"
	dd= name="center_code1".*<option value="(.*?)"  selected="selected".*?name="service_code1"
	ee= name="service_code1".*<option value="(.*?)" selected="selected".*?name="manager_name1"
	ff= name="manager_name1" readonly="readonly" value="(.*?)"
	gg=name="center_code2".*<option value="(.*?)"  selected="selected".*?name="service_code2"
	hh= name="service_code2".*<option value="(.*?)" selected="selected".*?name="manager_name2"
	ii= name="manager_name2" readonly="readonly" value="(.*?)"
	jj=name="center_code3".*<option value="(.*?)"  selected="selected".*?name="service_code3"
	kk= name="service_code3".*<option value="(.*?)" selected="selected".*?name="manager_name3"
	ll= name="manager_name3" readonly="readonly" value="(.*?)"
	
	regexmatch(str, a, 이름)
	regexmatch(str, b, 생년월일)
	regexmatch(str, c, 성별)
	regexmatch(str, d, 대상자구분)
	regexmatch(str, e, 서비스구분a)
	regexmatch(str, f, 서비스구분b)
	regexmatch(str, g, 서비스구분c)
	regexmatch(str, h, 관리등급)
	regexmatch(str, i, 서비스상태)
	regexmatch(str, j, 비상연락처)
	regexmatch(str, k, 연락처)
	regexmatch(str, l, 휴대폰)
	regexmatch(str, m, 주소)
	regexmatch(str, n, 구)
	regexmatch(str, o, 행정동명)
	regexmatch(str, p, 새주소)
	regexmatch(str, q, 건강상태)
	regexmatch(str, r, 주민등록)
	regexmatch(str, s, 안심폰여부)
	regexmatch(str, t, 개인정보활용동의)
	regexmatch(str, u, remarksa)
	regexmatch(str, v, remarksb)
	regexmatch(str, w, remarksc)
	regexmatch(str, x, 종결사유)
	regexmatch(str, y, 종결사유기타)
	regexmatch(str, z, 종결날짜)
	
	regexmatch(str, aa, 관리기관)
	regexmatch(str, bb, 서비스코드)
	regexmatch(str, cc, 담당자)
	regexmatch(str, dd, 관리기관a)
	regexmatch(str, ee, 서비스코드a)
	regexmatch(str, ff, 담당자a)
	regexmatch(str, gg, 관리기관b)
	regexmatch(str, hh, 서비스코드b)
	regexmatch(str, ii, 담당자b)
	regexmatch(str, jj, 관리기관c)
	regexmatch(str, kk, 서비스코드c)
	regexmatch(str, ll, 담당자c)
	
	wants=<td><input type="checkbox" name="(want[\d]{1,})" checked="checked"
	욕구정보html:=
	pos:=1
	
	;전체str에서 조건맞는것 여러개 찾는게 안되서 while 로 string위치를 뒤로 조금씩 가면서 찾는걸로 하나씩 찾는걸 해냈다!
	while pos:=regexmatch(str, wants, 욕구정보, pos)
	{
		a:=strlen(욕구정보)
		pos := pos+strlen(욕구정보)
		욕구정보html := 욕구정보html "=Y&" 욕구정보1
	}
	욕구정보html:=욕구정보html "=Y"
	stringtrimleft, 욕구정보html, 욕구정보html, 2
	
	
	;	참고: 여기서는 이건 못쓰는것(strlen(wants)가 이상하게 나옴 일단 ㅇㅇ 위는 이걸 좀 응용했다

	;	pos:=1
	; 여기서 욕구정보html이 로컬변수라서 딱히 값 없애주지 않아도 될 듯
	;	while pos:=regexmatch(str, wants,욕구정보, pos+StrLen(wants))
	;		욕구정보html := 욕구정보html "=Y&" 욕구정보1
	;	stringtrimleft, 욕구정보html, 욕구정보html, 3
	
	
	;인터넷에서 잘왔나 확인하기위한 메세지박스
	;a=% "a" 이름1 "`nb" 생년월일1 "`nc" 성별1 "`nd" 대상자구분1 "`ne" 서비스구분a1 "`nf" 서비스구분b1 "`ng" 서비스구분c1 "`nh" 관리등급1 "`ni" 서비스상태1 "`nj" 비상연락처1 "`nk" 연락처x "`nl" 휴대폰1 "`nm" 주소1 "`nn" 구1 "`no" 행정동명1 "`np" 새주소1 "`nq" 건강상태1 "`nr" 주민등록1 "`ns" 안심폰여부1 "`nt" 개인정보활용동의1 "`nu" remarksa1 "`nv" remarksb1 "`nw" remarksc1 "`nx"  종결사유1 "`ny,z" 종결사유기타1 종결날짜1 "`n" 관리기관1 서비스코드1 담당자1 "`n" 관리기관a1 서비스코드a1 담당자a1 "`n" 관리기관b1 서비스코드b1 담당자b1 "`n" 관리기관c1 서비스코드c1 담당자c1 "`n욕구정보:" 욕구정보html  "`n를 사이트에서 가져왔음." 
	;stringreplace, a, a, &#41;, ), all
	;stringreplace, a, a, &#40;, (, all
	;msgbox,% a
	
	
	;비교하기 ㅎㅎ
	;여기서 오류 안나려면 대상자구분, 행정동명, 관리등급 값을 넣었을때 전부 setting file에 있어서 유효한 값이어야함 
	iniread, 대상자구분html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 대상자구분, %대상자구분x%
	iniread, 행정동명html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 행정동명, %행정동명x%
	;iniread, 관리등급html, %A_WorkingDir%\세팅파일\현황조사세팅.ini, 관리등급, %관리등급x%
	;관리등급은 기존유지하래서 바꿈
	iniread, 성별html, %A_workingdir%\세팅파일\현황조사세팅.ini, 성별, %성별x%

	
	if(주소x<>0)
		주소html:=주소x
	else
		주소html:=주소1
	if(새주소x<>0)
		새주소html:=새주소x
	else
		새주소html:=새주소1
	if(연락처x<>0)
		연락처html:=연락처x
	else
		연락처html:=연락처1
	if(휴대폰x<>0)
		휴대폰html:=휴대폰x
	else
		휴대폰html:=휴대폰1
	
	
	if(대상자구분html="error" or 행정동명html="error" or 관리등급html="error" or 성별html="error") ;값이 ini에 없는 경우
	{
		guicontrol,,실패목록, %이름생년% 엑셀확인
		return "실패"
	}
	
	
	;그다음 전체 합친거 winhttp로 보냄
	internetsend2(이름1, 생년월일1, 성별1, 대상자구분html, 서비스구분a1, 서비스구분b1, 서비스구분c1, 관리등급1, 서비스상태1, 비상연락처1, 연락처html, 휴대폰html, 주소html, 구1, 행정동명html, 새주소html, 건강상태1, 주민등록1, 안심폰여부1, 개인정보활용동의1, 종결사유1, 종결사유기타1, 종결날짜1, 관리기관1, 서비스코드1, 담당자1, 관리기관a1, 서비스코드a1, 담당자a1, 관리기관b1, 서비스코드b1, 담당자b1, 관리기관c1, 서비스코드c1, 담당자c1, remarksa1, remarksb1, remarksc1, 욕구정보html, 관리번호x)
	
	return "기존"
}



서비스넣기(이름,생년월일,서비스1,서비스2,서비스3,서비스4,서비스5,서비스6,서비스7,서비스8,서비스9,서비스10,서비스11,서비스12,서비스13,서비스14,서비스15,서비스16,서비스17,서비스18,서비스19,서비스20,서비스21,서비스22,서비스23,managenum,이름생년)
{
		;winhttp랑 관리번호 이용해서 인터넷에 저장된거 불러오기
	gethtml:="https://seniorcare.eseoul.go.kr/seniors/senior_card.jsp?senior_id=" managenum
	winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
	winhttp.open("GET",gethtml)
	winhttp.send()
	winhttp.waitforresponse()
	vgethtml:=winhttp.responsetext
	IfnotInString,vgethtml,/seniors/senior_card.jsp?senior_id=
	{
		guicontrol,, 실패목록, %이름생년% 전송실패
		return "실패"
	}
	str:= RegExReplace(vgethtml, "\R", "")		;매우 중요한 구문이다.. regexreplace로 \R인부분 즉 엔터친 부분을 제거한것
	a= id="senior_name" value="(.*?)"
	b= id="birth_date" value="(.*?)"
	c= class="tb_title">성별.*name="gender" value="(.*?)" checked="checked".*?name="senior_type"
	;여기서는 앞의 .* 뒤에 행을 특정할수 있는 "gender"가 이미 있으므로 따로 뒤에 .*? 더 붙일 필요가없다
	d= name="senior_type".*<option value="(.)" selected="selected".*?name="manage_degree"
	e= name="manage_degree".*<option value="(.)" selected="selected".*?name="manage_degree2"
	f= name="manage_degree2".*<option value="(.)" selected="selected".*?name="manage_degree3"
	g= name="manage_degree3".*<option value="(.)" selected="selected".*?name="senior_gubn"
	h= name="senior_gubn".*<option value="(.)" selected="selected".*?name="service_status"
	i= name="service_status".*<option value="(.)" selected="selected".*?name="urgent_tel_no"
	j= name="urgent_tel_no" value="(.*?)"
	k= name="tel_no" value="(.*?)"
	l= name="hp_no" value="(.*?)"
	m= name="addr" value="(.*?)"
	n= name="gu_code".*<option value="(.*?)" selected="selected".*?name="dong_code"
	o= name="dong_code".*<option value="(.*?)" selected="selected".*?name="addr_new"
	p= name="addr_new" value="(.*?)"
	q= name="health_status".*?>(.*?)</textarea>
	r= name="regist_yn".*<option value="(.*?)" selected="selected".*?name="safe_phone_yn"
	s= class="tb_title">사랑의안심폰.*name="safe_phone_yn" value="(.*?)" checked="checked".*?name="agree_yn"
	t= name="agree_yn" value="(.*?)" checked="checked".*?name="close_reason"
	u= name="remarks1" value="(.*?)" 
	v= name="remarks2" value="(.*?)"
	w= name="remarks3" value="(.*?)"
	
	x= name="close_reason".*<option value="(.*?)" selected="selected".*?name="close_reason_etc"
	y= name="close_reason_etc" value="(.*?)"
	z= name="close_date" value="(.*?)"
	
	aa= name="center_code".*<option value="(.*?)"  selected="selected".*?name="service_code"
	bb= name="service_code".*<option value="(.*?)" selected="selected".*?name="manager_name"
	cc= name="manager_name" readonly="readonly" value="(.*?)"
	dd= name="center_code1".*<option value="(.*?)"  selected="selected".*?name="service_code1"
	ee= name="service_code1".*<option value="(.*?)" selected="selected".*?name="manager_name1"
	ff= name="manager_name1" readonly="readonly" value="(.*?)"
	gg=name="center_code2".*<option value="(.*?)"  selected="selected".*?name="service_code2"
	hh= name="service_code2".*<option value="(.*?)" selected="selected".*?name="manager_name2"
	ii= name="manager_name2" readonly="readonly" value="(.*?)"
	jj=name="center_code3".*<option value="(.*?)"  selected="selected".*?name="service_code3"
	kk= name="service_code3".*<option value="(.*?)" selected="selected".*?name="manager_name3"
	ll= name="manager_name3" readonly="readonly" value="(.*?)"
	
	regexmatch(str, a, 이름)
	regexmatch(str, b, 생년월일)
	regexmatch(str, c, 성별)
	regexmatch(str, d, 대상자구분)
	regexmatch(str, e, 서비스구분a)
	regexmatch(str, f, 서비스구분b)
	regexmatch(str, g, 서비스구분c)
	regexmatch(str, h, 관리등급)
	regexmatch(str, i, 서비스상태)
	regexmatch(str, j, 비상연락처)
	regexmatch(str, k, 연락처)
	regexmatch(str, l, 휴대폰)
	regexmatch(str, m, 주소)
	regexmatch(str, n, 구)
	regexmatch(str, o, 행정동명)
	regexmatch(str, p, 새주소)
	regexmatch(str, q, 건강상태)
	regexmatch(str, r, 주민등록)
	regexmatch(str, s, 안심폰여부)
	regexmatch(str, t, 개인정보활용동의)
	regexmatch(str, u, remarksa)
	regexmatch(str, v, remarksb)
	regexmatch(str, w, remarksc)
	regexmatch(str, x, 종결사유)
	regexmatch(str, y, 종결사유기타)
	regexmatch(str, z, 종결날짜)
	
	regexmatch(str, aa, 관리기관)
	regexmatch(str, bb, 서비스코드)
	regexmatch(str, cc, 담당자)
	regexmatch(str, dd, 관리기관a)
	regexmatch(str, ee, 서비스코드a)
	regexmatch(str, ff, 담당자a)
	regexmatch(str, gg, 관리기관b)
	regexmatch(str, hh, 서비스코드b)
	regexmatch(str, ii, 담당자b)
	regexmatch(str, jj, 관리기관c)
	regexmatch(str, kk, 서비스코드c)
	regexmatch(str, ll, 담당자c)

	
 	wants=<td><input type="checkbox" name="(want[\d]{1,})" checked="checked"
	욕구정보html=
	if (서비스1<>0)
		욕구정보html:=욕구정보html "&want1=Y"
	if (서비스2<>0)
		욕구정보html:=욕구정보html "&want2=Y"
	if (서비스3<>0)
		욕구정보html:=욕구정보html "&want3=Y"
	if (서비스4<>0)
		욕구정보html:=욕구정보html "&want4=Y"
	if (서비스5<>0)
		욕구정보html:=욕구정보html "&want5=Y"
	if (서비스6<>0)
		욕구정보html:=욕구정보html "&want6=Y"
	if (서비스7<>0)
		욕구정보html:=욕구정보html "&want7=Y"
	if (서비스8<>0)
		욕구정보html:=욕구정보html "&want8=Y"
	if (서비스9<>0)
		욕구정보html:=욕구정보html "&want9=Y"
	if (서비스10<>0)
		욕구정보html:=욕구정보html "&want10=Y"
	if (서비스11<>0)
		욕구정보html:=욕구정보html "&want11=Y"
	if (서비스12<>0)
		욕구정보html:=욕구정보html "&want12=Y"
	if (서비스13<>0)
		욕구정보html:=욕구정보html "&want13=Y"
	if (서비스14<>0)
		욕구정보html:=욕구정보html "&want14=Y"
	if (서비스15<>0)
		욕구정보html:=욕구정보html "&want15=Y"
	if (서비스16<>0)
		욕구정보html:=욕구정보html "&want16=Y"
	if (서비스17<>0)
		욕구정보html:=욕구정보html "&want17=Y"
	if (서비스18<>0)
		욕구정보html:=욕구정보html "&want18=Y"
	if (서비스19<>0)
		욕구정보html:=욕구정보html "&want19=Y"
	if (서비스20<>0)
		욕구정보html:=욕구정보html "&want20=Y"
	if (서비스21<>0)
		욕구정보html:=욕구정보html "&want21=Y"
	if (서비스22<>0)
		욕구정보html:=욕구정보html "&want22=Y"
	if (서비스23<>0)
		욕구정보html:=욕구정보html "&want23=Y"
	
	;그다음 전체 합친거 winhttp로 보냄
	internetsend3(이름1, 생년월일1, 성별1, 대상자구분1, 서비스구분a1, 서비스구분b1, 서비스구분c1, 관리등급1, 서비스상태1, 비상연락처1, 연락처1, 휴대폰1, 주소1, 구1, 행정동명1, 새주소1, 건강상태1, 주민등록1, 안심폰여부1, 개인정보활용동의1, 종결사유1, 종결사유기타1, 종결날짜1, 관리기관1, 서비스코드1, 담당자1, 관리기관a1, 서비스코드a1, 담당자a1, 관리기관b1, 서비스코드b1, 담당자b1, 관리기관c1, 서비스코드c1, 담당자c1, remarksa1, remarksb1, remarksc1, 욕구정보html, 관리번호x)
	
	return "입력"
}

;-------------------------인코딩함수--------------------------------------------------------------------------------
	;인코딩함수
	/* 
	문자열을 특정 인코딩을 사용해서 URL Encoding 한다.
		@param str 문자열
	@param encoding 인코딩. 기본값 UTF-8
	@param except 제외할 문자들. 기본값 "!#$&'()*+,-./:;=?@_~"
@return 인코딩된 값
*/

URLEncode(str, encoding="UTF-8", except="!#$&'()*+,-./:;=?@_~") {
len := StrLen(str)
result := ""
i := 1
oldFmt := A_FormatInteger
SetFormat, Integer, hex
While (i <= len) {
char := SubStr(str, i, 1) ; 한문자씩 파싱
result .= IsNonEncodedCharacter(char, except) ? char : ToPercentHexFormat(char, encoding)
i++
}
SetFormat, Integer, %oldFmt%
return result
}

; 문자가 인코딩에서 제외할 문자인지를 체크한다.
; @param char 문자
; @param except 제외할 문자들
; @return 제외 여부
IsNonEncodedCharacter(char, except) {
ascii := Asc(char)
return ascii >= 0x41 && ascii <= 0x5A ; A-Z
|| ascii >= 0x61 && ascii <= 0x7A ; a-z
|| ascii >= 0x30 && ascii <= 0x39 ; 0-9
|| InStr(except, char, true)
}

; 문자열을 퍼센트 HEX 포맷으로 변환한다.
; @param str 문자열
; @param encoding 인코딩
; @return 변환된 문자열
ToPercentHexFormat(str, encoding) {
byteCnts := StrPutVar(str, encoded, encoding) - 1
result := ""
i := 0
While (i < byteCnts) {
byte := NumGet(encoded, i, "UChar")
hex := StrUpper(SubStr(byte, 3)) ; "0x" 제거
If (StrLen(hex) == 1)
hex := "0" . hex
result .= "%" . hex
i++
}
return result
}

; 문자열을 대문자로 변환한다.
; @param str 문자열
; @return 대문자로 변환된 문자열
StrUpper(str) {
StringUpper, out, str
return out
}

; UTF-16 문자열을 특정 인코딩의 문자열로 변환한다.
; @param str 대상 문자열
; @param var 변환된 문자열
; @param encoding 인코딩
; @return 변환된 문자열의 바이트수
StrPutVar(str, ByRef var, encoding) {
VarSetCapacity(var, StrPut(str, encoding) * ((encoding == "utf-16" || encoding == "cp1200") ? 2 : 1))
return StrPut(str, &var, encoding)
}


;--------------------------------------------------인터넷 보내기-----------------------------------------------------------------

internetsend1(이름,생년월일,대상자구분,성별,행정동명,주소,새주소,연락처,휴대폰,관리등급,구)
{
	
	;msgbox,% 이름 "`n" 생년월일 "`n" 성별 "`n" 대상자구분 "`n" 연락처 "`n" 휴대폰 "`n" 행정동명 "`n" 주소 "`n" 새주소 "`n" 관리등급 "`n" 구 "`n를 사이트에 보냅니다."

	data=% "job_type=C&senior_id=&from=card&senior_name=" 이름 "&birth_date=" 생년월일 "&gender=" 성별 "&senior_type=" 대상자구분 "&manage_degree=" G "&manage_degree2=" G "&manage_degree3=" G "&senior_gubn=" 관리등급 "&service_status=" 3 "&urgent_tel_no=&tel_no=" 연락처 "&hp_no=" 휴대폰 "&addr=" 주소 "&gu_code=" 구 "&dong_code=" 행정동명 "&addr_new=" 새주소 "&health_status=" "&regist_yn=N" "&safe_phone_yn=N" "&agree_yn=Y" "&close_reason=&close_reason_etc=&close_date=&center_code=&service_code=&manager_name=&center_code1=&service_code1=&manager_name1=&center_code2=&service_code2=&manager_name2=&center_code3=&service_code3=&manager_name3=&remarks1=&remarks2=&remarks3="
	data:=URLEncode(data)
	;msgbox, %data% 를 신규로 보냅니다
	
	winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
	winhttp.open("POST","https://seniorcare.eseoul.go.kr/seniors/seniorSave.do")
	winhttp.setrequestheader("Content-Type","application/x-www-form-urlencoded")
	winhttp.setrequestheader("Referer","https://seniorcare.eseoul.go.kr/seniors/senior_card.jsp?senior_id=" 관리번호x)
	winhttp.Send(data)
	winhttp.waitforresponse()
	a:=winhttp.responsetext
	IfnotInString,a,/seniors/senior_card.jsp?senior_id=
		guicontrol,,실패목록, %이름%%생년월일% 전송실패
}

internetsend2(이름, 생년월일, 성별, 대상자구분, 서비스구분a, 서비스구분b, 서비스구분c, 관리등급, 서비스상태, 비상연락처, 연락처, 휴대폰, 주소, 구, 행정동명, 새주소, 건강상태, 주민등록, 안심폰여부, 개인정보활용동의, 종결사유, 종결사유기타, 종결날짜, 관리기관, 서비스코드, 담당자, 관리기관a, 서비스코드a, 담당자a, 관리기관b, 서비스코드b, 담당자b, 관리기관c, 서비스코드c, 담당자c, remarksa, remarksb, remarksc, 욕구정보html, 관리번호x)
{
	if(관리등급<>4)
		개인정보활용동의:= "&agree_yn=Y"
	else
		개인정보활용동의:=
	
	data=% "job_type=U&senior_id=" 관리번호x "&from=card&senior_name=" 이름 "&birth_date=" 생년월일 "&gender=" 성별 "&senior_type=" 대상자구분 "&manage_degree=" 서비스구분a "&manage_degree2=" 서비스구분b "&manage_degree3=" 서비스구분c "&senior_gubn=" 관리등급 "&service_status=" 서비스상태 "&urgent_tel_no=" 비상연락처 "&tel_no=" 연락처 "&hp_no=" 휴대폰 "&addr=" 주소 "&gu_code=" 구 "&dong_code=" 행정동명 "&addr_new=" 새주소 "&health_status=" 건강상태 "&regist_yn=" 주민등록 "&safe_phone_yn=" 안심폰여부 개인정보활용동의  "&close_reason=" 종결사유 "&close_reason_etc=" 종결사유기타 "&close_date=" 종결날짜 "&center_code=" 관리기관 "&service_code=" 서비스코드 "&manager_name=" 담당자 "&center_code1=" 관리기관a "&service_code1=" 서비스코드a "&manager_name1=" 담당자a "&center_code2=" 관리기관b "&service_code2=" 서비스코드b "&manager_name2=" 담당자b "&center_code3=" 관리기관c "&service_code3=" 서비스코드c "&manager_name3=" 담당자c "&remarks1=" remarksa "&remarks2=" remarksb "&remarks3=" remarksc 욕구정보html
	data:=URLEncode(data)
	
	;stringreplace, data, data, &#41;, ), all  ㅋㅋ할필요 없었음 이거! 왜냐면 고대로 html형식으로 다시 보내면 되니까
	;stringreplace, data, data, &#40;, (, all
	;msgbox,% data "`n를 기존으로 인터넷에 보냅니다"
	
	winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
	winhttp.open("POST","https://seniorcare.eseoul.go.kr/seniors/seniorSave.do")
	winhttp.setrequestheader("Content-Type","application/x-www-form-urlencoded")
	winhttp.setrequestheader("Referer","https://seniorcare.eseoul.go.kr/seniors/senior_card.jsp?senior_id=" 관리번호x)
	winhttp.Send(data)
	winhttp.waitforresponse()
	a:=winhttp.responsetext
	IfnotInString,a,/seniors/senior_card.jsp?senior_id=
		guicontrol,,실패목록, %이름%%생년월일% 전송실패
}

internetsend3(이름, 생년월일, 성별, 대상자구분, 서비스구분a, 서비스구분b, 서비스구분c, 관리등급, 서비스상태, 비상연락처, 연락처, 휴대폰, 주소, 구, 행정동명, 새주소, 건강상태, 주민등록, 안심폰여부, 개인정보활용동의, 종결사유, 종결사유기타, 종결날짜, 관리기관, 서비스코드, 담당자, 관리기관a, 서비스코드a, 담당자a, 관리기관b, 서비스코드b, 담당자b, 관리기관c, 서비스코드c, 담당자c, remarksa, remarksb, remarksc, 욕구정보html, 관리번호x)
{
	if(관리등급<>4)
		개인정보활용동의:= "&agree_yn=Y"
	else
		개인정보활용동의:=
	
	data=% "job_type=U&senior_id=" 관리번호x "&from=card&senior_name=" 이름 "&birth_date=" 생년월일 "&gender=" 성별 "&senior_type=" 대상자구분 "&manage_degree=" 서비스구분a "&manage_degree2=" 서비스구분b "&manage_degree3=" 서비스구분c "&senior_gubn=" 관리등급 "&service_status=" 서비스상태 "&urgent_tel_no=" 비상연락처 "&tel_no=" 연락처 "&hp_no=" 휴대폰 "&addr=" 주소 "&gu_code=" 구 "&dong_code=" 행정동명 "&addr_new=" 새주소 "&health_status=" 건강상태 "&regist_yn=" 주민등록 "&safe_phone_yn=" 안심폰여부 개인정보활용동의  "&close_reason=" 종결사유 "&close_reason_etc=" 종결사유기타 "&close_date=" 종결날짜 "&center_code=" 관리기관 "&service_code=" 서비스코드 "&manager_name=" 담당자 "&center_code1=" 관리기관a "&service_code1=" 서비스코드a "&manager_name1=" 담당자a "&center_code2=" 관리기관b "&service_code2=" 서비스코드b "&manager_name2=" 담당자b "&center_code3=" 관리기관c "&service_code3=" 서비스코드c "&manager_name3=" 담당자c "&remarks1=" remarksa "&remarks2=" remarksb "&remarks3=" remarksc 욕구정보html
	data:=URLEncode(data)	
	
	;msgbox,% data "`n를 기존으로 인터넷에 보냅니다"
	
	winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
	winhttp.open("POST","https://seniorcare.eseoul.go.kr/seniors/seniorSave.do")
	winhttp.setrequestheader("Content-Type","application/x-www-form-urlencoded")
	winhttp.setrequestheader("Referer","https://seniorcare.eseoul.go.kr/seniors/senior_card.jsp?senior_id=" 관리번호x)
	winhttp.Send(data)
	winhttp.waitforresponse()
	a:=winhttp.responsetext
	IfnotInString,a,/seniors/senior_card.jsp?senior_id=
	{
		guicontrol,,실패목록, %이름%%생년월일% 전송실패
		iniwrite, %이름%%생년월일% 전송실패, 진행명단.ini, 실패명단
	}
}





GuiClose:
ExitApp

space::
Pause


/* 얻은 것
 :=로 변수 두개를 합성할땐  변수간 띄어쓰기가 중요하다
 함수속에서 gui 가져오려면 gui,submit 또 해야한다 (함수 속에선 전역변수가 안먹히기때문)