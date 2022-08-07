#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetDefaultMouseSpeed, Speed

^1::
;먼저 메이플 id값 가져오고 자리 0,0 으로 옮김
winget, list, list,
winget, count, count,
loop, %count%
{
   ID=% list%a_index%
   wingettitle, title, ahk_id %ID%
   if(title="MapleStory")
	{
		msgbox, maplestory 찾음
		break
	}
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



;템창 합성창 정렬 루틴
^2::
winactivate, ahk_id %ID% 
send, i
sleep,300
WinGetPos, Xpos, Ypos, X_size, Y_size, ahk_id %ID%
WinMove,ahk_id %ID% ,,0,0
coordmode, pixel, screen
coordmode, mouse, screen
imagesearch, Xpos, Ypos, 0, 0, X_size, Y_size, %a_scriptdir%\아이템창늘리는버튼.bmp
if(errorlevel=0)
{
	mouseclick, L, Xpos, Ypos
	sleep, 300
	Ypos:=Ypos-264
	Xpos:=Xpos-76
	dragging(Xpos, Ypos, 518, 359)
	imagesearch, Xpos, Ypos, 0, 0, X_size, Y_size, %a_scriptdir%\합성버튼.bmp
	if(errorlevel=0)
	{
		mouseclick, L, Xpos, Ypos
		sleep,300
		imagesearch, Xpos, Ypos, 0, 0, X_size, Y_size, %a_scriptdir%\합성취소버튼.bmp
		if(errorlevel=0)
		{	
			Ypos:=Ypos-168
			dragging(Xpos, Ypos, 362, 356)
			msgbox, 정렬끝
		}
		else
			msgbox, 합성취소버튼 못 찾겠음
	}
	else 
		msgbox, 합성버튼 못 찾겠음
}
else
	msgbox, 아이템창버튼 못 찾겠음
return

^3::
InputBox, 캐릭번호, 좌표설정하기, 캐릭번호를 넣으쇼(반드시 자연수로)
winactivate, ahk_id %ID%
imagesearch, x, y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\메소.bmp
if(errorlevel=0)
{
	y:=y-289 ;메소그림 찾은 곳에서 위로 올려서 (a,b) 기준잡음
	;x축 위모서리x
	loop, 128
	{
		if(mod(a_index,32)=1&&a_index!=1)
			x:=x+36*4
		if(mod(a_index,4)=1)
		{
			a:=x
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, %캐릭번호%.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, %캐릭번호%.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, %캐릭번호%.ini, 아래모서리x, K%a_index%
		}
		else if(mod(a_index,4)=2)
		{
			a:=x+36
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, %캐릭번호%.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, %캐릭번호%.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, %캐릭번호%.ini, 아래모서리x, K%a_index%

		}
		else if(mod(a_index,4)=3)
		{
			a:=x+72
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, %캐릭번호%.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, %캐릭번호%.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, %캐릭번호%.ini, 아래모서리x, K%a_index%
		}
		else if(mod(a_index,4)=0)
		{
			a:=x+108
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, %캐릭번호%.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, %캐릭번호%.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, %캐릭번호%.ini, 아래모서리x, K%a_index%
		}
	}
	
	loop,128
	{
		if(0<mod(a_index,32) and mod(a_index,32)<=4)
		{
			b:=y
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(4<mod(a_index,32) and mod(a_index,32)<=8)
		{
			b:=y+35
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(8<mod(a_index,32) and mod(a_index,32)<=12)
		{
			b:=y+70
			b1:=b+17
			b2:=b+35		
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(12<mod(a_index,32) and mod(a_index,32)<=16)
		{
			b:=y+105
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(16<mod(a_index,32) and mod(a_index,32)<=20)
		{
			b:=y+140
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(20<mod(a_index,32) and mod(a_index,32)<=24)
		{
			b:=y+175
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(24<mod(a_index,32) and mod(a_index,32)<=28)
		{
			b:=y+210
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
		else if(28<mod(a_index,32)&&mod(a_index,32)||mod(a_index,32)=0 )
		{
			b:=y+245
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, %캐릭번호%.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, %캐릭번호%.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, %캐릭번호%.ini, 아래모서리y, K%a_index%
		}
	}
}
msgbox, 위치정보 ini에 입력완료
return



/*자리확인하려고 쓴 것
^3::
setx:=441
sety:=397
mousemove, setx, sety
sleep,1000
loop,16
{
mousegetpos, nowx, nowy
mousemove, nowx+36, nowy
sleep,1000
}
return
*/

;-------------------------아이템 합성작업----------------------------
/*첫번째 목표: 모든 칸을 잠재로 채운다
두번째 목표: 잠재를 확인하고 모두 에픽으로 바꿔준다

첫번째 생각

loop씀 변수는 잠재옵 개수와 탐색하는 칸의 번호
먼저 앞선 칸의 아이템 한개와 그 뒤의 칸들을 순서대로 합성한다  매번 확인한다 
(ii두번 누르고 앞선 칸의 좌표에 잠재옵션 그림이 보이는지 확인
->안 보이면 계속 그 뒤에 것을 합성한다 
->보이면 합성 취소하고 아이템 위로 올린 후 합성버튼 눌러 그 나온 것 개수+1칸의 좌표부터 다시 시작
이 작업을 다음 칸에 잠재가 없을 때까지 반복한다(루프의 마지막에 넣어준다)

이건 칸수를 6칸 사용할때고


두번째 생각

loop씀 변수는 잠재옵 개수와 합성시도한 개수(아이템이 없어진 개수)
매번 i 두번 눌러서 잠재옵션 그림이 보이는지 확인
없으면 그 다음 것과 합성
있으면 합성 시도한 개수+잠재옵 개수+1부터 다시 시작
아이템 없어진 개수+잠재옵 개수가 처음 개수와 같아지면 loop 탈출하고 정리하기
이게 깔끔한 듯


*/


^4:: ;아이템 첫번째 합성루틴
inputbox, 아이템수, 아이템 합성, 아이템 수를 넣으쇼
InputBox, 캐릭번호, 아이템 합성, 캐릭번호를 넣으쇼(반드시 자연수로)
winactivate, ahk_id %ID%
합성2:=2
합성1:=1
성공한템수:=0
잠재번호:=1
사용한템수:=
합성시도수:=

loop, %아이템수%
{	
	if(사용한템수=아이템수)	;브레이크 뒤에 걸면 아이템수보다 한번 더 돌더라
		break
	if(사용한템수=아이템수-1&&aerrorlevel:=1)	;잠재 다 만들어지고 하나 남았을 때 바로 스탑하게 함 ㅎㅎ(획기적ㅎ)
		break
	iniread, 위치x, %캐릭번호%.ini, 위치좌표x, K%합성1%
	iniread, 위치y, %캐릭번호%.ini, 위치좌표y, K%합성1%
	iniread, 위치x2, %캐릭번호%.ini, 위치좌표x, K%합성2%
	iniread, 위치y2, %캐릭번호%.ini, 위치좌표y, K%합성2%
	iniread, 왼쪽위x, %캐릭번호%.ini, 위모서리x, K%잠재번호%
	iniread, 왼쪽위y, %캐릭번호%.ini, 위모서리y, K%잠재번호%
	iniread, 오른쪽아래x, %캐릭번호%.ini, 아래모서리x, K%잠재번호%
	iniread, 오른쪽아래y, %캐릭번호%.ini, 아래모서리y, K%잠재번호%
	if(위치x="error"||위치y="error"||위치x2="error"||위치y2="error")
		msgbox, ini에 잘못된 키 값을 넣었습니다
	else
	{
		aerrorlevel:=alchemy(위치x, 위치y, 위치x2, 위치y2, X_size, Y_size,왼쪽위x,왼쪽위y,오른쪽아래x,오른쪽아래y,ID)
		합성시도수++
		if(aerrorlevel=0)
		{
			잠재번호++
			성공한템수++
			합성1:=성공한템수+합성시도수+1
			합성2:=합성1+1
			winactivate, ahk_id %ID%
		}
		else if(aerrorlevel=1)
		{
			합성1:=잠재번호
			합성2++
			winactivate, ahk_id %ID%
		}
		else if(aerrorlevel=2)
		{
			msgbox,연금술 시작 이미지 못 찾음 
			break
		}
		else if(aerrorlevel=3)
		{
			msgbox,연금술 시작2 이미지 못 찾음
			break
		}
		else if(aerrorlevel=4)
		{
			msgbox,연금술 확인 이미지 못 찾음
			break
		}
		else if(aerrorlevel=5)
		{
			msgbox,	경험치적립 이미지 못 찾음
			break
		}
		else if(aerrorlevel=18)
		{
			msgbox,	피로도 다 찼음
			break
		}
		else if(aerrorlevel=28)
		{
			msgbox,	연금술 레벨업 필요
			break
		}
		사용한템수:=성공한템수+합성시도수
	}
}
return




^5::

InputBox, 캐릭번호, 아이템 합성, 캐릭번호를 넣으쇼(반드시 자연수로)

;칸수를 넣으면 에픽인지 노말인지 알려주는 array만들기)
Array:={(K1):"",(K2):"",(K3):"",(K4):"",(K5):"",(K6):"",(K7):"",(K8):"",(K9):"",(K10):"",(K11):"",(K12):"",(K13):"",(K14):"",(K15):"",(K16):"",(K17):"",(K18):"",(K19):"",(K20):"",(K21):"",(K22):"",(K23):"",(K24):"",(K25):"",(K26):"",(K27):"",(K28):"",(K29):"",(K30):"",(K31):"",(K32):"",(K33):"",(K34):"",(K35):"",(K36):"",(K37):"",(K38):"",(K39):"",(K40):"",(K41):"",(K42):"",(K43):"",(K44):"",(K45):"",(K46):"",(K47):"",(K48):"",(K49):""}
;-----------------------분류작업-----------------------
loop, 모자수
{
	iniread, 위치x, %캐릭번호%.ini, 위치좌표x, K%a_index%
	iniread, 위치y, %캐릭번호%.ini, 위치좌표y, K%a_index% 
	iniread, 왼쪽위x, %캐릭번호%.ini, 위모서리x, K%a_index%
	iniread, 왼쪽위y, %캐릭번호%.ini, 위모서리y, K%a_index%
	iniread, 오른쪽아래x, %캐릭번호%.ini, 아래모서리x, K%a_index%
	iniread, 오른쪽아래y, %캐릭번호%.ini, 아래모서리y, K%a_index%
	;이런식으로 저장된 위치를 긁어옴
	;ini오류확인해야함
	mousemove, %위치x%, %위치y%
	imagesearch, A, B, %왼쪽위x%, %왼쪽위y%, 오른쪽아래x,오른쪽아래y, 에픽.bmp
	if(errorlevel=0)
		Array[K%index%]:="에픽"
	if(errorlevel=1)
	{
		imagesearch, A, B, %왼쪽위x%, %왼쪽위y%, 오른쪽아래x,오른쪽아래y, 레어.bmp
		if(errorlevel=0)
			Array[K%index%]:="레어"
		else if(errorlevel=1)
		{
			imagesearch, A, B, %왼쪽위x%, %왼쪽위y%, 오른쪽아래x,오른쪽아래y, 노말.bmp
			if(errorlevel=0)
				Array[K%index%]:="노말"
			else if(errorlevel=1)
				Array[K%index%]:="기타"
			else
			{
				msgbox, 노말 이미지를 못 찾았음
				return
			}
		}
		else
		{
			msgbox, 레어 이미지를 못 찾았음
			return
		}
	}
	else
	{
		msgbox, 에픽 이미지를 못 찾았음
		return
	}	
}

;array를 이용해서 ini파일 쉽게 작성함
;----------------------------분류작업2----------------------------
loop, 모자수
{	
	value:=Array[K%a_index%]
	if(value:="에픽")
		iniwrite, a_index, %a_scriptdir%\%캐릭번호%.ini, 에픽
	if(value:="레어")
		iniwrite, a_index, %a_scriptdir%\%캐릭번호%.ini, 레어
	if(value:="노말")
		iniwrite, a_index, %a_scriptdir%\%캐릭번호%.ini, 노말
	if(value:="기타")
		iniwrite, a_index, %a_scriptdir%\%캐릭번호%.ini, 기타
}

;---------------------------분류작업-자리바꿔주기-------------------- 
iniread, 기타목록, %캐릭번호%.ini, 기타
loop,parse, 기타목록, `r, `n
{
	;ini에서 바꾸고 array에서도 바꾸고
	;자리 맨 앞부터 순서대로으로 놔주고 모자 놓은자리들의 개수를 변수인 자리수 = a_index 로 저장 
}

iniread, 에픽목록, %캐릭번호%.ini, 에픽
loop,parse, 에픽목록, `r, `n
{
	;ini에서 바꾸고 array에서도 바꾸고
	;자리 맨 앞부터 순서대로으로 놔주고 모자 놓은자리들의 개수를 변수인 자리수 = a_index 로 저장 
}

iniread, 레어목록, %캐릭번호%.ini, 레어
loop, parse, 레어목록, `r, `n
{
	;ini에서 array에서 변경
	;아까 놨던 곳 뒤부터 순서대로 놔주고 자리를 바꿔준다
}
return
;노말은 옮길 필요 없다
*/






;---------------함수-------------------------

alchemy(a, b, c, d, X_size, Y_size, e, f, g, h, ID)
{
winactivate, ahk_id %ID%
dragging(a, b, 303, 465)
mouseclick, L, 303, 465
sleep,300

;첫번째 합성을 놓으면 피로도 쌓였다고 나옴
imagesearch, 피로도위치x, 피로도위치y, 0, 0, X_size, Y_size, *transblack %a_scriptdir%\피로도.bmp
if(errorlevel=0)
{
	mouseclick, L, 피로도위치x+170, 피로도위치y+56
	;esc몇번 누르고 
	change_character()
	return 18
}

dragging(c, d, 374, 467)
mouseclick, L, 374, 467
sleep,300
imagesearch, 시작위치x, 시작위치y, 0, 0, X_size, Y_size, %a_scriptdir%\연금술시작.bmp
if(errorlevel=0)
{
	mouseclick, L, 시작위치x, 시작위치y
	sleep,300
	imagesearch, 시작위치2x, 시작위치2y, 0, 0, X_size, Y_size, %a_scriptdir%\연금술시작2.bmp
	if(errorlevel=0)
	{
		MouseClick, L,시작위치2x, 시작위치2y
		sleep,2000
		
		Loop	;연금술 확인 눌러주는 건데 '가끔' 경험치 다 쌓였다고 뜨는 걸 클릭해줘야된다
		{
			imagesearch, 확인위치x, 확인위치y, 0, 0, X_size, Y_size, %a_scriptdir%\연금술확인.bmp
			if(errorlevel=0)
			{
				sleep, 200
				loop, 4
				{
					sleep, 50
					imagesearch, 적립위치x, 적립위치y, 0, 0, X_size, Y_size, *transblack %a_scriptdir%\경험치적립.bmp
					if(errorlevel=0)
					{
						levelup(적립위치x, 적립위치y)
						return 28
					}
					if(errorlevel=1)
						break
					else
						return 6
				}
				break
			}
			else if(errorlevel=1)
				continue
			else
				return 4
		}
		

		sleep,100
		mouseclick, L, 확인위치x, 확인위치y
		sleep,300
		send, i
		sleep,150
		send, i
		send,300
		mousemove, 0, 0
/*
		if(구분번호=1)	;처음엔 이전의 잠재옵 여부 구분하는게 엄청 필요한건줄 알았는데 맨처음 빼고 필요 없는 듯?
		{			
*/
		Loop
		{
			imagesearch, 확인위치x, 확인위치y, 0, 0, X_size, Y_size, %a_scriptdir%\메소2.bmp
			if(errorlevel=0)
				break
		}
		imagesearch, 잠재x, 잠재y, g-2, h-2, g, h, %a_scriptdir%\잠재옵션.bmp
		if(errorlevel=0)
			return 0	;잠재옵을 찾음
		else
			return 1	;잠재옵을 못찾음
/*
		}
		else if(구분번호=0) ;구분번호가 필요없는 경우: 처음=>처음에도 백퍼 없음 뿐
			return 0
*/
			
	}
	else
		return 3
}
else
	return 2 ;시작1을 못찾음
}


dragging(a,b,c,d)
{
mousemove, a, b
sleep, 200
send, {click down}
sleep,200
mousemove, c, d
sleep,200
send, {click up}
}


levelup(a,b)
{
	/*확인버튼 누르고
	esc 두번 누른후
	카리엔 누르고 적립
	*/
}

change_character()
{
	;서버 변경해서 다른 아이디로 들어오기
}


