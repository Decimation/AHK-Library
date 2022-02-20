#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.

#Warn, UseUnsetGlobal, Off

;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force
#InstallKeybdHook
#KeyHistory 100
#IfWinActive, ahk_exe ULTRAKILL.exe

; #InstallMouseHook
; #UseHook
;Menu, Tray, Icon, imageres.dll, 77

; #region

; 500
; 490
; 440

global EquipTime := 500
global SwitchTime := 600
global ShotgunEquipped := false
global KeyShotgun := 2
global KeyMelee := "f"
global FeedbackerEquipped := false
global ProjBoostKey := "C"
global ShotgunSwapKey := "R"
global t := "XButton2"

Hotkey, *%ProjBoostKey%, ProjBoost
Hotkey, *%ShotgunSwapKey%, ShotgunSwap

Hotkey, ~*%t%, ArmToggle

; #endregion

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


ArmToggle()
{
	global FeedbackerEquipped

	if FeedbackerEquipped = false
	{
		FeedbackerEquipped = true
	}
	else if FeedbackerEquipped = true
	{
		FeedbackerEquipped = false
	}else{
		FeedbackerEquipped = true
	}
	; MsgBox %FeedbackerEquipped%
	Return
}

~1::
~3::
~4::
	global ShotgunEquipped
	ShotgunEquipped = false
	Return

~2::
	global ShotgunEquipped
	ShotgunEquipped = true
	Return

; #region

EnsureShotgun()
{
	global ShotgunEquipped
	If ShotgunEquipped = false
	{
		EquipShotgun()
	}
}

EnsureFeedbacker()
{
	global FeedbackerEquipped
	if FeedbackerEquipped = false
	{
		SendInput, {XButton2}
		; SendInput, {XButton2 Up}
		FeedbackerEquipped = true
	}
}

EquipShotgun()
{
	global KeyShotgun
	global EquipTime
	global ShotgunEquipped
	Send, %KeyShotgun%
	Sleep, EquipTime
	ShotgunEquipped = true
}

; Shotgun swapping
ShotgunSwap:
	global ShotgunSwapKey
	EnsureShotgun()

	Loop
	{
		GetKeyState, state, %ShotgunSwapKey%, P
		If state = U
			Return
		Click
		;Send, %KeyShotgun%
		;Sleep, EquipTime
		EquipShotgun()
	}

	; Projectile boost
ProjBoost:
	global KeyMelee
	global ShotgunEquipped
	global SwitchTime
	i = 0
	l = 6

	EnsureShotgun()
	EnsureFeedbacker()

	Loop
	{
		; https://ultrakill.fandom.com/wiki/Movement_Guide#Projectile_Boost

		Click
		;...

		Sleep, 16
		Send, %KeyMelee%
		ShotgunEquipped = true
		Sleep, SwitchTime
		EquipShotgun()
		EnsureFeedbacker()
		

		If ++i = l
		{
			SoundPlay, C:\Library\Audio\warning.wav
			;Sleep, 500
			;Return
			;Break
		}
		GetKeyState, state, C, P
		If state = U
			Return
	}

Return

; #endregion