#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

1::

imagesearch, x, y, 0, 0, a_screenwidth-1, a_screenheight-1, *Transblack %a_scriptdir%\잠재옵션.bmp
if(errorlevel=0)
{
	mousemove, x, y
	msgbox, 성공
}

if(errorlevel=1)
	msgbox, 실패
return