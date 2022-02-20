#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

#Warn, UseUnsetGlobal, Off

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force
#InstallKeybdHook
#KeyHistory 100

; #InstallMouseHook
; #UseHook
;Menu, Tray, Icon, imageres.dll, 77
; Reload
F2::
	;SoundPlay, C:\Library\Audio\ding2.wav
	;SoundPlay, *-1
	SoundPlay, C:\Library\Audio\hint.wav, 1
	Reload
	Return

; Suspend
F3::Suspend

; Pause
F4::Pause

