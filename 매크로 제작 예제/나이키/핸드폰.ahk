﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

inputbox, site, 입력하세요,사이트주소를 복사 붙여넣기 해주세요,, 500, 200
if ErrorLevel
	msgbox, 취소
else
{
	expl:= comobjcreate("internetexplorer.application")
	expl.Visible := true
	expl.navigate(site)
	send, !{space}
	sleep, 500
	send, x
	
	loop
	{
		imagesearch, 사이즈목록x, 사이즈목록y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\사이즈.png
		if(errorlevel=0)
		{
			mouseclick, L, 사이즈목록x, 사이즈목록y
			loop
			{
				imagesearch, 사이즈x, 사이즈y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\255.png
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
		imagesearch, 수량목록x, 수량목록y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\수량.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량목록x, 수량목록y
			break
		}
	}
		
	Loop
	{
		imagesearch, 수량x, 수량y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\1.png
		if(errorlevel=0)
		{
			mouseclick, L, 수량x, 수량y
			break
		}		
	}
	Loop
	{
		imagesearch, 구매x, 구매y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\구매하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 구매x, 구매y
			break
		}
	}
	
	

	loop
	{

		imagesearch, 결제창x, 결제창y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\주문서.png
		if(errorlevel=0)
		{
			mouseclickdrag, L, 1360, 184, 1360, 334, 50
			break
		}
	}
		
	
	
	Loop
	{
		imagesearch, 휴대폰선택x, 휴대폰선택y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\휴대폰선택.png
		if(errorlevel=0)
		{
			mouseclick, L, 휴대폰선택x, 휴대폰선택y
			break
		}
	}
	
	Loop
	{
		imagesearch, 결제동의x, 결제동의y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\결제동의.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제동의x, 결제동의y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기x, 결제하기y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\결제하기.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기x, 결제하기y
			break
		}	
	}
	
	Loop
	{
		imagesearch, 결제하기2x, 결제하기2y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\휴대폰_결제하기1.png
		if(errorlevel=0)
		{
			mouseclick, L, 결제하기2x, 결제하기2y
			break
		}	
	}
	
	send,%폰번호%
	send,{tab}%비밀번호%
}
return


\::
{
	imagesearch, 확인버튼x, 확인버튼y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\확인버튼.png
	if(errorlevel=0)
		mouseclick, L, 확인버튼x, 확인버튼y
}
return

esc::
ExitApp

