#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F7::
loop,32
{
iniread, 위치x, 1.ini, 위치좌표x, K%a_index%
iniread, 위치y, 1.ini, 위치좌표y, K%a_index% 
iniread, 왼쪽위x, 1.ini, 위모서리x, K%a_index%
iniread, 왼쪽위y, 1.ini, 위모서리y, K%a_index%
iniread, 오른쪽아래x, 1.ini, 아래모서리x, K%a_index%
iniread, 오른쪽아래y, 1.ini, 아래모서리y, K%a_index%
mousemove, 왼쪽위x, 왼쪽위y
sleep,200
mousemove, 위치x, 위치y
sleep,200
mousemove, 오른쪽아래x, 오른쪽아래y
sleep,200
}

F8::
imagesearch, A, B, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\메소.bmp
if(errorlevel=0)
	mousemove, A, B
return


F1:: ;x축 위모서리x
a:=441
loop, 128
{
	if(mod(a_index,32)=1&&a_index!=1)
		a:=a+36*4
	if(mod(a_index,4)=1)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(mod(a_index,4)=2)
	{
		b:=a+36
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(mod(a_index,4)=3)
	{
		c:=a+72
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(mod(a_index,4)=0)
	{
		d:=a+108
		send, K%a_index%=%d%
		send, {enter}
	}
}
msgbox, 끝
return

F2:: ;y축 위모서리y
a:=398
loop,128
{
	if(0<mod(a_index,32) and mod(a_index,32)<=4)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(4<mod(a_index,32) and mod(a_index,32)<=8)
	{
		b:=a+35
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(8<mod(a_index,32) and mod(a_index,32)<=12)
	{
		c:=a+70
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(12<mod(a_index,32) and mod(a_index,32)<=16)
	{
		d:=a+105
		send, K%a_index%=%d%
		send, {enter}
	}
	else if(16<mod(a_index,32) and mod(a_index,32)<=20)
	{
		e:=a+140
		send, K%a_index%=%e%
		send, {enter}
	}
	else if(20<mod(a_index,32) and mod(a_index,32)<=24)
	{
		f:=a+175
		send, K%a_index%=%f%
		send, {enter}
	}
	else if(24<mod(a_index,32) and mod(a_index,32)<=28)
	{
		g:=a+210
		send, K%a_index%=%g%
		send, {enter}
	}
	else if(28<mod(a_index,32)&&mod(a_index,32)||mod(a_index,32)=0 )
	{
		h:=a+245
		send, K%a_index%=%h%
		send, {enter}
	}
}
msgbox, 끝
return

F3:: ;x축 아래모서리x
a:=441+36
loop, 128
{
	if(mod(a_index,32)=1&&a_index!=1)
		a:=a+36*4
	if(mod(a_index,4)=1)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(mod(a_index,4)=2)
	{
		b:=a+36
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(mod(a_index,4)=3)
	{
		c:=a+72
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(mod(a_index,4)=0)
	{
		d:=a+108
		send, K%a_index%=%d%
		send, {enter}
	}
}
msgbox, 끝
return

F4:: ;y축 아래 모서리
a:=398+35
loop,128
{
	if(0<mod(a_index,32) and mod(a_index,32)<=4)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(4<mod(a_index,32) and mod(a_index,32)<=8)
	{
		b:=a+35
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(8<mod(a_index,32) and mod(a_index,32)<=12)
	{
		c:=a+70
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(12<mod(a_index,32) and mod(a_index,32)<=16)
	{
		d:=a+105
		send, K%a_index%=%d%
		send, {enter}
	}
	else if(16<mod(a_index,32) and mod(a_index,32)<=20)
	{
		e:=a+140
		send, K%a_index%=%e%
		send, {enter}
	}
	else if(20<mod(a_index,32) and mod(a_index,32)<=24)
	{
		f:=a+175
		send, K%a_index%=%f%
		send, {enter}
	}
	else if(24<mod(a_index,32) and mod(a_index,32)<=28)
	{
		g:=a+210
		send, K%a_index%=%g%
		send, {enter}
	}
	else if(28<mod(a_index,32)&&mod(a_index,32)||mod(a_index,32)=0 )
	{
		h:=a+245
		send, K%a_index%=%h%
		send, {enter}
	}
}
msgbox, 끝
return

F5:: ;위치좌표x
a:=441+18
loop, 128
{
	if(mod(a_index,32)=1&&a_index!=1)
		a:=a+36*4
	if(mod(a_index,4)=1)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(mod(a_index,4)=2)
	{
		b:=a+36
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(mod(a_index,4)=3)
	{
		c:=a+72
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(mod(a_index,4)=0)
	{
		d:=a+108
		send, K%a_index%=%d%
		send, {enter}
	}
}
msgbox, 끝
return

F6:: ;위치좌표y
a:=398+17
loop,128
{
	if(0<mod(a_index,32) and mod(a_index,32)<=4)
	{
		send, K%a_index%=%a%
		send, {enter}
	}
	else if(4<mod(a_index,32) and mod(a_index,32)<=8)
	{
		b:=a+35
		send, K%a_index%=%b%
		send, {enter}
	}
	else if(8<mod(a_index,32) and mod(a_index,32)<=12)
	{
		c:=a+70
		send, K%a_index%=%c%
		send, {enter}
	}
	else if(12<mod(a_index,32) and mod(a_index,32)<=16)
	{
		d:=a+105
		send, K%a_index%=%d%
		send, {enter}
	}
	else if(16<mod(a_index,32) and mod(a_index,32)<=20)
	{
		e:=a+140
		send, K%a_index%=%e%
		send, {enter}
	}
	else if(20<mod(a_index,32) and mod(a_index,32)<=24)
	{
		f:=a+175
		send, K%a_index%=%f%
		send, {enter}
	}
	else if(24<mod(a_index,32) and mod(a_index,32)<=28)
	{
		g:=a+210
		send, K%a_index%=%g%
		send, {enter}
	}
	else if(28<mod(a_index,32)&&mod(a_index,32)||mod(a_index,32)=0 )
	{
		h:=a+245
		send, K%a_index%=%h%
		send, {enter}
	}
}
msgbox, 끝
return
