#NoEnv
#SingleInstance Force
SendMode Input
WinSetTitle, Legend of Darkness, , �༳�� ��ȣ
ID := WinExist("�༳�� ��ȣ")


IniRead, OP01, Save.ini, ��ȣ����, 01
IniRead, OP02, Save.ini, ��ȣ����, 02
IniRead, OP03, Save.ini, ��ȣ����, 03
IniRead, OP04, Save.ini, ��ȣ����, 04
IniRead, OP05, Save.ini, ��ȣ����, 05
IniRead, OP06, Save.ini, ��ȣ����, 06
IniRead, CH01, Save.ini, ������, 01
IniRead, CH02, Save.ini, ������, 02
IniRead, TeleportMove, Save.ini, �̵�����, 01
IniRead, Hotkey01, Save.ini, �̵�����, 02
IniRead, SP, Save.ini, �̵�����, 03
IniRead, ST, Save.ini, �̵�����, 04
IniRead, SM01, Save.ini, ���ݼ���, 01
IniRead, Hotkey02, Save.ini, ���ݼ���, 02
IniRead, SM02, Save.ini, ���ݼ���, 03
IniRead, SM03, Save.ini, ���ݼ���, 04
IniRead, SM04, Save.ini, ���ݼ���, 05
IniRead, SM05, Save.ini, ���ݼ���, 06
IniRead, SS, Save.ini, ���ݼ���, 07
IniRead, DM01, Save.ini, ��ȣ��������, 01
IniRead, DM02, Save.ini, ��ȣ��������, 02
IniRead, DM03, Save.ini, ��ȣ��������, 03
IniRead, DM04, Save.ini, ��ȣ��������, 04
IniRead, DM05, Save.ini, ��ȣ��������, 05
IniRead, DM06, Save.ini, ��ȣ��������, 06
IniRead, DM07, Save.ini, ��ȣ��������, 07
IniRead, DM08, Save.ini, ��ȣ��������, 08
IniRead, DM09, Save.ini, ��ȣ��������, 09
IniRead, DM10, Save.ini, ��ȣ��������, 10
IniRead, DM11, Save.ini, ��ȣ��������, 11
IniRead, DM12, Save.ini, ��ȣ��������, 12
IniRead, DM13, Save.ini, ��ȣ��������, 13
IniRead, DM14, Save.ini, ��ȣ��������, 14
IniRead, DM15, Save.ini, ��ȣ��������, 15
IniRead, DM16, Save.ini, ��ȣ��������, 16
IniRead, DM17, Save.ini, ��ȣ��������, 17
IniRead, DM18, Save.ini, ��ȣ��������, 18
IniRead, DM19, Save.ini, ��ȣ��������, 19
IniRead, DM20, Save.ini, ��ȣ��������, 20
IniRead, NP01, Save.ini, ���μ���, 01
IniRead, NP02, Save.ini, ���μ���, 02
IniRead, NP03, Save.ini, ���μ���, 03
IniRead, NP04, Save.ini, ���μ���, 04
IniRead, NP05, Save.ini, ���μ���, 05
IniRead, NP06, Save.ini, ���μ���, 06
IniRead, NP07, Save.ini, ���μ���, 07
IniRead, PosX1, Save.ini, ��ǥ����, X01
IniRead, PosX2, Save.ini, ��ǥ����, X02
IniRead, PosX3, Save.ini, ��ǥ����, X03
IniRead, PosX4, Save.ini, ��ǥ����, X04
IniRead, PosX5, Save.ini, ��ǥ����, X05
IniRead, PosX6, Save.ini, ��ǥ����, X06
IniRead, PosX7, Save.ini, ��ǥ����, X07
IniRead, PosX8, Save.ini, ��ǥ����, X08
IniRead, PosX9, Save.ini, ��ǥ����, X09
IniRead, PosX10, Save.ini, ��ǥ����, X10
IniRead, PosX11, Save.ini, ��ǥ����, X11
IniRead, PosX12, Save.ini, ��ǥ����, X12
IniRead, PosX13, Save.ini, ��ǥ����, X13
IniRead, PosX14, Save.ini, ��ǥ����, X14
IniRead, PosX15, Save.ini, ��ǥ����, X15
IniRead, PosX16, Save.ini, ��ǥ����, X16
IniRead, PosX17, Save.ini, ��ǥ����, X17
IniRead, PosX18, Save.ini, ��ǥ����, X18
IniRead, PosX19, Save.ini, ��ǥ����, X19
IniRead, PosX20, Save.ini, ��ǥ����, X20
IniRead, PosX21, Save.ini, ��ǥ����, X21
IniRead, PosX22, Save.ini, ��ǥ����, X22
IniRead, PosX23, Save.ini, ��ǥ����, X23
IniRead, PosX24, Save.ini, ��ǥ����, X24
IniRead, PosX25, Save.ini, ��ǥ����, X25
IniRead, PosX26, Save.ini, ��ǥ����, X26
IniRead, PosY1, Save.ini, ��ǥ����, Y01
IniRead, PosY2, Save.ini, ��ǥ����, Y02
IniRead, PosY3, Save.ini, ��ǥ����, Y03
IniRead, PosY4, Save.ini, ��ǥ����, Y04
IniRead, PosY5, Save.ini, ��ǥ����, Y05
IniRead, PosY6, Save.ini, ��ǥ����, Y06
IniRead, PosY7, Save.ini, ��ǥ����, Y07
IniRead, PosY8, Save.ini, ��ǥ����, Y08
IniRead, PosY9, Save.ini, ��ǥ����, Y09
IniRead, PosY10, Save.ini, ��ǥ����, Y10
IniRead, PosY11, Save.ini, ��ǥ����, Y11
IniRead, PosY12, Save.ini, ��ǥ����, Y12
IniRead, PosY13, Save.ini, ��ǥ����, Y13
IniRead, PosY14, Save.ini, ��ǥ����, Y14
IniRead, PosY15, Save.ini, ��ǥ����, Y15
IniRead, PosY16, Save.ini, ��ǥ����, Y16
IniRead, PosY17, Save.ini, ��ǥ����, Y17
IniRead, PosY18, Save.ini, ��ǥ����, Y18
IniRead, PosY19, Save.ini, ��ǥ����, Y19
IniRead, PosY20, Save.ini, ��ǥ����, Y20
IniRead, PosY21, Save.ini, ��ǥ����, Y21
IniRead, PosY22, Save.ini, ��ǥ����, Y22
IniRead, PosY23, Save.ini, ��ǥ����, Y23
IniRead, PosY24, Save.ini, ��ǥ����, Y24
IniRead, PosY25, Save.ini, ��ǥ����, Y25
IniRead, PosY26, Save.ini, ��ǥ����, Y26
IniRead, UserRepeat, Save.ini, �ݺ�����, Repeat
Setting01 = 0
Setting02 = 0
Menu, Tray, NoStandard
Menu, Tray, DeleteAll
Menu, Tray, Tip, �༳ �߽���
Gui, 1:Color, FFCCCC
Gui, 1:Add, GroupBox, x10 y10 w90 h200, ��ȣ
Gui, 1:Add, CheckBox, xp+10 yp+20 Checked%OP01% cRed vOP01, �ڵ���ȣ
Gui, 1:Add, CheckBox, xp yp+20 Checked%OP02% vOP02, �ڵ�Ŭ��
Gui, 1:Add, CheckBox, xp yp+20 Checked%OP03% vOP03, ��ɸ��
Gui, 1:Add, CheckBox, xp yp+20 Checked%OP04% vOP04, �������
Gui, 1:Add, CheckBox, xp yp+20 Checked%OP05% vOP05, �׷���
Gui, 1:Add, CheckBox, xp yp+20 Checked%OP06% vOP06, �׷����
Gui, 1:Add, Button, xp+5 yp+20 gDetail, ���μ���
Gui, 1:Add, Button, xp yp+30 w60 h20 gApply, ����
Gui, 1:Add, GroupBox, x110 y10 w100 h65, ��
Gui, 1:Add, Radio, xp+10 yp+20 Group Checked%CH01% vCH01, Ȧ������
Gui, 1:Add, Radio, xp yp+20 Checked%CH02% vCH02, ��������
Gui, 1:Add, GroupBox, x110 y85 w100 h125, �̵�
Gui, 1:Add, CheckBox, xp+10 yp+20 Checked%TeleportMove% cRed vTeleportMove, ���� ���
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Text, xp yp+30, ��ȣ
Gui, 1:Add, Text, xp yp+25, ȭ��
Gui, 1:Add, Hotkey, xp+30 yp-58 w30 h20 vHotkey01, %Hotkey01%
Gui, 1:Add, DDL, xp yp+28 w40 h100 vSP, %SP%||1|2|3|4|5|6|7|8|9|0|-|=
Gui, 1:Add, DDL, xp yp+25 w50 h60 vST, %ST%||���|����
Gui, 1:Add, GroupBox, x220 y10 w100 h200, ����
Gui, 1:Add, CheckBox, xp+10 yp+20 Checked%SM01% cRed vSM01, ���ְ���
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Text, xp yp+30, ����
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Text, xp yp+25, ����
Gui, 1:Add, Hotkey, xp+30 y52 w30 h20 vHotkey02, %Hotkey02%
Gui, 1:Add, DDL, xp yp+28 w40 h100 vSM02, %SM02%||1|2|3|4|5|6|7|8|9|0|-|=
Gui, 1:Add, DDL, xp yp+25 wp h100 vSM03, %SM03%||1|2|3|4|5|6|7|8|9|0|-|=
Gui, 1:Add, DDL, xp yp+25 wp h100 vSM04, %SM04%||1|2|3|4|5|6|7|8|9|0|-|=
Gui, 1:Add, DDL, xp yp+25 wp h100 vSM05, %SM05%||1|2|3|4|5|6|7|8|9|0|-|=
Gui, 1:Add, DDL, xp yp+25 w50 h60 vSS, %SS%||����|����
Gui, 1:Add, GroupBox, x330 y10 w90 h200, ����
Gui, 1:Add, CheckBox, xp+10 yp+20 Checked%NP01% cRed vNP01, ���λ��
Gui, 1:Add, Text, xp+15 yp+20, ��
Gui, 1:Add, Button, xp+10 yp w40 h20 gDestination, ��ǥ
Gui, 1:Add, Radio, xp-25 yp+30 Group Checked%NP02% vNP02, �ٵ�
Gui, 1:Add, Radio, xp yp+20 Checked%NP03% vNP03, ��ȯ��
Gui, 1:Add, CheckBox, xp yp+20 Checked%NP04% vNP04, �ڸ� ����
Gui, 1:Add, CheckBox, xp yp+20 Checked%NP05% vNP05, �����ȣ
Gui, 1:Add, CheckBox, xp yp+20 Checked%NP06% vNP06, ��ġ��ȣ
Gui, 1:Add, Button, xp yp+20 w70 h20 gSubSetting, �ΰ�����
Gui, 2:Color, FFCCCC
Gui, 2:Add, GroupBox, x10 y5 w185 h265, ����
Gui, 2:Add, CheckBox, xp+10 yp+20 Checked%DM01% vDM01, �ڸ� �˸�
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM02% vDM02, ���� �ǵ�
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM03% vDM03, ���� �̵�
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM04% vDM04, ���� ����
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM05% vDM05, ���� ��
Gui, 2:Add, CheckBox, xp yp+30 Checked%DM06% vDM06, ��ҷ縶
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM07% vDM07, �𳪸��ݸ�
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM08% vDM08, �Ϸ�޳�
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM09% vDM09, �𺣳��
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM10% vDM10, ��������
Gui, 2:Add, CheckBox, x110 y25 Checked%DM11% vDM11, Ȧ��ť��
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM12% vDM12, �������
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM13% vDM13, ������ī
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM14% vDM14, ��ٸ���
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM15% vDM15, ����
Gui, 2:Add, CheckBox, xp yp+30 Checked%DM16% vDM16, �̸�Ż
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM17% vDM17, ���÷���
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM18% vDM18, ��������
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM19% vDM19, ȣ����
Gui, 2:Add, CheckBox, xp yp+20 Checked%DM20% vDM20, �ݶ�
Gui, 2:Add, Button, x20 yp+25 w165 h20 gDetailClose, �ݱ�
Gui, 3:Color, FFCCCC
Gui, 3:Add, GroupBox, x10 y10 w420 h260, �̵���ǥ
Gui, 3:Add, Text, x50 y35, X
Gui, 3:Add, Text, xp-30 yp+25, 01
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX1
Gui, 3:Add, Text, xp-20 yp+35, 02
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX2
Gui, 3:Add, Text, xp-20 yp+35, 03
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX3
Gui, 3:Add, Text, xp-20 yp+35, 04
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX4
Gui, 3:Add, Text, xp-20 yp+35, 05
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX5
Gui, 3:Add, Text, xp-20 yp+35, 06
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX6
Gui, 3:Add, Text, xp-20 yp+35, 07
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX7
Gui, 3:Add, Text, x90 y35, Y
Gui, 3:Add, Edit, xp-10 yp+20 w30 h20 vPosY1
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY2
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY3
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY4
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY5
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY6
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY7
Gui, 3:Add, Text, x150 y35, X
Gui, 3:Add, Text, xp-30 yp+25, 08
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX8
Gui, 3:Add, Text, xp-20 yp+35, 09
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX9
Gui, 3:Add, Text, xp-20 yp+35, 10
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX10
Gui, 3:Add, Text, xp-20 yp+35, 11
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX11
Gui, 3:Add, Text, xp-20 yp+35, 12
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX12
Gui, 3:Add, Text, xp-20 yp+35, 13
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX13
Gui, 3:Add, Text, xp-20 yp+35, 14
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX14
Gui, 3:Add, Text, x190 y35, Y
Gui, 3:Add, Edit, xp-10 yp+20 w30 h20 vPosY8
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY9
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY10
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY11
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY12
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY13
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY14
Gui, 3:Add, Text, x250 y35, X
Gui, 3:Add, Text, xp-30 yp+25, 15
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX15
Gui, 3:Add, Text, xp-20 yp+35, 16
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX16
Gui, 3:Add, Text, xp-20 yp+35, 17
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX17
Gui, 3:Add, Text, xp-20 yp+35, 18
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX18
Gui, 3:Add, Text, xp-20 yp+35, 19
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX19
Gui, 3:Add, Text, xp-20 yp+35, 20
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX20
Gui, 3:Add, Text, xp-20 yp+35, 21
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX21
Gui, 3:Add, Text, x290 y35, Y
Gui, 3:Add, Edit, xp-10 yp+20 w30 h20 vPosY15
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY16
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY17
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY18
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY19
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY20
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY21
Gui, 3:Add, Text, x350 y35, X
Gui, 3:Add, Text, xp-30 yp+25, 22
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX22
Gui, 3:Add, Text, xp-20 yp+35, 23
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX23
Gui, 3:Add, Text, xp-20 yp+35, 24
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX24
Gui, 3:Add, Text, xp-20 yp+35, 25
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX25
Gui, 3:Add, Text, xp-20 yp+35, 26
Gui, 3:Add, Edit, xp+20 yp-5 w30 h20 vPosX26
Gui, 3:Add, Text, xp-20 yp+35, ��ǥ ����
Gui, 3:Add, Edit, xp+60 yp-5 w30 h20 vUserRepeat
Gui, 3:Add, Text, x390 y35, Y
Gui, 3:Add, Edit, xp-10 yp+20 w30 h20 vPosY22
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY23
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY24
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY25
Gui, 3:Add, Edit, xp yp+30 wp hp vPosY26
Gui, 3:Add, Button, xp-40 yp+60 w70 h20 gDestinationSave, ����
Gui, 4:Color, FFCCCC
Gui, 4:Add, GroupBox, x10 y10 w170 h65, ���ἳ��
Gui, 4:Add, CheckBox, xp+10 yp+20 Checked%NP07% cRed vNP07, ���
Gui, 4:Add, Edit, xp+50 yp-5 w100 h20 vTime, 20150102153000
Gui, 4:Add, Text, xp-30 yp+30, EX) 2015.01.02.15.30.00
Gui, 4:Add, GroupBox, x10 y90 w170 h100, ��Ʈ��ũ
Gui, 4:Add, Text, xp+10 yp+20, Address :
Gui, 4:Add, Edit, xp+60 yp-5 w90 vNetworkAddress, 0.0.0.0
Gui, 4:Add, Text, xp-35 yp+35, Port :
Gui, 4:Add, Edit, xp+35 yp-5 w50 vNetworkPort, 8257
Gui, 4:Add, Button, xp-60 yp+30 w150 h20 gConnect, Connect
Gui, 4:Add, Button, x10 y200 w170 h20 gSubSettingClose, �ݱ�
Gui, 1:Show, x650 y350 w430 h225, �༳�� ��ȣ
Return

