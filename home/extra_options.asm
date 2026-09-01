CheckIfMinimumBattleText::
; Compatibility entry below preserves old fast-battle text skip call sites.
; Returns Z for normal text and NZ for minimum text.
CheckIfFastBattlesIsOn::
	ld a, [wOptions2]
	bit MINIMUM_BATTLE_TEXT, a
	ret
