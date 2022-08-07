#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F7::
loop,1
{
iniread, 위치x, 아이템위치.ini, 위치좌표x, K%a_index%
iniread, 위치y, 아이템위치.ini, 위치좌표y, K%a_index% 
iniread, 왼쪽위x, 아이템위치.ini, 위모서리x, K%a_index%
iniread, 왼쪽위y, 아이템위치.ini, 위모서리y, K%a_index%
iniread, 오른쪽아래x, 아이템위치.ini, 아래모서리x, K%a_index%
iniread, 오른쪽아래y, 아이템위치.ini, 아래모서리y, K%a_index%
mousemove, 왼쪽위x, 왼쪽위y
sleep,200
mousemove, 위치x, 위치y
sleep,200
mousemove, 오른쪽아래x, 오른쪽아래y
sleep,200
}

1::
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
			iniwrite, %a%, 아이템위치.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, 아이템위치.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, 아이템위치.ini, 아래모서리x, K%a_index%
		}
		else if(mod(a_index,4)=2)
		{
			a:=x+36
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, 아이템위치.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, 아이템위치.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, 아이템위치.ini, 아래모서리x, K%a_index%

		}
		else if(mod(a_index,4)=3)
		{
			a:=x+72
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, 아이템위치.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, 아이템위치.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, 아이템위치.ini, 아래모서리x, K%a_index%
		}
		else if(mod(a_index,4)=0)
		{
			a:=x+108
			a2:=a+18
			a3:=a+36
			iniwrite, %a%, 아이템위치.ini, 위모서리x, K%a_index%
			iniwrite, %a2%, 아이템위치.ini, 위치좌표x, K%a_index%
			iniwrite, %a3%, 아이템위치.ini, 아래모서리x, K%a_index%
		}
	}
	
	loop,128
	{
		if(0<mod(a_index,32) and mod(a_index,32)<=4)
		{
			b:=y
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(4<mod(a_index,32) and mod(a_index,32)<=8)
		{
			b:=y+35
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(8<mod(a_index,32) and mod(a_index,32)<=12)
		{
			b:=y+70
			b1:=b+17
			b2:=b+35		
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(12<mod(a_index,32) and mod(a_index,32)<=16)
		{
			b:=y+105
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(16<mod(a_index,32) and mod(a_index,32)<=20)
		{
			b:=y+140
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(20<mod(a_index,32) and mod(a_index,32)<=24)
		{
			b:=y+175
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(24<mod(a_index,32) and mod(a_index,32)<=28)
		{
			b:=y+210
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
		else if(28<mod(a_index,32)&&mod(a_index,32)||mod(a_index,32)=0 )
		{
			b:=y+245
			b1:=b+17
			b2:=b+35
			iniwrite, %b%, 아이템위치.ini, 위모서리y,K%a_index%
			iniwrite, %b1%, 아이템위치.ini, 위치좌표y, K%a_index%
			iniwrite, %b2%, 아이템위치.ini, 아래모서리y, K%a_index%
		}
	}
}
msgbox, 끝
return


