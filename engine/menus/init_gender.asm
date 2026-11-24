InitCrystalData:
	xor a
	ld [wPlayerGender], a

InitCrystalProfileData:
	ld a, $1
	ld [wPlayerPrefecture], a
	xor a
	ld [wPlayerAge], a
	ld [wPlayerPostalCode], a
	ld [wPlayerPostalCode+1], a
	ld [wPlayerPostalCode+2], a
	ld [wPlayerPostalCode+3], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wCrystalFlags]
	res 0, a ; ???
	ld [wCrystalFlags], a
	ld a, [wCrystalFlags]
	res 1, a ; ???
	ld [wCrystalFlags], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalProfileData
	farcall ChoosePlayerAppearance
	ld c, 10
	jp DelayFrames
