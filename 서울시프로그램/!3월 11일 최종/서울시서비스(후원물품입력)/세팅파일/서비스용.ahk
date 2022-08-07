#SingleInstance force
#NoEnv
SetWorkingDir %A_ScriptDir%
SendMode Input


title=서울시 사이트 프로그램-도움말은 F1을 누르세요
ifexist, %a_workingdir%\세팅파일\서비스db.ini								;
	iniread, 리스트목록, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록		;
ifexist, %a_workingdir%\세팅파일\서비스명단db.ini								;
	iniread, 명단목록, %a_workingdir%\세팅파일\서비스명단db.ini, 명단목록		;이 네줄로 일단 긁어오는것 ㅇㅇ

Gui, Add, GroupBox, x2 y9 w370 h250 vgroupbox1, 서비스 내용 리스트       명단 리스트
Gui, Add, Listbox, x12 y29 w115 h230 v리스트박스1 glistbox1, %리스트목록%        ;여기서 옵션에 choose5 이런거 넣거나 다섯번째 항목뒤에 |두개 넣으면  전체목록중 5번쨰 항복이 기본값됨
gui, add, listbox, x137 y29 w115 h230 v리스트박스2 glistbox2, %명단목록%
gui, add, text, x252 y29 w90 h40 v명단불러오기,   명단을 `n불러오지`n않았습니다
gui, add, edit, x252 y69 w90 h20 ReadOnly v명단edit,
gui, add, edit, x252 y89 w40 h20 Readonly v명단num,


Gui, Add, GroupBox, x342 y9 w250 h250 vgroupbox2, 인터넷에 날짜별로 저장
Gui, Add, MonthCal, x352 y29 v날짜 gcal,
Gui, Add, Button, x352 y199 w200 h50 gbutton1, 인터넷저장



Gui, Add, button, x12 y252 w200 h20 ggobackbutton, 서비스내용---클릭시 원상복귀
Gui, Add, Text, x12 y284 w60 h20 , *사업
Gui, Add, Text, x12 y344 w60 h20 , *공공구분
Gui, Add, Text, x12 y314 w60 h20 , *서비스
Gui, Add, Text, x12 y404 w60 h20 , 기타기관명
Gui, Add, Text, x12 y434 w60 h20 , 담당자
Gui, Add, Text, x12 y464 w60 h20 , 서비스내용
Gui, Add, Text, x12 y494 w70 h20 , 요청내용
Gui, Add, Text, x12 y524 w60 h20 , 긴급여부
Gui, Add, Text, x12 y374 w70 h20 , *서비스기관

gui, add, text, x202 y339 w60 h20	v후원금text,
gui, Add, Edit, x252 y334 w90 h20 v서비스어마운트edit,
guicontrol, hide, 서비스어마운트edit

Gui, Add, DropDownList, x82 y279 w100 h100 v사업, ||돌봄기본|돌봄종합|재가서비스|서울재가관리사|경로식당|도시락배달|밑반찬배달|주간보호|시설보호|공공일자리|안부확인|방문간호|방문요양|이동목욕|기타
Gui, Add, DropDownList, x82 y309 w100 h100 v서비스1 gservice, ||안부확인|가사간병|식사지원|주거환경개선|건강의료|후원금|후원물품|여가문화|기타
Gui, Add, DropDownList, x192 y309 w100 h100 v서비스2,
Gui, Add, DropDownList, x82 y339 w100 h100 v공공구분, ||공공사업|민간사업|공공+민간사업
Gui, Add, DropDownList, x82 y369 w160 h100 v서비스기관, ||서초구청 복지정책과|서초구립방배노인종합복지관|서초구립양재노인종합복지관|서초구립양재종합사회복지관|서초구립양재종합사회복지관|서초구립우면종합사회복지관|서초구립중앙노인종합복지관|서초구어르신행복e음센터
Gui, Add, Edit, x82 y399 w160 h20 v기타기관명,
Gui, Add, DropDownList, x82 y429 w80 h100 v담당자, ||강지선|공유선|백진주|김보경|
Gui, Add, Edit, x82 y459 w210 h20 v서비스내용,
Gui, Add, Edit, x82 y489 w210 h20 v요청내용,
Gui, Add, CheckBox, x82 y519 w90 h20 v긴급여부 , 긴급요청