GuiClose:
Loop, 2
	WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
ExitApp

2GuiClose:
Loop, 2
	WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
ExitApp

3GuiClose:
Loop, 2
	WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
ExitApp

TrayDisconnect:
NormalClose()
Return

TrayExit:
Loop, 2
	WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
DllCall("Ws2_32\WSACleanup")
ExitApp

Detail:
{
	Gui, 1:Default
	Gui, 1:Submit, NoHide
	Gui, 2:Show, x650 y350 w205 h280, ���μ���
	Gui, 2:Default
}
Return

Destination:
{
	Gui, 1:Default
	Gui, 1:Submit, NoHide
	Gui, 3:Show, x650 y350 w440 h285, ��ǥ����
	Gui, 3:Default
}
Return

SubSetting:
{
	Gui, 1:Default
	Gui, 1:Submit, NoHide
	Gui, 4:Show, x650 y350 w190 h230, �ΰ�����
	Gui, 4:Default
}
Return

DetailClose:
{
	Gui, 2:Default
	Gui, 2:Submit, NoHide
	Gui, 2:Hide
	Gui, 1:Default
}
Return

DestinationSave:
{
	Gui, 3:Default
	Gui, 3:Submit, NoHide
	Gui, 3:Hide
	Gui, 1:Default
}
Return

