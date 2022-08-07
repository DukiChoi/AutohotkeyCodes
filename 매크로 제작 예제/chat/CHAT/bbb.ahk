; <COMPILER: v1.1.22.04>
WinMove,MapleStory,,0,0
WinGetPos, Xpos, Ypos, X_size, Y_size, MapleStory
Loop
{
ImageSearch, 1X, 1Y, 0, 0, %X_size%, %Y_size%, *transwhite *100 zzz.png
if errorlevel = 0
{
Loop 20
{
MouseClick, left, 257, 248, 2
sleep, 100
send, {enter}
MouseClick, left, 320, 333, 2
sleep, 100
send, {enter}
send, {WHEELUP}
}
}
sleep, 500
}