Gui, Add, GroupBox, x347 y289 w200 h255 , 서비스 내용 저장or삭제
Gui, Add, Button, x362 y329 w170 h60 gbutton2, 서비스내용 저장
Gui, Add, Button, x362 y409 w170 h60 gbutton3, 서비스내용 삭제
gui, add, text, x362 y489 , 저장목록이름
gui, add, edit, x362 y509 v입력값,
	
; Generated using SmartGUI Creator 4.0
Gui, Show, x470 y115 h550 w600, % title
Return
;-----------------------gui를 좀 더  자세하게---------------------------------------------------------------------
	

	;서비스 1 입력하면 서비스2 바뀌는거 간단하게 guicontrol로 ㅇㅇ
service:
Gui,Submit, NoHide
if (서비스1="안부확인")
{
	guicontrol,,서비스2, ||안부전화|직접방문|생활교육|사랑의안심폰|일자리연계|부재중|안부확인 기타
	guicontrol,, 후원금text,
	guicontrol,, 서비스어마운트edit,
	guicontrol,hide, 서비스어마운트edit
}
else if (서비스1="가사간병")
{
	guicontrol,,서비스2, ||청소,세탁 등|건강상담,간병,운동등 산책|방문간호,기타|동행서비스(은행,병원 등)|목욕,이미용 지원|주간보호서비스(시설이용)
	guicontrol,, 후원금text,
	guicontrol,,서비스어마운트edit,
	guicontrol,Hide, 서비스어마운트edit
}
else if (서비스1="식사지원")
{
	guicontrol,,서비스2, ||경로식당|밑반찬 배달|도시락 배달|외식(특식 등)|밑반찬(재가노인)|도시락(재가노인)|식사지원 기타
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="주거환경개선")
{
	guicontrol,,서비스2, ||집수리|도배,장판|씽크대 등 가구수리|가전제품,전열기 교체 등|리모컨|주거환경개선 기타
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,	
}
else if (서비스1="건강의료")
{
	guicontrol,,서비스2, ||방문간호 지원(지역보건과)|약품,영양제 지원|보장구(보청기,틀니) 지원|이미용서비스|무료진료(의료서비스)|건강의료 기타
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="후원금")
{
	guicontrol,,서비스2, ||연중후원|분기후원|반기후원|일시후원|후원금 기타
	guicontrol,, 후원금text, 후원금액
	guicontrol,show, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="후원물품")
{
	guicontrol,,서비스2, ||푸드마켓 이용권|주식(쌀,잡곡 등)|부식(라면,계란 등)|반찬(김치,김 등)|간식(빵,음료 등)|연료(연탄,가스 등)|생필품(샴푸,세제 등)|의류 및 양말 등|외식(특식) 지원 등|후원물품 기타
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="여가문화")
{
	guicontrol,,서비스2, ||나들이|문화활동|생신잔치|여가문화 기타
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="기타")
{
	guicontrol,, 서비스2, ||기타|도거노인서울시전수조사|기초소방시설 무료 보급
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
else if (서비스1="")
{
	guicontrol,, 서비스2, |
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
}
return








;------------------------버튼 처리, 더블 클릭-------------------------------------------------------------------------------

gobackbutton:
	guicontrol,, 사업, |||돌봄기본|돌봄종합|재가서비스|서울재가관리사|경로식당|도시락배달|밑반찬배달|주간보호|시설보호|공공일자리|안부확인|방문간호|방문요양|이동목욕|기타
	guicontrol,, 서비스1, |||안부확인|가사간병|식사지원|주거환경개선|건강의료|후원금|후원물품|여가문화|기타
	guicontrol,, 서비스2,|||
	guicontrol,, 공공구분, |||공공사업|민간사업|공공+민간사업
	guicontrol,, 서비스기관, |||서초구청 복지정책과|서초구립방배노인종합복지관|서초구립양재노인종합복지관|서초구립양재종합사회복지관|서초구립양재종합사회복지관|서초구립우면종합사회복지관|서초구립중앙노인종합복지관|서초구어르신행복e음센터
	guicontrol,, 기타기관명,
	guicontrol,, 담당자, |||강지선|공유선|백진주|김보경|
	guicontrol,, 서비스내용,
	guicontrol,, 요청내용,
	guicontrol,, 긴급여부 , 긴급요청
	guicontrol,, 후원금text,
	guicontrol,Hide, 서비스어마운트edit
	guicontrol,,서비스어마운트edit,
	return
	
cal:
	Gui, Submit, NoHide
	stringleft, vY, 날짜, 4
	stringmid, vM, 날짜, 5, 2
	stringright, vD, 날짜, 2
	날짜=%vY%-%vM%-%vD%
	guicontrol,, groupbox2, %날짜%를 지정하셨습니다.
	return
	
button1:
	ifexist, %a_workingdir%\세팅파일\서비스db.ini
	iniread, 리스트목록, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
	Gui, Submit, NoHide
	if(사업="" or 서비스1="" or 서비스2="" or 공공구분="" or 서비스기관="" or 담당자="" or 명단edit="")       
	;inifile에있는거 키=""로 긁어오면 section전체가 복사되기때문에 ini속에 db로 있는건 다 불러올 키값이 제대로 있어야한다..
	{
		msgbox, 사업, 서비스, 공공구분, 서비스기관, 담당자, 명단 중 선택하지 않은 것이 있습니다.
	}
	else
	{   
		서비스어마운트:=서비스어마운트edit	;에딧에 쓴걸로 변수 한개 만들어서 쓴다(그냥 안쓰는 이유는.. 그냥 아래 save속 함수 이름 깔끔하게 하려고)
		stringleft, vY, 날짜, 4
		stringmid, vM, 날짜, 5, 2
		stringright, vD, 날짜, 2
		날짜=%vY%-%vM%-%vD%
		guicontrol,, groupbox2 , %날짜%를 저장하셨습니다.
		save(사업,서비스1,서비스2,서비스어마운트,공공구분,서비스기관,기타기관명,담당자,서비스내용,요청내용,긴급여부,날짜,명단줄)
		msgbox, % URLEncode(data)

		IfInString, data, error             ;마지막으로 에러있나점검
		{
			msgbox, 에러남.. 세팅.ini 와 일치하는지 체크하세요
			msgbox, %data%
		}
		else                               ;보내버림 ㄷㄷ;
			internet(data)
	}
	return
	
button2:
	ifexist, %a_workingdir%\세팅파일\서비스db.ini								;
		iniread, 리스트목록, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록		;중요한 두줄이당
	gui,submit,nohide
	if(입력값="") ;입력칸이 빈칸이면
		msgbox 저장목록이름을 적으세요.
	else
	{
		loop, parse, 리스트목록, |
		{
			if(a_loopfield=입력값)
			{
				msgbox, 목록에 %입력값%이(가) 이미 있습니다.
				return
			}
			else
				continue
		}
		
		iniwrite, %사업%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 사업
		iniwrite, %서비스1%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 서비스1
		iniwrite, %서비스2%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 서비스2
		iniwrite, %공공구분%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 공공구분
		iniwrite, %서비스기관%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 서비스기관
		iniwrite, %기타기관명%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 기타기관명
		iniwrite, %담당자%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 담당자
		iniwrite, %서비스내용%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 서비스내용
		iniwrite, %요청내용%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 요청내용
		iniwrite, %긴급여부%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 긴급여부
		if(서비스어마운트edit<>"")
			iniwrite, %서비스어마운트edit%, %a_workingdir%\세팅파일\서비스db.ini, %입력값%, 후원금액
		
		iniread,x, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록               ; 리스트 고쳐주기 위해 리스트변수에 넣을 변수조작
			if(x="") ;파일 속에 아무것도없으면
			{
				iniwrite, %입력값%, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
				Y:=입력값
			}
			else
			{
				Y=%x%|%입력값%
				inidelete, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
				iniwrite, %Y%, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
			}
		guicontrol,,리스트박스1,|%Y%          ;새로넣어줄땐 이렇게 |넣고 하는거더라
		}
		guicontrol,,입력값,
	return
		
button3:
	controlget, getITEM, choice,, listbox1, % title ;클릭되어있는거 얻어옴
	sendmessage,0x188,,,listbox1, % title           ;선택한 것의 번호
	LB_GETCURSEL := errorlevel+1                    
	sendmessage,0x182,LB_GETCURSEL-1,,listbox1, % title ;리스트에서 선택한거 없앰
	controlget, 나열, list,, listbox1, % title   ;다시 리스트에 있는걸 전체 다 얻어옴
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
	inidelete, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
	iniwrite, %A%, %a_workingdir%\세팅파일\서비스db.ini, 입력값목록
	inidelete, %a_workingdir%\세팅파일\서비스db.ini, %getITEM% ;해당section지우기
	}
	return


