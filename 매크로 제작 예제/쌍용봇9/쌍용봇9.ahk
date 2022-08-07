#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#singleinstance off
;##########################################; Language       Korean
; Created by      쌍용
;##########################################
SetMouseDelay,0
msgbox,64,Made by,쌍용(usfm_story)
loop,30{
gui,%a_index%: color,white,E0FFFF
}
ttego:= a_index +1
winget,var,list
loop,%var%
{
vartemp:=var%A_Index%
wingettitle,title,ahk_id %vartemp%
SetFormat, Integer, H
winget, vb, pid, ahk_id %vartemp%
SetFormat, Integer, D
if title=
continue
count++
id%count%:=vartemp
list=%list%%title%|
}
stringreplace,list,list,|,||
ddl_=Ctrl||Delete|End|Pgdn|Pgup|Home|Insert|Shift|Space|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
ifexist, setting.txt
{
fileread,stringA,setting.txt
Stringsplit,sy,stringA,/
}
else{
resulte:=WinExista("ahk_class MapleStoryClass")
ifEqual,resulte,1,{
WinGetPos,X,Y,W,H,% "MapleStory"
fileappend,%W%/%H%,setting.txt
rcount=1
}
else ifEqual,resulte,0,{
Msgbox,52,오류,MapleStory 가 미실행중 입니다`n그래도 실행하겠습니까?
ifMsgbox,No
{
exitapp
}
}
}
gui,1: add,ddl,xp yp+5 h120 w180 vtitle,% list
gui,1: add,progress,xp yp+24 h2 w180 backgroundgray,0
gui,1: add,checkbox,xp yp+4 h20 w130 gch1 vch1,Auto Attack/Buff
gui,1: add,ddl,xp yp h120 w60 vlist1,% ddl_
gui,1: add,edit,xp+60 yp h20 w50 vdelay1 center,0
gui,1: add,checkbox,xp+50 yp h20 w50 vbf1,버프
gui,1: add,button,xp+50 yp h20 w20 gsetting1 vsetting1,...
guicontrol,hide,list1
guicontrol,hide,delay1
guicontrol,hide,bf1
count=2
loop,11{
gui,1: add,checkbox,xp-160 yp+20 h20 w130 gch%count% vch%count%,Auto Attack/Buff
gui,1: add,ddl,xp yp h120 w60 vlist%count%,% ddl_
gui,1: add,edit,xp+60 yp h20 w50 vdelay%count% center,0
gui,1: add,checkbox,xp+50 yp h20 w50 vbf%count%,버프
gui,1: add,button,xp+50 yp h20 w20 gsetting%count% vsetting%count%,...
guicontrol,hide,list%count%
guicontrol,hide,delay%count%
guicontrol,hide,bf%count%
count++
}
gui,1: add,progress,xp-160 yp+23 h2 w180 backgroundgray,0
gui,1: add,button,xp yp+3 h20 w180 gkhan,오토로그인
gui,1: add,button,xp yp+20 h20 w180 gplus_,부가기능
gui,1: show, ,% "쌍용봇 9."
gui,30: add,button,xp yp+4 h20 w150 gsmall,메이플 크기 줄이기
gui,30: add,button,xp yp+20 h20 w150 gbig,메이플 크기 늘리기
gui,30: add,progress,xp yp+23 h2 w150 backgroundgray,0
gui,30: add,button,xp yp+3 h20 w150 gtitlec,멀티로더 타이틀 바꾸기
gui,11: add,ddl,xp yp+5 h120 w200 vtitlelist,% list
gui,11: add,edit,xp yp+21 h20 w200 vnewname cblue,바꿀이름
gui,11: add,progress,xp yp+23 h2 w200 backgroundgray,0
gui,11: add,button,xp yp+3 h20 w200 gchange_,바꾸기
gui,20: add,text,xp yp+10 h20 w40,인식률
gui,20: add,slider, xp+40 yp-7 h25 w170 range1000-20000 tooltip vdelay,10000
gui,20: add,text,xp-40 yp+25 h20 w215 cblue,※인식률이 낮을수록 인식이 빠릅니다.
gui,20: add,progress,xp yp+23 h2 w215 backgroundgray,0
gui,20: add,text,xp yp+5 h20 w100 cred,[로그인 설정]
gui,20: add,text,xp yp+23 h20 w70,1차 비밀번호
gui,20: add,edit,xp+95 yp-4 h20 w110 password* v1cpw,
gui,20: add,text,xp-95 yp+23 h20 w70,2차 비밀번호
gui,20: add,edit,xp+95 yp-3 h20 w110 password* v2cpw,
gui,20: add,radio,xp-95 yp+23 h20 w200 vMapleID,메이플아이디 로그인
gui,20: add,radio,xp yp+20 h20 w200 vNexonID,넥슨이메일 로그인
gui,20: add,progress,xp yp+23 h2 w215 backgroundgray,0
gui,20: add,text,xp yp+5 h20 w71 cred,[체널 설정]
gui,20: add,text,xp yp+23 h20 w210 cblue,※최근에 접속했던 서버로 접속합니다.
gui,20: add,text,xp yp+23 h20 w90,접속할 채널선택
gui,20: add,ddl,xp+105 yp-3 h120 w100 vchanal,1채널||20세 채널|2채널|3채널|4채널|5채널|6채널|7채널|8채널|9채널|10채널|11채널|12채널|13채널|14채널|15채널|16채널|17채널|18채널|19채널
gui,20: add,text,xp-105 yp+23 h20 w90,접속할 캐릭터
gui,20: add,ddl,xp+105 yp-3 h120 w100 vcarac,1번째||2번째|3번째|4번째|5번째|6번째|7번째|8번째
gui,20: add,progress,xp-105 yp+23 h2 w215 backgroundgray,0
gui,20: add,text,xp yp+5 h20 w100 cred,[매크로 시작]
gui,20: add,button,xp yp+23 h19 w210 gstart, 시작/중지(F1)
gui,20: add,button,xp yp+20 h19 w210 gautotip,사용팁(안되시는분 필독)
gui,20: add,button,xp yp+20 h19 w210 g16_bit,해상도16Bit 로 변환하기
return

WinExista(targetclass){
ifwinexist, %targetclass%
{
return 1
}
else ifwinnotexist, %targetclass%
{
return 0
}
}
return

guiclose:
exitapp

plus_:
gui,30: show,,% "+"
return

titlec:
gui,11: show, ,% "+"
return

11guiclose:
gui,11: hide
return

change_:
gui,11: submit,nohide
winget,change_id,ID,% titlelist
winsettitle,ahk_id %change_id%,,%newname%
msgbox,52,Tip,쌍용봇을 재시작 하시겠습니까?
ifMsgbox,Yes
{
reload
}
return

30guiclose:
gui,30: hide
gui,30: color, white
return

small:
winmove,MapleStory,,0,0,200,200
return


big:
Stringsplit,sy,stringA,/
winmove,MapleStory,,0,0,% sy1,% sy2
return

ch1:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf1 = 1 ? "buff1" : "111" ),% (ch1 = 1 ? delay1 : "off" )
a1:= !a1
if (a1){
guicontrol,disable,setting1
ifEqual,bf1,1,{
gosub, buff1
}
}
Else{
guicontrol,enable,setting1
}
return

ch2:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf2 = 1 ? "buff2" : "222" ),% (ch2 = 1 ? delay2 : "off" )
a2:= !a2
if (a2){
guicontrol,disable,setting2
ifEqual,bf2,1,{
gosub, buff2
}
}
Else{
guicontrol,enable,setting2
}
return

ch3:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf3 = 1 ? "buff3" : "333" ),% (ch3 = 1 ? delay3 : "off" )
a3:= !a3
if (a3){
guicontrol,disable,setting3
ifEqual,bf3,1,{
gosub, buff3
}
}
Else{
guicontrol,enable,setting3
}
return

ch4:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf4 = 1 ? "buff4" : "444" ),% (ch4 = 1 ? delay4 : "off" )
a4:= !a4
if (a4){
guicontrol,disable,setting4
ifEqual,bf4,1,{
gosub, buff4
}
}
Else{
guicontrol,enable,setting4
}
return

ch5:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf5 = 1 ? "buff5" : "555" ),% (ch5 = 1 ? delay5 : "off" )
a5:= !a5
if (a5){
guicontrol,disable,setting5
ifEqual,bf5,1,{
gosub, buff5
}
}
Else{
guicontrol,enable,setting5
}
return

ch6:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf6 = 1 ? "buff6" : "666" ),% (ch6 = 1 ? delay6 : "off" )
a6:= !a6
if (a6){
guicontrol,disable,setting6
ifEqual,bf6,1,{
gosub, buff6
}
}
Else{
guicontrol,enable,setting6
}
return

ch7:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf7 = 1 ? "buff7" : "777" ),% (ch7 = 1 ? delay7 : "off" )
a7:= !a7
if (a7){
guicontrol,disable,setting7
ifEqual,bf7,1,{
gosub, buff7
}
}
Else{
guicontrol,enable,setting7
}
return

ch8:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf8 = 1 ? "buff8" : "888" ),% (ch8 = 1 ? delay8 : "off" )
a8:= !a8
if (a8){
guicontrol,disable,setting8
ifEqual,bf8,1,{
gosub, buff8
}
}
Else{
guicontrol,enable,setting8
}
return

ch9:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf9 = 1 ? "buff9" : "999" ),% (ch9 = 1 ? delay9 : "off" )
a9:= !a9
if (a9){
guicontrol,disable,setting9
ifEqual,bf9,1,{
gosub, buff9
}
}
Else{
guicontrol,enable,setting9
}
return

ch10:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf10 = 1 ? "buff10" : "101010" ),% (ch10 = 1 ? delay10 : "off" )
a10:= !a10
if (a10){
guicontrol,disable,setting10
ifEqual,bf10,1,{
gosub, buff10
}
}
Else{
guicontrol,enable,setting10
}
return

ch11:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf11 = 1 ? "buff11" : "111111" ),% (ch11 = 1 ? delay11 : "off" )
a11:= !a11
if (a11){
guicontrol,disable,setting11
ifEqual,bf11,1,{
gosub, buff11
}
}
Else{
guicontrol,enable,setting11
}
return

ch12:
gui,submit,nohide
gui,2: submit,nohide
settimer,% (bf12 = 1 ? "buff12" : "121212" ),% (ch12 = 1 ? delay12 : "off" )
a12:= !a12
if (a12){
guicontrol,disable,setting12
ifEqual,bf12,1,{
gosub, buff12
}
}
Else{
guicontrol,enable,setting12
}
return

111:
gui,2: submit,nohide
PostMsg(list1,title)
return

222:
gui,2: submit,nohide
PostMsg(list2,title)
return

333:
gui,2: submit,nohide
PostMsg(list3,title)
return

444:
gui,2: submit,nohide
PostMsg(list4,title)
return

555:
gui,2: submit,nohide
PostMsg(list5,title)
return

666:
gui,2: submit,nohide
PostMsg(list6,title)
return

777:
gui,2: submit,nohide
PostMsg(list7,title)
return

888:
gui,2: submit,nohide
PostMsg(list8,title)
return

999:
gui,2: submit,nohide
PostMsg(list9,title)
return

101010:
gui,2: submit,nohide
PostMsg(list10,title)
return

111111:
gui,2: submit,nohide
PostMsg(list11,title)
return

121212:
gui,2: submit,nohide
PostMsg(list12,title)
return

buff1:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list1,title)
return

buff2:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list2,title)
return

buff3:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list3,title)
return

buff4:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list4,title)
return

buff5:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list5,title)
return

buff6:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list6,title)
return

buff7:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list7,title)
return

buff8:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list8,title)
return

buff9:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list9,title)
return

buff10:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list10,title)
return

buff11:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list11,title)
return

buff12:
gui,1: submit, nohide
critical
sleep,700
PostMsg(list12,title)
return

PostMsg(key,Title1){
WinGet,Target_id,ID,% Title1
if(key="Ctrl"){
postmessage,0x100,17,1900545,,ahk_id %Target_id%
postmessage,0x101,17,1900545,,ahk_id %Target_id%
}
Else if(key="Delete"){
postmessage,0x100,46,22216705,,ahk_id %Target_id%
postmessage,0x101,46,22216705,,ahk_id %Target_id%
}
Else if(key="End"){
postmessage,0x100,35,21954561,,ahk_id %Target_id%
postmessage,0x101,35,21954561,,ahk_id %Target_id%
}
Else if(key="Pgdn"){
postmessage,0x100,34,22085633,,ahk_id %Target_id%
postmessage,0x101,34,22085633,,ahk_id %Target_id%
}
Else if(key="Pgup"){
postmessage,0x100,33,21561345,,ahk_id %Target_id%
postmessage,0x101,33,21561345,,ahk_id %Target_id%
}
Else if(key="Home"){
postmessage,0x100,36,21430273,,ahk_id %Target_id%
postmessage,0x101,36,21430273,,ahk_id %Target_id%
}
Else if(key="Insert"){
postmessage,0x100,45,22151169,,ahk_id %Target_id%
postmessage,0x101,45,22151169,,ahk_id %Target_id%
}
Else if(key="Shift"){
postmessage,0x100,16,2752513,,ahk_id %Target_id%
postmessage,0x101,16,2752513,,ahk_id %Target_id%
}
Else if(key="A"){
postmessage,0x100,65,1966081,,ahk_id %Target_id%
postmessage,0x101,65,1966081,,ahk_id %Target_id%
}
Else if(key="B"){
postmessage,0x100,66,3145729,,ahk_id %Target_id%
postmessage,0x101,66,3145729,,ahk_id %Target_id%
}
Else if(key="C"){
postmessage,0x100,67,3014657,,ahk_id %Target_id%
postmessage,0x101,67,3014657,,ahk_id %Target_id%
}
Else if(key="D"){
postmessage,0x100,68,2097153,,ahk_id %Target_id%
postmessage,0x101,68,2097153,,ahk_id %Target_id%
}
Else if(key="E"){
postmessage,0x100,69,1179649,,ahk_id %Target_id%
postmessage,0x101,69,1179649,,ahk_id %Target_id%
}
Else if(key="F"){
postmessage,0x100,70,2162689,,ahk_id %Target_id%
postmessage,0x101,70,2162689,,ahk_id %Target_id%
}
Else if(key="G"){
postmessage,0x100,71,2228225,,ahk_id %Target_id%
postmessage,0x101,71,2228225,,ahk_id %Target_id%
}
Else if(key="H"){
postmessage,0x100,72,2293761,,ahk_id %Target_id%
postmessage,0x101,72,2293761,,ahk_id %Target_id%
}
Else if(key="I"){
postmessage,0x100,73,1507329,,ahk_id %Target_id%
postmessage,0x101,73,1507329,,ahk_id %Target_id%
}
Else if(key="J"){
postmessage,0x100,74,2359297,,ahk_id %Target_id%
postmessage,0x101,74,2359297,,ahk_id %Target_id%
}
Else if(key="K"){
postmessage,0x100,75,2424833,,ahk_id %Target_id%
postmessage,0x101,75,2424833,,ahk_id %Target_id%
}
Else if(key="L"){
postmessage,0x100,76,2490369,,ahk_id %Target_id%
postmessage,0x101,76,2490369,,ahk_id %Target_id%
}
Else if(key="M"){
postmessage,0x100,77,3276801,,ahk_id %Target_id%
postmessage,0x101,77,3276801,,ahk_id %Target_id%
}
Else if(key="N"){
postmessage,0x100,78,3211265,,ahk_id %Target_id%
postmessage,0x101,78,3211265,,ahk_id %Target_id%
}
Else if(key="O"){
postmessage,0x100,79,1572865,,ahk_id %Target_id%
postmessage,0x101,79,1572865,,ahk_id %Target_id%
}
Else if(key="P"){
postmessage,0x100,80,1638401,,ahk_id %Target_id%
postmessage,0x101,80,1638401,,ahk_id %Target_id%
}
Else if(key="Q"){
postmessage,0x100,81,1048577,,ahk_id %Target_id%
postmessage,0x101,81,1048577,,ahk_id %Target_id%
}
Else if(key="R"){
postmessage,0x100,82,1245185,,ahk_id %Target_id%
postmessage,0x101,82,1245185,,ahk_id %Target_id%
}
Else if(key="S"){
postmessage,0x100,83,2031617,,ahk_id %Target_id%
postmessage,0x101,83,2031617,,ahk_id %Target_id%
}
Else if(key="T"){
postmessage,0x100,84,1310721,,ahk_id %Target_id%
postmessage,0x101,84,1310721,,ahk_id %Target_id%
}
Else if(key="U"){
postmessage,0x100,85,1441793,,ahk_id %Target_id%
postmessage,0x101,85,1441793,,ahk_id %Target_id%
}
Else if(key="V"){
postmessage,0x100,86,3080193,,ahk_id %Target_id%
postmessage,0x101,86,3080193,,ahk_id %Target_id%
}
Else if(key="W"){
postmessage,0x100,87,1114113,,ahk_id %Target_id%
postmessage,0x101,87,1114113,,ahk_id %Target_id%
}
Else if(key="X"){
postmessage,0x100,88,2949121,,ahk_id %Target_id%
postmessage,0x101,88,2949121,,ahk_id %Target_id%
}
Else if(key="Y"){
postmessage,0x100,89,1376257,,ahk_id %Target_id%
postmessage,0x101,89,1376257,,ahk_id %Target_id%
}
Else if(key="Z"){
postmessage,0x100,90,2883585,,ahk_id %Target_id%
postmessage,0x101,90,2883585,,ahk_id %Target_id%
}
Else if(key="Enter"){
postmessage,0x100,13,1835009,,ahk_id %Target_id%
postmessage,0x101,13,1835009,,ahk_id %Target_id%
}
Else if(key="Space"){
postmessage,0x100,32,3735553,,ahk_id %Target_id%
postmessage,0x101,32,3735553,,ahk_id %Target_id%
}
Else{
msgbox,48,오류,보내려는 키가 아직 함수 리스트에 없습니다
}
}
return



setting1:
k1:= !k1
if (k1){
guicontrol,hide,ch1
guicontrol,show,list1
guicontrol,show,delay1
guicontrol,show,bf1
}
else{
settimer,111,off
settimer,buff1,off
guicontrol,,ch1,0
guicontrol,show,ch1
guicontrol,hide,list1
guicontrol,hide,delay1
guicontrol,hide,bf1
}
return

setting2:
k2:= !k2
if (k2){
guicontrol,hide,ch2
guicontrol,show,list2
guicontrol,show,delay2
guicontrol,show,bf2
}
else{
settimer,222,off
settimer,buff2,off
guicontrol,,ch2,0
guicontrol,show,ch2
guicontrol,hide,list2
guicontrol,hide,delay2
guicontrol,hide,bf2
}
return

setting3:
k3:= !k3
if (k3){
guicontrol,hide,ch3
guicontrol,show,list3
guicontrol,show,delay3
guicontrol,show,bf3
}
else{
settimer,333,off
settimer,buff3,off
guicontrol,,ch3,0
guicontrol,show,ch3
guicontrol,hide,list3
guicontrol,hide,delay3
guicontrol,hide,bf3
}
return

setting4:
k4:= !k4
if (k4){
guicontrol,hide,ch4
guicontrol,show,list4
guicontrol,show,delay4
guicontrol,show,bf4
}
else{
settimer,444,off
settimer,buff4,off
guicontrol,,ch4,0
guicontrol,show,ch4
guicontrol,hide,list4
guicontrol,hide,delay4
guicontrol,hide,bf4
}
return

setting5:
k5:= !k5
if (k5){
guicontrol,hide,ch5
guicontrol,show,list5
guicontrol,show,delay5
guicontrol,show,bf5
}
else{
settimer,555,off
settimer,buff5,off
guicontrol,,ch5,0
guicontrol,show,ch5
guicontrol,hide,list5
guicontrol,hide,delay5
guicontrol,hide,bf5
}
return

setting6:
k6:= !k6
if (k6){
guicontrol,hide,ch6
guicontrol,show,list6
guicontrol,show,delay6
guicontrol,show,bf6
}
else{
settimer,666,off
settimer,buff6,off
guicontrol,,ch6,0
guicontrol,show,ch6
guicontrol,hide,list6
guicontrol,hide,delay6
guicontrol,hide,bf6
}
return

setting7:
k7:= !k7
if (k7){
guicontrol,hide,ch7
guicontrol,show,list7
guicontrol,show,delay7
guicontrol,show,bf7
}
else{
settimer,777,off
settimer,buff7,off
guicontrol,,ch7,0
guicontrol,show,ch7
guicontrol,hide,list7
guicontrol,hide,delay7
guicontrol,hide,bf7
}
return

setting8:
k8:= !k8
if (k8){
guicontrol,hide,ch8
guicontrol,show,list8
guicontrol,show,delay8
guicontrol,show,bf8
}
else{
settimer,888,off
settimer,buff8,off
guicontrol,,ch8,0
guicontrol,show,ch8
guicontrol,hide,list8
guicontrol,hide,delay8
guicontrol,hide,bf8
}
return

setting9:
k9:= !k9
if (k9){
guicontrol,hide,ch9
guicontrol,show,list9
guicontrol,show,delay9
guicontrol,show,bf9
}
else{
settimer,999,off
settimer,buff9,off
guicontrol,,ch9,0
guicontrol,show,ch9
guicontrol,hide,list9
guicontrol,hide,delay9
guicontrol,hide,bf9
}
return

setting10:
k10:= !k10
if (k10){
guicontrol,hide,ch10
guicontrol,show,list10
guicontrol,show,delay10
guicontrol,show,bf10
}
else{
settimer,101010,off
settimer,buff10,off
guicontrol,,ch10,0
guicontrol,show,ch10
guicontrol,hide,list10
guicontrol,hide,delay10
guicontrol,hide,bf10
}
return

setting11:
k11:= !k11
if (k11){
guicontrol,hide,ch11
guicontrol,show,list11
guicontrol,show,delay11
guicontrol,show,bf11
}
else{
settimer,111111,off
settimer,buff11,off
guicontrol,,ch11,0
guicontrol,show,ch11
guicontrol,hide,list11
guicontrol,hide,delay11
guicontrol,hide,bf11
}
return

setting12:
k12:= !k12
if (k12){
guicontrol,hide,ch12
guicontrol,show,list12
guicontrol,show,delay12
guicontrol,show,bf12
}
else{
settimer,121212,off
settimer,buff12,off
guicontrol,,ch12,0
guicontrol,show,ch12
guicontrol,hide,list12
guicontrol,hide,delay12
guicontrol,hide,bf12
}
return


khan:
gui,20: show,,% "Auto Login"
return

autotip:
msgbox,64,사용팁,
(
※ Win7/Win Vista 이신분들은 화면해상도를 16Bit로 바꿔주세요
※ 16Bit 는 (하이컬러/트루컬러)를 뜻합니다.
※ Win7/Win Vista 이신분들은 관리자 권한으로 실행해주세요.
※ 오토로그인은 버튼뿐만 아니라 F1으로도 ON/OFF 할수 있습니다.
)
return


20guiclose:
gui,20: hide
gui,20: color, white,E0FFFF
return


F1::
goto,start
return


start:
q:= !q
if (q){
gui,20: submit,nohide
settimer,Autolog,% delay
}
Else{
settimer,Autolog,off
}
return

Autolog:
gui,20: submit,nohide
gui,1: submit,nohide
winget,targetID,ID,% title
winactivate,ahk_id %TargetID%
sleep,200
mousemove, 4, 32
resulti:=imageS("전체",0,0,0,0,"image\팅김.png")
ifEqual,resulti,1,{
settimer,Autolog,off
resulto:=imageS("전체",0,0,0,0,"image\확인.png")
ifEqual,result0,1,{
send,{enter}
}
ifEqual,MapleID,1,MouseClick, left, 340, 289
ifEqual,NexonID,1,MouseClick, left, 439, 289
sleep,200
MouseClick, left, 303, 348
Clipboard=% 1cpw
ClipWait
send, ^v
sleep,100
send,{Enter}
ifEqual,NexonID,1,{
sleep, 400
mouseclick, left, 338, 353
Sleep, 300
Send, {Enter}
}
sleep, 500
resulth:=imageS("전체",0,0,0,0,"image\현접.png")
ifEqual,resulth,1,{
send,{Enter}
settimer,Autolog,off
settimer,현접,% 1000 * 30
return
}
sleep,800
send,{Enter}
sleep, 300
ifEqual,chanal,1채널,MouseClick, left, 267, 346
ifEqual,chanal,20세 패널,MouseClick, left, 340, 352
ifEqual,chanal,2채널,MouseClick, left, 401, 352
ifEqual,chanal,3채널,MouseClick, left, 489, 353
ifEqual,chanal,4채널,MouseClick, left, 527, 353
ifEqual,chanal,5채널,MouseClick, left,262, 385
ifEqual,chanal,6채널,MouseClick, left, 340, 382
ifEqual,chanal,7채널,MouseClick, left, 411, 382
ifEqual,chanal,8채널,MouseClick, left, 471, 382
ifEqual,chanal,9채널,MouseClick, left, 535, 382
ifEqual,chanal,10채널,MouseClick, left,285, 415
ifEqual,chanal,11채널,MouseClick, left, 334, 413
ifEqual,chanal,12채널,MouseClick, left, 405, 413
ifEqual,chanal,13채널,MouseClick, left, 479, 413
ifEqual,chanal,14채널,MouseClick, left, 546, 413
ifEqual,chanal,15채널,MouseClick, left, 268, 442
ifEqual,chanal,16채널,MouseClick, left, 339, 438
ifEqual,chanal,17채널,MouseClick, left, 403, 439
ifEqual,chanal,18채널,MouseClick, left, 470, 440
ifEqual,chanal,19채널,MouseClick, left, 535, 441
sleep,500
send,{Enter}
sleep,1000
ifEqual,carac,1번째,MouseClick, left, 140, 248
ifEqual,carac,2번째,MouseClick, left, 257, 242
ifEqual,carac,3번째,MouseClick, left, 380, 240
ifEqual,carac,4번째,MouseClick, left, 505, 240
ifEqual,carac,5번째,MouseClick, left, 127, 449
ifEqual,carac,6번째,MouseClick, left, 263, 449
ifEqual,carac,7번째,MouseClick, left, 385, 440
ifEqual,carac,8번째,MouseClick, left, 501, 434
sleep,200
send,{Enter}
Clipboard=% 2cpw
ClipWait
send, +{ins}
sleep,200
send,{Enter}
sleep,1000
settimer,Autolog,% delay
}
return



imageS(option,xprame1,yprame1,xprame2,yprame2,filename){
ifEqual,option,전체,{
imagesearch,px,py,0,0,A_ScreenWidth,A_ScreenHeight,*10 %filename%
ifEqual,ErrorLevel,0,{
return 1
}
Else ifEqual,ErrorLevel,1,{
return 0
}
}
Else ifEqual,option,부분,{
imagesearch,px,py,%xprame1%,%yprame1%,%xprame2%,%yprame2%,*10 %filename%
ifEqual,ErrorLevel,0,{
return 1
}
Else ifEqual,ErrorLevel,1,{
return 0
}
}
}
return



현접:
gui,20: submit,nohide
gui,1: submit,nohide
winget,targetID,ID,% title
winactivate,ahk_id %TargetID%
sleep,200
mousemove, 4, 32
resulti:=imageS("전체",0,0,0,0,"image\팅김.png")
ifEqual,resulti,1,{
settimer,현접,off
resulto:=imageS("전체",0,0,0,0,"image\확인.png")
ifEqual,result0,1,{
send,{enter}
}
ifEqual,MapleID,1,MouseClick, left, 340, 289
ifEqual,NexonID,1,MouseClick, left, 439, 289
sleep,200
MouseClick, left, 303, 348
Clipboard=% 1cpw
ClipWait
send, ^v
sleep,100
send,{Enter}
ifEqual,NexonID,1,{
sleep, 400
mouseclick, left, 338, 353
Sleep, 300
Send, {Enter}
}
sleep,500
resulth:=imageS("전체",0,0,0,0,"image\현접.png")
ifEqual,resulth,1,{
return
}
Else ifEqual,resulth,0,{
sleep,800
send,{Enter}
sleep, 300
ifEqual,chanal,1채널,MouseClick, left, 267, 346
ifEqual,chanal,20세 패널,MouseClick, left, 340, 352
ifEqual,chanal,2채널,MouseClick, left, 401, 352
ifEqual,chanal,3채널,MouseClick, left, 489, 353
ifEqual,chanal,4채널,MouseClick, left, 527, 353
ifEqual,chanal,5채널,MouseClick, left, 262, 385
ifEqual,chanal,6채널,MouseClick, left, 340, 382
ifEqual,chanal,7채널,MouseClick, left, 411, 382
ifEqual,chanal,8채널,MouseClick, left, 471, 382
ifEqual,chanal,9채널,MouseClick, left, 535, 382
ifEqual,chanal,10채널,MouseClick, left, 285, 415
ifEqual,chanal,11채널,MouseClick, left, 334, 413
ifEqual,chanal,12채널,MouseClick, left, 405, 413
ifEqual,chanal,13채널,MouseClick, left, 479, 413
ifEqual,chanal,14채널,MouseClick, left, 546, 413
ifEqual,chanal,15채널,MouseClick, left, 268, 442
ifEqual,chanal,16채널,MouseClick, left, 339, 438
ifEqual,chanal,17채널,MouseClick, left, 403, 439
ifEqual,chanal,18채널,MouseClick, left, 470, 440
ifEqual,chanal,19채널,MouseClick, left, 535, 441
sleep,500
send,{Enter}
sleep,1000
ifEqual,carac,1번째,MouseClick, left, 140, 248
ifEqual,carac,2번째,MouseClick, left, 257, 242
ifEqual,carac,3번째,MouseClick, left, 380, 240
ifEqual,carac,4번째,MouseClick, left, 505, 240
ifEqual,carac,5번째,MouseClick, left, 127, 449
ifEqual,carac,6번째,MouseClick, left, 263, 449
ifEqual,carac,7번째,MouseClick, left, 385, 440
ifEqual,carac,8번째,MouseClick, left, 501, 434
sleep,200
send,{Enter}
Clipboard=% 2cpw
ClipWait
send, +{ins}
sleep,200
send,{Enter}
sleep,1000
settimer,현접,% 1000 * 30
}
}
return

16_Bit:
F6::
result:=CurrentDisplaySettings(in=0)
StringSplit,vinfo,result,/
if vinfo3=32
{
change:=ChangeDisplaySettings(vinfo1,vinfo2,16,vinfo4)
return
}
if vinfo3=16
{
Msgbox,48,오류,이미 16Bit 입니다
return
}
return

CurrentDisplaySettings(in=0) { ; 1=width 2=height 3=quality 4=frequency
VarSetCapacity(device_mode,156,0),NumPut(156,2,&device_mode,36)
success := DllCall("EnumDisplaySettings","uint",0,"uint",-1,"uint",&device_mode)
Out_1:=NumGet(&device_mode,108,"uint4") ;width
Out_2:=NumGet(&device_mode,112,"uint4") ;height
Out_3:=NumGet(&device_mode,104,"uint4") ;quality
Out_4:=NumGet(&device_mode,120,"uint4") ;frequency
if in = 0
Return Out_1 "/" Out_2 "/" Out_3 "/" Out_4
else Return (Out_%in%)
}

ChangeDisplaySettings(Wp,Hp,Bit,Hz) { ; width,height,quality,frequency
VarSetCapacity(dM,156,0),NumPut(156,2,&dM,36)
DllCall("EnumDisplaySettings",UInt,0,UInt,-1,UInt,&dM),NumPut(0x5c0000,dM,40)
NumPut(Bit,dM,104),NumPut(Wp,dM,108),NumPut(Hp,dM,112),NumPut(Hz,dM,120)
Return DllCall("ChangeDisplaySettings",UInt,&dM,UInt,0)
} ; ChangeDisplaySettings(Wp,Hp,Bit,Hz)                                   ;&lt;&lt;이건 오사사에서 퍼왔응
return