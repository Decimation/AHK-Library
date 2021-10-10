#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Warn, UseUnsetGlobal, Off

;#IfWinActive, ahk_exe hl2.exe
;#IfWinActive, ahk_exe portal2.exe

#SingleInstance, Force


; Reload
F2::
	;SoundPlay, C:\Library\Audio\ding2.wav
	;SoundPlay, *-1
	SoundPlay, C:\Library\Audio\hint.wav, 1

	Reload
	Return


; Suspend
F3::
	Suspend
	Return
;*R::
	; 960 540
	;bind kp_leftarrow "cl_yawspeed 1000; +left; wait 65; cl_yawspeed 210; -left"
	;Send, {Numpad4}
	
; Bunny hopping
*SPACE::
	Loop
	{
		GetKeyState, state, SPACE, P
		if state = U
			break
		Send, {Blind} {SPACE}
		Sleep, 10
	}
	return

;*Z::
;	Send, W
;	Sleep, 0.3


; Prop boosting
; *C::
; Loop
; 	{
; 		GetKeyState, state, C, P
; 		if state = U
; 			break
; 		Send, {Blind} e
; 		Sleep, 10
; 		Send, {Blind} {SPACE}

; 	}
; 	return

*c::
	Loop
	{
		GetKeyState, state, c, P, SPACE
		if state = U
			break
		Send, {Blind}{e}{SPACE}
		Sleep, 10
	}
	return

;https://wiki.sourceruns.org/wiki/AutoHotkey/Scripts