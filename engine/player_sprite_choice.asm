GetSelectedPlayerSpriteChoice::
; Keep stale or gender-mismatched save data from selecting an invalid player sprite.
	ld a, [wPlayerSpriteChoice]
	cp NUM_PLAYER_SPRITES
	jr c, .valid_range
	xor a

.valid_range
	ld b, a
	call IsEffectiveFemalePlayer
	ld a, b
	jr c, .female

	cp PLAYER_SPRITE_MISTY
	ret c
	cp PLAYER_SPRITE_MORTY
	jr c, .invalid
	cp PLAYER_SPRITE_KIMONO_GIRL
	ret c

.invalid
	xor a
	ret

.female
	and a
	ret z
	cp PLAYER_SPRITE_MISTY
	jr c, .invalid
	cp PLAYER_SPRITE_MORTY
	ret c
	cp PLAYER_SPRITE_KIMONO_GIRL
	jr c, .invalid
	ret

GetSelectedPlayerOverworldSprite::
	call GetSelectedPlayerSpriteChoice
	and a
	jp z, GetDefaultPlayerOverworldSprite
	dec a
	ld e, a
	ld d, 0
	ld hl, PlayerSpriteChoiceSprites
	add hl, de
	ld a, [hl]
	ret

GetSelectedPlayerSpriteGFX::
	call GetSelectedPlayerSpriteChoice
	and a
	jr z, .default
	dec a
	ld e, a
	ld d, 0
	ld hl, PlayerSpriteChoiceGFX
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ret

.default
	call IsEffectiveFemalePlayer
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)
	ret c
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)
	ret

GetSelectedPlayerTrainerClass::
	call GetSelectedPlayerSpriteChoice
	and a
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, PlayerSpriteChoiceTrainerClasses
	add hl, de
	ld a, [hl]
	ret

LoadSelectedPlayerCardPic::
	call GetSelectedPlayerTrainerClass
	and a
	ret z
	cp NUM_TRAINER_CLASSES + 1
	jr nc, .default
	ld [wTrainerClass], a
	ld hl, TrainerPicPointers
	dec a
	ld bc, 3
	call AddNTimes

	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a

	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	newfarcall FixPicBank
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarWord
	pop af
	ld de, wDecompressScratch
	call FarDecompress

	ld de, wDecompressScratch + 7 tiles ; skip the top row of the 7x7 frontpic
	ld hl, vTiles2 tile $00
	ld c, $23
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ldh [rWBK], a
	ld a, TRUE
	ret

.default
	xor a
	ret

IsEffectiveFemalePlayer:
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .male
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	scf
	ret

.male
	and a
	ret

GetDefaultPlayerOverworldSprite:
	call IsEffectiveFemalePlayer
	ld a, SPRITE_KRIS
	ret c
	ld a, SPRITE_CHRIS
	ret

SetInitialPlayerSpriteChoice::
	call ClearTilemap
	call WaitBGMap2
	ld hl, WhatSpriteWillYouUseText
	call PrintText
	call LoadPlayerSpriteChoiceMenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call _2DMenu
	push af
	call CloseWindow
	pop af
	jr StorePlayerSpriteChoiceFromPosition

LoadPlayerSpriteChoiceMenuHeader:
	ld hl, MalePlayerSpriteChoiceMenuHeader
	call IsEffectiveFemalePlayer
	ret nc
	ld hl, FemalePlayerSpriteChoiceMenuHeader
	ret

StorePlayerSpriteChoiceFromPosition:
; Menu positions are 1-based; bad positions fall back to the default sprite.
	and a
	jr z, .default
	cp 11
	jr nc, .default
	dec a
	ld e, a
	ld d, 0
	ld hl, MalePlayerSpriteChoiceOptions
	call IsEffectiveFemalePlayer
	jr nc, .got_table
	ld hl, FemalePlayerSpriteChoiceOptions

.got_table
	add hl, de
	ld a, [hl]
	jr .save

.default
	xor a

.save
	ld [wPlayerSpriteChoice], a
	ret

