RunMapSetupScript::
	ldh a, [hMapEntryMethod]
	and $f
	dec a
	ld c, a
	ld b, 0
	ld hl, MapSetupScripts
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSetupScript
	ret

INCLUDE "data/maps/setup_scripts.asm"

ReadMapSetupScript:
.loop
	ld a, [hli]
	cp -1 ; end?
	ret z

	push hl

	ld c, a
	ld b, 0
	ld hl, MapSetupCommands
	add hl, bc
	add hl, bc
	add hl, bc

	; bank
	ld b, [hl]
	inc hl

	; address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Bit 7 of the bank indicates a parameter.
	; This is left unused.
	bit 7, b
	jr z, .go

	pop de
	ld a, [de]
	ld c, a
	inc de
	push de

.go
	ld a, b
	and $7f
	rst FarCall

	pop hl
	jr .loop

INCLUDE "data/maps/setup_script_pointers.asm"

EnableTextAcceleration:
	xor a
	ld [wDisableTextAcceleration], a
	ret

ActivateMapAnims:
	ld a, TRUE
	ldh [hMapAnims], a
	ret

SuspendMapAnims:
	xor a ; FALSE
	ldh [hMapAnims], a
	ret

LoadMapObjects:
    call HandleMapDefaultWeather
	ld a, MAPCALLBACK_OBJECTS
	call RunMapCallback
	farcall LoadObjectMasks
	farcall InitializeVisibleSprites
	ret

; DevNote - Weather - By default outdoor maps have
; 25% chance of rain
; 25% chance of sun unless it is night
HandleMapDefaultWeather:
    ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetMapEnvironment
	cp ROUTE
	jr z, .outdoor
	cp TOWN
	jr z, .outdoor
	jr .noWeather
.outdoor
    call Random
    cp 25 percent ; total 1/4 for rain
    jr c, .rain
    call Random
    cp 33 percent ; total 3/4 x 1/3 = 1/4 for sun
    jr c, .sun
.noWeather ; total 3/4 x 2/3 = 1/2 for no weather
    ld a, WEATHER_NONE
    jr .done
.rain
    ld a, WEATHER_RAIN
    jr .done
.sun
    ld a, [wTimeOfDay]
	cp NITE_F
	ret z
    ld a, WEATHER_SUN
.done
    ld [wFieldWeather], a
    ret

MapSetup_DummyFunction: ; unreferenced
	ret

ResetPlayerObjectAction:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_RESET_ACTION_F, [hl]
	ret

SkipUpdateMapSprites:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F, [hl]
	ret

CheckUpdatePlayerSprite:
	nop
	call .CheckBiking
	jr c, .ok
	call .CheckSurfing
	jr c, .ok
	call .CheckSurfing2
	jr c, .ok
	ret

.ok
	call UpdatePlayerSprite
	ret

.CheckBiking:
	and a
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	ret z
	ld a, PLAYER_BIKE
	ld [wPlayerState], a
	scf
	ret

.CheckSurfing2:
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .nope
	cp PLAYER_SKATE
	jr z, .nope
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetMapEnvironment
	cp INDOOR
	jr z, .no_biking
	cp ENVIRONMENT_5
	jr z, .no_biking
	cp DUNGEON
	jr z, .no_biking
	jr .nope
.no_biking
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .nope
.surfing
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	scf
	ret

.nope
	and a
	ret

.CheckSurfing:
	call CheckOnWater
	jr nz, .nope2
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .is_surfing
	cp PLAYER_SURF_PIKA
	jr z, .is_surfing
	ld a, PLAYER_SURF
	ld [wPlayerState], a
.is_surfing
	scf
	ret

.nope2
	and a
	ret

FadeOutMapMusic:
	ld a, 6
	call SkipMusic
	ret

ApplyMapPalettes:
	farcall _UpdateTimePals
	ret

FadeMapMusicAndPalettes:
	ld e, LOW(MUSIC_NONE)
	ld a, [wMusicFadeID]
	ld d, HIGH(MUSIC_NONE)
	ld a, [wMusicFadeID + 1]
	ld a, $4
	ld [wMusicFade], a
	call RotateThreePalettesRight
	ret

ForceMapMusic:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .notbiking
	call MinVolume
	ld a, $88
	ld [wMusicFade], a
.notbiking
	call TryRestartMapMusic
	ret
