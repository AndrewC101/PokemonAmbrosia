; Overworld rain, snow/hail, and sandstorm particles.
; Adapted from Pokemon Polished Crystal code by vulcandth and sprites by
; SourApple, via CrystalShireEngine commit 79b0fdf2e467173e60a8b03a127c31c5f2f9b869.
;
; Weather uses free OAM entries from the end so map objects keep priority.

UpdateOverworldWeatherFrame::
	call UpdateScheduledWeather
	call DoOverworldWeather
	jp WeatherFadeStep

DoOverworldWeather::
; Preserves bc, de, and hl
	push hl
	push de
	push bc

	call GetActiveOverworldWeather
	ld b, a
	ld a, [wOverworldWeatherCooldown]
	or b
	jr z, .done ; no weather and nothing left falling
	call ClearReservedWeatherSprites

	ld hl, wWeatherFlags
	bit WEATHER_PAUSED_F, [hl]
	jr nz, .done

	; Run weather at 30 fps.
	ld a, [wOverworldWeatherTimer]
	and 1
	jr z, .done

	ld a, [wWeatherPalSlot]
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr nc, .no_palette

	call EnsureWeatherObjectPalette

	ld a, [wOverworldWeatherCooldown]
	and a
	jr nz, .on_cooldown

	call GetOverworldWeatherType
	ld hl, .SpawnAndFall
	call JumpTable
	jr .done

.on_cooldown
	; Let the old particles finish falling.
	dec a
	ld [wOverworldWeatherCooldown], a
	jr z, .cooldown_over
	ld a, [wPreviousFieldWeather]
	call TranslateFieldWeatherToOverworld
	ld hl, .FallOnly
	call JumpTable
	jr .done

.cooldown_over
	call ClearWeatherSprites
	ld a, [wFieldWeather]
	ld [wPreviousFieldWeather], a
	call LoadWeatherGraphics
	call EnsureWeatherObjectPalette
	jr .done

.no_palette
	; The allocator already cleared the old particles.
	ld a, [wFieldWeather]
	ld [wPreviousFieldWeather], a
	xor a
	ld [wOverworldWeatherCooldown], a

.done
	ld hl, wOverworldWeatherTimer
	inc [hl]
	pop bc
	pop de
	pop hl
	ret

.SpawnAndFall:
	table_width 2
	dw DoNothing
	dw DoOverworldRain
	dw DoOverworldSnow
	dw DoOverworldSandstorm
	assert_table_length NUM_OVERWORLD_WEATHER_TYPES

.FallOnly:
	table_width 2
	dw DoNothing
	dw DoRainFall
	dw DoSnowFall
	dw DoSandFall
	assert_table_length NUM_OVERWORLD_WEATHER_TYPES

GetActiveOverworldWeather:
; Use the previous weather during cooldown.
	ld a, [wOverworldWeatherCooldown]
	and a
	ld a, [wPreviousFieldWeather]
	jp nz, TranslateFieldWeatherToOverworld
	; fallthrough

GetOverworldWeatherType::
	ld a, [wFieldWeather]
	; fallthrough

TranslateFieldWeatherToOverworld:
	cp WEATHER_HAIL + 1
	jr nc, .none
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, .FieldWeatherTypes
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	and a
	ret
.none
	xor a
	ret

.FieldWeatherTypes:
	table_width 1
	db OVERWORLD_WEATHER_NONE      ; WEATHER_NONE
	db OVERWORLD_WEATHER_RAIN      ; WEATHER_RAIN
	db OVERWORLD_WEATHER_NONE      ; WEATHER_SUN
	db OVERWORLD_WEATHER_SANDSTORM ; WEATHER_SANDSTORM
	db OVERWORLD_WEATHER_SNOW      ; WEATHER_HAIL
	assert_table_length WEATHER_HAIL + 1

GetWeatherTint::
	ld a, [wFieldWeather]
	cp WEATHER_HAIL + 1
	jr nc, .none
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, .FieldWeatherTints
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	and a
	ret
.none
	xor a
	ret

.FieldWeatherTints:
	table_width 1
	db WEATHER_TINT_NONE      ; WEATHER_NONE
	db WEATHER_TINT_RAIN      ; WEATHER_RAIN
	db WEATHER_TINT_SUN       ; WEATHER_SUN
	db WEATHER_TINT_SANDSTORM ; WEATHER_SANDSTORM
	db WEATHER_TINT_SNOW      ; WEATHER_HAIL
	assert_table_length WEATHER_HAIL + 1

; Map setup

HandleMapDefaultWeather::
	call UpdateTime
	call RefreshScheduledWeatherRoll

	ld hl, wWeatherFlags
	res WEATHER_SETUP_PENDING_F, [hl]
	; Link returns skip object callbacks, so retain a saved fixed override.
	ldh a, [hMapEntryMethod]
	cp MAPSETUP_LINKRETURN
	jr nz, .select_profile
	ld a, [wScheduledWeatherProfile]
	and WEATHER_PROFILE_MASK
	cp WEATHER_PROFILE_FIXED
	ret z

.select_profile
	call GetMapEnvironment
	cp ROUTE
	jr z, .outdoor
	cp TOWN
	jr z, .outdoor

	ld a, WEATHER_PROFILE_FIXED
	call SetScheduledWeatherProfile
	xor a
	ld [wFieldWeather], a
	ret

.outdoor
	call GetMapScheduledWeatherProfile
	call SetScheduledWeatherProfile
	ld a, WEATHER_UNSET
	ld [wFieldWeather], a
	ld hl, wWeatherFlags
	set WEATHER_SETUP_PENDING_F, [hl]
	ret

