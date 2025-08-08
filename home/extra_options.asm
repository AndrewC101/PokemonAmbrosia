CheckIfFastBattlesIsOn::
	ld a, [wOptions2]
	bit FAST_BATTLES, a
	ret