listbox1:                                             ;리스트박스1에서 아래로 불러오기     control명= 라벨명 =listbox1
	ifEqual, a_guievent, doubleclick                 ;난 얘가 왜 gui,summit이 필요없는지가 제일궁금해
	{
		controlget, 입력, choice,, listbox1, % title ;리스트박스1에서 고른걸 가져온다
		iniread, a, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 사업
		iniread, b, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 서비스1
		iniread, c, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 서비스2
		iniread, d, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 공공구분
		iniread, e, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 서비스기관
		iniread, f, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 기타기관명
		iniread, g, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 담당자
		iniread, h, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 서비스내용
		iniread, i, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 요청내용
		iniread, j, %a_workingdir%\세팅파일\서비스db.ini, %입력%, 긴급여부
		iniread, k, %a_workingdir%\세팅파일\서비스db.ini,%입력%, 후원금액
		guicontrol,, 사업, |%a%|| ;다 변수를 v사업 이런식으로 해줘서 ini키값이랑 변수이름이 같다 ㅋㅋ
		guicontrol,, 서비스1, |%b%||
		guicontrol,, 서비스2, |%c%||
		guicontrol,, 공공구분, |%d%||
		guicontrol,, 서비스기관,|%e%||  ;;;한개만 고정으로해주려면 이렇게 하는거구나... 앞에만 | 넣는줄
		guicontrol,, 기타기관명, %f%
		guicontrol,, 담당자, |%g%||
		guicontrol,, 서비스내용, %h%
		guicontrol,, 요청내용, %i%
		guicontrol,, 긴급여부, %j%
		if(k="ERROR")
		{
			guicontrol,, 후원금text,
			guicontrol,,서비스어마운트edit,
			guicontrol,Hide, 서비스어마운트edit
			
		}
		else
		{
			guicontrol,, 후원금text, 후원금
			guicontrol,show, 서비스어마운트edit
			guicontrol,,서비스어마운트edit, %k%
		}
	}
	return
	