RefreshScheduledWeatherRoll:
; Return carry when a new roll is generated.
	call GetScheduledWeatherTime
	ld a, [wScheduledWeatherProfile]
	cp WEATHER_SCHEDULE_INITIALIZED
	jr c, .initialize
	cp WEATHER_SCHEDULE_INITIALIZED + NUM_WEATHER_PROFILES
	jr nc, .initialize

	ld a, [wScheduledWeatherRoll]
	cp SCHEDULED_WEATHER_MIN
	jr c, .initialize
	cp SCHEDULED_WEATHER_MAX + 1
	jr nc, .initialize

	ld a, [wScheduledWeatherDay]
	cp c
	jr nz, .new_roll
	ld a, [wScheduledWeatherSlot]
	cp b
	jr nz, .new_roll
	and a
	ret

.initialize
	; Without a valid saved profile, preserve the current map until it reloads.
	ld a, WEATHER_SCHEDULE_INITIALIZED | WEATHER_PROFILE_FIXED
	ld [wScheduledWeatherProfile], a
.new_roll
	ld a, c
	ld [wScheduledWeatherDay], a
	ld a, b
	ld [wScheduledWeatherSlot], a
	call Random
	and %11
	inc a
	ld [wScheduledWeatherRoll], a
	scf
	ret

GetScheduledWeatherTime:
; Return the current ten-minute slot in b and day in c.
	ldh a, [hHours]
	ld b, a
	add a
	add b
	add a ; hour * 6
	ld b, a
	ldh a, [hMinutes]
	ld e, a
	ld d, 0
	ld hl, WeatherMinuteSlots
	add hl, de
	ld a, [hl]
	add b
	ld b, a
	ld a, [wCurDay]
	ld c, a
	ret

WeatherMinuteSlots:
for n, 60
	db n / 10
endr
WeatherMinuteSlotsEnd:
	assert WeatherMinuteSlotsEnd - WeatherMinuteSlots == 60

GetMapScheduledWeatherProfile:
; Return the special profile for this map, or the regional profile.
	; b = map group, c = map number
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	ld hl, .MapProfiles
.loop
	ld a, [hli]
	cp -1
	jr z, .regional
	cp b
	jr nz, .next
	ld a, [hl]
	cp c
	jr z, .found
.next
	inc hl
	inc hl
	jr .loop
.found
	inc hl
	ld a, [hl]
	ret
.regional
	ld a, WEATHER_PROFILE_REGIONAL
	ret

.MapProfiles:
	db GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY, WEATHER_PROFILE_MOUNTAIN
	db GROUP_ROUTE_23, MAP_ROUTE_23, WEATHER_PROFILE_MOUNTAIN
	db GROUP_ROUTE_26, MAP_ROUTE_26, WEATHER_PROFILE_MOUNTAIN
	db GROUP_ROUTE_28, MAP_ROUTE_28, WEATHER_PROFILE_MOUNTAIN
	db GROUP_ROUTE_45, MAP_ROUTE_45, WEATHER_PROFILE_MOUNTAIN
	db GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE, WEATHER_PROFILE_MOUNTAIN
	db -1

SetScheduledWeatherProfile:
	or WEATHER_SCHEDULE_INITIALIZED
	ld [wScheduledWeatherProfile], a
	ret

ClearFieldWeatherAndLock::
; Used before a full-screen reload; discard any outgoing particle state now.
	xor a
	ld [wFieldWeather], a
	ld [wPreviousFieldWeather], a
	ld [wOverworldWeatherCooldown], a
	ld a, WEATHER_SCHEDULE_INITIALIZED | WEATHER_PROFILE_FIXED
	ld [wScheduledWeatherProfile], a
	ret

SetRainFieldWeatherAndLock::
; Cianwood changes to rain while the map is still visible.
	ld a, WEATHER_SCHEDULE_INITIALIZED | WEATHER_PROFILE_FIXED
	ld [wScheduledWeatherProfile], a
	ld a, WEATHER_RAIN
	jp ApplyScheduledFieldWeather

ResolvePendingMapWeather:
	ld hl, wWeatherFlags
	bit WEATHER_SETUP_PENDING_F, [hl]
	ret z
	res WEATHER_SETUP_PENDING_F, [hl]

	ld a, [wFieldWeather]
	cp WEATHER_UNSET
	jr z, .scheduled
	ld a, WEATHER_PROFILE_FIXED
	jp SetScheduledWeatherProfile

.scheduled
	call ResolveScheduledFieldWeather
	ld [wFieldWeather], a
	ret

ResolveScheduledFieldWeather:
	ld a, [wScheduledWeatherProfile]
	and WEATHER_PROFILE_MASK
	cp WEATHER_PROFILE_MOUNTAIN
	jr z, .mountain
	cp WEATHER_PROFILE_REGIONAL
	jr nz, .fixed

	farcall RegionCheck
	ld a, e
	and a
	ld hl, JohtoScheduledWeather
	jr z, .lookup
	ld hl, KantoScheduledWeather
	jr .lookup

.mountain
	ld hl, MountainScheduledWeather
.lookup
	ld a, [wScheduledWeatherRoll]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp WEATHER_SUN
	ret nz
	ld a, [wTimeOfDay]
	cp NITE_F
	jr z, .clear
	ld a, WEATHER_SUN
	ret
.clear
	xor a
	ret

.fixed
	ld a, [wFieldWeather]
	ret

; Entries correspond to saved rolls 1..4 (zero-based indices 0..3).
JohtoScheduledWeather:
	db WEATHER_NONE, WEATHER_NONE, WEATHER_RAIN, WEATHER_SUN