PlayerSpriteChoiceSprites:
	db SPRITE_RIVAL        ; PLAYER_SPRITE_SILVER
	db SPRITE_BLUE         ; PLAYER_SPRITE_BLUE
	db SPRITE_FALKNER      ; PLAYER_SPRITE_FALKNER
	db SPRITE_LANCE        ; PLAYER_SPRITE_LANCE
	db SPRITE_BRUNO        ; PLAYER_SPRITE_BRUNO
	db SPRITE_GIOVANNI     ; PLAYER_SPRITE_GIOVANNI
	db SPRITE_OAK          ; PLAYER_SPRITE_ROCKET
	db SPRITE_MISTY        ; PLAYER_SPRITE_MISTY
	db SPRITE_CLAIR        ; PLAYER_SPRITE_CLAIR
	db SPRITE_ROCKET_GIRL  ; PLAYER_SPRITE_ROCKET_GIRL
	db SPRITE_SABRINA      ; PLAYER_SPRITE_SABRINA
	db SPRITE_WHITNEY      ; PLAYER_SPRITE_WHITNEY
	db SPRITE_JASMINE      ; PLAYER_SPRITE_JASMINE
	db SPRITE_ERIKA        ; PLAYER_SPRITE_ERIKA
	db SPRITE_MORTY        ; PLAYER_SPRITE_MORTY
	db SPRITE_RED          ; PLAYER_SPRITE_ASH
	db SPRITE_KIMONO_GIRL  ; PLAYER_SPRITE_KIMONO_GIRL
	db SPRITE_LASS         ; PLAYER_SPRITE_LASS

PlayerSpriteChoiceGFX:
	dba RivalSpriteGFX
	dba BlueSpriteGFX
	dba FalknerSpriteGFX
	dba LanceSpriteGFX
	dba BrunoSpriteGFX
	dba GiovanniSpriteGFX
	dba OakSpriteGFX
	dba MistySpriteGFX
	dba ClairSpriteGFX
	dba RocketGirlSpriteGFX
	dba SabrinaSpriteGFX
	dba WhitneySpriteGFX
	dba JasmineSpriteGFX
	dba ErikaSpriteGFX
	dba MortySpriteGFX
	dba RedSpriteGFX
	dba KimonoGirlSpriteGFX
	dba LassSpriteGFX

PlayerSpriteChoiceTrainerClasses:
	db RIVAL1
	db BLUE
	db FALKNER
	db CHAMPION
	db BRUNO
	db GIOVANNI
	db POKEMON_PROF
	db MISTY
	db CLAIR
	db GRUNTF
	db SABRINA
	db WHITNEY
	db JASMINE
	db ERIKA
	db MORTY
	db ASH
	db KIMONO_GIRL
	db LASS

MalePlayerSpriteChoiceMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	dn 5, 2 ; rows, columns
	db 8 ; spacing
	dba MalePlayerSpriteChoiceText
	dbw BANK(@), NULL

FemalePlayerSpriteChoiceMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	dn 5, 2 ; rows, columns
	db 8 ; spacing
	dba FemalePlayerSpriteChoiceText
	dbw BANK(@), NULL

MalePlayerSpriteChoiceOptions:
	db PLAYER_SPRITE_DEFAULT
	db PLAYER_SPRITE_ASH
	db PLAYER_SPRITE_SILVER
	db PLAYER_SPRITE_BLUE
	db PLAYER_SPRITE_FALKNER
	db PLAYER_SPRITE_BRUNO
	db PLAYER_SPRITE_MORTY
	db PLAYER_SPRITE_LANCE
	db PLAYER_SPRITE_ROCKET
	db PLAYER_SPRITE_GIOVANNI

FemalePlayerSpriteChoiceOptions:
	db PLAYER_SPRITE_DEFAULT
	db PLAYER_SPRITE_LASS
    db PLAYER_SPRITE_WHITNEY
	db PLAYER_SPRITE_MISTY
	db PLAYER_SPRITE_JASMINE
	db PLAYER_SPRITE_ERIKA
	db PLAYER_SPRITE_CLAIR
	db PLAYER_SPRITE_SABRINA
	db PLAYER_SPRITE_KIMONO_GIRL
	db PLAYER_SPRITE_ROCKET_GIRL

MalePlayerSpriteChoiceText:
	db "Default@"
	db "Ash@"
	db "Silver@"
	db "Blue@"
	db "Falkner@"
	db "Bruno@"
	db "Morty@"
	db "Lance@"
	db "Oak@"
	db "Giovanni@"

FemalePlayerSpriteChoiceText:
	db "Default@"
	db "Lass@"
	db "Whitney@"
	db "Misty@"
	db "Jasmine@"
	db "Erika@"
	db "Clair@"
	db "Sabrina@"
	db "Kimono@"
	db "Rocket@"

WhatSpriteWillYouUseText:
	text "Now, who do you"
	line "look like?"
	prompt
