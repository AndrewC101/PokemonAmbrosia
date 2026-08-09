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
; wOptions2: battle damage info off
	db 0 << FAST_BATTLES
; wPlayerColor: red
	db PLAYER_COLOR_RED
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
