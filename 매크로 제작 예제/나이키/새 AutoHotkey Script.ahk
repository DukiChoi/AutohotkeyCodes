#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


inputbox, site, 입력하세요,사이트주소를 복사 붙여넣기 해주세요,, 500, 200
if ErrorLevel
	msgbox, 취소
else
	expl:= comobjcreate("internetexplorer.application")
	expl.Visible := true
	expl.navigate(site)
	winwait, ahk_exe explorer.exe
	sleep, 300
	
	loop, 3
		send, !{SPACE}x{esc}
	
	
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
			loop
			{
				imagesearch, 수량x, 수량y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\1.png
				if(errorlevel=0)
				{
					mouseclick, L, 수량x, 수량y
					loop
					{
						imagesearch, 구매x, 구매y, 0, 0, a_screenwidth, a_screenheight, *1 %a_scriptdir%\세팅\구매하기.png
						if(errorlevel=0)
						{
							mouseclick, L, 구매x, 구매y
							break
						}
					}
					break
				}
			}
			break
		}
	}
	

	loop
	{

		imagesearch, 결제창x, 결제창y, 0, 0, a_screenwidth, a_screenheight, *5 %a_scriptdir%\세팅\주문서.png
		while errorlevel=0
		{
			mouseclick, L, 1358, 390
			imagesearch, vx, vy, 0, 0, a_screenwidth, a_screenheight, *5 %a_scriptdir%\세팅\결제방법.png
			if(errorlevel=0)
			{
				goto, 카드선택
				break
			}
		}					
	}

카드선택:
mousemove, vx, vy
msgbox, 해냇다
return