listbox2:               
	ifEqual, a_guievent, doubleclick
	{
		명단수=
		controlget, getITEM2, choice,, listbox2, % title
		guicontrol,,명단불러오기,명단을`n지정하셨습니다`n
		guicontrol,, 명단edit, %getITEM2%
		gui,submit, NoHide
		iniread, 명단줄, %a_workingdir%\세팅파일\서비스명단db.ini,%명단edit%
		loop, parse, 명단줄, &, &
			명단수++
		명단수--
		guicontrol,, 명단num, %명단수%명
	}
	return
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




;-----------------save버튼 http함수--------------------------------------------------------------------------------------------


save(A,B,C,D,E,F,G,H,I,J,K,L,M) ;사업,서비스1,서비스2,서비스어마운트,공공구분,서비스기관,기타기관명,담당자,서비스내용,요청내용,  긴급여부,(날짜),명단
{
    iniread, A1, %a_workingdir%\세팅파일\세팅.ini, 사업, %A% ;여긴 ini섹션명 찾는것이기때문에 구이서밋 필요없다
    iniread, B1, %a_workingdir%\세팅파일\세팅.ini, 서비스1, %B%
    iniread, C1, %a_workingdir%\세팅파일\세팅.ini, 서비스2, %C%
    iniread, E1, %a_workingdir%\세팅파일\세팅.ini, 공공구분, %E%
    iniread, F1, %a_workingdir%\세팅파일\세팅.ini, 서비스기관, %F%
    iniread, K1, %a_workingdir%\세팅파일\세팅.ini, 긴급여부, %K%

    ;여기서 알파벳 뒤에 1써져있는건 ini파일에서 가져오는값
    global data
    data=% "search=Y&s_dong_code=&s_center_code=10515&s_senior_name=&s_manager_name=" "&service_date=" L "&biz_code=" A1 "&service_code=" B1 "&service_action=" C1 "&service_amount=" D "&public_gubn=" E1 "&center_code=" F1 "&center_name_etc=" G "&manager_name=" H "&service_info=" I "&request_info=" J K1 M
}