JohtoScheduledWeatherEnd:
	assert JohtoScheduledWeatherEnd - JohtoScheduledWeather == NUM_SCHEDULED_WEATHERS

KantoScheduledWeather:
	db WEATHER_RAIN, WEATHER_SUN, WEATHER_NONE, WEATHER_NONE
KantoScheduledWeatherEnd:
	assert KantoScheduledWeatherEnd - KantoScheduledWeather == NUM_SCHEDULED_WEATHERS

MountainScheduledWeather:
	db WEATHER_HAIL, WEATHER_SANDSTORM, WEATHER_RAIN, WEATHER_SUN
MountainScheduledWeatherEnd:
	assert MountainScheduledWeatherEnd - MountainScheduledWeather == NUM_SCHEDULED_WEATHERS

UpdateScheduledWeather:
; hHours/hMinutes were refreshed earlier in the overworld frame.
	ld a, [wWeatherFlags]
	bit WEATHER_PAUSED_F, a
	ret nz
	bit WEATHER_SETUP_PENDING_F, a
	ret nz
	ld a, [wOverworldWeatherTimer]
	and WEATHER_SCHEDULE_CHECK_MASK
	ret nz

	push bc
	push de
	push hl
	call RefreshScheduledWeatherRoll
	jr nc, .done

	ld a, [wScheduledWeatherProfile]
	and WEATHER_PROFILE_MASK
	cp WEATHER_PROFILE_FIXED
	jr z, .done
	call ResolveScheduledFieldWeather
	ld b, a
	ld a, [wFieldWeather]
	cp b
	jr z, .done
	ld a, b
	call ApplyScheduledFieldWeather
.done
	pop hl
	pop de
	pop bc
	ret

ApplyScheduledFieldWeather:
; a = destination WEATHER_* value
	push af
	call SaveWeatherFadeSource
	call ClearWeatherSprites
	pop af
	ld [wFieldWeather], a
	ld [wPreviousFieldWeather], a
	xor a
	ld [wOverworldWeatherCooldown], a
	call SelectWeatherObjPalette
	call LoadWeatherGraphics
	farcall LoadMapPals
	jp MapConnWeatherFade

SetCurrentWeather::
	call ResolvePendingMapWeather
	ld a, [wPreviousFieldWeather]
	ld b, a
	ld a, [wFieldWeather]
	cp b
	ret z ; same weather continues across the map change

	ld a, b
	call TranslateFieldWeatherToOverworld
	jr z, .start_now
	ld a, OVERWORLD_WEATHER_COOLDOWN
	ld [wOverworldWeatherCooldown], a
	ret

.start_now
	ld a, [wFieldWeather]
	ld [wPreviousFieldWeather], a
	xor a
	ld [wOverworldWeatherCooldown], a
	call LoadWeatherGraphics
	jp EnsureWeatherObjectPalette

ClearWeather::
	call GetActiveOverworldWeather
	jr z, .no_particles
	call ClearWeatherSprites
.no_particles
	xor a
	ld [wWeatherFlags], a
	ld [wOverworldWeatherTimer], a
	ld [wOverworldWeatherCooldown], a
	ld [wWeatherFadeSteps], a
	ld [wWeatherFadeFrame], a
	ld [wPreviousFieldWeather], a
	ld [wPalTintWeather], a
	ld [wPrevPalTintWeather], a
	ld a, WEATHER_PAL_SLOT_NONE
	ld [wWeatherPalSlot], a
	ret

SetWeatherPaletteSlot::
; a = physical OBJ palette, or WEATHER_PAL_SLOT_NONE
	push bc
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr c, .valid
	ld a, WEATHER_PAL_SLOT_NONE
.valid
	ld b, a
	ld a, [wWeatherPalSlot]
	cp b
	jr z, .done
	call ClearWeatherSprites
	ld a, b
	ld [wWeatherPalSlot], a
.done
	pop bc
	ret

SelectWeatherObjPalette::
; Scan every active object, including off-screen objects.
	push bc
	push de
	push hl
	call GetActiveOverworldWeather
	jp z, .no_particles

	ld d, (1 << PAL_OW_EMOTE) | (1 << PAL_OW_PLAYER) ; used palettes
	ld e, NUM_OBJECTS
	ld bc, wMapObjects
	ld hl, wObjectMasks
.object_loop
	ld a, [hli]
	and a
	jr z, .active
	; Always count the player, even if its mask is stale.
	ld a, e
	cp NUM_OBJECTS
	jp nz, .next_object
.active
	push hl ; mask cursor
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .restore_mask_cursor

	ld hl, MAPOBJECT_PALETTE
	add hl, bc
	ld a, [hl]
	and MAPOBJECT_PALETTE_MASK
	jr nz, .explicit_palette
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	call GetSpritePalette
	jr .mark_palette

.explicit_palette
	swap a
	and OAM_PALETTE
.mark_palette
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr c, .mark_known_palette
	; Unknown palette: do not risk overwriting one in use.
	ld d, $ff
	jr .restore_mask_cursor
.mark_known_palette
	push bc
	ld c, a
	ld b, 0
	ld hl, .PaletteBits
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	pop bc
.restore_mask_cursor
	pop hl
.next_object
	ld a, c
	add MAPOBJECT_LENGTH
	ld c, a
	jr nc, .next_object_no_carry
	inc b
.next_object_no_carry
	dec e
	jp nz, .object_loop

	; Keep the old slot across connections when possible.
	ld a, [wWeatherPalSlot]
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr nc, .try_preferred
	cp PAL_OW_EMOTE
	jr z, .try_preferred
	cp PAL_OW_PLAYER
	jr z, .try_preferred
	call .PaletteIsFree
	jr z, .select

