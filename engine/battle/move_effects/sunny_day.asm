BattleCommand_StartSun:
; startsun
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .failed

	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, FIELD_EFFECT_DURATION
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