SubSettingClose:
{
	Gui, 4:Default
	Gui, 4:Submit, NoHide
	Gui, 4:Hide
	Gui, 1:Default
}
Return

Connect:
{
	PrepareNetwork()
	NetworkStart()
}
Return

Apply:
{
	Gui, Submit, NoHide
	IF (Hotkey01=���� or Hotkey02=����)
	{
		MsgBox, 16, Error, Please register the Hotkey
		Exit
	}
	IniWrite, %OP01%, Save.ini, ��ȣ����, 01
	IniWrite, %OP02%, Save.ini, ��ȣ����, 02
	IniWrite, %OP03%, Save.ini, ��ȣ����, 03
	IniWrite, %OP04%, Save.ini, ��ȣ����, 04
	IniWrite, %OP05%, Save.ini, ��ȣ����, 05
	IniWrite, %OP06%, Save.ini, ��ȣ����, 06
	IniWrite, %CH01%, Save.ini, ������, 01
	IniWrite, %CH02%, Save.ini, ������, 02
	IniWrite, %TeleportMove%, Save.ini, �̵�����, 01
	IniWrite, %Hotkey01%, Save.ini, �̵�����, 02
	IniWrite, %SP%, Save.ini, �̵�����, 03
	IniWrite, %ST%, Save.ini, �̵�����, 04
	IniWrite, %SM01%, Save.ini, ���ݼ���, 01
	IniWrite, %Hotkey02%, Save.ini, ���ݼ���, 02
	IniWrite, %SM02%, Save.ini, ���ݼ���, 03
	IniWrite, %SM03%, Save.ini, ���ݼ���, 04
	IniWrite, %SM04%, Save.ini, ���ݼ���, 05
	IniWrite, %SM05%, Save.ini, ���ݼ���, 06
	IniWrite, %SS%, Save.ini, ���ݼ���, 07
	IniWrite, %DM01%, Save.ini, ��ȣ��������, 01
	IniWrite, %DM02%, Save.ini, ��ȣ��������, 02
	IniWrite, %DM03%, Save.ini, ��ȣ��������, 03
	IniWrite, %DM04%, Save.ini, ��ȣ��������, 04
	IniWrite, %DM05%, Save.ini, ��ȣ��������, 05
	IniWrite, %DM06%, Save.ini, ��ȣ��������, 06
	IniWrite, %DM07%, Save.ini, ��ȣ��������, 07
	IniWrite, %DM08%, Save.ini, ��ȣ��������, 08
	IniWrite, %DM09%, Save.ini, ��ȣ��������, 09
	IniWrite, %DM10%, Save.ini, ��ȣ��������, 10
	IniWrite, %DM11%, Save.ini, ��ȣ��������, 11
	IniWrite, %DM12%, Save.ini, ��ȣ��������, 12
	IniWrite, %DM13%, Save.ini, ��ȣ��������, 13
	IniWrite, %DM14%, Save.ini, ��ȣ��������, 14
	IniWrite, %DM15%, Save.ini, ��ȣ��������, 15
	IniWrite, %DM16%, Save.ini, ��ȣ��������, 16
	IniWrite, %DM17%, Save.ini, ��ȣ��������, 17
	IniWrite, %DM18%, Save.ini, ��ȣ��������, 18
	IniWrite, %DM19%, Save.ini, ��ȣ��������, 19
	IniWrite, %DM20%, Save.ini, ��ȣ��������, 20
	IniWrite, %NP01%, Save.ini, ���μ���, 01
	IniWrite, %NP02%, Save.ini, ���μ���, 02
	IniWrite, %NP03%, Save.ini, ���μ���, 03
	IniWrite, %NP04%, Save.ini, ���μ���, 04
	IniWrite, %NP05%, Save.ini, ���μ���, 05
	IniWrite, %NP06%, Save.ini, ���μ���, 06
	IniWrite, %NP07%, Save.ini, ���μ���, 07
	IniWrite, %PosX1%, Save.ini, ��ǥ����, X01
	IniWrite, %PosX2%, Save.ini, ��ǥ����, X02
	IniWrite, %PosX3%, Save.ini, ��ǥ����, X03
	IniWrite, %PosX4%, Save.ini, ��ǥ����, X04
	IniWrite, %PosX5%, Save.ini, ��ǥ����, X05
	IniWrite, %PosX6%, Save.ini, ��ǥ����, X06
	IniWrite, %PosX7%, Save.ini, ��ǥ����, X07
	IniWrite, %PosX8%, Save.ini, ��ǥ����, X08
	IniWrite, %PosX9%, Save.ini, ��ǥ����, X09
	IniWrite, %PosX10%, Save.ini, ��ǥ����, X10
	IniWrite, %PosX11%, Save.ini, ��ǥ����, X11
	IniWrite, %PosX12%, Save.ini, ��ǥ����, X12
	IniWrite, %PosX13%, Save.ini, ��ǥ����, X13
	IniWrite, %PosX14%, Save.ini, ��ǥ����, X14
	IniWrite, %PosX15%, Save.ini, ��ǥ����, X15
	IniWrite, %PosX16%, Save.ini, ��ǥ����, X16
	IniWrite, %PosX17%, Save.ini, ��ǥ����, X17
	IniWrite, %PosX18%, Save.ini, ��ǥ����, X18
	IniWrite, %PosX19%, Save.ini, ��ǥ����, X19
	IniWrite, %PosX20%, Save.ini, ��ǥ����, X20
	IniWrite, %PosX21%, Save.ini, ��ǥ����, X21
	IniWrite, %PosX22%, Save.ini, ��ǥ����, X22
	IniWrite, %PosX23%, Save.ini, ��ǥ����, X23
	IniWrite, %PosX24%, Save.ini, ��ǥ����, X24
	IniWrite, %PosX25%, Save.ini, ��ǥ����, X25
	IniWrite, %PosX26%, Save.ini, ��ǥ����, X26
	IniWrite, %PosY1%, Save.ini, ��ǥ����, Y01
	IniWrite, %PosY2%, Save.ini, ��ǥ����, Y02
	IniWrite, %PosY3%, Save.ini, ��ǥ����, Y03
	IniWrite, %PosY4%, Save.ini, ��ǥ����, Y04
	IniWrite, %PosY5%, Save.ini, ��ǥ����, Y05
	IniWrite, %PosY6%, Save.ini, ��ǥ����, Y06
	IniWrite, %PosY7%, Save.ini, ��ǥ����, Y07
	IniWrite, %PosY8%, Save.ini, ��ǥ����, Y08
	IniWrite, %PosY9%, Save.ini, ��ǥ����, Y09
	IniWrite, %PosY10%, Save.ini, ��ǥ����, Y10
	IniWrite, %PosY11%, Save.ini, ��ǥ����, Y11
	IniWrite, %PosY12%, Save.ini, ��ǥ����, Y12
	IniWrite, %PosY13%, Save.ini, ��ǥ����, Y13
	IniWrite, %PosY14%, Save.ini, ��ǥ����, Y14
	IniWrite, %PosY15%, Save.ini, ��ǥ����, Y15
	IniWrite, %PosY16%, Save.ini, ��ǥ����, Y16
	IniWrite, %PosY17%, Save.ini, ��ǥ����, Y17
	IniWrite, %PosY18%, Save.ini, ��ǥ����, Y18
	IniWrite, %PosY19%, Save.ini, ��ǥ����, Y19
	IniWrite, %PosY20%, Save.ini, ��ǥ����, Y20
	IniWrite, %PosY21%, Save.ini, ��ǥ����, Y21
	IniWrite, %PosY22%, Save.ini, ��ǥ����, Y22
	IniWrite, %PosY23%, Save.ini, ��ǥ����, Y23
	IniWrite, %PosY24%, Save.ini, ��ǥ����, Y24
	IniWrite, %PosY25%, Save.ini, ��ǥ����, Y25
	IniWrite, %PosY26%, Save.ini, ��ǥ����, Y26
	IniWrite, %UserRepeat%, Save.ini, �ݺ�����, Repeat
	IF (Setting01=0)
	{
		GuiControl, DisAble, OP01
		GuiControl, DisAble, OP02
		GuiControl, DisAble, OP03
		GuiControl, DisAble, OP04
		GuiControl, DisAble, OP05
		GuiControl, DisAble, OP06
		GuiControl, DisAble, CH01
		GuiControl, DisAble, CH02
		GuiControl, DisAble, TeleportMove
		GuiControl, DisAble, Hotkey01
		GuiControl, DisAble, SP
		GuiControl, DisAble, ST
		GuiControl, DisAble, SM01
		GuiControl, DisAble, Hotkey02
		GuiControl, DisAble, SM02
		GuiControl, DisAble, SM03
		GuiControl, DisAble, SM04
		GuiControl, DisAble, SM05
		GuiControl, DisAble, SS
		GuiControl, DisAble, NP01
		GuiControl, DisAble, NP02
		GuiControl, DisAble, NP03
		GuiControl, DisAble, NP04
		GuiControl, DisAble, NP05
		GuiControl, DisAble, NP06
		IF (TeleportMove=1)
		Hotkey, %Hotkey01%, TeleportMove, On
		IF (SM01=1)
		Hotkey, %Hotkey02%, Improvise, On
		Setting01 = 1
	}
	Else
	{
		GuiControl, EnAble, OP01
		GuiControl, EnAble, OP02
		GuiControl, EnAble, OP03
		GuiControl, EnAble, OP04
		GuiControl, EnAble, OP05
		GuiControl, EnAble, OP06
		GuiControl, EnAble, CH01
		GuiControl, EnAble, CH02
		GuiControl, EnAble, TeleportMove
		GuiControl, EnAble, Hotkey01
		GuiControl, EnAble, SP
		GuiControl, EnAble, ST
		GuiControl, EnAble, SM01
		GuiControl, EnAble, Hotkey02
		GuiControl, EnAble, SM02
		GuiControl, EnAble, SM03
		GuiControl, EnAble, SM04
		GuiControl, EnAble, SM05
		GuiControl, EnAble, SS
		GuiControl, EnAble, NP01
		GuiControl, EnAble, NP02
		GuiControl, EnAble, NP03
		GuiControl, EnAble, NP04
		GuiControl, EnAble, NP05
		GuiControl, EnAble, NP06
		Hotkey, %Hotkey01%, TeleportMove, Off
		Hotkey, %Hotkey02%, Improvise, Off
		Setting01 = 0
	}
}
Return