.try_preferred
	ld hl, .PreferredSlots
.preference_loop
	ld a, [hli]
	cp WEATHER_PAL_SLOT_NONE
	jr z, .select
	push hl
	call .PaletteIsFree
	pop hl
	jr nz, .preference_loop
	jr .select

.no_particles
	ld a, WEATHER_PAL_SLOT_NONE
.select
	call SetWeatherPaletteSlot
	pop hl
	pop de
	pop bc
	ret

.PaletteIsFree:
; Return z if palette a is not set in d.
	ld c, a
	ld b, 0
	ld hl, .PaletteBits
	add hl, bc
	ld a, [hl]
	and d
	ld a, c
	ret

.PreferredSlots:
	db PAL_OW_TREE, PAL_OW_PINK
	db PAL_OW_RED, PAL_OW_BLUE, PAL_OW_GREEN, PAL_OW_BROWN
	db WEATHER_PAL_SLOT_NONE

.PaletteBits:
	for n, NUM_OVERWORLD_OBJ_PALETTES
		db 1 << n
	endr

ClearReservedWeatherSprites:
; Clear weather from OAM reserved by another field effect.
	ld a, [wStateFlags]
	bit LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, a
	ret z
	push hl
	push bc
	ld hl, wShadowOAM + (OAM_COUNT - 12) * OBJ_SIZE
	ld b, 12
.loop
	call IsWeatherSprite
	jr nz, .next
	push bc
	ld b, OBJ_SIZE
	xor a
.clear
	ld [hli], a
	dec b
	jr nz, .clear
	pop bc
	ld a, l
	sub OBJ_SIZE
	ld l, a
.next
	ld a, l
	add OBJ_SIZE
	ld l, a
	dec b
	jr nz, .loop
	pop bc
	pop hl
	ret

ClearWeatherSprites::
	push hl
	push bc
	ld hl, wShadowOAM
	ld b, NUM_SPRITE_OAM_STRUCTS
.loop
	call IsWeatherSprite
	jr nz, .next
	push bc
	ld b, SPRITEOAMSTRUCT_LENGTH
	xor a
.clear
	ld [hli], a
	dec b
	jr nz, .clear
	pop bc
	ld a, l
	sub SPRITEOAMSTRUCT_LENGTH
	ld l, a
.next
	ld a, l
	add SPRITEOAMSTRUCT_LENGTH
	ld l, a
	dec b
	jr nz, .loop
	pop bc
	pop hl
	ret

PauseWeather::
	ld hl, wWeatherFlags
	set WEATHER_PAUSED_F, [hl]
	call ClearWeatherSprites
	jp CancelWeatherFade

ResumeWeather::
	ld hl, wWeatherFlags
	res WEATHER_PAUSED_F, [hl]
	ret

PrepareWeatherForFullScreen::
	call ClearWeatherSprites
	jp CancelWeatherFade

LoadWeatherGraphics::
; Load the active particle tiles into VRAM bank 0.
	call GetActiveOverworldWeather
	and a
	ret z
	push hl
	push de
	push bc
	ld c, a
	ld b, 0
	ld hl, WeatherGraphics - 3
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld c, [hl]
	ld b, BANK(@)
	ld hl, vTiles0 tile OVERWORLD_WEATHER_TILE
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop bc
	pop de
	pop hl
	ret

MACRO weather_gfx
	dw \1
	db \2
ENDM

WeatherGraphics:
	table_width 3
	weather_gfx RainGFX, 2
	weather_gfx SnowGFX, 1
	weather_gfx SandGFX, 1
	assert_table_length NUM_OVERWORLD_WEATHER_TYPES - 1

RainGFX: INCBIN "gfx/overworld/rain_splash.2bpp"
RainGFXEnd:
	assert RainGFXEnd - RainGFX == 2 tiles
SnowGFX: INCBIN "gfx/overworld/snow.2bpp"
SnowGFXEnd:
	assert SnowGFXEnd - SnowGFX == 1 tiles
; The source PNG contains a second unused tile; the renderer uses the first.
SandGFX: INCBIN "gfx/overworld/sand.2bpp", 0, 1 tiles
SandGFXEnd:
	assert SandGFXEnd - SandGFX == 1 tiles

GetWeatherObjectPalettePointer:
; a: OVERWORLD_WEATHER_*; returns hl
	dec a
	add a
	add a ; four times of day per weather
	ld b, a
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add b
	add a
	add a
	add a ; one eight-byte CGB palette
	ld c, a
	ld b, 0
	ld hl, WeatherObjectPalettes
	add hl, bc
	ret

LoadWeatherObjectPalette::
	push af
	push bc
	push de
	push hl
	call GetActiveOverworldWeather
	jr z, .done
	ld c, a
	ld a, [wWeatherPalSlot]
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr nc, .done
	push af
	ld a, c
	call GetWeatherObjectPalettePointer
	pop af
	add a
	add a
	add a
	add LOW(wOBPals1)
	ld e, a
	adc HIGH(wOBPals1)
	sub e
	ld d, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

EnsureWeatherObjectPalette:
; Restore the particle palette after an object palette reload.
	call LoadWeatherObjectPalette
	call GetActiveOverworldWeather
	ret z
	ld a, [wWeatherFlags]
	bit WEATHER_FADE_ACTIVE_F, a
	ret nz
	ld a, [wWeatherPalSlot]
	cp NUM_OVERWORLD_OBJ_PALETTES
	ret nc
	push hl
	push de
	push bc
	add a
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, wOBPals1
	add hl, bc
	ld de, wOBPals2
	ld a, e
	add c
	ld e, a
	jr nc, .bank
	inc d
