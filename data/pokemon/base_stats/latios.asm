	db LATIOS ; 223

	db  80,  90,  80,  110,  130,  110
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, PSYCHIC_TYPE ; type
    db 3 ; catch rate
	db 255 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/latios/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SANDSTORM, SWIFT, REST, FLY, ROOST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, CALM_MIND, FLASH, PSYCHIC_M, DARK_PULSE, SHADOW_BALL
	; end
