	db KYOGRE ; 225

	db  100,  100,  90,  90,  150,  140
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
    db 3 ; catch rate
	db 255 ; base exp
	db NO_ITEM, MYSTIC_WATER ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/kyogre/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, CALM_MIND, FISSURE, EARTHQUAKE, EARTH_POWER, TAUNT
	; end