.bank
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	push hl
	push de
	ld b, PAL_SIZE
.compare_loop
	ld a, [de]
	cp [hl]
	jr nz, .copy
	inc de
	inc hl
	dec b
	jr nz, .compare_loop
	pop de
	pop hl
	jr .restore_bank
.copy
	pop de
	pop hl
	ld bc, 1 palettes
	call CopyBytes
	ld a, TRUE
	ldh [hCGBPalUpdate], a
.restore_bank
	pop af
	ldh [rSVBK], a
	pop bc
	pop de
	pop hl
	ret

WeatherObjectPalettes:
	table_width PAL_SIZE
	assert NUM_DAYTIMES == 4
; rain
	RGB 28, 31, 16, 21, 21, 31, 16, 22, 31, 00, 00, 00 ; morn
	RGB 27, 31, 27, 21, 21, 31, 16, 22, 31, 00, 00, 00 ; day
	RGB 15, 14, 24, 16, 14, 19, 16, 16, 31, 00, 00, 00 ; nite
	RGB 31, 21, 14, 16, 14, 19, 16, 16, 31, 00, 00, 00 ; eve
; snow/hail
	RGB 28, 31, 16, 31, 31, 31, 31, 31, 31, 00, 00, 00 ; morn
	RGB 27, 31, 27, 31, 31, 31, 31, 31, 31, 00, 00, 00 ; day
	RGB 15, 14, 24, 24, 24, 31, 24, 24, 31, 00, 00, 00 ; nite
	RGB 31, 21, 14, 31, 31, 31, 31, 31, 31, 00, 00, 00 ; eve
; sandstorm
	RGB 28, 31, 16, 22, 19, 09, 11, 05, 00, 15, 09, 02 ; morn
	RGB 27, 31, 27, 22, 19, 09, 11, 05, 00, 15, 09, 02 ; day
	RGB 15, 14, 24, 16, 14, 10, 08, 04, 05, 10, 09, 09 ; nite
	RGB 31, 21, 14, 22, 19, 09, 11, 05, 00, 15, 09, 02 ; eve
	assert_table_length (NUM_OVERWORLD_WEATHER_TYPES - 1) * NUM_DAYTIMES

; OAM helpers

FillUnusedOAMPreservingWeather::
; Hide unused OAM without clearing weather particles.
	ld a, [wStateFlags]
	bit LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, a
	ld b, OAM_SIZE
	jr z, .got_boundary
	ld b, (OAM_COUNT - 12) * OBJ_SIZE
