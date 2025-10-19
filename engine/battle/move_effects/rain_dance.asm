BattleCommand_StartRain:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .failed

	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, FIELD_EFFECT_DURATION
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
