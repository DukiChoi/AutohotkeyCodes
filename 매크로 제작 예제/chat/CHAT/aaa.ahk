; <COMPILER: v1.1.22.04>
Menu, Tray, Nostandard
title=my program
gui, color, FFFFFF
gui, -caption +border
Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Text, x0 y26 w80 h20 +Center , chat:
Gui, Add, Text, x0 y66 w80 h20 +Center , chat:
gui, add, text, x0 y0 w600 h30 gbar,
Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Edit, x62 y20 w450 h30    vedit1, 0
Gui, Add, Edit, x62 y60 w450 h30    vedit2, 0
gui, add, text, x200 y155 w500 h100 gexit, EXIT APP (F4)
Gui, Font, S12 CDefault Bold, Verdana
gui, add, text, x25 y110 w600 h40 , start : ctrl+F1      stop : ctrl+F2      reload : ctrl+F3
Gui, Font, S10 CDefault Bold, Verdana
msgbox, start...!
Gui, Show, x474 y188 h185 w524, % title
Menu, tray, add, open, a
Menu, tray, add, hi, b 
Menu, tray, add, exit, c


F6::
imagesearch, vx, vy, 0, 0, a_screenwidth, a_screenheight, %a_scriptdir%\silhum.png
if(errorlevel=0)
	mousemove, vx, vy
return

F5::
coordmode, mouse, screen
mousemove, 988, 581
return

a:
winshow, % title
return

b:
return

c:
ExitApp
return



WinMove,MapleStory,,0,0
WinGetPos, Xpos, Ypos, X_size, Y_size, MapleStory
run, set.exe




bar:
PostMessage,0xA1,2,,,A
return

exit:
SoundBeep
winhide, % title
return

F4::
SoundBeep
ExitApp
return
^F1::
Loop
{
chat:
gui, submit, nohide
send, {enter}
gui, submit, nohide
Clipboard= %edit1%
ClipWait
send, ^v
sleep, 100
send, {enter}
sleep, 1000
gui, submit, nohide
send, {enter}
gui, submit, nohide
Clipboard= %edit2%
ClipWait
send, ^v
sleep, 100
send, {enter}
sleep, 1000
}
return
^F2::
SoundBeep
Pause
return
^F3::
SoundBeep
Reload
return

Guiclose:
ExitApp