.got_boundary
	ldh a, [hUsedSpriteIndex]
	cp b
	ret nc
	ld l, a
	ld c, (OAM_COUNT - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
	ld a, b
	cp OAM_SIZE
	jr z, .got_start
	ld c, (OAM_COUNT - 12 - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
.got_start
	ld h, HIGH(wShadowOAM)
	ld de, OBJ_SIZE
.loop
	ld a, l
	cp c
	jr c, .hide
	call IsWeatherSprite
	jr z, .next
.hide
	ld [hl], OAM_YCOORD_HIDDEN
.next
	add hl, de
	ld a, b
	cp l
	jr nz, .loop
	; Keep the old OAM cleanup routine's return value in c.
	ld c, OAM_YCOORD_HIDDEN
	ret

IsWeatherSprite::
; hl = OAM entry; return z for a visible weather particle
	push bc
	ld a, [hl]
	and a
	jr z, .no
	cp OAM_YCOORD_HIDDEN
	jr nc, .no
	inc l
	inc l
	ld a, [hli]
	cp OVERWORLD_WEATHER_TILE
	jr z, .tile_ok
	cp OVERWORLD_RAIN_SPLASH_TILE
	jr nz, .no_back3
.tile_ok
	ld c, [hl]
	dec l
	dec l
	dec l
	ld a, [wWeatherPalSlot]
	cp c
	pop bc
	ret
.no_back3
	dec l
	dec l
	dec l
.no
	or 1 ; nz
	pop bc
	ret

ScanForEmptyOAM:
; Search backwards for free OAM. Returns carry if none is available.
	ldh a, [hUsedSpriteIndex]
	ld c, a
	ld a, [wStateFlags]
	bit LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, a
	ld l, OAM_SIZE - SPRITEOAMSTRUCT_LENGTH
	ld b, (OAM_COUNT - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
	jr z, .got_end
	ld l, (OAM_COUNT - 12) * OBJ_SIZE - SPRITEOAMSTRUCT_LENGTH
	ld b, (OAM_COUNT - 12 - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
.got_end
	ld a, c
	cp b
	jr nc, .got_start
	ld c, b
.got_start
	ld h, HIGH(wShadowOAM)
.loop
	ld a, l
	cp c
	jr c, .none
	ld a, [hl]
	and a
	ret z
	cp OAM_YCOORD_HIDDEN
	jr c, .used
	and a
	ret
.used
	ld a, l
	sub SPRITEOAMSTRUCT_LENGTH
	ld l, a
	jr nc, .loop
.none
	scf
	ret

SetWeatherParticle:
; hl = tile byte, a = tile ID
	ld [hli], a
	ld a, [wWeatherPalSlot]
	ld [hl], a
	ret

GetPlayerStepY:
; Ignore camera movement from screen shake.
	ld a, [wWeatherFlags]
	bit WEATHER_IGNORE_PLAYER_Y_F, a
	ld a, 0
	ret nz
	ld a, [wPlayerStepVectorY]
	ret

IsEvenSpriteIndex:
	ld a, e
	rra
	rra
	and 1
	ret

Despawn:
; de = OAM entry
	ld h, d
	ld l, e
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

ForEachWeatherSprite:
; Call hl for each particle. de points to its OAM entry.
	ld de, wShadowOAM + (OAM_COUNT - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
	ld b, MAX_OVERWORLD_WEATHER_PARTICLES
	ld a, [wStateFlags]
	bit LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, a
	jr z, .loop
	ld de, wShadowOAM + (OAM_COUNT - 12 - MAX_OVERWORLD_WEATHER_PARTICLES) * OBJ_SIZE
.loop
	push hl
	push bc
	ld h, d
	ld l, e
	call IsWeatherSprite
	pop bc
	pop hl
	jr nz, .next
	push hl
	push bc
	push de
	call _hl_
	pop de
	pop bc
	pop hl
.next
	ld a, e
	add SPRITEOAMSTRUCT_LENGTH
	ld e, a
	dec b
	jr nz, .loop
	ret

; Rain

DoOverworldRain:
rept 3
	call ScanForEmptyOAM
	jr c, .done_spawning
	call SpawnRainDrop
endr

.done_spawning
	; fallthrough
DoRainFall:
	ld hl, .Update
	call ForEachWeatherSprite

	; Splashes last four weather ticks.
	ld a, [wOverworldWeatherTimer]
	and %1110
	ret nz
	ld hl, .HideSplash
	jp ForEachWeatherSprite

.HideSplash:
	ld hl, SPRITEOAMSTRUCT_TILE_ID
	add hl, de
	ld a, [hl]
	cp RAINSPLASH_TILE
	ret nz
	jp Despawn

.Update:
	ld hl, SPRITEOAMSTRUCT_TILE_ID
	add hl, de
	ld a, [hl]
	cp RAINSPLASH_TILE
	jr z, .update_splash

	; 5% chance to splash.
	call Random
	cp 5 percent
	jr nc, .fall
	ld [hl], RAINSPLASH_TILE
	ret

.fall
	; Offset movement so particles stay in place relative to the map.
	call GetPlayerStepY
	add a
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	add c
	add 8 ; minimum fall speed
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	ld [de], a

	ld a, [wPlayerStepVectorX]
	add a
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	ld b, a
	ld a, c
	sub b
	jp c, Despawn
	sub 4 ; minimum leftward drift
	jp c, Despawn
	ld [hl], a
	ret

.update_splash
	; Splashes only follow the camera.
	call GetPlayerStepY
	add a
	ld c, a
	ld a, [de]
	sub c
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	ld [de], a
	ld a, [wPlayerStepVectorX]
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld [hl], a
	ret

SpawnRainDrop:
; hl = free OAM entry
	; Enter from the top or right edge.
	call Random
	and 1
	jr z, .from_right
	ld [hl], 1 ; y (just above the screen)
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, RAINDROP_TILE
	jp SetWeatherParticle

; Snow

DoOverworldSnow:
rept 2
	call ScanForEmptyOAM
	jr c, .done_spawning
	call SpawnSnowFlake
endr

.done_spawning
	; fallthrough
DoSnowFall:
	ld hl, .Update
	jp ForEachWeatherSprite

.Update:
	; Occasionally melt.
	call Random
	cp 1 percent
	jr nc, .ok
	call Random
	cp 10 percent
	jp c, Despawn
.ok
	call GetPlayerStepY
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add c
	add 2 ; minimum fall speed
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	ld [de], a

	; Wiggle left half the time.
	ld a, [wPlayerStepVectorX]
	add a
	ld c, a
	call Random
	and 1
	jr nz, .no_wiggle
	inc c
.no_wiggle
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c ; c is negative while walking left, so ignore the carry
	jp z, Despawn ; reached the left edge
	cp SCREEN_WIDTH_PX + 2 * TILE_WIDTH
	jp nc, Despawn ; off the right edge, or wrapped past the left edge
	ld [hl], a
	ret

SpawnSnowFlake:
; hl = free OAM entry
	; 40% chance to spawn.
	call Random
	cp 40 percent
	ret nc
	; Enter from the right one-quarter of the time.
	call Random
	and %11
	jr z, .from_right
	ld [hl], 1
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, SNOWFLAKE_TILE
	jp SetWeatherParticle

; Sandstorm

DoOverworldSandstorm:
rept 3
	call ScanForEmptyOAM
	jr c, .done_spawning
	call SpawnSandDrop
endr

.done_spawning
	; fallthrough
DoSandFall:
	ld hl, .Update
	jp ForEachWeatherSprite

.Update:
	; 5% chance to vanish.
	call Random
	cp 5 percent
	jp c, Despawn

	; Blow up and left.
	call GetPlayerStepY
	add a
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	add c
	sub 4 ; minimum rise speed
	jp c, Despawn
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	and a
	jp z, Despawn
	ld [de], a

	ld a, [wPlayerStepVectorX]
	add a
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	ld b, a
	ld a, c
	sub b
	jp c, Despawn
	sub 12 ; minimum leftward speed
	jp c, Despawn
	ld [hl], a
	ret

SpawnSandDrop:
; hl = free OAM entry
	; Enter from the bottom or right edge.
	call Random
	and 1
	jr z, .from_right
	ld [hl], SCREEN_HEIGHT_PX + TILE_WIDTH
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, SANDSTORM_TILE
	jp SetWeatherParticle

; Weather tint
; Each channel becomes min(31, (channel * multiplier + 8) / 16 + add).

ApplyMapWeatherPalettes::
; Leave the text palette unchanged.
	push af
	push bc
	push de
	push hl
	ld hl, wBGPals1
	ld c, PAL_BG_TEXT
	call ApplyWeatherTint
	ld hl, wOBPals1
	ld c, NUM_OVERWORLD_OBJ_PALETTES
	call ApplyWeatherTint
	call LoadWeatherObjectPalette
	pop hl
	pop de
	pop bc
	pop af
	ret

ApplyWeatherTint::
; hl = first palette, c = number of palettes
	push af
	push bc
	push de
	push hl
	ldh a, [rSVBK]
	push af

	ld a, BANK(wFieldWeather)
	ldh [rSVBK], a
	call GetWeatherTint
	jp z, .done
	; Six bytes per weather/time row.
	dec a
	add a
	add a ; * NUM_DAYTIMES
	ld b, a
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add b
	ld e, a
	add a
	add e ; * 3
	add a ; * 6
	ld e, a
	ld d, 0
	push hl
	ld hl, WeatherTints
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, c
	add a
	add a
	ld c, a
.color_loop
	push bc
	push de
	ld a, [hli]
	ld b, a ; b = low byte: gggrrrrr
	ld c, [hl] ; c = high byte: 0bbbbbgg
	dec hl
	push hl

	; red
	ld a, b
	and %11111
	call TintChannel
	ld l, a

	; green
	ld a, c
	and %11
	add a
	add a
	add a
	ld h, a
	ld a, b
	swap a
	rrca
	and %111
	or h
	call TintChannel
	ld h, a

	; blue
	ld a, c
	rrca
	rrca
	and %11111
	call TintChannel

	; Pack the three channels again.
	add a
	add a
	ld c, a
	ld a, h
	rrca
	rrca
	rrca
	and %11
	or c
	ld c, a
	ld a, h
	and %111
	swap a
	add a
	or l
	ld b, a

	pop hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	pop de
	pop bc
	dec c
	jp nz, .color_loop

.done
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	pop bc
	pop af
	ret

TintChannel:
; a = channel, de = multiplier and add
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, 8 ; round to nearest
	ld a, [de]
	inc de
.multiply
	and a
	jr z, .multiplied
	add hl, bc
	dec a
	jr .multiply
.multiplied
	; Divide hl by 16.
	ld a, l
	srl h
	rra
	srl h
	rra
	srl h
	rra
	srl h
	rra
	ld c, a
	ld a, [de]
	inc de
	add c
	cp 32
	jr c, .ok
	ld a, 31
.ok
	pop bc
	pop hl
	ret

; red mult, red add, green mult, green add, blue mult, blue add
MACRO weather_tint
	db \1, \2, \3, \4, \5, \6
ENDM

WeatherTints:
	table_width 6
; rain
	weather_tint 9, 2, 10, 1, 8, 4 ; morn
	weather_tint 10, 2, 10, 1, 9, 3 ; day
	weather_tint 10, 1, 10, 1, 9, 1 ; nite
	weather_tint 8, 2, 11, 0, 9, 3 ; eve
; snow
	weather_tint 12, 2, 12, 3, 12, 6 ; morn
	weather_tint 12, 2, 12, 3, 12, 6 ; day
	weather_tint 11, 1, 11, 1, 11, 3 ; nite
	weather_tint 12, 2, 12, 2, 12, 4 ; eve
; sandstorm
	weather_tint 11, 7, 10, 5,  8, 1 ; morn
	weather_tint 11, 7, 10, 5,  8, 1 ; day
	weather_tint 10, 3, 9, 2, 8, 0 ; nite
	weather_tint 11, 6, 10, 4,  8, 1 ; eve
; sun
	weather_tint 16, 2, 16, 2, 16, 1 ; morn
	weather_tint 16, 2, 16, 2, 16, 2 ; day
	weather_tint 16, 1, 16, 1, 16, 1 ; nite
	weather_tint 16, 2, 16, 1, 16, 0 ; eve
	assert_table_length (NUM_WEATHER_TINTS - 1) * NUM_DAYTIMES

; Map connection fade

SaveWeatherFadeSource::
; Save the displayed palettes before loading the connected map.
	push af
	push bc
	push de
	push hl
	call GetWeatherTint
	ld [wPrevPalTintWeather], a
	ld [wPalTintWeather], a
	xor a
	ld [wWeatherFadeSteps], a
	ld [wWeatherFadeFrame], a
	ld hl, wWeatherFlags
	res WEATHER_FADE_ACTIVE_F, [hl]
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld de, wWeatherFadeStartPalettes
	ld bc, WEATHER_FADE_BUFFER_SIZE
	call CopyBytes
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	pop bc
	pop af
	ret

RecordMapPalsWeather::
	call GetWeatherTint
	ld [wPalTintWeather], a
	ret

MapConnWeatherFade::
	call RecordMapPalsWeather
	ld a, [wPrevPalTintWeather]
	ld b, a
	ld a, [wPalTintWeather]
	cp b
	jr nz, .fade
	call CancelWeatherFade
	newfarjp _UpdateTimePals

.fade
	ld a, WEATHER_FADE_STEPS
	ld [wWeatherFadeSteps], a
	xor a
	ld [wWeatherFadeFrame], a
	ld hl, wWeatherFlags
	set WEATHER_FADE_ACTIVE_F, [hl]
	; Keep the particle palette out of the fade.
	ld a, [wWeatherPalSlot]
	cp NUM_OVERWORLD_OBJ_PALETTES
	jr nc, .start
	add a
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, wOBPals1
	add hl, bc
	call SetWeatherFadePalette
.start
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

CancelWeatherFade::
	xor a
	ld [wWeatherFadeSteps], a
	ld [wWeatherFadeFrame], a
	ld hl, wWeatherFlags
	res WEATHER_FADE_ACTIVE_F, [hl]
	ret

WeatherFadeStep::
; Update four palettes per frame.
	ld a, [wWeatherFlags]
	bit WEATHER_PAUSED_F, a
	ret nz
	bit WEATHER_FADE_ACTIVE_F, a
	ret z
	ld a, [wWeatherFadeSteps]
	and a
	jp z, .cancel
	push hl
	push de
	push bc
	ld b, a ; steps left (WEATHER_FADE_STEPS .. 1)

	ld a, [wWeatherFadeFrame]
	ld c, a
	inc a
	and %11
	ld [wWeatherFadeFrame], a
	; wOBPals2 follows wBGPals2, so all four groups are contiguous.
	ld a, c
	swap a
	add a ; * 4 palettes (32 bytes)
	add LOW(wBGPals2)
	ld l, a
	adc HIGH(wBGPals2)
	sub l
	ld h, a
	ld a, c
	cp %11 ; last quarter of the step?
	push af
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld a, b
	dec a
	jp z, .last_step
	push hl
	ld a, WEATHER_FADE_STEPS
	sub b
	ld c, a
	ld b, 0
	ld hl, WeatherFadeProgress
	add hl, bc
	ld a, [hl]
	ldh [hWeatherFadeProgress], a
	pop hl

	ld c, 4 * NUM_PAL_COLORS
.color_loop
	push bc
	push hl
	ld bc, wWeatherFadeStartPalettes - wBGPals2
	add hl, bc
	ld a, [hli]
	ld e, a ; start low:  gggrrrrr
	ld d, [hl] ; start high: 0bbbbbgg
	pop hl
	push hl
	ld bc, wBGPals1 - wBGPals2
	add hl, bc
	ld a, [hli]
	ld c, a ; target low
	ld b, [hl] ; target high
	cp e
	jr nz, .lerp
	ld a, b
	cp d
	jp z, .store
.lerp

	; red
	ld a, c
	and %11111
	ld l, a
	ld a, e
	and %11111
	call LerpChannel
	push af

	; green
	ld a, b
	and %11
	add a
	add a
	add a
	ld l, a
	ld a, c
	swap a
	rrca
	and %111
	or l
	ld l, a
	ld a, d
	and %11
	add a
	add a
	add a
	ld h, a
	ld a, e
	swap a
	rrca
	and %111
	or h
	call LerpChannel
	push af

	; blue
	ld a, b
	rrca
	rrca
	and %11111
	ld l, a
	ld a, d
	rrca
	rrca
	and %11111
	call LerpChannel

	; repack
	add a
	add a
	ld d, a
	pop af ; green
	ld e, a
	rrca
	rrca
	rrca
	and %11
	or d
	ld d, a
	ld a, e
	and %111
	swap a
	add a
	ld e, a
	pop af ; red
	or e
	ld e, a

.store
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop bc
	dec c
	jp nz, .color_loop
	jr .stepped

.last_step
	; Copy the target exactly on the final step.
	ld d, h
	ld e, l
	ld bc, wBGPals1 - wBGPals2
	add hl, bc
	ld bc, 4 palettes
	call CopyBytes

.stepped
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	pop af
	jr nz, .done ; the rest of this step happens in the next frames
	ld hl, wWeatherFadeSteps
	dec [hl]
	jr nz, .done
	ld hl, wWeatherFlags
	res WEATHER_FADE_ACTIVE_F, [hl]
.done
	pop bc
	pop de
	pop hl
	ret

.cancel
	push hl
	ld hl, wWeatherFlags
	res WEATHER_FADE_ACTIVE_F, [hl]
	pop hl
	ret

WeatherFadeProgress:
for k, 1, WEATHER_FADE_STEPS
	db k * 256 / WEATHER_FADE_STEPS
endr
WeatherFadeProgressEnd:
	assert WeatherFadeProgressEnd - WeatherFadeProgress == WEATHER_FADE_STEPS - 1

LerpChannel:
; a = start channel, l = target channel
	cp l
	ret z
	ld h, a
	jr c, .up
	sub l
	call .Scale
	ld l, a
	ld a, h
	sub l
	ret
.up
	ld a, l
	sub h
	call .Scale
	add h
	ret

.Scale:
; a = (a * progress + 128) / 256
	push hl
	push de
	push bc
	ld c, a
	ldh a, [hWeatherFadeProgress]
	ld e, a
	ld d, 0
	ld hl, 128
.bits
	srl c
	jr nc, .no_add
	add hl, de
.no_add
	sla e
	rl d
	ld a, c
	and a
	jr nz, .bits
	ld a, h
	pop bc
	pop de
	pop hl
	ret

SetWeatherFadePalette::
; Keep a reloaded palette fixed during a fade. hl points into wBGPals1/wOBPals1.
	push af
	push hl
	push de
	push bc
	ld a, [wWeatherFlags]
	bit WEATHER_FADE_ACTIVE_F, a
	jr z, .done
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	push hl
	ld bc, wBGPals2 - wBGPals1
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, 1 palettes
	call CopyBytes ; displayed
	pop hl
	push hl
	ld bc, wWeatherFadeStartPalettes - wBGPals1
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, 1 palettes
	call CopyBytes ; fade start
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
.done
	pop bc
	pop de
	pop hl
	pop af
	ret