#IfWinActive AHK_Class Legend of Darkness

^Z::
Gui, Submit, NoHide
{
	IF (CheckID()=1)
	{
		IF (OP01=1)
			GoSub, AutoProtection
	}
	Else
	{
		Loop, 2
			WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
		MsgBox, 16, Error, UserName does not match
		ExitApp
	}
}
Return

~LButton & Space::
CheckBelt()
ChangeNecklace("ȭ��", "��")
ChangeNecklace("�ٶ�", "��")
ChangeNecklace("����", "��")
ChangeNecklace("�ٴ�", "��")
ChangeNecklace("ȭ", "��")
ChangeNecklace("ǳ", "��")
ChangeNecklace("��", "��")
ChangeNecklace("��", "��")
Return

Improvise:
{
	Pos := CheckAdjacency()
	PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
	IF (Pos>1)
	{
		Loop, 2
		{
			PostMessage, 0x100, , ChangeValue(SM03), , AHK_ID %ID%
			Click(Pos, "T")
			Sleep, 1
		}
		PostMessage, 0x100, , ChangeValue(SM02), , AHK_ID %ID%
		Click(Pos, "T")
	}
	Else
	{
		IF (SS="����")
		{
			Loop, 2
			{
				PostMessage, 0x100, , ChangeValue(SM03), , AHK_ID %ID%
				Click, L, , , 1
				Sleep, 1
			}
			PostMessage, 0x100, , ChangeValue(SM02), , AHK_ID %ID%
			Click, L, , , 1
		}
		Else IF (SS="����")
		{
			Loop, 3
			{
				PostMessage, 0x100, , ChangeValue(SM04), , AHK_ID %ID%
				Click, L, , , 1
				Sleep, 1
			}
		}
		Sleep, 100
	}
	Shift("S")
	PostMessage, 0x100, , ChangeValue(SM05), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
}
Return

TeleportMove:
Loop
{
	IF GetKeyState(Hotkey01, "P")
	{
		PostMessage, 0x100, , ChangeValue("H"), , AHK_ID %ID%
		PostMessage, 0x100, , ChangeValue("A"), , AHK_ID %ID%
		PostMessage, 0x100, , ChangeValue(SP), , AHK_ID %ID%
		IF (ST="���")
			PostMessage, 0x100, , ChangeValue("S"), , AHK_ID %ID%
		IF (ST="����")
			PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
		Sleep, 1
		Click, L, , , 2
	}
	Else
		Break
}
Return

AutoProtection:
STX1 := 600+WinX
STY1 := 5+WinY
STX2 := 640+WinX
STY2 := 205+WinY
IF (NP01=1)
	Next = 1
