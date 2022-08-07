	#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

iniread, 비밀번호ini, %a_scriptdir%\설정\설정.ini, 계정, 비밀번호
iniread, 폰번호ini, %a_scriptdir%\설정\설정.ini, 계정, 폰번호
iniread, 사이트주소ini, %a_scriptdir%\설정\설정.ini, 나머지, 사이트주소

Gui, Add, Edit, x12 y29 w290 h20 v사이트주소, %사이트주소ini%
Gui, Add, Text, x12 y9 w180 h20 , 사이트주소를적으세요
Gui, Add, DropDownList, x12 y79 w100 h100 v사이즈, 245|250|255|260|265|270|275|280|285|290|295
Gui, Add, Text, x12 y59 w100 h20 , 사이즈
Gui, Add, DropDownList, x132 y79 w90 h100 v수량, 1||2|3|4|5
Gui, Add, Text, x132 y59 w70 h20 , 수량
Gui, Add, Button, x312 y149 w110 h70 gsitesearch, 2)사이트검색
gui, add, button, x422 y149 w80 h70 gpicturesearch, 1)그림 찾기
gui, add, button, x502 y149 w80 h70 g실험, 실험
Gui, Add, DropDownList, x12 y129 w100 h100 , 8|9|10|11
Gui, Add, Text, x12 y109 w100 h20 , 익스 버전
Gui, Add, Radio, x102 y179 w90 h20 v휴대폰결제, 휴대폰결제
Gui, Add, Radio, x12 y179 w80 h20 v카드결제, 카드결제
Gui, Add, Text, x12 y159 w100 h20 , 결제 방법
Gui, Add, DropDownList, x322 y69 w80 h100 , 신한|국민|우리|현대|삼성
Gui, Add, Text, x442 y39 w70 h30 , 핸드폰번호 예)20401355
Gui, Add, Edit, x442 y69 w120 h20 v폰번호, %폰번호ini%
Gui, Add, Text, x442 y99 w70 h20, 비밀번호
Gui, Add, Edit, x442 y119 w120 h20 v비밀번호 password*, %비밀번호ini%
Gui, Add, Text, x322 y49 w60 h20 , 카드종류
Gui, Add, GroupBox, x312 y9 w110 h140 , 카드결제
Gui, Add, GroupBox, x422 y9 w160 h140 +, 휴대폰결제
gui, add, button, x522 y0 w70 h35 ginisave, 모든 설정 저장
; Generated using SmartGUI Creator 4.0
Gui, Show, x462 y266 h235 w606, New GUI Window
Return

GuiClose:
ExitApp


inisave:
gui, submit, nohide
iniwrite, %비밀번호%, %a_scriptdir%\설정\설정.ini, 계정, 비밀번호
iniwrite, %폰번호%, %a_scriptdir%\설정\설정.ini, 계정, 폰번호
iniwrite, %사이트주소%, %a_scriptdir%\설정\설정.ini, 나머지, 사이트주소

실험:
gui, submit, nohide
ex:=comobjcreate("internetexplorer.application")
ex.Visible := true
ex.navigate(사이트주소)
winmaximize, ahk_class IEFrame
Loop
{
	random, count, 4, 12
	Loop, %count%
	{
		if(ex.readyState!=4 || ex.document.readyState!="complete" || ex.busy)
		{
			sleep, 500
			continue
		}
		else
			성공:=1
			break
	}
	
	if(성공=1)
		break
	else
	{
		send, {enter}
		ex.navigate(사이트주소)
		winmaximize, ahk_class IEFrame
	}
}

Loop
{
	imagesearch, 사이즈목록x, 사이즈목록y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\사이즈.png
	if(errorlevel=0)
	{
		gosub, PHONE
		break
	}	
}
return

sitesearch:
gui, submit, nohide
expl:= comobjcreate("internetexplorer.application")
expl.Visible := true
expl.navigate(사이트주소)
winmaximize, ahk_class IEFrame
;While expl.readyState!=4 || expl.document.readyState!="complete" || expl.busy
return

~Enter::
gui, submit, nohide
send, {enter}
expl.navigate(사이트주소)
winmaximize, ahk_class IEFrame
return

picturesearch:
gui, submit, nohide
if(휴대폰결제=1)
	gosub, PHONE
