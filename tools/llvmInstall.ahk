#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ; Match as long as the actual title _contains_ what we match against 
SetControlDelay -1

winTitleInstall = cmd.exe

WinWait, %winTitleInstall%, , 600
WinActivate
Sleep, 30
ControlSend, , {Enter}, %winTitleInstall%