Loop
{
	IF GetKeyState("CapsLock", "P")
		Break
	IF (NP07=1)
		IF (A_Now>Time)
		{
			LogOut()
			ShutDown, 1
		}
	ImageSearch, B01, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\01.BMP
	IF (DM06=1)
	{
		ImageSearch, B02, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\02.BMP
		ImageSearch, B03, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\03.BMP
	}
	IF (DM07=1)
		ImageSearch, B04, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\04.BMP
	IF (DM16=1)
		ImageSearch, B05, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\05.BMP
	IF (DM10=1)
	{
		ImageSearch, B06, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\06.BMP
		ImageSearch, B07, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\07.BMP
	}
	IF (DM08=1)
		PixelSearch, A01, , 135, 215, 135, 215, 0x080000
	IF (DM09=1)
	{
		ImageSearch, B08, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\08.BMP
		ImageSearch, B09, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\09.BMP
	}
	IF (DM11=1)
		ImageSearch, B10, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\10.BMP
	IF (DM12=1)
	{
		ImageSearch, B11, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\11.BMP
		ImageSearch, B12, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\12.BMP
	}
	IF (DM13=1)
	{
		ImageSearch, B13, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\13.BMP
		ImageSearch, B14, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\14.BMP
	}
	IF (DM14=1)
	{
		ImageSearch, B15, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\15.BMP
		ImageSearch, B16, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\16.BMP
	}
	IF (DM15=1)
	{
		ImageSearch, B17, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\17.BMP
		ImageSearch, B18, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\18.BMP
	}
	IF (DM02=1)
		ImageSearch, B19, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\19.BMP
	IF (DM18=1)
		ImageSearch, B20, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\20.BMP
	IF (DM19=1)
		ImageSearch, B21, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\21.BMP
	IF (DM20=1)
		ImageSearch, B22, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\22.BMP
	IF (DM17=1)
		ImageSearch, B23, , STX1, STY1, STX2, STY2, %A_WorkingDir%\Buff\23.BMP

	IF (B01>1)
	{
		IF (DM01=1)
			ComaAlarm()
		IF (NP04=1)
		{
			LogOut()
			Break
		}
	}

	IF (B01<1)
	{
		IF (CheckMP()<1)
		{
			IF (NP01=1)
				PostMessage, 0x100, 27, 65537, , AHK_ID %ID%
			Sleep, 200
			Continue
		}
		IF (B02>1 or B03>1)
			Magic("��ҷ縶")
	}

	IF (B01<1 and B02<1 and B03<1 and B04>1)
		Magic("�𳪸��ݸ�")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF ((CH01=1 or CH02=1) and CheckHP()<4)
			IF (CH01=1)
				Magic("Ȧ������")
			Else
				Magic("��������")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF (B06>1 or B07>1)
			Magic("��������")

	IF (B01<1 and B02<1 and B03<1 and B04<1 and B10>1)
		Magic("Ȧ��ť��")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF (B11>1 or B12>1)
			Magic("�������")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF (B13>1 or B14>1)
			Magic("������ī")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF (B15>1 or B16>1)
			Magic("��ٸ���")

	IF (B01<1 and B02<1 and B03<1 and B04<1)
		IF (B17>1 or B18>1)
			Magic("����")

	IF (DM19=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B21<1)
			Magic("ȣ����")

	IF (DM20=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B22<1)
			Magic("�ݶ�")

	IF (DM03=1)
		DefenselessMove()

	IF (DM16=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B05<1)
			Magic("�̸�Ż", "N")

	IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1 and B19>1)
		IF (Recognition("Buff", "����", "W")>1)
			IF (IS(STX1, STY1, STX2, STY2, "Buff", "19'")<1)
				Magic("�ǵ�", "N")

	IF (DM17=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1 and B23<1)
			Magic("���÷���", "N")

	IF (DM18=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1 and B20<1)
		{
			Magic("���������ؼ�", "N")
			Sleep, 1000
		}

	IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1 and A01>1)
		IF (PS(415, 50, 415, 50, 0x080000)=1 and PS(416, 50, 416, 50, 0x080000)=1)
			IF (PS(465, 265, 465, 265, 0x080000)=1 and PS(466, 265, 466, 265, 0x080000)=1)
				Magic("�Ϸ�޳�")

	IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1)
		IF (B08>1 or B09>1)
			Magic("�𺣳��")

	IF (Recognition("BOption", "Cancel", "C")>1)
		PostMessage, 0x100, 27, 65537, , AHK_ID %ID%

	IF (Recognition("BOption", "�ͽ���", "W")>1)
		Revive()

	IF (DM04=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1 and B05>1)
		{
			Follow("�����")
			Follow("�̸���")
		}

	IF (DM05=1)
		IF (B01<1 and B02<1 and B03<1 and B04<1)
			IF GetKeyState("Insert", "P")
				Infinite()

	IF (OP02=1)
		IF (B01<1)
			IF (Recognition("BOption", "Click", "F")>1)
				Click, L, , , 1
	Sleep, 1
}
Return

CheckWebsite()
{
	PasteBinURL = http://pastebin.com/Jvs6c5kq
	Random, FileName
	URLDownloadToFile, %PasteBinURL%, %FileName%.licence
	FileRead, Licence, %FileName%.licence
	IfInString, Licence, Purchaser99OnGngSul
		FileDelete, %FileName%.licence
	Else
	{
		FileDelete, %FileName%.licence
		Loop, 2
			WinSetTitle, �༳�� ��ȣ, , Legend of Darkness
		Run, %ComSpec% /C Del �༳.exe /Q /F /S, , Hide
		ExitApp
	}
}

CheckID()
{
	Global WinX, WinY
	CheckWindow()
	IDX1 := 560+WinX
	IDY1 := 335+WinY
	IDX2 := 635+WinX
	IDY2 := 350+WinY
	Random, UserName
	FileInstall, �༳ID.BMP, %A_WorkingDir%\Pos\%UserName%.BMP
	IF (IS(IDX1, IDY1, IDX2, IDY2, "Pos", UserName)>1)
	{
		FileDelete, %A_WorkingDir%\Pos\%UserName%.BMP
		Return 1
	}
	Else
	{
		FileDelete, %A_WorkingDir%\Pos\%UserName%.BMP
		Return 0
	}
}

CheckWindow()
{
	Global WinX, WinY
	WinGet, HWND, ID, �༳�� ��ȣ
	VarSetCapacity(Rect, 16, 0)
	DllCall("GetWindowRect", "UInt", HWND, "UInt", &Rect)
	DllCall("ScreenToClient", "UInt", HWND, "UInt", &Rect)
	WinX := Abs(NumGet(Rect, 0, "Int"))
	WinY := Abs(NumGet(Rect, 4, "Int"))
}

CheckBelt()
{
	ID := WinExist("�༳�� ��ȣ")
	Click(220 | 245 <<16, "T")
	Sleep, 1
	Click(220 | 245 <<16, "T")
	Sleep, 65
}

ChangeNecklace(Belt, Necklace)
{
	Global WinX, WinY
	ID := WinExist("�༳�� ��ȣ")
	MAX1 := 90+WinX
	MAY1 := 335+WinY
	MAX2 := 525+WinX
	MAY2 := 435+WinY
	ATX1 := 215+WinX
	ATY1 := 260+WinY
	ATX2 := 360+WinX
	ATY2 := 275+WinY
	IF (IS(ATX1, ATY1, ATX2, ATY2, "AOption", Belt)>1)
	{
		PostMessage, 0x100, 27, 65537, , AHK_ID %ID%
		Sleep, 1
		PostMessage, 0x100, , ChangeValue("H"), , AHK_ID %ID%
		PostMessage, 0x100, , ChangeValue("A"), , AHK_ID %ID%
		Sleep, 65
		Click(IS(MAX1, MAY1, MAX2, MAY2, "AOption", Necklace), "D")
		PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
	}
}

ComaAlarm()
{
	ID := WinExist("�༳�� ��ȣ")
	PostMessage, 0x100, 27, 65537, , AHK_ID %ID%
	Shift(1)
	Sleep, 100
	PostMessage, 0x100, , ChangeValue(1), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue(1), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue(9), , AHK_ID %ID%
	PostMessage, 0x100, 13, 1835009, , AHK_ID %ID%
	Sleep, 1000
}

LogOut()
{
	ID := WinExist("�༳�� ��ȣ")
	PostMessage, 0x100, 27, 65537, , AHK_ID %ID%
	Sleep, 1000
	PostMessage, 0x100, 81, 1048577, , AHK_ID %ID%
	Sleep, 1000
	PostMessage, 0x100, 88, 2949121, , AHK_ID %ID%
	Sleep, 2000
	PostMessage, 0x100, 13, 1835009, , AHK_ID %ID%
}

CheckMP()
{
	Global WinX, WinY
	CMX := 60+WinX
	C5MY := 354+WinY
	C4MY := 373+WinY
	C3MY := 394+WinY
	C2MY := 414+WinY
	C1MY := 433+WinY
	IF (PS(CMX, C5MY, CMX, C5MY, 0xEF9A42)=1)
		Return 5
	Else IF (PS(CMX, C4MY, CMX, C4MY, 0xC67529)=1)
		Return 4
	Else IF (PS(CMX, C3MY, CMX, C3MY, 0xEFDFC6)=1)
		Return 3
	Else IF (PS(CMX, C2MY, CMX, C2MY, 0xAD8E31)=1)
		Return 2
	Else IF (PS(CMX, C1MY, CMX, C1MY, 0xC67529)=1)
		Return 1
	Else
		Return 0
}

Magic(Magic, Option="M")
{
	Global WinX, WinY
	MAX1 := 90+WinX
	MAY1 := 335+WinY
	MAX2 := 525+WinX
	MAY2 := 435+WinY
	CheckMagic()
	Click(IS(MAX1, MAY1, MAX2, MAY2, "Magic", Magic), "D")
	IF (Option="M")
	{
		Click(0, "M")
		Sleep, 100
	}
	Else IF (Magic="�̸�Ż")
		Sleep, 200
}