else if(카드결제=1)
	gosub, CARD
return

;=============================================================================================

PHONE:

	loop
	{
		imagesearch, 사이즈목록x, 사이즈목록y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\사이즈.png
		if(errorlevel=0)
		{
			mouseclick, L, 사이즈목록x, 사이즈목록y
			break
		}
	}
			
	loop
	{
		imagesearch, 사이즈x, 사이즈y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\255.png
		if(errorlevel=0)
		{
			mouseclick, L, 사이즈x, 사이즈y
			break
		}
	}
	
/*
	loop
	{
		imagesearch, 수량목록x, 수량목록y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\수량.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량목록x, 수량목록y
			break
		}
	}

	Loop
	{
		imagesearch, 수량x, 수량y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\1.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량x, 수량y
			break
		}		
	}
*/
	Loop
	{
		imagesearch, 구매x, 구매y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\구매하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 구매x, 구매y
			break
		}
	}

	loop
	{

		imagesearch, 결제창x, 결제창y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\주문서.png
		if(errorlevel=0)
		{
			;mouseclickdrag, L, 1360, 200, 1360, 300, 100
			break
		}
	}
		


	
	Loop
	{
		imagesearch, 휴대폰선택x, 휴대폰선택y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\휴대폰선택.png
		if(errorlevel=0)
		{
			mouseclick, L, 휴대폰선택x, 휴대폰선택y
			break
		}
	}
	
	Loop
	{
		imagesearch, 결제동의x, 결제동의y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\결제동의.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제동의x, 결제동의y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기x, 결제하기y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\결제하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기x, 결제하기y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기2x, 결제하기2y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\휴대폰_결제하기1.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기2x, 결제하기2y
			break
		}	
	}
	
	send,%폰번호%
	send,{tab}%비밀번호%
	
	Loop
	{
		imagesearch, 확인버튼x, 확인버튼y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\휴대폰_확인.png
		if(errorlevel=0)
		{
			mouseclick, L, 확인버튼x, 확인버튼y
			break
		}
	}
	
	Loop
	{
		imagesearch, 확인버튼x, 확인버튼y, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\그림\휴대폰_결제.png
		if(errorlevel=0)
		{
			mouseclick, L, 확인버튼x, 확인버튼y
			break
		}
	}	
	return


CARD:

	loop
	{
		imagesearch, 사이즈목록x, 사이즈목록y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\사이즈.png
		if(errorlevel=0)
		{
			mouseclick, L, 사이즈목록x, 사이즈목록y
			loop
			{
				imagesearch, 사이즈x, 사이즈y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\255.png
				if(errorlevel=0)
				{
					mouseclick, L, 사이즈x, 사이즈y
					break
				}
			}
			break
		}
	}
	
	loop
	{
		imagesearch, 수량목록x, 수량목록y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\수량.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량목록x, 수량목록y
			break
		}
	}
		
	Loop
	{
		imagesearch, 수량x, 수량y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\1.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량x, 수량y
			break
		}		
	}
	Loop
	{
		imagesearch, 구매x, 구매y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\구매하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 구매x, 구매y
			break
		}
	}
	
	

	loop
	{

		imagesearch, 결제창x, 결제창y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\주문서.png
		if(errorlevel=0)
		{
			;mouseclickdrag, L, 1360, 184, 1360, 334, 50
			break
		}
	}
	
	Loop
	{
		imagesearch, 결제방법x, 결제방법y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\카드선택.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제방법x, 결제방법y
			mousemove, 결제방법x-30, 결제방법y
			break
		}
	}
	
	Loop
	{
		imagesearch, 카드x, 카드y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\신한카드.png
		if(errorlevel=0)
		{
			sleep, 500
			mouseclick, L, 카드x, 카드y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제동의x, 결제동의y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\결제동의.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제동의x, 결제동의y
			break
		}	
	}
	
	
	Loop
	{
		imagesearch, 결제하기x, 결제하기y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\결제하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기x, 결제하기y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기2x, 결제하기2y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\신한카드_결제하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기2x, 결제하기2y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기3x, 결제하기3y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\그림\신한카드_패스워드.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기3x, 결제하기3y, 3
			sleep, 1000
			break	
		}
	}
return
	
	
F1::
Reload
return

F2::
gosub, 실험