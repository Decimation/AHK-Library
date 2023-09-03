
; Suspend
F3::Suspend

; Pause
F4::Pause



; Bunny hopping
*SPACE::
	Loop
	{
		GetKeyState, state, SPACE, P
		if state = U
			break
		Send, {SPACE}
		Sleep, 10
	}
	return