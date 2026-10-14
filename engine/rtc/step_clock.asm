assert STEP_CLOCK_SECONDS_PER_STEP > 0 && STEP_CLOCK_SECONDS_PER_STEP <= 60

LoadStepClock::
; Copy the saved software clock to the standard clock outputs.
; Clobbers af, hl; GetTimeOfDay also refreshes wTimeOfDay.
	ld hl, wStartDay
	ld a, [hli]
	ld [wCurDay], a
	ld a, [hli]
	ldh [hHours], a
	ld a, [hli]
	ldh [hMinutes], a
	ld a, [hl]
	ldh [hSeconds], a
	farcall GetTimeOfDay
	ret

AdvanceStepClock::
; Advance the saved software clock once per completed player movement.
; Clobbers af, hl. bc and de remain available to CountStep's caller.
	ld a, [wOptions2]
	bit STEP_CLOCK_F, a
	ret z

	ld hl, wStartSecond
	ld a, [hl]
	add STEP_CLOCK_SECONDS_PER_STEP
	cp 60
	jr c, .store_seconds
	sub 60
	ld [hld], a

	inc [hl] ; minutes
	ld a, [hl]
	cp 60
	ret c
	xor a
	ld [hld], a

	inc [hl] ; hours
	ld a, [hl]
	cp 24
	ret c
	xor a
	ld [hld], a

	inc [hl] ; days
	ld a, [hl]
	cp 140
	ret c
	xor a
	ld [hl], a
	ret

.store_seconds
	ld [hl], a
	ret

EnableStepClock::
; Snapshot RTC-derived time before changing the meaning of wStartDay-wStartSecond.
; Clobbers af, bc, de, hl through UpdateTime.
	ld a, [wOptions2]
	bit STEP_CLOCK_F, a
	ret nz
	call UpdateTime
	ld hl, wStartDay
	ld a, [wCurDay]
	; RTC offsets can make wCurDay reach 140-145 before the hardware wraps.
	; Store the equivalent absolute day in the software clock's 0-139 range.
	cp 140
	jr c, .day_normalized
	sub 140
.day_normalized
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	ldh a, [hMinutes]
	ld [hli], a
	ldh a, [hSeconds]
	ld [hl], a
	ld hl, wOptions2
	set STEP_CLOCK_F, [hl]
	ret

EnableRTCClock::
; Preserve the visible software time while InitTime converts it to RTC offsets.
; Clobbers af, bc, de, hl.
	ld a, [wOptions2]
	bit STEP_CLOCK_F, a
	ret z
	ld hl, wStartDay
	ld de, wStringBuffer2
	ld bc, 4
	call CopyBytes
	ld hl, wOptions2
	res STEP_CLOCK_F, [hl]
	call InitTime

	; _InitTime treats a negative day difference as a weekday and reduces it
	; modulo 7. Replace that byte with the absolute modulo-140 day offset used
	; by the live clock. The final comparison leaves carry set exactly when the
	; target time of day precedes the hardware time of day.
	ldh a, [hRTCHours]
	ld b, a
	ld a, [wStringBuffer2 + 1]
	cp b
	jr nz, .time_compared
	ldh a, [hRTCMinutes]
	ld b, a
	ld a, [wStringBuffer2 + 2]
	cp b
	jr nz, .time_compared
	ldh a, [hRTCSeconds]
	ld b, a
	ld a, [wStringBuffer2 + 3]
	cp b
.time_compared
	ldh a, [hRTCDayLo] ; loads preserve the time comparison's carry
	ld b, a
	ld a, [wStringBuffer2]
	sbc b
	jr nc, .store_day_offset
	add 140
.store_day_offset
	ld [wStartDay], a
	ret
