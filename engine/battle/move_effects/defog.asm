BattleCommand_Defog:
; clear weather
	ld a, WEATHER_NONE
	ld [wBattleWeather], a
	ld [wFieldWeather], a

; clear all screens
    ld a, 1
    ld hl, wPlayerSafeguardCount
    ld [hli], a
    ld [hli], a
    ld [hl], a
    ld hl, wEnemySafeguardCount
    ld [hli], a
    ld [hli], a
    ld [hl], a

; clear all hazards
    ld hl, wPlayerScreens
    res SCREENS_SPIKES, [hl]
	res SCREENS_STEALTH_ROCK, [hl]
	res SCREENS_TOXIC_SPIKES, [hl]
	res SCREENS_STICKY_WEB, [hl]
    ld hl, wEnemyScreens
    res SCREENS_SPIKES, [hl]
	res SCREENS_STEALTH_ROCK, [hl]
	res SCREENS_TOXIC_SPIKES, [hl]
	res SCREENS_STICKY_WEB, [hl]

; print message
	ld hl, ClearFieldText
	jp StdBattleTextbox