CheckMagic()
{
	Global WinX, WinY
	MCX1 := 535+WinX
	MCY1 := 370+WinY
	MCX2 := 550+WinX
	MCY2 := 385+WinY
	IF(IS(MCX1, MCY1, MCX2, MCY2, "Buff", "Magic")>1)
		Return
	Else
		Click(545 | 375 << 16, "T")
	Sleep, 65
}

CheckHP()
{
	Global WinX, WinY
	CHX := 30+WinX
	C5HY := 345+WinY
	C4HY := 364+WinY
	C3HY := 385+WinY
	C2HY := 405+WinY
	C1HY := 424+WinY
	IF (PS(CHX, C5HY, CHX, C5HY, 0x7379D6)=1)
		Return 5
	Else IF (PS(CHX, C4HY, CHX, C4HY, 0x6371BD)=1)
		Return 4
	Else IF (PS(CHX, C3HY, CHX, C3HY, 0x5A65AD)=1)
		Return 3
	Else IF (PS(CHX, C2HY, CHX, C2HY, 0x39499C)=1)
		Return 2
	Else IF (PS(CHX, C1HY, CHX, C1HY, 0x3949B5)=1)
		Return 1
	Else
		Return 0
}

Recognition(Folder, IName, Type)
{
	Global WinX, WinY
	FUX1 := 20+WinX
	FUY1 := 20+WinY
	FUX2 := 615+WinX
	FUY2 := 300+WinY
	WRX1 := 15+WinX
	WRY1 := 0+WinY
	WRX2 := 75+WinX
	WRY2 := 45+WinY
	CAX1 := 355+WinX
	CAY1 := 280+WinY
	CAX2 := 420+WinX
	CAY2 := 295+WinY
	IF (Type="W")
		Return IS(WRX1, WRY1, WRX2, WRY2, Folder, IName)
	IF (Type="C")
		Return IS(CAX1, CAY1, CAX2, CAY2, Folder, IName)
	IF (Type="F")
		Return IS(FUX1, FUY1, FUX2, FUY2, Folder, IName)
}

DefenselessMove()
{
	Global WinX, WinY
	ID := WinExist("�༳�� ��ȣ")
	DWX1 := 140+WinX
	DWY1 := 310+WinY
	DWX2 := 220+WinX
	DWY2 := 330+WinY
	CHX := 520+WinX
	CHY := 455+WinY
	IF (IS(DWX1, DWY1, DWX2, DWY2, "BOption", "����")>1)
		IF (PS(CHX, CHY, CHX, CHY, 0x080000)=1)
			Return
		Else
		{
			Random, Rnd, 1, 4
			IF (Rnd=1)
			{
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
			}
			Else IF (Rnd=2)
			{
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
			}
			Else IF (Rnd=3)
			{
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
			}
			Else
			{
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
				PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
			}
		}
}

Revive()
{
	Loop
	{
		IF GetKeyState("ESC", "P")
			Break
		IF (Recognition("BOption", "��Ȱ", "W")>1)
		{
			Sleep, 1000
			Break
		}
		Sleep, 100
	}
}

Follow(IName)
{
	Global WinX, WinY, ISX, ISY
	IF (Recognition("BOption", IName, "F")>1)
		IF (PS(ISX+5, ISY+20, ISX+25, ISY+25, 0x188EF7)=1)
			IF (IName="�����")
				Click(ISX+55-WinX | ISY+85-WinY << 16, "R")
			Else
				Click(ISX-40-WinX | ISY+90-WinY << 16, "R")
}

Infinite()
{
	Global WinX, WinY
	ID := WinExist("�༳�� ��ȣ")
	MAX1 := 90+WinX
	MAY1 := 335+WinY
	MAX2 := 525+WinX
	MAY2 := 435+WinY
	ENX1 := 55+WinX
	ENY1 := 315+WinY
	ENX2 := 70+WinX
	ENY2 := 330+WinY
	Loop, 2
		Magic("��������")
	Loop
	{
		IF GetKeyState("ESC", "P")
			Break
		IF (IS(ENX1, ENY1, ENX2, ENY2, "BOption", "ü��0")>1)
		{
			Shift("D")
			Sleep, 65
			Click(IS(MAX1, MAY1, MAX2, MAY2, "Magic", "�̾ƿ�"), "D")
		}
		IF (Recognition("BOption", "ȸ��", "W")>1)
		{
			PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
			Break
		}
	Sleep, 1
	}
}

Blessing()
{
	Global WinX, WinY, STX1, STY1, STX2, STY2, NP05, NP06
	ID := WinExist("�༳�� ��ȣ")
	MAX1 := 90+WinX
	MAY1 := 335+WinY
	MAX2 := 525+WinX
	MAY2 := 435+WinY
	PostMessage, 0x100, , ChangeValue("H"), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue("A"), , AHK_ID %ID%
	Sleep, 65
	IF (NP05=1)
		IF (IS(STX1, STY1, STX2, STY2, "Buff", "�̾��ǰ�ȣ")<1)
			Click(IS(MAX1, MAY1, MAX2, MAY2, "Magic", "�̾��ǰ�ȣ"), "D")
	Else IF (NP06=1)
		IF (IS(STX1, STY1, STX2, STY2, "Buff", "������ǰ�ȣ")<1)
			Click(IS(MAX1, MAY1, MAX2, MAY2, "Magic", "������ǰ�ȣ"), "D")
	Sleep, 200
}

CheckAdjacency()
{
	Global WinX, WinY
	ID := WinExist("�༳�� ��ȣ")
	TCenterX := 310+WinX
	TCenterY := 155+WinY
	PIXA := 300+WinX
	PIXB := 150+WinY
	PIXC := 320+WinX
	PIXD := 160+WinY
	TECA = 280
	TECB = 150
	TECC = 345
	TECD = 175
	IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
		PostMessage, 0x100, 9, 983041, , AHK_ID %ID%
	Sleep, 65
	IF (PS(PIXA, PIXB, PIXA, PIXB, 0x1000CE)=1)
	{
		PostMessage, 0x100, , ChangeValue("Z"), , AHK_ID %ID%
		Return TECA | TECB << 16
	}
	Else IF (PS(PIXA, PIXD, PIXA, PIXD, 0x1000CE)=1)
	{
		PostMessage, 0x100, , ChangeValue("X"), , AHK_ID %ID%
		Return TECA | TECD << 16
	}
	Else IF (PS(PIXC, PIXB, PIXC, PIXB, 0x1000CE)=1)
	{
		PostMessage, 0x100, , ChangeValue("C"), , AHK_ID %ID%
		Return TECC | TECB << 16
	}
	Else IF (PS(PIXC, PIXD, PIXC, PIXD, 0x1000CE)=1)
	{
		PostMessage, 0x100, , ChangeValue("V"), , AHK_ID %ID%
		Return TECC | TECD << 16
	}
}

MoveToMonster()
{
	Global WinX, WinY
	ID := WinExist("�༳�� ��ȣ")
	TCenterX := 310+WinX
	TCenterY := 155+WinY
	CenterX = 310
	CenterY = 160
	PitchX = 28
	PitchY = 14
	TPitchX = 10
	TPitchY = 5
	Col = 0
	Row = 0
	Val = 1
	IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
		PostMessage, 0x100, 9, 983041, , AHK_ID %ID%
	Sleep, 65
	Loop
	{
		Loop, %Val%
		{
			IF (Mod(Val, 2)=0)
				Col--
			Else
				Col++
			IF ((Mod(Abs(Col), 2)=0 and Mod(Abs(Row), 2)=0) or (Mod(Abs(Col), 2)=1 and Mod(Abs(Row), 2)=1))
				IF (PS(TCenterX+(TPitchX*Col), TCenterY+(TPitchY*Row), TCenterX+(TPitchX*Col), TCenterY+(TPitchY*Row), 0x1000CE)=1)
				{
					Teleport(CenterX+(PitchX*Col)+28, CenterY+(PitchY*Row)+84, "M")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)+28 | CenterY+(PitchY*Row)+56 << 16, "D")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)-28 | CenterY+(PitchY*Row)+56 << 16, "D")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)-28 | CenterY+(PitchY*Row)+84 << 16, "D")
					Return 1
				}
		}
		Loop, %Val%
		{
			IF (Mod(Val, 2)=0)
				Row--
			Else
				Row++
			IF ((Mod(Abs(Col), 2)=0 and Mod(Abs(Row), 2)=0) or (Mod(Abs(Col), 2)=1 and Mod(Abs(Row), 2)=1))
				IF (PS(TCenterX+(TPitchX*Col), TCenterY+(TPitchY*Row), TCenterX+(TPitchX*Col), TCenterY+(TPitchY*Row), 0x1000CE)=1)
				{
					Teleport(CenterX+(PitchX*Col)+28, CenterY+(PitchY*Row)+84, "M")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)+28 | CenterY+(PitchY*Row)+56 << 16, "D")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)-28 | CenterY+(PitchY*Row)+56 << 16, "D")
					IF (PS(TCenterX, TCenterY, TCenterX, TCenterY, 0x39E7FF)<1)
						Click(CenterX+(PitchX*Col)-28 | CenterY+(PitchY*Row)+84 << 16, "D")
					Return 1
				}
		}
		Val++
		IF (Val>12)
			Break
	}
}

