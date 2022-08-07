#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



F1::
loop
{
	mousegetpos, xp, yp
	mouseclick, L, xp, yp
}
return





f3::
Progress, b w200, My SubText, My MainText, My Title
Progress, 100
return

f4::
SplashImage, C:\Users\samsung\Pictures\icon_7.gif
return

f2::
Pause
return

esc::
ExitApp
