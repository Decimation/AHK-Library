#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

#Warn, UseUnsetGlobal, Off

;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force
#InstallKeybdHook
#KeyHistory 100
; #InstallMouseHook
; #UseHook


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

global CurWeapon = 0


~*1::
	CurWeapon="1"
	Return
~*2::
	CurWeapon="2"
	Return
~*3::
	CurWeapon="3"
	Return
~*4::
	CurWeapon="4"
	Return

^LButton:
	Loop
	{
		GetKeyState, state, LButton, P
		If state = U
			Return
		Click
		Sleep, 10
	}

; Drop-reload script
~*Z::
	Send, X
	Sleep, 10
	; Sleep, 50
	; Sleep, 90
	; Sleep, 100
	Send, E
	Send, %CurWeapon%