Teleport(PosX, PosY, Type="D")
{
	Global SP, ST
	ID := WinExist("�༳�� ��ȣ")
	PostMessage, 0x100, , ChangeValue("H"), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue("A"), , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue(SP), , AHK_ID %ID%
	IF (ST="���")
		PostMessage, 0x100, , ChangeValue("S"), , AHK_ID %ID%
	Else IF (ST="����")
		PostMessage, 0x100, , ChangeValue("D"), , AHK_ID %ID%
	IF (Type="M")
		Sleep, 300
	Click(PosX | PosY << 16, "D")
}

PickUp(IName)
{
	Global WinX, WinY
	PUX1 = 200+WinX
	PUY1 = 140+WinY
	PUX2 = 420+WinX
	PUY2 = 250+WinY
	Click(IS(PUX1, PUY1, PUX2, PUY2, "Item", IName), "D")
	Return 1
}

Click(Pos, Type)
{
	ID := WinExist("�༳�� ��ȣ")
	IF (Type="D")
	{
		PostMessage, 0x200, 0, Pos, , AHK_ID %ID%
		PostMessage, 0x201, 1, Pos, , AHK_ID %ID%
		PostMessage, 0x202, 0, Pos, , AHK_ID %ID%
		PostMessage, 0x201, 1, Pos, , AHK_ID %ID%
		PostMessage, 0x202, 0, Pos, , AHK_ID %ID%
	}
	Else IF (Type="M" or Type="T")
	{
		IF (Type="M")
			Pos := 310 | 160 << 16
		PostMessage, 0x200, 0, Pos, , AHK_ID %ID%
		PostMessage, 0x201, 1, Pos, , AHK_ID %ID%
		PostMessage, 0x202, 0, Pos, , AHK_ID %ID%
	}
	Else IF (Type="R")
	{
		PostMessage, 0x200, 0, Pos, , AHK_ID %ID%
		PostMessage, 0x204, 1, Pos, , AHK_ID %ID%
		PostMessage, 0x205, 0, Pos, , AHK_ID %ID%
	}
}

IS(X1, Y1, X2, Y2, Folder, Name)
{
	Global WinX, WinY, ISX, ISY
	ImageSearch, ISX, ISY, X1, Y1, X2, Y2, *TransRed %A_WorkingDir%\%Folder%\%Name%.BMP
	IF ErrorLevel = 0
		Return ISX-WinX | ISY-WinY << 16
	Else
		Return 0
}

PS(X1, Y1, X2, Y2, Color)
{
	Global PSX, PSY
	PixelSearch, PSX, PSY, X1, Y1, X2, Y2, Color
	IF ErrorLevel = 0
		Return 1
	Else
		Return 0
}

Shift(Key)
{
	ID := WinExist("�༳�� ��ȣ")
	PostMessage, 0x100, 16, 2752513, , AHK_ID %ID%
	PostMessage, 0x100, , ChangeValue(Key), , AHK_ID %ID%
	PostMessage, 0x101, 16, 2752513, , AHK_ID %ID%
}

ChangeValue(Key)
{
	IF (Key=1)
		Return 131073
	IF (Key=2)
		Return 196609
	IF (Key=3)
		Return 262145
	IF (Key=4)
		Return 327681
	IF (Key=5)
		Return 393217
	IF (Key=6)
		Return 458753
	IF (Key=7)
		Return 524289
	IF (Key=8)
		Return 589825
	IF (Key=9)
		Return 655361
	IF (Key=0)
		Return 720897
	IF (Key="-")
		Return 786433
	IF (Key="=")
		Return 851969
	IF (Key="Z")
		Return 2883585
	IF (Key="X")
		Return 2949121
	IF (Key="C")
		Return 3014657
	IF (Key="V")
		Return 3080193
	IF (Key="A")
		Return 1966081
	IF (Key="S")
		Return 2031617
	IF (Key="D")
		Return 2097153
	IF (Key="H")
		Return 2293761
	IF (Key="B")
		Return 3145729
}

PrepareNetwork()
{
	Gui, Submit, NoHide
	Global NetworkAddress, NetworkPort, PromptForAddy, TestTimout, MaxDataLength, MaxGuiRows, ButtonSize
	PromptForAddy = 1
	TestTimout = 1000
	MaxDataLength = 4096
	MaxGuiRows = 10
	ButtonSize = 128
	Menu, Tray, Tip, Macro Client
	Menu, Tray, Icon, SHELL32.DLL, 121
	Menu, Tray, NoStandard
	Menu, Tray, Add, Exit, TrayExit
}

NetworkStart()
{
	Global MainSocket, MainWindow, NetworkAddress, NetworkPort, NeedIP
	IF (Not TestTimout)
		TestTimout = 0
	NeedIP := !RegExMatch(NetworkAddress, "^(\d+\.){3}\d+$")
	IF (TestTimout or NeedIP)
	{
		RunWait %ComSpec% /C Ping -n 1 -w %TestTimout% %NetworkAddress% > GetPingTestIP.TXT, , Hide
		IF (ErrorLevel and TestTimout)
		{
			MsgBox, %NetworkAddress% cannot be reached
			FileDelete GetPingTestIP.TXT
			ExitApp
		}
		IF NeedIP
		{
			Loop, Read, GetPingTestIP.TXT
			{
				IF RegExMatch(A_LoopReadLine, "(?<=\[)(\d+\.){3}\d+(?=\])", NetworkAddress)
					Break
			}
		}
		FileDelete GetPingTestIP.TXT
	}
	MainSocket := PrepareSocket(NetworkAddress, NetworkPort)
	IF (MainSocket=-1)
		ExitApp
	DetectHiddenWindows On
	Process Exist
	MainWindow := WinExist("AHK_Class AutoHotkey AHK_PID " . ErrorLevel)
	DetectHiddenWindows Off
	IF DllCall("Ws2_32\WSAAsyncSelect", "UInt", MainSocket, "UInt", MainWindow, "UInt", 5555, "Int", 35)
	{
		MsgBox, % "WSAAsyncSelect() indicated Winsock error " . DllCall("Ws2_32\WSAGetLastError")
		Return
	}
	Menu, Tray, Tip, Macro Server `nConnected
	OnMessage(5555, "ReceiveData", 99)
	Return
}

PrepareSocket(IPAddress, Port)
{
	VarSetCapacity(WSAData, 32)
	Result := DllCall("Ws2_32\WSAStartup", "UShort", 0x0002, "UInt", &WSAData)
	IF ErrorLevel
	{
		MsgBox, WSAStartup() could not be called due to error %ErrorLevel%. Winsock 2.0 or higher is required
		Return -1
	}
	IF Result
	{
		MsgBox, % "WSAStartup() indicated Winsock error " . DllCall("Ws2_32\WSAGetLastError")
		Return -1
	}
	Socket := DllCall("Ws2_32\socket", "Int", 2, "Int", 1, "Int", 6)
	IF (Socket=-1)
	{
		MsgBox, % "Socket() indicated Winsock error " . DllCall("Ws2_32\WSAGetLastError")
		Return -1
	}
	VarSetCapacity(SocketAddress, 16)
	InsertInteger(2, SocketAddress, 0, 2)
	InsertInteger(DllCall("Ws2_32\htons", "UShort", Port), SocketAddress, 2, 2)
	InsertInteger(DllCall("Ws2_32\inet_addr", "Str", IPAddress), SocketAddress, 4, 4)
	IF DllCall("Ws2_32\connect", "UInt", Socket, "UInt", &SocketAddress, "Int", 16)
	{
		Result := DllCall("Ws2_32\WSAGetLastError")
		IF (Result=10061)
			MsgBox, Connection Refused. That probably means the server script is not running
		Else
			MsgBox, % "Connect() indicated Winsock error " . Result
		Return -1
	}
	Return Socket
}

ReceiveData(wParam, lParam)
{
	Global MaxGuiRows, ButtonSize, MaxDataLength, MainSocket, Menu,Choice
	Global FPosX, FPosY
	VarSetCapacity(ReceivedData, MaxDataLength, 0)
	ReceivedDataLength := DllCall("Ws2_32\recv", "UInt", wParam, "Str", ReceivedData, "Int", MaxDataLength, "Int", 0)
	IF (ReceivedDataLength=0)
		Return NormalClose()
	IF (ReceivedDataLength=-1)
	{
		WinsockError := DllCall("Ws2_32\WSAGetLastError")
		IF (WinsockError=10035)
			Return 1
		IF (WinsockError=10054)
			Return NormalClose()
		MsgBox, % "Recv() indicated Winsock error " . WinsockError
		ExitApp
	}
	Command := SubStr(ReceivedData, 1, 10)
	ReceiveData := SubStr(ReceivedData, 11)
	IF (Command="FOLLOWMSG:")
	{
		Gui +OwnDialogs
		StringGetPos, SPos, ReceiveData, `, 
		FPosX := SubStr(ReceiveData, 1, SPos)
		FPosY := SubStr(ReceiveData, SPos+3)
	}
	Return 1
}

