DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_NONE
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: lightest
	db 0
; wOptions2: battle info off, battle text normal, speed x1/x1
	db 0
; wPlayerColor: red
	db PLAYER_COLOR_RED
; wPlayerSpriteChoice: default
	db PLAYER_SPRITE_DEFAULT
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