internet(A)
{
    winhttp:=comobjcreate("winhttp.winhttprequest.5.1")
    winhttp.open("POST","https://seniorcare.eseoul.go.kr/service/serviceInsert.do")
    winhttp.setrequestheader("Content-Type","application/x-www-form-urlencoded")
    winhttp.setrequestheader("Referer","https://seniorcare.eseoul.go.kr/service/service_insert.jsp")
    winhttp.Send(A)
    winhttp.waitforresponse()
    a:=winhttp.responsetext
    IfInString,a,/service/service_insert.jsp?s_dong_code=&s_center_code=10515&s_senior_name=&s_manager_name=  ;이거아님 contents 다시 알아와야됨 ㅋㅋ
    msgbox, 저장됨
    else
    msgbox, 저장실패
}
;--------------------키들--------------------------------------------------------------------------------------------------
\::
goto, button1

F1::
msgbox, ※주의사항※`n`n 1. 인터넷 저장을 누르시기전에 먼저 목록을 불러와야합니다.
return

F2::
clipboard=%리스트박스1%
return

GuiClose:
ExitApp

/*
깨달은점: 
1)먼저 loop의 if랑 else에서 제대로 각각 인식하는지 알아보려면 if랑 else하위{}에  각각 msgbox %a_index%를 넣어서 인식하게 한다
2)listbox를 컨트롤하려면 sendmessage랑 controlget같은거 이용하거나  그냥 아예 guicontrol쓴다
3) if()속에서는 (variable="텍스트")이런식으로 써주더라 왜 ""를 붙이는지는모름  아마 :=랑 같은역할하는듯 괄호속에선
   변수="텍스트" 로 쓰고 변수=변수 이런식으로 써준다
4) =%를 써서 변수랑 텍스트같이쓸땐 변수들 막 띄어쓰기 해도되서 편하다
5) gui위에서 먼저 만들어준 변수는 업데이트가 안되므로 라벨에서 다시 불러오든지해준다(이것떄문에 목록 저장삭제저장할떄 오류났엇음;)
6) 전역변수는 항상 쓰기전에 열어주는게 중요하다 <변수=>이런식으로.. 안그러면 gui 켜져있을때는 라벨이return되도 변수가 안없어지고 그대로 유지됨
7)씨발 gui로만든 전역변수 때려죽여도 함수속에 안들어가네 전역변수가 들어가려면 함수의()속에 넣던지해야됨;; 안그러면 절대안들어가짐
8)gui,submit 위치 ㅈㄴ중요하다
*/