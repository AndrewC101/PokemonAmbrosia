BattleCommand_StartSandstorm:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, FIELD_EFFECT_DURATION
	ld [wWeatherCount], a
	farcall _CGB_BattleColors
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