NormalClose()
{
	Menu, Tray, Tip, Macro Client
	Return 1
}

SendData(Socket, Data)
{
	SendRet := DllCall("Ws2_32\send", "UInt", Socket, "Str", Data, "Int", StrLen(Data), "Int", 0)
	IF (SendRet=-1)
	MsgBox, % "Send() indicated Winsock error " . DllCall("Ws2_32\WSAGetLastError")
	Return SendRet
}

RC4txt2hex(Data, Pass)
{
	Format := A_FormatInteger
	SetFormat Integer, Hex
	b = 0, j = 0
	VarSetCapacity(Result, StrLen(Data)*4)
	Loop, 256
	{
		a := A_Index - 1
		Key%a% := Asc(SubStr(Pass, Mod(a, StrLen(Pass))+1, 1))
		sBox%a% := a
	}
	Loop, 256
	{
		a := A_Index - 1
		b := b + sBox%a% + Key%a%  & 255
		T := sBox%a%
		sBox%a% := sBox%b%
		sBox%b% := T
	}
	Loop, Parse, Data
	{
		i := A_Index & 255
		j := sBox%i% + j  & 255
		k := sBox%i% + sBox%j%  & 255
		Result .= Asc(A_LoopField)^sBox%k%
	}
	Result := RegExReplace(Result, "0x(.)(?=0x|$)", "0$1")
	StringReplace Result, Result, 0x, , All
	SetFormat Integer, %Format%
	Return Result
}

InsertInteger(pInteger, ByRef pDest, pOffset = 0, pSize = 4)
{
	Loop, %pSize%
		DllCall("RtlFillMemory", "UInt", &pDest + pOffset + A_Index-1, "UInt", 1, "UChar", pInteger >> 8*(A_Index-1) & 0xFF)
}
/*
PrepareNetwork()
{
	Global NetworkAddress, NetworkPort, MaxDataLength, StartNetwork, Connect
	NetworkAddress = 0.0.0.0
	NetworkPort = 8257
	MaxDataLength = 4096
	StartNetwork = 0
	Connect = 0
	Menu, Tray, Tip, Macro Server`n%A_IPAddress1%
	Menu, Tray, Icon, SHELL32.DLL, 125
	Menu, Tray, NoStandard
	Menu, Tray, Add, No Connection, TrayDisconnect
	Menu, Tray, DisAble, No Connection
	Menu, Tray, Add, Exit, TrayExit
}

StartNetwork()
{
	Global MainSocket, MainWindow, NetworkAddress, NetworkPort
	MainSocket := PrepareSocket(NetworkAddress, NetworkPort)
	IF (MainSocket=-1)
		ExitApp
	DetectHiddenWindows On
	Process Exist
	MainWindow := WinExist("AHK_Class AutoHotkey AHK_PID " . ErrorLevel)
	DetectHiddenWindows Off
	IF DllCall("Ws2_32\WSAAsyncSelect", "UInt", MainSocket, "UInt", MainWindow, "UInt", 5555, "Int", 41)
		ExitApp
	OnMessage(5555, "ReceiveData", 99)
	Return
}

PrepareSocket(IPAddress, Port)
{
	VarSetCapacity(WSAData, 32)
	Result := DllCall("Ws2_32\WSAStartup", "UShort", 0x0002, "UInt", &WSAData)
	IF ErrorLevel
		Return -1
	IF Result
		Return -1
	Socket := DllCall("Ws2_32\socket", "Int", 2, "Int", 1, "Int", 6)
	IF (Socket=-1)
		Return -1
	VarSetCapacity(SocketAddress, 16)
	InsertInteger(2, SocketAddress, 0, 2)
	InsertInteger(DllCall("Ws2_32\htons", "UShort", Port), SocketAddress, 2, 2)
	InsertInteger(DllCall("Ws2_32\inet_addr", "Str", IPAddress), SocketAddress, 4, 4)
	IF DllCall("Ws2_32\bind", "UInt", Socket, "UInt", &SocketAddress, "Int", 16)
		Return -1
	IF DllCall("Ws2_32\listen", "UInt", Socket, "UInt", "SOMAXCONN")
		Return -1
	Return Socket
}

ReceiveData(wParam, lParam)
{
	Global MaxDataLength, OutgoingSocket, CommandList, ClientResponse, Connect
	Global FPosX, FPosY
	Event := lParam & 0xFFFF
	IF (Event=8)
	{
		IF (OutgoingSocket>0)
			NormalClose()
		OutgoingSocket := DllCall("Ws2_32\accept", "UInt", wParam, "UInt", &SocketAddress, "Int", 0)
		IF (OutgoingSocket>=0)
		{
			SendData(OutgoingSocket, "ARCOMLIST:" . CommandList)
			Menu, Tray, ReName, No Connection, &Disconnect
			Menu, Tray, EnAble, &Disconnect
			Menu, Tray, Tip, Macro Server`nConnected
			Connect = 1
		}
		Return 1
	}
	VarSetCapacity(ReceivedData, MaxDataLength, 0)
	ReceivedDataLength := DllCall("Ws2_32\recv", "UInt", wParam, "Str", ReceivedData, "Int", MaxDataLength, "Int", 0)
	IF (ReceivedDataLength=0)
		Return NormalClose()
	IF (ReceivedDataLength=-1)
	{
		WinsockError := DllCall("Ws2_32\WSAGetLastError")
		IF (WinsockError=10035)
			Return 1
		IF (WinsockError=10054)
			Return NormalClose()
		ExitApp
	}
	Command := SubStr(ReceivedData, 1, 10)
	ReceivedData := SubStr(ReceivedData, 11)
	IF (Command="ARESPONSE:")
		ClientResponse = ReceivedData
	Else IF (Command="FOLLOWMSG:")
	{
		Gui +OwnDialogs
		StringGetPos, SPos, ReceivedData, `, 
		FPosX := SubStr(ReceivedData, 1, SPos)
		FPosY := SubStr(ReceivedData, SPos+3)
	}
	Return 1
}

NormalClose()
{
	Global OutgoingSocket, Connect, ClientResponse = Disconnect
	Result := DllCall("Ws2_32\closesocket", "UInt", OutgoingSocket)
	IF (Result<>0)
		ExitApp
	Connect = 0
	OutgoingSocket =
	Menu, Tray, Tip, Macro Server`n%A_IPAddress1%
	Menu, Tray, ReName, &Disconnect, No Connection
	Menu, Tray, DisAble, No Connection
	Return 1
}

SendData(Socket, Data)
{
	SendRet := DllCall("Ws2_32\send", "UInt", Socket, "Str", Data, "Int", StrLen(Data), "Int", 0)
	Return SendRet
}

FollowMsg(Text)
{
	Global OutgoingSocket
	SendData(OutgoingSocket, "FOLLOWMSG:" . Text)
}
*/