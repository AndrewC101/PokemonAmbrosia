; Only linked in `make follower_test`. A screen fixture, not party/follow logic.
FollowerTestInput::
    ldh a, [hJoyDown]
    and PAD_SELECT
    jr nz, .held
    ld hl, wFollowerFlags
    res FOLLOWER_TEST_CHORD_F, [hl]
    ret
.held
    ldh a, [hJoyPressed]
    ld b, a
    xor a
    ldh [hJoyDown], a
    ldh [hJoyPressed], a
    ldh [hJoyReleased], a
    ; Consuming hJoyDown makes GetJoypad report held buttons as new presses.
    ; Latch one command until Select is released, independent of that mirror.
    ld a, b
    and PAD_START | PAD_A | PAD_B | PAD_LEFT | PAD_UP | PAD_DOWN
    ret z
    ld hl, wFollowerFlags
    bit FOLLOWER_TEST_CHORD_F, [hl]
    ret nz
    set FOLLOWER_TEST_CHORD_F, [hl]
    bit B_PAD_START, b
    jp nz, .toggle
    bit B_PAD_A, b
    jp nz, .species
    bit B_PAD_B, b
    jp nz, .palette
    bit B_PAD_LEFT, b
    jp nz, .weather
    bit B_PAD_UP, b
    jp nz, .emote
    bit B_PAD_DOWN, b
    jp nz, .dust
    ret
.toggle
    ld a, [wFollowerFlags]
    xor 1 << FOLLOWER_ENABLED_F
    ld [wFollowerFlags], a
    bit FOLLOWER_ENABLED_F, a
    jp z, InvalidateFollowerCache
    jr .prepare
.species
    ld a, [wFollowerTestIndex]
    inc a
    cp 7
    jr c, .save_index
    xor a
.save_index
    ld [wFollowerTestIndex], a
    jr .prepare
.palette
    ld a, [wFollowerTestPaletteMode]
    inc a
    cp 3
    jr c, .save_mode
    xor a
.save_mode
    ld [wFollowerTestPaletteMode], a
    jr .colors
.prepare
    ld hl, wFollowerFlags
    set FOLLOWER_ENABLED_F, [hl]
    ld a, [wFollowerTestIndex]
    ld e, a
    ld d, 0
    ld hl, .species_list
    add hl, de
    ld a, [hl]
    call PrepareFollowerGraphics
.colors
    ld a, $ff
    ld [wFollowerDVs], a
    ld [wFollowerDVs + 1], a
    xor a
    ld [wFollowerCustomPair], a
    ld a, [wFollowerTestPaletteMode]
    cp 1
    jr nz, .custom
    ; Ambrosia's shiny rule is attack bit 1, defense 12/13 and speed 15.
    ld a, $fd
    ld [wFollowerDVs], a
.custom
    cp 2
    jr nz, .apply
    ld a, $35
    ld [wFollowerCustomPair], a
.apply
    ld a, [wFollowerSpecies]
    and a
    ret z
    call PrepareFollowerColors
    ; Reapply map darkness/weather, then publish both palette buffers to hardware.
    farcall LoadMapPals
    jr .refresh_pals
.refresh_pals
    newfarcall ApplyPals
    ld a, TRUE
    ldh [hCGBPalUpdate], a
    ret
.weather
    ld a, [wFieldWeather]
    cp WEATHER_RAIN
    jr z, .clear_weather
    newfarjp SetRainFieldWeatherAndLock
.clear_weather
    newfarcall ClearFieldWeatherAndLock
    newfarcall ClearWeather
    farcall LoadMapPals
    jr .refresh_pals
.emote
    xor a
    ldh [hMapObjectIndex], a
    newfarcall DespawnEmote
    ld c, EMOTE_SHOCK
    newfarcall LoadEmote
    ld bc, wPlayerStruct
    newfarjp SpawnEmote
.dust
    ld c, EMOTE_BOULDER_DUST
    newfarcall LoadEmote
    xor a
    ldh [hMapObjectIndex], a
    ld bc, wPlayerStruct
    newfarjp SpawnStrengthBoulderDust
.species_list
    db BULBASAUR, CHARIZARD, PIKACHU, LAPRAS, GENGAR, TYRANITAR, HONEDGE

FollowerTestTick::
    ld a, [wPlayerState]
    and a
    jr z, .foot
    cp PLAYER_RUN
    ret nz
.foot
    ld hl, wFollowerFlags
    set FOLLOWER_TEST_FRAME_F, [hl]
    ret

FollowerTestDraw::
    ld hl, wFollowerFlags
    bit FOLLOWER_TEST_FRAME_F, [hl]
    ret z
    res FOLLOWER_TEST_FRAME_F, [hl]
    ld bc, wPlayerStruct
    call FollowerObjectPixels
    ; Fixed screen-space offset makes the graphics proof independent of pathfinding.
    ld a, [wFollowerRenderX]
    add 24
    ld [wFollowerRenderX], a
    ld a, [wFollowerRenderY]
    add 16
    ld [wFollowerRenderY], a
    ; The player struct's facing includes stepping; use it rather than direction only.
    ld a, [wPlayerFacing]
    jp RenderFollowerAtPixels
