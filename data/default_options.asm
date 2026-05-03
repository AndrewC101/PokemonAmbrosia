DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_NONE
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wOptions2: battle damage info off
	db 0
	db 0 << FAST_BATTLES

	db $00
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
