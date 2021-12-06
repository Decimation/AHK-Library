#NoEnv
SendMode Input
SetTitleMatchMode, 3
#IfWinActive, DOOMEternal



;----------------------------------------
; SET THESE TO YOUR INGAME WEAPON KEYS
;----------------------------------------
CombatShotgun := "1"
HeavyCannon := "2"
PlasmaRifle := "3"
RocketLauncher := "F15"
SuperShotgun := "WheelDown"
Ballista := "WheelUp"
Chaingun := "4"




;----------------------------------------
; DO NOT EDIT BELOW
;----------------------------------------

Hotkey, %CombatShotgun%, Weapon1
Hotkey, %HeavyCannon%, Weapon2
Hotkey, %PlasmaRifle%, Weapon3
Hotkey, %RocketLauncher%, Weapon4
Hotkey, %SuperShotgun%, Weapon5
Hotkey, %Ballista%, Weapon6
Hotkey, %Chaingun%, Weapon7

;default state
CurrentWeapon := CombatShotgun
LastWeapon := CombatShotgun


Weapon1:
    if( CurrentWeapon = CombatShotgun )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := CombatShotgun
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := CombatShotgun
    }
    SendInput {%CurrentWeapon%}
    return

Weapon2:
    if( CurrentWeapon = HeavyCannon )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := HeavyCannon
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := HeavyCannon
    }
    SendInput {%CurrentWeapon%}
    return

Weapon3:
    if( CurrentWeapon = PlasmaRifle )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := PlasmaRifle
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := PlasmaRifle
    }
    SendInput {%CurrentWeapon%}
    return

Weapon4:
    if( CurrentWeapon = RocketLauncher )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := RocketLauncher
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := RocketLauncher
    }
    SendInput {%CurrentWeapon%}
    return

Weapon5:
    if( CurrentWeapon = SuperShotgun )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := SuperShotgun
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := SuperShotgun
    }
    SendInput {%CurrentWeapon%}
    return  

Weapon6:
    if( CurrentWeapon = Ballista )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := Ballista
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := Ballista
    }
    SendInput {%CurrentWeapon%}
    return

Weapon7:
    if( CurrentWeapon = Chaingun )
    {
        CurrentWeapon := LastWeapon
        LastWeapon := Chaingun
    }
    else
    {
        LastWeapon := CurrentWeapon
        CurrentWeapon := Chaingun
    }
    SendInput {%CurrentWeapon%}
    return