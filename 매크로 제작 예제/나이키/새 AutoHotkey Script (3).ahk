#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DetectHiddenWindows, on 
  
url := "nike.com" 
  
wb := ComObjCreate("InternetExplorer.Application") 
wb.toolbar := true 
wb.StatusBar := true 
wb.AddressBar := true 
wb.MenuBar := true 
  
WinMove, % "Ahk_id " wb.hWnd ,,0,0, 1366, 768 
Set_Parent_by_id(wb.hWnd) 
  
Gui, Show, w1366 h768, %url% 
wb.Navigate(url) 
While wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy 
    Sleep, 10 
wb.Visible := true ; 브라우저 보임 
wb.Silent := True 
return 
  
Set_Parent_by_id(Window_ID) 
{ 
  Gui, +LastFound 
  Return DllCall("SetParent", "uint", Window_ID, "uint", WinExist()) 
} 
  
  
GuiClose: 
Gui, submit 
wb.quit() 
sleep 100 
ExitApp 