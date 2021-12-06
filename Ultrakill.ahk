#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

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

ProjBoostKey := "C"
ShotgunSwapKey := "R"

Hotkey, *%ProjBoostKey%, ProjBoost
Hotkey, *%ShotgunSwapKey%, ShotgunSwap

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


~1::
~3::
~4::
	ShotgunEquipped = false
	Return

~2::
	ShotgunEquipped = true
	Return


; #region


EnsureShotgun()
{
	If ShotgunEquipped = false
	{
		EquipShotgun()
	}
}

EquipShotgun()
{
	Send, %KeyShotgun%
	Sleep, EquipTime
	ShotgunEquipped = true
}




; Shotgun swapping
ShotgunSwap:
	EnsureShotgun()
	Loop
	{
		GetKeyState, state, R, P
		If state = U
			Return
		Click
		Send, %KeyShotgun%
		Sleep, EquipTime
	}


; Projectile boost
ProjBoost:
	i = 0
	l = 6

	EnsureShotgun()
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